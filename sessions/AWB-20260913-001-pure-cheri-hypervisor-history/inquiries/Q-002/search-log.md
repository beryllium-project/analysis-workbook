# Does the Restored Formal Verification Repository Change the Finding? - Search log

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-13`
Status: `Complete`

Every local and external query, including the ones that found nothing. A
checked location that did not contain the expected fact is a result.

Public queries must never contain private code, private repository names,
internal URLs, credentials, non-public identifiers, or user-supplied private
text.

## Local queries

Worked in the order given by `RESEARCH-SOURCES.md`.

| Query ID | Date | Tier | Component or path | Terms or method | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| LOCAL-001 | 2026-09-13 | Restored component | `component://formal-verification-research/` | Resolve state, identity, committed tree, and 500-entry history through `readonly-inspect.sh` | Clean `main` at `e5740de`; repository available. | AWB-20260913-001-E0009 |
| LOCAL-002 | 2026-09-13 | Beryllium workstream | `component://formal-verification-research/workstreams/beryllium/` | Review relevant files for `pure CHERI`, `purecap`, `pure-capability`, `CHERI-only`, `CHERI-first`, and hypervisor context | No pure-capability Beryllium hypervisor proposal found. | AWB-20260913-001-E0010 |
| LOCAL-003 | 2026-09-13 | Comparative research | `component://formal-verification-research/notes/cheriot.md`, `component://formal-verification-research/comparison/summary.md`, `component://formal-verification-research/HANDOFF.md` | Review CHERIoT and assurance references for architectural implications | CHERIoT appears as methodology precedent, not a selected hypervisor variant. | AWB-20260913-001-E0011 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| Tier 1 | Component instructions and handoff | Yes | Scope and current revision established | None |
| Tier 2 | Beryllium verification workstream | Yes | Verification strategy for existing path | No purecap hypervisor proposal |
| Tier 3 | CHERIoT and comparison material | Yes | Assurance and composition precedent | No Beryllium architecture selection |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| None | No new gap requiring external research was recorded. | Not applicable | Closed locally |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| None | 2026-09-13 | Not applicable | No external query was run. | 0 | External research remained excluded. | None |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| pure | "Pure runtime transition" in formal-verification handoff means effect-separated logic. | "Pure-capability" in the XRV survey means CHERI purecap execution. | Context and adjacent nouns were used; the former is not CHERI evidence. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-13 | Inquiry scaffolder | Created the search log. | No query has been run. |
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Completed the restored component search. | No answer-changing evidence found. |
