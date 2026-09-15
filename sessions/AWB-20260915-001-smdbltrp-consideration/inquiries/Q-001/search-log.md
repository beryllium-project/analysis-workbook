# Smdbltrp consideration and coverage gaps - Search log

Session ID: `AWB-20260915-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-15`
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
| LOCAL-001 | 2026-09-15 | 1 | component://provenance-review/reviews/ | Exact and variant double-trap terms; aspect maps, scopes, documentation notes, and selected search logs | No explicit or implicit trap-architecture analysis; packages are TE-provenance scoped. | AWB-20260915-001-E0013 |
| LOCAL-002 | 2026-09-15 | 2 | component://beryllium-repo/ | Current state, R8-H0 nested checkout, hardware inventory, feature matrix, trap assembly, proof assumptions, and Git history | No named extension; explicit nested-trap software defense and generic optional-state fail-closed planning found. | AWB-20260915-001-E0001, AWB-20260915-001-E0002, AWB-20260915-001-E0003, AWB-20260915-001-E0004, AWB-20260915-001-E0005, AWB-20260915-001-E0023 |
| LOCAL-003 | 2026-09-15 | 3 | component://helium-te-poc/ | Exact terms, nested and reentrant trap variants, source, limits, reviews, remediation, and Git history | No named extension; non-nesting assumption, multiple nested-trap findings, and fixed-scope non-goal disposition found. | AWB-20260915-001-E0006, AWB-20260915-001-E0007, AWB-20260915-001-E0008, AWB-20260915-001-E0023 |
| LOCAL-004 | 2026-09-15 | 4 | component://project-manager/, workspace://, component://threat-modeler/, component://security-reviewer/ | Decisions, ledger, requests, assurance, threat packages, review contracts, and exact or variant terms | No named-extension consideration; three nested-trap threat treatments, no security-review engagement, and an explicit assurance exclusion found. | AWB-20260915-001-E0009, AWB-20260915-001-E0010, AWB-20260915-001-E0011, AWB-20260915-001-E0012, AWB-20260915-001-E0016 |
| LOCAL-005 | 2026-09-15 | 5 | component://formal-verification-research/ | Bibliography, Beryllium workstream, collaboration records, exact and variant terms | No named-extension source or analysis; adjacent Helium trap boundary only. | AWB-20260915-001-E0014 |
| LOCAL-006 | 2026-09-15 | 6 | component://cheri-riscv-notes-repo/ | Specifications, tools, glossary, and exact source-index terms | No named-extension source or analysis. | AWB-20260915-001-E0014 |
| LOCAL-007 | 2026-09-15 | 7 | component://xrv-research-repo/ | Research streams, references, review log, and exact source-index terms | No named-extension source or analysis. | AWB-20260915-001-E0014 |
| LOCAL-008 | 2026-09-15 | 8 | component://osr-claude/ permitted RISC-V corpus | Authored survey and manifest plus archived QEMU, Spike, and OpenSBI artifacts; exact and variant terms | Authored analysis is negative; third-party artifacts contain separate extension fields, CSR encodings, and an OpenSBI implementation series, with the monthly OpenSBI archives indexed by the collection manifest. | AWB-20260915-001-E0024 |
| LOCAL-009 | 2026-09-15 | Prior analysis and coordination indexes | Exact extension names, double-trap terms, and stable-source identifier across all required indexes | No prior discovery, queue row, or analysis record found. | AWB-20260915-001-E0016 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 1 | provenance-review | Complete | No relevant consideration | Trap architecture excluded by package scope. |
| 2 | beryllium-repo | Complete with dirty-state limitation | Implicit behavior and generic planning catch-alls | Current tracked main is minimal; substantive checked tree is untracked at `102f2b0`. |
| 3 | helium-te-poc | Complete | Implicit hazard review and explicit non-goal | No named architectural mechanism. |
| 4 | Project coordination, threat, and review | Complete | Nested-trap threat treatments and assurance boundary | No security-review engagement; some historical source access was unavailable to the original threat run. |
| 5 | formal-verification-research | Complete | Adjacent Helium boundary only | No extension source. |
| 6 | cheri-riscv-notes-repo | Complete | None | No extension source. |
| 7 | xrv-research-repo | Complete | None | No extension source. |
| 8 | osr-claude | Complete | Unindexed QEMU and Spike tokens | No authored analysis or normative source. |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Normative identity and semantics of Smdbltrp versus Ssdbltrp | Ratified RISC-V double-trap specification | Closed by AWB-20260915-001-E0017 through E0019 |
| GAP-002 | Ratification chronology relative to 2026 project artifacts | Official tagged release and commit history | Closed by AWB-20260915-001-E0017 |
| GAP-003 | Upstream HS/VS handling precedent | QEMU and OpenSBI primary implementation records | Closed by AWB-20260915-001-E0020 and E0025 |
| GAP-004 | Whether RVA23 requires either extension | Official profile source | Closed by AWB-20260915-001-E0022 |
| GAP-005 | Whether the intended hardware and firmware implement and enable the extensions | Platform manuals, firmware capability evidence, or approved target execution | Open as OPEN-001 |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-15 | Web search and official RISC-V repositories | `RISC-V Smdbltrp`; `RISC-V Ssdbltrp`; `RISC-V double trap extension specification` | Multiple official results; exact engine total not exposed | Located the ratified v1.0 specification and corrected the machine versus supervisor identity. | AWB-20260915-001-E0017 |
| EXT-002 | 2026-09-15 | Official RISC-V tagged source and release API | `mstatus MDT`; `sstatus SDT`; `menvcfg DTE`; `critical-error state`; `Smrnmi double trap` | One normative specification plus its release history | Established operational semantics, RNMI relationship, CC-BY-4.0 license, and 2024-08-23 v1.0 publication. | AWB-20260915-001-E0018, AWB-20260915-001-E0019 |
| EXT-003 | 2026-09-15 | Official QEMU archive and current source | `QEMU Smdbltrp Ssdbltrp` | RFC and v2 series plus current fields | Established public implementation work and separate extension switches; did not infer target enablement. | AWB-20260915-001-E0020 |
| EXT-004 | 2026-09-15 | Official OpenSBI and Spike repositories | `OpenSBI Ssdbltrp`; `Spike Smdbltrp Ssdbltrp` | Current sources and commit history; exact engine total not exposed | Distinguished initial OpenSBI redirect or panic behavior from later software-event registration and extension gating. | AWB-20260915-001-E0025 |
| EXT-005 | 2026-09-15 | Official RISC-V profiles source | `RVA23 Smdbltrp`; `RVA23 Ssdbltrp` | No matching extension in the complete profile lists examined | Neither extension is an RVA23 profile requirement or option. | AWB-20260915-001-E0022 |
| EXT-006 | 2026-09-15 | Versioned official documentation | 20240411 Smdbltrp and Ssdbltrp pages | Both versioned page requests returned not found | The earlier edition used by local threat research did not expose standalone double-trap pages; the ratified standalone v1.0 source is the authoritative chronology record. | AWB-20260915-001-E0017 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| Smdbltrp | The ratified M-mode double-trap extension. | The user's initial description called it supervisor-level. | The report preserves the user's term but analyzes Smdbltrp and the directly relevant Ssdbltrp separately. |
| Ssdbltrp | The ratified extension for S, HS, and VS double traps. | Absent from all authored local analysis located. | Supervisor-level coverage is attributed only to Ssdbltrp. |
| double fault | Helium review shorthand for a software panic-stack path. | RISC-V double-trap exception code 16 and SDT or MDT state. | The local phrase is classified as adjacent vocabulary, not extension awareness. |
| DTE | RISC-V double-trap enable in `menvcfg` and `henvcfg`. | Domain Type Enforcement in CHERI-oriented notes. | Every DTE occurrence is resolved by its source and CSR context. |
| re-entrant | A pure C decision function may be re-entered after reject. | A trap handler may or may not be safe to re-enter after saving state. | Pure-function evidence is excluded from architectural trap coverage. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-15 | Inquiry scaffolder | Created the search log. | No query has been run. |
| ACTIVITY-002 | 2026-09-15 | Analysis orchestrator | Completed all eight local tiers, prior-analysis checks, targeted history, and public primary research. | Negative results are bounded to the listed paths, revisions, dates, and query families. |
