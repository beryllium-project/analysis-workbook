# What Should Beryllium Retain? - Report

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-004`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Bounded implications for Beryllium
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

What evidence-backed implications and open questions should Beryllium retain?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry compared Q-001 through Q-003 against Beryllium's current
implementation and planning boundary. It records research inputs and questions
only; PoC selection, architecture decisions, implementation sequencing, and
authorization remain explicitly excluded.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | Beryllium and Helium current state | `component://beryllium-repo/`, `component://helium-te-poc/` | `65f6d89`, `1ab289c`; 2026-09-14 | Current non-CHERI boundary and bounded lessons |
| SURFACE-002 | Coordination state | `component://project-manager/` | `b2bbbf1`; 2026-09-14 | XRV reconciliation and owner routing |
| SURFACE-005 | XRV research baseline | `component://xrv-research-repo/` | `ca41490`; 2026-09-14 | Gaps and candidate corpus |
| SURFACE-007 | Synthesized public evidence | Q-001 through Q-003 | 2026-09-14 | Direct candidates, maturity, and patterns |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: Beryllium should retain separate abstractions for capability authority and hardware-virtualization resource enforcement.
- Evidence IDs: AWB-20260914-001-E0020, AWB-20260914-001-E0026
- Confidence: High
- Evidence basis: Current CHERI virtualization evidence leaves G-stage, IOMMU, interrupts, and lifecycle as distinct mechanisms, while Beryllium already keeps its current interfaces independent of guest pointer representation.
- Alternatives considered: A future CHERI platform could unify authority and translation more deeply.
- Counter-evidence: No reviewed current platform demonstrates such unification.
- Limitations: Research input, not a design requirement.

### FINDING-002

- Statement: The most useful comparison programme is direct study of NOVA, Hedron, L4Re, and seL4 VMM authority graphs alongside CHERI-native candidates.
- Evidence IDs: AWB-20260914-001-E0027
- Confidence: High
- Evidence basis: These systems provide current implementation evidence for capability-mediated VMM decomposition that the CHERI candidates do not yet provide.
- Alternatives considered: CHERI-only research could avoid semantic mismatch.
- Counter-evidence: A CHERI-only corpus is too thin to answer lifecycle, VMM decomposition, product maturity, and assurance-composition questions.
- Limitations: Software object capabilities do not prove CHERI performance or hardware behavior.

### FINDING-003

- Statement: Beryllium should preserve explicit gates for root-authority construction, delegation, revocation, VMM/service trust, device and DMA correspondence, and proof scope.
- Evidence IDs: AWB-20260914-001-E0019, AWB-20260914-001-E0021, AWB-20260914-001-E0022
- Confidence: High
- Evidence basis: These are recurring seams and recurring failure boundaries across the reviewed systems.
- Alternatives considered: A static fixed configuration could omit some dynamic lifecycle mechanisms.
- Counter-evidence: Even static systems require construction-time authority, trusted loaders/configuration, and teardown or reuse rules.
- Limitations: Exact gates depend on a future selected target and threat model.

### FINDING-004

- Statement: This review does not support a CHERI PoC decision.
- Evidence IDs: AWB-20260914-001-E0030
- Confidence: High
- Evidence basis: Direct CHERI artifacts remain experimental, incomplete, or unavailable, and PoC planning was excluded.
- Alternatives considered: Bao-CHERI's announcement could be enough to choose a target.
- Counter-evidence: Its source, methodology, hardware target, and reproducibility remain unresolved.
- Limitations: A later, separately scoped PoC evaluation may use this review.

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
| OPEN-002 | No PoC target or implementation plan is selected. | Target, threat model, hardware, and evaluation contract were excluded from this review. | A separately confirmed planning session could supersede this assumption. |

## Disagreements and terminology

Conflicting statements between components, and terms that mean different
things in different components, each with both citations.

No conflict with Beryllium's current documents was found: they already treat
CHERI as future alignment rather than current implementation. The session uses
"capability" only with an explicit qualifier.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

Beryllium R8-H0 remains committed and not accepted; H1-H4 are unauthorized and
K3 is `NOT RUN`. Helium remains a review-and-test PoC, not formally verified
or hardware validated. This analysis grants no architecture or PoC approval.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

The review did not select a target or run candidate systems. XRV needs
Project Manager-coordinated owner updates, including preservation of its
missing historical review-record issue.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

The highest-value open inputs are a reproducible Bao-CHERI artifact, a pinned
current CHERI H-extension specification, verified CHERI-Microkit or
CHERI-Hafnium results, and explicit target hardware with virtualization,
tag-preservation, and device/DMA semantics.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the bounded Beryllium implication synthesis. | AWB-20260914-001-E0026 through AWB-20260914-001-E0030 and cited prior evidence | Research inputs recorded without a PoC or architecture decision. |
