# Fixture question two - Evidence

Session ID: `AWB-20000101-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2000-01-01`
Status: `Complete`

Observations only. What a source says belongs here; what follows from it
belongs in `report.md`.

Evidence IDs are `AWB-20000101-001-E####`, unique within the session and never
reused or renumbered. This ledger is append-only; a correction adds a
superseding row and cites the row it supersedes.

## Ledger

| Evidence ID | Class | Role | Logical locator | Revision or checked date | Observation | Sensitivity | Redistribution | Limitation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AWB-20000101-001-E0003 | Local implementation | Direct | `fixture://surface-two` | `fixture-0000000` | The fixture surface records marker value zero. | public | approved | Synthetic fixture content. |
| AWB-20000101-001-E0004 | Local implementation | Corroborating | `fixture://surface-two` | `fixture-0000000` | A re-read of the fixture surface reports the same marker value. | public | approved | Same source as E0003; not independent. |

`Class` is one of `Local implementation`, `Local assurance`,
`Local coordination`, `Local research`, `Local provenance`, `External primary`,
`External secondary`, or `User-supplied`.

`Role` is one of `Direct`, `Corroborating`, `Contextual`, `Counter`, or
`Negative`.

`Sensitivity` is one of `public`, `internal`, `private`, or `restricted`.

`Redistribution` is one of `approved`, `not-approved`, `unknown`, or
`not-applicable`.

## Superseded records

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2000-01-01 | Inquiry scaffolder | Created the evidence ledger. | Synthetic fixture. |
| ACTIVITY-002 | 2000-01-01 | Analysis agent | Appended E0003 and E0004. | Synthetic fixture. |
