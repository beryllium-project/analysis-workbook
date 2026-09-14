# What Is the CHERI-Native Authority Model? - Search log

Session ID: `AWB-20260914-002`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`

Every local and external query, including the ones that found nothing. A
checked location that did not contain the expected fact is a result.

Public queries must never contain private code, private repository names,
internal URLs, credentials, non-public identifiers, or user-supplied private
text.

## Local queries

Worked in the order given by `RESEARCH-SOURCES.md`.

| Query ID | Date | Tier | Component or path | Terms or method | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| LOCAL-001 | 2026-09-14 | 3-7 | XRV, formal-verification research, prior analysis session | authority, capability, sealing, revocation, nucleus, object capability | Established the local architectural proposal, comparison set, and assurance boundaries. | AWB-20260914-002-E0003 through AWB-20260914-002-E0005 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 3 | Formal-verification research | Yes | Capability-proof boundaries | No selected target proof |
| 5 | CHERI notes | Yes | CHERI architecture context | Dirty worktree limited use to committed indexes |
| 6 | XRV research | Yes | Hypervisor security analysis and source catalog | No evaluated complete CHERI hypervisor |
| 7 | OS-security research | Yes | Capability terminology and policy context | Restricted subtree excluded |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Exact CHERI mechanisms are insufficient to define object lifetime and global revocation. | Official CHERI revocation documentation | Closed |
| GAP-002 | Current RISC-V CHERI hypervisor integration boundary requires a pinned primary source. | Official specification source | Closed |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-09-14 | Web and GitHub | Official CHERI ISA, RISC-V CHERI H integration, CHERI revocation | 6 relevant primary records | Confirmed capability mechanisms, the H chapter's bounded feature additions and G-stage omission, and software revocation requirements. | AWB-20260914-002-E0001, AWB-20260914-002-E0002, AWB-20260914-002-E0006 |
| EXT-002 | 2026-09-14 | Claude Fable 5.1 primary-source review | Zyseal, Zylevels1, ASR, YBLD | 4 direct specification sections | Added explicit sealing authority, local/global flow, privileged-instruction authority, and superset-based tag rebuild constraints. | AWB-20260914-002-E0031, AWB-20260914-002-E0032, AWB-20260914-002-E0044, AWB-20260914-002-E0045 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| Capability | CHERI tagged memory reference | Kernel-object authority token in NOVA, seL4, or L4Re | Every claim names the mechanism; shared delegation vocabulary is not treated as identical enforcement. |
| Revocation | Removal or invalidation of usable derived authority | Sealing or deletion of a named object | Sealing controls interpretation; generation validation and hardware teardown provide the proposed object-lifecycle rule. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the search log. | No query has been run. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed local-first and primary-source authority searches. | Six evidence records support the answer. |
