# Establish the post-G-stage install readback use case - Open questions

Session ID: `AWB-20260829-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-08-29`
Status: `Complete`

Clarifying questions raised while analyzing. A `Blocking` question pauses the
analysis and is asked immediately. A `Non-blocking` question is recorded with
the assumption used in its place, and is surfaced in the summary and the chat
reply.

Never invent an answer, and never let an assumption reach a conclusion without
being labelled as one.

## Questions

| Open ID | Question | Why it matters | Blocking | Assumption in use | Answer | Answered on | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| OPEN-001 | Does "post G stage install readback" mean software PTE reconciliation, HGATP selector readback, or both? | The two mechanisms observe different objects and address different fault classes. | No | Analyze both and keep their conclusions separate; do not infer one mechanism's assurance from the other. | Not provided | Not applicable | Open |
| OPEN-002 | Is the intended primary threat accidental construction or write faults, or a malicious component inside the privileged TCB? | Same-path readback has materially different value under those threat models. | No | Use the confirmed broad boundary and state a separate result for accidental faults and malicious trusted components. | Not provided | Not applicable | Open |
| OPEN-003 | Will any future design copy, serialize, program, or otherwise transform the R2-walked roots before hardware uses them? | A distinct transfer boundary could justify another readback; current final-buffer construction makes a duplicate same-memory check lower value. | No | Current evidence is authoritative: R2 builds and walks the final physical pools and no later PTE edit occurs. | Not provided | Not applicable | Open |
| OPEN-004 | What hardware mechanism prevents M-mode firmware, debug/system-bus access, DMA masters, or physical faults from changing or presenting another view of table memory? | Without this, one CPU-path sample cannot establish later or alternate-path state. | No | No such mechanism is credited because R8 characterization is incomplete and K3 hardware is `NOT RUN`; resulting claims remain CPU-path and point-in-time only. | Not provided | Not applicable | Open |
| OPEN-005 | Is a quantified transient-hardware-fault or functional-safety diagnostic claim intended? | Register readback may be valuable for stuck-bit, bus, or transient faults even when it is weak against a malicious peer-privilege actor. | No | Make no quantified fault-coverage claim because the relevant normative standard was not accessible and no hardware fault injection was run. | Not provided | Not applicable | Open |
| OPEN-006 | Under the eventual exact K3 deployment profile, which listed adversaries and mutation paths are reachable, mitigated, or only theoretical, and how should they be ranked? | The current broad analysis includes firmware, DMA/IOMMU, debug, replay, physical faults, and split-view hypotheses without an accepted K3 platform profile that establishes applicability or likelihood. | No | Preserve every threat as a bounded concern or hypothesis and do not rank it as deployment-relevant until retained K3 characterization identifies the actual writers, devices, trust domains, and protections. | Not provided | Not applicable | Open |

`Blocking` is `Yes` or `No`. `Status` is `Open`, `Answered`, `Superseded`, or
`Withdrawn`.

## Superseded records

An answer that changes an earlier one appends a superseding row rather than
overwriting it.

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Inquiry scaffolder | Created the open-questions record. | The record was initialized for Q-001. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Recorded five non-blocking questions and the assumptions used. | None prevents a bounded answer; each is surfaced in the report and summary. |
| ACTIVITY-003 | 2026-08-29 | Analysis agent | Appended OPEN-006 for K3 adversary applicability and ranking. | The question is non-blocking because the current report keeps platform-dependent threats bounded and unranked. |
