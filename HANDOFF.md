# Analysis workbook - Handoff

Component: `analysis-workbook`
Status: `Active; four completed analysis sessions and three pull-only outbox interfaces`
Updated: `2026-09-14`

## Overall position

The component remains self-validating. It contains four complete private
analysis sessions, the generated workbook index, the source-discovery log and
PM queue, a dedicated Helium-to-Beryllium method-transfer queue, and a
cross-component collaboration-request queue.

`AWB-20260914-002` defines a proposed CHERI-native decomposed-hypervisor
security model, hardware-resource correspondence invariants, lifecycle
falsification tests, a layered assurance plan, and a possible future
Helium-to-CHERI parity comparator. It selects no target or implementation and
makes no completed formal-verification claim.

The method-transfer queue starts with HET-001, which records the 2026-09-04
user direction that Helium Tier 8 is the FV endpoint and presents reusable FV
methods for Beryllium-side triage. HET-001 is `recorded` and `unaccepted`. It
is not a Beryllium plan, adoption, approval, review, release, or assurance
claim.

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
| Index | `WORKBOOK.md` | Generated; four sessions and twelve inquiries |
| Source discovery | `SOURCE-DISCOVERY-LOG.md`, `outbox/pm-queue.md` | 26 source pointers in the source-discovery workflow |
| Method transfer | `outbox/helium-transfer-queue.md` | HET-001 is `recorded` and `unaccepted` |
| Collaboration requests | `outbox/collaboration-requests.md` | CRQ-001 is `routed`, mirrored from Project Manager request `PMR-034` |
| Security-model research | `sessions/AWB-20260914-002-cheri-hypervisor-security-model/` | Five complete inquiries, 47 evidence records, and three proposed models; Fable/Codex review complete |
| Repository state | `main` | New research session and PMQ-022..026 are validated and local-only pending commit |

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

CRQ-001 has been routed through Project Manager request `PMR-034`. Its queue
status is a maintainer-written mirror of that exact record, not a Project
Manager write and not evidence that the XRV owner work is complete.

HET-001 intentionally remains pending Beryllium-side triage. That open
lifecycle state is not a blocker and must not be converted into an adoption,
planning approval, responsible-human review, release, or assurance claim.

The new security model is research input, not an implementation authorization.
A later Helium-to-CHERI comparator requires responsible-human selection of one
exact Helium baseline and a separately approved CHERI target.

## Exact next action

After final session validation, the Project Manager should pull
`PMQ-022..026`. The XRV owner should separately review the security model and
correspondence documents as proposed architecture; no XRV incorporation or
Helium-to-CHERI implementation is implied.

## Validation

Latest local validation:

- AWB-20260914-002 complete-session validation: passed with five inquiries and
  47 evidence records;
- Helium transfer queue validation: passed;
- repository contract suite: 182 passed, 8 pre-existing transfer-transition
  fixture failures;
- generated workbook check: passed;
- `git diff --check`: passed.

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
| ACTIVITY-006 | 2026-09-14 | analysis-workbook | Corrected the CRQ status-writer contract under PMR-036 and mirrored CRQ-001 as `routed` from PMR-034. | The Project Manager record remains authoritative; no owner completion or acceptance is inferred. |
| ACTIVITY-007 | 2026-09-14 | analysis-workbook | Completed AWB-20260914-002 and queued five formal-verification source pointers. | The session proposes a CHERI security model and Helium parity comparator; no implementation, proof, or approval is claimed. |
