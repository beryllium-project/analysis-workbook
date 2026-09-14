# Does the Restored Formal Verification Repository Change the Finding? - Evidence

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-13`
Status: `Complete`

Observations only. What a source says belongs here; what follows from it
belongs in `report.md`.

Evidence IDs are `AWB-20260913-001-E####`, unique within the session and never
reused or renumbered. This ledger is append-only; a correction adds a
superseding row and cites the row it supersedes.

## Ledger

| Evidence ID | Class | Role | Logical locator | Revision or checked date | Observation | Sensitivity | Redistribution | Limitation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AWB-20260913-001-E0009 | Local research | Direct | `component://formal-verification-research/` | `e5740dee976e7ea1e3b64be1450da854bbacf128`, checked 2026-09-13 | The restored component is a clean `main` checkout at the same revision previously recorded by coordination history, so its committed evidence is now available for review. | private | not-approved | Supersedes only the access-status observation in AWB-20260913-001-E0008, not the historical fact that the checkout was unavailable during Q-001. |
| AWB-20260913-001-E0010 | Local research | Negative | `component://formal-verification-research/workstreams/beryllium/` | `e5740dee976e7ea1e3b64be1450da854bbacf128`, checked 2026-09-13 | The Beryllium verification workstream, including its strategy, verified-systems survey, codebase assessment, seL4-grade estimate, separation-kernel study, and scaffolding plan, contains no pure-CHERI, CHERI-only, or pure-capability hypervisor proposal. It evaluates verification of the non-CHERI Helium/Beryllium path and treats CHERIoT as methodology precedent. | private | not-approved | Focused terminology and relevant-file review; absence does not prove that no informal discussion occurred elsewhere. |
| AWB-20260913-001-E0011 | Local research | Contextual | `component://formal-verification-research/notes/cheriot.md`; `component://formal-verification-research/comparison/summary.md`; `component://formal-verification-research/HANDOFF.md` | `e5740dee976e7ea1e3b64be1450da854bbacf128`, checked 2026-09-13 | The repository discusses CHERIoT capability enforcement and auditable composition as verification and design precedent, but does not turn that precedent into a proposal for a pure-CHERI Beryllium hypervisor. | private | not-approved | CHERIoT is an embedded compartmentalization comparison, not direct evidence about a Beryllium hypervisor variant. |

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
| ACTIVITY-001 | 2026-09-13 | Inquiry scaffolder | Created the evidence ledger. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Recorded restored-repository evidence. | Three evidence records added; E0009 supersedes the prior access-status limitation. |
