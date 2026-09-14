# CHERI-Native Hypervisor Security Model - Inaccessible resources

Session ID: `AWB-20260914-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Resources that could not be read. Record the block; never bypass a control and
never imply the contents of a resource that was not read.

## Blocked resources

| Blocked ID | Resource | Logical locator or URL | Access result | Alternatives tried | Priority | What a user-supplied copy would confirm | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| BLOCKED-001 | Bao-CHERI implementation artifact announced as public | Unknown; abstract at `https://cfp.riscv-europe.org/eu-summit-2026/talk/JFUNQZ/` | not found | Reused the prior session's source and repository searches; no exact public artifact locator was established. | High | Whether Bao-CHERI implements generation, hardware-resource correspondence, service decomposition, or only a pure-capability port. | 2026-09-14 |
| BLOCKED-002 | CHERI-Microkit VMM implementation | CHERI-seL4 RFC and ordinary Microkit VMM records | not found | Checked the prior session's bounded search result and current seL4 RFC index. | Medium | Whether CHERI capability enforcement has been connected to a maintained Microkit VMM and what proof claims survive. | 2026-09-14 |
| BLOCKED-003 | Delivered CHERI-Hafnium implementation | CHaOS project records and ordinary Hafnium source | not found | Reused prior direct-source searches; no delivered implementation was established. | High | Whether a CHERI-secured partition manager addresses stage-2, devices, lifecycle, and service compartmentalization. | 2026-09-14 |

`Access result` is one of `paywalled`, `authentication required`,
`robots disallowed`, `licence restricted`, `not found`, `withdrawn`,
`unreachable`, or `out of scope`.

`Priority` is `High`, `Medium`, or `Low`, judged by how much the missing
resource would change the answer.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created the inaccessible-resource record. | No blocked resource has been recorded. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Carried forward three architecture-significant inaccessible artifacts. | The security model remains explicitly provisional where direct implementations are missing. |
