# Cross-component collaboration request queue

A pull-only interface for owner-boundary and collaboration-protocol requests
that are neither source discoveries nor Helium method transfers.

The Project Manager reads this queue, records a corresponding owner request,
and coordinates the owning component's response. The analysis-workbook
maintainer mirrors later statuses from exact Project Manager or owner-side
records. This repository never writes the requested collaboration interface
into a sibling component.

## Status values

| Status | Meaning | Who writes the queue value |
| --- | --- | --- |
| `new` | Request recorded by analysis-workbook and awaiting Project Manager handling | analysis-workbook |
| `routed` | Project Manager recorded and routed an owner request | analysis-workbook maintainer, mirroring the exact record |
| `accepted` | Owner accepted the request and named an owner-side record or commit | analysis-workbook maintainer, mirroring the exact record |
| `rejected` | Owner declined the request with a recorded reason | analysis-workbook maintainer, mirroring the exact record |
| `deferred` | Owner or Project Manager intentionally postponed the request | analysis-workbook maintainer, mirroring the exact record |
| `completed` | Requested interface exists and the authoritative coordination record names exact owner-side evidence | analysis-workbook maintainer, mirroring the exact record |

Status describes coordination handling only. It never establishes research
incorporation, implementation authorization, acceptance, approval,
publication, release, or permission for analysis-workbook to write another
component. The Project Manager does not write this queue unless the responsible
human explicitly extends its standing carry authority.

## Queue

| Request ID | Raised on | Session | Owning component | Request type | Specification | Project Manager action | Owner action | Status | Owner-side record | Resolved on |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| CRQ-001 | 2026-09-14 | AWB-20260914-001 | xrv-research-repo | Establish bounded cross-project collaboration interface | `sessions/AWB-20260914-001-object-capability-hypervisor-review/xrv-collaboration-interface.md` | Record and route an XRV owner request; preserve `review-log.md` as source intake; coordinate after missing-review-history reconciliation | Reconcile `7314e2f` / `REV-20260904-001..009`, add owner-approved root `COLLAB.md`, update XRV instructions and handoff, then triage PMQ-017..020 | completed | `workspace://project-manager/outbox/component-requests.md` `PMR-034` (closed 2026-09-14); `component://xrv-research-repo` commit `d618935` | 2026-09-14 |
| CRQ-002 | 2026-09-15 | AWB-20260914-001 | project-manager | Coordinate post-reorganization cap-talk closure and evidence return | `sessions/AWB-20260914-001-object-capability-hypervisor-review/project-manager-execution-recommendations.md` | Record the acquisition-home and owner-workflow choice, reuse existing PMRs, allocate only the three missing owner requests, generate owner tasking, and reconcile exact returns | OS-security owner acquires or bounds the archive; XRV owner reviews relevant threads; analysis-workbook owner appends a revision-bound follow-up inquiry | new | Not applicable | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | analysis-workbook | Created the collaboration request interface and CRQ-001. | Pull-only request; no sibling component was modified. |
| ACTIVITY-002 | 2026-09-14 | analysis-workbook | Mirrored CRQ-001 to `routed` from Project Manager request PMR-034. | The Project Manager record is authoritative; this mirror does not establish XRV owner completion, acceptance, publication, or permission for analysis-workbook to write XRV. |
| ACTIVITY-003 | 2026-09-15 | analysis-workbook | Added CRQ-002 and the post-reorganization execution packet. | The Project Manager may process and delegate the recommendations under existing owner boundaries; no sibling component was modified. |
| ACTIVITY-004 | 2026-09-15 | analysis-workbook | Mirrored CRQ-001 to `completed` from closed PMR-034 and XRV owner commit `d618935`. | Completion is coordination state only; it does not establish source review, incorporation, endorsement, approval, publication, or release. |
