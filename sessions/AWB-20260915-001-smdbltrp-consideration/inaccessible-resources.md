# Smdbltrp consideration across Beryllium and Helium - Inaccessible resources

Session ID: `AWB-20260915-001`
Distribution: `private`
Created: `2026-09-15`
Status: `Complete`

Resources that could not be read. Record the block; never bypass a control and
never imply the contents of a resource that was not read.

## Blocked resources

| Blocked ID | Resource | Logical locator or URL | Access result | Alternatives tried | Priority | What a user-supplied copy would confirm | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| BLOCKED-001 | Standalone Smdbltrp and Ssdbltrp pages in the RISC-V privileged documentation edition dated 2024-04-11 | https://docs.riscv.org/reference/isa/v20240411/priv/ | not found | Checked both expected standalone page names; used the ratified v1.0 tagged specification and release history instead | Low | Whether that older rendered edition exposed the extensions as standalone pages; the ratified release chronology already establishes the operative date | 2026-09-15 |

`Access result` is one of `paywalled`, `authentication required`,
`robots disallowed`, `licence restricted`, `not found`, `withdrawn`,
`unreachable`, or `out of scope`.

`Priority` is `High`, `Medium`, or `Low`, judged by how much the missing
resource would change the answer.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-15 | Session scaffolder | Created the inaccessible-resource record. | No blocked resource has been recorded. |
| ACTIVITY-002 | 2026-09-15 | Analysis orchestrator | Closed the resource-access check. | Two superseded-edition page requests returned not found; no material source remained inaccessible after the tagged specification and upstream records were retrieved. |
