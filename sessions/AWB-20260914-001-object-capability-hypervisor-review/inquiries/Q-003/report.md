# Which Patterns Recur and What Limits Them? - Report

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-003`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Recurring patterns and limiting counter-evidence
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Which design and assurance patterns recur, and what counter-evidence limits
them?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry compared direct CHERI work, software object-capability
hypervisors, capability-kernel VMM substrates, and bounded comparators. Each
candidate pattern was tested against missing functions, assurance scope,
terminology collisions, and systems that implement only part of the pattern.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-003 | Assurance precedents | `component://formal-verification-research/` | `e5740de`; 2026-09-14 | Proof and TCB boundaries |
| SURFACE-005 | XRV architecture and gap analysis | `component://xrv-research-repo/` | `ca41490`; 2026-09-14 | Patterns and negative findings |
| SURFACE-006 | Capability lineage | `component://osr-claude/` | `f2edd17`; 2026-09-14 | Authority and terminology |
| SURFACE-007 | Direct system documentation | Public primary sources | 2026-09-14 | Pattern corroboration and counter-evidence |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: The most consistent pattern is a small privileged nucleus that owns hardware-visible state while capability-confined user components implement VMM services and policy.
- Evidence IDs: AWB-20260914-001-E0019, AWB-20260914-001-E0023
- Confidence: High
- Evidence basis: NOVA, Hedron, L4Re, seL4 frameworks, CAP-VMs, and CHERI comparators all reduce privileged code and make authority transfer explicit.
- Alternatives considered: CHERI alone might remove the need for hardware-VM and kernel boundaries.
- Counter-evidence: The reviewed CHERI H integration and systems retain translation, interrupt, DMA, and privileged-state mechanisms outside pointer capabilities.
- Limitations: No one CHERI hypervisor implements the complete decomposed target architecture.

### FINDING-002

- Statement: Capability enforcement and virtualization enforcement form complementary layers rather than substitutes.
- Evidence IDs: AWB-20260914-001-E0020, AWB-20260914-001-E0022
- Confidence: High
- Evidence basis: CHERI governs tagged references and compartments, while G-stage translation, IOMMUs, interrupt ownership, and lifecycle mechanisms continue to mediate VM and device resources.
- Alternatives considered: Capability-valued page-table roots or capability-aware DMA could unify these layers.
- Counter-evidence: No reviewed current system or specification demonstrates that unified model end to end.
- Limitations: Future CHERI specifications or hardware may change the division.

### FINDING-003

- Statement: Capability graphs improve authority visibility, but they do not solve revocation, semantic misuse, availability, information-flow policy, or assurance composition by themselves.
- Evidence IDs: AWB-20260914-001-E0021, AWB-20260914-001-E0022, AWB-20260914-001-E0025
- Confidence: High
- Evidence basis: The evidence repeatedly requires separate lifecycle, revocation, policy, configuration, and proof boundaries.
- Alternatives considered: Sealing or static capability allocation might be sufficient for fixed systems.
- Counter-evidence: Even fixed systems retain trusted loaders, switchers, VMMs, configurations, and device protocols; valid authority can still be misused.
- Limitations: The required mechanisms vary with the threat model and dynamism.

### FINDING-004

- Statement: The complete CHERI-native decomposed hypervisor remains an open evidence gap.
- Evidence IDs: AWB-20260914-001-E0024
- Confidence: Medium
- Evidence basis: Direct candidates each cover only part of the target: purecap core, CHERI guest state, capability compartments, or capability-kernel VMMs.
- Alternatives considered: An unlocated Bao-CHERI, CHERI-Hafnium, or proprietary Helix artifact may cover more.
- Counter-evidence: No accessible architecture, source, or evaluation establishes the full set.
- Limitations: Search-bound negative.

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

CHERI capabilities, software object capabilities, and generic software handles
share delegation vocabulary but have different forgery, representation,
revocation, and mediation properties. "Microhypervisor" also spans NOVA-like
kernel/VMM decomposition and systems whose primary security model may not be
capabilities.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

Kernel verification does not automatically establish VMM, configuration,
device-model, firmware, compiler, or hardware correctness. NOVA's current
verification work is ongoing; CHERI-seL4 modifications do not inherit all
existing seL4 proof claims.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

No full candidate was reproduced or executed. Several direct CHERI artifacts
are unlocated or experimental, and proprietary internals remain unavailable.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

A complete evaluated CHERI hypervisor with explicit capability roots,
decomposed services, hardware-resource correspondence, lifecycle, and bounded
assurance would change the fourth finding.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed pattern comparison and falsification. | AWB-20260914-001-E0019 through AWB-20260914-001-E0025 | Four bounded findings recorded. |
