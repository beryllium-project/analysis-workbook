# Which Lifecycle Traces Falsify the Model? - Summary

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-003`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Lifecycle falsification
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

Which adversarial lifecycle traces would falsify the model?

## Answer

The critical target is cross-layer authority drift. The model fails if stale
software authority, CPU mappings, DMA mappings, interrupt routes, vCPU state,
or policy versions survive an ownership-generation change. The first tests
should inject failures at every transaction phase, reuse objects aggressively,
mix handles from different VMs, race teardown against DMA and interrupts, and
replay stale policy, recovery, or migration state.

## Confidence

High for the failure classes and ranking; Medium for target-specific test
details.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-002-E0013 | Temporal safety must tolerate stale capability copies. | CHERI revocation documentation |
| AWB-20260914-002-E0015 | In-flight DMA makes teardown a cross-domain protocol. | XRV XSA-302 intake |
| AWB-20260914-002-E0018 | Independent analysis ranks authority drift and split commit highest. | Current-session Codex review |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-003 | Which failures must preserve availability as well as isolation? | No |

## Limitations

The traces are abstract and do not claim a vulnerability in current project
code. Exact fault points depend on a selected target.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial empty summary scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone falsification summary. | Matches the report. |
