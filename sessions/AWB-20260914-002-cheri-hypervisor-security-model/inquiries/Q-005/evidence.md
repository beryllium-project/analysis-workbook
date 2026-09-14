# What Would a CHERI Equivalent to Helium Require for Direct Comparison? - Evidence

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-005`
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
| AWB-20260914-002-E0025 | Local implementation | Direct | `component://helium-te-poc/HANDOFF.md`; `component://helium-te-poc/README.md` | Helium `1ab289c066b69acdd8b55c9f77055b0145be1316` | Helium's bounded claim is a fixed single-hart QEMU scenario with two sequential VS subjects, distinct types and G-stage roots, asymmetric shared-page access, and denied cross-private access. | private | not-approved | Review-and-test PoC; not formally verified or hardware validated. |
| AWB-20260914-002-E0026 | Local implementation | Counter | `component://helium-te-poc/docs/verification.md`; `component://helium-te-poc/docs/architecture.md` | Helium `1ab289c066b69acdd8b55c9f77055b0145be1316` | Helium explicitly excludes multicore, interrupts, devices, DMA/IOMMU, dynamic policy, attestation, and formal proof from its current claim. | private | not-approved | The current checkout and handoff/ref state require separate owner reconciliation. |
| AWB-20260914-002-E0027 | Local coordination | Direct | `component://analysis-workbook/outbox/helium-transfer-queue.md` `HET-001` | Analysis-workbook `0501243` | The reusable FV method is to select one stable seam, separate pure decisions from effects, use an independent extensional specification, state rollback, plan mutations, retain evidence, and keep residual assumptions and human gates explicit. | private | not-approved | HET-001 is recorded but unaccepted as a Beryllium input. |
| AWB-20260914-002-E0028 | Local research | Corroborating | `component://formal-verification-research/workstreams/beryllium/strategy.md`; `component://formal-verification-research/workstreams/beryllium/verified-systems-survey.md` | Formal-verification research `c55065c209e767a5499157f8f122295e9ff106c1` | Comparable verification requires an independent model, exact claim boundary, source/effect correspondence, mutation evidence, and separately scoped noninterference and hardware claims. | private | not-approved | Methods are research guidance, not proof of either candidate. |
| AWB-20260914-002-E0029 | Local research | Contextual | `component://analysis-workbook/sessions/AWB-20260914-002-cheri-hypervisor-security-model/helium-cheri-parity-plan.md` | Current session draft, 2026-09-14 | The proposed comparator freezes one Helium revision, defines one mechanism-neutral transition relation, and compares matched behavior, security properties, proof obligations, TCB, authority, evidence, and residual assumptions. | private | not-approved | Proposed plan under review, not independent evidence or authorization. |
| AWB-20260914-002-E0030 | Local research | Contextual | Q-001 through Q-004 evidence set | Checked 2026-09-14 | The draft applies the comparison rule that functional parity does not imply security or assurance parity and reports CHERI-specific properties separately. | private | not-approved | Derived comparison rule, not an observation. |
| AWB-20260914-002-E0042 | Local assurance | Direct | `component://helium-te-poc/docs/verification.md` | Helium frozen reference `ed1545155c8d09aa75803a256eee0d2fa8844b91` | Helium is not formally verified as a system, but the frozen Tier 8 candidate machine-checks named source-level properties for fixed TE, policy, G-stage, transition, capture, authority, effect, pipeline, and transaction boundaries. | private | not-approved | Excludes live correspondence, privileged effects, compiler/ISA/QEMU/hardware behavior, noninterference, and whole-monitor correctness. |
| AWB-20260914-002-E0043 | Local assurance | Direct | `component://helium-te-poc/docs/formal-verification.md` | Helium frozen reference `ed1545155c8d09aa75803a256eee0d2fa8844b91` | The frozen candidate records eight CBMC tiers, 18 exact checks, 152 named claims, 19,419 successful properties, and 18 rejected security-significant mutations. | private | not-approved | Counts do not establish whole-system proof or parity; comparison must use named properties and assumptions. |

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
| AWB-20260914-002-E0042 | AWB-20260914-002-E0026 | The current checkout predates the HET-001 frozen Tier 8 candidate and understates the comparator's bounded CBMC evidence. | 2026-09-14 |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the evidence ledger. | Initial empty evidence scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded six parity-design observations. | E0025-E0030 support a common-specification comparator with separate claim axes. |
| ACTIVITY-003 | 2026-09-14 | Claude Fable 5.1 second-pass reviewer | Corrected the Helium revision mismatch and added the frozen Tier 8 CBMC boundary and property inventory. | E0042 and E0043 supersede the older checkout's FV characterization for parity purposes. |
