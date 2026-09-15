# What Is the Demonstrated Maturity? - Search log

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-002`
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
| LOCAL-001 | 2026-09-14 | 5-8 | Formal verification, CHERI notes, XRV, OSR | Project maturity, product, release, community, and inaccessible archive records | Existing maturity labels and cap-talk coverage established. | AWB-20260914-001-E0018 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 5 | Formal verification | Yes | Proof maturity and system boundaries | Some source profiles require primary revalidation |
| 6-7 | CHERI notes and XRV | Yes | Product and project baselines | Several status cutoffs stale |
| 8 | OSR | Yes | Historical cap-talk through March 2016 | Post-2016 continuation unavailable |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Current project activity and product status | Official repositories, project pages, partner listings | Completed |
| GAP-002 | Post-2016 cap-talk community discussion | Canonical Google Groups export or user-supplied copy | Open, non-blocking |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Web search | Candidate names plus release, product, deployment, certification, activity | Official records across candidates | Current maturity matrix established. | AWB-20260914-001-E0011 through AWB-20260914-001-E0017 |
| EXT-002 | 2026-09-14 | Web search | `shipping CHERI hypervisor`; `CHERI hypervisor product support matrix`; candidate-specific variants | No qualifying product record | Source-set product negative recorded. | AWB-20260914-001-E0011 |
| EXT-003 | 2026-09-15 | Direct public fetch | `https://groups.google.com/g/cap-talk`; `https://groups.google.com/robots.txt` | 2 resources | Public candidate group and robots-permitted `/g/` retrieval surface confirmed; search endpoints are disallowed and were not used. | AWB-20260914-001-E0031 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| released | Released CHERI hardware, OS, or tool | Released qualifying hypervisor product | Product type was checked separately. |
| active | Repository or community activity | Completed assurance or product deployment | Activity was not treated as correctness or adoption. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the search log. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed maturity and product searches. | Maturity evidence and cap-talk limitation recorded. |
| ACTIVITY-003 | 2026-09-15 | Analysis orchestrator | Recorded the candidate cap-talk group access check. | The archive-content gap remains open; the earlier blanket access characterization is qualified. |
