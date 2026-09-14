# What Is the CHERI-Native Authority Model? - Report

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: CHERI-native hypervisor authority
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

What authority model should govern a decomposed CHERI hypervisor?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry compared official CHERI mechanisms with the XRV decomposition
proposal, object-capability hypervisors, revocation mechanisms, and
capability-kernel assurance boundaries. It separates architectural fact from
the proposed object model.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | CHERI architecture | Official ISA and RISC-V CHERI sources | `f2da6557`; checked 2026-09-14 | Capability properties and virtualization boundary |
| SURFACE-002 | XRV research | `component://xrv-research-repo/` | `d618935` | Decomposition and threat model |
| SURFACE-003 | Capability-system comparisons | Prior AWB session and formal-verification research | `0501243`; `c55065c` | Authority graphs and proof limits |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: The model requires separate capability-authority and
  hardware-resource enforcement layers joined by nucleus-checked
  correspondence invariants.
- Evidence IDs: AWB-20260914-002-E0001, AWB-20260914-002-E0002,
  AWB-20260914-002-E0003
- Confidence: High
- Evidence basis: CHERI provides bounded unforgeable software references while
  current H integration retains ordinary virtualization mechanisms.
- Alternatives considered: Treat CHERI capabilities as the sole resource
  authority.
- Counter-evidence: Page walkers, IOMMUs, and interrupt controllers consume
  separate hardware-visible state.
- Limitations: The exact split depends on a future target platform.

### FINDING-002

- Statement: The nucleus should own typed object generations and hardware
  roots; services should receive sealed object handles and bounded operation
  authority rather than ambient resource authority.
- Evidence IDs: AWB-20260914-002-E0003, AWB-20260914-002-E0004,
  AWB-20260914-002-E0031, AWB-20260914-002-E0032,
  AWB-20260914-002-E0044
- Confidence: High
- Evidence basis: A small privileged mechanism plus capability-confined
  services is the recurring practical decomposition.
- Alternatives considered: Give each service direct control of its hardware
  subsystem.
- Counter-evidence: Direct independent control permits cross-subsystem state
  drift and confused-deputy substitution.
- Limitations: This is a proposed synthesis, not an evaluated CHERI design;
  Zyseal is outside the v1 package and local/global capability controls do not
  define hypervisor policy.

### FINDING-003

- Statement: Object generation, entry-point validation, quiescence, and
  hardware invalidation are required because sealing is not revocation.
- Evidence IDs: AWB-20260914-002-E0006, AWB-20260914-002-E0045
- Confidence: High
- Evidence basis: CHERI temporal safety relies on software-managed revocation
  support; stale capabilities may remain representationally valid.
- Alternatives considered: Rely on sealed handles becoming harmless after
  object deletion.
- Counter-evidence: A stale sealed handle can still name an object type and
  reach an entry point unless current generation is checked, and a retained
  superset capability may rebuild a cleared tag.
- Limitations: Generation validation is a proposed hypervisor protocol.

### FINDING-004

- Statement: Policy authorizes delegation, while capabilities represent the
  bounded authority resulting from that decision; neither substitutes for the
  other.
- Evidence IDs: AWB-20260914-002-E0003, AWB-20260914-002-E0005
- Confidence: Medium
- Evidence basis: Capability systems expose authority, but policy freshness,
  information flow, configuration, and proof composition remain distinct.
- Alternatives considered: Encode all policy solely in the capability graph.
- Counter-evidence: Dynamic policy narrowing and information-flow constraints
  require authoritative state beyond possession of a copied capability.
- Limitations: No integrated CHERI hypervisor MAC-plus-capability
  implementation was found.

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

CHERI pointers, software object capabilities, sealed handles, and generic
resource tokens are not interchangeable. The model uses "capability" only for
unforgeable delegated authority and states the enforcement mechanism.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

The model does not strengthen CHERI ISA guarantees into lifecycle correctness
or extend kernel proofs to services, configuration, firmware, compilers, or
hardware.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

The object types and transaction protocol are proposed. No target, PoC, or
proof has been selected, and capability uniqueness is not assumed.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

A complete CHERI hypervisor artifact with an explicit object model, generation
checks, hardware-resource correspondence, and evaluated service compromise
would materially confirm or revise the model.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial empty report scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the authority-model synthesis. | AWB-20260914-002-E0001 through AWB-20260914-002-E0006 | Four bounded findings and one open formalization question recorded. |
