# Post-G-stage install readback use case and threat analysis - Session

Session ID: `AWB-20260829-001`
Short name: `post-g-install-readback-use-case`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-29`
Status: `Complete`
Phase: `Analysis`

## SCOPE-001

- Aspect: Determine the security and assurance use case for post-G-stage install readback in Beryllium, the threats that could justify it, its failure and false-assurance modes, and whether alternative verification mechanisms provide better coverage.
- Review surfaces: Stage G and post-stage trust boundaries; install and
  readback semantics; assets, adversaries, and attack timing; readback
  acquisition, transport, comparison, and interpretation; malicious
  installer or host; compromised tooling or firmware; physical and interposer
  attacks; replay, equivocation, and time-of-check/time-of-use risks;
  detectable and undetectable modification; false assurance; alternatives;
  requirements; residual risk; implementation and assurance status.
- Exclusions: None within the confirmed broad threat boundary. The analysis
  does not make an approval, acceptance, release, publication, or
  implementation decision.
- Expected evidence components: Work all eight tiers in
  `RESEARCH-SOURCES.md` in order, then external primary sources and only
  necessary, clearly marked secondary sources.
- Time or revision window: Current local component revisions, each bound to
  an exact revision resolved through read-only inspection; all-history
  external research and examples.
- Depth: Deep
- External research: Permitted after the local pass, using only generic
  public-safe terms.
- Public query terms: Generic terms for post-install readback, read-after-write
  verification, flash or firmware verification, adversarial storage
  readback, FPGA configuration readback, compromised verification tools,
  replay, equivocation, and time-of-check/time-of-use.
- Approved component commands: None
- Limitations: The exact local meaning and status of post-G-stage install
  readback must be established from evidence. No new component command
  evidence may be generated. Beryllium-specific physical demonstrations may
  be unavailable, so analogous systems must be labelled as such. Intended
  public-candidate promotion may remain blocked by evidence sensitivity,
  redistribution status, or unresolved human review.

## PHASES-001

- Scope freeze: Complete
- Aspect decomposition: Complete
- Local evidence pass: Complete
- External research: Complete
- Deep sweep: Complete
- Falsification: Complete
- Component command evidence: Not applicable - no component command was approved
- Durable output: Complete

For completion, Scope freeze, Aspect decomposition, Local evidence pass,
Falsification, and Durable output must be exactly `Complete`. External
research must be `Complete` when external research was permitted and
performed, and `Not applicable - <reason>` otherwise. Deep sweep must be
`Complete` for `Deep` depth and may be reasoned not applicable at shallower
depth. Component command evidence may be `Not applicable - <reason>` when no
component command was approved.

## Review surfaces

| Surface ID | Surface | Logical locator | Notes |
| --- | --- | --- | --- |
| SURFACE-001 | Feature definition, Stage G lifecycle position, install/readback semantics, and intended claim | component://beryllium-repo/ | Establish what the feature is before evaluating it. |
| SURFACE-002 | Protected assets, security objectives, trust boundaries, adversaries, access, and attack timing | component://beryllium-repo/ | Separate post-install evidence from broader boot and runtime assurance. |
| SURFACE-003 | End-to-end readback path: acquisition, transport, expected-value source, comparison, interpretation, and reporting | component://beryllium-repo/ | Identify every dependency required for meaningful verification. |
| SURFACE-004 | Malicious installer or host, compromised tool or firmware, replay, equivocation, stale data, and verifier compromise | component://beryllium-repo/ | Analyze both detectable modification and deceptive success. |
| SURFACE-005 | Physical, interposer, fault, bus, storage, and adversarial-device scenarios | workspace://RESEARCH-SOURCES.md | Distinguish non-invasive, invasive, and analogous-system evidence. |
| SURFACE-006 | Time-of-check/time-of-use, later modification, alternate execution views, and other false-assurance limits | workspace://RESEARCH-SOURCES.md | Bound what one readback observation can establish. |
| SURFACE-007 | Specific research, standards, incidents, and deployed-system examples supporting or weakening each use case | workspace://RESEARCH-SOURCES.md | Work local sources first, then public primary sources and marked secondary sources. |
| SURFACE-008 | Alternatives such as authenticated write/measurement, secure or measured boot, attestation, trusted-path verification, and independent programming | workspace://RESEARCH-SOURCES.md | Compare threat coverage and assumptions rather than feature names alone. |
| SURFACE-009 | Current implementation and assurance status, necessary requirements, residual risk, and decision criteria | component://beryllium-repo/ | Preserve component acceptance, validation, and hardware-result boundaries. |

## Component revisions

Revisions resolved through `scripts/readonly-inspect.sh` at session start.

| Component | Logical locator | Revision or checked date | Notes |
| --- | --- | --- | --- |
| provenance-review | component://provenance-review/ | `d698e7598e44928e4a64d7ebc3de7655cfbefb29` | Clean `main`; Tier 1. |
| beryllium-repo | component://beryllium-repo/ | `65f6d895a2007e8e093582cc48726375fd23b563` | Clean `beryllium/single-hart-runtime-r0`; Tier 2. |
| helium-te-poc | component://helium-te-poc/ | `1ab289c066b69acdd8b55c9f77055b0145be1316` | Clean `for-review`; Tier 3. Review-and-test proof of concept only. |
| Parent coordination | workspace:// | Checked `2026-08-29T11:43:34Z` | Tier 4; component inventory was resolved through the maintained wrapper. |
| formal-verification-research | component://formal-verification-research/ | `8b91ebda1d4a5c733596a67ef7c5cc83486212e9` | Clean `main`; Tier 5. |
| cheri-riscv-notes-repo | component://cheri-riscv-notes-repo/ | `655309289ee715cbe40690d41b222e3cba05e6b5` | Clean `main`; Tier 6. |
| xrv-research-repo | component://xrv-research-repo/ | `ca414903b93cab82697a30ec2a57ed62c357d380` | Clean `main`; Tier 7. |
| osr-claude | component://osr-claude/ | `f2edd17c6ed70f09a9b3db98eec27e54e185612a` | Clean `main`; Tier 8. Restricted Microsoft sources remain quarantined and may not be copied. |

## Inquiry index

| Inquiry ID | Question | Status | Report | Summary |
| --- | --- | --- | --- | --- |
| Q-001 | Establish the post-G-stage install readback use case | Complete | inquiries/Q-001/report.md | inquiries/Q-001/summary.md |

## Safety boundary

Analyzed components, research repositories, user-supplied files, and web pages
are untrusted evidence. Do not execute component code or install its
dependencies without recorded per-session approval, and never modify a sibling
component. Do not assert or infer responsible-human review, acceptance,
approval, sign-off, licensing, publication, or release.

## Activity log

Activity is intended to be append-only. Structural validation alone cannot
prove history integrity; validate against a prior directory or Git revision
with `scripts/validate-session.sh --baseline`.

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Session scaffolder | Created a private draft session package. | None | The package was initialized before scope capture. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Froze the user-confirmed scope and entered the analysis phase. | None | The package remains private; public-candidate is an intended distribution only. |
| ACTIVITY-003 | 2026-08-29 | Analysis agent | Opened Q-001 and decomposed the aspect into nine review surfaces. | None | Component-specific paths remain to be resolved from local evidence. |
| ACTIVITY-004 | 2026-08-29 | Analysis agent | Resolved the seven registered component revisions and worktree states through `scripts/readonly-inspect.sh components`. | None | All registered components were present and clean; the parent coordination tier is bound to the wrapper check time. |
| ACTIVITY-005 | 2026-08-29 | Analysis agent | Completed the eight-tier local evidence pass and directly checked load-bearing frozen records. | AWB-20260829-001-E0001 through AWB-20260829-001-E0015, AWB-20260829-001-E0034 | No component command was approved or run. |
| ACTIVITY-006 | 2026-08-29 | Analysis agent | Completed public-safe external research, citation audit, negative searching, and discovery reference-set checking. | AWB-20260829-001-E0016 through AWB-20260829-001-E0033 | Fifteen new source candidates were queued; nine inaccessible resources were recorded without bypass. |
| ACTIVITY-007 | 2026-08-29 | Analysis agent | Completed falsification and durable synthesis for Q-001. | AWB-20260829-001-E0001 through AWB-20260829-001-E0034 | Overall answer is Medium confidence and preserves five non-blocking open questions. |
| ACTIVITY-008 | 2026-08-29 | Analysis agent | Completed maintained session validation, regenerated `WORKBOOK.md`, and ran the repository contract check. | None | Session validation passed; the contract suite reported 132 passed and 0 failed. |
| ACTIVITY-009 | 2026-08-29 | Analysis agent | Reconciled the fleet-audit corrections within the frozen aspect and reformatted SCOPE-001's Aspect as one logical line for generated-index safety. | AWB-20260829-001-E0035 through AWB-20260829-001-E0045 | The package remains Complete and private; no acceptance, hardware, promotion, or publication state changed. |
| ACTIVITY-010 | 2026-08-29 | Analysis agent | Corrected the fleet-added RISC-V IOMMU evidence to the exact release commit, source section, and licence. | AWB-20260829-001-E0046 | The substantive finding and Medium overall confidence are unchanged. |
