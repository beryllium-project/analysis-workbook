# Post-G-stage install readback use case and threat analysis - Source discoveries

Session ID: `AWB-20260829-001`
Distribution: `private`
Created: `2026-08-29`
Status: `Complete`

Sources found during this session that are not recorded in an owning Beryllium
research component. Each record is mirrored into `SOURCE-DISCOVERY-LOG.md` and
appended to `outbox/pm-queue.md` with status `new`.

Check the source-discovery reference set in `RESEARCH-SOURCES.md` before
recording. A source that could not be checked against a reachable index is
`unconfirmed`, not `new`.

This repository never writes into another component to register a source.

`IDX-SET-001` means the following reference set was checked at the frozen
revisions in `session.md`: the formal-verification bibliography; the CHERI
BibTeX index; the OS-security source README, WANTED register, and five
nonrestricted collection manifests; the XRV review log and two incorporated
research streams; the provenance metadata index; and
`workspace://analysis-workbook/SOURCE-DISCOVERY-LOG.md` on 2026-08-29.

## Discoveries

| Discovery ID | Title | Authors | Venue and date | Stable URL or DOI | Access result | Relevance to Beryllium | Likely owning component | Indexes checked | Status | Sensitivity | Redistribution | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| DISC-001 | Xen Security Advisory XSA-286: x86 PV guest INVLPG-like flushes may leave stale TLB entries | Xen Project Security Team; discovered by Jann Horn | Xen advisory, 2020-10-20; updated 2021-01-19 | https://xenbits.xen.org/xsa/advisory-286.html | HTTP 200; full advisory read | Concrete example that active TLB state may diverge from current page-table bytes | xrv-research-repo | IDX-SET-001; title, XSA, CVE, URL, and stale-TLB variants absent | new | public | unknown | 2026-08-29 |
| DISC-002 | Xen Security Advisory XSA-321: insufficient cache write-back under VT-d | Xen Project Security Team; Roger Pau Monne | Xen advisory, 2020-07-07 | https://xenbits.xen.org/xsa/advisory-321.html | HTTP 200; full advisory read | Concrete CPU/IOMMU visibility split showing why CPU readback cannot attest IOMMU state | xrv-research-repo | IDX-SET-001; title, XSA, CVE, URL, VT-d, and cache-writeback variants absent | new | public | unknown | 2026-08-29 |
| DISC-003 | Xen Security Advisory XSA-302: passed through PCI devices may corrupt host memory after deassignment | Xen Project Security Team; Paul Durrant | Xen advisory, 2019-10-31 | https://xenbits.xen.org/xsa/advisory-302.html | HTTP 200; full advisory read | Concrete in-flight-DMA lifecycle example showing a post-check state limit | xrv-research-repo | IDX-SET-001; title, XSA, CVE, URL, deassignment, and in-flight-DMA variants absent | new | public | unknown | 2026-08-29 |
| DISC-004 | Xen Security Advisory XSA-148: uncontrolled creation of large page mappings by PV guests | Xen Project Security Team; Shangcong Luan | Xen advisory, 2015-10-29 | https://xenbits.xen.org/xsa/advisory-148.html | HTTP 200; full advisory read | Wrong-permission mapping example that distinguishes semantic policy comparison from same-source write confirmation | xrv-research-repo | IDX-SET-001; title, XSA, CVE, URL, superpage, and writable-mapping variants absent | new | public | unknown | 2026-08-29 |
| DISC-005 | Xen Security Advisory XSA-304: Machine Check Error on Page Size Change DoS | Xen Project Security Team | Xen advisory, 2019-11-12; updated 2020-08-14 | https://xenbits.xen.org/xsa/advisory-304.html | HTTP 200; full advisory read | Hardware erratum example showing that byte equality does not replace architecturally required invalidation | xrv-research-repo | IDX-SET-001; title, XSA, CVE, URL, machine-check, and page-size variants absent | new | public | unknown | 2026-08-29 |
| DISC-006 | Remote ATtestation procedureS Architecture | Henk Birkholz, Dave Thaler, Michael Richardson, Ned Smith, Wei Pan | IETF RFC 9334, January 2023 | https://www.rfc-editor.org/rfc/rfc9334.txt | HTTP 200; full RFC read | Primary architecture for freshness, mutable roots, verifier compromise, and the unavoidable post-evidence race | xrv-research-repo | IDX-SET-001; RFC number, title, authors, URL, RATS, and freshness variants absent | new | public | approved | 2026-08-29 |
| DISC-007 | Copilot - a Coprocessor-based Kernel Runtime Integrity Monitor | Nick L. Petroni Jr., Timothy Fraser, Jesus Molina, William A. Arbaugh | 13th USENIX Security Symposium, 2004, pages 179-194 | https://www.usenix.org/legacy/event/sec04/tech/petroni.html | Abstract HTTP 200; full text required membership | Independent-path monitoring precedent designed to remain useful under a compromised host kernel | formal-verification-research | IDX-SET-001; title, authors, Copilot monitor, and event URL absent; distinct 2006 Petroni paper was already recorded | new | public | unknown | 2026-08-29 |
| DISC-008 | Exploiting the DRAM rowhammer bug to gain kernel privileges | Mark Seaborn, Thomas Dullien | Google Project Zero, 2015-03-09 | https://projectzero.google/2015/03/exploiting-dram-rowhammer-bug-to-gain.html | HTTP 200; full report read | Demonstrated post-construction PTE corruption and privilege escalation from a physical DRAM fault mechanism | cheri-riscv-notes-repo | IDX-SET-001; title, authors, canonical URL, rowhammer, and PTE variants absent | new | public | unknown | 2026-08-29 |
| DISC-009 | Thunderclap: Exploring Vulnerabilities in Operating System IOMMU Protection via DMA from Untrustworthy Peripherals | A. Theodore Markettos, Colin Rothwell, Brett F. Gutstein, Allison Pearce, Peter G. Neumann, Simon W. Moore, Robert N. M. Watson | NDSS, 2019 | https://www.ndss-symposium.org/ndss-paper/thunderclap-exploring-vulnerabilities-in-operating-system-iommu-protection-via-dma-from-untrustworthy-peripherals/ | HTTP 200; abstract and project description read | Primary malicious-peripheral and IOMMU-usage evidence; no claim that it specifically writes G-stage tables | xrv-research-repo | IDX-SET-001; title, authors, URL, Thunderclap, IOMMU, and DMA variants absent | new | public | unknown | 2026-08-29 |
| DISC-010 | Platform Firmware Resiliency Guidelines | National Institute of Standards and Technology | NIST SP 800-193, May 2018 | https://doi.org/10.6028/NIST.SP.800-193 | Official PDF HTTP 200 and text extracted | Contextual Protect, Detect, Recover and integrity-protected-root model, explicitly limited to platform firmware | formal-verification-research | IDX-SET-001; title, publication number, DOI, URL, and resiliency variants absent | new | public | approved | 2026-08-29 |
| DISC-011 | The Unpatchable Silicon: A Full Break of the Bitstream Encryption of Xilinx 7-Series FPGAs | Maik Ender, Amir Moradi, Christof Paar | 29th USENIX Security Symposium, 2020 | https://www.usenix.org/conference/usenixsecurity20/presentation/ender | HTTP 200; event page and abstract read | Counter-source showing that FPGA readback is an attack oracle here, not evidence that defensive readback can be spoofed | cheri-riscv-notes-repo | IDX-SET-001; title, authors, Starbleed, URL, FPGA, and bitstream variants absent | new | public | unknown | 2026-08-29 |
| DISC-012 | OSLO: Improving the Security of Trusted Computing | Bernhard Kauer | 16th USENIX Security Symposium, 2007, pages 229-237 | https://www.usenix.org/legacy/event/sec07/tech/kauer.html | Abstract HTTP 200; full text required membership | Contextual precedent that shortening and separating the measurement trust chain matters | formal-verification-research | IDX-SET-001; title, author, OSLO, URL, SKINIT, and dynamic-root variants absent | new | public | unknown | 2026-08-29 |
| DISC-013 | CVE-2022-1158: Linux KVM cmpxchg_gpte can write to PFNs outside the userspace region | Security disclosure authors and Linux kernel community | oss-security, 2022-04-08 | https://www.openwall.com/lists/oss-security/2022/04/08/4 | HTTP 200; technical disclosure read | Wrong-write-target example that bounds what intended-address readback can and cannot detect | xrv-research-repo | IDX-SET-001; CVE, URL, function, PFN, and title variants absent | new | public | unknown | 2026-08-29 |
| DISC-014 | Functional safety of electrical, electronic, programmable electronic safety-related systems - Part 2 | International Electrotechnical Commission | IEC 61508-2:2010 | https://webstore.iec.ch/en/publication/5515 | Metadata only; normative text paywalled | Could establish whether readback is a recognized hardware-fault diagnostic and clarify its non-malicious fault model | formal-verification-research | IDX-SET-001; standard number, title, IEC, read-back, and diagnostic variants absent | new | public | not-approved | 2026-08-29 |
| DISC-015 | SWATT: SoftWare-based ATTestation for Embedded Devices | Arvind Seshadri, Adrian Perrig, Leendert Van Doorn, Pradeep Khosla | IEEE Symposium on Security and Privacy, 2004 | https://doi.org/10.1109/SECPRI.2004.1301329 | Metadata page available; full paper paywalled | Potential temporal-attestation comparison for why a completed memory traversal does not prevent later modification | formal-verification-research | IDX-SET-001; title, authors, SWATT, and DOI variants absent | new | public | not-approved | 2026-08-29 |
| DISC-016 | Svvptc Extension, Version 1.0 | RISC-V International | Ratified RISC-V ISA extension, v1.0; tagged source checked 2026-08-29 | https://github.com/riscv/riscv-svvptc/tree/089ce2a0ede7dded89fa68edc97e4b0f22bbc8d4 | Public tagged source reviewed in fleet audit | Clarifies the normative S-mode Invalid-to-Valid visibility guarantee and prevents Linux's G-stage use from being overstated as a separate ratified Hvvptc extension | xrv-research-repo | IDX-SET-001 plus 2026-08-29 recheck; title, repository, commit, Svvptc, and Hvvptc variants absent | new | public | approved | 2026-08-29 |

`Status` is `new` or `unconfirmed`. Only this agent writes these two values,
and only the Project Manager advances an entry beyond them in the outbox.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Session scaffolder | Created the discovery record. | The record was initialized for the session. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Checked IDX-SET-001 and recorded 15 newly surfaced public sources. | Project Manager disposition may later identify duplicates; no owning component was modified. |
| ACTIVITY-003 | 2026-08-29 | Analysis agent | Rechecked the complete reachable reference set and appended DISC-016 for Svvptc v1.0. | RISC-V IOMMU and CoVE/AP-TEE were already recorded in XRV/OSR and were not duplicated. |
