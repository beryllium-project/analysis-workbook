# What Should Beryllium Retain? - Summary

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-004`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Bounded implications for Beryllium
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

What should Beryllium retain from this review?

## Answer

Beryllium should retain a **two-layer model**: capability authority and
hardware-virtualization resource enforcement remain separate but connected.
The strongest practical comparison set is NOVA, Hedron, L4Re, and seL4-based
VMMs alongside the thinner CHERI-native evidence. Future evaluation should
keep explicit gates for root authority, delegation, revocation, service trust,
device/DMA correspondence, lifecycle, and assurance scope. The review does
**not** support selecting or chartering a CHERI PoC now.

## Confidence

High.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-001-E0020 | Capability and hardware-VM enforcement remain complementary. | CHERI H integration and XRV analysis |
| AWB-20260914-001-E0027 | Current software object-capability hypervisors supply the strongest implementation comparisons. | Q-001 through Q-003 |
| AWB-20260914-001-E0030 | Evidence is insufficient for a PoC decision within this scope. | Candidate-wide negative evidence |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-002 | What exact target, threat model, hardware, and evaluation contract would govern a later PoC assessment? | No |

## Limitations

No candidate was executed and no design was selected. Project Manager
coordination is required for later XRV owner updates.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone Beryllium summary. | Matches the report and preserves the non-decision boundary. |
