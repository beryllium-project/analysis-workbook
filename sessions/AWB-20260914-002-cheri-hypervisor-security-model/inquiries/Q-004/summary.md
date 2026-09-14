# How Should the Model Be Assured? - Summary

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-004`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Layered assurance strategy
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

How should the security model be formalized and assured?

## Answer

Begin with an executable transition model for ownership, generations,
lifecycle, and cross-domain transactions. Then connect it separately to CHERI
ISA semantics, nucleus refinement, pure service specifications, mutation
testing, lifecycle fault injection, and selected information-flow properties.
Every claim must name its component, property, revision, assumptions, and
excluded environment; no kernel or processor proof automatically establishes
whole-hypervisor security.

## Confidence

High for the layered structure and proof-boundary discipline; Medium for tool
and language selection.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-002-E0041 | CHERI formal proof establishes bounded ISA-level monotonicity and isolation. | IEEE S&P 2020 |
| AWB-20260914-002-E0039 | Morello proof assumes fixed translation and excludes key hypervisor mechanisms. | ESOP 2022 |
| AWB-20260914-002-E0040 | seL4 verified configurations exclude device translation and boot. | seL4 verified configurations |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-004 | Which tool and language define the nucleus refinement boundary? | No |

## Limitations

No target or proof tool was selected, and no completed formal-verification
claim is made.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial empty summary scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone assurance summary. | Matches the report. |
