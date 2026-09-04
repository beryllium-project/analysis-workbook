# Helium-to-Beryllium method transfer queue

This is a maintained **pull** interface for Helium lessons and candidate
method inputs that may inform Beryllium's iterative development process.
Consumers read the queue and perform any triage in their own authoritative
component or Project Manager records. Adding an item changes nothing outside
this repository.

This queue is deliberately separate from
[pm-queue.md](pm-queue.md). The PM queue registers newly discovered sources;
this queue carries evidence-scoped method and process inputs. It does not use
the source-discovery schema, `PMQ-NNN` identifiers, or source-admission
statuses.

Read [AGENT-INTERFACE.md](../AGENT-INTERFACE.md) before consuming this queue.

## Authority and non-claims

- Every item enters as `new` and `unaccepted`.
- An item is an input to Beryllium-side triage, not a Beryllium plan,
  roadmap, milestone, owner assignment, implementation authorization, or
  adoption decision.
- No item or queue status grants responsible-human review, acceptance,
  approval, sign-off, assurance, publication, release, or hardware
  validation.
- Helium remains a review-and-test proof of concept. Its bounded CBMC results
  apply only within their stated source, property, tool, and fixed-profile
  boundaries; Helium is not formally verified or hardware validated.
- This repository never modifies `component://helium-te-poc` or
  `component://beryllium-repo`.

## Entry schema

Each item uses a stable `HET-NNN` identifier and records:

| Field | Requirement |
| --- | --- |
| Raised on | Date this repository recorded the item |
| Direction basis | User direction date or a completed analysis-session reference |
| Source provenance | Portable component locator, exact revision, and maintained source artifact |
| Target | The component or process asked to triage the input |
| Initial queue status | Always `new` when the immutable item definition is created |
| Initial input state | Always `unaccepted`; transfer handling never changes this into acceptance |
| Initial owner-side record | `Not applicable` when created |
| Endpoint or decision input | The bounded decision presented for triage |
| Candidate transferable method | Techniques or process controls that may be reused |
| Non-transferable detail | Source-specific constants, bounds, claims, and assumptions that must not be copied as requirements |
| Residual assumptions | Trusted or unverified links that remain outside the candidate method |
| Non-claims | Explicit limits on adoption, approval, review, release, and assurance |

The item heading, provenance, endpoint or decision input, candidate method,
non-transferable detail, residual assumptions, and non-claims are immutable.
Status history and the activity log are append-only. The queue summary is a
derived current index: its status must equal the final status-history row and
may change only to mirror an appended history row. A correction to immutable
content adds a superseding `HET-NNN` item; it does not erase or rewrite the
earlier input.

## Transfer lifecycle

These statuses describe only whether the pull input has been handled:

| Status | Meaning |
| --- | --- |
| `new` | Recorded here; no exact Beryllium-side triage record is known |
| `routed` | An exact Project Manager or responsible-human owner request has been recorded |
| `recorded` | The Beryllium owner has recorded a candidate input in its own artifact; this is not acceptance |
| `deferred` | Triage is postponed, with an exact external record and reason |
| `declined` | The owner declined the input, with an exact external record and reason |
| `superseded` | A later `HET-NNN` item replaces this input without deleting it |

The analysis-workbook maintainer mirrors a lifecycle change only after
observing the exact owner-side record and appends that observation to the
item's status history. Consumers do not use this queue as the authoritative
place to approve or adopt work.

The allowed transitions are:

| Current | Allowed next status |
| --- | --- |
| `new` | `routed`, `recorded`, `deferred`, `declined`, or `superseded` |
| `routed` | `recorded`, `deferred`, `declined`, or `superseded` |
| `deferred` | `routed`, `recorded`, `declined`, or `superseded` |
| `recorded` | `superseded` |
| `declined` | terminal |
| `superseded` | terminal |

Every history row after `new` must cite an exact portable
`component://...` or `workspace://...` owner-side record. The final history
row is authoritative for current transfer status.

## Queue summary

| Transfer ID | Raised on | Direction date | Subject | Target | Status | Input state |
| --- | --- | --- | --- | --- | --- | --- |
| HET-001 | 2026-09-04 | 2026-09-04 | Helium Tier 8 endpoint and reusable FV method | `component://beryllium-repo` iterative development process | `new` | `unaccepted` |

## HET-001 - Helium Tier 8 endpoint and reusable FV method

### Provenance

| Field | Value |
| --- | --- |
| Raised on | 2026-09-04 |
| Direction basis | User direction dated 2026-09-04 |
| Source component | `component://helium-te-poc` |
| Frozen reference | Helium Tier 8 H6 candidate `ed1545155c8d09aa75803a256eee0d2fa8844b91` |
| Maintained source | `component://helium-te-poc/docs/fv-pathfinder-lessons.md` |
| Target | `component://beryllium-repo` iterative development process |
| Initial queue status | `new` |
| Initial input state | `unaccepted` |
| Initial owner-side record | Not applicable; no Beryllium-side triage record is asserted |

### Endpoint direction

Helium Tier 8 is the FV endpoint. Do not add a Tier 9 merely to increase the
number of claims, properties, checks, mutations, or evidence artifacts. Any
future Helium verification work would need a new security-significant
question and an explicit scope review; this item neither requests nor
authorizes such work.

### Candidate reusable lessons

Transfer the method for Beryllium-side evaluation, not Helium's fixed
constants:

| Candidate lesson | Beryllium-side triage question |
| --- | --- |
| Select one stable security-significant production seam | Is there one production decision or transaction whose security meaning, inputs, outputs, and failure behavior can be bounded without replacing the live problem with a synthetic convenience model? |
| Preserve pure/effect separation | Can decision logic be made pure or effect-free while live acquisition, privileged writes, ordering, and other effects remain explicit adjacent correspondence obligations? |
| Use an independent extensional specification | Can the intended relation be stated with a structure independent of production control flow, tables, helpers, and macros, with separate specification review authority? |
| State explicit rollback and failure relations | Are invalid input, rejection, terminal failure, non-mutation, state commit, and no-effect outcomes specified exactly rather than implied by return codes? |
| Plan mutations before acceptance | Are defect classes and expected failing named claims selected before a result is considered for acceptance, with surviving mutations retained as review inputs? |
| Retain exact evidence and provenance | Are the source commit and paths, tools and options, specifications, harnesses, claims, normalized results, mutation outcomes, tests, and generated artifacts bound to an exact candidate? |
| Keep residual assumptions adjacent | Are live provenance, timing, correspondence, compiler, ISA, emulator, hardware, and other trusted or unverified links stated beside the bounded claim? |
| Keep human gates separate | Are automated success, an exact clean candidate, responsible-human review, later approval, and release represented as distinct states that automation cannot collapse? |

### Details that do not transfer

Do not treat Helium's one hart, two sequential subjects, six resources, two
G-stage roots, one memory class, four permissions, fixed event rows, fixed
PCs, authority slots, policy rows, unwind bounds, CBMC choice, or claim totals
as Beryllium requirements or evidence. Beryllium must select its own
security-significant seam, profile, tool qualification, specifications,
bounds, mutations, evidence, and exit criteria.

### Residual assumptions and limits

The method does not by itself establish live input provenance, call-time or
once-only correspondence, privileged-effect correctness, source-to-binary
refinement, compiler or ISA correctness, emulator correctness, hardware
behavior, concurrency properties, noninterference, or Beryllium suitability.
Those obligations must remain visible and be addressed by evidence appropriate
to the Beryllium seam, if one is selected.

### Beryllium-side triage request

Decide under Beryllium's own iterative planning and human-gated review process
whether any candidate lesson should become an owner-side entry criterion,
design constraint, evidence requirement, or exit criterion for a future
security-significant seam. Record any result in a Beryllium-owned or Project
Manager-owned artifact and cite it here before changing the transfer
lifecycle.

This request is not a claim of Beryllium adoption, planning approval,
responsible-human review, implementation authorization, release, publication,
formal verification, hardware validation, or assurance.

### Status history

| Date | Status | Actor | Owner-side record | Note |
| --- | --- | --- | --- | --- |
| 2026-09-04 | `new` | analysis-workbook | Not applicable | Recorded from the 2026-09-04 user direction as an unaccepted input; the analysis workbook did not modify either owner component or change any owner-side status. |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-04 | analysis-workbook | Created the dedicated Helium method-transfer queue and recorded HET-001. | The item is `new` and `unaccepted`; no Beryllium adoption, review, approval, release, or assurance state changed. |
