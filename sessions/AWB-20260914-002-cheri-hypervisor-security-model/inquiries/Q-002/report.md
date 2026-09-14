# How Must Capability Authority Correspond to Hardware Resources? - Report

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Capability-to-hardware correspondence
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

How must CHERI authority correspond to hardware-visible virtualization state?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry compared official CHERI H and IOMMU specifications with XRV's
memory, device, interrupt, and lifecycle analysis, then defined the minimum
cross-layer relations needed to prevent authority drift.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | CHERI and virtualization specifications | Official RISC-V repositories | `f2da6557`; `65ee9427` | Capability state and hardware translation |
| SURFACE-002 | XRV security analysis | `component://xrv-research-repo/` | `d618935` | Ownership, DMA, interrupts, lifecycle |
| SURFACE-003 | Prior comparative analysis | `component://analysis-workbook/sessions/AWB-20260914-001-object-capability-hypervisor-review/` | `0501243` | Counter-evidence and limits |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: Every live CPU mapping, DMA mapping, interrupt route, and vCPU
  binding must correspond to a current owner, generation, policy decision, and
  delegated authority.
- Evidence IDs: AWB-20260914-002-E0007 through AWB-20260914-002-E0011,
  AWB-20260914-002-E0033 through AWB-20260914-002-E0038
- Confidence: High
- Evidence basis: CHERI authority and hardware-consumed integer state remain
  distinct and can diverge unless a trusted relation joins them.
- Alternatives considered: Treat capability possession as proof of hardware
  assignment.
- Counter-evidence: Devices and page walkers do not consume ordinary CHERI
  capabilities as their authority source.
- Limitations: The exact relation must be refined for a selected platform;
  RISC-V CHERI and Morello currently differ in G-stage capability controls.

### FINDING-002

- Statement: Cross-subsystem changes require a transaction with prepare,
  validation, quiescence, commit, invalidation, publication, and recovery
  phases.
- Evidence IDs: AWB-20260914-002-E0008, AWB-20260914-002-E0009,
  AWB-20260914-002-E0034 through
  AWB-20260914-002-E0036
- Confidence: High
- Evidence basis: Resource reassignment spans CPU translations, DMA, devices,
  interrupts, and lifecycle state with independent completion conditions.
- Alternatives considered: Let each service update its subsystem
  independently.
- Counter-evidence: Independent success can expose split ownership and stale
  access after a crash.
- Limitations: Atomicity may be logical and recoverable rather than one
  hardware instruction.

### FINDING-004

- Statement: Walker memory, tag storage, VMID/GSCID allocation, and interrupt
  files are first-class correspondence objects rather than platform details.
- Evidence IDs: AWB-20260914-002-E0034, AWB-20260914-002-E0035,
  AWB-20260914-002-E0038, AWB-20260914-002-E0046
- Confidence: High
- Evidence basis: Unchecked implicit walks, cache identifier reuse, and
  straggler MSIs can bypass an otherwise valid software authority graph.
- Alternatives considered: Leave these resources inside platform assumptions.
- Counter-evidence: The specifications expose concrete stale-state and
  unpredictability conditions.
- Limitations: Exact platform topology remains target-specific.

### FINDING-003

- Statement: Permission non-amplification is the conjunction of policy,
  delegated capability authority, authoritative ownership, and hardware
  permissions.
- Evidence IDs: AWB-20260914-002-E0009 through AWB-20260914-002-E0011,
  AWB-20260914-002-E0033, AWB-20260914-002-E0046
- Confidence: High
- Evidence basis: Any one layer can be broader or stale while the others
  appear valid.
- Alternatives considered: Use the most restrictive observed layer as the
  effective policy.
- Counter-evidence: A stale permissive hardware path remains exploitable even
  if software authority was narrowed.
- Limitations: Information-flow and side-channel properties need additional
  models.

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

"Capability," "ownership," and "mapping" are separate state categories. The
model avoids using one as shorthand for another.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

The correspondence properties are proposed requirements. They do not imply
that current RISC-V CHERI, IOMMU, SmMTT, or XRV artifacts implement them.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

No target-specific invalidation, interrupt, or device-reset semantics were
proved. Availability and timing isolation are outside this inquiry.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

An evaluated artifact that binds CHERI object authority to CPU, DMA,
interrupt, and lifecycle state would materially validate or refute the
proposed relations.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial empty report scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the correspondence synthesis. | AWB-20260914-002-E0007 through AWB-20260914-002-E0046 | Four candidate safety relations recorded. |
