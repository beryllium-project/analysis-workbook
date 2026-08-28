# Fixture aspect - Source discoveries

Session ID: `AWB-20000101-001`
Distribution: `private`
Created: `2000-01-01`
Status: `Complete`

Sources found during this session that are not recorded in an owning Beryllium
research component. Each record is mirrored into `SOURCE-DISCOVERY-LOG.md` and
appended to `outbox/pm-queue.md` with status `new`.

Check the source-discovery reference set in `RESEARCH-SOURCES.md` before
recording. A source that could not be checked against a reachable index is
`unconfirmed`, not `new`.

This repository never writes into another component to register a source.

## Discoveries

| Discovery ID | Title | Authors | Venue and date | Stable URL or DOI | Access result | Relevance to Beryllium | Likely owning component | Indexes checked | Status | Sensitivity | Redistribution | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| DISC-001 | Fixture source | Fixture author | Fixture venue 2000 | `fixture://doi/0000` | retrieved | Synthetic; none. | Fixture component | Fixture index | new | public | approved | 2000-01-01 |

`Status` is `new` or `unconfirmed`. Only this agent writes these two values,
and only the Project Manager advances an entry beyond them in the outbox.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2000-01-01 | Session scaffolder | Created the discovery record. | Synthetic fixture. |
| ACTIVITY-002 | 2000-01-01 | Analysis agent | Recorded DISC-001 and mirrored it to the outbox. | Synthetic fixture. |
