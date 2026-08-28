# Agent interface

This file defines how the `analysis-workbook` agent relates to the Beryllium
Project Manager, to other component agents, and to the human reviewer. It is
the component's side of the workspace agentic boundary described in
`../SOT.md`, `../COMPONENTS.md`, and the parent
`.github/copilot-instructions.md`.

## Position in the workspace

`analysis-workbook` is a consumer component. It reads implementation and
research components, produces human-facing analysis, and emits a pull-only
queue of newly discovered sources. It owns no implementation, no research
corpus, and no assurance gate.

```text
implementation + research components  ──read-only──▶  analysis-workbook
                                                             │
                                      human reader ◀──────────┤ sessions/, WORKBOOK.md
                                                             │
                                Project Manager ◀──pull──────┘ outbox/pm-queue.md
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

## Outbox pull protocol

`outbox/pm-queue.md` is the only handoff surface. It is a queue, not a
notification: nothing outside this repository changes when an entry is added.

Entry statuses:

| Status | Meaning | Who sets it |
| --- | --- | --- |
| `new` | Recorded by this agent, not yet seen by the Project Manager | this agent |
| `acknowledged` | The Project Manager has read the entry and assigned a destination | Project Manager |
| `routed` | Handed to the owning component's agent or human owner | Project Manager |
| `integrated` | The owning component recorded the source in its own corpus | Project Manager |
| `declined` | Out of scope, duplicate, or not to be pursued, with a reason | Project Manager |

Consumers:

1. The Project Manager reads `outbox/pm-queue.md` from the parent workspace
   during coordination, following the parent handoff procedure.
2. The Project Manager routes each entry to the owning component and its human
   owner. It does not add the source to a component corpus on its own
   authority, because citation promotion is a human gate in
   `cheri-riscv-notes-repo` and integration is owner-only in
   `formal-verification-research`.
3. Status transitions after `new` are written by the Project Manager. This
   agent appends new entries and never rewrites a status it did not set.

## Relationship to existing interfaces

- `../formal-verification-research/COLLAB.md` defines a guest-branch ledger
  protocol for agents that contribute research findings back. This component
  does not use it: it publishes a pull queue instead of pushing a guest branch,
  so the research owner keeps sole integration authority.
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
