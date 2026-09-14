# What Is the Demonstrated Maturity? - Evidence

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Observations only. What a source says belongs here; what follows from it
belongs in `report.md`.

Evidence IDs are `AWB-20260914-001-E####`, unique within the session and never
reused or renumbered. This ledger is append-only; a correction adds a
superseding row and cites the row it supersedes.

## Ledger

| Evidence ID | Class | Role | Logical locator | Revision or checked date | Observation | Sensitivity | Redistribution | Limitation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AWB-20260914-001-E0011 | External primary | Negative | `https://cheri-alliance.org/discover-cheri/cheri-products/`; reviewed product and release records | Checked 2026-09-14 | Public CHERI product listings include processors, boards, operating systems, emulators, and tools, but no shipping CHERI-secured hypervisor product was identified. | public | unknown | Source-set negative, not proof of non-existence; the listing is alliance-maintained and may be incomplete. |
| AWB-20260914-001-E0012 | External primary | Direct | `https://github.com/udosteinberg/NOVA`; `https://www.bluerock.io/post/nova-microhypervisor-amd-dma-isolation-secure-ai-infrastructure`; `https://popl26.sigplan.org/details/rocqpl-2026-papers/12/` | Checked 2026-09-14 | NOVA has an active 2026 open-source line, AMD IOMMU/DMA work, and publicly presented ongoing modular Rocq verification of the microhypervisor. | public | unknown | Vendor and workshop sources describe progress; they do not establish completion of whole-system or binary verification. |
| AWB-20260914-001-E0013 | External primary | Direct | `https://github.com/cyberus-technology/hedron` | Checked 2026-09-14 | Hedron is maintained as open source, documents supported Intel hardware, build and test procedures, and states that it is the core of a commercial Secure Virtual Platform. | public | unknown | Exact customer deployments, certification, and independent product evaluation were not found. |
| AWB-20260914-001-E0014 | External primary | Direct | `https://l4re.org/`; `https://www.kernkonzept.com/l4re-operating-system-framework/`; `https://www.st.com/en/partner-products-and-services/l4re-hypervisor.html` | Checked 2026-09-14 | L4Re is current, professionally supported, and offered as an object-capability-based hypervisor framework, including an ST partner listing for the Stellar platform. | public | unknown | Vendor and partner documentation establishes offering and support, not independent certification of the full system. |
| AWB-20260914-001-E0015 | External primary | Direct | `https://www.usenix.org/system/files/osdi22-sartakov.pdf`; `https://www.usenix.org/system/files/osdi23-sartakov.pdf` | Publications 2022 and 2023; checked 2026-09-14 | CAP-VMs and ORC have peer-reviewed system-author evaluations and public source, but no verified commercial service or named production deployment was identified. | public | unknown | Academic evaluation hardware and workloads do not establish product maturity. |
| AWB-20260914-001-E0016 | External primary | Negative | `https://cfp.riscv-europe.org/eu-summit-2026/talk/JFUNQZ/`; `https://github.com/bao-project/bao-hypervisor` | Checked 2026-09-14 | Bao-CHERI remains supported by a poster abstract; the corresponding public source branch, tag, build instructions, and methodology were not located. | public | unknown | The artifact may exist at an unindexed or later location. |
| AWB-20260914-001-E0017 | External primary | Counter | `https://ctsrd-cheri.github.io/cheribsd-getting-started/features/bhyve.html`; `https://www.morello-project.org/cheri-feature-matrix/` | Checked 2026-09-14 | CheriBSD/bhyve is documented as experimental CHERI-aware virtualization rather than a supported CHERI-secured hypervisor product. | public | unknown | Current lifecycle and host purecap mode remain incompletely documented. |
| AWB-20260914-001-E0018 | Local research | Direct | `component://osr-claude/sources/captalk-txt/`; `component://osr-claude/sources/WANTED.md` | OSR `f2edd17c6ed70f09a9b3db98eec27e54e185612a`, checked 2026-09-14 | The recovered cap-talk corpus contains 189 readable monthly exports from March 1998 through March 2016. The post-March-2016 Google Groups continuation is recorded as inaccessible to the passive headless workflow. | private | not-approved | Historical attachments may be scrubbed; the unavailable continuation limits exhaustive modern community-history claims but not architecture or maturity findings. |

`Class` is one of `Local implementation`, `Local assurance`,
`Local coordination`, `Local research`, `Local provenance`, `External primary`,
`External secondary`, or `User-supplied`.

`Role` is one of `Direct`, `Corroborating`, `Contextual`, `Counter`, or
`Negative`.

`Sensitivity` is one of `public`, `internal`, `private`, or `restricted`.

`Redistribution` is one of `approved`, `not-approved`, `unknown`, or
`not-applicable`.

## Superseded records

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the evidence ledger. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded literature, project, product, and community maturity evidence. | Eight evidence records added. |
