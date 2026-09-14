# Which Patterns Recur and What Limits Them? - Evidence

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-003`
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
| AWB-20260914-001-E0019 | Local research | Corroborating | `component://xrv-research-repo/cheri-hypervisor-research-survey.md`; NOVA, Hedron, L4Re, seL4 primary records | XRV `ca41490`; external checked 2026-09-14 | A recurring design pattern is a small privileged mechanism with policy, device models, protocols, and VMM services moved to capability-confined user components. | private | not-approved | No reviewed CHERI hypervisor implements the full pattern across all services. |
| AWB-20260914-001-E0020 | External primary | Counter | `https://github.com/riscv/riscv-cheri/blob/main/src/cheri/hypervisor-integration.adoc`; XRV survey | Checked 2026-09-14 | CHERI capability checks and hardware-VM mechanisms are complementary: current CHERI-RISC-V H integration does not replace G-stage translation, page-table ownership, interrupt virtualization, or IOMMU enforcement. | public | unknown | The draft is moving and must be pinned before implementation reliance. |
| AWB-20260914-001-E0021 | Local research | Counter | `component://formal-verification-research/notes/sel4.md`; `component://formal-verification-research/comparison/summary.md` | `e5740dee976e7ea1e3b64be1450da854bbacf128`, checked 2026-09-14 | Capability-kernel verification is layered: strong kernel proofs do not automatically cover user VMMs, device models, system configuration, CHERI modifications, compilers, firmware, or hardware. | private | not-approved | Research synthesis; exact proof scope varies by architecture and release. |
| AWB-20260914-001-E0022 | Local research | Counter | `component://xrv-research-repo/cheri-hypervisor-research-survey.md`, security and gap sections | `ca414903b93cab82697a30ec2a57ed62c357d380` | Sealing is not general revocation; valid capabilities can still be misused; DMA commonly uses integer addresses; and CHERI alone does not establish policy freshness, availability, migration safety, or side-channel isolation. | private | not-approved | Several mitigations remain proposed rather than evaluated in a CHERI VMM. |
| AWB-20260914-001-E0023 | External primary | Direct | `https://github.com/udosteinberg/NOVA`; `https://github.com/cyberus-technology/hedron`; `https://l4re.org/doc/l4re_servers_uvmm.html` | Checked 2026-09-14 | Software object-capability hypervisors demonstrate explicit resource capabilities, delegated VMM authority, and decomposed services on conventional hardware today. | public | unknown | Their capability semantics and threat boundaries are not identical to CHERI's tagged pointers. |
| AWB-20260914-001-E0024 | External primary | Negative | Bao-CHERI, CHERI-seL4, CHaOS/Hafnium, CheriBSD/bhyve, and CAP-VMs records | Checked 2026-09-14 | No reviewed system demonstrates an evaluated application-class CHERI hypervisor whose core and major services are purecap compartments and which covers vCPUs, G-stage, IOMMU/DMA, interrupts, devices, lifecycle, and attestation. | public | unknown | Search-bound negative; unlocated or private work may exist. |
| AWB-20260914-001-E0025 | Local research | Counter | `component://osr-claude/mac-labels-on-capabilities-survey.md`; `component://xrv-research-repo/cheri-hypervisor-research-survey.md` | OSR `f2edd17`; XRV `ca41490`; checked 2026-09-14 | "Capability" collides across CHERI pointers, kernel-object capabilities, software handles, capability-like access tokens, and generic feature support. Qualification requires authority semantics, not terminology alone. | private | not-approved | Mixed local synthesis; source-specific vocabulary must be preserved. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded recurring patterns, counter-evidence, and terminology limits. | Seven evidence records added. |
