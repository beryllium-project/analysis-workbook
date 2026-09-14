# Which Lifecycle Traces Falsify the Model? - Question

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-003`
Short name: `lifecycle-falsification`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

## Question as stated

Which adversarial lifecycle traces would falsify the proposed security model?

## Question as analyzed

The restated question that the report actually answers. Any narrowing or
sharpening relative to the user's wording is recorded here, not applied
silently.

Which stale-authority, split-commit, confused-deputy, rollback, recovery,
interrupt, DMA, and migration traces must the model reject?

## Resolved sub-scope

- Surfaces in scope: XRV lifecycle analysis, newly restored XSA/CVE pointers,
  CHERI revocation, and independent security-model stress analysis
- Exclusions inherited from the session: exploit development, implementation,
  and target-specific performance
- Additional exclusions for this question: none
- Evidence tiers to be worked: local reviewed and intake evidence, public
  advisories, and derived adversarial traces
- Depth: inherited from the session

## What a good answer enables

What the user intends to decide or do with the answer. This bounds the depth
and shapes the summary.

A ranked falsification suite that can later drive model checking, fault
injection, and implementation tests.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Opened the inquiry. | The question has not been analyzed. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Fixed the lifecycle-falsification question. | Security analysis remained model-level and non-exploitative. |
