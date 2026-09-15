# Smdbltrp consideration and coverage gaps - Open questions

Session ID: `AWB-20260915-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-15`
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
| OPEN-001 | Does the intended K3/X100 hardware and firmware stack implement and enable Ssdbltrp or Smdbltrp? | This determines whether the architectural mechanism can be part of the deployed mitigation or only a future compatibility consideration. | No | Treat implementation and enablement as unknown; do not infer them from upstream QEMU, Spike, or OpenSBI support. | Not answered | Not applicable | Open |
| OPEN-002 | Should a future Beryllium review explicitly classify Ssdbltrp and Smdbltrp as used, deferred, verified, or unsupported? | The current hardware inventory states that every relevant security feature should receive such a disposition, but the family has no named row. | No | Treat the missing named disposition as a planning gap, while recognizing that generic optional-state fail-closed rows may partially cover it. | Not answered | Not applicable | Open |

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
| ACTIVITY-001 | 2026-09-15 | Inquiry scaffolder | Created the open-questions record. | No question has been recorded. |
| ACTIVITY-002 | 2026-09-15 | Analysis orchestrator | Recorded two non-blocking implementation and planning questions. | Analysis proceeds with platform support unknown and no inferred project decision. |
