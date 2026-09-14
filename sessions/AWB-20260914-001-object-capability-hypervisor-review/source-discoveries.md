# Object-Capability Hypervisor Review - Source discoveries

Session ID: `AWB-20260914-001`
Distribution: `private`
Created: `2026-09-14`
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
| DISC-017 | NOVA: A Microhypervisor-Based Secure Virtualization Architecture | Udo Steinberg; Bernhard Kauer | EuroSys 2010 | https://doi.org/10.1145/1755913.1755935 | Author copy and metadata read | Foundational decomposed capability-based hypervisor missing from current XRV index | xrv-research-repo | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |
| DISC-018 | NOVA Microhypervisor source and current project | Udo Steinberg; BlueRock Security contributors | Living open-source project, checked 2026-09-14 | https://github.com/udosteinberg/NOVA | Repository and official project site read | Current capability-based microhypervisor, deployments, build surface, and verification work | xrv-research-repo | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |
| DISC-019 | Hedron Hypervisor | Cyberus Technology contributors | Living open-source project, checked 2026-09-14 | https://github.com/cyberus-technology/hedron | Repository documentation read | NOVA-derived capability-based hypervisor and commercial-platform evidence | xrv-research-repo | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |
| DISC-020 | L4Re Operating System Framework and uvmm | L4Re project; Kernkonzept | Living project documentation, checked 2026-09-14 | https://l4re.org/ | Project, capability, and uvmm documentation read | Current object-capability hypervisor/VMM framework absent from XRV | xrv-research-repo | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | approved | 2026-09-14 |
| DISC-021 | Specifying and Verifying the NOVA Microhypervisor in Concurrent Separation Logic | Hoang-Hai Dang; Gregory Malecha | RocqPL at POPL 2026 | https://popl26.sigplan.org/details/rocqpl-2026-papers/12/ | Programme abstract read | Current modular verification status for a qualifying object-capability hypervisor | formal-verification-research | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |

`Status` is `new` or `unconfirmed`. Only this agent writes these two values,
and only the Project Manager advances an entry beyond them in the outbox.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created the discovery record. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Recorded five sources absent from all reachable owning indexes. | DISC-017 through DISC-021 queued for Project Manager coordination. |
