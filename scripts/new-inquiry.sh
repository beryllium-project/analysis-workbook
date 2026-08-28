#!/usr/bin/env bash

set -u

usage() {
    printf 'Usage: %s <session-directory> <short-name> <title>\n' "${0##*/}" >&2
}

die() {
    printf 'new-inquiry: ERROR: %s\n' "$*" >&2
    exit 1
}

if (($# != 3)); then
    usage
    exit 2
fi

session_argument=$1
short_name=$2
title=$3

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

[[ -d $templates_dir ]] || die "template directory is missing: $templates_dir"

session_dir=$(CDPATH= cd -- "$session_argument" 2>/dev/null && pwd -P) ||
    die "session directory does not exist: $session_argument"

case $session_dir in
"$sessions_dir"/*) ;;
*) die "session directory must be inside sessions/: $session_argument" ;;
esac

session_dir_name=${session_dir##*/}
if [[ ! $session_dir_name =~ ^(AWB-[0-9]{8}-[0-9]{3})-[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    die "session directory name is not a valid AWB package: $session_dir_name"
fi
session_id=${BASH_REMATCH[1]}

[[ -f $session_dir/session.md ]] ||
    die "session package is missing session.md: $session_dir_name"

inquiries_dir=$session_dir/inquiries
mkdir -p -- "$inquiries_dir" || die "cannot create inquiries directory"

lock_dir=$inquiries_dir/.new-inquiry.lock
lock_owner=$lock_dir/owner
lock_acquired_epoch=$(date -u +%s)
lock_token=$$-${RANDOM:-0}-$lock_acquired_epoch
stale_lock_seconds=120
lock_held=0
inquiry_dir=
cleanup_inquiry=0

cleanup() {
    if ((cleanup_inquiry)) && [[ -n $inquiry_dir ]]; then
        rm -rf -- "$inquiry_dir"
    fi
    if ((lock_held)) && [[ -f $lock_owner ]] &&
        [[ $(sed -n '1p' "$lock_owner") == "$lock_token" ]]; then
        rm -f -- "$lock_owner"
        rmdir -- "$lock_dir" 2>/dev/null || true
    fi
}

trap cleanup EXIT
trap 'exit 1' HUP INT TERM

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
            stale_lock=$inquiries_dir/.new-inquiry.lock.stale.$lock_token
            if mv -- "$lock_dir" "$stale_lock" 2>/dev/null; then
                rm -rf -- "$stale_lock"
                continue
            fi
        fi

        sleep 0.05
    done

    die "timed out waiting for the inquiry-ID allocation lock"
}

created_date=$(date -u +%Y-%m-%d) ||
    die "cannot determine UTC creation date"

acquire_lock

inquiry_id=
for ((index = 1; index <= 999; index++)); do
    printf -v sequence '%03d' "$index"
    candidate_id=Q-$sequence
    candidate=$inquiries_dir/$candidate_id
    if [[ -e $candidate ]]; then
        continue
    fi
    if mkdir -- "$candidate" 2>/dev/null; then
        inquiry_id=$candidate_id
        inquiry_dir=$candidate
        cleanup_inquiry=1
        break
    fi
    [[ -e $candidate ]] ||
        die "cannot create inquiry directory: $candidate"
done

[[ -n $inquiry_dir ]] ||
    die "no inquiry ID is available in $session_dir_name (001-999 exhausted)"

required_templates=(
    question.md
    report.md
    summary.md
    evidence.md
    search-log.md
    open-questions.md
)

escape_sed_replacement() {
    printf '%s' "$1" | sed 's/[\\&|]/\\&/g'
}

escaped_session_id=$(escape_sed_replacement "$session_id")
escaped_session_dir=$(escape_sed_replacement "$session_dir_name")
escaped_inquiry_id=$(escape_sed_replacement "$inquiry_id")
escaped_short_name=$(escape_sed_replacement "$short_name")
escaped_title=$(escape_sed_replacement "$title")
escaped_created_date=$(escape_sed_replacement "$created_date")

for template_name in "${required_templates[@]}"; do
    source_file=$templates_dir/$template_name
    destination_file=$inquiry_dir/$template_name
    [[ -f $source_file ]] ||
        die "required template is missing: templates/$template_name"
    [[ ! -e $destination_file ]] ||
        die "refusing to overwrite: $destination_file"

    sed \
        -e "s|@@SESSION_ID@@|$escaped_session_id|g" \
        -e "s|@@SESSION_DIR@@|$escaped_session_dir|g" \
        -e "s|@@INQUIRY_ID@@|$escaped_inquiry_id|g" \
        -e "s|@@INQUIRY_SHORT_NAME@@|$escaped_short_name|g" \
        -e "s|@@INQUIRY_TITLE@@|$escaped_title|g" \
        -e "s|@@CREATED_DATE@@|$escaped_created_date|g" \
        -- "$source_file" >"$destination_file" ||
        die "failed to instantiate template: templates/$template_name"
done

if grep -ERq '@@[A-Z][A-Z0-9_]*@@' -- "$inquiry_dir"; then
    die "generated inquiry contains an unsubstituted template token"
fi

index_row="| $inquiry_id | $title | Draft | inquiries/$inquiry_id/report.md | inquiries/$inquiry_id/summary.md |"
session_file=$session_dir/session.md
placeholder_row='| None | No question has been opened. | Not started | Not created | Not created |'
session_tmp=$session_file.new-inquiry.$lock_token

grep -Fq '## Inquiry index' -- "$session_file" ||
    die "session.md has no '## Inquiry index' section"

awk -v placeholder="$placeholder_row" -v row="$index_row" '
    { line[NR] = $0 }
    END {
        in_index = 0
        last_row = 0
        replace = 0
        for (i = 1; i <= NR; i++) {
            if (line[i] ~ /^## Inquiry index$/) { in_index = 1; continue }
            if (in_index && line[i] ~ /^## /) { in_index = 0; continue }
            if (!in_index) { continue }
            if (line[i] == placeholder) { replace = i }
            if (line[i] ~ /^\|/) { last_row = i }
        }
        if (replace == 0 && last_row == 0) { exit 3 }
        for (i = 1; i <= NR; i++) {
            if (i == replace) { print row; continue }
            print line[i]
            if (replace == 0 && i == last_row) { print row }
        }
    }
' "$session_file" >"$session_tmp"
awk_status=$?

if ((awk_status != 0)); then
    rm -f -- "$session_tmp"
    die "cannot update the session inquiry index in session.md"
fi

if ! grep -Fqx -- "$index_row" "$session_tmp"; then
    rm -f -- "$session_tmp"
    die "session inquiry index was not updated for $inquiry_id"
fi

mv -- "$session_tmp" "$session_file" ||
    die "cannot replace session.md"

cleanup_inquiry=0
printf 'sessions/%s/inquiries/%s\n' "$session_dir_name" "$inquiry_id"
