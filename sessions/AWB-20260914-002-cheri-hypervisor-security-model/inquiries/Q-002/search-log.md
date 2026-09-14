# How Must Capability Authority Correspond to Hardware Resources? - Search log

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-002`
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
| LOCAL-001 | 2026-09-14 | 5-7 | XRV and prior AWB session | G-stage, IOMMU, DMA, interrupt, lifecycle, ownership, generation | Identified proposed ownership and correspondence invariants plus their evidence limits. | AWB-20260914-002-E0009 through AWB-20260914-002-E0012 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 5 | CHERI notes | Yes | Architecture and specification pointers | Dirty worktree limited reads to committed evidence |
| 6 | XRV research | Yes | Memory, DMA, interrupt, lifecycle, SmMTT analysis | No evaluated integrated CHERI implementation |
| 7 | Prior analysis session | Yes | Cross-system counter-evidence | No candidate execution |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Exact IOMMU enforcement semantics require a current primary specification. | Official RISC-V IOMMU repository | Closed |
| GAP-002 | No source establishes end-to-end CHERI-to-IOMMU correspondence. | Evaluated CHERI hypervisor artifact | Open |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Web and GitHub | RISC-V CHERI H integration and RISC-V IOMMU | 5 relevant primary records | Confirmed independent capability and hardware-translation state domains. | AWB-20260914-002-E0007, AWB-20260914-002-E0008 |
| EXT-002 | 2026-09-14 | Claude Fable 5.1 primary-source review | Svyrg, H extension, IOMMU, AIA, NOVA, CheriBSD, walkers, tag storage | 9 primary records | Added ISA-specific G-stage differences and concrete cache, identifier, migration, and partial-failure constraints. | AWB-20260914-002-E0033 through AWB-20260914-002-E0038, AWB-20260914-002-E0046 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| Ownership | Software possession of a capability | Authoritative physical or device assignment | The model reserves ownership for nucleus state and uses delegation for software authority. |
| Mapping | Software object reference | CPU or IOMMU translation entry | Every statement names the mapping domain. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed local and specification correspondence searches. | Six evidence records support the answer. |
