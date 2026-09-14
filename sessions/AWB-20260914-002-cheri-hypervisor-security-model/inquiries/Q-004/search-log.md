# How Should the Model Be Assured? - Search log

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-004`
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
| LOCAL-001 | 2026-09-14 | 3-6 | Formal-verification research and XRV | Sail, refinement, noninterference, capability monotonicity, mutation, proof scope | Identified layered assurance precedents and negative composition limits. | AWB-20260914-002-E0019 through AWB-20260914-002-E0024 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 3 | Formal-verification research | Yes | seL4, CHERIoT, NOVA, and Beryllium verification material | No selected toolchain |
| 6 | XRV research | Yes | CHERI Sail intake and assurance gaps | Sail note pending claim-level verification |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | The existing XRV Sail note requires source-level verification. | Official model repository and specification | Open |
| GAP-002 | Whole-system proof composition is not established. | Target architecture and formal decomposition | Open |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Web and local primary indexes | CHERI Sail, CHERIoT observational correctness, seL4 CHERI RFC, NOVA verification | 7 relevant records | Confirmed that assurance evidence is layered and revision-specific. | AWB-20260914-002-E0019 through AWB-20260914-002-E0022 |
| EXT-002 | 2026-09-14 | Claude Fable 5.1 primary-source review | Morello proof limits, seL4 verified configurations, CHERI-MIPS proof | 3 primary records | Replaced blended proof exclusions with source-specific boundaries. | AWB-20260914-002-E0039 through AWB-20260914-002-E0041 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| Verified | Proven at one abstraction and assumption set | Whole-system security | Every claim must name the modeled component, property, refinement boundary, and excluded environment. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed formal-method and assurance-boundary searches. | Six evidence records support the plan. |
