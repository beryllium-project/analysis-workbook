# Post-G-stage install readback use case and threat analysis - Handoff

Session ID: `AWB-20260829-001`
Distribution: `private`
Created: `2026-08-29`
Status: `Complete`

## Overall position

Q-001 is complete. Post-G-stage install readback has a defensible but narrow
use as a pre-activation diagnostic and admission check for persistent
accidental divergence. Beryllium's complete fixed-profile R2 software walk
and R3/R5 HGATP selector transaction serve different purposes and retain
separate claims. In bounded QEMU, architectural HGATP readback equaled the
expected selector; this is not K3 hardware evidence. Both roots use VMID 0,
and the all-address/all-VMID `HFENCE.GVMA` in the
`csrw -> hfence -> csrr` transaction, not selector equality, discharges the
current same-VMID reuse case under the `V=0` no-intervening-translation
assumption. A new duplicate same-memory PTE pass has low marginal value on the
strong local final-pool/no-post-seal-write evidence; public negative searches
are weak corroboration. Same-path readback does not establish stale-cache,
IOMMU, DMA, later-mutation, debug, replay, or physical-fault resistance, and a
physical split view remains an unconfirmed hypothesis.

## Frozen scope

Frozen in `session.md` as SCOPE-001. Current local revisions and all-history
external research are in scope; no attack class is explicitly excluded; no
component command is approved; public-safe external research is permitted;
the package remains private with `public-candidate` as the intended
post-analysis distribution.

## Completed inquiries

| Inquiry ID | Question | Confidence | Report | Summary |
| --- | --- | --- | --- | --- |
| Q-001 | Does post-G-stage install readback have a defensible security or assurance use case, under which threats, assumptions, requirements, and alternatives? | Medium | [report](inquiries/Q-001/report.md) | [summary](inquiries/Q-001/summary.md) |

## Outstanding open questions

| Open ID | Question | Blocking | Assumption in use |
| --- | --- | --- | --- |
| OPEN-001 | Does the intended feature mean PTE/root reconciliation, HGATP selector readback, or both? | No | Analyze both and keep claims separate. |
| OPEN-002 | Is the primary objective accidental or hardware-fault detection, or resistance to a malicious privileged component? | No | Analyze both threat classes separately. |
| OPEN-003 | Will a future design copy or transform the R2-walked roots before hardware use? | No | Current final-buffer and no-post-seal-edit evidence remains authoritative. |
| OPEN-004 | What excludes firmware, DMA, debug, and physical mutation on the target platform? | No | Credit no such protection before retained K3 evidence. |
| OPEN-005 | Is quantified functional-safety diagnostic coverage required? | No | Make no quantified transient-fault claim. |
| OPEN-006 | Which listed threats are reachable versus theoretical, and how should they be ranked, in the eventual exact K3 deployment? | No | Keep platform-dependent threats bounded and unranked until an accepted exact profile identifies writers and protections. |

## Validation

Validation completed:

```sh
bash ./scripts/validate-session.sh sessions/AWB-20260829-001-post-g-install-readback-use-case
# OK: 1 inquiry, 46 evidence records, complete mode

bash ./scripts/update-workbook.sh
# OK: WORKBOOK.md regenerated for 1 session and 1 inquiry

bash ./tests/validate-agent.sh
# OK: 132 passed, 0 failed
```

## Exact next action

Review the corrected condensed answer, then record responsible-human answers
for OPEN-001, OPEN-002, OPEN-004, and OPEN-006 without changing the package
distribution:

```sh
less sessions/AWB-20260829-001-post-g-install-readback-use-case/inquiries/Q-001/summary.md
```

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Session scaffolder | Created the session handoff. | The handoff was initialized before scope capture. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Recorded the frozen scope and immediate continuation point. | Q-001 remains to be allocated. |
| ACTIVITY-003 | 2026-08-29 | Analysis agent | Recorded Q-001 and the completed aspect decomposition. | The local evidence pass is the next action. |
| ACTIVITY-004 | 2026-08-29 | Analysis agent | Recorded exact registered component revisions and states. | All seven registered component worktrees were present and clean. |
| ACTIVITY-005 | 2026-08-29 | Analysis agent | Completed Q-001 and recorded its answer, open questions, artifact paths, and next human review action. | Draft validation passed; completion validation remained pending at this record. |
| ACTIVITY-006 | 2026-08-29 | Analysis agent | Recorded completion validation, workbook regeneration, and repository contract-check results. | Session validation passed; the contract suite reported 132 passed and 0 failed. |
| ACTIVITY-007 | 2026-08-29 | Analysis agent | Reconciled the fleet-audit findings and updated the current handoff position and continuation point. | Evidence now extends through E0045, DISC-016 and PMQ-016 are mirrored, OPEN-006 is open, and distribution remains private. |
| ACTIVITY-008 | 2026-08-29 | Analysis agent | Recorded post-correction completion validation, workbook regeneration, and repository contract results. | Session validation passed with 45 evidence records; the contract suite reported 132 passed and 0 failed. |
| ACTIVITY-009 | 2026-08-29 | Analysis agent | Recorded the exact release-commit correction for the RISC-V IOMMU citation. | Evidence now extends through E0046; final completion validation is recorded in the validation section. |
