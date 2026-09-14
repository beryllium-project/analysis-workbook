# Does the Restored Formal Verification Repository Change the Finding? - Report

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-13`
Status: `Complete`
Topic: Restored formal-verification repository review
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Does the restored formal-verification research repository change the Q-001
finding about a pure-CHERI Beryllium hypervisor?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The repository was resolved through `scripts/readonly-inspect.sh` as clean
`main` at `e5740de`. Its instructions and handoff were read first. The review
then covered the Beryllium workstream, CHERIoT note, comparison synthesis,
relevant committed tree, and component history using the same focused
terminology as Q-001. No component code or research tooling was executed.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | Component identity, instructions, and handoff | `component://formal-verification-research/` | `e5740de`; 2026-09-13 | Complete |
| SURFACE-002 | Beryllium formal-verification workstream | `component://formal-verification-research/workstreams/beryllium/` | `e5740de`; 2026-09-13 | Complete focused review |
| SURFACE-003 | CHERIoT and cross-system comparison | `component://formal-verification-research/notes/cheriot.md`, `component://formal-verification-research/comparison/summary.md` | `e5740de`; 2026-09-13 | Complete focused review |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: The restored formal-verification research repository does not change the Q-001 conclusion.
- Evidence IDs: AWB-20260913-001-E0009, AWB-20260913-001-E0010, AWB-20260913-001-E0011
- Confidence: High
- Evidence basis: The repository is now available at its previously recorded revision. Its Beryllium workstream evaluates verification strategy for the existing non-CHERI path and uses CHERIoT as an assurance-method precedent; it contains no pure-capability hypervisor proposal.
- Alternatives considered: CHERIoT material might imply a pure-CHERI Beryllium design.
- Counter-evidence: The material frames CHERIoT as a comparison and reusable assurance pattern, while the Beryllium workstream remains tied to Helium's RV64 TE design and future verification choices.
- Limitations: The focused review does not cover unavailable external discussions or prove that no informal conversation occurred.

## Hypotheses

Possibilities that the evidence suggests but does not establish. These are not
conclusions.

| Hypothesis ID | Statement | Supporting evidence IDs | What would confirm it | What would refute it |
| --- | --- | --- | --- | --- |
| None | No hypothesis has been recorded. | Not applicable | Not applicable | Not applicable |

## Assumptions in use

Assumptions standing in for unanswered non-blocking questions.

| Open ID | Assumption | Why it was necessary | Effect if wrong |
| --- | --- | --- | --- |
| None | No assumption is in use. | Not applicable | Not applicable |

## Disagreements and terminology

Conflicting statements between components, and terms that mean different
things in different components, each with both citations.

No material disagreement was found. "Pure" in the formal-verification handoff's
"pure runtime transition" refers to effect-separated proof structure, not to
CHERI purecap execution.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

The repository is research input. Its recommendations do not authorize or
select Beryllium architecture, implementation, assurance, publication, or
release.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

Local committed history only; no external citations were revalidated and no
component command was run.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

An explicit purecap hypervisor proposal in a restored branch or unreviewed
artifact, or an owner-authored Beryllium selection record, would change the
answer. None was found at `e5740de`.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-13 | Inquiry scaffolder | Created the report. | None | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Completed the restored-repository review and falsification. | AWB-20260913-001-E0009 through AWB-20260913-001-E0011 | Original position unchanged. |
