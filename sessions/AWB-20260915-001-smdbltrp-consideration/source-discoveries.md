# Smdbltrp consideration across Beryllium and Helium - Source discoveries

Session ID: `AWB-20260915-001`
Distribution: `private`
Created: `2026-09-15`
Status: `Complete`

Sources found during this session that are not recorded in an owning Beryllium
research component. Each record is mirrored into `SOURCE-DISCOVERY-LOG.md` and
appended to `outbox/pm-queue.md` with status `new`.

Check the source-discovery reference set in `RESEARCH-SOURCES.md` before
recording. A source that could not be checked against a reachable index is
`unconfirmed`, not `new`.

This repository never writes into another component to register a source.

## Discoveries

| Discovery ID | Title | Authors | Venue and date | Stable URL or DOI | Access result | Relevance to Beryllium | Likely owning component | Indexes checked | Status | Sensitivity | Redistribution | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| DISC-027 | Double Trap Extensions, Version 1.0 | Ved Shanbhogue and RISC-V International contributors | Ratified RISC-V ISA extension, v1.0; published 2024-08-23 | https://github.com/riscv/riscv-double-trap/tree/2b3ae4a1ad72874ad5b143043a3ec44d6fd11ea8 | Tagged source, release metadata, and official rendered documentation read | Normatively distinguishes M-mode Smdbltrp from lower-privilege Ssdbltrp and defines the mechanism relevant to Beryllium and Helium trap handling | xrv-research-repo | All required reference-set indexes; permitted osr-claude manifests checked without entering excluded restricted material | new | public | approved | 2026-09-15 |
| DISC-028 | QEMU support series for Smdbltrp and Ssdbltrp | Clément Léger | QEMU RISC-V mailing list patch series v2, 2024-09-25 | https://lists.nongnu.org/archive/html/qemu-riscv/2024-09/msg00546.html | Full cover letter and test transcript read; current QEMU configuration fields corroborated | Provides implementation and HS/VS test precedent for both ratified extensions without establishing support on a Beryllium target | xrv-research-repo | Same complete reference-set check as DISC-027 | new | public | unknown | 2026-09-15 |
| DISC-029 | OpenSBI Ssdbltrp support | Clément Léger; OpenSBI maintainers | Upstream OpenSBI commits, merged 2024-10-25 and later maintained | https://github.com/riscv-software-src/opensbi/commit/9c7859326909c8025bf23909f1952ee963a1cdd4 | Commit metadata, current source, and follow-on history read | Shows the firmware-side handling boundary for S/HS/VS double traps and the dependency on advertised hardware extension support | xrv-research-repo | Same complete reference-set check as DISC-027 | new | public | approved | 2026-09-15 |
| DISC-030 | Correction to OpenSBI Ssdbltrp support discovery | Clément Léger; OpenSBI maintainers | Upstream OpenSBI commit and related preserved mailing-list series, 2024 | https://github.com/riscv-software-src/opensbi/commit/9c7859326909c8025bf23909f1952ee963a1cdd4 | Exact commit and current source read; related OpenSBI double-trap list archives are already manifest-indexed locally | Supersedes DISC-029's complete-newness claim; the exact commit locator may still be useful, but related implementation discussion is already preserved | xrv-research-repo | All required indexes checked; an existing collection manifest indexes related OpenSBI monthly archives, so exact-source newness needs owner review | unconfirmed | public | approved | 2026-09-15 |

`Status` is `new` or `unconfirmed`. Only this agent writes these two values,
and only the Project Manager advances an entry beyond them in the outbox.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-15 | Session scaffolder | Created the discovery record. | No discovery has been recorded. |
| ACTIVITY-002 | 2026-09-15 | Analysis orchestrator | Recorded DISC-027 through DISC-029 after the initial required reference-set check. | The later correction DISC-030 supersedes DISC-029's complete-newness claim; no owning component was modified. |
| ACTIVITY-003 | 2026-09-15 | Analysis orchestrator | Appended DISC-030 after independent review found related OpenSBI archives in an existing collection manifest. | Exact-commit newness is `unconfirmed`; DISC-027 and DISC-028 remain `new`. |
