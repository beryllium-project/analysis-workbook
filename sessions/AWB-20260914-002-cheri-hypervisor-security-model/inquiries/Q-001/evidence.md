# What Is the CHERI-Native Authority Model? - Evidence

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-001`
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
| AWB-20260914-002-E0001 | External primary | Direct | `https://www.cl.cam.ac.uk/techreports/UCAM-CL-TR-987.html` | CHERI ISAv9; checked 2026-09-14 | CHERI supplies tagged, bounded, permissioned, unforgeable capabilities with monotonic derivation and sealing, providing a hardware basis for least-privilege software references. | public | approved | ISA mechanisms do not define a hypervisor object model, revocation protocol, or VM lifecycle. |
| AWB-20260914-002-E0002 | External primary | Counter | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/hypervisor-integration.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7`, checked 2026-09-14 | The experimental H chapter adds capability-related CSR state and HLV/HSV operations while stating that RVY is not currently defined in G-stage PTEs. | public | unknown | Moving specification source outside the v1 ratification package; pin before implementation reliance. |
| AWB-20260914-002-E0003 | Local research | Direct | `component://xrv-research-repo/cheri-hypervisor-research-survey.md`; `component://xrv-research-repo/references.md` | XRV `d6189352f8bc112f994cbfc878bcb52c29d4005f` | The XRV model places hardware-visible roots in a small enforcement nucleus and moves policy and service logic into isolated components with bounded interfaces. | private | not-approved | Proposed architecture synthesized from incomplete direct CHERI evidence. |
| AWB-20260914-002-E0004 | Local research | Corroborating | `component://analysis-workbook/sessions/AWB-20260914-001-object-capability-hypervisor-review/inquiries/Q-003/evidence.md` | Analysis-workbook `0501243`, checked 2026-09-14 | NOVA, Hedron, L4Re, and seL4-based VMMs support the recurring pattern of explicit authority around a small privileged mechanism and user-space services. | private | not-approved | Software object capabilities differ from CHERI pointer capabilities. |
| AWB-20260914-002-E0005 | Local research | Counter | `component://formal-verification-research/notes/sel4.md`; `component://formal-verification-research/comparison/summary.md` | Formal-verification research `c55065c209e767a5499157f8f122295e9ff106c1` | Kernel capability proofs do not automatically cover user VMMs, configuration, CHERI modifications, compilers, firmware, devices, or hardware. | private | not-approved | Exact proof scope depends on the selected system and revision. |
| AWB-20260914-002-E0006 | External primary | Counter | `https://ctsrd-cheri.github.io/cheri-c-programming/cheriabi/revocation-apis.html`; `https://ctsrd-cheri.github.io/cheribsd-getting-started/features/temporal.html` | Checked 2026-09-14 | CHERI temporal safety requires software-managed quarantine and revocation support; valid stale capabilities are not globally revoked merely by sealing or object destruction. | public | approved | User-space heap mechanisms do not directly specify hypervisor object revocation. |
| AWB-20260914-002-E0031 | External primary | Direct | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/zyseal.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | `Zyseal` represents sealing authority as bounded type capabilities with separate seal and unseal permissions; type capabilities do not authorize ordinary memory access. | public | unknown | Chapter says ready to freeze while the introduction lists it as experimental; it is outside the v1 ratification package. |
| AWB-20260914-002-E0032 | External primary | Direct | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/zylevels1.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | `Zylevels1` provides global/local capability state and load-global/store-local permissions with monotonic derivation. | public | unknown | ISA mechanism does not define hypervisor policy or revocation. |
| AWB-20260914-002-E0044 | External primary | Direct | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/riscv-unpriv-integration.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | Access System Registers permission in PCC authorizes privileged instructions and restricted CSR access; removing ASR prevents them even when the current privilege mode would otherwise permit access. | public | unknown | Applies to RISC-V CHERI and requires deliberate executable-capability construction. |
| AWB-20260914-002-E0045 | External primary | Counter | `https://github.com/riscv/riscv-cheri/blob/f2da6557b0490fbd1e01b7c636f670b9021c1be7/src/cheri/riscv-unpriv-integration.adoc` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | `YBLD` may set a tag on a bit pattern when authorized by a superset capability, so clearing an individual tag is not revocation against a principal retaining broader authority. | public | unknown | Software must track superset possession and generation state. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded six authority-model observations. | E0001-E0006 support a two-layer model and reject sealing-as-revocation. |
| ACTIVITY-003 | 2026-09-14 | Claude Fable 5.1 research reviewer | Added current Zyseal, Zylevels1, ASR, and YBLD evidence. | E0031, E0032, E0044, and E0045 refine root authority, capability flow, and revocation. |
