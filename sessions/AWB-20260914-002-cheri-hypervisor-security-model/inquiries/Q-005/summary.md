# What Would a CHERI Equivalent to Helium Require for Direct Comparison? - Summary

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-005`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Helium-to-CHERI direct comparison
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

What would a CHERI equivalent to Helium require for direct comparison?

## Answer

Freeze one exact Helium baseline and define one independent external
specification for its bounded two-subject behavior. The frozen Tier 8
candidate already contains bounded CBMC properties and killed mutations but
is not formally verified as a system. The Helium and CHERI implementations
should separately refine the common specification and be compared across
functional behavior, named security properties, TCB and authority, evidence,
matched formal obligations, mutations, performance, and residual assumptions.
Functional equality must not be reported as security or formal-verification
parity.

## Confidence

High for the comparison method; Medium for feasibility until the baseline and
CHERI target are selected.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-002-E0025 | Helium supplies a bounded fixed scenario and exact claim. | Helium handoff |
| AWB-20260914-002-E0027 | HET-001 defines the transferable FV method. | Analysis-workbook transfer queue |
| AWB-20260914-002-E0042 | The frozen candidate has bounded named CBMC properties but no whole-system proof. | Helium verification boundary |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-005 | Which exact Helium commit is the comparator? | No |
| OPEN-006 | Which CHERI platform can reproduce the scenario? | No |

## Limitations

No baseline, target, implementation, or formal tool is selected. Helium is not
formally verified as a system; its existing bounded CBMC property inventory is
the minimum evidence set a fair comparator must address.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial empty summary scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone parity summary. | Matches the report and preserves all gates. |
