# Was a Pure CHERI Hypervisor Discussed or Considered? - Evidence

Session ID: `AWB-20260913-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-13`
Status: `Complete`

Observations only. What a source says belongs here; what follows from it
belongs in `report.md`.

Evidence IDs are `AWB-20260913-001-E####`, unique within the session and never
reused or renumbered. This ledger is append-only; a correction adds a
superseding row and cites the row it supersedes.

## Ledger

| Evidence ID | Class | Role | Logical locator | Revision or checked date | Observation | Sensitivity | Redistribution | Limitation |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AWB-20260913-001-E0001 | Local research | Direct | `component://xrv-research-repo/cheri-hypervisor-research-survey.md` | `6a29638`, committed 2026-07-21; document edition 2026-07-20 | The initial survey proposed a small pure-capability EL2/HS enforcement nucleus with CHERI service compartments. Its recommended sequence called for selecting a small RISC-V H-extension hypervisor for a pure-capability port, then converting the core to pure-capability as a measurable baseline. | private | not-approved | This is a research recommendation, explicitly not a selected or implemented Beryllium architecture. |
| AWB-20260913-001-E0002 | Local research | Corroborating | `component://xrv-research-repo/cheri-hypervisor-research-survey.md` | `ca414903b93cab82697a30ec2a57ed62c357d380`, checked 2026-09-13 | The current survey retains the pure-capability port and core-conversion sequence, labels the architecture as proposed, and says no reviewed artifact demonstrates the complete target architecture. | private | not-approved | The survey includes external-source characterizations that were not independently rechecked in this local-only inquiry. |
| AWB-20260913-001-E0003 | Local implementation | Counter | `component://beryllium-repo/planning/cheri-alignment.md` | `65f6d895a2007e8e093582cc48726375fd23b563`, checked 2026-09-13 | Beryllium records CHERI as strategic alignment and future work, keeps interfaces extensible for purecap contexts, and identifies future CHERI targets, while stating that the selected single-hart runtime uses non-CHERI VS domains and does not authorize CHERI work. | private | not-approved | This establishes the current documented boundary, not whether later uncommitted discussion exists. |
| AWB-20260913-001-E0004 | Local implementation | Counter | `component://beryllium-repo/planning/architecture-model-0.2.md` | `65f6d895a2007e8e093582cc48726375fd23b563`, checked 2026-09-13 | The selected architecture model explicitly excludes CHERI implementation, and the following bounded runtime uses two role-neutral synthetic VS domains without selecting capabilities or a policy framework. | private | not-approved | Model 0.2 is a bounded non-runtime architecture phase and does not settle all future architecture. |
| AWB-20260913-001-E0005 | Local implementation | Corroborating | `component://beryllium-repo/planning/implementation-plan.md` | `65f6d895a2007e8e093582cc48726375fd23b563`, checked 2026-09-13 | The implementation plan keeps stage-2, IOMMU, vCPU context, ABI, and attestation designs extensible to tagged wider purecap contexts and frames CHERI Clang purecap/hybrid work as future experiments. | private | not-approved | Compatibility planning is weaker than a plan to produce a distinct pure-CHERI hypervisor version. |
| AWB-20260913-001-E0006 | Local coordination | Contextual | `workspace://COMPONENTS.md`; `component://project-manager/components/xrv-research-repo.md`; `component://project-manager/components/beryllium-repo.md` | Parent `c1a192f141198f0736948f52a4efbfb278a3d753`; Project Manager `b2bbbf14a94a471060cd580eeb1de5a7e917a7d8`; checked 2026-09-13 | Coordination records distinguish `xrv-research-repo` as the private CHERI-first hypervisor survey and `beryllium-repo` as the canonical implementation, supporting the distinction between researched options and selected implementation work. | private | not-approved | Coordination records summarize component roles; component-owned documents remain authoritative. |
| AWB-20260913-001-E0007 | Local coordination | Negative | `workspace://`; `component://project-manager/`; `component://helium-te-poc/`; `component://cheri-riscv-notes-repo/`; `component://osr-claude/`; `component://provenance-review/`; `component://threat-modeler/`; `component://security-reviewer/`; `component://analysis-workbook/` | Revisions recorded in `session.md`; checked 2026-09-13 | A focused sweep of committed tree names, relevant handoffs, and commit subjects found no separate project decision, authorization, implementation milestone, or adoption record for a pure-CHERI Beryllium hypervisor in these repositories. | private | not-approved | This was a focused terminology and history sweep, not exhaustive line-by-line review of every file. |
| AWB-20260913-001-E0008 | Local coordination | Negative | `component://formal-verification-research/` | Checked 2026-09-13; last coordination record `e5740de` | The registered formal-verification research checkout was absent, so its current tree and history could not be examined. | private | not-applicable | The missing repository is an evidence gap; no inference is made about its contents. |

`Class` is one of `Local implementation`, `Local assurance`,
`Local coordination`, `Local research`, `Local provenance`, `External primary`,
`External secondary`, or `User-supplied`.

`Role` is one of `Direct`, `Corroborating`, `Contextual`, `Counter`, or
`Negative`.

`Sensitivity` is one of `public`, `internal`, `private`, or `restricted`.

`Redistribution` is one of `approved`, `not-approved`, `unknown`, or
`not-applicable`.

## Superseded records

| Superseding ID | Supersedes | Reason | Date |
| --- | --- | --- | --- |
| None | Not applicable | No record has been superseded. | Not applicable |
| AWB-20260913-001-E0009 | AWB-20260913-001-E0008 | The repository became available later on 2026-09-13 and was reviewed in Q-002 at the same recorded revision. | 2026-09-13 |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-13 | Inquiry scaffolder | Created the evidence ledger. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-13 | Analysis orchestrator | Recorded the revision-bound local evidence and negative results. | Eight evidence records added; no external sources used. |
| ACTIVITY-003 | 2026-09-13 | Analysis orchestrator | Linked the superseding availability evidence from Q-002. | E0008 remains as the historical access result; E0009 records the restored repository. |
