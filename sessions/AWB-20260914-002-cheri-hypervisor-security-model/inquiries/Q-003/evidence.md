# Which Lifecycle Traces Falsify the Model? - Evidence

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-003`
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
| AWB-20260914-002-E0013 | External primary | Direct | `https://ctsrd-cheri.github.io/cheri-c-programming/cheriabi/revocation-apis.html` | Checked 2026-09-14 | CHERI temporal revocation is software-managed and may be deferred, so object reuse must remain safe while stale capabilities still exist. | public | approved | Heap APIs do not directly define VM lifecycle. |
| AWB-20260914-002-E0014 | Local research | Counter | `component://xrv-research-repo/review-inbox/xen-xsa-286-stale-tlb.md` | XRV `d618935` | Stale translation state is a concrete hypervisor failure class and motivates explicit invalidation completion before ownership reuse. | private | not-approved | Pointer-only intake; detailed source review remains pending. |
| AWB-20260914-002-E0015 | Local research | Counter | `component://xrv-research-repo/review-inbox/xen-xsa-302-in-flight-dma.md` | XRV `d618935` | In-flight DMA during teardown is a concrete cross-lifecycle hazard requiring drain, reset, and IOMMU coordination. | private | not-approved | Pointer-only intake; Xen-specific details are not generalized. |
| AWB-20260914-002-E0016 | Local research | Counter | `component://xrv-research-repo/review-inbox/cve-2022-1158-kvm-wrong-pfn.md` | XRV `d618935` | Incorrect guest-page-frame handling demonstrates that semantically wrong ownership inputs can defeat otherwise memory-safe code. | private | not-approved | Pointer-only intake; KVM-specific defect. |
| AWB-20260914-002-E0017 | Local research | Counter | `component://xrv-research-repo/review-inbox/xen-xsa-321-vtd-cache-writeback.md`; `component://xrv-research-repo/review-inbox/xen-xsa-304-page-size-machine-check.md` | XRV `d618935` | Cache, writeback, page-size, and fault-recovery assumptions can create stale or inconsistent hardware state across isolation boundaries. | private | not-approved | Pointer-only intake; full review remains pending. |
| AWB-20260914-002-E0018 | Local research | Corroborating | `component://analysis-workbook/sessions/AWB-20260914-002-cheri-hypervisor-security-model/delegated-reviews.md` | Checked 2026-09-14 | Independent GPT-5.3 Codex stress analysis ranked cross-layer authority drift, epoch invalidation, split commit, confused-deputy substitution, rollback, replay, and recovery idempotence as the highest-value falsification targets. | private | not-applicable | Review reasoning, not independent empirical evidence. |

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
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded six lifecycle and adversarial observations. | E0013-E0018 support a ranked falsification programme. |
