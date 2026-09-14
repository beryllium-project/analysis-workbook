# Does the Restored Formal Verification Repository Change the Finding? - Summary

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-13`
Status: `Complete`
Topic: Restored formal-verification repository review
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

Does the restored formal-verification research repository change the original
pure-CHERI hypervisor history finding?

## Answer

No. The repository is now available and was reviewed at clean revision
`e5740de`. It contains extensive Beryllium verification strategy and CHERIoT
comparison material, but no pure-CHERI or pure-capability hypervisor proposal.
The original conclusion remains: a pure-capability direction was explicitly
considered in XRV research, but was not selected or authorized in the
Beryllium implementation history.

## Confidence

High.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260913-001-E0009 | Closes the earlier repository-availability gap at the previously recorded revision. | `component://formal-verification-research/` |
| AWB-20260913-001-E0010 | The directly relevant Beryllium verification workstream contains no pure-capability hypervisor proposal. | `component://formal-verification-research/workstreams/beryllium/` |
| AWB-20260913-001-E0011 | CHERIoT is used as methodology precedent, not as selection of a pure-CHERI Beryllium design. | `component://formal-verification-research/notes/cheriot.md` |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| None | No open question has been recorded. | Not applicable |

## Limitations

Focused committed-history review only; no external sources or uncommitted
branches were examined.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-13 | Inquiry scaffolder | Created the summary. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Completed the standalone update summary. | The original answer remains unchanged. |
