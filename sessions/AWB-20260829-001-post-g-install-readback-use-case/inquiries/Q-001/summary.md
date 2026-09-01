# Establish the post-G-stage install readback use case - Summary

Session ID: `AWB-20260829-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-08-29`
Status: `Complete`
Topic: Post-G-stage install readback use case
Confidence: Medium

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

Does post-G-stage install readback have a defensible use case, which threats
does it address, where does it fail, and how should it compare with
alternatives?

## Answer

**Yes, but only as a bounded pre-activation diagnostic and admission check.**
The current controls are usefully distinct:

- Beryllium R2's complete root walk checks realized PTE structure and mappings
  against sealed canonical authority. It is a complete fixed-profile software
  walk with logically separate builder/walker paths, but the paths share the
  same process, privilege/trust domain, compiler, CPU memory path, and TCB
  (AWB-20260829-001-E0006, AWB-20260829-001-E0037).
- R3/R5's `HGATP` write-fence-readback-publication transaction confirms that
  architectural HGATP readback equaled the expected selector in the bounded
  QEMU transaction. It is not K3 hardware evidence. RISC-V WARL semantics
  separately establish write/readback's generic role in capability discovery
  (AWB-20260829-001-E0016, AWB-20260829-001-E0039,
  AWB-20260829-001-E0041).
- Both roots use VMID 0. The current order is
  `csrw hgatp -> hfence.gvma x0,x0 -> csrr hgatp`; R5 writes with `V=0`.
  Selector equality remains consistent with stale translations. The
  all-address/all-VMID fence discharges the bounded same-VMID reuse case
  because no G-stage translation occurs before it
  (AWB-20260829-001-E0041).
- R3 reaches virtual execution at the selected management PC, and R5 exercises
  selected permitted accesses and expected G-stage faults under both roots.
  These are effective-path corroboration in QEMU, not exhaustive cache or
  hardware evidence (AWB-20260829-001-E0042,
  AWB-20260829-001-E0043).
- A new duplicate same-memory PTE readback after installation has low marginal
  value because R2 already walks the final pools and R5 records no post-seal
  PTE write. Bounded dynamic-hypervisor negative searches are weak
  corroboration only and did not inspect exact Xen activation paths
  (AWB-20260829-001-E0035, AWB-20260829-001-E0041).

XSA-148 and CVE-2022-1158 are runtime guest-driven analogues, not incidents
known to be caught by Beryllium. Same-source readback would confirm XSA-148's
wrongly authorized value; an independently derived policy comparison is
needed. Intended-address readback could show CVE-2022-1158's missing intended
update, but a bounded in-pool walk cannot locate the spurious out-of-pool
write (AWB-20260829-001-E0021, AWB-20260829-001-E0030).

One-time same-path readback does not close stale CPU/IOMMU state, later
mutation, DMA, debug, replay/rollback, or physical faults. A physical
split-view/interposer remains a hypothesis: same-path readback provides no
evidence against it, but no Beryllium split view has been demonstrated. The
RISC-V IOMMU specification separately permits old or new G-stage PTE use
until the corresponding `IOTINVAL.GVMA` is processed
(AWB-20260829-001-E0019, AWB-20260829-001-E0025,
AWB-20260829-001-E0038, AWB-20260829-001-E0046).

Accordingly, retain or add readback only with an explicit contract naming the
object read, independently protected expectation, fault/adversary class,
final-use buffer, independence axes, failure action, and non-claims. The
mutation-exclusion argument must name the exact profile, evidence basis,
check-to-use interval, excluded writers, and residual writers. Fence
requirements must state placement relative to final table stores and HGATP,
scope, VMID reuse, and the current `V=0` assumption; IOMMU invalidation is a
separate obligation. This is bounded in the current single-hart/no-DMA/`V=0`
QEMU profile and is not established for K3
(AWB-20260829-001-E0036, AWB-20260829-001-E0041,
AWB-20260829-001-E0046).

## Confidence

**Medium.** Direct local evidence and normative RISC-V text strongly establish
what the current checks do and do not observe. The overall use-case judgment
is conditional because the user's exact readback meaning, primary threat
objective, safety fault model, added cost, and K3 hardware state remain open.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260829-001-E0006 | R2 performs a complete structural and semantic walk of both final roots against sealed canonical authority. | `component://beryllium-repo/include/be/r2.h`; `component://beryllium-repo/arch/riscv/be/sv39x4.c` |
| AWB-20260829-001-E0041 | Both roots use VMID 0; R3/R5 use the exact write-fence-read order; R5 writes with `V=0`; roots remain immutable after seal. | `component://beryllium-repo/planning/single-hart-runtime-r3-evidence.md`; `component://beryllium-repo/planning/single-hart-runtime-r5-evidence.md` |
| AWB-20260829-001-E0046 | RISC-V IOMMU permits old or new second-stage PTE use until processed invalidation and distinguishes leaf/non-leaf forms. | https://github.com/riscv-non-isa/riscv-iommu/blob/054005f4ffe30838a4ffe144a01ea3933ffea6f2/src/iommu_sw_guidelines.adoc#L210-L231 |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-001 | Does the intended feature mean PTE/root reconciliation, HGATP selector readback, or both? | No |
| OPEN-002 | Is the primary objective accidental/fault detection or resistance to a malicious privileged component? | No |
| OPEN-003 | Will a future design transform or copy the R2-walked roots before hardware uses them? | No |
| OPEN-004 | What mechanism excludes firmware, DMA, debug, and physical mutation on the target platform? | No |
| OPEN-005 | Is a quantified functional-safety or transient-fault diagnostic claim required? | No |
| OPEN-006 | Which threats are reachable versus theoretical, and how should they be ranked, in the eventual exact K3 deployment? | No |

## Limitations

- Helium remains a review-and-test proof of concept, neither formally verified
  nor hardware validated.
- Beryllium's current results are bounded host/QEMU evidence; R8-H0 is
  committed but unaccepted and K3 hardware is `NOT RUN`
  (AWB-20260829-001-E0036).
- Xen, Rowhammer, Thunderclap, NIST, RFC 9334, and other public sources are
  architecture or lifecycle analogues, not Beryllium validation.
- Svvptc v1.0 normatively covers S-mode Invalid-to-Valid visibility, not a
  separate ratified Hvvptc/G-stage extension; Linux's G-stage use is
  implementation evidence (AWB-20260829-001-E0045).
- Several safety, attestation, processor-manual, and independent-monitor
  primary texts were inaccessible; no unread contents were inferred.
- This analysis supplies criteria and does not approve retention, removal,
  implementation, promotion, or release.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Inquiry scaffolder | Created the summary. | The summary was initialized for Q-001. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Condensed the report's answer, confidence, load-bearing evidence, open questions, and limitations. | No claim exceeds the comprehensive report. |
| ACTIVITY-003 | 2026-08-29 | Analysis agent | Updated the current stand-alone projection after the fleet-audit correction pass. | Overall confidence remains Medium; the summary now follows FINDING-009 through FINDING-015 and cites superseding evidence. |
| ACTIVITY-004 | 2026-08-29 | Analysis agent | Updated the current projection to cite the exact commit-pinned RISC-V IOMMU release evidence. | E0046 supersedes E0044; the answer and confidence are unchanged. |
