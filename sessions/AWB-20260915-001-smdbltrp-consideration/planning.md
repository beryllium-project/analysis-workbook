# Smdbltrp consideration across Beryllium and Helium - Planning

Session ID: `AWB-20260915-001`
Distribution: `private`
Created: `2026-09-15`
Status: `Complete`

Record of the planning phase that preceded analysis. This is the durable
record of what the user asked for and what was agreed, in the user's terms.

## Aspect statement

Determine whether the Beryllium project, including `helium-te-poc`, has
considered the RISC-V privileged-architecture `Smdbltrp` supervisor double-trap
extension in review, analysis, planning, and threat modeling.

## Initial questions

| Question ID | Question as stated by the user | Opened as |
| --- | --- | --- |
| Q-001 | Has the Beryllium project, including Helium, considered `Smdbltrp` explicitly or through equivalent supervisor double-trap behavior across review, analysis, planning, and threat modeling; what gaps remain? | Q-001 |

## Clarifications agreed during planning

| Clarification ID | Question asked | Answer recorded | Effect on scope |
| --- | --- | --- | --- |
| CLARIFICATION-001 | What does “including he” mean? | `helium-te-poc`. | Includes the Helium pathfinder as an explicit evidence surface. |
| CLARIFICATION-002 | Does `Smdbltrp` mean the RISC-V supervisor double-trap extension? | Yes. | Fixes the extension identity and terminology family. |
| CLARIFICATION-003 | What evidence window applies? | Current revisions plus available Git history, issues, handoffs, and archived records. | Includes current and historical evidence while binding findings to revisions or checked dates. |
| CLARIFICATION-004 | What depth applies? | Deep. | Requires expanded terminology, adjacent components, archives, specifications, and negative searching. |
| CLARIFICATION-005 | Is public external research permitted? | Yes, after local-first searching. | Permits public-safe primary-source research for recorded gaps. |
| CLARIFICATION-006 | Are any component commands approved? | None. | Limits component evidence collection to maintained read-only inspection. |
| CLARIFICATION-007 | What should the result enable? | Map explicit and implicit consideration, assess gaps, and suggest non-binding follow-up. | Requires a coverage-and-gaps assessment, not an inventory alone. |
| CLARIFICATION-008 | What distribution is intended? | Prepare for `public-candidate`. | The package remains private unless a separate structured human promotion gate is completed. |

## Exclusions

Implementation changes; project decisions or claims of approval, acceptance,
sign-off, formal verification, hardware validation, publication, or release;
inference that a Helium lesson was adopted by Beryllium; unrestricted
whole-project audit beyond the Smdbltrp and supervisor double-trap aspect.

## Approved component commands

None. Command approval is per session, by exact command name, and is never
approval to write to a component.

| Command | Component | Approved on | Recorded result |
| --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable |

## Confirmed effective scope

The scope block presented to the user before analysis began, reproduced here
verbatim once confirmed.

## EFFECTIVE ANALYSIS SCOPE

- **Session ID:** Pending UTC allocation after confirmation
- **Aspect:** Whether the Beryllium project, including `helium-te-poc`, has
  considered the RISC-V privileged-architecture `Smdbltrp` supervisor
  double-trap extension.
- **Concrete review surfaces:** Design and implementation references; formal
  and informal reviews; analysis reports; planning, roadmap, issue, and handoff
  records; threat models, risks, abuse or failure scenarios, and mitigations;
  tests and assurance evidence; Git history and archived records; terminology
  and dependency references.
- **Questions, in order:**
  1. Where is `Smdbltrp` explicitly referenced or evaluated?
  2. Where are equivalent supervisor double-trap behaviors considered
     implicitly under older or different terminology?
  3. How is that consideration distributed across review, analysis, planning,
     and threat modeling, including Helium?
  4. What checked surfaces contain no located evidence, and what are the
     plausible alternative explanations?
  5. What material coverage gaps remain, and what non-binding follow-up would
     address them?
- **Exclusions:** No implementation changes; no project decisions, approval,
  acceptance, sign-off, formal-verification, hardware-validation, publication,
  or release claims; no inference that Helium lessons were adopted by
  Beryllium; no unrestricted whole-project audit beyond the
  Smdbltrp/double-trap aspect.
- **Expected evidence components, local-first:** Parent coordination and source
  registry; current Beryllium implementation and design component;
  `helium-te-poc`; Beryllium assurance and evidence records;
  formal-verification, CHERI, hypervisor, and OS-security research components
  identified by `RESEARCH-SOURCES.md`; existing analysis-workbook packages and
  source-discovery records; then public primary specifications and upstream
  history.
- **Time or revision window:** Current checked-out revisions plus available Git
  history, issues, handoffs, and archived records, each bound to an exact
  revision or checked date.
- **Depth:** Deep.
- **External research permission:** Permitted after documented local-first
  searching, using public-safe queries and preferring primary sources.
- **Approved component commands:** None.
- **Initial package distribution:** `private`.
- **Intended post-analysis distribution:** Prepared for possible
  `public-candidate` promotion; no promotion occurs without the separate
  structured human-recorded gate.
- **Write boundary and execution prohibition:** Writes only inside
  `analysis-workbook`; all sibling components and Git metadata remain
  read-only. No component build, test, compile, source, import, install, or
  other component-owned command may run.
- **Expected artifact directory:**
  `sessions/AWB-<UTC-allocation-date>-NNN-smdbltrp-consideration/`.
- **Known limitations:** Unavailable repositories, inaccessible issue or
  history records, and historical terminology can bound negative findings;
  absence will only be asserted for enumerated locations and revisions
  checked. Public-candidate suitability may be blocked by evidence sensitivity
  or redistribution status.

The user selected **Begin analysis** and requested autopilot `/fleet`.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-15 | Session scaffolder | Created the planning record. | Initial scaffold preceded the confirmed planning record below. |
| ACTIVITY-002 | 2026-09-15 | Analysis orchestrator | Recorded the confirmed planning conversation and effective scope. | Session allocation supplied `AWB-20260915-001`; no scope field materially changed after confirmation. |
