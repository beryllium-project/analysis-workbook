# What Is the CHERI-Native Authority Model? - Question

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-001`
Short name: `authority-model`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

## Question as stated

What is the minimum coherent authority model for a decomposed hypervisor that
uses CHERI as its core software security mechanism?

## Question as analyzed

The restated question that the report actually answers. Any narrowing or
sharpening relative to the user's wording is recorded here, not applied
silently.

Which principals, objects, roots, delegations, sealed interfaces, revocation
rules, and policy relationships are required so that CHERI authority is
explicit without being confused with hardware virtualization enforcement?

## Resolved sub-scope

- Surfaces in scope: CHERI ISA and H integration, XRV security analysis,
  object-capability hypervisor comparisons, CHERI revocation mechanisms, and
  capability-kernel assurance boundaries
- Exclusions inherited from the session: implementation selection,
  performance claims, hardware approval, and whole-system proof
- Additional exclusions for this question: none
- Evidence tiers to be worked: local research and formal-verification
  synthesis, then public primary specifications and project records
- Depth: inherited from the session

## What a good answer enables

What the user intends to decide or do with the answer. This bounds the depth
and shapes the summary.

A stable vocabulary and a falsifiable set of authority invariants that later
architecture, implementation, and proof work can share.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Opened the inquiry. | The question has not been analyzed. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Fixed the authority-model question and exclusions. | Analysis proceeded without selecting a PoC or implementation. |
