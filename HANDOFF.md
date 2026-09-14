# Analysis workbook - Handoff

Component: `analysis-workbook`
Status: `Active; three completed analysis sessions and three pull-only outbox interfaces`
Updated: `2026-09-14`

## Overall position

The component remains self-validating. It contains three complete private
analysis sessions, the generated workbook index, the source-discovery log and
PM queue, a dedicated Helium-to-Beryllium method-transfer queue, and a
cross-component collaboration-request queue.

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
| Interfaces | `AGENT-INTERFACE.md` | Three explicit pull-only outbox protocols |
| Templates | `templates/` | 12 files |
| Scripts | `scripts/` | 6 files, executable |
| Tests | `tests/validate-agent.sh`, `tests/fixtures/valid-session/` | Contract coverage includes the transfer queue |
| Index | `WORKBOOK.md` | Generated; three sessions and seven inquiries |
| Source discovery | `SOURCE-DISCOVERY-LOG.md`, `outbox/pm-queue.md` | 21 source pointers in the source-discovery workflow |
| Method transfer | `outbox/helium-transfer-queue.md` | HET-001 is `new` and `unaccepted` |
| Collaboration requests | `outbox/collaboration-requests.md` | CRQ-001 requests an XRV owner collaboration interface |
| Repository state | `main` | Local analysis and interface changes are uncommitted |

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

The XRV collaboration interface is owner-blocked. CRQ-001 asks the Project
Manager to coordinate the XRV owner change after reconciling the missing
`7314e2f` and `REV-20260904-001..009` history.

HET-001 intentionally remains pending Beryllium-side triage. That open
lifecycle state is not a blocker and must not be converted into an adoption,
planning approval, responsible-human review, release, or assurance claim.

## Exact next action

The Project Manager should pull CRQ-001, record the XRV owner request, and
coordinate the owner-side collaboration interface and PMQ-017..020 intake
without editing XRV research.

## Validation

Latest local validation for the collaboration-interface change:

- completed-session validation: passed;
- Helium transfer queue validation: passed;
- repository contract suite: 182 passed, 8 pre-existing transfer-transition
  fixture failures;
- `git diff --check`: required before handoff.

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
- Pull owner-boundary collaboration requests from
  [outbox/collaboration-requests.md](outbox/collaboration-requests.md).

The queues have different schemas and authority. HET-001 is an unaccepted
triage input and does not authorize a write to Helium or Beryllium.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-28 | analysis-workbook | Built the component and its validation. | No analysis session had been run. |
| ACTIVITY-002 | 2026-08-28 | analysis-workbook | Created the private origin repository and pushed `main`. | The initial component state was backed up. |
| ACTIVITY-003 | 2026-08-29 | analysis-workbook | Completed the first private analysis session and populated the source-discovery queue. | The session produced analysis and source pointers, not decisions or approvals. |
| ACTIVITY-004 | 2026-09-04 | analysis-workbook | Added the dedicated Helium method-transfer interface and HET-001. | HET-001 is `new` and `unaccepted`; no sibling component was modified. |
| ACTIVITY-005 | 2026-09-14 | analysis-workbook | Completed two additional private analysis sessions and added CRQ-001. | XRV collaboration setup is specified and queued; no sibling component was modified. |
