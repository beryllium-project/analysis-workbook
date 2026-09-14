# Which Lifecycle Traces Falsify the Model? - Report

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-003`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Lifecycle falsification
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Which lifecycle traces would falsify the proposed CHERI hypervisor model?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry combined CHERI revocation limits, XRV's restored hypervisor
advisory pointers, and an independent GPT-5.3 Codex stress analysis. It
translated them into adversarial traces and observable failure conditions.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | CHERI temporal safety | Official CHERI documentation | Checked 2026-09-14 | Stale capability handling |
| SURFACE-002 | Hypervisor failure precedents | XRV review inbox | `d618935` | Translation, DMA, ownership, and recovery failures |
| SURFACE-003 | Independent security analysis | Current-session Codex review | 2026-09-14 | Cross-layer adversarial traces |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: Cross-layer authority drift is the highest-risk failure class:
  valid software authority can become stale relative to hardware ownership.
- Evidence IDs: AWB-20260914-002-E0013 through AWB-20260914-002-E0018
- Confidence: High
- Evidence basis: Capability revocation, CPU translation, DMA, device, and
  lifecycle state have distinct update and completion mechanisms.
- Alternatives considered: Treat stale capabilities as harmless once policy
  state changes.
- Counter-evidence: Entry points or hardware paths may still accept or execute
  old authority unless generation and hardware state are checked.
- Limitations: No implementation was executed.

### FINDING-002

- Statement: The highest-value traces are stale-authority resurrection,
  split-commit crash, mixed-object confused deputy, policy rollback, migration
  replay, and recovery replay.
- Evidence IDs: AWB-20260914-002-E0014 through AWB-20260914-002-E0018
- Confidence: High
- Evidence basis: Each trace crosses at least two independently maintained
  authority or enforcement domains.
- Alternatives considered: Test individual services only.
- Counter-evidence: Per-service tests cannot reveal cross-plane ordering or
  ownership mismatches.
- Limitations: Target-specific fault points remain to be enumerated.

### FINDING-003

- Statement: Teardown is safe only after vCPUs stop, DMA drains, interrupt
  routes disappear, CPU and IOMMU mappings are invalidated, generations
  advance, and memory and tags are scrubbed before reuse.
- Evidence IDs: AWB-20260914-002-E0013 through AWB-20260914-002-E0017
- Confidence: High
- Evidence basis: Omitting any path can preserve old-generation influence.
- Alternatives considered: Advance the generation first and complete cleanup
  asynchronously.
- Counter-evidence: Asynchronous cleanup is safe only if the resource remains
  unreclaimable and every entry point rejects the old generation.
- Limitations: Device-specific reset and drain semantics vary.

## Ranked falsification tests

1. Epoch invalidation under repeated create/destroy/reuse.
2. Crash injection between every transaction phase.
3. Cross-object and cross-VM handle substitution.
4. In-flight DMA plus device-reset races during teardown.
5. Signed stale policy or manifest rollback.
6. Interrupt reroute/injection during vCPU migration.
7. Validate-then-commit ownership races.
8. Duplicate and reordered recovery-token replay.
9. Migration replay and capability-profile mismatch.
10. Claim traceability from every assertion to mechanism and boundary.

`Confidence` is `High`, `Medium`, or `Low`. A `Low`-confidence item belongs in
Hypotheses, not in Findings.

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

"Revocation," "rollback," "quiescence," and "completion" are explicit state
predicates, not success return codes or informal intent.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

The traces test a proposed model. They do not assert that a current component
contains an exploitable vulnerability or that any advisory directly applies
to CHERI.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

Availability requirements are not fixed, and the pointer-only advisory
records require later full source review.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

A selected platform with enumerated invalidation, interrupt, device-reset, and
crash semantics would turn the abstract traces into executable tests.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial empty report scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed adversarial lifecycle analysis. | AWB-20260914-002-E0013 through AWB-20260914-002-E0018 | Ten ranked falsification tests recorded. |
