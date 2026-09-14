# Which Lifecycle Traces Falsify the Model? - Open questions

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-003`
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
| OPEN-003 | Which failures must preserve availability rather than only isolation? | Fail-closed safety may permit denial of service that an operational hypervisor cannot tolerate. | No | The current model prioritizes isolation and recoverable state over availability. | Deferred to a target threat model and service-level requirements. | 2026-09-14 | Open |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded the safety-versus-availability question. | Falsification tests currently prioritize isolation. |
