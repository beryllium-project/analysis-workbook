# What Would a CHERI Equivalent to Helium Require for Direct Comparison? - Open questions

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-005`
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
| OPEN-005 | Which exact Helium commit and evidence bundle is the comparator baseline? | Direct comparison requires one immutable reference. | No | The plan names candidate `ed1545155c8d09aa75803a256eee0d2fa8844b91` only as an existing frozen reference, not an approved baseline. | Requires responsible-human selection. | 2026-09-14 | Open |
| OPEN-006 | Which CHERI platform and virtualization profile can reproduce the bounded Helium scenario? | Capability state, G-stage behavior, toolchains, and emulation determine comparability. | No | No target or implementation is selected. | Deferred to a separately authorized implementation-planning session. | 2026-09-14 | Open |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded baseline and target selection questions. | Neither blocks the research plan; both block implementation. |
