# What Is the CHERI-Native Authority Model? - Open questions

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-001`
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
| OPEN-001 | Must any hypervisor authority be unique or linear rather than copyable? | Several protocols are easier to prove with uniqueness, but CHERI capabilities are generally copyable. | No | The model claims explicit bounded delegation but not uniqueness unless an additional nucleus-managed token protocol enforces it. | Deferred to target-specific formalization. | 2026-09-14 | Open |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded the copyability-versus-linearity question. | The draft avoids relying on capability uniqueness. |
