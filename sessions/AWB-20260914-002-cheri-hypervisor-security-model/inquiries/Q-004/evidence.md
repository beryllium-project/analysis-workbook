# How Should the Model Be Assured? - Evidence

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-004`
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
| AWB-20260914-002-E0019 | Local research | Direct | `component://xrv-research-repo/review-done/cheri-risc-v-formal-sail-model.md` | XRV `d618935` | The CHERI-RISC-V Sail model can provide executable architectural semantics and test-oracle support, but the existing note still requires claim-level source verification before incorporation. | private | not-approved | Accepted for incorporation, not yet verified or integrated. |
| AWB-20260914-002-E0020 | Local research | Direct | `component://formal-verification-research/notes/sel4.md`; `component://formal-verification-research/comparison/summary.md` | `c55065c209e767a5499157f8f122295e9ff106c1` | seL4 demonstrates strong kernel-level refinement and isolation reasoning while preserving explicit boundaries around user-level VMMs, configuration, devices, and modified architectures. | private | not-approved | Summary of primary proof literature; target-specific scope varies. |
| AWB-20260914-002-E0021 | Local research | Corroborating | `component://formal-verification-research/sources/bibliography.md`; CHERIoT-Ibex observational-correctness paper | Formal-verification research `c55065c`; checked 2026-09-14 | Processor-level formal verification can find RTL defects that violate capability monotonicity, showing that ISA intent and hardware realization require separate evidence. | private | not-approved | CHERIoT-Ibex is an embedded processor, not a hypervisor platform. |
| AWB-20260914-002-E0022 | Local research | Contextual | `component://analysis-workbook/outbox/pm-queue.md` `PMQ-021`; `component://formal-verification-research/sources/bibliography.md` | Analysis-workbook `0501243`; formal-verification research `c55065c` | Current NOVA verification work is relevant to modular reasoning about a capability microhypervisor, but the routed pointer is not yet corpus admission or an established completed proof. | private | not-approved | Metadata-only pointer pending owner triage. |
| AWB-20260914-002-E0023 | Local research | Corroborating | `component://formal-verification-research/workstreams/beryllium/strategy.md`; `component://formal-verification-research/workstreams/beryllium/verified-systems-survey.md` | `c55065c209e767a5499157f8f122295e9ff106c1` | A practical assurance sequence separates materialization, pure transition logic, effect planning, privileged execution, mutation testing, and later noninterference or refinement claims. | private | not-approved | Beryllium/Helium methods do not prove the proposed CHERI model. |
| AWB-20260914-002-E0024 | Local research | Negative | Q-001 through Q-003 evidence set | Checked 2026-09-14 | No evidence establishes one proof covering CHERI ISA semantics, nucleus code, services, configuration, hardware tables, DMA, interrupts, lifecycle, firmware, and devices end to end. | private | not-approved | Search-bound negative; future work may cover subsets. |
| AWB-20260914-002-E0039 | External primary | Counter | `https://www.cl.cam.ac.uk/research/security/ctsrd/pdfs/202205-esop-verified-morello-security.pdf` | ESOP 2022; checked 2026-09-14 | The Morello security proof assumes an arbitrary but fixed translation mapping and excludes translation-table-walk capability loads, GIC, concurrency, and side channels; translation-managing software must be trusted or verified. | public | approved | Proof does not cover the hypervisor-critical translation-management layer. |
| AWB-20260914-002-E0040 | External primary | Counter | `https://docs.sel4.systems/projects/sel4/verified-configurations.html` | Checked 2026-09-14 | seL4's verified configurations explicitly exclude device address translation through SMMU/IOMMU and exclude debug, profiling, printing, and boot startup. | public | approved | Verified properties and configurations vary; not a CHERI system. |
| AWB-20260914-002-E0041 | External primary | Direct | `https://doi.org/10.1109/SP40000.2020.00055` | IEEE S&P 2020; checked 2026-09-14 | Complete CHERI-MIPS Sail-model proofs establish reachable-capability monotonicity and bounded compartment isolation within their modeled domain-transition assumptions. | public | unknown | CHERI-MIPS and fixed proof assumptions do not establish hypervisor translation or device correctness. |
| AWB-20260914-002-E0047 | External primary | Negative | `https://github.com/seL4/rfcs/pull/21` | Open RFC, checked 2026-09-14 | The CHERI/Morello support RFC remains open, so no reviewed source establishes that existing seL4 proof claims cover a CHERI-aware kernel or VMM. | public | unknown | Repository status can change; recheck before reuse. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded six assurance observations. | E0019-E0024 support a layered proof and validation plan. |
| ACTIVITY-003 | 2026-09-14 | Claude Fable 5.1 research reviewer | Added primary proof-scope evidence for Morello, seL4 configurations, and CHERI-MIPS. | E0039-E0041 make translation, device-translation, GIC, concurrency, side-channel, and boot exclusions source-specific. |
