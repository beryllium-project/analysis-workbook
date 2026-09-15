# Agent interface

This file defines how the `analysis-workbook` agent relates to the Beryllium
Project Manager, to other component agents, and to the human reviewer. It is
the component's side of the workspace agentic boundary described in
`../SOT.md`, `../COMPONENTS.md`, and the parent
`.github/copilot-instructions.md`.

## Position in the workspace

`analysis-workbook` is a consumer component. It reads implementation and
research components, produces human-facing analysis, and emits three pull-only
outbox interfaces: source discoveries, evidence-scoped Helium-to-Beryllium
method inputs, and owner-boundary collaboration requests. It owns no
implementation, no research corpus, and no assurance gate.

```text
implementation + research components  ──read-only──▶  analysis-workbook
                                                             │
                                      human reader ◀──────────┤ sessions/, WORKBOOK.md
                                                             ├──▶ outbox/pm-queue.md
                                                             │    Project Manager/research pull
                                                             ├──▶ outbox/helium-transfer-queue.md
                                                             │    Project Manager/Beryllium pull
                                                             └──▶ outbox/collaboration-requests.md
                                                                  Project Manager/owner pull
```

## Inputs consumed

All inputs are read-only and untrusted. The ordered registry, per-component
authority, and restrictions are in [RESEARCH-SOURCES.md](RESEARCH-SOURCES.md).

- Sibling component files, documentation, and read-only Git metadata.
- Parent Project Manager coordination artifacts.
- User-supplied material placed in ignored `inbox/`.
- Public web sources, subject to the logging rules in the analysis skill.

## Outputs emitted

| Output | Location | Audience | Contract |
| --- | --- | --- | --- |
| Session package | `sessions/AWB-YYYYMMDD-NNN-short-name/` | Human reader and reviewer | Durable, append-only, `private` by default |
| Comprehensive report | `sessions/AWB-*/inquiries/Q-NNN/report.md` | Human reader | Full reasoning, evidence IDs, alternatives, limitations |
| Condensed summary | `sessions/AWB-*/inquiries/Q-NNN/summary.md` | Human reader and reviewer | Standalone, no unexplained references |
| Chat reply | Conversation only | Human reader | Bounded brief; never the sole record of a finding |
| Navigation index | `WORKBOOK.md` | Human reader and reviewer | Generated; topic view and chronological view |
| Source discoveries | `SOURCE-DISCOVERY-LOG.md` | Project Manager, research agents | Append-only durable log |
| PM queue | `outbox/pm-queue.md` | Project Manager, research agents | Actionable pull queue with per-entry status |
| Helium transfer queue | `outbox/helium-transfer-queue.md` | Project Manager, Beryllium owner and responsible human | `HET-NNN` method inputs; `new` and `unaccepted` on entry |
| Collaboration requests | `outbox/collaboration-requests.md` | Project Manager and component owners | `CRQ-NNN` owner-boundary and collaboration-protocol requests |

## Write boundary

The agent writes only inside this repository. It never writes to a sibling
component, its Git metadata, its bibliography, its review log, or its handoff,
and it never stages parent artifacts.

Sibling components remain owned by their own agents and their own human
processes. A finding that implies a change elsewhere is reported, not applied.

## Execution boundary

Read-only evidence gathering is the default. Component build, test, or
validation commands may be run only after the user approves them by name for
the current session. The approval, the exact command, the component revision,
and the result are recorded in the session package. Command approval is never
write approval.

## Outbox pull protocols

The outbox contains two independent handoff surfaces. They are queues, not
notifications: nothing outside this repository changes when an entry is
added.

### Source-discovery queue

`outbox/pm-queue.md` carries pointers to sources that are not recorded in an
owning research component.

Entry statuses (the same set as the `outbox/pm-queue.md` header):

| Status | Meaning | Who sets it |
| --- | --- | --- |
| `new` | Recorded by this agent, checked against every reachable index, not yet resolved by the Project Manager | this agent |
| `unconfirmed` | Recorded by this agent while a required index was unreachable | this agent |
| `accepted` | A pointer to the source is recorded in the owning component's designated index under that component's rules, by its owner or by the Project Manager as a metadata-only carried write on the owner's delegated authority; never corpus admission, review, or endorsement | Project Manager |
| `duplicate` | Already recorded by the owning component | Project Manager |
| `rejected` | Out of scope or not to be pursued, with a reason | Project Manager |
| `deferred` | Tracked by the Project Manager but not acted on now | Project Manager |

Routing an entry to an owner is an intermediate Project Manager state kept in
`../project-manager/queue/LEDGER.md`, not a status of this file; a row stays
`new` or `unconfirmed` until it reaches a final status above.

Consumers:

1. The Project Manager reads `outbox/pm-queue.md` from its own component,
   `../project-manager/`, during a coordination turn, following
   `../project-manager/HANDOFF.md` and the ledger-first queue protocol in
   `../project-manager/queue/README.md`: every disposition is recorded in
   `../project-manager/queue/LEDGER.md` before this file changes.
2. The Project Manager routes each entry to the owning component and its human
   owner. Under its standing carry authority
   (`../project-manager/records/decisions/PMD-20260904-003-standing-carry-authority.md`)
   it may record a metadata-only pointer in an owner's hand-editable index on
   that owner's delegated authority; it never admits a source to a corpus on
   its own authority, because citation promotion is a human gate in
   `cheri-riscv-notes-repo` and research integration is owner-only in
   `formal-verification-research`.
3. Status transitions after `new` or `unconfirmed` are written by the Project
   Manager, as a carried write committed in this repository under that
   authority (class 1) when the worktree is clean, or by the responsible human
   otherwise. This agent appends new entries and never rewrites a status it
   did not set.

### Helium method-transfer queue

`outbox/helium-transfer-queue.md` carries `HET-NNN` method and process inputs
for Beryllium-side triage. It deliberately does not reuse the source
discovery queue's schema, identifiers, or source-admission purpose.

1. This component records an explicitly directed item as `new` and
   `unaccepted`, with the direction date, portable source locator, exact
   revision, maintained source artifact, transfer candidates, non-transferable
   fixed details, residual assumptions, and non-claims.
2. The Project Manager, Beryllium owner, or responsible human pulls the item
   and records any routing or triage in an authoritative record outside this
   repository.
3. This component mirrors a later transfer-lifecycle status only after
   observing that exact record. Immutable item definitions and existing
   status-history rows are never rewritten; a correction adds a superseding
   item.
4. No lifecycle status grants or implies Beryllium adoption, planning
   approval, responsible-human review, implementation authorization,
   acceptance, assurance, publication, release, or hardware validation.

The queue transfers candidate method rather than Helium's fixed constants,
profile, claim totals, tool choice, or assurance result. This component never
writes the candidate into Helium or Beryllium.

The final status-history row is authoritative. The queue summary is a derived
current index and may change only to mirror an appended valid transition.
Run `scripts/validate-helium-transfer-queue.sh`, using `--baseline` when a
prior queue revision is available, before recording or mirroring a change.

### Collaboration-request queue

`outbox/collaboration-requests.md` carries owner-boundary and
collaboration-protocol requests that are neither source intake nor method
transfer.

1. This component records an owner-ready specification and a stable `CRQ-NNN`
   row with status `new`.
2. The Project Manager records a component-owner request under its own
   coordination process. The analysis-workbook maintainer mirrors a later
   queue status only when an exact Project Manager or owner-side record exists;
   the Project Manager does not write this queue unless the responsible human
   explicitly extends its standing carry authority.
3. The component owner decides whether to adopt, revise, defer, or reject the
   interface and performs every research, review, instruction, handoff, or
   `COLLAB.md` change outside the Project Manager's narrow carry authority.
4. Analysis-workbook does not use the queue as permission to create a guest
   branch or write another component.
5. Collaboration requests do not replace `pm-queue.md` source intake,
   `review-log.md` source review, or `helium-transfer-queue.md` method
   transfer.

The queue row is a derived mirror. The exact Project Manager or owner-side
record named in `Owner-side record` remains authoritative.

## Relationship to existing interfaces

- `../formal-verification-research/COLLAB.md` defines a guest-branch ledger
  protocol for agents that contribute research findings back. This component
  does not use it: it publishes pull queues instead of pushing a guest branch,
  so the research or implementation owner keeps sole integration authority.
- `../provenance-review/` answers lineage and attribution questions and writes
  `PRV-*` packages. This component consumes those packages as first-tier local
  evidence and cites their evidence IDs rather than re-deriving them. When a
  question is fundamentally about origin, influence, or credit, refer the user
  to `/agent provenance-review` instead of duplicating that workflow.
- `../xrv-research-repo/review-log.md` and `../osr-claude/sources/` carry their
  own provenance and manifest rules. Discoveries are routed to them, never
  written into them from here.

## What this component does not do

- It does not approve, accept, sign off, publish, license, or release
  anything.
- It does not modify implementation code or research content.
- It does not establish conceptual origin, copying, misconduct, or
  originality. Those belong to `provenance-review`.
- It does not claim formal verification, hardware validation, or
  responsible-human review of any component.
