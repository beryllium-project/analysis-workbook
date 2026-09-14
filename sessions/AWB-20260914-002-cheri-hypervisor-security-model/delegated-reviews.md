# Delegated Research and Security Reviews

Session ID: `AWB-20260914-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

## Claude Fable 5.1 primary-source research

The read-only research pass checked current primary sources and identified
revision-level evidence that materially sharpened the draft:

- RISC-V CHERI revision
  `f2da6557b0490fbd1e01b7c636f670b9021c1be7` includes the first-stage
  S-mode and VS-mode `Svyrg`
  PTE extension in the v1 package, while the H integration chapter remains
  experimental and does not define RVY controls in G-stage PTEs.
- `Zyseal` makes sealing authority explicit through bounded type
  capabilities with seal/unseal permissions, but its maturity labels are not
  fully consistent across the specification.
- `Zylevels1` supplies global/local and load/store authority relevant to
  capability non-egress.
- RISC-V IOMMU and AIA specifications define explicit invalidation and
  interrupt-migration windows with old/new state and straggler-event hazards.
- Current NOVA documentation models guest-physical and DMA spaces as
  capability spaces and documents partial failure during device reassignment.
- Morello/CheriBSD expose stage-2 capability load/store controls, unlike the
  current experimental RISC-V CHERI H chapter; a CHERI hypervisor model is
  therefore ISA-specific.
- Existing Morello and seL4 proof boundaries exclude translation management,
  SMMU/IOMMU, interrupt-controller, boot, or related hypervisor-critical
  layers.
- Five previously unindexed formal-verification sources were identified and
  recorded as `DISC-022..026` and `PMQ-022..026`.

### Parent disposition

Adopted the specification maturity correction, ISA-specific G-stage
distinction, GSCID and invalidation invariants, AIA migration quiescence,
walker/tag-memory assumptions, and proof-boundary refinements. The new source
pointers were queued under the analysis-workbook protocol.

## GPT-5.3 Codex security-model analysis

The read-only security analysis identified cross-layer authority drift as the
highest-risk class and ranked:

1. stale-authority resurrection;
2. split-commit crash;
3. mixed-object confused-deputy requests;
4. DMA-drain and device-reset races;
5. signed policy rollback;
6. interrupt migration races;
7. validate-then-commit ownership races;
8. recovery-token replay;
9. migration replay or profile mismatch; and
10. assurance-claim traceability failures.

### Parent disposition

Adopted generation-bound authority, atomic multi-plane commit, recovery
idempotence, semantic migration reconstruction, and the ranked falsification
suite. Preserved the distinction between architectural evidence and proposed
design.

## Remaining review step

The second-pass critique identified and drove corrections for the Helium
baseline, source attributions, ASR authority, shared-resource grants, YBLD
rebuild authority, first-stage/G-stage wording, VMID invalidation, proof
attribution, and parity fairness. A final review verifies those dispositions.

## Final Fable verification

Claude Fable 5.1 verified all requested corrections and found three residual
issues: one circular Q-002 evidence citation, ambiguous `Svyrg` maturity
wording, and the non-durable Codex review locator. All three were corrected.
No other high- or medium-confidence substantive issue remained.
