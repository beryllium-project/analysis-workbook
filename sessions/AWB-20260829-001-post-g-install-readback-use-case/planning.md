# Post-G-stage install readback use case and threat analysis - Planning

Session ID: `AWB-20260829-001`
Distribution: `private`
Created: `2026-08-29`
Status: `Complete`

Record of the planning phase that preceded analysis. This is the durable
record of what the user asked for and what was agreed, in the user's terms.

## Aspect statement

Determine the use case for post-G-stage install readback before assuming the
feature is needed: identify which security or assurance threats could justify
it, how the mechanism can fail or mislead, and whether alternatives provide
better coverage.

## Initial questions

| Question ID | Question as stated by the user | Opened as |
| --- | --- | --- |
| USER-001 | "review and analyze threat scenarios relating to the post G stage install readback, citing any specific research or examples" | Refined during planning; to be opened as Q-001 |
| USER-002 | "actually, the purpose of this analysis is to determine the use-case for the feature first" | Primary purpose of Q-001 |

## Clarifications agreed during planning

| Clarification ID | Question asked | Answer recorded | Effect on scope |
| --- | --- | --- | --- |
| CLARIFICATION-001 | Which threat boundary should the review cover? | Broad: malicious installer or host, compromised tooling or firmware, physical or interposer attacks, readback-channel attacks, and verification-design failures. | No named attack class was excluded. |
| CLARIFICATION-002 | Which local Beryllium components should be expected evidence sources? | All registered components relevant to Stage G, install or readback, assurance, and threat research. | All local registry tiers must be worked in order. |
| CLARIFICATION-003 | What should the use-case analysis enable the user to decide? | Cover feature justification, requirements, and comparison with alternatives. | Q-001 must address all three without making the decision for the user. |
| CLARIFICATION-004 | What revision and research window applies? | Current local revisions with all-history external research and examples. | Local claims require exact revisions; external examples have no lower date cutoff. |
| CLARIFICATION-005 | What depth applies? | Deep. | Expanded terminology, adjacent components, archives, standards, specifications, citation chaining, and negative searching are required. |
| CLARIFICATION-006 | Which component commands are approved? | None. | Evidence gathering is read-only and no component code may be executed. |
| CLARIFICATION-007 | What post-analysis distribution is intended? | `public-candidate`. | The package remains private and can only contain a blank human promotion record pending separate review. |
| CLARIFICATION-008 | Is external research permitted under public-safe query restrictions? | Permitted. | Public queries may contain only generic public terminology and no private identifiers. |
| CLARIFICATION-009 | Are there explicit exclusions beyond the execution and write boundaries? | None. | The broad threat boundary remains in scope. |
| CLARIFICATION-010 | Should analysis begin under the presented effective scope? | Begin analysis. | Authorized package allocation and the transition from planning to analysis. |

## Exclusions

None within the confirmed broad threat boundary. The analysis does not make
an approval, acceptance, release, publication, or implementation decision.

## Approved component commands

None. Command approval is per session, by exact command name, and is never
approval to write to a component.

| Command | Component | Approved on | Recorded result |
| --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable |

## Confirmed effective scope

The scope block presented to the user before analysis began, reproduced here
verbatim once confirmed.

**EFFECTIVE ANALYSIS SCOPE**

- **Session ID:** Pending UTC allocation after confirmation
- **Aspect:** The security and assurance use case for post-G-stage install
  readback in Beryllium - whether the feature is justified, which threats it
  addresses, and whether alternatives provide better assurance.
- **Concrete review surfaces:** Stage G and post-stage trust boundaries;
  installation and readback semantics; assets, adversaries, and attack timing;
  acquisition/transport/comparison/interpretation of readback; malicious
  installer or host; compromised tooling or firmware; physical/interposer and
  channel attacks; verification-design failure, equivocation, replay, and
  time-of-check/time-of-use risk; detectable versus undetectable modification;
  false-assurance modes; alternative verification mechanisms; requirements
  and residual risk; current implementation and assurance status.
- **Questions, in order:**
  1. What defensible security or assurance use cases can post-install readback
     serve after Stage G?
  2. Which concrete threat scenarios materially justify it, and what specific
     research, incidents, or system examples support or weaken those scenarios?
  3. How can readback be bypassed, spoofed, or made to provide false assurance,
     and what remains outside its guarantee?
  4. How does it compare with alternative verification mechanisms?
  5. Under what explicit assumptions and requirements would retaining or
     developing it be justified?
- **Exclusions:** None within the broad threat boundary. The analysis will not
  make an approval, acceptance, release, or implementation decision.
- **Expected evidence, local-first:** Parent source registry and coordination
  records; all registered design/implementation components relevant to Stage G
  and install/readback; applicable assurance/evaluation components and existing
  results; applicable local security/formal-verification/architecture research
  corpora; completed provenance packages if directly relevant; then external
  primary literature, standards, specifications, incident reports, and
  upstream implementations, followed only as needed by clearly marked
  secondary sources. Exact component identities will be resolved from the
  authoritative registry after confirmation.
- **Revision/window:** Current local component revisions, each bound to an exact
  inspected revision; all-history external research and examples.
- **Depth:** Deep.
- **External research:** Permitted, after the local pass, using only generic
  public-safe terms. No private code, private repository names, internal URLs,
  credentials, or non-public identifiers may appear in public queries.
- **Approved component commands:** None.
- **Initial package distribution:** `private`.
- **Intended post-analysis distribution:** `public-candidate`; analysis will
  only prepare a blank human-promotion record and cannot promote or publish the
  package.
- **Write/execution boundary:** Writes only inside `analysis-workbook`; all
  sibling components and their Git metadata remain read-only. No component
  build, test, compile, import, dependency installation, or unapproved command
  execution.
- **Expected artifact directory:**
  `sessions/AWB-<UTC-date>-<NNN>-post-g-install-readback-use-case/`
- **Known limitations:** Exact meaning and current status of "post-G-stage
  install readback," relevant component identities, and revisions remain to be
  established from local evidence; no new component command evidence may be
  generated; physical attacks may be supported by analogous external systems
  rather than Beryllium-specific demonstrations; public-candidate eligibility
  may be blocked by private/internal evidence or unresolved redistribution
  status.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Session scaffolder | Created the planning record. | The record was initialized before scope capture. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Recorded the planning dialogue and confirmed effective scope. | The user selected Begin analysis; session allocation produced AWB-20260829-001. |
