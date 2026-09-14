# CHERI-Native Hypervisor Security Model - Planning

Session ID: `AWB-20260914-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Record of the planning phase that preceded analysis. This is the durable
record of what the user asked for and what was agreed, in the user's terms.

## Aspect statement

Define a CHERI-native security model for a decomposed hypervisor, including
the correspondence between software capability authority and hardware VM
resources, adversarial lifecycle traces, an assurance strategy, and a possible
future CHERI counterpart to the Helium fixed-TE PoC for direct comparison.

## Initial questions

| Question ID | Question as stated by the user | Opened as |
| --- | --- | --- |
| Q-001 | What authority model should make CHERI the core software security mechanism of a decomposed hypervisor? | Q-001 |
| Q-002 | How must capability authority correspond to G-stage, IOMMU, interrupt, vCPU, device, and lifecycle state? | Q-002 |
| Q-003 | Which adversarial lifecycle traces and tests would falsify the model? | Q-003 |
| Q-004 | How should the model be formalized and assured without inflating proof scope? | Q-004 |
| Q-005 | What would a CHERI equivalent to Helium require for functional, security, evidence, and formal-verification parity? | Q-005 |

## Clarifications agreed during planning

| Clarification ID | Question asked | Answer recorded | Effect on scope |
| --- | --- | --- | --- |
| CLARIFICATION-001 | Should research or security review be delegated? | Use Claude Fable 5.1 for primary research and iterative review, and GPT-5.3 Codex for deep security-model analysis. | Adds two independent read-only review inputs while the parent retains synthesis responsibility. |
| CLARIFICATION-002 | What does “He” mean for the parity proposal? | Interpreted as the Helium fixed Type Enforcement PoC. | Adds a mechanism-neutral parity inquiry without authorizing implementation. |
| CLARIFICATION-003 | Is a CHERI implementation selected? | No. | Research produces a model and comparator contract only. |

## Exclusions

Implementation, target selection, baseline approval, performance claims,
hardware validation, architecture approval, publication, release, and any
claim that Helium or the proposed CHERI counterpart is formally verified.

## Approved component commands

None. Command approval is per session, by exact command name, and is never
approval to write to a component.

| Command | Component | Approved on | Recorded result |
| --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable |

## Confirmed effective scope

The scope block presented to the user before analysis began, reproduced here
verbatim once confirmed.

- aspect: CHERI-native authority, hardware-resource correspondence, lifecycle
  falsification, layered assurance, and a possible Helium parity comparator;
- depth: deep, with local-first evidence and current public primary sources;
- external research: permitted for public primary sources;
- delegation: Claude Fable 5.1 research and review; GPT-5.3 Codex security
  analysis;
- outputs: two core research models, one parity research plan, five complete
  inquiries, evidence ledgers, limitations, and a restartable handoff;
- implementation boundary: no target, baseline, PoC, architecture, or build is
  selected or authorized;
- distribution: private;
- sibling components: read-only.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created the planning record. | Initial empty planning scaffold. |
| ACTIVITY-002 | 2026-09-14 | User and analysis orchestrator | Confirmed autonomous research, named reviewer models, and added the Helium parity option. | Scope expanded to five inquiries while implementation remains excluded. |
