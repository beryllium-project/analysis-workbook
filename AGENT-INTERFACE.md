# Agent interface

This file defines how the `analysis-workbook` agent relates to the Beryllium
Project Manager, to other component agents, and to the human reviewer. It is
the component's side of the workspace agentic boundary described in
`../SOT.md`, `../COMPONENTS.md`, and the parent
`.github/copilot-instructions.md`.

## Position in the workspace

`analysis-workbook` is a consumer component. It reads implementation and
research components, produces human-facing analysis, and emits two pull-only
outbox queues: newly discovered sources and evidence-scoped
Helium-to-Beryllium method inputs. It owns no implementation, no research
corpus, and no assurance gate.

```text
implementation + research components  ──read-only──▶  analysis-workbook
                                                             │
                                      human reader ◀──────────┤ sessions/, WORKBOOK.md
                                                             ├──▶ outbox/pm-queue.md
                                                             │    Project Manager/research pull
                                                             └──▶ outbox/helium-transfer-queue.md
                                                                  Project Manager/Beryllium pull
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
