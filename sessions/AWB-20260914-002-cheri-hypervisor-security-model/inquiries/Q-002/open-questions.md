# How Must Capability Authority Correspond to Hardware Resources? - Open questions

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Clarifying questions raised while analyzing. A `Blocking` question pauses the
analysis and is asked immediately. A `Non-blocking` question is recorded with
the assumption used in its place, and is surfaced in the summary and the chat
reply.

Never invent an answer, and never let an assumption reach a conclusion without
being labelled as one.

## Questions

| Open ID | Question | Why it matters | Blocking | Assumption in use | Answer | Answered on | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| OPEN-002 | Which target platform defines the exact completion and ordering rules for CPU translation, IOMMU invalidation, interrupt routing, and device reset? | The abstract correspondence model must later refine to concrete hardware semantics. | No | The model requires explicit target-specific completion predicates and makes no timing claim. | Deferred until a target is selected. | 2026-09-14 | Open |

`Blocking` is `Yes` or `No`. `Status` is `Open`, `Answered`, `Superseded`, or
`Withdrawn`.

## Superseded records

An answer that changes an earlier one appends a superseding row rather than
overwriting it.

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the open-questions record. | No question has been recorded. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded the target-specific ordering question. | Abstract safety predicates remain usable without selecting hardware. |
