#!/usr/bin/env bash

set -u

usage() {
    cat >&2 <<'EOF'
Usage:
  validate-session.sh [--draft] <session-directory>
  validate-session.sh --baseline <prior-session-directory> <session-directory>

Modes:
  --draft      Structural checks only. Placeholder content is permitted.
  (default)    Structural checks plus completion checks.
  --baseline   Structural checks plus append-only checks against a prior copy
               of the same session package.

The validator is read-only. It never repairs a package.
EOF
}

mode=complete
baseline_dir=

while (($# > 0)); do
    case $1 in
    --draft)
        mode=draft
        shift
        ;;
    --baseline)
        (($# >= 2)) || {
            usage
            exit 2
        }
        mode=baseline
        baseline_dir=$2
        shift 2
        ;;
    -h | --help)
        usage
        exit 0
        ;;
    --)
        shift
        break
        ;;
    -*)
        usage
        exit 2
        ;;
    *)
        break
        ;;
    esac
done

(($# == 1)) || {
    usage
    exit 2
}

session_argument=$1

error_count=0

fail() {
    printf 'FAIL %s\n' "$*"
    error_count=$((error_count + 1))
}

die() {
    printf 'validate-session: ERROR: %s\n' "$*" >&2
    exit 2
}

session_dir=$(CDPATH= cd -- "$session_argument" 2>/dev/null && pwd -P) ||
    die "session directory does not exist: $session_argument"

if [[ $mode == baseline ]]; then
    baseline_dir=$(CDPATH= cd -- "$baseline_dir" 2>/dev/null && pwd -P) ||
        die "baseline directory does not exist: $baseline_dir"
fi

session_dir_name=${session_dir##*/}
relative_name=$session_dir_name

# ---------------------------------------------------------------------------
# helpers
# ---------------------------------------------------------------------------

section_of() {
    awk -v heading="## $2" '
        $0 == heading { inside = 1; next }
        inside && /^## / { inside = 0 }
        inside { print }
    ' "$1"
}

table_rows_of() {
    section_of "$1" "$2" | awk '
        /^\|/ {
            if ($0 ~ /^\|[ :|-]+\|$/) { data = 1; next }
            if (data) { print }
            next
        }
        { data = 0 }
    '
}

row_field() {
    printf '%s\n' "$1" | awk -v index_number="$2" -F'|' '
        {
            value = $(index_number + 1)
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", value)
            print value
        }
    '
}

field_value() {
    sed -n "s/^$2:[[:space:]]*//p" "$1" | head -1 | tr -d '`' |
        sed 's/[[:space:]]*$//'
}

has_heading() {
    grep -Fqx -- "## $2" "$1"
}

in_list() {
    local needle=$1
    shift
    local candidate
    for candidate in "$@"; do
        [[ $candidate == "$needle" ]] && return 0
    done
    return 1
}

# ---------------------------------------------------------------------------
# package identity
# ---------------------------------------------------------------------------

if [[ ! $session_dir_name =~ ^(AWB-([0-9]{4})([0-9]{2})([0-9]{2})-[0-9]{3})-[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    fail "$relative_name: session directory name must be AWB-YYYYMMDD-NNN-short-name"
    printf '\n%s: %d error(s)\n' "$relative_name" "$error_count"
    exit 1
fi

session_id=${BASH_REMATCH[1]}
id_year=${BASH_REMATCH[2]}
id_month=${BASH_REMATCH[3]}
id_day=${BASH_REMATCH[4]}
session_short_name=${session_dir_name#"$session_id"-}

if ((10#$id_month < 1 || 10#$id_month > 12)) ||
    ((10#$id_day < 1 || 10#$id_day > 31)) ||
    ((10#$id_year < 2000 || 10#$id_year > 2999)); then
    fail "$relative_name: session ID does not encode a plausible UTC date"
fi

session_files=(
    session.md
    planning.md
    source-discoveries.md
    inaccessible-resources.md
    publication-checklist.md
    HANDOFF.md
)

inquiry_files=(
    question.md
    report.md
    summary.md
    evidence.md
    search-log.md
    open-questions.md
)

for name in "${session_files[@]}"; do
    [[ -f $session_dir/$name ]] ||
        fail "$relative_name: required session artifact is missing: $name"
done

if ((error_count > 0)); then
    printf '\n%s: %d error(s)\n' "$relative_name" "$error_count"
    exit 1
fi

inquiries_dir=$session_dir/inquiries
inquiry_ids=()
if [[ -d $inquiries_dir ]]; then
    while IFS= read -r entry; do
        [[ -n $entry ]] || continue
        entry_name=${entry##*/}
        [[ $entry_name == .* ]] && continue
        if [[ ! -d $entry ]]; then
            fail "$relative_name: unexpected file in inquiries/: $entry_name"
            continue
        fi
        if [[ ! $entry_name =~ ^Q-[0-9]{3}$ ]]; then
            fail "$relative_name: inquiry directory name must be Q-NNN: $entry_name"
            continue
        fi
        inquiry_ids+=("$entry_name")
    done < <(find "$inquiries_dir" -mindepth 1 -maxdepth 1 | LC_ALL=C sort)
fi

for inquiry_id in "${inquiry_ids[@]}"; do
    for name in "${inquiry_files[@]}"; do
        [[ -f $inquiries_dir/$inquiry_id/$name ]] ||
            fail "$relative_name/$inquiry_id: required inquiry artifact is missing: $name"
    done
done

if ((error_count > 0)); then
    printf '\n%s: %d error(s)\n' "$relative_name" "$error_count"
    exit 1
fi

package_files=()
for name in "${session_files[@]}"; do
    package_files+=("$session_dir/$name")
done
for inquiry_id in "${inquiry_ids[@]}"; do
    for name in "${inquiry_files[@]}"; do
        package_files+=("$inquiries_dir/$inquiry_id/$name")
    done
done

locator_of() {
    printf '%s' "$relative_name${1#"$session_dir"}"
}

# ---------------------------------------------------------------------------
# hygiene applying to every artifact
# ---------------------------------------------------------------------------

valid_distributions=(private internal public-candidate)
session_distribution=$(field_value "$session_dir/session.md" 'Distribution')

if ! in_list "$session_distribution" "${valid_distributions[@]}"; then
    fail "$relative_name/session.md: Distribution must be private, internal, or public-candidate"
fi

for file in "${package_files[@]}"; do
    locator=$(locator_of "$file")

    if grep -Eq '@@[A-Z][A-Z0-9_]*@@' -- "$file"; then
        fail "$locator: contains an unsubstituted template token"
    fi

    if grep -Eq '(^|[^A-Za-z0-9_])(/home/|/Users/|/root/)' -- "$file"; then
        fail "$locator: contains an absolute workstation path; use a logical locator"
    fi

    if grep -Eqi '[A-Za-z]:\\\\' -- "$file"; then
        fail "$locator: contains an absolute Windows path; use a logical locator"
    fi

    if grep -Fq 'restricted-microsoft' -- "$file"; then
        fail "$locator: references restricted-microsoft material; that corpus must not be reproduced"
    fi

    file_session_id=$(field_value "$file" 'Session ID')
    if [[ $file_session_id != "$session_id" ]]; then
        fail "$locator: Session ID must be $session_id (found '${file_session_id:-none}')"
    fi

    file_distribution=$(field_value "$file" 'Distribution')
    if [[ $file_distribution != "$session_distribution" ]]; then
        fail "$locator: Distribution must match the session package ($session_distribution)"
    fi

    file_created=$(field_value "$file" 'Created')
    if [[ ! $file_created =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        fail "$locator: Created must be an ISO YYYY-MM-DD date"
    fi

    file_status=$(field_value "$file" 'Status')
    if ! in_list "$file_status" Draft In-progress Complete Superseded; then
        fail "$locator: Status must be Draft, In-progress, Complete, or Superseded"
    fi

    if ! has_heading "$file" 'Activity log'; then
        fail "$locator: missing the '## Activity log' section"
    else
        while IFS= read -r row; do
            [[ -n $row ]] || continue
            activity_id=$(row_field "$row" 1)
            [[ $activity_id == None ]] && continue
            if [[ ! $activity_id =~ ^ACTIVITY-[0-9]{3}$ ]]; then
                fail "$locator: activity ID must be ACTIVITY-NNN (found '$activity_id')"
            fi
        done < <(table_rows_of "$file" 'Activity log')
    fi

    if grep -Eqi '^[-*]?[[:space:]]*(Publication|Licensing|Sign-off) decision:.*\b(granted|approved|accepted|signed-off)\b' -- "$file"; then
        fail "$locator: this repository must never record a granted publication, licensing, or sign-off decision"
    fi
done

for inquiry_id in "${inquiry_ids[@]}"; do
    for name in "${inquiry_files[@]}"; do
        file=$inquiries_dir/$inquiry_id/$name
        locator=$(locator_of "$file")
        file_inquiry_id=$(field_value "$file" 'Inquiry ID')
        if [[ $file_inquiry_id != "$inquiry_id" ]]; then
            fail "$locator: Inquiry ID must be $inquiry_id (found '${file_inquiry_id:-none}')"
        fi
    done
done

# ---------------------------------------------------------------------------
# session.md structure
# ---------------------------------------------------------------------------

session_file=$session_dir/session.md

for heading in 'SCOPE-001' 'PHASES-001' 'Review surfaces' 'Component revisions' \
    'Inquiry index' 'Safety boundary' 'Activity log'; do
    has_heading "$session_file" "$heading" ||
        fail "$relative_name/session.md: missing the '## $heading' section"
done

session_short_name_field=$(field_value "$session_file" 'Short name')
if [[ $session_short_name_field != "$session_short_name" ]]; then
    fail "$relative_name/session.md: Short name must be $session_short_name"
fi

session_phase=$(field_value "$session_file" 'Phase')
if ! in_list "$session_phase" Planning Analysis Complete; then
    fail "$relative_name/session.md: Phase must be Planning, Analysis, or Complete"
fi

while IFS= read -r row; do
    [[ -n $row ]] || continue
    surface_id=$(row_field "$row" 1)
    [[ $surface_id == None ]] && continue
    if [[ ! $surface_id =~ ^SURFACE-[0-9]{3}$ ]]; then
        fail "$relative_name/session.md: surface ID must be SURFACE-NNN (found '$surface_id')"
    fi
done < <(table_rows_of "$session_file" 'Review surfaces')

indexed_inquiries=()
while IFS= read -r row; do
    [[ -n $row ]] || continue
    indexed_id=$(row_field "$row" 1)
    [[ $indexed_id == None ]] && continue
    if [[ ! $indexed_id =~ ^Q-[0-9]{3}$ ]]; then
        fail "$relative_name/session.md: inquiry index ID must be Q-NNN (found '$indexed_id')"
        continue
    fi
    if in_list "$indexed_id" "${indexed_inquiries[@]+"${indexed_inquiries[@]}"}"; then
        fail "$relative_name/session.md: inquiry $indexed_id is listed more than once"
    fi
    indexed_inquiries+=("$indexed_id")
    [[ -d $inquiries_dir/$indexed_id ]] ||
        fail "$relative_name/session.md: inquiry index lists $indexed_id but no such directory exists"
done < <(table_rows_of "$session_file" 'Inquiry index')

for inquiry_id in "${inquiry_ids[@]}"; do
    in_list "$inquiry_id" "${indexed_inquiries[@]+"${indexed_inquiries[@]}"}" ||
        fail "$relative_name/session.md: inquiry $inquiry_id exists but is not listed in the inquiry index"
done

required_phases=(
    'Scope freeze'
    'Aspect decomposition'
    'Local evidence pass'
    'External research'
    'Deep sweep'
    'Falsification'
    'Component command evidence'
    'Durable output'
)
declare -A phase_state=()
while IFS= read -r line; do
    [[ $line =~ ^-\ ([^:]+):\ (.*)$ ]] || continue
    phase_state[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}
done < <(section_of "$session_file" 'PHASES-001')

for phase in "${required_phases[@]}"; do
    [[ -n ${phase_state[$phase]+set} ]] ||
        fail "$relative_name/session.md: PHASES-001 is missing the '$phase' phase"
done

# ---------------------------------------------------------------------------
# evidence ledger
# ---------------------------------------------------------------------------

evidence_pattern="AWB-[0-9]{8}-[0-9]{3}-E[0-9]{4}"
declare -A evidence_owner=()
declare -A evidence_sensitivity=()
declare -A evidence_redistribution=()
evidence_total=0

valid_classes=(
    'Local implementation' 'Local assurance' 'Local coordination'
    'Local research' 'Local provenance' 'External primary'
    'External secondary' 'User-supplied'
)
valid_roles=(Direct Corroborating Contextual Counter Negative)
valid_sensitivities=(public internal private restricted)
valid_redistributions=(approved not-approved unknown not-applicable)

for inquiry_id in "${inquiry_ids[@]}"; do
    evidence_file=$inquiries_dir/$inquiry_id/evidence.md
    locator=$(locator_of "$evidence_file")

    for heading in 'Ledger' 'Superseded records' 'Activity log'; do
        has_heading "$evidence_file" "$heading" ||
            fail "$locator: missing the '## $heading' section"
    done

    while IFS= read -r row; do
        [[ -n $row ]] || continue
        evidence_id=$(row_field "$row" 1)
        [[ $evidence_id == None ]] && continue

        if [[ ! $evidence_id =~ ^${evidence_pattern}$ ]]; then
            fail "$locator: evidence ID must be ${session_id}-E#### (found '$evidence_id')"
            continue
        fi
        if [[ $evidence_id != "$session_id"-* ]]; then
            fail "$locator: evidence ID $evidence_id does not carry the session prefix $session_id"
            continue
        fi
        if [[ -n ${evidence_owner[$evidence_id]+set} ]]; then
            fail "$locator: evidence ID $evidence_id is already defined in ${evidence_owner[$evidence_id]}"
            continue
        fi
        evidence_owner[$evidence_id]=$inquiry_id
        evidence_total=$((evidence_total + 1))

        evidence_class=$(row_field "$row" 2)
        evidence_role=$(row_field "$row" 3)
        evidence_locator=$(row_field "$row" 4)
        evidence_revision=$(row_field "$row" 5)
        evidence_observation=$(row_field "$row" 6)
        sensitivity=$(row_field "$row" 7)
        redistribution=$(row_field "$row" 8)
        limitation=$(row_field "$row" 9)

        in_list "$evidence_class" "${valid_classes[@]}" ||
            fail "$locator: $evidence_id has an invalid Class '$evidence_class'"
        in_list "$evidence_role" "${valid_roles[@]}" ||
            fail "$locator: $evidence_id has an invalid Role '$evidence_role'"
        in_list "$sensitivity" "${valid_sensitivities[@]}" ||
            fail "$locator: $evidence_id has an invalid Sensitivity '$sensitivity'"
        in_list "$redistribution" "${valid_redistributions[@]}" ||
            fail "$locator: $evidence_id has an invalid Redistribution '$redistribution'"

        [[ -n $evidence_locator && $evidence_locator != 'Not applicable' ]] ||
            fail "$locator: $evidence_id must record a logical locator"
        [[ -n $evidence_revision ]] ||
            fail "$locator: $evidence_id must record a revision or checked date"
        [[ -n $evidence_observation ]] ||
            fail "$locator: $evidence_id must record an observation"
        [[ -n $limitation ]] ||
            fail "$locator: $evidence_id must record a limitation"

        evidence_sensitivity[$evidence_id]=$sensitivity
        evidence_redistribution[$evidence_id]=$redistribution
    done < <(table_rows_of "$evidence_file" 'Ledger')

    while IFS= read -r row; do
        [[ -n $row ]] || continue
        superseding=$(row_field "$row" 1)
        [[ $superseding == None ]] && continue
        superseded=$(row_field "$row" 2)
        for candidate in "$superseding" "$superseded"; do
            if [[ ! $candidate =~ ^${evidence_pattern}$ ]]; then
                fail "$locator: superseded record refers to a malformed evidence ID '$candidate'"
            fi
        done
    done < <(table_rows_of "$evidence_file" 'Superseded records')
done

# every cited evidence ID must resolve to a ledger row
for file in "${package_files[@]}"; do
    locator=$(locator_of "$file")
    [[ $file == *"/evidence.md" ]] && continue
    while IFS= read -r cited; do
        [[ -n $cited ]] || continue
        if [[ -z ${evidence_owner[$cited]+set} ]]; then
            fail "$locator: cites evidence ID $cited, which is not defined in any ledger"
        fi
    done < <(grep -Eo -- "$evidence_pattern" "$file" | LC_ALL=C sort -u)
done

# ---------------------------------------------------------------------------
# per-inquiry structure
# ---------------------------------------------------------------------------

valid_confidence=(High Medium Low)

for inquiry_id in "${inquiry_ids[@]}"; do
    report_file=$inquiries_dir/$inquiry_id/report.md
    summary_file=$inquiries_dir/$inquiry_id/summary.md
    question_file=$inquiries_dir/$inquiry_id/question.md
    search_file=$inquiries_dir/$inquiry_id/search-log.md
    open_file=$inquiries_dir/$inquiry_id/open-questions.md

    for heading in 'Question' 'Method' 'Surfaces examined' 'Findings' \
        'Hypotheses' 'Assumptions in use' 'Disagreements and terminology' \
        'Assurance boundaries preserved' 'Limitations' \
        'What would change the answer'; do
        has_heading "$report_file" "$heading" ||
            fail "$(locator_of "$report_file"): missing the '## $heading' section"
    done

    for heading in 'Question' 'Answer' 'Confidence' 'Load-bearing evidence' \
        'Open questions' 'Limitations'; do
        has_heading "$summary_file" "$heading" ||
            fail "$(locator_of "$summary_file"): missing the '## $heading' section"
    done

    for heading in 'Question as stated' 'Question as analyzed' \
        'Resolved sub-scope' 'What a good answer enables'; do
        has_heading "$question_file" "$heading" ||
            fail "$(locator_of "$question_file"): missing the '## $heading' section"
    done

    for heading in 'Local queries' 'Tier coverage' \
        'Gaps carried to external research' 'External queries' \
        'Terminology collisions' 'Approved component commands run'; do
        has_heading "$search_file" "$heading" ||
            fail "$(locator_of "$search_file"): missing the '## $heading' section"
    done

    for heading in 'Questions' 'Superseded records'; do
        has_heading "$open_file" "$heading" ||
            fail "$(locator_of "$open_file"): missing the '## $heading' section"
    done

    grep -Fq 'Full analysis: [report.md](report.md)' "$summary_file" ||
        fail "$(locator_of "$summary_file"): must link to the full report"

    while IFS= read -r heading_line; do
        finding_id=${heading_line#"### "}
        if [[ ! $finding_id =~ ^FINDING-[0-9]{3}$ ]]; then
            fail "$(locator_of "$report_file"): finding heading must be FINDING-NNN (found '$finding_id')"
        fi
    done < <(section_of "$report_file" 'Findings' | grep '^### ' || true)

    while IFS= read -r row; do
        [[ -n $row ]] || continue
        open_id=$(row_field "$row" 1)
        [[ $open_id == None ]] && continue
        if [[ ! $open_id =~ ^OPEN-[0-9]{3}$ ]]; then
            fail "$(locator_of "$open_file"): open-question ID must be OPEN-NNN (found '$open_id')"
            continue
        fi
        blocking=$(row_field "$row" 4)
        open_status=$(row_field "$row" 8)
        in_list "$blocking" Yes No ||
            fail "$(locator_of "$open_file"): $open_id Blocking must be Yes or No"
        in_list "$open_status" Open Answered Superseded Withdrawn ||
            fail "$(locator_of "$open_file"): $open_id Status must be Open, Answered, Superseded, or Withdrawn"
    done < <(table_rows_of "$open_file" 'Questions')
done

# ---------------------------------------------------------------------------
# discoveries and blocked resources
# ---------------------------------------------------------------------------

discovery_file=$session_dir/source-discoveries.md
while IFS= read -r row; do
    [[ -n $row ]] || continue
    discovery_id=$(row_field "$row" 1)
    [[ $discovery_id == None ]] && continue
    if [[ ! $discovery_id =~ ^DISC-[0-9]{3}$ ]]; then
        fail "$relative_name/source-discoveries.md: discovery ID must be DISC-NNN (found '$discovery_id')"
        continue
    fi
    discovery_status=$(row_field "$row" 10)
    in_list "$discovery_status" new unconfirmed ||
        fail "$relative_name/source-discoveries.md: $discovery_id Status must be new or unconfirmed"
    discovery_sensitivity=$(row_field "$row" 11)
    in_list "$discovery_sensitivity" "${valid_sensitivities[@]}" ||
        fail "$relative_name/source-discoveries.md: $discovery_id has an invalid Sensitivity '$discovery_sensitivity'"
    discovery_redistribution=$(row_field "$row" 12)
    in_list "$discovery_redistribution" "${valid_redistributions[@]}" ||
        fail "$relative_name/source-discoveries.md: $discovery_id has an invalid Redistribution '$discovery_redistribution'"
done < <(table_rows_of "$discovery_file" 'Discoveries')

blocked_file=$session_dir/inaccessible-resources.md
valid_access_results=(
    paywalled 'authentication required' 'robots disallowed'
    'licence restricted' 'not found' withdrawn unreachable 'out of scope'
)
while IFS= read -r row; do
    [[ -n $row ]] || continue
    blocked_id=$(row_field "$row" 1)
    [[ $blocked_id == None ]] && continue
    if [[ ! $blocked_id =~ ^BLOCKED-[0-9]{3}$ ]]; then
        fail "$relative_name/inaccessible-resources.md: blocked ID must be BLOCKED-NNN (found '$blocked_id')"
        continue
    fi
    access_result=$(row_field "$row" 4)
    in_list "$access_result" "${valid_access_results[@]}" ||
        fail "$relative_name/inaccessible-resources.md: $blocked_id has an invalid Access result '$access_result'"
    blocked_priority=$(row_field "$row" 6)
    in_list "$blocked_priority" High Medium Low ||
        fail "$relative_name/inaccessible-resources.md: $blocked_id Priority must be High, Medium, or Low"
done < <(table_rows_of "$blocked_file" 'Blocked resources')

# ---------------------------------------------------------------------------
# distribution and promotion
# ---------------------------------------------------------------------------

checklist_file=$session_dir/publication-checklist.md
intended_distribution=$(field_value "$checklist_file" 'Intended distribution')
in_list "$intended_distribution" "${valid_distributions[@]}" ||
    fail "$relative_name/publication-checklist.md: Intended distribution must be private, internal, or public-candidate"

promotion_field() {
    section_of "$checklist_file" 'HUMAN-PROMOTION records' |
        awk -v label="$1" -F'|' '
            {
                key = $2
                gsub(/^[[:space:]]+|[[:space:]]+$/, "", key)
                if (key != label) { next }
                value = $3
                gsub(/^[[:space:]]+|[[:space:]]+$/, "", value)
                print value
                exit
            }
        '
}

promotion_record_id=$(promotion_field 'Record ID')

if [[ $session_distribution != private ]]; then
    if [[ ! $promotion_record_id =~ ^HUMAN-PROMOTION-[0-9]{3}$ ]]; then
        fail "$relative_name: distribution '$session_distribution' requires a completed HUMAN-PROMOTION-NNN record"
    else
        for label in 'Responsible human actor' 'Responsible human role' \
            'UTC timestamp' 'From distribution' 'To distribution' 'Decision' \
            'Checklist basis' 'Evidence IDs' 'Limitations'; do
            value=$(promotion_field "$label")
            if [[ -z $value || $value == 'Not recorded' ]]; then
                fail "$relative_name/publication-checklist.md: promotion record field '$label' is not completed"
            fi
        done
        promotion_decision=$(promotion_field 'Decision')
        in_list "$promotion_decision" promote decline ||
            fail "$relative_name/publication-checklist.md: promotion Decision must be promote or decline"
        promotion_to=$(promotion_field 'To distribution')
        [[ $promotion_to == "$session_distribution" ]] ||
            fail "$relative_name/publication-checklist.md: promotion To distribution must match the package distribution"
        if grep -Fq '- [ ]' "$checklist_file"; then
            fail "$relative_name/publication-checklist.md: every promotion prerequisite must be checked before promotion"
        fi
    fi
fi

if [[ $session_distribution == public-candidate ]]; then
    for evidence_id in "${!evidence_sensitivity[@]}"; do
        case ${evidence_sensitivity[$evidence_id]} in
        internal | private | restricted)
            fail "$relative_name: public-candidate is blocked by $evidence_id with sensitivity ${evidence_sensitivity[$evidence_id]}"
            ;;
        esac
        case ${evidence_redistribution[$evidence_id]} in
        not-approved | unknown)
            fail "$relative_name: public-candidate is blocked by $evidence_id with redistribution ${evidence_redistribution[$evidence_id]}"
            ;;
        esac
    done
fi

# ---------------------------------------------------------------------------
# completion checks
# ---------------------------------------------------------------------------

if [[ $mode != draft ]]; then
    declare -A placeholder_pattern=(
        [session.md]='[Nn]ot yet supplied|Not yet decomposed|Not yet resolved|Session setup only'
        [planning.md]='[Nn]ot yet supplied|Not yet confirmed|Planning has not started|has not been captured'
        [HANDOFF.md]='Not yet frozen|Not yet run\.|Analysis has not started'
        [question.md]='[Nn]ot yet supplied'
        [report.md]='[Nn]ot yet supplied|Analysis has not started'
        [summary.md]='[Nn]ot yet supplied|Analysis has not started'
        [evidence.md]='No evidence has been recorded'
        [search-log.md]='No local query has been run'
    )

    for file in "${package_files[@]}"; do
        base_name=${file##*/}
        pattern=${placeholder_pattern[$base_name]:-}
        [[ -n $pattern ]] || continue
        if grep -Eq -- "$pattern" "$file"; then
            fail "$(locator_of "$file"): still contains scaffolded placeholder content"
        fi
    done

    session_status=$(field_value "$session_file" 'Status')
    [[ $session_status == Complete ]] ||
        fail "$relative_name/session.md: Status must be Complete for a completed session"
    [[ $session_phase == Complete || $session_phase == Analysis ]] ||
        fail "$relative_name/session.md: Phase must be Analysis or Complete for a completed session"

    for phase in 'Scope freeze' 'Aspect decomposition' 'Local evidence pass' \
        'Falsification' 'Durable output'; do
        [[ ${phase_state[$phase]:-} == Complete ]] ||
            fail "$relative_name/session.md: phase '$phase' must be Complete (found '${phase_state[$phase]:-missing}')"
    done

    for phase in 'External research' 'Deep sweep' 'Component command evidence'; do
        value=${phase_state[$phase]:-}
        if [[ $value != Complete && $value != 'Not applicable -'* ]]; then
            fail "$relative_name/session.md: phase '$phase' must be Complete or 'Not applicable - <reason>' (found '${value:-missing}')"
        fi
    done

    ((${#inquiry_ids[@]} > 0)) ||
        fail "$relative_name: a completed session must contain at least one inquiry"

    ((evidence_total > 0)) ||
        fail "$relative_name: a completed session must record at least one evidence row"

    scope_section=$(section_of "$session_file" 'SCOPE-001')
    for scope_label in Aspect 'Review surfaces' Exclusions \
        'Expected evidence components' 'Time or revision window' Depth \
        'External research' 'Public query terms' 'Approved component commands' \
        Limitations; do
        printf '%s\n' "$scope_section" | grep -Eq "^- $scope_label: .+" ||
            fail "$relative_name/session.md: SCOPE-001 is missing the '$scope_label' field"
    done

    for inquiry_id in "${inquiry_ids[@]}"; do
        report_file=$inquiries_dir/$inquiry_id/report.md
        summary_file=$inquiries_dir/$inquiry_id/summary.md
        search_file=$inquiries_dir/$inquiry_id/search-log.md
        report_locator=$(locator_of "$report_file")
        summary_locator=$(locator_of "$summary_file")

        for file in "$report_file" "$summary_file"; do
            topic=$(field_value "$file" 'Topic')
            confidence=$(field_value "$file" 'Confidence')
            [[ -n $topic ]] ||
                fail "$(locator_of "$file"): Topic must be set for workbook indexing"
            in_list "$confidence" "${valid_confidence[@]}" ||
                fail "$(locator_of "$file"): Confidence must be High, Medium, or Low (found '$confidence')"
        done

        report_topic=$(field_value "$report_file" 'Topic')
        summary_topic=$(field_value "$summary_file" 'Topic')
        [[ $report_topic == "$summary_topic" ]] ||
            fail "$summary_locator: Topic must match the report Topic"
        report_confidence=$(field_value "$report_file" 'Confidence')
        summary_confidence=$(field_value "$summary_file" 'Confidence')
        [[ $report_confidence == "$summary_confidence" ]] ||
            fail "$summary_locator: Confidence must match the report Confidence"

        findings=$(section_of "$report_file" 'Findings' | grep -c '^### FINDING-' || true)
        ((findings > 0)) ||
            fail "$report_locator: a completed report must contain at least one FINDING-NNN"

        finding_block=
        current_finding=
        check_finding() {
            local block=$1 finding=$2 label value
            [[ -n $finding ]] || return 0
            for label in Statement 'Evidence IDs' Confidence 'Evidence basis' \
                'Alternatives considered' 'Counter-evidence' Limitations; do
                value=$(printf '%s\n' "$block" |
                    sed -n "s/^- $label: *//p" | head -1)
                if [[ -z $value ]]; then
                    fail "$report_locator: $finding is missing the '$label' field"
                    continue
                fi
                case $label in
                Confidence)
                    in_list "$value" "${valid_confidence[@]}" ||
                        fail "$report_locator: $finding Confidence must be High, Medium, or Low"
                    [[ $value != Low ]] ||
                        fail "$report_locator: $finding is Low confidence and belongs in Hypotheses, not Findings"
                    ;;
                'Evidence IDs')
                    if [[ $value == none || $value == None ]]; then
                        fail "$report_locator: $finding must cite at least one evidence ID"
                    elif ! printf '%s' "$value" | grep -Eq -- "$evidence_pattern"; then
                        fail "$report_locator: $finding Evidence IDs must be ${session_id}-E#### values"
                    fi
                    ;;
                esac
            done
        }

        while IFS= read -r line; do
            if [[ $line == '### '* ]]; then
                check_finding "$finding_block" "$current_finding"
                current_finding=${line#"### "}
                finding_block=
                continue
            fi
            finding_block+=$line$'\n'
        done < <(section_of "$report_file" 'Findings')
        check_finding "$finding_block" "$current_finding"

        summary_answer=$(section_of "$summary_file" 'Answer' | grep -c '[^[:space:]]' || true)
        ((summary_answer > 0)) ||
            fail "$summary_locator: the Answer section must not be empty"

        load_bearing=0
        while IFS= read -r row; do
            [[ -n $row ]] || continue
            evidence_id=$(row_field "$row" 1)
            [[ $evidence_id == None ]] && continue
            load_bearing=$((load_bearing + 1))
        done < <(table_rows_of "$summary_file" 'Load-bearing evidence')
        ((load_bearing > 0)) ||
            fail "$summary_locator: a completed summary must name its load-bearing evidence"

        local_queries=0
        while IFS= read -r row; do
            [[ -n $row ]] || continue
            query_id=$(row_field "$row" 1)
            [[ $query_id == None ]] && continue
            local_queries=$((local_queries + 1))
        done < <(table_rows_of "$search_file" 'Local queries')
        ((local_queries > 0)) ||
            fail "$(locator_of "$search_file"): a completed inquiry must record at least one local query"

        tier_rows=0
        while IFS= read -r row; do
            [[ -n $row ]] || continue
            tier_name=$(row_field "$row" 1)
            [[ $tier_name == None ]] && continue
            tier_rows=$((tier_rows + 1))
        done < <(table_rows_of "$search_file" 'Tier coverage')
        ((tier_rows > 0)) ||
            fail "$(locator_of "$search_file"): a completed inquiry must record tier coverage"
    done
fi

# ---------------------------------------------------------------------------
# append-only baseline comparison
# ---------------------------------------------------------------------------

if [[ $mode == baseline ]]; then
    append_only_sections() {
        case ${1##*/} in
        session.md) printf '%s\n' 'Activity log' ;;
        planning.md) printf '%s\n' 'Activity log' ;;
        publication-checklist.md) printf '%s\n' 'Activity log' ;;
        source-discoveries.md) printf '%s\n' 'Discoveries' 'Activity log' ;;
        inaccessible-resources.md) printf '%s\n' 'Blocked resources' 'Activity log' ;;
        evidence.md) printf '%s\n' 'Ledger' 'Superseded records' 'Activity log' ;;
        search-log.md)
            printf '%s\n' 'Local queries' 'External queries' \
                'Approved component commands run' 'Activity log'
            ;;
        open-questions.md) printf '%s\n' 'Questions' 'Superseded records' 'Activity log' ;;
        question.md | report.md | summary.md) printf '%s\n' 'Activity log' ;;
        esac
    }

    while IFS= read -r baseline_file; do
        relative_path=${baseline_file#"$baseline_dir"/}
        current_file=$session_dir/$relative_path
        if [[ ! -f $current_file ]]; then
            fail "$relative_name/$relative_path: artifact present in the baseline has been removed"
            continue
        fi
        while IFS= read -r heading; do
            [[ -n $heading ]] || continue
            while IFS= read -r row; do
                [[ -n $row ]] || continue
                row_id=$(row_field "$row" 1)
                [[ $row_id == None ]] && continue
                if ! grep -Fqx -- "$row" "$current_file"; then
                    fail "$relative_name/$relative_path: append-only row '$row_id' in '$heading' was changed or removed"
                fi
            done < <(table_rows_of "$baseline_file" "$heading")
        done < <(append_only_sections "$baseline_file")
    done < <(find "$baseline_dir" -type f -name '*.md' | LC_ALL=C sort)
fi

# ---------------------------------------------------------------------------

if ((error_count > 0)); then
    printf '\n%s: %d error(s) in %s mode\n' "$relative_name" "$error_count" "$mode"
    exit 1
fi

printf 'OK %s: %d inquir(ies), %d evidence record(s), %s mode\n' \
    "$relative_name" "${#inquiry_ids[@]}" "$evidence_total" "$mode"
