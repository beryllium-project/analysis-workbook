# Object-Capability Hypervisor Review - Planning

Session ID: `AWB-20260914-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Record of the planning phase that preceded analysis. This is the durable
record of what the user asked for and what was agreed, in the user's terms.

## Aspect statement

Literature, project, product, and public-community review of hypervisors and
closely related systems that use CHERI, comparable capability hardware, or an
object-capability architecture as their core security model.

## Initial questions

| Question ID | Question as stated by the user | Opened as |
| --- | --- | --- |
| Q-001 | Which systems genuinely use CHERI or object capabilities as the core hypervisor or VMM security model? | Q-001 |
| Q-002 | What is the demonstrated literature, project, product, and community maturity of the qualifying systems? | Q-002 |
| Q-003 | Which design and assurance patterns recur, and what counter-evidence limits them? | Q-003 |
| Q-004 | What evidence-backed implications and open questions should Beryllium retain? | Q-004 |

## Clarifications agreed during planning

| Clarification ID | Question asked | Answer recorded | Effect on scope |
| --- | --- | --- | --- |
| CLARIFICATION-001 | Which component owns the review? | XRV owns the durable corpus and AWB owns the private synthesis. | Avoids creating a duplicate research component. |
| CLARIFICATION-002 | How broad is the candidate boundary? | Direct systems plus bounded capability-hardware, capability-VMM, and capability-kernel comparators. | Excludes generic isolation systems unless used for a specific comparison. |
| CLARIFICATION-003 | Does this plan include a CHERI PoC? | No; PoC planning is excluded. | The review may record implications but cannot select or charter a PoC. |
| CLARIFICATION-004 | What external evidence is permitted? | Public passive sources only; no outreach or private material. | Bounds product and community evidence to observable records. |
| CLARIFICATION-005 | What depth applies? | Standard. | Requires broad local sweep, public-source review, citation chaining, alternatives, and counter-evidence. |
| CLARIFICATION-006 | How will XRV updates be coordinated? | The Project Manager agent will later coordinate updates to the XRV repository. | This session records evidence, discoveries, and an owner-ready handoff; it does not modify XRV. |
| CLARIFICATION-007 | How should inaccessible sources be handled? | Keep a durable inaccessible-resource log and notify the user if the cap-talk archive gap materially affects the answer. | The cap-talk archive is tracked as a named access-risk surface rather than silently omitted. |

## Exclusions

PoC selection, chartering, or implementation planning; private or internal
external sources; active outreach; architecture approval; implementation
authorization; and any claim of acceptance, assurance, publication, or
release.

## Approved component commands

None. Command approval is per session, by exact command name, and is never
approval to write to a component.

| Command | Component | Approved on | Recorded result |
| --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable |

## Confirmed effective scope

The scope block presented to the user before analysis began, reproduced here
verbatim once confirmed.

- session ID: `Pending UTC allocation after confirmation`
- aspect statement: Hypervisors and closely related systems that use CHERI, comparable capability hardware, or object capabilities as their core security model
- concrete review surfaces: Literature, public project artifacts, product evidence, public community activity, capability model, decomposition, maturity, assurance, and Beryllium relevance
- questions to address: qualifying systems; demonstrated maturity; recurring patterns and counter-evidence; Beryllium implications and open questions
- exclusions: PoC selection, chartering, or implementation planning; private/internal sources; active outreach; architecture approval or implementation authorization
- expected evidence components: Provenance review, Beryllium, Helium, Project Manager records, formal-verification research, CHERI notes, XRV research, OS-security research, then public primary sources
- time or revision window: Historical record through checked dates, with current public status checked during the review
- depth: Standard
- external research permission: Public passive research permitted
- approved component commands: None
- initial package distribution: `private`
- intended post-analysis distribution: `private`
- write boundary and execution prohibition: Writes only in analysis-workbook; sibling components remain read-only; no component command execution
- expected artifact directory: `sessions/AWB-<UTC-date>-NNN-object-capability-hypervisor-review/`
- known limitations: No outreach or private evidence; product and community claims depend on public records; XRV has no current `COLLAB.md`

The user approved the implementation plan and selected autopilot execution.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created the planning record. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded the approved review scope. | The approved plan supplies the effective scope and implementation boundary. |
| ACTIVITY-003 | 2026-09-14 | User and analysis orchestrator | Clarified XRV coordination and inaccessible-resource handling. | Project Manager coordination is deferred; cap-talk archive impact must be surfaced if material. |
