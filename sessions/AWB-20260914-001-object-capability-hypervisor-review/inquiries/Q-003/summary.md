# Which Patterns Recur and What Limits Them? - Summary

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-003`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Recurring patterns and limiting counter-evidence
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

Which patterns recur, and what limits their transfer?

## Answer

The recurring architecture is a **small privileged nucleus plus
capability-confined user-space VMM and service components**. Capabilities make
resource authority explicit, but remain complementary to G-stage translation,
IOMMUs, interrupts, and lifecycle enforcement. Capability graphs and sealed
interfaces improve least privilege and auditability; they do not independently
solve revocation, semantic misuse, availability, information flow, or proof
composition. No reviewed CHERI system implements and evaluates the complete
application-class decomposed hypervisor pattern.

## Confidence

High for the recurring patterns; Medium for the negative completeness finding.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-001-E0019 | Multiple systems use a small privileged mechanism with user-space services. | XRV and candidate primary records |
| AWB-20260914-001-E0020 | CHERI does not replace G-stage, IOMMU, or other VM resource enforcement. | RISC-V CHERI H integration |
| AWB-20260914-001-E0024 | No complete evaluated CHERI decomposed hypervisor was found. | Candidate-wide negative evidence |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| None | No open question has been recorded. | Not applicable |

## Limitations

The review did not execute systems or inspect proprietary internals. Negative
findings are bounded to accessible evidence.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone patterns summary. | Matches the report. |
