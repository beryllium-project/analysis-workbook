# Approved local research sources

Resolve the Beryllium workspace through `../SOT.md`. Paths below are relative
to this component and may be absent on another workstation. Absence is an
evidence gap to record, not a reason to recreate, clone, or copy a checkout.

## Local-first consumption order

Work down this list before any external research. Record for each tier what
was checked, what was found, and what was missing.

| Order | Path | Role | Authority and restrictions |
| --- | --- | --- | --- |
| 1 | `../provenance-review/reviews/` | Completed provenance and attribution packages, evidence ledgers, chronologies, and inaccessible-resource records | Read-only. Reuse evidence IDs by citation, never by copying a package. Preserve each package's confidence and distribution labels. |
| 2 | `../beryllium-repo/` | Canonical private Beryllium implementation, architecture models, planning, roadmap, evidence, and documentation | Read-only. Preserve acceptance, authorization, validation, and publication gates as distinct. R8-H0 is committed and unaccepted; K3 hardware is `NOT RUN`. |
| 3 | `../helium-te-poc/` | Fixed RV64 Type Enforcement pathfinder, its documentation, tests, and CBMC results | Read-only. Describe it only within its exact review, machine-check, and hardware limits. It is a review-and-test proof of concept. |
| 4 | `../project-manager/HANDOFF.md`, `../project-manager/records/`, `../project-manager/queue/LEDGER.md`, `../project-manager/outbox/component-requests.md`, `../COMPONENTS.md`, `../SOT.md` | Project Manager handoff, decision and assurance-transfer records, queue ledger and owner requests, component registry, workspace state, and canonical topology. The parent `../HANDOFF.md` and `../formal-verification/helium-te-fv-pathfinder.md` are redirect stubs kept for older citations | Read-only from this component. `../project-manager/` is the independent Project Manager component registered in `../COMPONENTS.md`, which records its exact revision. Parent and Project Manager coordination changes are the Project Manager's, not this agent's. |
| 5 | `../formal-verification-research/` | Verification systems, tools, precedents, bibliographies, and Beryllium verification strategy | Read-only. Preserve exact claim bounds, commits, dates, and primary citations. Guest changes follow its `COLLAB.md`; this agent makes none. |
| 6 | `../cheri-riscv-notes-repo/` | CHERI and CHERI-RISC-V corpus, citekeys, design-space and assurance lineage | Read-only. `wiki/` is authoritative; `references/references.bib` is a generated export with a human inclusion gate. |
| 7 | `../xrv-research-repo/` | CHERI hypervisor research, reviewed comparisons, and durable review provenance | Read-only. Keep established evidence, architectural inference, and proposals distinct. Preserve review IDs and status values. |
| 8 | `../osr-claude/` | OS-security and capability lineage, MAC precedent, preserved primary sources, archive search knowledge | Read-only and agent-owned. Never copy `sources/restricted-microsoft/`; preserve licence and quarantine qualifications. |

## Source-discovery reference set

Before recording a source as new or previously unrecorded, check that it is
absent from all of:

- `../formal-verification-research/sources/bibliography.md`
- `../cheri-riscv-notes-repo/references/references.bib`
- `../osr-claude/sources/` including each collection manifest
- `../xrv-research-repo/review-log.md`
- `../provenance-review/sources/metadata/`
- `../project-manager/queue/LEDGER.md` (source pointers already `routed` by
  the Project Manager to an owning component or `accepted` into that
  component's designated index; a source found there is not queued again as
  `new`)
- this repository's `SOURCE-DISCOVERY-LOG.md`

Record which of these were reachable and which were not. A source that could
not be checked against a reachable index is `unconfirmed`, not `new`.

## Consumption rules

1. Read each component's local instructions and handoff before relying on its
   current state.
2. Cite the local file and its upstream primary source. A local synthesis is
   not a substitute for the primary work.
3. Record the exact component commit or an explicit checked date for every
   local citation.
4. Do not copy private implementation source into this repository. Cite
   locations and behavior instead.
5. Do not update source repositories, their bibliographies, ledgers, review
   logs, or handoffs. Route new material through `outbox/pm-queue.md`.
6. Preserve terminology warnings, licence restrictions, source-quality labels,
   verified negatives, and assurance exclusions from the originating
   component.
7. Where two components disagree, report the disagreement with both citations
   rather than silently selecting one.
