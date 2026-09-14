# How Should the Model Be Assured? - Report

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-004`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Layered assurance strategy
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

How should the proposed security model be formalized and assured?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry compared CHERI architectural models, capability-kernel proof
boundaries, processor RTL verification, current NOVA verification pointers,
and local staged-verification methods. It assigns claims to layers rather than
assuming one proof composes across the system.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | CHERI architectural semantics | XRV Sail intake and official sources | XRV `d618935` | ISA-level executable model |
| SURFACE-002 | Kernel and processor verification | Formal-verification research | `c55065c` | Refinement and RTL proof boundaries |
| SURFACE-003 | Staged implementation assurance | Local FV workstreams | `c55065c` | Pure/effect separation, mutation, and claim discipline |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: The assurance case must be layered across architecture, abstract
  state, nucleus refinement, services, configuration, hardware realization,
  and integration testing.
- Evidence IDs: AWB-20260914-002-E0019 through AWB-20260914-002-E0024,
  AWB-20260914-002-E0039 through AWB-20260914-002-E0041
- Confidence: High
- Evidence basis: Existing strong proofs each cover bounded components and
  assumptions; none composes automatically into whole-system security.
- Alternatives considered: Select one proof assistant and model the entire
  system monolithically.
- Counter-evidence: Devices, firmware, concurrency, hardware tables, and
  service software require different semantics and evidence.
- Limitations: Exact tooling remains open. The Morello proof excludes
  translation management, GIC, concurrency, and side channels; seL4 verified
  configurations separately exclude device translation and boot.

### FINDING-002

- Statement: The first formal artifact should be a small transition system for
  ownership, generations, lifecycle, and cross-domain transactions.
- Evidence IDs: AWB-20260914-002-E0019, AWB-20260914-002-E0023
- Confidence: High
- Evidence basis: These states define the cross-layer invariants and can be
  analyzed before implementation details dominate.
- Alternatives considered: Begin with source-code verification.
- Counter-evidence: Code proof without a stable abstract security contract can
  verify the wrong decomposition or omit hardware correspondence.
- Limitations: The model must later refine to concrete architecture semantics.

### FINDING-003

- Statement: Verification claims require explicit traceability to mechanism,
  model, assumptions, implementation revision, and excluded environment.
- Evidence IDs: AWB-20260914-002-E0020 through AWB-20260914-002-E0024,
  AWB-20260914-002-E0047
- Confidence: High
- Evidence basis: Capability-kernel, processor, VMM, and local FV results have
  non-identical scopes.
- Alternatives considered: Summarize the system as formally verified if its
  nucleus is proved.
- Counter-evidence: User services, configuration, devices, firmware, and
  hardware remain outside such a claim.
- Limitations: This is claim discipline, not proof completion.

## Proposed assurance ladder

1. Executable abstract transition model and invariant checking.
2. CHERI ISA trace alignment for capability operations and architectural state.
3. Nucleus refinement for object validation and hardware commit operations.
4. Pure functional specifications for builders and policy decisions.
5. Mutation and negative testing for authority-widening defects.
6. Fault injection and model-based tests for transaction/lifecycle traces.
7. Information-flow or noninterference arguments for selected boundaries.
8. Binary/compiler/hardware evidence only as separately scoped claims.

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

"Formal verification" is always qualified by component, property, model,
revision, assumptions, and trusted computing base.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

No reviewed proof establishes the proposed model. Existing seL4, CHERIoT,
Sail, NOVA, and local FV evidence remains bounded to its own artifacts.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

Tool selection, implementation language, concurrency model, and target
hardware are unresolved.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

A selected target plus a mechanized transition model and refinement boundary
would determine whether the proposed assurance ladder is practical.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial empty report scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the layered assurance plan. | AWB-20260914-002-E0019 through AWB-20260914-002-E0024 | Three findings and an eight-step assurance ladder recorded. |
