# Source discovery log

Sources found while analyzing that are **not** already recorded in an owning
Beryllium research component. This log is the durable record; the pull
interface for other agents is [outbox/pm-queue.md](outbox/pm-queue.md).

Before recording a source here, check the source-discovery reference set in
[RESEARCH-SOURCES.md](RESEARCH-SOURCES.md). A source that could not be checked
against a reachable index is `unconfirmed`, not `new`.

This repository never writes into another component to register a source. The
Project Manager and other research agents pull from the outbox and decide
where a source belongs. See [AGENT-INTERFACE.md](AGENT-INTERFACE.md).

Records are append-only. A correction adds a superseding row and cites the row
it supersedes; it never erases the earlier one.

`Status` is `new` or `unconfirmed`. Only this repository writes those two
values. Only the Project Manager advances an entry beyond them, and it does so
in the outbox.

## Discoveries

| Discovery ID | Session | Title | Authors | Venue and date | Stable URL or DOI | Access result | Relevance to Beryllium | Likely owning component | Indexes checked | Status | Sensitivity | Redistribution | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| DISC-001 | AWB-20260829-001 | Xen Security Advisory XSA-286: x86 PV guest INVLPG-like flushes may leave stale TLB entries | Xen Project Security Team; discovered by Jann Horn | Xen advisory, 2020-10-20; updated 2021-01-19 | https://xenbits.xen.org/xsa/advisory-286.html | HTTP 200; full advisory read | Active TLB state can diverge from current page-table bytes | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-002 | AWB-20260829-001 | Xen Security Advisory XSA-321: insufficient cache write-back under VT-d | Xen Project Security Team; Roger Pau Monne | Xen advisory, 2020-07-07 | https://xenbits.xen.org/xsa/advisory-321.html | HTTP 200; full advisory read | CPU/IOMMU visibility split bounds CPU readback | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-003 | AWB-20260829-001 | Xen Security Advisory XSA-302: passed through PCI devices may corrupt host memory after deassignment | Xen Project Security Team; Paul Durrant | Xen advisory, 2019-10-31 | https://xenbits.xen.org/xsa/advisory-302.html | HTTP 200; full advisory read | In-flight DMA bounds point-in-time table checks | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-004 | AWB-20260829-001 | Xen Security Advisory XSA-148: uncontrolled creation of large page mappings by PV guests | Xen Project Security Team; Shangcong Luan | Xen advisory, 2015-10-29 | https://xenbits.xen.org/xsa/advisory-148.html | HTTP 200; full advisory read | Distinguishes semantic policy comparison from write confirmation | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-005 | AWB-20260829-001 | Xen Security Advisory XSA-304: Machine Check Error on Page Size Change DoS | Xen Project Security Team | Xen advisory, 2019-11-12; updated 2020-08-14 | https://xenbits.xen.org/xsa/advisory-304.html | HTTP 200; full advisory read | Invalidations remain necessary despite correct table bytes | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-006 | AWB-20260829-001 | Remote ATtestation procedureS Architecture | Henk Birkholz, Dave Thaler, Michael Richardson, Ned Smith, Wei Pan | IETF RFC 9334, January 2023 | https://www.rfc-editor.org/rfc/rfc9334.txt | HTTP 200; full RFC read | Freshness, immutable roots, verifier compromise, and post-evidence race | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | approved | 2026-08-29 |
| DISC-007 | AWB-20260829-001 | Copilot - a Coprocessor-based Kernel Runtime Integrity Monitor | Nick L. Petroni Jr., Timothy Fraser, Jesus Molina, William A. Arbaugh | USENIX Security, 2004 | https://www.usenix.org/legacy/event/sec04/tech/petroni.html | Abstract read; full text required membership | Independent-path monitoring under a compromised host | formal-verification-research | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-008 | AWB-20260829-001 | Exploiting the DRAM rowhammer bug to gain kernel privileges | Mark Seaborn, Thomas Dullien | Google Project Zero, 2015-03-09 | https://projectzero.google/2015/03/exploiting-dram-rowhammer-bug-to-gain.html | HTTP 200; full report read | Demonstrated post-construction PTE corruption | cheri-riscv-notes-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-009 | AWB-20260829-001 | Thunderclap: Exploring Vulnerabilities in Operating System IOMMU Protection via DMA from Untrustworthy Peripherals | A. Theodore Markettos et al. | NDSS, 2019 | https://www.ndss-symposium.org/ndss-paper/thunderclap-exploring-vulnerabilities-in-operating-system-iommu-protection-via-dma-from-untrustworthy-peripherals/ | Abstract and project description read | Malicious peripheral and IOMMU-usage evidence | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-010 | AWB-20260829-001 | Platform Firmware Resiliency Guidelines | National Institute of Standards and Technology | NIST SP 800-193, May 2018 | https://doi.org/10.6028/NIST.SP.800-193 | Official PDF read | Contextual integrity-detection and protected-root model | formal-verification-research | AWB-20260829-001 IDX-SET-001 | new | public | approved | 2026-08-29 |
| DISC-011 | AWB-20260829-001 | The Unpatchable Silicon: A Full Break of the Bitstream Encryption of Xilinx 7-Series FPGAs | Maik Ender, Amir Moradi, Christof Paar | USENIX Security, 2020 | https://www.usenix.org/conference/usenixsecurity20/presentation/ender | Event page and abstract read | Counter-source rejecting a defensive-readback spoof analogy | cheri-riscv-notes-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-012 | AWB-20260829-001 | OSLO: Improving the Security of Trusted Computing | Bernhard Kauer | USENIX Security, 2007 | https://www.usenix.org/legacy/event/sec07/tech/kauer.html | Abstract read; full text required membership | Measurement-chain independence and TCB-length context | formal-verification-research | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-013 | AWB-20260829-001 | CVE-2022-1158: Linux KVM cmpxchg_gpte can write to PFNs outside the userspace region | Security disclosure authors and Linux kernel community | oss-security, 2022-04-08 | https://www.openwall.com/lists/oss-security/2022/04/08/4 | HTTP 200; technical disclosure read | Bounds detection of a wrong write target | xrv-research-repo | AWB-20260829-001 IDX-SET-001 | new | public | unknown | 2026-08-29 |
| DISC-014 | AWB-20260829-001 | Functional safety of electrical, electronic, programmable electronic safety-related systems - Part 2 | International Electrotechnical Commission | IEC 61508-2:2010 | https://webstore.iec.ch/en/publication/5515 | Metadata only; normative text paywalled | Could clarify readback's hardware-fault diagnostic model | formal-verification-research | AWB-20260829-001 IDX-SET-001 | new | public | not-approved | 2026-08-29 |
| DISC-015 | AWB-20260829-001 | SWATT: SoftWare-based ATTestation for Embedded Devices | Arvind Seshadri, Adrian Perrig, Leendert Van Doorn, Pradeep Khosla | IEEE Symposium on Security and Privacy, 2004 | https://doi.org/10.1109/SECPRI.2004.1301329 | Metadata only; full paper paywalled | Potential temporal-attestation comparison | formal-verification-research | AWB-20260829-001 IDX-SET-001 | new | public | not-approved | 2026-08-29 |
| DISC-016 | AWB-20260829-001 | Svvptc Extension, Version 1.0 | RISC-V International | Ratified RISC-V ISA extension, v1.0; tagged source checked 2026-08-29 | https://github.com/riscv/riscv-svvptc/tree/089ce2a0ede7dded89fa68edc97e4b0f22bbc8d4 | Public tagged source reviewed in fleet audit | Clarifies S-mode Invalid-to-Valid visibility and prevents Linux G-stage implementation evidence from being overstated as a separate Hvvptc standard | xrv-research-repo | AWB-20260829-001 IDX-SET-001 plus 2026-08-29 recheck | new | public | approved | 2026-08-29 |

## Superseded records

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-28 | analysis-workbook | Created the source discovery log. | No discovery has been recorded. |
| ACTIVITY-002 | 2026-08-29 | analysis-workbook | Mirrored DISC-001 through DISC-015 from AWB-20260829-001. | All entries remain `new` pending Project Manager disposition. |
| ACTIVITY-003 | 2026-08-29 | analysis-workbook | Mirrored DISC-016 from AWB-20260829-001 after the complete reachable reference-set recheck. | The entry remains `new`; already-recorded IOMMU and CoVE/AP-TEE sources were not duplicated. |
