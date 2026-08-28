# @@TITLE@@ - Session

Session ID: `@@SESSION_ID@@`
Short name: `@@SHORT_NAME@@`
Distribution: `private`
Intended distribution: `private`
Created: `@@CREATED_DATE@@`
Status: `Draft`
Phase: `Planning`

## SCOPE-001

- Aspect: not yet supplied
- Review surfaces: SURFACE-001
- Exclusions: not yet supplied
- Expected evidence components: not yet supplied
- Time or revision window: not yet supplied
- Depth: not yet supplied
- External research: not yet supplied
- Public query terms: not yet supplied
- Approved component commands: None
- Limitations: Session setup only; the effective scope is not frozen.

## PHASES-001

- Scope freeze: Incomplete
- Aspect decomposition: Incomplete
- Local evidence pass: Incomplete
- External research: Incomplete
- Deep sweep: Incomplete
- Falsification: Incomplete
- Component command evidence: Incomplete
- Durable output: Incomplete

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
| SURFACE-001 | Not yet decomposed | Not yet supplied | Session setup only. |

## Component revisions

Revisions resolved through `scripts/readonly-inspect.sh` at session start.

| Component | Logical locator | Revision or checked date | Notes |
| --- | --- | --- | --- |
| Not yet resolved | Not yet supplied | Not yet supplied | Session setup only. |

## Inquiry index

| Inquiry ID | Question | Status | Report | Summary |
| --- | --- | --- | --- | --- |
| None | No question has been opened. | Not started | Not created | Not created |

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
| ACTIVITY-001 | @@CREATED_DATE@@ | Session scaffolder | Created a private draft session package. | None | Analysis has not started. |
