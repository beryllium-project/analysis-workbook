# Smdbltrp consideration and coverage gaps - Report

Session ID: `AWB-20260915-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-15`
Status: `Complete`
Topic: Smdbltrp and Ssdbltrp consideration across Beryllium and Helium
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Has the Beryllium project, including Helium, considered the RISC-V
double-trap extensions explicitly or through equivalent supervisor or
hypervisor trap behavior across review, analysis, planning, and threat
modeling; where is the evidence and what material gaps remain?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The analysis worked all eight local tiers in `RESEARCH-SOURCES.md`, checked
prior analysis and coordination indexes, and used the maintained
`readonly-inspect.sh` wrapper for component revisions and selected histories.
Three write-disabled evidence agents examined non-overlapping core,
coordination/threat, and research surfaces. Their observations were synthesized
only after resolving material gaps with official RISC-V, QEMU, OpenSBI, Spike,
and profile sources. No component-owned command was approved or run.

Exact and expanded terms included `Smdbltrp`, `Ssdbltrp`, double trap,
double-fault, `SDT`, `MDT`, `DTE`, nested or reentrant trap, trap while
handling a trap, critical-error state, RNMI, and Smrnmi. Negative results are
bounded to the paths, revisions, dates, and queries in `search-log.md`.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | Explicit extension references | All local tiers; official RISC-V sources | Revisions in `session.md`; checked 2026-09-15 | No authored local project record located; public normative identity resolved. |
| SURFACE-002 | Equivalent supervisor double-trap behavior | Beryllium trap path; Helium source and reviews; threat packages | Beryllium `102f2b0`; Helium `1ab289c`; threat-modeler `c4126b6` | Substantial implicit coverage found. |
| SURFACE-003 | Review records | Helium review packages; provenance-review; security-reviewer | Revisions in `session.md` | Nested-trap findings exist; no named extension review and no security-review engagement. |
| SURFACE-004 | Analysis records | Threat-modeler and research components | Revisions in `session.md` | Multiple nested-trap analyses; no explicit mechanism analysis. |
| SURFACE-005 | Planning records | Beryllium feature inventories, roadmaps, PM records | `102f2b0`; PM checked 2026-09-15 | Generic optional-state fail-closed coverage exists; no named disposition. |
| SURFACE-006 | Threat modeling | Three Helium threat-model runs | threat-modeler `c4126b6` | Hazard considered with divergent severity and unresolved reachability. |
| SURFACE-007 | Helium pathfinder | Source, limits, reviews, remediation | `1ab289c066b69acdd8b55c9f77055b0145be1316` | Non-nesting is an explicit fixed-profile assumption and non-goal. |
| SURFACE-008 | Terminology and dependencies | Local archives; ratified spec; QEMU, OpenSBI, Spike | checked 2026-09-15 | User terminology corrected; firmware and hardware support remain unknown. |
| SURFACE-009 | Negative and counter-evidence | All tiers and external query families | checked 2026-09-15 | Absence is bounded; scope exclusion and generic catch-alls remain plausible alternatives. |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: No authored Beryllium, Helium, Project Manager, threat-model,
  security-review, provenance, research, or prior-analysis record located in
  the checked corpus explicitly names or evaluates `Smdbltrp` or `Ssdbltrp`.
- Evidence IDs: AWB-20260915-001-E0002, AWB-20260915-001-E0006,
  AWB-20260915-001-E0011, AWB-20260915-001-E0013,
  AWB-20260915-001-E0014, AWB-20260915-001-E0016,
  AWB-20260915-001-E0023, AWB-20260915-001-E0024
- Confidence: High
- Evidence basis: Exact-term searches and directed reads covered all eight
  registry tiers, current coordination indexes, prior sessions, and selected
  component histories. Local tokens occur in third-party upstream artifacts,
  including QEMU and Spike snapshots and manifest-indexed OpenSBI list
  archives, but not in authored project analysis.
- Alternatives considered: A term may exist in an unread file or unavailable
  history; older records may use only nested-trap vocabulary.
- Counter-evidence: The dirty Beryllium worktree and sampled broad documents
  prevent a universal proof of absence, and generic optional-state rows may
  implicitly subsume the extension.
- Limitations: This is a bounded negative over the enumerated evidence set, not
  a claim that no person ever considered the extension.

### FINDING-002

- Statement: The project has considered the underlying double-trap hazard
  materially, especially trap entry while the handler is non-reentrant, but
  generally as a software nesting assumption, fail-stop path, or unresolved
  threat rather than as an ISA-extension decision.
- Evidence IDs: AWB-20260915-001-E0004, AWB-20260915-001-E0006,
  AWB-20260915-001-E0007, AWB-20260915-001-E0008,
  AWB-20260915-001-E0009, AWB-20260915-001-E0010
- Confidence: High
- Evidence basis: Beryllium's R5 path explicitly protects the trusted-stack
  transition and terminalizes later traps. Helium explicitly excludes nesting,
  independent reviews identify the fault-on-fault window, and three threat
  models treat the nested-trap risk with different dispositions.
- Alternatives considered: The named RISC-V extensions may have been regarded
  as irrelevant because interrupts are disabled, nesting is unsupported, or
  firmware and ISA behavior are outside the source boundary.
- Counter-evidence: No located record connects these software controls or
  assumptions to SDT, MDT, DTE, exception code 16, RNMI, or critical-error
  semantics.
- Limitations: Similarity of hazard does not establish awareness of the
  architectural mechanism.

### FINDING-003

- Statement: The frozen question's terminology is incorrect: `Smdbltrp`
  addresses double traps in M-mode, while `Ssdbltrp` addresses double traps in
  S, HS, and VS contexts and is the extension directly relevant to an HS-mode
  hypervisor.
- Evidence IDs: AWB-20260915-001-E0024, AWB-20260915-001-E0017,
  AWB-20260915-001-E0018, AWB-20260915-001-E0019
- Confidence: High
- Evidence basis: The ratified v1.0 RISC-V source defines the two extensions
  separately, matching the independent QEMU and Spike tokens already present
  in the local archive.
- Alternatives considered: “Smdbltrp” might be used informally as a family
  name.
- Counter-evidence: No official source located uses Smdbltrp as the name of the
  supervisor extension.
- Limitations: The report preserves the user's requested term while expanding
  only to the directly paired Ssdbltrp mechanism needed to answer accurately.

### FINDING-004

- Statement: Ssdbltrp is relevant to the modeled hazard but is not a complete
  substitute for sound trap-entry software: it detects a second trap while
  SDT is set and escalates it to M-mode, whereas the local findings also
  concern state corruption or guest-valued stores during early handler entry.
- Evidence IDs: AWB-20260915-001-E0004, AWB-20260915-001-E0007,
  AWB-20260915-001-E0009, AWB-20260915-001-E0018,
  AWB-20260915-001-E0025
- Confidence: High
- Evidence basis: The normative mechanism sets SDT on trap entry and routes an
  unexpected second trap to M-mode. Local findings concern what software does
  before it establishes safe state and before or during the second fault.
- Alternatives considered: Hardware escalation could be viewed as sufficient
  because it prevents re-entry into the same S/HS handler.
- Counter-evidence: The specification does not retroactively undo stores or
  guarantee recoverability, and OpenSBI's handling depends on advertised
  extension support and firmware policy.
- Limitations: No target execution was approved, so applicability to the
  intended platform is unknown.

### FINDING-005

- Statement: The main coverage gap is not total ignorance of nested traps; it
  is the absence of an explicit, current disposition of both ratified
  extensions across platform inventory, security review, threat modeling,
  firmware dependency, and assurance boundaries.
- Evidence IDs: AWB-20260915-001-E0002, AWB-20260915-001-E0003,
  AWB-20260915-001-E0011, AWB-20260915-001-E0012,
  AWB-20260915-001-E0017, AWB-20260915-001-E0020,
  AWB-20260915-001-E0025, AWB-20260915-001-E0022
- Confidence: High
- Evidence basis: Beryllium's planning rule expects relevant platform security
  features to be explicitly classified, the security-review contract has not
  been exercised, the proof boundary excludes the mechanism's domain, and
  upstream support exists while RVA23 does not mandate it.
- Alternatives considered: Generic `henvcfg` and optional-state stop rows may
  be sufficient for a profile that discovers the feature as unsupported.
- Counter-evidence: No evidence establishes target hardware support, required
  profile inclusion, or a reachable current Helium trigger.
- Limitations: The analysis proposes no adoption decision; it identifies the
  missing decision record and evidence needed to make one.

`Confidence` is `High`, `Medium`, or `Low`. A `Low`-confidence item belongs in
Hypotheses, not in Findings.

## Hypotheses

Possibilities that the evidence suggests but does not establish. These are not
conclusions.

| Hypothesis ID | Statement | Supporting evidence IDs | What would confirm it | What would refute it |
| --- | --- | --- | --- | --- |
| HYPOTHESIS-001 | The intended platform may not implement either extension, making an explicit unsupported disposition the correct outcome. | AWB-20260915-001-E0002, AWB-20260915-001-E0022 | Authoritative hardware and firmware capability evidence | Evidence that the target advertises and enables either extension |
| HYPOTHESIS-002 | Beryllium's generic optional-state controls may already fail closed on an implemented but unmodeled DTE field. | AWB-20260915-001-E0003 | A review tracing DTE discovery and reset/readback behavior through the actual platform path | A target path that enables DTE without being captured by those controls |

## Assumptions in use

Assumptions standing in for unanswered non-blocking questions.

| Open ID | Assumption | Why it was necessary | Effect if wrong |
| --- | --- | --- | --- |
| OPEN-001 | Target implementation and enablement are unknown. | No component command was approved and local target evidence does not establish the feature. | A supported target could materially strengthen the case for explicit integration and testing. |
| OPEN-002 | No project disposition is inferred from generic catch-all rows. | Explicit classification is absent. | A current owner record may show deliberate coverage under a broader feature row. |

## Disagreements and terminology

Conflicting statements between components, and terms that mean different
things in different components, each with both citations.

`Smdbltrp` is M-mode; `Ssdbltrp` covers S/HS/VS
(AWB-20260915-001-E0017 through E0019). Local “double-fault”
wording refers to a software panic-stack concept, not the ratified exception.
Local “re-entrant” evidence about a pure C decision function is unrelated to
trap-handler reentrancy. `DTE` means the double-trap-enable CSR field in the
ratified specification (AWB-20260915-001-E0018), but means “Domain and Type
Enforcement” in CHERI-oriented material (AWB-20260915-001-E0026).

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

Helium remains a review-and-test proof of concept, not formally verified or
hardware validated. Its non-nesting assumption and review findings are not
proof claims or responsible-human acceptance. Beryllium R8-H0 remains a
committed or locally observed candidate rather than accepted work, and K3
hardware remains `NOT RUN`. Threat-model findings are conditional analysis,
not observed compromise or risk acceptance. CBMC results do not cover traps,
CSRs, assembly, ISA, firmware, emulator, or hardware behavior.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

The current Beryllium checkout is dirty and its tracked `main` differs from the
older canonical branch recorded by the parent registry; substantive current
observations came from a nested `102f2b0` checkout and are not a clean current
branch snapshot. Broad negative searches were bounded by the agents' read-only
tooling and enumerated files. No hardware or firmware capability command was
approved. Public upstream support does not establish target support. The
package contains private and not-approved evidence, so it is not currently
eligible for public-candidate promotion.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

Authoritative target hardware and firmware evidence showing whether Ssdbltrp
or Smdbltrp is implemented and enabled would most change the applicability
assessment. A current owner review that explicitly classifies each extension
as used, deferred, verified, or unsupported would close the planning and review
gap. An approved target execution could test observed CSR behavior, but no such
command was approved for this session.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-15 | Inquiry scaffolder | Created the report. | None | Initial scaffold preceded the completed synthesis below. |
| ACTIVITY-002 | 2026-09-15 | Analysis orchestrator | Synthesized the local-first, external-primary, and falsification passes. | AWB-20260915-001-E0001 through AWB-20260915-001-E0023 | Five High-confidence findings; two implementation and disposition questions remain open. |
