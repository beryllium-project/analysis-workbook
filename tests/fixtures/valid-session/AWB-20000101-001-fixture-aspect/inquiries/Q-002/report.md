# Fixture question two - Report

Session ID: `AWB-20000101-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2000-01-01`
Status: `Complete`
Topic: Fixture topic B
Confidence: Medium

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Fixture question two, restated to name SURFACE-002 explicitly.

## Method

The fixture tier was read directly. Nothing was delegated and no component
command was approved or run.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-002 | Fixture surface two | `fixture://surface-two` | `fixture-0000000` | Full |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: The fixture surface records a synthetic marker value.
- Evidence IDs: AWB-20000101-001-E0003, AWB-20000101-001-E0004
- Confidence: Medium
- Evidence basis: Two direct fixture observations at the same revision.
- Alternatives considered: The marker could be generated rather than stored.
- Counter-evidence: None was found in the fixture tier.
- Limitations: The fixture is synthetic and establishes nothing about Beryllium.

`Confidence` is `High`, `Medium`, or `Low`. A `Low`-confidence item belongs in
Hypotheses, not in Findings.

## Hypotheses

Possibilities that the evidence suggests but does not establish. These are not
conclusions.

| Hypothesis ID | Statement | Supporting evidence IDs | What would confirm it | What would refute it |
| --- | --- | --- | --- | --- |
| HYP-002 | The marker is stable across fixture revisions. | AWB-20000101-001-E0003 | A second fixture revision. | A differing marker value. |

## Assumptions in use

Assumptions standing in for unanswered non-blocking questions.

| Open ID | Assumption | Why it was necessary | Effect if wrong |
| --- | --- | --- | --- |
| OPEN-002 | Two surfaces remain sufficient. | The third surface was not requested. | Coverage would be narrower than assumed. |

## Disagreements and terminology

No disagreement arose within the fixture tier. The term "marker" is used only
in the fixture sense and does not correspond to any Beryllium term.

## Assurance boundaries preserved

This fixture asserts nothing about Helium, which is a review-and-test proof of
concept that is not formally verified and not hardware validated; nothing
about CBMC results, which hold only within their stated source, property, and
tool boundary; and nothing about Beryllium R8-H0, which is committed but not
accepted, with K3 hardware `NOT RUN`.

## Limitations

The fixture is synthetic. It does not establish any property of any Beryllium
component and must never be cited as evidence about one.

## What would change the answer

A second fixture revision with a different marker value.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2000-01-01 | Inquiry scaffolder | Created the report. | None | Synthetic fixture. |
| ACTIVITY-002 | 2000-01-01 | Analysis agent | Recorded FINDING-001. | AWB-20000101-001-E0003 | Synthetic fixture. |
