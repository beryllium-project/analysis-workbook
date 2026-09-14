# How Must Capability Authority Correspond to Hardware Resources? - Evidence

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Observations only. What a source says belongs here; what follows from it
belongs in `report.md`.

Evidence IDs are `AWB-20260914-002-E####`, unique within the session and never
reused or renumbered. This ledger is append-only; a correction adds a
superseding row and cites the row it supersedes.

## Ledger

| Evidence ID | Class | Role | Logical locator | Revision or checked date | Observation | Sensitivity | Redistribution | Limitation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AWB-20260914-002-E0007 | External primary | Direct | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/hypervisor-integration.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | CHERI H integration defines capability architectural-state behavior while leaving ordinary H-extension translation and virtualization structures in place. | public | unknown | Specification source is moving. |
| AWB-20260914-002-E0008 | External primary | Direct | `https://github.com/riscv-non-isa/riscv-iommu/tree/65ee9427ce2b7bac42a28d21df3a7c66a4e88e0f` | `65ee9427ce2b7bac42a28d21df3a7c66a4e88e0f`, release text version 20260222 | The IOMMU maintains device-visible translations and invalidation semantics independently of software pointer capabilities. | public | unknown | Architecture specification, not a CHERI integration or implementation proof. |
| AWB-20260914-002-E0009 | Local research | Direct | `component://xrv-research-repo/cheri-hypervisor-research-survey.md` sections 6.2-6.5 | XRV `d6189352f8bc112f994cbfc878bcb52c29d4005f` | XRV proposes one authoritative physical-page ownership record, generation-tagged VM state, nucleus validation, DMA quiescence, and coordinated interrupt/device teardown. | private | not-approved | Proposed invariants are not yet implemented or formally proved. |
| AWB-20260914-002-E0010 | Local research | Corroborating | `component://xrv-research-repo/review-done/supervisor-domain-isolation-smmtt.md` | XRV `d6189352f8bc112f994cbfc878bcb52c29d4005f` | SmMTT supplies centrally managed physical-domain enforcement but is not a capability system, illustrating that coarse hardware ownership and fine-grained software authority are separate layers. | private | not-approved | SmMTT remained revision-sensitive and unintegrated with CHERI at the review cutoff. |
| AWB-20260914-002-E0011 | Local research | Counter | `component://analysis-workbook/sessions/AWB-20260914-001-object-capability-hypervisor-review/inquiries/Q-003/evidence.md` | Analysis-workbook `0501243` | Software capability graphs improve authority visibility but do not independently constrain integer page tables, DMA addresses, interrupt state, or lifecycle transitions. | private | not-approved | Synthesis across systems rather than one implementation. |
| AWB-20260914-002-E0012 | Local research | Contextual | `component://analysis-workbook/sessions/AWB-20260914-002-cheri-hypervisor-security-model/capability-resource-correspondence.md` | Current session draft, 2026-09-14 | The proposed relation requires every hardware mapping, route, and binding to be justified by current ownership, generation, policy, and delegated authority. | private | not-approved | Derived model under review, not an observation supporting itself. |
| AWB-20260914-002-E0033 | External primary | Direct | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/cheri-pte-ext.adoc`; `hypervisor-integration.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | `Svyrg` supplies first-stage S-mode and VS-mode capability load/store barriers in the v1 package, but the experimental H chapter states that RVY is not defined in G-stage PTEs. | public | unknown | RISC-V CHERI does not currently provide equivalent G-stage capability-flow controls. |
| AWB-20260914-002-E0034 | External primary | Direct | `https://github.com/riscv-non-isa/riscv-iommu/tree/65ee9427ce2b7bac42a28d21df3a7c66a4e88e0f` | `65ee9427ce2b7bac42a28d21df3a7c66a4e88e0f` | Reusing a GSCID for different roots is unpredictable; between a table change and processed invalidation the IOMMU may use old or new state, and cached device contexts may require additional invalidation. | public | unknown | No CHERI or tag semantics are specified. |
| AWB-20260914-002-E0035 | External primary | Direct | `https://github.com/riscv/riscv-aia/tree/9507866427961d4ec2d2400ea875103b2a09520b` | `9507866427961d4ec2d2400ea875103b2a09520b` | Guest interrupt-file migration guidance recommends IOMMU translation updates and synchronization so no straggler MSI reaches the old physical interrupt file. | public | unknown | Recommended architecture guidance, not a mandatory complete lifecycle protocol. |
| AWB-20260914-002-E0036 | External primary | Corroborating | `https://github.com/udosteinberg/NOVA/blob/7812027ccd072064e8e548bb68bb02507624b2e2/doc/specification.pdf` | `7812027ccd072064e8e548bb68bb02507624b2e2`, specification dated 2026-08-27 | NOVA defines guest-physical and DMA spaces as capability-selected translation spaces and documents a device-reassignment timeout where binding changed but the old DMA space must remain valid. | public | unknown | Software object capabilities, not CHERI pointers. |
| AWB-20260914-002-E0037 | External primary | Counter | `https://github.com/CTSRD-CHERI/cheribsd/tree/88f39900c32928d807dba245fba138808c666f34` | `88f39900c32928d807dba245fba138808c666f34` | Morello CheriBSD source uses stage-2 capability load/store descriptor controls, unlike current RISC-V CHERI G-stage PTEs. | public | unknown | Source-level mechanism; Morello architecture text was not independently read in this session. |
| AWB-20260914-002-E0038 | External primary | Counter | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/riscv-priv-integration.adoc`; `system.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | Implicit page-table-walker accesses are not subject to CHERI checks, and tag storage must be protected from bus initiators that could bypass the tag cache. | public | unknown | Platform integration requirements remain separate from ISA capability checks. |
| AWB-20260914-002-E0046 | External primary | Direct | `https://github.com/riscv/riscv-isa-manual/blob/be8cb008612ce2ac1712e4ba3f09fc2109c0d462/src/priv/hypervisor.adoc` | `be8cb008612ce2ac1712e4ba3f09fc2109c0d462` | Writing `hgatp` provides no ordering by itself; VMID reuse may require `HFENCE.GVMA`, and changing `hgatp.MODE` for a VMID requires a global `HFENCE.GVMA`. | public | unknown | Ratified H-extension rule; implementation ordering still requires target evidence. |

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
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the evidence ledger. | Initial empty evidence scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded six hardware-correspondence observations. | E0007-E0012 support explicit cross-layer state relations. |
| ACTIVITY-003 | 2026-09-14 | Claude Fable 5.1 research reviewer | Added revision-pinned first-stage/G-stage, IOMMU, AIA, NOVA, Morello, walker, tag-storage, and H-extension evidence. | E0033-E0038 and E0046 make the model ISA-specific and cache/invalidation aware. |
