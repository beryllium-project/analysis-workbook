# What Would a CHERI Equivalent to Helium Require for Direct Comparison? - Report

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-005`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Helium-to-CHERI direct comparison
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

What would a CHERI equivalent to Helium require for direct comparison,
including formal-verification parity?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry treated Helium as an exact bounded reference, reviewed its claim
and exclusions, applied the HET-001 verification method, and designed a
mechanism-neutral parity contract. It did not select a baseline or authorize
implementation.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | Helium fixed claim and architecture | `component://helium-te-poc/` | `1ab289c` | Functional and security boundary |
| SURFACE-002 | Transferable FV method | `component://analysis-workbook/outbox/helium-transfer-queue.md` | `0501243` | Independent specification, mutation, and evidence |
| SURFACE-003 | Formal-verification strategy | `component://formal-verification-research/` | `c55065c` | Claim and correspondence boundaries |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: A fair CHERI counterpart requires one common
  mechanism-independent external specification and two separate refinement
  arguments.
- Evidence IDs: AWB-20260914-002-E0025 through AWB-20260914-002-E0028
- Confidence: High
- Evidence basis: Comparing implementation-specific tables or control flow
  would privilege one design and obscure semantic differences.
- Alternatives considered: Port Helium line by line to pure-capability C.
- Counter-evidence: A mechanical port can preserve accidental structure and
  fail to expose CHERI's changed authority model.
- Limitations: No baseline or target is selected.

### FINDING-002

- Statement: Parity must be reported on separate functional, security,
  evidence, formal-verification, and residual-assumption axes.
- Evidence IDs: AWB-20260914-002-E0027, AWB-20260914-002-E0028,
  AWB-20260914-002-E0042, AWB-20260914-002-E0043
- Confidence: High
- Evidence basis: Equal traces can coexist with different TCBs, authority
  graphs, proof scopes, and hardware assumptions.
- Alternatives considered: One aggregate parity score.
- Counter-evidence: An aggregate score hides evidence asymmetry and can imply
  security equivalence from functional success.
- Limitations: Quantitative metrics remain to be frozen.

### FINDING-003

- Statement: Formal-verification parity means checking the same named
  properties against one common abstract relation, with separate abstraction
  functions and explicit implementation-specific assumptions.
- Evidence IDs: AWB-20260914-002-E0027, AWB-20260914-002-E0028,
  AWB-20260914-002-E0042, AWB-20260914-002-E0043
- Confidence: High
- Evidence basis: HET-001 requires independent specification, explicit
  rollback, planned mutations, exact evidence, and adjacent assumptions.
- Alternatives considered: Count proof obligations, solver runs, or passing
  tests.
- Counter-evidence: Equal counts do not establish equivalent properties or
  assurance.
- Limitations: Helium is not formally verified as a system, but the frozen
  candidate already has a bounded CBMC property and mutation inventory. FV
  parity must therefore be evaluated property by property and reported as an
  asymmetry where the CHERI counterpart lacks matched evidence.

## Recommended staged experiment

1. Select one exact Helium baseline through a responsible-human record.
2. Freeze the common functional and security specification.
3. Build an undecomposed CHERI counterpart of the same bounded scenario.
4. Run one shared differential trace suite.
5. Apply matched mutation classes and bounded formal checks.
6. Compare TCB, mutable authority, code size, evidence, proof scope, runtime
   cost, and residual assumptions.
7. Only then decide whether CHERI-specific decomposition is a justified second
   experiment.

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

"Equivalent" means equivalent to the common specification within stated
bounds, not identical mechanisms or whole-system security.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

Helium remains a review-and-test PoC, not formally verified or hardware
validated. This inquiry does not authorize a CHERI implementation.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

The Helium baseline, CHERI target, toolchain, proof tool, and quantitative
metrics remain open.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

A responsible-human baseline selection and a feasible CHERI virtualization
target would allow this plan to become a bounded implementation proposal.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial empty report scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the Helium-to-CHERI parity design. | AWB-20260914-002-E0025 through AWB-20260914-002-E0030 | Three findings and a seven-step staged experiment recorded. |
