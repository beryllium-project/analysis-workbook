# Source discovery log

Sources found while analyzing that are **not** already recorded in an owning
Beryllium research component. This log is the durable record; the pull
interface for other agents is [outbox/pm-queue.md](outbox/pm-queue.md).

Before recording a source here, check the source-discovery reference set in
[RESEARCH-SOURCES.md](RESEARCH-SOURCES.md). A source that could not be checked
against a reachable index is `unconfirmed`, not `new`.

This repository never writes into another component to register a source. The
Project Manager and other research agents pull from the outbox and decide
where a source belongs. See [AGENT-INTERFACE.md](AGENT-INTERFACE.md).

Records are append-only. A correction adds a superseding row and cites the row
it supersedes; it never erases the earlier one.

`Status` is `new` or `unconfirmed`. Only this repository writes those two
values. Only the Project Manager advances an entry beyond them, and it does so
in the outbox.

## Discoveries

| Discovery ID | Session | Title | Authors | Venue and date | Stable URL or DOI | Access result | Relevance to Beryllium | Likely owning component | Indexes checked | Status | Sensitivity | Redistribution | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| None | Not applicable | No discovery has been recorded. | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable |

## Superseded records

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-28 | analysis-workbook | Created the source discovery log. | No discovery has been recorded. |
