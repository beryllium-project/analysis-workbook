# Which Patterns Recur and What Limits Them? - Search log

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-003`
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
| LOCAL-001 | 2026-09-14 | 5-8 | Formal verification, XRV, and OSR | Decomposition, capability lifecycle, revocation, proof boundary, MAC/capability composition, and negative gaps | Candidate patterns and limitations identified. | AWB-20260914-001-E0019 through AWB-20260914-001-E0022, AWB-20260914-001-E0025 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 5 | Formal verification | Yes | Layered assurance and extraction patterns | No proof transfers automatically to full VMM stacks |
| 7 | XRV | Yes | Design patterns and explicit gaps | No complete CHERI decomposed hypervisor |
| 8 | OSR | Yes | Capability-policy lineage and terminology | Modern cap-talk continuation unavailable |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Whether current systems implement the complete pattern | Candidate primary architecture and source records | Completed; none found |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Primary-source comparison | NOVA, Hedron, L4Re, seL4, Bao-CHERI, CAP-VMs, CHERI H integration | Multiple direct systems | Corroborated small-nucleus and explicit-authority patterns. | AWB-20260914-001-E0019, AWB-20260914-001-E0020, AWB-20260914-001-E0023 |
| EXT-002 | 2026-09-14 | Negative synthesis | Complete purecap decomposed hypervisor with G-stage, IOMMU, devices, interrupts, lifecycle, and attestation | 0 established systems | Recorded a bounded open research gap. | AWB-20260914-001-E0024 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| sealed | CHERI sealed capability or sentry | General claim of lifecycle safety | Sealing was not treated as general revocation or availability. |
| verified | Verified kernel or selected functions | Verified complete VMM/product stack | Every claim retained its artifact and configuration boundary. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the search log. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed comparative and counter-evidence searches. | Pattern findings bounded by negative evidence. |
