# Analysis workbook - Handoff

Component: `analysis-workbook`
Status: `Ready for first analysis session; pushed to private origin`
Updated: `2026-08-28`

## Overall position

The component is complete and self-validating. It contains the
`analysis-workbook` agent, two write-disabled specialist agents, the
`beryllium-analysis` workflow skill, twelve artifact templates, five
maintained scripts, a session validator, and a contract test suite.

No analysis session has been run yet. `sessions/` contains no packages and
`WORKBOOK.md` records none.

## What exists

| Area | Location | State |
| --- | --- | --- |
| Contract | `.github/copilot-instructions.md` | Written |
| Workflow | `.github/skills/beryllium-analysis/SKILL.md` | Written |
| Orchestrator | `.github/agents/analysis-workbook.agent.md` | Written |
| Specialists | `.github/agents/analysis-evidence.agent.md`, `.github/agents/analysis-research.agent.md` | Written, write-disabled |
| Source order | `RESEARCH-SOURCES.md` | Written |
| Interfaces | `AGENT-INTERFACE.md` | Written |
| Templates | `templates/` | 12 files |
| Scripts | `scripts/` | 5 files, executable |
| Tests | `tests/validate-agent.sh`, `tests/fixtures/valid-session/` | Passing |
| Index | `WORKBOOK.md` | Generated, empty |
| Discovery | `SOURCE-DISCOVERY-LOG.md`, `outbox/pm-queue.md` | Empty |
| Remote | private `beryllium-project/analysis-workbook` | `main` pushed and synchronized |

## Blockers

None.

The Git remote `https://github.com/beryllium-project/analysis-workbook.git` is
a private repository in the `beryllium-project` organization, alongside
`helium-te-poc` and `provenance-review`. `main` was pushed on 2026-08-28 and
the local and remote trees match exactly at 55 tracked files. The previously
recorded account mismatch does not apply here: the authenticated account is a
member of that organization.

The ignored directories did not leak. Only the intentional policy `README.md`
files under `inbox/`, `scratch/`, `sources/public/`, `sources/metadata/`, and
`sources/quarantine/` are present on the remote.

## Exact next action

Start the first analysis session:

```sh
/agent analysis-workbook
```

Describe the aspect of Beryllium you want analyzed and give at least one
question. The agent stays in planning until you confirm the scope.

## Validation

All of the following pass as of 2026-08-28:

```sh
bash ./tests/validate-agent.sh
bash ./scripts/update-workbook.sh --check
git diff --check
```

To validate a session package once one exists:

```sh
bash ./scripts/validate-session.sh --draft sessions/AWB-YYYYMMDD-NNN-short-name
bash ./scripts/validate-session.sh sessions/AWB-YYYYMMDD-NNN-short-name
```

## For the Project Manager

Pull from [outbox/pm-queue.md](outbox/pm-queue.md). It is empty. Nothing in
this component requires a decision, a review, or a sign-off from any other
component at this time.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-28 | analysis-workbook | Built the component and its validation. | No analysis session has been run. |
| ACTIVITY-002 | 2026-08-28 | analysis-workbook | Created the private origin repository and pushed `main`. | Remote tree matches the local tree; no analysis session has been run. |
