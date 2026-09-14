# What Is the Demonstrated Maturity? - Report

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Literature, project, product, and community maturity
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

What is the demonstrated maturity of the qualifying systems across literature,
projects, products, and public community evidence?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry separated peer-reviewed evaluation, source availability, current
project activity, product/support evidence, assurance work, and community
signals. Vendor announcements and conference presentations were not treated as
product releases, and community activity was not treated as correctness.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-005 | Existing XRV maturity records | `component://xrv-research-repo/` | `ca41490`; 2026-09-14 | Baseline and gaps |
| SURFACE-007 | Literature, repositories, products | Public primary sources | 2026-09-14 | Publications, source, releases, support |
| SURFACE-008 | Public community evidence | Public archives and project activity | 2026-09-14 | Dated activity and access gaps |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: NOVA, Hedron, and L4Re have the strongest current project or product maturity among qualifying systems.
- Evidence IDs: AWB-20260914-001-E0012, AWB-20260914-001-E0013, AWB-20260914-001-E0014
- Confidence: High
- Evidence basis: They have current public repositories and documentation; NOVA has active 2026 development and formal-verification work, Hedron documents builds/tests and commercial platform use, and L4Re has professional support and a partner product listing.
- Alternatives considered: Vendor-maintained activity may overstate deployment maturity.
- Counter-evidence: Public records do not establish broad customer deployments or independent certification of the full stacks.
- Limitations: Product and deployment details remain vendor/project authored.

### FINDING-002

- Statement: The direct CHERI systems remain research-stage.
- Evidence IDs: AWB-20260914-001-E0015, AWB-20260914-001-E0016, AWB-20260914-001-E0017
- Confidence: High
- Evidence basis: CAP-VMs and ORC have peer-reviewed evaluations and source but no demonstrated product deployment; Bao-CHERI has a poster but no located artifact; bhyve is documented as experimental.
- Alternatives considered: A public demonstration or released CHERI OS might imply product-ready virtualization.
- Counter-evidence: No product support matrix, release note, certification, or named production deployment was located for a CHERI-secured hypervisor.
- Limitations: Private or newly published evidence may exist.

### FINDING-003

- Statement: No shipping CHERI-secured hypervisor product was established in the reviewed public record.
- Evidence IDs: AWB-20260914-001-E0011
- Confidence: Medium
- Evidence basis: CHERI product listings and candidate-specific product searches identified hardware, operating systems, tools, and demonstrations but no qualifying hypervisor product.
- Alternatives considered: Wind River Helix or bhyve may be capability-secured internally.
- Counter-evidence: The checked public evidence establishes CHERI guests or workloads, not the hosts' capability security model.
- Limitations: Source-set negative and proprietary internals are unavailable.

### FINDING-004

- Statement: The historical cap-talk archive is available through March 2016; the inaccessible post-2016 continuation is a bounded community-history gap.
- Evidence IDs: AWB-20260914-001-E0018
- Confidence: High
- Evidence basis: The local OS-security archive contains readable monthly exports and records the later Google Groups continuation as inaccessible to passive headless retrieval.
- Alternatives considered: The entire cap-talk history might be missing.
- Counter-evidence: The recovered 1998-2016 message corpus is locally present.
- Limitations: The gap prevents exhaustive claims about modern discussion or silence, not system qualification or maturity.

`Confidence` is `High`, `Medium`, or `Low`. A `Low`-confidence item belongs in
Hypotheses, not in Findings.

## Hypotheses

Possibilities that the evidence suggests but does not establish. These are not
conclusions.

| Hypothesis ID | Statement | Supporting evidence IDs | What would confirm it | What would refute it |
| --- | --- | --- | --- | --- |
| None | No hypothesis has been recorded. | Not applicable | Not applicable | Not applicable |

## Assumptions in use

Assumptions standing in for unanswered non-blocking questions.

| Open ID | Assumption | Why it was necessary | Effect if wrong |
| --- | --- | --- | --- |
| OPEN-001 | Core qualification and maturity rely on official project, product, source, and publication records rather than post-2016 cap-talk discussion. | The modern continuation is inaccessible to the passive workflow. | A complete archive could add community-history or discovery leads, but would not by itself establish architecture or maturity. |

## Disagreements and terminology

Conflicting statements between components, and terms that mean different
things in different components, each with both citations.

Project activity, product support, peer-reviewed evaluation, formal
verification, and community discussion are distinct maturity dimensions.
"Released" on a CHERI ecosystem list does not mean a released qualifying
hypervisor.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

NOVA verification is ongoing rather than a completed whole-system claim.
seL4's verified kernel boundary excludes user VMMs and much system integration.
No demonstration is treated as certification or production deployment.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

Public passive evidence cannot reveal proprietary hypervisor internals or
private deployments. Post-2016 cap-talk discourse is inaccessible. Some
project status evidence is vendor-authored.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

Located Bao-CHERI source, current CHERI-Hafnium output, a CHERI-Microkit VMM,
or independent product certification would materially change the maturity
assessment.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed four-dimensional maturity synthesis. | AWB-20260914-001-E0011 through AWB-20260914-001-E0018 | Current software object-capability systems lead; CHERI hypervisors remain research-stage. |
