# How Must Capability Authority Correspond to Hardware Resources? - Summary

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Capability-to-hardware correspondence
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

How must capability authority correspond to hardware-visible VM resources?

## Answer

Every usable hardware path must be justified by current software authority and
authoritative ownership. For memory, DMA, interrupts, vCPUs, and devices, the
nucleus must check object generation, policy, delegated permissions, and
hardware state together. Resource changes require a fail-closed transaction;
capability possession alone cannot prove that an integer page table, IOMMU
entry, or interrupt route is safe.

## Confidence

High for the need for explicit correspondence; Medium for the proposed
transaction decomposition.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-002-E0007 | CHERI H integration retains separate virtualization mechanisms. | RISC-V CHERI specification |
| AWB-20260914-002-E0034 | IOMMU identifier reuse and invalidation create explicit stale-state windows. | RISC-V IOMMU specification |
| AWB-20260914-002-E0035 | Interrupt migration requires IOMMU and controller quiescence. | RISC-V AIA specification |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-002 | Which target defines exact invalidation, interrupt, and reset ordering? | No |

## Limitations

No concrete hardware protocol was proved. The model does not cover timing or
microarchitectural side channels.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial empty summary scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone correspondence summary. | Matches the report. |
