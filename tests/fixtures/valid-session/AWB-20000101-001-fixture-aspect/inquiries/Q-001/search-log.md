# Fixture question one - Search log

Session ID: `AWB-20000101-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2000-01-01`
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
| LQ-001 | 2000-01-01 | Fixture | `fixture://surface-one` | marker | Found the marker value. | AWB-20000101-001-E0001 |
| LQ-002 | 2000-01-01 | Fixture | `fixture://surface-two` | marker | No marker was recorded on this surface. | None |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| Fixture | Fixture component | Yes | The marker value. | Nothing further was expected. |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | A second fixture revision. | A later fixture snapshot. | Deferred; external research was not permitted. |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | External research was not permitted. | Not applicable | Not applicable | None |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| marker | Fixture marker value | Not used elsewhere in this session | Restricted to the fixture sense. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2000-01-01 | Inquiry scaffolder | Created the search log. | Synthetic fixture. |
| ACTIVITY-002 | 2000-01-01 | Analysis agent | Recorded LQ-001 and LQ-002. | Synthetic fixture. |
