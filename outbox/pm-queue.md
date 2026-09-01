# Project Manager queue

A **pull** interface. This repository appends rows; the Project Manager and
other research agents read them and act in their own components. Nothing here
is a request that this repository can fulfil, and this repository never writes
into another component to register a source.

Read [AGENT-INTERFACE.md](../AGENT-INTERFACE.md) before consuming this queue.

## How to consume it

1. Read the rows with status `new` or `unconfirmed`.
2. Check the source against the owning component's own index.
3. Record it in the owning component under that component's rules, licensing,
   and redistribution constraints.
4. Update the `Status` column here to `accepted`, `duplicate`, `rejected`, or
   `deferred`, and add the owning component and the date.

`Status` values written by this repository are `new` and `unconfirmed` only.
`accepted`, `duplicate`, `rejected`, and `deferred` are written by the Project
Manager.

A queue row is a pointer to a source. It is never a claim that the source has
been read by anyone else, and never an approval to redistribute it.

## Queue

| Queue ID | Raised on | Session | Discovery ID | Title | Stable URL or DOI | Likely owning component | Sensitivity | Redistribution | Status | Resolved on | Resolution note |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PMQ-001 | 2026-08-29 | AWB-20260829-001 | DISC-001 | Xen XSA-286 stale TLB advisory | https://xenbits.xen.org/xsa/advisory-286.html | xrv-research-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-002 | 2026-08-29 | AWB-20260829-001 | DISC-002 | Xen XSA-321 VT-d cache writeback advisory | https://xenbits.xen.org/xsa/advisory-321.html | xrv-research-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-003 | 2026-08-29 | AWB-20260829-001 | DISC-003 | Xen XSA-302 in-flight DMA advisory | https://xenbits.xen.org/xsa/advisory-302.html | xrv-research-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-004 | 2026-08-29 | AWB-20260829-001 | DISC-004 | Xen XSA-148 writable mapping advisory | https://xenbits.xen.org/xsa/advisory-148.html | xrv-research-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-005 | 2026-08-29 | AWB-20260829-001 | DISC-005 | Xen XSA-304 page-size machine-check advisory | https://xenbits.xen.org/xsa/advisory-304.html | xrv-research-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-006 | 2026-08-29 | AWB-20260829-001 | DISC-006 | RFC 9334 RATS Architecture | https://www.rfc-editor.org/rfc/rfc9334.txt | xrv-research-repo | public | approved | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-007 | 2026-08-29 | AWB-20260829-001 | DISC-007 | Copilot coprocessor kernel integrity monitor | https://www.usenix.org/legacy/event/sec04/tech/petroni.html | formal-verification-research | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-008 | 2026-08-29 | AWB-20260829-001 | DISC-008 | Project Zero Rowhammer PTE privilege escalation | https://projectzero.google/2015/03/exploiting-dram-rowhammer-bug-to-gain.html | cheri-riscv-notes-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-009 | 2026-08-29 | AWB-20260829-001 | DISC-009 | Thunderclap IOMMU and malicious peripheral research | https://www.ndss-symposium.org/ndss-paper/thunderclap-exploring-vulnerabilities-in-operating-system-iommu-protection-via-dma-from-untrustworthy-peripherals/ | xrv-research-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-010 | 2026-08-29 | AWB-20260829-001 | DISC-010 | NIST SP 800-193 Platform Firmware Resiliency Guidelines | https://doi.org/10.6028/NIST.SP.800-193 | formal-verification-research | public | approved | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-011 | 2026-08-29 | AWB-20260829-001 | DISC-011 | Starbleed FPGA configuration-interface counter-source | https://www.usenix.org/conference/usenixsecurity20/presentation/ender | cheri-riscv-notes-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-012 | 2026-08-29 | AWB-20260829-001 | DISC-012 | OSLO trusted-computing measurement-chain research | https://www.usenix.org/legacy/event/sec07/tech/kauer.html | formal-verification-research | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-013 | 2026-08-29 | AWB-20260829-001 | DISC-013 | CVE-2022-1158 KVM wrong-PFN technical disclosure | https://www.openwall.com/lists/oss-security/2022/04/08/4 | xrv-research-repo | public | unknown | new | Not applicable | Awaiting Project Manager disposition. |
| PMQ-014 | 2026-08-29 | AWB-20260829-001 | DISC-014 | IEC 61508-2:2010 functional-safety standard | https://webstore.iec.ch/en/publication/5515 | formal-verification-research | public | not-approved | new | Not applicable | Metadata only; normative text remains paywalled. |
| PMQ-015 | 2026-08-29 | AWB-20260829-001 | DISC-015 | SWATT software-based attestation paper | https://doi.org/10.1109/SECPRI.2004.1301329 | formal-verification-research | public | not-approved | new | Not applicable | Metadata only; full paper remains paywalled. |
| PMQ-016 | 2026-08-29 | AWB-20260829-001 | DISC-016 | Svvptc Extension, Version 1.0 | https://github.com/riscv/riscv-svvptc/tree/089ce2a0ede7dded89fa68edc97e4b0f22bbc8d4 | xrv-research-repo | public | approved | new | Not applicable | Distinguish the normative S-mode guarantee from Linux G-stage implementation use; do not infer a separate Hvvptc standard. |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-28 | analysis-workbook | Created the Project Manager queue. | No source has been queued. |
| ACTIVITY-002 | 2026-08-29 | analysis-workbook | Appended PMQ-001 through PMQ-015 for AWB-20260829-001. | Entries are pull-interface pointers only; no owning component was modified. |
| ACTIVITY-003 | 2026-08-29 | analysis-workbook | Appended PMQ-016 for DISC-016. | The row is a pull-interface pointer only; no owning component was modified. |
