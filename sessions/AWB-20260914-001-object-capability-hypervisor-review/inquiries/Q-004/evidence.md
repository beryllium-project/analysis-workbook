# What Should Beryllium Retain? - Evidence

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-004`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Observations only. What a source says belongs here; what follows from it
belongs in `report.md`.

Evidence IDs are `AWB-20260914-001-E####`, unique within the session and never
reused or renumbered. This ledger is append-only; a correction adds a
superseding row and cites the row it supersedes.

## Ledger

| Evidence ID | Class | Role | Logical locator | Revision or checked date | Observation | Sensitivity | Redistribution | Limitation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AWB-20260914-001-E0026 | Local implementation | Direct | `component://beryllium-repo/planning/cheri-alignment.md`; `component://beryllium-repo/planning/architecture-model-0.2.md` | `65f6d895a2007e8e093582cc48726375fd23b563`, checked 2026-09-14 | Beryllium keeps CHERI as future alignment, uses non-CHERI software mechanisms in its current bounded runtime, and has not selected a capability or policy framework. | private | not-approved | R8-H0 is committed but not accepted; H1-H4 are unauthorized and K3 is `NOT RUN`. |
| AWB-20260914-001-E0027 | Local research | Corroborating | `component://xrv-research-repo/cheri-hypervisor-research-survey.md`; Q-001 through Q-003 | XRV `ca41490`; checked 2026-09-14 | The strongest evidence-backed research seam is comparison of CHERI-native aspirations with deployed software object-capability hypervisors such as NOVA, Hedron, L4Re, and seL4-based VMMs. | private | not-approved | This is a research comparison seam, not a design selection. |
| AWB-20260914-001-E0028 | Local coordination | Direct | `component://project-manager/queue/LEDGER.md`; `component://xrv-research-repo/review-log.md` | PM `b2bbbf14a94a471060cd580eeb1de5a7e917a7d8`; XRV `ca41490` | XRV's historical `7314e2f` intake records are absent from its current canonical repository, so new owner coordination must preserve the loss record and avoid reusing review IDs. | private | not-approved | The Project Manager, not this session, coordinates XRV updates. |
| AWB-20260914-001-E0029 | Local coordination | Contextual | `component://analysis-workbook/AGENT-INTERFACE.md`; user clarification 2026-09-14 | Checked 2026-09-14 | Analysis-workbook routes discoveries through a pull-only queue; the user directed the Project Manager to coordinate later XRV updates. | private | not-applicable | Queueing a source does not admit it to XRV or approve its conclusions. |
| AWB-20260914-001-E0030 | Local research | Negative | Q-001 through Q-003 evidence set | Checked 2026-09-14 | The review supplies no evidence basis for selecting, chartering, or implementing a CHERI PoC now; artifact availability, target hardware, H-extension integration, threat model, and evaluation criteria remain open. | private | not-approved | PoC planning was explicitly excluded from scope. |

`Class` is one of `Local implementation`, `Local assurance`,
`Local coordination`, `Local research`, `Local provenance`, `External primary`,
`External secondary`, or `User-supplied`.

`Role` is one of `Direct`, `Corroborating`, `Contextual`, `Counter`, or
`Negative`.

`Sensitivity` is one of `public`, `internal`, `private`, or `restricted`.

`Redistribution` is one of `approved`, `not-approved`, `unknown`, or
`not-applicable`.

## Superseded records

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the evidence ledger. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded bounded Beryllium implications and coordination evidence. | Five evidence records added. |
