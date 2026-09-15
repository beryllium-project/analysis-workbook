# Object-Capability Hypervisor Review - Inaccessible resources

Session ID: `AWB-20260914-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Resources that could not be read. Record the block; never bypass a control and
never imply the contents of a resource that was not read.

## Blocked resources

| Blocked ID | Resource | Logical locator or URL | Access result | Alternatives tried | Priority | What a user-supplied copy would confirm | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| BLOCKED-001 | Bao-CHERI implementation artifact announced as public | Unknown; abstract at `https://cfp.riscv-europe.org/eu-summit-2026/talk/JFUNQZ/` | not found | Checked the abstract, ordinary Bao upstream, repository and branch query variants, and existing XRV indexes. | High | Exact source, revision, licence, supported platform, build/test steps, threat model, decomposition, and measurement methodology. | 2026-09-14 |
| BLOCKED-002 | CHERI-Microkit VMM implementation | Unknown; CHERI-seL4 RFC at `https://github.com/seL4/rfcs/blob/5c8796d4cc578a9d0cb11a34d64c168994262117/src/proposed/0150-cheri-support.md` | not found | Checked the CHERI-seL4 project/RFC and current ordinary Microkit VMM documentation. | Medium | Whether CHERI support later reached Microkit/VMM code, its revision, capability boundary, and proof relationship. | 2026-09-14 |
| BLOCKED-003 | Delivered CHERI-Hafnium implementation | `https://android.googlesource.com/platform/external/hafnium/` and CHaOS project records | not found | Checked CHaOS grant intent, Morello project references, ordinary Hafnium source, and CHERI-Hafnium query variants. | High | Whether the planned work was delivered and whether CHERI protects Hafnium itself or only its partitions. | 2026-09-14 |
| BLOCKED-004 | Post-March-2016 cap-talk continuation | Exact group URL not recorded; host identified as `https://groups.google.com/` | unreachable | Checked 189 recovered March 1998-March 2016 text/gzip exports, Wayback provenance, OSR source indexes, and the inaccessible-archive register; no bypass attempted. | Medium | Modern community discussion of CHERI hypervisors, capability VMMs, candidate leads, terminology, and abandoned plans. It would not establish architecture or maturity by itself. | 2026-09-14 |
| BLOCKED-005 | Attachments scrubbed from recovered cap-talk messages | Legacy EROS Pipermail attachment URLs | not found | Checked preserved message bodies, archive inventory, and scrubbed-attachment notices. | Low | Whether attachments add otherwise-unpublished historical technical context. | 2026-09-14 |
| BLOCKED-006 | Proprietary Wind River Helix internal security architecture | No public source repository identified | licence restricted | Checked vendor presentations, AdaCore demonstration material, and public product records. | Medium | Whether Helix itself uses CHERI or object capabilities internally rather than only hosting CHERI-aware guests. | 2026-09-14 |

`Access result` is one of `paywalled`, `authentication required`,
`robots disallowed`, `licence restricted`, `not found`, `withdrawn`,
`unreachable`, or `out of scope`.

`Priority` is `High`, `Medium`, or `Low`, judged by how much the missing
resource would change the answer.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created the inaccessible-resource record. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded six inaccessible or unlocated resources. | Cap-talk is a bounded community-history limitation; Bao-CHERI and CHERI-Hafnium are high-priority architecture gaps. |
| ACTIVITY-003 | 2026-09-15 | Analysis orchestrator | Qualified BLOCKED-004 after independent review and a direct public access check. | The Google Groups landing path and robots-permitted `/g/` surface are reachable; archive identity, coverage, and content remain unreviewed. |

## Access updates

| Update ID | Resource | Qualifies | New observation | Remaining limitation | Checked date |
| --- | --- | --- | --- | --- | --- |
| ACCESS-001 | Candidate modern cap-talk group | BLOCKED-004 | `https://groups.google.com/g/cap-talk` returns a public group page, and Google Groups `robots.txt` permits `/g/` paths while disallowing search endpoints such as `/d/search*` and `/d/topicsearch*`. | The group must still be verified as the canonical continuation; thread coverage and content have not been enumerated or reviewed. The earlier access result remains the historical result of the 2026-09-14 workstream. | 2026-09-15 |
