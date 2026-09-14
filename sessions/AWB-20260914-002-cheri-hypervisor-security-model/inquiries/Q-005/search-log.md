# What Would a CHERI Equivalent to Helium Require for Direct Comparison? - Search log

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-005`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Every local and external query, including the ones that found nothing. A
checked location that did not contain the expected fact is a result.

Public queries must never contain private code, private repository names,
internal URLs, credentials, non-public identifiers, or user-supplied private
text.

## Local queries

Worked in the order given by `RESEARCH-SOURCES.md`.

| Query ID | Date | Tier | Component or path | Terms or method | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| LOCAL-001 | 2026-09-14 | 2-4 | Helium, HET-001, formal-verification research | fixed claim, verification boundary, pure/effect split, mutation, evidence, parity | Identified the exact comparison dimensions and current evidence asymmetry. | AWB-20260914-002-E0025 through AWB-20260914-002-E0030 |
| LOCAL-002 | 2026-09-14 | 2 | Helium frozen Tier 8 reference | `docs/verification.md`, `docs/formal-verification.md` at `ed1545155c8d09aa75803a256eee0d2fa8844b91` | Corrected the checkout/baseline mismatch and recorded the named CBMC property and mutation inventory. | AWB-20260914-002-E0042, AWB-20260914-002-E0043 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 2 | Helium | Yes | Fixed claim, architecture, verification limits | Baseline not selected by responsible human |
| 3 | Formal-verification research | Yes | Transferable FV method and claim boundaries | No CHERI comparator implementation |
| 4 | Analysis-workbook | Yes | HET-001 and current model | HET-001 remains unaccepted |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Exact Helium comparator commit is not selected. | Responsible-human baseline record | Open |
| GAP-002 | CHERI target and toolchain are not selected. | Later architecture and implementation decision | Open |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Not applicable | No external query required; parity is defined against local exact artifacts. | 0 | Local evidence was sufficient for the research plan. | AWB-20260914-002-E0025 through AWB-20260914-002-E0030 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| Parity | Same externally specified behavior and named properties | Identical implementation, mechanisms, or evidence strength | The plan requires semantic comparability and reports mechanism/evidence differences explicitly. |
| Formal verification | Matched proved or boundedly checked properties | Any use of a formal tool | The comparison names property, model, bounds, assumptions, and result for each side. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the search log. | No query has been run. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the local parity-design review. | Six evidence records support the plan. |
