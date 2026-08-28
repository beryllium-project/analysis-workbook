# Fixture aspect - Session

Session ID: `AWB-20000101-001`
Short name: `fixture-aspect`
Distribution: `private`
Intended distribution: `private`
Created: `2000-01-01`
Status: `Complete`
Phase: `Complete`

## SCOPE-001

- Aspect: A synthetic aspect used only to exercise repository validation.
- Review surfaces: SURFACE-001, SURFACE-002
- Exclusions: All real component content; this package cites fixture locators.
- Expected evidence components: Fixture component only.
- Time or revision window: Fixture revision `fixture-0000000`.
- Depth: Standard
- External research: Not permitted for this fixture.
- Public query terms: None; no external query was run.
- Approved component commands: None
- Limitations: Synthetic content; it establishes nothing about Beryllium.

## PHASES-001

- Scope freeze: Complete
- Aspect decomposition: Complete
- Local evidence pass: Complete
- External research: Not applicable - external research was not permitted.
- Deep sweep: Not applicable - depth is Standard.
- Falsification: Complete
- Component command evidence: Not applicable - no command was approved.
- Durable output: Complete

For completion, Scope freeze, Aspect decomposition, Local evidence pass,
Falsification, and Durable output must be exactly `Complete`. External
research must be `Complete` when external research was permitted and
performed, and `Not applicable - <reason>` otherwise. Deep sweep must be
`Complete` for `Deep` depth and may be reasoned not applicable at shallower
depth. Component command evidence may be `Not applicable - <reason>` when no
command was approved.

## Review surfaces

| Surface ID | Surface | Logical locator | Notes |
| --- | --- | --- | --- |
| SURFACE-001 | Fixture surface one | `fixture://surface-one` | Synthetic. |
| SURFACE-002 | Fixture surface two | `fixture://surface-two` | Synthetic. |

## Component revisions

Revisions resolved through `scripts/readonly-inspect.sh` at session start.

| Component | Logical locator | Revision or checked date | Notes |
| --- | --- | --- | --- |
| Fixture component | `fixture://component` | `fixture-0000000` | Synthetic. |

## Inquiry index

| Inquiry ID | Question | Status | Report | Summary |
| --- | --- | --- | --- | --- |
| Q-001 | Fixture question one | Complete | inquiries/Q-001/report.md | inquiries/Q-001/summary.md |
| Q-002 | Fixture question two | Complete | inquiries/Q-002/report.md | inquiries/Q-002/summary.md |

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
| ACTIVITY-001 | 2000-01-01 | Session scaffolder | Created a private draft session package. | None | Synthetic fixture. |
| ACTIVITY-002 | 2000-01-01 | Analysis agent | Froze SCOPE-001 and decomposed the aspect. | None | Synthetic fixture. |
| ACTIVITY-003 | 2000-01-01 | Analysis agent | Completed the local evidence pass. | AWB-20000101-001-E0001 | Synthetic fixture. |
| ACTIVITY-004 | 2000-01-01 | Analysis agent | Completed falsification and durable output. | AWB-20000101-001-E0003 | Synthetic fixture. |
