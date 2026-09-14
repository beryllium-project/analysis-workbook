# CHERI-Native Hypervisor Security Model - Handoff

Session ID: `AWB-20260914-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

## Overall position

The session defines a proposed CHERI-native decomposed-hypervisor security
model, a capability-to-hardware correspondence model, a ranked lifecycle
falsification programme, a layered assurance strategy, and a possible
Helium-to-CHERI parity experiment. No target, implementation, baseline, or
formal-verification claim is approved.

## Frozen scope

Deep research into CHERI authority, hardware-resource correspondence,
lifecycle and recovery failures, assurance boundaries, and a bounded
functional/security/FV comparator with Helium. Public primary research and
read-only local evidence were permitted; implementation and approval gates
were excluded.

## Completed inquiries

| Inquiry ID | Question | Confidence | Report | Summary |
| --- | --- | --- | --- | --- |
| Q-001 | What is the CHERI-native authority model? | High | `inquiries/Q-001/report.md` | `inquiries/Q-001/summary.md` |
| Q-002 | How must authority correspond to hardware resources? | High | `inquiries/Q-002/report.md` | `inquiries/Q-002/summary.md` |
| Q-003 | Which lifecycle traces falsify the model? | High | `inquiries/Q-003/report.md` | `inquiries/Q-003/summary.md` |
| Q-004 | How should the model be assured? | High | `inquiries/Q-004/report.md` | `inquiries/Q-004/summary.md` |
| Q-005 | What would a CHERI equivalent to Helium require? | High | `inquiries/Q-005/report.md` | `inquiries/Q-005/summary.md` |

## Outstanding open questions

| Open ID | Question | Blocking | Assumption in use |
| --- | --- | --- | --- |
| OPEN-001 | Must any authority be unique or linear rather than copyable? | No | No uniqueness claim is made without an additional protocol. |
| OPEN-002 | Which target defines exact invalidation, interrupt, and reset ordering? | No | The correspondence model remains abstract and target-neutral. |
| OPEN-003 | Which failures must preserve availability as well as isolation? | No | Fail-closed isolation is prioritized. |
| OPEN-004 | Which formal tool and language define the nucleus refinement boundary? | No | Assurance obligations are assigned by layer. |
| OPEN-005 | Which exact Helium commit is the comparator baseline? | No | Existing frozen candidate is not treated as approved. |
| OPEN-006 | Which CHERI platform can reproduce the Helium scenario? | No | No implementation target is selected. |

## Validation

The package passes complete-session validation with five inquiries and 47
evidence records. Claude Fable 5.1 completed an initial primary-source pass,
a substantive second-pass critique, and a final correction verification.
GPT-5.3 Codex independently stress-tested the model and lifecycle traces.

```sh
bash ./scripts/validate-session.sh sessions/AWB-20260914-002-cheri-hypervisor-security-model
```

## Exact next action

Have the XRV owner review the three model documents for potential incorporation
as explicitly proposed architecture, then separately decide whether to open a
Helium-to-CHERI comparator planning gate:

```sh
git show --stat --oneline HEAD
```

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created the session handoff. | Initial empty handoff scaffold. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded the completed research position and six open implementation/formalization questions. | Final independent review and validation remained. |
| ACTIVITY-003 | 2026-09-14 | Analysis orchestrator | Incorporated Fable and Codex findings and completed package validation. | Five inquiries and 47 evidence records pass complete-session validation; no high- or medium-confidence review issue remains. |
