# Which Systems Genuinely Qualify? - Evidence

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-001`
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
| AWB-20260914-001-E0001 | Local research | Contextual | `component://xrv-research-repo/cheri-hypervisor-research-survey.md` | `ca414903b93cab82697a30ec2a57ed62c357d380`, checked 2026-09-14 | The existing XRV survey distinguishes direct CHERI virtualization, CHERI-aware guest support, capability VMM-like systems, capability kernels, and adjacent comparators, but does not include current NOVA, Hedron, or L4Re profiles. | private | not-approved | The CHERI-focused survey cutoff is primarily 2026-07-20 and its missing `7314e2f` review history remains unreconciled. |
| AWB-20260914-001-E0002 | External primary | Direct | `https://cfp.riscv-europe.org/eu-summit-2026/talk/JFUNQZ/` | Checked 2026-09-14 | The Bao-CHERI summit abstract describes a pure-capability Bao port using CHERI-RISC-V and the RISC-V H extension and reports headline overheads. | public | unknown | Poster-level evidence; the claimed public implementation artifact was not located. |
| AWB-20260914-001-E0003 | External primary | Direct | `https://www.usenix.org/conference/osdi22/presentation/sartakov`; `https://github.com/lsds/intravisor` | Paper 2022; checked 2026-09-14 | CAP-VMs uses CHERI capabilities as the primary isolation and sharing mechanism for cVMs managed by Intravisor in one virtual address space. | public | unknown | It is VMM-like cloud compartmentalization, not conventional hardware-VM virtualization with independent guest-physical spaces. |
| AWB-20260914-001-E0004 | External primary | Counter | `https://ctsrd-cheri.github.io/cheribsd-getting-started/features/bhyve.html`; `https://github.com/CTSRD-CHERI/cheribsd/blob/b34977b320811fd4105a422f55f9c677e1910e41/sys/arm64/include/vmm.h` | Pinned source; checked 2026-09-14 | CheriBSD/bhyve virtualizes CHERI guest capability state on Morello. The checked sources do not state that bhyve's own authority model or VMM components are capability-secured. | public | unknown | Qualifies as CHERI-aware virtualization, not a demonstrated CHERI-core hypervisor. |
| AWB-20260914-001-E0005 | External primary | Direct | `https://github.com/udosteinberg/NOVA`; `https://www.hypervisor.org/`; `https://doi.org/10.1145/1755913.1755935` | Checked 2026-09-14 | NOVA is a microhypervisor that uses a capability-based authorization model, keeps VMMs and services in user mode, and runs multiple unmodified guests with hardware virtualization. | public | unknown | Capability model is software/kernel-object based, not CHERI hardware. The repository calls the code experimental and not feature complete. |
| AWB-20260914-001-E0006 | External primary | Direct | `https://github.com/cyberus-technology/hedron` | Checked 2026-09-14 | Hedron is a NOVA-derived microhypervisor with a capability-based authorization model, user-space VMMs, reproducible Nix builds, tests, and use as the core of Cyberus Technology's Secure Virtual Platform. | public | unknown | The public mirror warns of production caveats and says GitHub issues and pull requests are not actively monitored. |
| AWB-20260914-001-E0007 | External primary | Direct | `https://l4re.org/`; `https://l4re.org/doc/l4re_servers_uvmm.html`; `https://l4re.systems/doc/l4re_concepts_naming.html` | Checked 2026-09-14 | L4Re/Fiasco.OC is a capability-based operating-system and hypervisor framework; uvmm receives explicit capabilities for guest RAM, hardware resources, control, and services. | public | unknown | This is an object-capability kernel/VMM system, not CHERI. Product claims are project/vendor-authored. |
| AWB-20260914-001-E0008 | External primary | Corroborating | `https://docs.sel4.systems/projects/microkit/manual/2.3.0/`; `https://www.sel4.systems/tools.html` | Checked 2026-09-14 | seL4 Microkit system descriptions allocate kernel-object capabilities statically, and the current seL4 tools index lists an AArch64 Microkit VMM library. | public | unknown | seL4 kernel proofs do not automatically cover the VMM, device models, system description, or CHERI modifications. |
| AWB-20260914-001-E0009 | External primary | Negative | `https://github.com/seL4/rfcs/blob/5c8796d4cc578a9d0cb11a34d64c168994262117/src/proposed/0150-cheri-support.md` | Pinned revision; checked 2026-09-14 | The CHERI-seL4 RFC places VMMs, Microkit, CAmkES, and device drivers outside the implemented CHERI scope and treats verification of CHERI kernel changes as future work. | public | unknown | Does not rule out later work, but no current CHERI-Microkit VMM artifact was found. |
| AWB-20260914-001-E0010 | External primary | Negative | `https://gtr.ukri.org/projects?ref=EP%2FV000292%2F1`; `https://android.googlesource.com/platform/external/hafnium/` | Checked 2026-09-14 | CHaOS named hypervisor compartmentalization and Hafnium as research targets, but no delivered CHERI-Hafnium implementation was located in the reviewed records. | public | unknown | A research programme objective is not implementation evidence. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded the candidate qualification evidence. | Ten evidence records added. |
