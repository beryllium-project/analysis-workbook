# Analysis workbook - Handoff

Component: `analysis-workbook`
Status: `Active; one completed analysis session and two pull-only outbox interfaces`
Updated: `2026-09-04`

## Overall position

The component remains self-validating. It contains one complete private
analysis session, the generated workbook index, the source-discovery log and
PM queue, and a dedicated Helium-to-Beryllium method-transfer queue.

The method-transfer queue starts with HET-001, which records the 2026-09-04
user direction that Helium Tier 8 is the FV endpoint and presents reusable FV
methods for Beryllium-side triage. HET-001 is `new` and `unaccepted`. It is
not a Beryllium plan, adoption, approval, review, release, or assurance claim.

## What exists

| Area | Location | State |
| --- | --- | --- |
| Contract | `.github/copilot-instructions.md` | Written |
| Workflow | `.github/skills/beryllium-analysis/SKILL.md` | Written |
| Orchestrator | `.github/agents/analysis-workbook.agent.md` | Written |
| Specialists | `.github/agents/analysis-evidence.agent.md`, `.github/agents/analysis-research.agent.md` | Written, write-disabled |
| Source order | `RESEARCH-SOURCES.md` | Written |
| Interfaces | `AGENT-INTERFACE.md` | Two explicit pull-only outbox protocols |
| Templates | `templates/` | 12 files |
| Scripts | `scripts/` | 6 files, executable |
| Tests | `tests/validate-agent.sh`, `tests/fixtures/valid-session/` | Contract coverage includes the transfer queue |
| Index | `WORKBOOK.md` | Generated; one session and one inquiry |
| Source discovery | `SOURCE-DISCOVERY-LOG.md`, `outbox/pm-queue.md` | 16 source pointers remain in the source-discovery workflow |
| Method transfer | `outbox/helium-transfer-queue.md` | HET-001 is `new` and `unaccepted` |
| Repository state | `main` | Transfer-interface candidate prepared against base commit `2261659a88e16992638e6cc8e64410b0ddd91087` |

## Current transfer input

HET-001 is anchored to the frozen Helium Tier 8 H6 candidate
`ed1545155c8d09aa75803a256eee0d2fa8844b91` and
`component://helium-te-poc/docs/fv-pathfinder-lessons.md`.

The item says:

- Tier 8 is the Helium FV endpoint; do not create Tier 9 merely to increase
  claim or evidence counts.
- Transfer candidate method, not Helium's fixed profile or constants.
- Candidate lessons cover a stable security-significant production seam,
  pure/effect separation, independent extensional specification, explicit
  rollback and failure relations, mutation planning before acceptance, exact
  evidence and provenance, adjacent residual assumptions, and separate human
  gates.
- Beryllium must perform its own triage and record any result under its own
  planning, review, and acceptance controls.

## Blockers

No repository-maintenance blocker is known.

HET-001 intentionally remains pending Beryllium-side triage. That open
lifecycle state is not a blocker and must not be converted into an adoption,
planning approval, responsible-human review, release, or assurance claim.

## Exact next action

The Project Manager or responsible human should pull HET-001, route it to the
Beryllium owner for triage, and record the exact owner-side request or
disposition before this repository mirrors any lifecycle change.

## Validation

Use:

```sh
bash ./tests/validate-agent.sh
bash ./scripts/validate-helium-transfer-queue.sh
bash ./scripts/update-workbook.sh --check
git diff --check
```

To validate a session package:

```sh
bash ./scripts/validate-session.sh --draft sessions/AWB-YYYYMMDD-NNN-short-name
bash ./scripts/validate-session.sh sessions/AWB-YYYYMMDD-NNN-short-name
```

## For the Project Manager

- Pull source-discovery pointers from
  [outbox/pm-queue.md](outbox/pm-queue.md).
- Pull Helium method-transfer inputs from
  [outbox/helium-transfer-queue.md](outbox/helium-transfer-queue.md).

The queues have different schemas and authority. HET-001 is an unaccepted
triage input and does not authorize a write to Helium or Beryllium.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-28 | analysis-workbook | Built the component and its validation. | No analysis session had been run. |
| ACTIVITY-002 | 2026-08-28 | analysis-workbook | Created the private origin repository and pushed `main`. | The initial component state was backed up. |
| ACTIVITY-003 | 2026-08-29 | analysis-workbook | Completed the first private analysis session and populated the source-discovery queue. | The session produced analysis and source pointers, not decisions or approvals. |
| ACTIVITY-004 | 2026-09-04 | analysis-workbook | Added the dedicated Helium method-transfer interface and HET-001. | HET-001 is `new` and `unaccepted`; no sibling component was modified. |
