# Post-G-stage install readback use case and threat analysis - Publication checklist

Session ID: `AWB-20260829-001`
Distribution: `private`
Intended distribution: `public-candidate`
Created: `2026-08-29`
Status: `Complete`

A session package is created `private` and stays `private` until a responsible
human records a promotion. Promotion is not publication, licensing,
attribution, sign-off, or release approval.

## Promotion prerequisites

- [ ] Scope and the frozen aspect are confirmed.
- [ ] Evidence sensitivity and redistribution status are reviewed.
- [ ] Citations, alternatives, confidence, assumptions, and limitations are verified.
- [ ] Restricted, private, licensed, and user-supplied material is excluded or cleared.
- [ ] Component assurance boundaries are preserved and not strengthened.
- [ ] A responsible human has separately reviewed the proposed promotion.

## Decisions

- Human promotion record: `HUMAN-PROMOTION-001` (blank; responsible-human action required)
- Publication decision: not-requested
- Licensing decision: not-requested
- Sign-off decision: not-requested

`Publication decision`, `Licensing decision`, and `Sign-off decision` are one
of `not-requested`, `pending`, or `blocked`. This repository never records any
of them as granted.

## Promotion to public-candidate

Promotion to `public-candidate` must fail while any evidence in the package has
sensitivity `internal`, `private`, or `restricted`, or redistribution
`not-approved` or `unknown`.

## HUMAN-PROMOTION records

A promotion record is created blank by the agent and completed only by a
responsible human. The agent must never create, fill, infer, sign, or
impersonate one.

| Field | Value |
| --- | --- |
| Record ID | `HUMAN-PROMOTION-001` |
| Responsible human actor | Not recorded |
| Responsible human role | Not recorded |
| UTC timestamp | Not recorded |
| From distribution | Not recorded |
| To distribution | Not recorded |
| Decision | Not recorded |
| Checklist basis | Not recorded |
| Evidence IDs | Not recorded |
| Limitations | Not recorded |

`Decision` is `promote` or `decline`. A bare record ID does not satisfy
validation; every field must be completed.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Session scaffolder | Created the publication checklist. | The private-package promotion checklist was initialized. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Recorded intended `public-candidate` distribution and allocated a blank human-promotion record. | No promotion decision has been made; every human field remains unrecorded. |
