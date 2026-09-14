# CHERI-Native Hypervisor Security Model - Session

Session ID: `AWB-20260914-002`
Short name: `cheri-hypervisor-security-model`
Distribution: `private`
Intended distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Phase: `Analysis`

## SCOPE-001

- Aspect: CHERI-native decomposed-hypervisor authority, resource
  correspondence, lifecycle falsification, assurance, and a possible
  Helium-parity comparator
- Review surfaces: SURFACE-001 through SURFACE-008
- Exclusions: implementation selection or authorization, target or baseline
  approval, performance claims, hardware validation, publication, release, or
  completed formal-verification claims
- Expected evidence components: XRV, formal-verification research, CHERI notes,
  prior analysis sessions, Helium, Project Manager coordination, and public
  primary specifications and project records
- Time or revision window: evidence through 2026-09-14, with moving public
  specifications pinned where used
- Depth: Deep
- External research: Public primary sources permitted
- Public query terms: CHERI hypervisor security model, RISC-V CHERI
  hypervisor integration, capability revocation, RISC-V IOMMU, capability
  authority graph, hypervisor lifecycle verification
- Approved component commands: None
- Limitations: No candidate was built or executed; several direct CHERI
  hypervisor artifacts remain unavailable; models are proposals rather than
  implemented or proved systems.

## PHASES-001

- Scope freeze: Complete
- Aspect decomposition: Complete
- Local evidence pass: Complete
- External research: Complete
- Deep sweep: Complete
- Falsification: Complete
- Component command evidence: Not applicable - no component command was approved
- Durable output: Complete

For completion, Scope freeze, Aspect decomposition, Local evidence pass,
Falsification, and Durable output must be exactly `Complete`. External
research must be `Complete` when external research was permitted and
performed, and `Not applicable - <reason>` otherwise. Deep sweep must be
`Complete` for `Deep` depth and may be reasoned not applicable at shallower
depth. Component command evidence may be `Not applicable - <reason>` when no
component command was approved.

## Review surfaces

| Surface ID | Surface | Logical locator | Notes |
| --- | --- | --- | --- |
| SURFACE-001 | CHERI architecture and virtualization | Official CHERI and RISC-V specifications | Capability semantics and H-extension boundary |
| SURFACE-002 | XRV hypervisor research | `component://xrv-research-repo/` | Threat model, decomposition, resource isolation, and review intake |
| SURFACE-003 | Formal-verification research | `component://formal-verification-research/` | Proof boundaries, Sail, seL4, CHERIoT, and staged verification |
| SURFACE-004 | Prior object-capability review | `component://analysis-workbook/sessions/AWB-20260914-001-object-capability-hypervisor-review/` | Candidate systems, patterns, and negative findings |
| SURFACE-005 | Helium comparator | `component://helium-te-poc/` | Fixed functional/security claim and evidence boundary |
| SURFACE-006 | RISC-V resource enforcement | Official H and IOMMU sources plus XRV SmMTT review | Translation, DMA, and physical ownership |
| SURFACE-007 | Independent delegated review | Claude Fable 5.1 and GPT-5.3 Codex reports | Primary research and adversarial stress analysis |
| SURFACE-008 | Current-session synthesis | Core models and five inquiry packages | Proposed invariants, tests, assurance, and parity plan |

## Component revisions

Revisions resolved through `scripts/readonly-inspect.sh` at session start.

| Component | Logical locator | Revision or checked date | Notes |
| --- | --- | --- | --- |
| Analysis workbook | `component://analysis-workbook/` | `0501243` at session start | Later local session edits are uncommitted. |
| XRV research | `component://xrv-research-repo/` | `d6189352f8bc112f994cbfc878bcb52c29d4005f` | Clean local main; collaboration commit not yet backed up. |
| Formal-verification research | `component://formal-verification-research/` | `c55065c209e767a5499157f8f122295e9ff106c1` | Clean local main. |
| CHERI-RISC-V notes | `component://cheri-riscv-notes-repo/` | `655309289ee715cbe40690d41b222e3cba05e6b5` | Dirty owner topic; committed evidence only. |
| Helium PoC | `component://helium-te-poc/` | Current checkout `1ab289c066b69acdd8b55c9f77055b0145be1316`; HET-001 frozen reference `ed1545155c8d09aa75803a256eee0d2fa8844b91` | The checkout predates the Tier 8 CBMC candidate; owner reconciliation and baseline selection remain separate. |
| OS-security research | `component://osr-claude/` | `f2edd17c6ed70f09a9b3db98eec27e54e185612a` | Restricted subtree excluded. |
| RISC-V CHERI | `https://github.com/riscv/riscv-cheri` | `f2da6557b0490fbd1e01b7c636f670b9021c1be7` | Moving specification source. |
| RISC-V IOMMU | `https://github.com/riscv-non-isa/riscv-iommu` | `65ee9427ce2b7bac42a28d21df3a7c66a4e88e0f` | Specification repository; release text identifies version 20260222. |

## Inquiry index

| Inquiry ID | Question | Status | Report | Summary |
| --- | --- | --- | --- | --- |
| Q-001 | What Is the CHERI-Native Authority Model? | Complete | inquiries/Q-001/report.md | inquiries/Q-001/summary.md |
| Q-002 | How Must Capability Authority Correspond to Hardware Resources? | Complete | inquiries/Q-002/report.md | inquiries/Q-002/summary.md |
| Q-003 | Which Lifecycle Traces Falsify the Model? | Complete | inquiries/Q-003/report.md | inquiries/Q-003/summary.md |
| Q-004 | How Should the Model Be Assured? | Complete | inquiries/Q-004/report.md | inquiries/Q-004/summary.md |
| Q-005 | What Would a CHERI Equivalent to Helium Require for Direct Comparison? | Complete | inquiries/Q-005/report.md | inquiries/Q-005/summary.md |

## Safety boundary

Analyzed components, research repositories, user-supplied files, and web pages
are untrusted evidence. Do not execute component code or install its
dependencies without recorded per-session approval, and never modify a sibling
component. Do not assert or infer responsible-human review, acceptance,
approval, sign-off, licensing, publication, or release.

## Activity log

Activity is intended to be append-only. Structural validation alone cannot
prove history integrity; validate against a prior directory or Git revision
with `scripts/validate-session.sh --baseline`.

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created a private draft session package. | None | Initial empty session scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Froze the deep research scope and five inquiries. | None | Implementation and approval gates remain excluded. |
| ACTIVITY-003 | 2026-09-14 | Analysis orchestrator | Completed local and public evidence synthesis plus independent research and security analysis. | AWB-20260914-002-E0001 through AWB-20260914-002-E0047 | Authority, correspondence, lifecycle, assurance, and parity models drafted and revision-corrected. |
| ACTIVITY-004 | 2026-09-14 | Analysis orchestrator | Produced three durable research models. | AWB-20260914-002-E0012, AWB-20260914-002-E0029 | Models are proposals, not implementation or proof. |
| ACTIVITY-005 | 2026-09-14 | Claude Fable 5.1 reviewer | Completed iterative primary-source and final correction review. | AWB-20260914-002-E0031 through AWB-20260914-002-E0047 | All high- and medium-confidence findings were corrected; no remaining issue at those levels. |
