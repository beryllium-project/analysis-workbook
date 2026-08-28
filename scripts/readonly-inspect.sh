#!/usr/bin/env bash

set -u

usage() {
    cat >&2 <<'EOF'
Usage:
  readonly-inspect.sh components
  readonly-inspect.sh identity  <component-path>
  readonly-inspect.sh state     <component-path>
  readonly-inspect.sh resolve   <component-path> <revision>
  readonly-inspect.sh log       <component-path> <revision> [max-count] [relative-path]
  readonly-inspect.sh show      <component-path> <revision> <relative-path>
  readonly-inspect.sh ls-tree   <component-path> <revision> [relative-path]
  readonly-inspect.sh hash-file <component-path> <relative-path>

Every mode is read-only. The wrapper never writes to a component, never
fetches, and never prompts for credentials.
EOF
}

die() {
    printf 'readonly-inspect: ERROR: %s\n' "$*" >&2
    exit 1
}

validate_revision() {
    local revision=$1
    [[ -n $revision && $revision != -* &&
        $revision =~ ^[A-Za-z0-9._/@{}^~:+-]+$ ]] ||
        die "invalid revision argument: $revision"
}

validate_path() {
    local path=$1
    [[ -n $path && $path != /* && $path != -* && $path != *\\* &&
        $path != .git && $path != .git/* &&
        $path != .. && $path != ../* && $path != */../* &&
        $path != */.. && $path =~ ^[[:print:]]+$ ]] ||
        die "path must be component-relative without traversal: $path"
}

validate_count() {
    local count=$1
    [[ $count =~ ^[1-9][0-9]{0,3}$ ]] ||
        die "max-count must be an integer between 1 and 9999: $count"
}

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P) ||
    die "cannot resolve script directory"
repository_root=$(CDPATH= cd -- "$script_dir/.." && pwd -P) ||
    die "cannot resolve repository root"
workspace_root=$(CDPATH= cd -- "$repository_root/.." && pwd -P) ||
    die "cannot resolve parent workspace root"

clean_environment=(
    env -i
    "PATH=$PATH"
    "HOME=/nonexistent"
    "XDG_CONFIG_HOME=/nonexistent"
    "LC_ALL=C"
    "GIT_TERMINAL_PROMPT=0"
    "GIT_ASKPASS=/bin/false"
    "SSH_ASKPASS=/bin/false"
    "GIT_CONFIG_NOSYSTEM=1"
    "GIT_OPTIONAL_LOCKS=0"
    "GIT_PAGER=cat"
    "PAGER=cat"
)

safe_git_options=(
    git
    -c core.hooksPath=/dev/null
    -c core.fsmonitor=false
    -c core.attributesFile=/dev/null
    -c core.autocrlf=false
    -c core.safecrlf=false
    -c credential.helper=
    -c protocol.allow=never
    -c diff.external=
    -c diff.trustExitCode=false
    -c pager.status=false
    -c pager.log=false
    -c pager.show=false
    -c pager.diff=false
)

registered_components=(
    provenance-review
    beryllium-repo
    helium-te-poc
    formal-verification-research
    cheri-riscv-notes-repo
    xrv-research-repo
    osr-claude
)

component_git=()

open_component() {
    local component=$1
    local resolved

    [[ -n $component && $component != -* ]] ||
        die "invalid component path: $component"
    [[ -e $component ]] || die "component path does not exist: $component"
    resolved=$(CDPATH= cd -- "$component" 2>/dev/null && pwd -P) ||
        die "cannot canonicalize component path: $component"

    case $resolved in
    "$repository_root" | "$repository_root"/*)
        die "readonly-inspect targets sibling components, not this repository"
        ;;
    esac

    component_git=(
        "${clean_environment[@]}"
        "${safe_git_options[@]}"
        -C "$resolved"
    )

    "${component_git[@]}" rev-parse --is-inside-work-tree >/dev/null 2>&1 ||
        die "not a Git work tree: $component"

    component_root=$("${component_git[@]}" rev-parse --show-toplevel) ||
        die "cannot resolve component Git root: $component"
    component_root=$(CDPATH= cd -- "$component_root" && pwd -P) ||
        die "cannot canonicalize component Git root: $component"

    [[ $component_root =~ ^[[:print:]]+$ && ! $component_root =~ [[:cntrl:]] ]] ||
        die "component paths containing control characters are unsupported"

    object_format=$("${component_git[@]}" rev-parse --show-object-format) ||
        die "cannot determine Git object format: $component"
    case $object_format in
    sha1 | sha256) ;;
    *) die "unsupported Git object format: $object_format" ;;
    esac
}

logical_locator() {
    local absolute=$1
    case $absolute in
    "$workspace_root"/*) printf 'component://%s' "${absolute#"$workspace_root"/}" ;;
    "$workspace_root") printf 'workspace://' ;;
    *) printf 'external://%s' "${absolute##*/}" ;;
    esac
}

(($# >= 1)) || {
    usage
    exit 2
}

mode=$1
shift

case $mode in
components)
    (($# == 0)) || {
        usage
        exit 2
    }
    printf '# component inventory\n'
    printf '# workspace: %s\n' "$(logical_locator "$workspace_root")"
    printf '# checked: %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    for name in "${registered_components[@]}"; do
        path=$workspace_root/$name
        if [[ ! -e $path ]]; then
            printf '%s\tabsent\t-\t-\n' "$name"
            continue
        fi
        if ! resolved=$(CDPATH= cd -- "$path" 2>/dev/null && pwd -P); then
            printf '%s\tunresolvable\t-\t-\n' "$name"
            continue
        fi
        probe=(
            "${clean_environment[@]}"
            "${safe_git_options[@]}"
            -C "$resolved"
        )
        if ! "${probe[@]}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
            printf '%s\tnot-a-git-worktree\t-\t-\n' "$name"
            continue
        fi
        head_sha=$("${probe[@]}" rev-parse HEAD 2>/dev/null) || head_sha=unknown
        branch=$("${probe[@]}" rev-parse --abbrev-ref HEAD 2>/dev/null) ||
            branch=unknown
        if [[ -n $("${probe[@]}" status --porcelain 2>/dev/null) ]]; then
            state=dirty
        else
            state=clean
        fi
        printf '%s\t%s\t%s\t%s\n' "$name" "$state" "$branch" "$head_sha"
    done
    ;;

identity)
    (($# == 1)) || {
        usage
        exit 2
    }
    open_component "$1"
    printf 'logical-locator\t%s\n' "$(logical_locator "$component_root")"
    printf 'object-format\t%s\n' "$object_format"
    printf 'checked\t%s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    "${component_git[@]}" remote -v 2>/dev/null |
        sed 's/^/remote\t/' || true
    ;;

state)
    (($# == 1)) || {
        usage
        exit 2
    }
    open_component "$1"
    head_sha=$("${component_git[@]}" rev-parse HEAD 2>/dev/null) ||
        head_sha=unborn
    branch=$("${component_git[@]}" rev-parse --abbrev-ref HEAD 2>/dev/null) ||
        branch=unknown
    porcelain=$("${component_git[@]}" status --porcelain 2>/dev/null) || porcelain=
    if [[ -n $porcelain ]]; then
        worktree=dirty
        changed=$(printf '%s\n' "$porcelain" | grep -c .)
    else
        worktree=clean
        changed=0
    fi
    printf 'logical-locator\t%s\n' "$(logical_locator "$component_root")"
    printf 'head\t%s\n' "$head_sha"
    printf 'branch\t%s\n' "$branch"
    printf 'worktree\t%s\n' "$worktree"
    printf 'changed-entries\t%s\n' "$changed"
    printf 'checked\t%s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    if [[ -n $porcelain ]]; then
        printf '%s\n' "$porcelain" | sed 's/^/status\t/'
    fi
    ;;

resolve)
    (($# == 2)) || {
        usage
        exit 2
    }
    open_component "$1"
    validate_revision "$2"
    resolved_sha=$("${component_git[@]}" rev-parse --verify "$2^{commit}" 2>/dev/null) ||
        die "cannot resolve revision to a commit: $2"
    printf 'logical-locator\t%s\n' "$(logical_locator "$component_root")"
    printf 'revision\t%s\n' "$2"
    printf 'commit\t%s\n' "$resolved_sha"
    "${component_git[@]}" log -1 --no-color \
        --date=iso-strict-local --pretty=format:'date%x09%ad%nsubject%x09%s' \
        "$resolved_sha" 2>/dev/null || true
    printf '\n'
    ;;

log)
    (($# >= 2 && $# <= 4)) || {
        usage
        exit 2
    }
    open_component "$1"
    validate_revision "$2"
    max_count=${3:-40}
    validate_count "$max_count"
    if (($# == 4)); then
        validate_path "$4"
        "${component_git[@]}" log --no-color --max-count="$max_count" \
            --date=short --pretty=format:'%h%x09%ad%x09%s' \
            "$2" -- "$4" 2>/dev/null ||
            die "cannot read history for $4 at $2"
    else
        "${component_git[@]}" log --no-color --max-count="$max_count" \
            --date=short --pretty=format:'%h%x09%ad%x09%s' \
            "$2" 2>/dev/null ||
            die "cannot read history at $2"
    fi
    printf '\n'
    ;;

show)
    (($# == 3)) || {
        usage
        exit 2
    }
    open_component "$1"
    validate_revision "$2"
    validate_path "$3"
    "${component_git[@]}" show --no-color "$2:$3" 2>/dev/null ||
        die "cannot read $3 at $2"
    ;;

ls-tree)
    (($# == 2 || $# == 3)) || {
        usage
        exit 2
    }
    open_component "$1"
    validate_revision "$2"
    if (($# == 3)); then
        validate_path "$3"
        "${component_git[@]}" ls-tree -r --name-only "$2" -- "$3" 2>/dev/null ||
            die "cannot list $3 at $2"
    else
        "${component_git[@]}" ls-tree -r --name-only "$2" 2>/dev/null ||
            die "cannot list tree at $2"
    fi
    ;;

hash-file)
    (($# == 2) || ($# == 2)) || {
        usage
        exit 2
    }
    open_component "$1"
    validate_path "$2"
    target_file=$component_root/$2
    [[ -f $target_file ]] || die "not a regular file: $2"
    command -v sha256sum >/dev/null 2>&1 ||
        die "sha256sum is unavailable; record a hard evidence limitation"
    digest=$(sha256sum -- "$target_file") ||
        die "cannot hash file: $2"
    printf 'logical-locator\t%s/%s\n' "$(logical_locator "$component_root")" "$2"
    printf 'sha256\t%s\n' "${digest%% *}"
    printf 'checked\t%s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    ;;

*)
    usage
    exit 2
    ;;
esac
