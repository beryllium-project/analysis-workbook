# Cross-component collaboration request queue

A pull-only interface for owner-boundary and collaboration-protocol requests
that are neither source discoveries nor Helium method transfers.

The Project Manager reads this queue, records a corresponding owner request,
and coordinates the owning component's response. This repository never writes
the requested collaboration interface into a sibling component.

## Status values

| Status | Meaning | Who sets it |
| --- | --- | --- |
| `new` | Request recorded by analysis-workbook and awaiting Project Manager handling | analysis-workbook |
| `routed` | Project Manager recorded and routed an owner request | Project Manager |
| `accepted` | Owner accepted the request and named an owner-side record or commit | Project Manager |
| `rejected` | Owner declined the request with a recorded reason | Project Manager |
| `deferred` | Owner or Project Manager intentionally postponed the request | Project Manager |
| `completed` | Requested interface exists and the Project Manager recorded the exact owner-side evidence | Project Manager |

Status describes coordination handling only. It never establishes research
incorporation, implementation authorization, acceptance, approval,
publication, release, or permission for analysis-workbook to write another
component.

## Queue

| Request ID | Raised on | Session | Owning component | Request type | Specification | Project Manager action | Owner action | Status | Owner-side record | Resolved on |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| CRQ-001 | 2026-09-14 | AWB-20260914-001 | xrv-research-repo | Establish bounded cross-project collaboration interface | `sessions/AWB-20260914-001-object-capability-hypervisor-review/xrv-collaboration-interface.md` | Record and route an XRV owner request; preserve `review-log.md` as source intake; coordinate after missing-review-history reconciliation | Reconcile `7314e2f` / `REV-20260904-001..009`, add owner-approved root `COLLAB.md`, update XRV instructions and handoff, then triage PMQ-017..020 | new | Not applicable | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | analysis-workbook | Created the collaboration request interface and CRQ-001. | Pull-only request; no sibling component was modified. |
