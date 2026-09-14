# Which Systems Genuinely Qualify? - Report

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Qualifying object-capability hypervisor systems
Confidence: High

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Which systems genuinely use CHERI or object capabilities as the core
hypervisor or VMM security model?

## Method

How the answer was reached: the tiers worked in order, what was delegated,
what was verified directly, and what was approved for execution.

The inquiry followed the local source registry, then checked public primary
papers, project documentation, source repositories, specifications, and
negative artifact searches. Systems were classified by the role of
capabilities in authority enforcement rather than by name. A CHERI-aware guest
does not make its host a CHERI-secured hypervisor, and a microkernel capability
substrate is distinguished from its user-space VMM.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-003 | Formal-verification precedents | `component://formal-verification-research/` | `e5740de`; 2026-09-14 | Capability-kernel and proof-scope comparisons |
| SURFACE-004 | CHERI corpus | `component://cheri-riscv-notes-repo/` | `6553092`; 2026-09-14 | Terminology and source-index checks |
| SURFACE-005 | Existing XRV survey | `component://xrv-research-repo/` | `ca41490`; 2026-09-14 | Full survey, references, handoff, and review log |
| SURFACE-006 | Object-capability lineage | `component://osr-claude/` | `f2edd17`; 2026-09-14 | Unrestricted capability-system sources |
| SURFACE-007 | Public papers and projects | Public primary sources | 2026-09-14 | Candidate qualification and negative artifact search |

## Findings

Each finding is a subsection. Use the following shape.

### FINDING-001

- Statement: The clearest qualifying conventional hypervisor family is software object-capability based rather than CHERI based: NOVA, Hedron, L4Re/Fiasco.OC with uvmm, and seL4-based VMM frameworks.
- Evidence IDs: AWB-20260914-001-E0005, AWB-20260914-001-E0006, AWB-20260914-001-E0007, AWB-20260914-001-E0008
- Confidence: High
- Evidence basis: Their primary documentation assigns resource authority through capabilities and places VMMs or services outside a small privileged kernel or microhypervisor.
- Alternatives considered: These could be described merely as microkernels that happen to host VMMs.
- Counter-evidence: NOVA and Hedron explicitly combine microkernel and hypervisor functions; L4Re explicitly describes itself as a hypervisor framework and passes resource capabilities to uvmm; seL4 documents virtualization support through a capability-allocated system.
- Limitations: Their capability semantics are software kernel-object capabilities, not CHERI tagged pointers.

### FINDING-002

- Statement: Two direct CHERI-centered systems qualify, but at different boundaries: Bao-CHERI is an announced pure-capability type-1 hypervisor, while CAP-VMs/Intravisor is an evaluated capability-based VMM-like compartment system rather than conventional hardware virtualization.
- Evidence IDs: AWB-20260914-001-E0002, AWB-20260914-001-E0003
- Confidence: High
- Evidence basis: Bao-CHERI's abstract explicitly places CHERI in the hypervisor; CAP-VMs explicitly makes CHERI capabilities the isolation and sharing mechanism.
- Alternatives considered: CAP-VMs could be treated as a normal VM system because its components are called cVMs.
- Counter-evidence: Its components share one virtual address space and lack independent hardware-VM state and guest-physical translations.
- Limitations: Bao-CHERI lacks a located artifact and CAP-VMs is a specialized cloud/library-OS architecture.

### FINDING-003

- Statement: CheriBSD/bhyve is CHERI-aware virtualization, not established as a CHERI-core hypervisor; CHERI-seL4 VMM and CHERI-Hafnium remain unlocated or outside the delivered scope.
- Evidence IDs: AWB-20260914-001-E0004, AWB-20260914-001-E0009, AWB-20260914-001-E0010
- Confidence: High
- Evidence basis: Pinned bhyve source preserves guest capability state, while the checked CHERI-seL4 RFC excludes VMM work and CHaOS records only a programme target for Hafnium.
- Alternatives considered: Capability-aware EL2 setup could imply a purecap host.
- Counter-evidence: No checked source states that bhyve's own VMM authority or components are capability-secured.
- Limitations: Later unindexed work could change the CHERI-seL4 or Hafnium result.

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
| None | No assumption is in use. | Not applicable | Not applicable |

## Disagreements and terminology

Conflicting statements between components, and terms that mean different
things in different components, each with both citations.

The principal collision is "capability": CHERI tagged pointers, kernel-object
capabilities, software handles, access tokens, and generic feature capability
are not interchangeable. "VM" also differs: CAP-VM cVMs are compartments in
one address space, whereas NOVA, Hedron, L4Re, seL4, Bao, and bhyve use
hardware-virtualization concepts.

## Assurance boundaries preserved

Restate the relevant component limits in their own terms so the report cannot
be read as strengthening them.

No classification grants acceptance or assurance. Bao-CHERI is poster-level;
CAP-VMs is an evaluated research system; bhyve support is experimental; and
the verified seL4 kernel boundary does not automatically extend to VMMs,
devices, configuration, or CHERI modifications.

## Limitations

What this analysis does not establish, what was excluded, where coverage is
thin, and which blocked resources matter.

The review is public-passive and search-bound. Some artifact claims are
negative results rather than proof of non-existence. The XRV baseline is stale
and lacks nine historical intake records recorded by the Project Manager.

## What would change the answer

The specific evidence, decision, or access that would most change the
conclusion.

A reproducible Bao-CHERI artifact, a delivered CHERI-Hafnium repository, or a
current CHERI-Microkit VMM would materially change the direct CHERI candidate
set.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the report. | None | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed candidate classification and falsification. | AWB-20260914-001-E0001 through AWB-20260914-001-E0010 | Direct, aware, substrate, comparator, and excluded classes separated. |
