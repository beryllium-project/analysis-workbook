# How Must Capability Authority Correspond to Hardware Resources? - Question

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-002`
Short name: `resource-correspondence`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

## Question as stated

How must capability authority correspond to hardware-visible VM resources?

## Question as analyzed

The restated question that the report actually answers. Any narrowing or
sharpening relative to the user's wording is recorded here, not applied
silently.

Which invariants must connect CHERI authority to physical ownership, G-stage
translations, IOMMU mappings, interrupt routes, vCPU state, devices, policy,
and attestation?

## Resolved sub-scope

- Surfaces in scope: RISC-V CHERI H integration, RISC-V IOMMU, XRV memory,
  device, interrupt, lifecycle, and attestation analysis
- Exclusions inherited from the session: implementation selection and
  performance evaluation
- Additional exclusions for this question: none
- Evidence tiers to be worked: local research, official architecture
  specifications, and reviewed non-CHERI comparison evidence
- Depth: inherited from the session

## What a good answer enables

What the user intends to decide or do with the answer. This bounds the depth
and shapes the summary.

A precise state relation and candidate safety properties suitable for later
formalization and test design.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Opened the inquiry. | The question has not been analyzed. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Fixed the correspondence question. | Analysis separated software authority from hardware enforcement. |
