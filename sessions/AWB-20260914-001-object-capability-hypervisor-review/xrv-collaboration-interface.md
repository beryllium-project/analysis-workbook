# Proposed XRV Cross-Repository Collaboration Interface

Session ID: `AWB-20260914-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Owner-ready proposal`

This is a coordination proposal for the Project Manager and XRV owner. It does
not modify XRV, grant write access, allocate XRV review IDs, integrate research,
or authorize a push.

## Position

XRV should use three separate interfaces rather than make one ledger carry
source intake, research review, and downstream-consumption history:

1. `review-log.md` plus `review-inbox/` remains the source-intake and
   incorporation workflow.
2. A root `COLLAB.md` records completed cross-project consumption and feedback.
3. The Project Manager routes requests and observes status but does not own or
   integrate XRV research.

## Roles

### XRV research owner

- Owns research conclusions, corrections, review IDs, source disposition,
  incorporation, and the XRV handoff.
- Reviews and locally integrates compliant `collab/*` branches.
- Decides whether a guest report requires changes outside `COLLAB.md`.
- Separately decides whether any local commit is pushed.

### Guest consumer

- Treats XRV as read-only while performing work in a destination component.
- Preserves XRV source revisions, assumptions, confidence, maturity labels,
  and claim limits.
- After completed destination work exists, may append one attributable
  completed-use record to XRV's `COLLAB.md` using the bounded branch workflow.
- Does not create or update XRV research, review records, source intake,
  handoff state, or another guest's record.

### Project Manager

- Pulls collaboration requests from
  `component://analysis-workbook/outbox/collaboration-requests.md`.
- Records an owner request and routes it to XRV.
- May update only Project Manager-role and coordination wording under its
  standing carry authority when the exact preconditions are met.
- Does not allocate `REV-*`, write intake summaries, change research,
  integrate `collab/*`, infer acceptance, or push XRV.

### Analysis workbook

- Remains a queue-only, read-only consumer of XRV.
- Records session evidence, discoveries, and owner-ready collaboration
  proposals in its own repository.
- Does not create an XRV guest branch unless its own write boundary is
  separately changed by the responsible human.

## Source intake interface

Source intake remains:

```text
AWB DISC-NNN
  -> analysis-workbook PMQ-NNN
  -> Project Manager ledger and PMR-NNN owner request
  -> XRV owner allocates REV-YYYYMMDD-NNN
  -> review-inbox/ source-aware note
  -> review-log.md lifecycle
  -> review-done/ and named incorporation destinations
```

A `PMQ-*` row is a source pointer only. It does not reserve an XRV `REV-*`
identifier and does not mean that XRV has read, accepted, incorporated, or
endorsed the source.

Before allocating new review IDs, the XRV owner should reconcile the missing
historical `7314e2f` object and `REV-20260904-001..009` records documented by
the Project Manager. If those records cannot be recovered, the owner should
record a superseding loss/reconciliation decision and choose a non-conflicting
future ID policy rather than silently reusing identifiers.

## Proposed guest write budget

When XRV creates `COLLAB.md`, a guest may:

1. Require a clean XRV integration branch and read XRV instructions,
   `HANDOFF.md`, `review-log.md`, and `COLLAB.md`.
2. Create one local branch:

   ```text
   collab/<destination>-<agent>-<yyyymmdd>-<purpose>
   ```

3. Append one uniquely headed completed-use section to `COLLAB.md`.
4. Stage and commit only `COLLAB.md`.
5. Run `git diff --check` and verify both staged and unstaged changed-path
   lists.
6. Return to the integration branch without merging or pushing.
7. Report the branch and commit to the XRV owner.

A guest must not:

- edit `review-log.md`, `review-inbox/`, `review-done/`, `references.md`,
  surveys, research streams, `README.md`, or `HANDOFF.md`;
- create, change, reserve, or infer a `REV-*` status;
- edit owner-maintained `COLLAB.md` text or another guest's section;
- fetch, pull, merge, rebase, amend, tag, push, alter remotes, or clean/reset
  the worktree;
- claim that a guest log changes XRV conclusions, source status, acceptance,
  publication, or release.

## Proposed `COLLAB.md` skeleton

```md
# XRV cross-project collaboration

This ledger records completed consumption of XRV research by sibling
components. It is not source intake, research review, or an approval record.

## Authority and boundaries

### Guest agents may
- read XRV and cite an exact base revision;
- append only their own completed-use section on one `collab/*` branch;
- commit only `COLLAB.md` locally.

### Guest agents must not
- edit research, review, source, handoff, or owner-status artifacts;
- integrate or push branches;
- infer XRV endorsement or acceptance.

### Parent Project Manager budget
- route requests and report observed state;
- apply only separately authorized Project Manager-role wording;
- never integrate `collab/*` or edit research.

## Owner status

| Item | Status |
| --- | --- |
| Integration branch | `main` |
| Research owner | XRV owner |
| Review workflow | `review-log.md`, `review-inbox/`, `review-done/` |
| Guest write surface | Append-only sections in this file |
| Unmerged collaboration branches | Owner-maintained observation |

## Research map for consumers

| Research area | Maintained artifact | Important caveat |
| --- | --- | --- |
| CHERI hypervisor survey | `cheri-hypervisor-research-survey.md` | Established evidence and proposals are distinct |
| Source catalog | `references.md` | Pointer and characterization, not automatic review |
| RISC-V hypervisors | `riscv-hypervisors-research-stream.md` | Preliminary and revision-sensitive |
| Confidential computing | `riscv-confidential-computing-research-stream.md` | Comparison evidence, not capability equivalence |
| Review provenance | `review-log.md` | Owner-controlled append-only lifecycle |

## Guest workflow

1. Complete destination work first.
2. Create one local `collab/*` branch from clean `main`.
3. Append one section using the template below.
4. Commit only `COLLAB.md`; do not push.
5. Return to `main` and report the branch and commit.

## Guest log template

### <destination> / <agent> / <YYYY-MM-DD> / <purpose>

- **Status:** `ready-for-owner-review`
- **Collaboration branch:** `collab/...`
- **XRV base commit:** `<sha>`
- **Destination repository:** `<name>`
- **Destination branch/commit:** `<branch and sha>`
- **Destination validation:** `<commands and results>`

| XRV source | Adopted, rejected, or qualified use | Destination evidence |
| --- | --- | --- |
| `<path>@<sha>` | `<effect and limits>` | `<path, evidence ID, or commit>` |

#### Adopted guidance
...

#### Rejected or non-transferable guidance
...

#### Corrections or stale assumptions
...

#### Open feedback for the XRV owner
...

## Owner integration

The owner inspects every commit and `main...collab/*` diff, requires that only
`COLLAB.md` changed, verifies destination evidence and claim limits, and merges
locally. A merge does not require an XRV research change or authorize a push.

## Guest logs

Integrated completed-use records follow.
```

## Initial Project Manager action

1. Pull `CRQ-001` from
   `component://analysis-workbook/outbox/collaboration-requests.md`.
2. Record a Project Manager owner request for XRV to:
   - reconcile the missing `7314e2f` and `REV-20260904-001..009` history;
   - add the bounded root `COLLAB.md`;
   - update XRV's instructions and handoff to point to it;
   - preserve `review-log.md` as the sole source-intake lifecycle;
   - triage `PMQ-017..020` only after the review-ID reconciliation.
3. Do not write the proposed XRV research or review artifacts under Project
   Manager authority.
4. Record the owner-side response or commit before changing `CRQ-001` from
   `new`.

## Validation expected from the XRV owner

- XRV worktree was clean before the change.
- Only owner-approved collaboration and directly related instruction/handoff
  files changed.
- The proposed guest branch workflow allows only `COLLAB.md`.
- Source intake still requires an owner-created `REV-*` record and
  `review-inbox/` note.
- Existing review IDs and activity are not rewritten or reused.
- `git diff --check` passes.
- Any commit is local until the responsible human separately authorizes a
  push.

## Non-claims

This proposal does not establish XRV adoption, owner acceptance, source
incorporation, research correctness, publication, release, or permission for
analysis-workbook to write to XRV.
