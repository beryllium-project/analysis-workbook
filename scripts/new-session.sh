#!/usr/bin/env bash

set -u

usage() {
    printf 'Usage: %s <short-name> <title> [private]\n' "${0##*/}" >&2
}

die() {
    printf 'new-session: ERROR: %s\n' "$*" >&2
    exit 1
}

if (($# != 2 && $# != 3)); then
    usage
    exit 2
fi

short_name=$1
title=$2
initial_distribution=${3:-private}

[[ $initial_distribution == private ]] ||
    die "initial distribution must be private"

if [[ ! $short_name =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] ||
    ((${#short_name} > 48)); then
    die "short-name must be a lowercase hyphenated slug of at most 48 characters"
fi

if [[ -z $title ]] || ((${#title} > 120)) ||
    [[ $title == *'@@'* ]] ||
    [[ ! $title =~ ^[[:print:]]+$ ]]; then
    die "title must be 1-120 printable characters and must not contain '@@'"
fi

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P) ||
    die "cannot resolve script directory"
repository_root=$(CDPATH= cd -- "$script_dir/.." && pwd -P) ||
    die "cannot resolve repository root"
templates_dir=$repository_root/templates
sessions_dir=$repository_root/sessions
lock_dir=$sessions_dir/.new-session.lock
lock_owner=$lock_dir/owner
lock_acquired_epoch=$(date -u +%s)
lock_token=$$-${RANDOM:-0}-$lock_acquired_epoch
stale_lock_seconds=120
lock_held=0
session_dir=
cleanup_session=0

cleanup() {
    if ((cleanup_session)) && [[ -n $session_dir ]]; then
        rm -rf -- "$session_dir"
    fi
    if ((lock_held)) && [[ -f $lock_owner ]] &&
        [[ $(sed -n '1p' "$lock_owner") == "$lock_token" ]]; then
        rm -f -- "$lock_owner"
        rmdir -- "$lock_dir" 2>/dev/null || true
    fi
}

trap cleanup EXIT
trap 'exit 1' HUP INT TERM

[[ -d $templates_dir ]] || die "template directory is missing: $templates_dir"
mkdir -p -- "$sessions_dir" || die "cannot create sessions directory"

acquire_lock() {
    local attempt owner_pid owner_epoch current_epoch lock_age stale_lock

    for ((attempt = 1; attempt <= 400; attempt++)); do
        if mkdir -- "$lock_dir" 2>/dev/null; then
            lock_acquired_epoch=$(date -u +%s)
            printf '%s\n%s\n%s\n' \
                "$lock_token" "$$" "$lock_acquired_epoch" >"$lock_owner" ||
                die "cannot record allocation lock ownership"
            lock_held=1
            return
        fi

        owner_epoch=
        if [[ ! -f $lock_owner ]]; then
            if ((attempt <= 100)); then
                sleep 0.05
                continue
            fi
            owner_pid=
        else
            owner_pid=$(sed -n '2p' "$lock_owner")
            owner_epoch=$(sed -n '3p' "$lock_owner")
        fi
        current_epoch=$(date -u +%s)
        lock_age=0
        if [[ $owner_epoch =~ ^[0-9]+$ ]] &&
            ((current_epoch >= owner_epoch)); then
            lock_age=$((current_epoch - owner_epoch))
        fi
        if [[ ! $owner_pid =~ ^[1-9][0-9]*$ ]] ||
            ! kill -0 "$owner_pid" 2>/dev/null ||
            ((lock_age > stale_lock_seconds)); then
            stale_lock=$sessions_dir/.new-session.lock.stale.$lock_token
            if mv -- "$lock_dir" "$stale_lock" 2>/dev/null; then
                rm -rf -- "$stale_lock"
                continue
            fi
        fi

        sleep 0.05
    done

    die "timed out waiting for the session-ID allocation lock"
}

created_date=$(date -u +%Y-%m-%d) ||
    die "cannot determine UTC creation date"
id_date=${created_date//-/}

acquire_lock

shopt -s nullglob
session_id=
for ((index = 1; index <= 999; index++)); do
    printf -v sequence '%03d' "$index"
    candidate_id=AWB-$id_date-$sequence
    existing=("$sessions_dir/$candidate_id-"*)
    if ((${#existing[@]} > 0)); then
        continue
    fi

    candidate=$sessions_dir/$candidate_id-$short_name
    if mkdir -- "$candidate" 2>/dev/null; then
        session_id=$candidate_id
        session_dir=$candidate
        cleanup_session=1
        break
    fi
    [[ -e $candidate ]] ||
        die "cannot create session directory: $candidate"
done
shopt -u nullglob

[[ -n $session_dir ]] ||
    die "no session ID is available for $created_date (001-999 exhausted)"

session_dir_name=${session_dir##*/}

mkdir -- "$session_dir/inquiries" ||
    die "cannot create inquiries directory"

required_templates=(
    session.md
    planning.md
    source-discoveries.md
    inaccessible-resources.md
    publication-checklist.md
    HANDOFF.md
)

escape_sed_replacement() {
    printf '%s' "$1" | sed 's/[\\&|]/\\&/g'
}

escaped_session_id=$(escape_sed_replacement "$session_id")
escaped_session_dir=$(escape_sed_replacement "$session_dir_name")
escaped_short_name=$(escape_sed_replacement "$short_name")
escaped_title=$(escape_sed_replacement "$title")
escaped_created_date=$(escape_sed_replacement "$created_date")

for template_name in "${required_templates[@]}"; do
    source_file=$templates_dir/$template_name
    destination_file=$session_dir/$template_name
    [[ -f $source_file ]] ||
        die "required template is missing: templates/$template_name"
    [[ ! -e $destination_file ]] ||
        die "refusing to overwrite: $destination_file"

    sed \
        -e "s|@@SESSION_ID@@|$escaped_session_id|g" \
        -e "s|@@SESSION_DIR@@|$escaped_session_dir|g" \
        -e "s|@@SHORT_NAME@@|$escaped_short_name|g" \
        -e "s|@@TITLE@@|$escaped_title|g" \
        -e "s|@@CREATED_DATE@@|$escaped_created_date|g" \
        -- "$source_file" >"$destination_file" ||
        die "failed to instantiate template: templates/$template_name"
done

if grep -ERq '@@[A-Z][A-Z0-9_]*@@' -- "$session_dir"; then
    die "generated session contains an unsubstituted template token"
fi

cleanup_session=0
printf 'sessions/%s\n' "$session_dir_name"
