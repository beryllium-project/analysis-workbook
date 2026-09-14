# Was a Pure CHERI Hypervisor Discussed or Considered? - Summary

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-13`
Status: `Complete`
Topic: Pure-CHERI hypervisor discussion history
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

Was a pure-CHERI version of the Beryllium hypervisor discussed or considered
in the locally available project history?

## Answer

Yes. The CHERI-first research stream explicitly proposed a pure-capability
hypervisor direction in July 2026, including a pure-capability HS/EL2 nucleus,
a port of a small RISC-V H-extension hypervisor, and conversion of the core to
pure-capability as a baseline. This remained research/proposed architecture:
the canonical Beryllium implementation instead retained future purecap
compatibility and CHERI targets while selecting a non-CHERI bounded runtime.
No adoption or implementation authorization for a pure-CHERI Beryllium
version was found.

## Confidence

High for the existence and status of the documented discussion. Medium for
the negative statement that no other discussion exists, because locally
unavailable issue/PR conversations may not be represented and the review was
focused rather than exhaustive.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260913-001-E0001 | The original July 2026 XRV survey explicitly proposes a pure-capability core and port sequence. | `component://xrv-research-repo/cheri-hypervisor-research-survey.md` |
| AWB-20260913-001-E0003 | Beryllium keeps CHERI and purecap as future alignment while stating the selected runtime is non-CHERI and does not authorize CHERI work. | `component://beryllium-repo/planning/cheri-alignment.md` |
| AWB-20260913-001-E0006 | Coordination records distinguish the CHERI-first research repository from the canonical implementation repository. | `workspace://COMPONENTS.md` |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| None | No open question has been recorded. | Not applicable |

## Limitations

Local-only, focused review through the listed revisions, including the restored
formal-verification research repository at `e5740de`. Unavailable issue/PR
discussions could contain additional history. No external claims in the XRV
survey were revalidated.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-13 | Inquiry scaffolder | Created the summary. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Completed the standalone summary. | Answer and confidence match the report. |
| ACTIVITY-003 | 2026-09-13 | Analysis orchestrator | Revised the limitations after Q-002 reviewed the restored repository. | The answer remained unchanged. |
