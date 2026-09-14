# Which Lifecycle Traces Falsify the Model? - Search log

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-003`
Distribution: `private`
Created: `2026-09-14`
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
| LOCAL-001 | 2026-09-14 | 5-7 | XRV review inbox and survey | stale TLB, DMA teardown, wrong PFN, cache writeback, machine check, lifecycle | Identified concrete non-CHERI failure classes that exercise the proposed model. | AWB-20260914-002-E0014 through AWB-20260914-002-E0017 |
| LOCAL-002 | 2026-09-14 | Current task | Independent Codex security analysis | authority drift, split commit, deputy, rollback, replay, recovery | Produced a ranked adversarial trace set. | AWB-20260914-002-E0018 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 5 | CHERI notes | Yes | Revocation and architecture context | Dirty worktree limited use |
| 6 | XRV research | Yes | Lifecycle model and restored advisory pointers | Intake records await full source review |
| 7 | Prior analysis | Yes | Cross-layer gap | No system execution |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Hypervisor object reuse must remain safe during deferred capability revocation. | Official CHERI revocation documentation | Closed |
| GAP-002 | Concrete target ordering and crash points remain unspecified. | Selected platform and implementation | Open |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Web | Official CHERI temporal revocation | 3 relevant records | Confirmed that stale capabilities require software-managed temporal safety. | AWB-20260914-002-E0013 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| Rollback | Returning a software error | Restoring all authoritative and hardware-visible state | The model requires a defined commit point and fail-closed recovery; an error return alone is not rollback. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the search log. | No query has been run. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed lifecycle and falsification searches. | Six evidence records and ten ranked tests were produced. |
