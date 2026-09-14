# Which Systems Genuinely Qualify? - Search log

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-001`
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
| LOCAL-001 | 2026-09-14 | 1-8 | All registered local research components | Read instructions/handoffs; searched CHERI hypervisor, object capability, VMM, microhypervisor, purecap, delegation, and virtualization | Existing candidate baseline and gaps identified. | AWB-20260914-001-E0001 |
| LOCAL-002 | 2026-09-14 | 7 | `component://xrv-research-repo/` | Survey, references, review log, RISC-V streams, and history | Direct CHERI candidates found; NOVA, Hedron, and L4Re absent from corpus. | AWB-20260914-001-E0001 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 1-4 | Provenance, implementation, Helium, coordination | Yes | Current boundaries and negative comparators | No qualifying CHERI hypervisor added |
| 5-6 | Formal verification and CHERI notes | Yes | Capability-kernel and terminology context | No focused current candidate inventory |
| 7 | XRV | Yes | Main CHERI survey and candidates | Missing NOVA/Hedron/L4Re and historical intake records |
| 8 | OSR | Yes | Object-capability lineage | Post-2016 community continuation inaccessible |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Current direct-system and artifact status | Public project primary sources | Completed |
| GAP-002 | Software object-capability hypervisor candidates missing from XRV | Official project sites, repositories, and papers | Completed |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Web search | `Bao-CHERI pure-capability RISC-V hypervisor 2026`; artifact variants | Poster and ordinary Bao upstream | Direct announcement; artifact not located. | AWB-20260914-001-E0002 |
| EXT-002 | 2026-09-14 | Web search | `CAP-VMs Intravisor OSDI 2022 official`; `CheriBSD bhyve CHERI Morello official` | Papers, docs, source | Qualified CAP-VMs and CHERI-aware bhyve separately. | AWB-20260914-001-E0003, AWB-20260914-001-E0004 |
| EXT-003 | 2026-09-14 | Web search | `NOVA microhypervisor capabilities`; `Hedron capability hypervisor`; `L4Re uvmm capabilities`; `seL4 Microkit VMM` | Official project, repository, and documentation records | Added four software object-capability hypervisor families. | AWB-20260914-001-E0005 through AWB-20260914-001-E0008 |
| EXT-004 | 2026-09-14 | Web search | `CHERI-seL4 VMM Microkit`; `CHERI Hafnium implementation` | RFC/project/grant records; no delivered artifact | Recorded bounded negative results. | AWB-20260914-001-E0009, AWB-20260914-001-E0010 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| capability | CHERI tagged pointer authority | Kernel-object capability, software handle, or generic feature | Qualification used authority semantics and enforcement role, not the word alone. |
| VM | Hardware virtual machine with vCPU and guest-physical state | CAP-VM compartment in one virtual address space | CAP-VMs is labeled VMM-like rather than conventional hardware virtualization. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed local-first and public candidate searches. | Qualification evidence recorded. |
