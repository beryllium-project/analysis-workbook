# Was a Pure CHERI Hypervisor Discussed or Considered? - Search log

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-001`
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
| LOCAL-001 | 2026-09-13 | Coordination | `workspace://SOT.md`, `workspace://COMPONENTS.md`, `component://project-manager/` | Topology, component roles, handoffs, component cards, and Git history | Identified XRV as CHERI-first research and Beryllium as canonical implementation. | AWB-20260913-001-E0006 |
| LOCAL-002 | 2026-09-13 | Implementation | `component://beryllium-repo/` | Committed tree/history; `pure CHERI`, `purecap`, `pure-capability`, `CHERI-only`, `CHERI-first`, `hybrid`, `hypervisor`, `VMM`, `XRV` | Found future purecap compatibility and CHERI targets, but current non-CHERI selected runtime and explicit non-authorization. | AWB-20260913-001-E0003, AWB-20260913-001-E0004, AWB-20260913-001-E0005 |
| LOCAL-003 | 2026-09-13 | Research | `component://xrv-research-repo/` | Full survey, handoff, committed tree/history, same terminology variants | Found explicit proposed pure-capability architecture and implementation sequence in the initial July 2026 survey, retained at current revision. | AWB-20260913-001-E0001, AWB-20260913-001-E0002 |
| LOCAL-004 | 2026-09-13 | Research | `component://cheri-riscv-notes-repo/`, `component://osr-claude/` | Committed tree/history and relevant overview/design-space material; restricted subtree excluded | Found general CHERI terminology and comparisons, but no separate Beryllium pure-CHERI hypervisor decision. | AWB-20260913-001-E0007 |
| LOCAL-005 | 2026-09-13 | Other components | `component://helium-te-poc/`, `component://provenance-review/`, `component://threat-modeler/`, `component://security-reviewer/`, `component://analysis-workbook/` | Focused committed tree, handoff, terminology, and commit-subject sweep | No separate project-specific pure-CHERI hypervisor decision or implementation record found. | AWB-20260913-001-E0007 |
| LOCAL-006 | 2026-09-13 | Missing component | `component://formal-verification-research/` | Component inventory | Checkout absent; not searched or reconstructed. | AWB-20260913-001-E0008 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| Tier 1 | Parent coordination and Project Manager | Yes | Component roles and revision boundaries | No repository-wide `RESEARCH-SOURCES.md` was present at its documented workspace location. |
| Tier 2 | Canonical Beryllium implementation | Yes | Future purecap compatibility; non-CHERI selected runtime | No accepted or authorized pure-CHERI version found. |
| Tier 3 | XRV CHERI-first hypervisor research | Yes | Explicit pure-capability proposal and sequence | No evidence that the proposal became Beryllium implementation work. |
| Tier 4 | CHERI and OS-security research | Yes | General context and terminology | No separate project decision found; restricted OSR material excluded. |
| Tier 5 | Remaining sibling components | Yes | Negative focused sweep | Formal-verification research checkout absent. |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | The absent formal-verification research repository may contain additional historical discussion. | Restored canonical read-only checkout or owner-supplied history | Not pursued; external research excluded. |
| GAP-002 | Issue and pull-request discussions not stored in local Git history may contain additional discussion. | Local export or user-supplied copy | Not pursued; no network search requested. |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| None | 2026-09-13 | Not applicable | No external query was run by user request. | 0 | External research was excluded. | None |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| pure-capability | Purecap code/ABI mode in XRV and Beryllium CHERI-alignment records. | A broader decomposed hypervisor architecture whose core and services use CHERI. | The report distinguishes a purecap baseline/port from the larger proposed architecture and from merely hosting CHERI guests. |
| capabilities | Hardware-tagged CHERI capabilities. | Beryllium software kernel-object capabilities on non-CHERI hardware. | Only tagged architectural capabilities are described as CHERI capabilities. |

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
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Completed the focused local-first search. | Explicit research discussion found; current implementation counter-evidence found; external pass not applicable. |
