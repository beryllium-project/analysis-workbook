# Project Manager Execution Recommendations

Session ID: `AWB-20260914-001`
Distribution: `private`
Created: `2026-09-15`
Status: `Owner-ready recommendations`
Observed coordination state: `2026-09-15`

This file is an execution and delegation packet for the Project Manager. It
updates the earlier XRV collaboration proposal for the coordination state
observed after the Project Manager reorganization work.

It does not grant permission to modify a component, access restricted
material, create or transfer a repository, change a remote, push, publish, or
infer owner acceptance.

## Observed coordination base

| Component | Revision or record | Relevant state |
| --- | --- | --- |
| Project Manager | `c821694fe163b36c51fa610f1f86f1ac0104e5ec` | Organization rename to `agentic-os-research` recorded; generated owner tasking is available |
| Analysis workbook | `b93722b` | Four completed sessions; this update mirrors CRQ-001 as `completed` and performs the owner-side PMR-038 corrections |
| XRV | `d618935` | Missing intake history reconciled, root `COLLAB.md` added, and PMQ-017..020 recorded as `REV-20260914-010..013`; one ahead of private `backup/main` |
| OS-security research | `f2edd17` | Clean local checkout, one behind recorded remote `e275544`; PMR-027 precedes rehome PMR-044 |
| Formal-verification research | `784be93` | NOVA verification pointer recorded; owner triage remains PMR-041 |

## Recommendations at a glance

1. Do not reopen CRQ-001, PMR-025, or PMR-034. Their owner-side work is
   complete at XRV commits `706e708` and `d618935`.
2. The current analysis-workbook change set performs the owner-side PMR-038
   corrections. Close PMR-038 only after the resulting commit is returned.
3. Treat PMR-027 as the only hard repository-state prerequisite for source
   acquisition. Repository rehomes are a responsible-human scheduling gate,
   not a technical dependency.
4. Record whether the user's "after PM reorgs the project" direction means
   waiting for both PMR-044 and PMR-045. Unless the user clarifies otherwise,
   use that conservative successor-first ordering.
5. Ensure an executable OS-security owner workflow exists: either complete the
   Copilot-workflow sub-step of PMR-044 or have the responsible human perform
   the retrieval through the existing owner workflow while the owner records
   the result.
6. Delegate the post-March-2016 cap-talk gap to the OS-security owner.
7. Route any relevant recovered threads to the XRV owner through its existing
   `component://xrv-research-repo/review-log.md` intake contract.
8. After exact owner returns exist, delegate a follow-up inquiry in this AWB
   session to determine whether the new community evidence changes any
   finding.

## Existing requests to reuse

| Existing request | Recommended handling |
| --- | --- |
| `PMR-038` | The owner-side edits are included in the current analysis-workbook change set. After its exact commit is returned, close the request; no Project Manager write to analysis-workbook is authorized. |
| `PMR-039` | XRV owner reviews `backup/main..main` and decides whether to push `d618935` and successors to the reachable private backup. |
| `PMR-040` | Keep separate: XRV owner reviews the later proposed-architecture documents; this is not part of cap-talk closure. |
| `PMR-041` | Formal-verification owner triages the NOVA verification and seL4 integrity pointers. |
| `PMR-027` | Reconcile the canonical OS-security checkout before rehome or new source acquisition. |
| `PMR-044` | If the responsible human selects successor-first ordering, establish the active OS-security home and Copilot-capable owner workflow before archive acquisition. Its separate quarantine design and transfer remain human-only. |
| `PMR-045` | If the responsible human selects successor-first ordering, establish the active XRV home before it records cap-talk-derived review material. |
| `PMR-050` | May be completed independently; it is not a cap-talk prerequisite. |

Do not allocate duplicate requests for these actions. Add new Project Manager
requests only for the three owner tasks below.

## New delegation 1: OS-security owner closes the archive gap

### Dependency

Hard prerequisite:

- `PMR-027` is closed or superseded by an exact owner decision.

Before dispatch, the Project Manager also records:

- **Acquisition home:** current canonical checkout or the PMR-044 successor.
  The conservative default from the user's sequencing statement is to wait for
  PMR-044.
- **Executable owner workflow:** either the PMR-044 Copilot-workflow sub-step
  is complete, or the responsible human performs retrieval through the
  existing OS-security workflow and the owner records the result.

The Project Manager follows the OS-security ask-first convention before any
repository modification.

### Owner task

Ask the OS-security owner to locate and inspect the public continuation of the
cap-talk mailing list after March 2016.

The owner should:

1. Treat `component://osr-claude/sources/WANTED.md` and this session's
   `BLOCKED-004` as prior records to supersede or qualify, not as a new
   discovery.
2. Verify whether `https://groups.google.com/g/cap-talk` is the canonical
   continuation. Do not assume identity from the name alone, and distinguish
   it from the separate `friam` group named in the current WANTED row.
3. Record the access method and result without bypassing login, robots,
   anti-automation controls, membership controls, or licence restrictions.
   Google Groups currently permits `/g/` paths in `robots.txt` but disallows
   `/d/search*`, `/d/topicsearch*`, and legacy search paths. Retrieve only
   permitted group, thread, and message pages at a polite rate.
4. If publicly retrievable, preserve source provenance, retrieval date,
   archive coverage, hashes where practical, and the relationship to the
   existing March 1998-March 2016 recovered corpus.
5. Classify redistribution before tracking a copy. If redistribution is not
   clearly permitted, do not mirror the archive: record the route, coverage,
   and access result in `component://osr-claude/sources/WANTED.md` or the
   owner's designated manifest. Any restricted copy is a responsible-human
   transfer to the separate private quarantine under `PMD-20260915-001`; the
   Project Manager and owner agent do not open or copy it.
6. Record missing months, scrubbed attachments, inaccessible threads, and
   whether absence means no traffic or unavailable capture.
7. Enumerate permitted thread and message pages, preserve retrieved text under
   the owner's rules, and run the following keyword search locally rather than
   using disallowed Google Groups search endpoints:
   - `CHERI`, `Morello`, `purecap`, and `capability hardware`;
   - `hypervisor`, `VMM`, `virtualization`, and `virtual machine`;
   - `Bao`, `Bao-CHERI`, `bhyve`, `Intravisor`, and `CAP-VMs`;
   - `seL4`, `Microkit`, `Hafnium`, and `CHaOS`;
   - `NOVA`, `Hedron`, `L4Re`, `Fiasco.OC`, `uvmm`, and `Genode`;
   - object-capability confinement, delegation, revocation, labels, and
     information-flow policy in virtualization contexts.
8. Preserve exact positive and negative query terms and distinguish a
   discussion reference from an implementation, product, assurance, or
   adoption claim.
9. Return through the shared owner-return contract below, plus:
   - coverage dates;
   - access and redistribution result;
   - named relevant threads and portable source locators;
   - negative searches;
   - remaining inaccessible resources;
   - validation results.

### Stop conditions

The task is complete when either:

- the continuation has been identified, inspected, and recorded under the
  owner's source-handling rules; or
- an exact inaccessible-resource record identifies the canonical resource,
  failed access mode, alternatives checked, and what a user-supplied export
  would confirm.

The task is not blocked merely because no relevant thread is found. A
well-bounded negative search is a valid result.

## New delegation 2: XRV owner reviews relevant returned threads

### Dependency

Start only after the OS-security owner has returned the archive result with
exact locators. Use the XRV home selected by the responsible human. Under the
conservative successor-first ordering, this also waits for PMR-045; that is a
scheduling gate rather than a technical property of the evidence.

### Owner task

Ask the XRV owner to review only the cap-talk threads that are materially
relevant to CHERI or object-capability virtualization.

The owner should:

1. Keep `component://xrv-research-repo/review-log.md` and
   `component://xrv-research-repo/review-inbox/` as the sole source-intake
   lifecycle.
2. Avoid one review ID per routine message. Prefer one corpus-level intake
   record plus separately named threads when they support distinct,
   load-bearing claims.
3. Allocate new non-conflicting `REV-*` identifiers after
   `REV-20260914-013`; never reuse the reserved historical
   `REV-20260904-001..009`.
4. Treat mailing-list discussion as community and design-history evidence,
   not as proof of implementation, maturity, product support, assurance, or
   adoption.
5. Record whether the material:
   - adds a candidate absent from the current XRV inventory;
   - supplies primary-source leads;
   - changes terminology or chronology;
   - counters an existing negative statement;
   - records an abandoned or superseded design;
   - adds no material evidence.
6. Update XRV research only when the reviewed evidence changes a maintained
   statement. Name every incorporation destination in
   `component://xrv-research-repo/review-log.md`.
7. Return through the shared owner-return contract below, including the exact
   XRV commit, review IDs, statuses, changed paths, and non-claims.

### Stop conditions

The task is complete when every relevant returned thread has an owner
disposition and any changed XRV claim has an exact source and destination.
Finding no material XRV change is a valid disposition.

## New delegation 3: analysis-workbook follow-up

### Dependency

Start only after exact OS-security and XRV owner returns are recorded.

### Owner task

Ask the analysis-workbook owner to append a follow-up inquiry to
`AWB-20260914-001-object-capability-hypervisor-review`.

The inquiry should answer:

> What does the post-March-2016 cap-talk evidence add to or change in the
> object-capability hypervisor review?

It should:

1. Bind the review to exact OS-security and XRV revisions.
2. Resolve or supersede `OPEN-001` and `BLOCKED-004`.
3. Separate community history and discovery leads from architecture,
   implementation, maturity, product, or assurance evidence.
4. State whether Q-001 through Q-004 change, and cite both supporting and
   counter-evidence.
5. Add newly discovered source pointers only after checking all reachable
   indexes.
6. Regenerate `WORKBOOK.md` and run the maintained complete-session,
   transfer-queue, agent-contract, and diff checks.
7. Return through the shared owner-return contract below, including the exact
   analysis-workbook commit and validation summary.

### Stop conditions

The task is complete when the session records either:

- a supported revision to one or more prior findings; or
- a supported conclusion that the additional community evidence does not
  change the technical findings.

## Shared owner-return contract

Every delegated owner reports through the `PMD-20260914-002` pull-based return
contract by appending a `## Project Manager return` section to the component's
own handoff. The return includes:

- result state: `completed`, `partial`, `blocked`, or `information`;
- Project Manager request identifier;
- exact commit and changed paths;
- validation commands and results;
- branch, upstream, ahead/behind, and backup state;
- residual limitations and non-claims; and
- the exact Project Manager action requested.

## Dependency graph

```text
PMR-027
   |
   v
Record acquisition-home and owner-workflow choice
   |
   +-- current checkout / responsible-human workflow
   |
   `-- successor-first: PMR-044 and PMR-045
                         |
                         v
              OS-security cap-talk return
                         |
                         v
                   XRV owner return
                         |
                         v
              AWB follow-up and validation
                         |
                         v
             Project Manager reconciliation
```

`PMR-038`, `PMR-039`, `PMR-040`, `PMR-041`, and `PMR-050` may proceed
independently subject to their own recorded dependencies.

## Project Manager reconciliation

After each owner return, the Project Manager should:

1. Verify the named commit exists and the changed paths fit the owner request.
2. Record the return in
   `workspace://project-manager/outbox/component-requests.md`.
3. Update the affected component card and handoff state.
4. Regenerate or check owner tasking views.
5. Update `workspace://COMPONENTS.md` only from observed component state.
6. Avoid changing CRQ-002 directly in analysis-workbook unless standing carry
   authority is explicitly extended. The analysis-workbook maintainer mirrors
   CRQ status from the exact Project Manager records.
7. Keep push, repository creation, remote change, symlink retarget, visibility,
   publication, and release as separate responsible-human or owner actions.

## Recommended priority

| Priority | Action | Reason |
| --- | --- | --- |
| P2 | Complete PMR-027 | Removes the only hard checkout-state prerequisite |
| P2 | Record the acquisition-home and owner-workflow choice | Honors the user's reorganization sequencing without silently over-gating the research |
| P2 | Complete PMR-044 and PMR-045 when successor-first ordering is retained | Establishes the selected active homes and Copilot-capable OS-security workflow |
| P2 | Delegate OS-security cap-talk acquisition | Closes the named evidence gap under the owning source archive |
| P3 | Delegate XRV review of relevant threads | Community evidence is useful but does not block current technical findings |
| P3 | Delegate AWB follow-up | Reconciles the durable analysis after owner-side evidence is stable |
| P3 | Close PMR-038 after this owner commit is returned | Keeps coordination mirrors exact without a Project Manager write to analysis-workbook |

## Independent review

Claude Fable 5.1 reviewed the packet against current Project Manager, XRV,
OS-security, and analysis-workbook records. The review required revisions to:

- remove duplicate source-queue work and stale PMR-038 wording;
- separate hard technical prerequisites from responsible-human rehome
  sequencing;
- identify the OS-security workflow prerequisite;
- correct quarantine and redistribution handling;
- use robots-permitted Google Groups paths and local text search;
- align all owner returns with `PMD-20260914-002`; and
- use portable logical locators.

Those revisions are incorporated here and covered by the maintained
repository validation before commit.

## Non-claims

These recommendations do not:

- direct the Project Manager to inspect or copy OS-security source content;
- authorize access-control bypass or redistribution;
- make cap-talk discussion a technical or product authority;
- approve a CHERI hypervisor design or proof of concept;
- adopt the proposed security model from `AWB-20260914-002`;
- grant XRV or Beryllium implementation authorization;
- authorize repository creation, transfer, push, publication, or release.
