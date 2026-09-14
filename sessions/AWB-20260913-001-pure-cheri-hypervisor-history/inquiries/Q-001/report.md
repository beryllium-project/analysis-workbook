# Was a Pure CHERI Hypervisor Discussed or Considered? - Report

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-13`
Status: `Complete`
Topic: Pure-CHERI hypervisor discussion history
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Does locally available project documentation or Git history show that a
pure-CHERI hypervisor was discussed or considered, and if so, where, when,
and with what apparent level of commitment?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The review followed the local component topology and read-only boundary. It
resolved current component revisions with
`scripts/readonly-inspect.sh`, inspected committed trees and histories, and
then read the directly relevant historical files. The focused search used
`pure CHERI`, `pure-capability`, `purecap`, `CHERI-first`, `CHERI-only`,
`hybrid`, `hypervisor`, `VMM`, and `XRV`. A delegated evidence sweep was
attempted but could not invoke the mandated wrapper, so its output was not
used as evidence. No component command, build, test, network query, or
external research was performed.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | Parent coordination records | `workspace://SOT.md`, `workspace://COMPONENTS.md`, `component://project-manager/` | Parent `c1a192f`; Project Manager `b2bbbf1`; 2026-09-13 | Roles, topology, handoff, component cards, committed history |
| SURFACE-002 | Canonical Beryllium implementation | `component://beryllium-repo/` | `65f6d89`; 2026-09-13 | Planning documents, selected architecture, roadmap, and history |
| SURFACE-003 | CHERI-first hypervisor research | `component://xrv-research-repo/` | `ca41490`; original survey commit `6a29638`; 2026-09-13 | Full survey, handoff, tree, and history |
| SURFACE-004 | CHERI and OS-security research | `component://cheri-riscv-notes-repo/`, `component://osr-claude/` | `6553092`, `f2edd17`; 2026-09-13 | Committed tree/history and directly relevant overview material; restricted OSR subtree excluded |
| SURFACE-005 | Remaining sibling histories | `component://helium-te-poc/`, `component://provenance-review/`, `component://threat-modeler/`, `component://security-reviewer/`, `component://analysis-workbook/` | Revisions in `session.md`; 2026-09-13 | Focused tree, handoff, terminology, and commit-subject sweep |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: Yes. The project explicitly considered a pure-capability CHERI hypervisor direction in the CHERI-first research stream by 20-21 July 2026.
- Evidence IDs: AWB-20260913-001-E0001, AWB-20260913-001-E0002
- Confidence: High
- Evidence basis: The initial committed survey describes a pure-capability HS/EL2 nucleus, recommends starting from a small RISC-V H-extension hypervisor for a pure-capability port, and then converting the core to pure-capability.
- Alternatives considered: The wording might describe only third-party Bao-CHERI rather than a project option.
- Counter-evidence: The same survey separately identifies Bao-CHERI as prior art and labels its own architecture and implementation sequence as proposed, showing that the pure-capability sequence was an internal research recommendation rather than only a citation.
- Limitations: The record is a research survey, not an implementation plan accepted by the Beryllium owner.

### FINDING-002

- Statement: The pure-CHERI idea did not become the selected or authorized Beryllium implementation path in the reviewed history.
- Evidence IDs: AWB-20260913-001-E0003, AWB-20260913-001-E0004, AWB-20260913-001-E0005, AWB-20260913-001-E0006
- Confidence: High
- Evidence basis: Beryllium's own planning preserves CHERI alignment, purecap-compatible interfaces, and future CHERI targets, but explicitly says the selected runtime is non-CHERI and that CHERI implementation is not authorized in the selected architecture phase.
- Alternatives considered: Purecap extensibility and future targets could be read as an implicit roadmap commitment.
- Counter-evidence: The documents consistently describe these as future experiments, targets, research inputs, or compatibility requirements rather than an approved milestone.
- Limitations: This conclusion is bounded to committed local history through the reviewed revisions.

### FINDING-003

- Statement: No separate adoption or implementation record was found elsewhere in the available project repositories.
- Evidence IDs: AWB-20260913-001-E0007, AWB-20260913-001-E0009, AWB-20260913-001-E0010
- Confidence: Medium
- Evidence basis: The remaining repositories' committed trees, relevant handoffs, and commit subjects contained no distinct project-specific pure-CHERI hypervisor decision or implementation record. The restored formal-verification repository was reviewed separately at `e5740de` and likewise contained no such proposal.
- Alternatives considered: A discussion may exist in unindexed issue or pull-request conversations, uncommitted work, or a file outside the focused terminology sweep.
- Counter-evidence: None located locally.
- Limitations: One worktree was dirty and therefore reviewed only at its committed revision, and this was intentionally a focused rather than exhaustive line-by-line audit.

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

The term "pure-capability" is used both for a code/ABI mode and for a broader
hypervisor architecture. The XRV survey uses both senses: an undecomposed
pure-capability baseline and a proposed decomposed architecture whose nucleus
and services are CHERI compartments. Beryllium's implementation documents use
"purecap contexts" primarily as a future compatibility target, not as the
selected runtime architecture.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

The XRV material is research and proposed architecture, not implementation
authorization. The Beryllium repository is authoritative for selected
implementation state; its reviewed revision keeps CHERI work future-facing
and the current bounded runtime non-CHERI. No finding here establishes
acceptance, implementation, formal verification, hardware validation,
publication, or release.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

The review was local-only and focused. It did not independently revalidate the
external sources summarized by XRV. The dirty CHERI-notes checkout was examined only at committed revision
`6553092`; uncommitted content was excluded. Issue and pull-request discussions
not preserved in the local repositories may be missing.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

An owner-authored Beryllium decision or accepted plan explicitly selecting a
pure-capability implementation would change the second finding. Locally
unavailable issue/PR history could add earlier discussion, but would not by
itself establish adoption.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-13 | Inquiry scaffolder | Created the report. | None | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Completed the local-first historical review and falsification pass. | AWB-20260913-001-E0001 through AWB-20260913-001-E0008 | Explicit research consideration found; no implementation adoption found. |
| ACTIVITY-003 | 2026-09-13 | Analysis orchestrator | Incorporated the restored formal-verification repository review from Q-002. | AWB-20260913-001-E0009, AWB-20260913-001-E0010 | Original findings unchanged; prior availability limitation removed. |
