# What Is the CHERI-Native Authority Model? - Summary

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: CHERI-native hypervisor authority
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

What is the minimum coherent authority model for a decomposed CHERI
hypervisor?

## Answer

Use a two-layer model. CHERI capabilities and sealed entry points govern
software authority; a minimal nucleus separately owns authoritative object
generations and hardware-visible roots. Services receive typed, bounded
authority to propose operations, but the nucleus validates policy, ownership,
generation, and cross-resource invariants before committing state. Sealing is
not revocation, so teardown and reuse require generation invalidation,
quiescence, hardware unmapping, and scrubbing.

## Confidence

High for the required separation and revocation limits; Medium for the
proposed exact object and transaction design.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-002-E0001 | CHERI supplies bounded, unforgeable, monotonic software references. | CHERI ISAv9 |
| AWB-20260914-002-E0002 | CHERI H integration does not replace virtualization resource mechanisms. | RISC-V CHERI specification |
| AWB-20260914-002-E0031 | Type capabilities can make seal/unseal authority explicit. | RISC-V CHERI Zyseal |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-001 | Must any authority be unique or linear rather than copyable? | No |

## Limitations

This is a research model, not an implemented or verified architecture. It does
not assume that capabilities are unique or that kernel proof claims compose
automatically.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial empty summary scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone authority summary. | Matches the report and preserves the proposal boundary. |
