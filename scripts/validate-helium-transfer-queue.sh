#!/usr/bin/env bash

set -euo pipefail

repository_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P) || {
    printf 'validate-helium-transfer-queue: ERROR: cannot resolve repository root\n' >&2
    exit 2
}

baseline=
queue=$repository_root/outbox/helium-transfer-queue.md

usage() {
    printf 'usage: %s [--baseline PRIOR] [QUEUE]\n' "$0" >&2
    exit 2
}

while (($#)); do
    case $1 in
        --baseline)
            (($# >= 2)) || usage
            baseline=$2
            shift 2
            ;;
        --*)
            usage
            ;;
        *)
            [[ $queue == "$repository_root/outbox/helium-transfer-queue.md" ]] ||
                usage
            queue=$1
            shift
            ;;
    esac
done

fail() {
    printf 'validate-helium-transfer-queue: ERROR: %s\n' "$*" >&2
    exit 1
}

[[ -f $queue && ! -L $queue ]] ||
    fail "queue is not a regular file: $queue"
if [[ -n $baseline ]]; then
    [[ -f $baseline && ! -L $baseline ]] ||
        fail "baseline is not a regular file: $baseline"
fi

if grep -En \
    '(^|[[:space:]`(])/(home|Users|root|tmp|var|etc|opt|srv|mnt|media|run)(/|[[:space:]`])|file://|[A-Za-z]:\\' \
    "$queue" >/dev/null; then
    fail 'queue contains a non-portable absolute locator'
fi

temporary=$(mktemp -d "${TMPDIR:-/tmp}/helium-transfer-queue.XXXXXX") ||
    exit 2
trap 'rm -rf -- "$temporary"' EXIT

parse_queue() {
    local input=$1 output=$2

    awk '
        function trim(value) {
            sub(/^[[:space:]]+/, "", value)
            sub(/[[:space:]]+$/, "", value)
            return value
        }
        function cells(line, result, count, cell_index, raw) {
            count = split(line, raw, "|")
            for (cell_index = 2; cell_index < count; ++cell_index)
                result[cell_index - 1] = trim(raw[cell_index])
            return count - 2
        }
        /^## Queue summary$/ {
            summary = 1
            item = ""
            mode = ""
            next
        }
        /^## HET-[0-9][0-9][0-9] - / {
            summary = 0
            item = $2
            title = $0
            sub("^## " item " - ", "", title)
            print "ITEM\t" item "\t" title
            mode = ""
            next
        }
        /^## / {
            summary = 0
            item = ""
            mode = ""
            next
        }
        item != "" && /^### / {
            section = $0
            sub(/^### /, "", section)
            print "SECTION\t" item "\t" section
            if (section == "Provenance")
                mode = "provenance"
            else if (section == "Status history")
                mode = "history"
            else
                mode = ""
            next
        }
        summary && /^\| HET-[0-9][0-9][0-9] / {
            delete row
            if (cells($0, row) != 7)
                next
            print "SUMMARY\t" row[1] "\t" row[2] "\t" row[3] "\t" \
                row[4] "\t" row[5] "\t" row[6] "\t" row[7]
            next
        }
        mode == "provenance" && /^\| / {
            delete row
            if (cells($0, row) != 2 || row[1] == "Field" ||
                row[1] ~ /^-+$/)
                next
            print "PROVENANCE\t" item "\t" row[1] "\t" row[2]
            next
        }
        mode == "history" && /^\| / {
            delete row
            count = cells($0, row)
            if (row[1] == "Date" || row[1] ~ /^-+$/)
                next
            if (count != 5) {
                print "MALFORMED_HISTORY\t" item "\twrong cell count"
                next
            }
            print "HISTORY\t" item "\t" row[1] "\t" row[2] "\t" \
                row[3] "\t" row[4] "\t" row[5]
            next
        }
        mode == "history" && $0 !~ /^[[:space:]]*$/ {
            print "MALFORMED_HISTORY\t" item "\tnon-table content"
        }
    ' "$input" >"$output"
}

parse_queue "$queue" "$temporary/current.records"

declare -a item_order=()
declare -a summary_order=()
declare -A item_title=()
declare -A summary_raised=()
declare -A summary_direction=()
declare -A summary_subject=()
declare -A summary_target=()
declare -A summary_status=()
declare -A summary_input=()
declare -A provenance=()
declare -A section_count=()
declare -A history_count=()
declare -A history_date=()
declare -A history_status=()
declare -A history_actor=()
declare -A history_owner=()
declare -A history_note=()

while IFS=$'\t' read -r kind first second third fourth fifth sixth seventh; do
    case $kind in
        ITEM)
            [[ -z ${item_title[$first]+x} ]] ||
                fail "duplicate item heading: $first"
            item_order+=("$first")
            item_title[$first]=$second
            ;;
        SUMMARY)
            [[ -z ${summary_subject[$first]+x} ]] ||
                fail "duplicate queue-summary row: $first"
            summary_order+=("$first")
            summary_raised[$first]=$second
            summary_direction[$first]=$third
            summary_subject[$first]=$fourth
            summary_target[$first]=$fifth
            summary_status[$first]=$sixth
            summary_input[$first]=$seventh
            ;;
        PROVENANCE)
            key=$first'|'$second
            [[ -z ${provenance[$key]+x} ]] ||
                fail "duplicate provenance field for $first: $second"
            provenance[$key]=$third
            ;;
        SECTION)
            key=$first'|'$second
            section_count[$key]=$(( ${section_count[$key]:-0} + 1 ))
            ;;
        HISTORY)
            index=$(( ${history_count[$first]:-0} + 1 ))
            history_count[$first]=$index
            key=$first'|'$index
            history_date[$key]=$second
            history_status[$key]=$third
            history_actor[$key]=$fourth
            history_owner[$key]=$fifth
            history_note[$key]=$sixth
            ;;
        MALFORMED_HISTORY)
            fail "$first has a malformed status-history row: $second"
            ;;
    esac
done <"$temporary/current.records"

((${#item_order[@]} > 0)) || fail 'queue contains no HET items'
((${#item_order[@]} == ${#summary_order[@]})) ||
    fail 'queue summary and item count differ'

required_sections=(
    'Provenance'
    'Endpoint direction'
    'Candidate reusable lessons'
    'Details that do not transfer'
    'Residual assumptions and limits'
    'Beryllium-side triage request'
    'Status history'
)
required_fields=(
    'Raised on'
    'Direction basis'
    'Source component'
    'Frozen reference'
    'Maintained source'
    'Target'
    'Initial queue status'
    'Initial input state'
    'Initial owner-side record'
)
component_locator_pattern='^`component://[A-Za-z0-9._/-]+`$'
target_locator_pattern='^`component://[A-Za-z0-9._/-]+`'
portable_record_pattern='`(component|workspace)://[A-Za-z0-9._/-]+`'
date_pattern='^[0-9]{4}-[0-9]{2}-[0-9]{2}$'

strip_ticks() {
    local value=$1
    value=${value#\`}
    value=${value%\`}
    printf '%s' "$value"
}

valid_status() {
    case $1 in
        new | routed | recorded | deferred | declined | superseded)
            return 0
            ;;
    esac
    return 1
}

valid_transition() {
    case $1:$2 in
        new:routed | new:recorded | new:deferred | new:declined | \
        new:superseded | routed:recorded | routed:deferred | \
        routed:declined | routed:superseded | deferred:routed | \
        deferred:recorded | deferred:declined | deferred:superseded | \
        recorded:superseded)
            return 0
            ;;
    esac
    return 1
}

for index in "${!item_order[@]}"; do
    printf -v expected 'HET-%03d' "$((index + 1))"
    id=${item_order[$index]}
    [[ $id == "$expected" ]] ||
        fail "item IDs are not sequential: expected $expected, found $id"
    [[ ${summary_order[$index]} == "$id" ]] ||
        fail "queue-summary order does not match item order at $id"

    for section in "${required_sections[@]}"; do
        [[ ${section_count["$id|$section"]:-0} -eq 1 ]] ||
            fail "$id must contain exactly one '$section' section"
    done
    for field in "${required_fields[@]}"; do
        [[ -n ${provenance["$id|$field"]:-} ]] ||
            fail "$id is missing provenance field: $field"
    done

    raised=${provenance["$id|Raised on"]}
    direction=${provenance["$id|Direction basis"]}
    source_component=${provenance["$id|Source component"]}
    frozen_reference=${provenance["$id|Frozen reference"]}
    maintained_source=${provenance["$id|Maintained source"]}
    target=${provenance["$id|Target"]}
    initial_status=$(strip_ticks "${provenance["$id|Initial queue status"]}")
    initial_input=$(strip_ticks "${provenance["$id|Initial input state"]}")
    initial_owner=${provenance["$id|Initial owner-side record"]}
    current_status=$(strip_ticks "${summary_status[$id]}")
    input_state=$(strip_ticks "${summary_input[$id]}")

    [[ $raised =~ $date_pattern ]] ||
        fail "$id has an invalid raised-on date: $raised"
    [[ ${summary_direction[$id]} =~ $date_pattern ]] ||
        fail "$id has an invalid direction date: ${summary_direction[$id]}"
    [[ $direction == *"${summary_direction[$id]}"* ]] ||
        fail "$id direction basis does not name its summary date"
    [[ ${summary_raised[$id]} == "$raised" ]] ||
        fail "$id summary raised-on date does not match provenance"
    [[ ${summary_subject[$id]} == "${item_title[$id]}" ]] ||
        fail "$id summary subject does not match its heading"
    [[ ${summary_target[$id]} == "$target" ]] ||
        fail "$id summary target does not match provenance"
    [[ $source_component =~ $component_locator_pattern ]] ||
        fail "$id source component is not a portable component locator"
    [[ $maintained_source =~ $component_locator_pattern ]] ||
        fail "$id maintained source is not a portable component locator"
    [[ $target =~ $target_locator_pattern ]] ||
        fail "$id target does not begin with a portable component locator"
    [[ $frozen_reference =~ [0-9a-f]{40} ]] ||
        fail "$id frozen reference does not contain an exact commit"
    [[ $initial_status == new ]] ||
        fail "$id initial queue status must be new"
    [[ $initial_input == unaccepted && $input_state == unaccepted ]] ||
        fail "$id input state must remain unaccepted"
    [[ $initial_owner == Not\ applicable* ]] ||
        fail "$id initial owner-side record must be Not applicable"
    valid_status "$current_status" ||
        fail "$id has unsupported summary status: $current_status"

    count=${history_count[$id]:-0}
    ((count > 0)) || fail "$id contains no status-history rows"
    previous_status=
    previous_date=
    for ((history_index = 1; history_index <= count; history_index++)); do
        key=$id'|'$history_index
        date=${history_date[$key]}
        status=$(strip_ticks "${history_status[$key]}")
        actor=${history_actor[$key]}
        owner=${history_owner[$key]}
        note=${history_note[$key]}

        [[ $date =~ $date_pattern ]] ||
            fail "$id history row $history_index has an invalid date"
        valid_status "$status" ||
            fail "$id history row $history_index has unsupported status: $status"
        [[ -n $actor && -n $note ]] ||
            fail "$id history row $history_index lacks actor or note"
        if [[ -n $previous_date && $date < $previous_date ]]; then
            fail "$id status-history dates are not nondecreasing"
        fi
        if ((history_index == 1)); then
            [[ $status == new ]] ||
                fail "$id first status-history row must be new"
            [[ $owner == Not\ applicable* ]] ||
                fail "$id initial history row must have no owner-side record"
        else
            valid_transition "$previous_status" "$status" ||
                fail "$id has illegal status transition: $previous_status -> $status"
            [[ $owner =~ $portable_record_pattern ]] ||
                fail "$id status $status requires a portable owner-side record"
        fi
        previous_date=$date
        previous_status=$status
    done
    [[ $current_status == "$previous_status" ]] ||
        fail "$id summary status does not match final status-history row"
done

extract_item_definition() {
    local input=$1 id=$2
    awk -v id="$id" '
        $0 ~ "^## " id " - " { active = 1 }
        active && /^### Status history$/ { exit }
        active { print }
    ' "$input"
}

extract_status_history() {
    local input=$1 id=$2
    awk -v id="$id" '
        $0 ~ "^## " id " - " { item = 1 }
        item && /^### Status history$/ { history = 1; next }
        history && /^## / { exit }
        history && /^\| [0-9][0-9][0-9][0-9]-/ { print }
    ' "$input"
}

extract_activity_history() {
    awk '
        /^## Activity log$/ { activity = 1; next }
        activity && /^\| ACTIVITY-/ { print }
    ' "$1"
}

if [[ -n $baseline ]]; then
    "$0" "$baseline" >/dev/null ||
        fail 'baseline queue is not valid'

    mapfile -t baseline_ids < <(
        awk '/^## HET-[0-9][0-9][0-9] - / { print $2 }' "$baseline"
    )
    for id in "${baseline_ids[@]}"; do
        [[ -n ${item_title[$id]+x} ]] ||
            fail "baseline item was removed: $id"
        extract_item_definition "$baseline" "$id" \
            >"$temporary/$id.baseline.definition"
        extract_item_definition "$queue" "$id" \
            >"$temporary/$id.current.definition"
        cmp -s "$temporary/$id.baseline.definition" \
            "$temporary/$id.current.definition" ||
            fail "append-only item definition changed: $id"

        extract_status_history "$baseline" "$id" \
            >"$temporary/$id.baseline.history"
        extract_status_history "$queue" "$id" \
            >"$temporary/$id.current.history"
        baseline_count=$(wc -l <"$temporary/$id.baseline.history")
        current_count=$(wc -l <"$temporary/$id.current.history")
        ((current_count >= baseline_count)) ||
            fail "append-only status history was shortened: $id"
        head -n "$baseline_count" "$temporary/$id.current.history" \
            >"$temporary/$id.current-prefix.history"
        cmp -s "$temporary/$id.baseline.history" \
            "$temporary/$id.current-prefix.history" ||
            fail "append-only status history changed: $id"
    done

    extract_activity_history "$baseline" >"$temporary/baseline.activity"
    extract_activity_history "$queue" >"$temporary/current.activity"
    baseline_count=$(wc -l <"$temporary/baseline.activity")
    current_count=$(wc -l <"$temporary/current.activity")
    ((current_count >= baseline_count)) ||
        fail 'append-only activity history was shortened'
    head -n "$baseline_count" "$temporary/current.activity" \
        >"$temporary/current-prefix.activity"
    cmp -s "$temporary/baseline.activity" \
        "$temporary/current-prefix.activity" ||
        fail 'append-only activity history changed'
fi

printf 'analysis-workbook Helium transfer queue: PASS (%d items)\n' \
    "${#item_order[@]}"
