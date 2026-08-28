# Fixture aspect - Inaccessible resources

Session ID: `AWB-20000101-001`
Distribution: `private`
Created: `2000-01-01`
Status: `Complete`

Resources that could not be read. Record the block; never bypass a control and
never imply the contents of a resource that was not read.

## Blocked resources

| Blocked ID | Resource | Logical locator or URL | Access result | Alternatives tried | Priority | What a user-supplied copy would confirm | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| BLOCKED-001 | Fixture blocked resource | `fixture://blocked` | paywalled | Fixture alternative index | Low | Nothing; the fixture is synthetic. | 2000-01-01 |

`Access result` is one of `paywalled`, `authentication required`,
`robots disallowed`, `licence restricted`, `not found`, `withdrawn`,
`unreachable`, or `out of scope`.

`Priority` is `High`, `Medium`, or `Low`, judged by how much the missing
resource would change the answer.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2000-01-01 | Session scaffolder | Created the inaccessible-resource record. | Synthetic fixture. |
| ACTIVITY-002 | 2000-01-01 | Analysis agent | Recorded BLOCKED-001. | Synthetic fixture. |
