# Which Systems Genuinely Qualify? - Summary

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Qualifying object-capability hypervisor systems
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

Which systems genuinely qualify under the review's CHERI and
object-capability hypervisor rubric?

## Answer

The clearest conventional hypervisor systems are **NOVA, Hedron, L4Re/Fiasco.OC
with uvmm, and seL4-based VMM frameworks**, all using software object
capabilities to allocate authority around a small privileged mechanism.
**Bao-CHERI** qualifies as an announced purecap hypervisor, but its public
artifact was not located. **CAP-VMs/Intravisor** qualifies as an evaluated
CHERI capability VMM-like architecture, but not as conventional hardware
virtualization. **CheriBSD/bhyve** is CHERI-aware guest virtualization rather
than a demonstrated CHERI-secured host. CHERI-Microkit VMM and CHERI-Hafnium
were not established.

## Confidence

High for the classification of the documented systems; Medium for negative
artifact findings.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-001-E0005 | NOVA explicitly combines a microhypervisor with capability-based authorization and user-space VMMs. | `https://github.com/udosteinberg/NOVA` |
| AWB-20260914-001-E0007 | L4Re/uvmm passes guest memory and hardware authority as capabilities. | `https://l4re.org/doc/l4re_servers_uvmm.html` |
| AWB-20260914-001-E0002 | Bao-CHERI is explicitly described as a pure-capability RISC-V hypervisor. | RISC-V Summit Europe 2026 abstract |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| None | No open question has been recorded. | Not applicable |

## Limitations

Artifact searches are bounded. XRV's current corpus does not yet profile NOVA,
Hedron, or L4Re and is missing historical intake records.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone qualification summary. | Matches the report. |
