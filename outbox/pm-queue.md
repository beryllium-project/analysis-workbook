# Project Manager queue

A **pull** interface. This repository appends rows; the Project Manager and
other research agents read them and act in their own components. Nothing here
is a request that this repository can fulfil, and this repository never writes
into another component to register a source.

Read [AGENT-INTERFACE.md](../AGENT-INTERFACE.md) before consuming this queue.

## How to consume it

1. Read the rows with status `new` or `unconfirmed`.
2. Check the source against the owning component's own index.
3. Record it in the owning component under that component's rules, licensing,
   and redistribution constraints.
4. Update the `Status` column here to `accepted`, `duplicate`, `rejected`, or
   `deferred`, and add the owning component and the date.

`Status` values written by this repository are `new` and `unconfirmed` only.
`accepted`, `duplicate`, `rejected`, and `deferred` are written by the Project
Manager.

A queue row is a pointer to a source. It is never a claim that the source has
been read by anyone else, and never an approval to redistribute it.

## Queue

| Queue ID | Raised on | Session | Discovery ID | Title | Stable URL or DOI | Likely owning component | Sensitivity | Redistribution | Status | Resolved on | Resolution note |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No source has been queued. | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-28 | analysis-workbook | Created the Project Manager queue. | No source has been queued. |
