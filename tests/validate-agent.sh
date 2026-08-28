#!/usr/bin/env bash

set -u

repository_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P) || {
    printf 'validate-agent: ERROR: cannot resolve repository root\n' >&2
    exit 2
}
cd -- "$repository_root" || exit 2

fixture=$repository_root/tests/fixtures/valid-session/AWB-20000101-001-fixture-aspect

pass_count=0
fail_count=0
case_counter=0

pass() {
    pass_count=$((pass_count + 1))
    printf 'ok   %s\n' "$*"
}

fail() {
    fail_count=$((fail_count + 1))
    printf 'FAIL %s\n' "$*"
}

sandbox=$(mktemp -d "${TMPDIR:-/tmp}/analysis-workbook-tests.XXXXXX") || exit 2
cleanup() { rm -rf -- "$sandbox"; }
trap cleanup EXIT
trap 'exit 1' HUP INT TERM

# ---------------------------------------------------------------------------
# helpers
# ---------------------------------------------------------------------------

require_file() {
    if [[ -f $1 ]]; then
        pass "file exists: $1"
    else
        fail "file is missing: $1"
    fi
}

require_executable() {
    if [[ -x $1 ]]; then
        pass "file is executable: $1"
    else
        fail "file is not executable: $1"
    fi
}

require_text() {
    if grep -Fq -- "$2" "$1"; then
        pass "$1 states: $2"
    else
        fail "$1 does not state: $2"
    fi
}

require_pattern() {
    if grep -Eq -- "$2" "$1"; then
        pass "$1 matches: $2"
    else
        fail "$1 does not match: $2"
    fi
}

refute_pattern() {
    if grep -Eq -- "$2" "$1"; then
        fail "$1 must not match: $2"
    else
        pass "$1 does not match: $2"
    fi
}

expect_pass() {
    local description=$1
    shift
    if "$@" >/dev/null 2>&1; then
        pass "$description"
    else
        fail "$description (expected success, command failed)"
    fi
}

expect_fail() {
    local description=$1
    shift
    if "$@" >/dev/null 2>&1; then
        fail "$description (expected failure, command succeeded)"
    else
        pass "$description"
    fi
}

expect_message() {
    local description=$1 needle=$2
    shift 2
    local output
    output=$("$@" 2>&1)
    if (($? == 0)); then
        fail "$description (expected failure, command succeeded)"
        return
    fi
    if printf '%s' "$output" | grep -Fq -- "$needle"; then
        pass "$description"
    else
        fail "$description (expected message containing '$needle')"
    fi
}

copy_fixture() {
    case_counter=$((case_counter + 1))
    local target=$sandbox/case-$case_counter
    mkdir -p -- "$target"
    cp -r -- "$fixture" "$target/"
    printf '%s' "$target/${fixture##*/}"
}

validate() {
    bash "$repository_root/scripts/validate-session.sh" "$@"
}

# ---------------------------------------------------------------------------
# repository contract
# ---------------------------------------------------------------------------

printf '\n== repository contract ==\n'

for required in \
    .github/copilot-instructions.md \
    .github/skills/beryllium-analysis/SKILL.md \
    .github/agents/analysis-workbook.agent.md \
    .github/agents/analysis-evidence.agent.md \
    .github/agents/analysis-research.agent.md \
    AGENT-INTERFACE.md \
    RESEARCH-SOURCES.md \
    README.md \
    HANDOFF.md \
    WORKBOOK.md \
    SOURCE-DISCOVERY-LOG.md \
    outbox/pm-queue.md \
    .gitignore; do
    require_file "$repository_root/$required"
done

for template in question report summary evidence search-log open-questions \
    session planning source-discoveries inaccessible-resources \
    publication-checklist HANDOFF; do
    require_file "$repository_root/templates/$template.md"
done

for script in new-session new-inquiry readonly-inspect update-workbook \
    validate-session; do
    require_file "$repository_root/scripts/$script.sh"
    require_executable "$repository_root/scripts/$script.sh"
    expect_pass "scripts/$script.sh parses" bash -n "$repository_root/scripts/$script.sh"
done

expect_pass "tests/validate-agent.sh parses" bash -n "$repository_root/tests/validate-agent.sh"

printf '\n== agent and skill declarations ==\n'

orchestrator=$repository_root/.github/agents/analysis-workbook.agent.md
require_pattern "$orchestrator" '^name: analysis-workbook$'
require_pattern "$orchestrator" '^user-invocable: true$'
require_pattern "$orchestrator" '^disable-model-invocation: true$'
require_pattern "$orchestrator" '"ask_user"'

for specialist in analysis-evidence analysis-research; do
    file=$repository_root/.github/agents/$specialist.agent.md
    require_pattern "$file" "^name: $specialist\$"
    refute_pattern "$file" '"edit"'
    refute_pattern "$file" '"execute"'
done

require_pattern "$repository_root/.github/agents/analysis-research.agent.md" '"web"'
refute_pattern "$repository_root/.github/agents/analysis-evidence.agent.md" '"web"'

skill=$repository_root/.github/skills/beryllium-analysis/SKILL.md
require_pattern "$skill" '^name: beryllium-analysis$'
require_text "$skill" 'Planning'
require_text "$skill" 'Analysis'

printf '\n== boundary language ==\n'

instructions=$repository_root/.github/copilot-instructions.md
require_text "$instructions" 'read-only'
require_text "$instructions" 'not formally verified'
require_text "$instructions" 'NOT RUN'
require_text "$instructions" 'AWB-YYYYMMDD-NNN'
require_text "$instructions" 'append-only'
require_text "$instructions" 'private'

interface=$repository_root/AGENT-INTERFACE.md
require_text "$interface" 'pull'
require_text "$interface" 'outbox/pm-queue.md'

sources=$repository_root/RESEARCH-SOURCES.md
require_text "$sources" 'provenance-review'
require_text "$sources" 'bibliography.md'

for document in "$instructions" "$interface" "$sources" \
    "$repository_root/README.md" "$repository_root/HANDOFF.md" \
    "$repository_root/WORKBOOK.md" "$skill" "$orchestrator"; do
    refute_pattern "$document" '(^|[^A-Za-z0-9_])(/home/|/Users/|/root/)'
done

gitignore=$repository_root/.gitignore
require_text "$gitignore" 'inbox/'
require_text "$gitignore" 'scratch/'
require_text "$gitignore" 'sources/quarantine/'

# ---------------------------------------------------------------------------
# validator: positive cases
# ---------------------------------------------------------------------------

printf '\n== validator: accepts a well-formed package ==\n'

expect_pass "complete fixture passes completion validation" validate "$fixture"
expect_pass "complete fixture passes draft validation" validate --draft "$fixture"
expect_pass "complete fixture passes baseline validation against itself" \
    validate --baseline "$fixture" "$fixture"

# ---------------------------------------------------------------------------
# validator: negative cases
# ---------------------------------------------------------------------------

printf '\n== validator: rejects malformed packages ==\n'

case_dir=$(copy_fixture)
mv -- "$case_dir" "${case_dir%/*}/AWB-2000010-001-bad-id"
expect_message "rejects a malformed session directory name" \
    'session directory name must be' \
    validate "${case_dir%/*}/AWB-2000010-001-bad-id"

case_dir=$(copy_fixture)
rm -- "$case_dir/inquiries/Q-002/summary.md"
expect_message "rejects a missing inquiry artifact" \
    'required inquiry artifact is missing' validate --draft "$case_dir"

case_dir=$(copy_fixture)
rm -- "$case_dir/planning.md"
expect_message "rejects a missing session artifact" \
    'required session artifact is missing' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/AWB-20000101-001-E0002/AWB-20000101-001-E0099/' \
    "$case_dir/inquiries/Q-001/report.md"
expect_message "rejects a dangling evidence citation" \
    'not defined in any ledger' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/AWB-20000101-001-E0003/AWB-20000101-001-E0001/' \
    "$case_dir/inquiries/Q-002/evidence.md"
expect_message "rejects a duplicated evidence ID across inquiries" \
    'is already defined in' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i '/^| Q-002 |/d' "$case_dir/session.md"
expect_message "rejects an inquiry missing from the session index" \
    'is not listed in the inquiry index' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^Distribution: `private`$/Distribution: `internal`/' \
    "$case_dir/inquiries/Q-001/report.md"
expect_message "rejects inconsistent distribution across artifacts" \
    'Distribution must match the session package' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^Distribution: `private`$/Distribution: `internal`/' \
    "$case_dir"/*.md "$case_dir"/inquiries/*/*.md
expect_message "rejects promotion without a HUMAN-PROMOTION record" \
    'requires a completed HUMAN-PROMOTION-NNN record' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^Distribution: `private`$/Distribution: `public-candidate`/' \
    "$case_dir"/*.md "$case_dir"/inquiries/*/*.md
sed -i 's/^- \[ \]/- [x]/' "$case_dir/publication-checklist.md"
python3 - "$case_dir/publication-checklist.md" <<'PY'
import sys, pathlib
p = pathlib.Path(sys.argv[1])
t = p.read_text()
t = t.replace('| Record ID | None |', '| Record ID | HUMAN-PROMOTION-001 |')
for label, value in [
    ('Responsible human actor', 'Fixture human'),
    ('Responsible human role', 'Fixture role'),
    ('UTC timestamp', '2000-01-01T00:00:00Z'),
    ('From distribution', 'private'),
    ('To distribution', 'public-candidate'),
    ('Decision', 'promote'),
    ('Checklist basis', 'Fixture checklist'),
    ('Evidence IDs', 'AWB-20000101-001-E0001'),
    ('Limitations', 'Synthetic fixture.'),
]:
    t = t.replace(f'| {label} | Not recorded |', f'| {label} | {value} |')
p.write_text(t)
PY
sed -i 's/| public | approved |/| private | approved |/' \
    "$case_dir/inquiries/Q-001/evidence.md"
expect_message "rejects public-candidate carrying private evidence" \
    'public-candidate is blocked by' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's|`fixture://surface-one`|/home/example/checkout/surface-one|' \
    "$case_dir/inquiries/Q-001/report.md"
expect_message "rejects an absolute workstation path" \
    'absolute workstation path' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^- Confidence: High$/- Confidence: Low/' \
    "$case_dir/inquiries/Q-001/report.md"
expect_message "rejects a Low-confidence finding" \
    'belongs in Hypotheses' validate "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^- Evidence IDs: AWB-20000101-001-E0001.*$/- Evidence IDs: none/' \
    "$case_dir/inquiries/Q-001/report.md"
expect_message "rejects a finding with no evidence" \
    'must cite at least one evidence ID' validate "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^Topic: Fixture topic A$/Topic: @@TOPIC@@/' \
    "$case_dir/inquiries/Q-001/report.md"
expect_message "rejects an unsubstituted template token" \
    'unsubstituted template token' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/| Local implementation | Direct |/| Invented class | Direct |/' \
    "$case_dir/inquiries/Q-001/evidence.md"
expect_message "rejects an invalid evidence class" \
    'invalid Class' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/| ACTIVITY-002 | 2000-01-01 | Analysis agent | Condensed/| ACTIVITY-2 | 2000-01-01 | Analysis agent | Condensed/' \
    "$case_dir/inquiries/Q-001/summary.md"
expect_message "rejects a malformed activity ID" \
    'activity ID must be ACTIVITY-NNN' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^- Publication decision: not-requested$/- Publication decision: granted/' \
    "$case_dir/publication-checklist.md"
expect_message "rejects a granted publication decision" \
    'never record a granted' validate --draft "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^Status: `Complete`$/Status: `Draft`/' "$case_dir/session.md"
expect_message "rejects an incomplete session in completion mode" \
    'Status must be Complete' validate "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/^- Scope freeze: Complete$/- Scope freeze: Incomplete/' \
    "$case_dir/session.md"
expect_message "rejects an incomplete required phase" \
    "phase 'Scope freeze' must be Complete" validate "$case_dir"

case_dir=$(copy_fixture)
sed -i 's/marker value zero/marker value one/' \
    "$case_dir/inquiries/Q-001/evidence.md"
expect_message "rejects an edited append-only evidence row" \
    'was changed or removed' validate --baseline "$fixture" "$case_dir"

case_dir=$(copy_fixture)
sed -i '/^| ACTIVITY-003 |/d' "$case_dir/session.md"
expect_message "rejects a deleted append-only activity row" \
    'was changed or removed' validate --baseline "$fixture" "$case_dir"

case_dir=$(copy_fixture)
printf '| ACTIVITY-005 | 2000-01-02 | Analysis agent | Appended a later record. | None | Synthetic fixture. |\n' \
    >>"$case_dir/session.md"
expect_pass "accepts an appended activity row" \
    validate --baseline "$fixture" "$case_dir"

# ---------------------------------------------------------------------------
# scaffolding
# ---------------------------------------------------------------------------

printf '\n== scaffolding ==\n'

scaffold_root=$sandbox/scaffold
mkdir -p -- "$scaffold_root/sessions"
cp -r -- "$repository_root/scripts" "$repository_root/templates" "$scaffold_root/"

new_session=$scaffold_root/scripts/new-session.sh
new_inquiry=$scaffold_root/scripts/new-inquiry.sh

expect_fail "new-session.sh rejects a missing argument" bash "$new_session"
expect_fail "new-session.sh rejects an uppercase slug" \
    bash "$new_session" Bad-Slug "A title"
expect_fail "new-session.sh rejects a slug with underscores" \
    bash "$new_session" bad_slug "A title"
expect_fail "new-session.sh rejects a title containing a template token" \
    bash "$new_session" good-slug "@@TITLE@@"

first_session=$(bash "$new_session" first-aspect "First aspect")
if [[ $first_session == sessions/AWB-*-001-first-aspect ]]; then
    pass "new-session.sh allocates the first session ID of the day"
else
    fail "new-session.sh returned an unexpected path: $first_session"
fi

second_session=$(bash "$new_session" second-aspect "Second aspect")
if [[ $second_session == sessions/AWB-*-002-second-aspect ]]; then
    pass "new-session.sh allocates a colliding session ID safely"
else
    fail "new-session.sh returned an unexpected path: $second_session"
fi

expect_pass "a scaffolded session passes draft validation" \
    validate --draft "$scaffold_root/$first_session"
expect_fail "a scaffolded session fails completion validation" \
    validate "$scaffold_root/$first_session"

expect_fail "new-inquiry.sh rejects a directory outside sessions/" \
    bash "$new_inquiry" "$sandbox" some-question "A question"
expect_fail "new-inquiry.sh rejects an uppercase slug" \
    bash "$new_inquiry" "$scaffold_root/$first_session" Bad "A question"

first_inquiry=$(bash "$new_inquiry" "$scaffold_root/$first_session" \
    question-one "Question one")
second_inquiry=$(bash "$new_inquiry" "$scaffold_root/$first_session" \
    question-two "Question two")

if [[ $first_inquiry == */Q-001 && $second_inquiry == */Q-002 ]]; then
    pass "new-inquiry.sh allocates sequential inquiry IDs"
else
    fail "new-inquiry.sh returned unexpected paths: $first_inquiry $second_inquiry"
fi

session_file=$scaffold_root/$first_session/session.md
if grep -Fq '| Q-001 | Question one | Draft |' "$session_file" &&
    grep -Fq '| Q-002 | Question two | Draft |' "$session_file" &&
    ! grep -Fq '| None | No question has been opened.' "$session_file"; then
    pass "new-inquiry.sh maintains the session inquiry index"
else
    fail "new-inquiry.sh did not maintain the session inquiry index"
fi

expect_pass "a scaffolded session with inquiries passes draft validation" \
    validate --draft "$scaffold_root/$first_session"

# ---------------------------------------------------------------------------
# workbook
# ---------------------------------------------------------------------------

printf '\n== workbook ==\n'

expect_pass "update-workbook.sh regenerates the workbook" \
    bash "$scaffold_root/scripts/update-workbook.sh"
expect_pass "update-workbook.sh --check accepts a current workbook" \
    bash "$scaffold_root/scripts/update-workbook.sh" --check

workbook=$scaffold_root/WORKBOOK.md
for needle in '## Sessions' '## By topic' '## Chronological' \
    'AWB-' 'Q-001' 'Q-002'; do
    require_text "$workbook" "$needle"
done

printf 'stale marker\n' >>"$workbook"
expect_fail "update-workbook.sh --check detects a stale workbook" \
    bash "$scaffold_root/scripts/update-workbook.sh" --check

expect_pass "the committed WORKBOOK.md is current" \
    bash "$repository_root/scripts/update-workbook.sh" --check

# ---------------------------------------------------------------------------
# read-only inspection
# ---------------------------------------------------------------------------

printf '\n== read-only inspection ==\n'

inspect=$repository_root/scripts/readonly-inspect.sh

expect_fail "readonly-inspect.sh rejects a missing mode" bash "$inspect"
expect_fail "readonly-inspect.sh rejects an unknown mode" \
    bash "$inspect" write ../helium-te-poc
expect_message "readonly-inspect.sh refuses to target this repository" \
    'targets sibling components' bash "$inspect" state "$repository_root"
expect_fail "readonly-inspect.sh rejects a path outside the component" \
    bash "$inspect" show ../helium-te-poc HEAD ../escape
expect_fail "readonly-inspect.sh rejects a .git path" \
    bash "$inspect" show ../helium-te-poc HEAD .git/config
expect_fail "readonly-inspect.sh rejects a malformed revision" \
    bash "$inspect" resolve ../helium-te-poc '--upload-pack=touch'
expect_pass "readonly-inspect.sh lists the component inventory" \
    bash "$inspect" components

if bash "$inspect" components 2>/dev/null | grep -q '^provenance-review'; then
    pass "readonly-inspect.sh reports the provenance-review component"
else
    fail "readonly-inspect.sh did not report the provenance-review component"
fi

# ---------------------------------------------------------------------------

printf '\n%d passed, %d failed\n' "$pass_count" "$fail_count"
((fail_count == 0)) || exit 1
