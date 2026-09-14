# CHERI-Native Hypervisor Security Model - Source discoveries

Session ID: `AWB-20260914-002`
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
| DISC-022 | Rigorous engineering for hardware security: Formal modelling and proof in the CHERI design and implementation process | Kyndylan Nienhuis et al. | IEEE Symposium on Security and Privacy, 2020 | https://doi.org/10.1109/SP40000.2020.00055 | Author PDF and metadata read | CHERI reachable-capability monotonicity and compartment-isolation proof boundary | formal-verification-research | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |
| DISC-023 | seL4 Enforces Integrity | Thomas Sewell et al. | Interactive Theorem Proving, 2011 | https://doi.org/10.1007/978-3-642-22863-6_24 | Author PDF and metadata read | Capability-policy integrity proof shape for authority confinement | formal-verification-research | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |
| DISC-024 | seL4: From General Purpose to a Proof of Information Flow Enforcement | Toby Murray et al. | IEEE Symposium on Security and Privacy, 2013 | https://doi.org/10.1109/SP.2013.35 | Author PDF and metadata read | Noninterference under static partitioning for the hybrid MAC/capability research gap | formal-verification-research | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |
| DISC-025 | A Secure and Formally Verified Linux KVM Hypervisor | Shih-Wei Li et al. | IEEE Symposium on Security and Privacy, 2021 | https://doi.org/10.1109/SP40001.2021.00049 | Metadata and abstract read; full paper not read | Verified small-core plus untrusted-host-services comparison for decomposed hypervisors | formal-verification-research | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |
| DISC-026 | Design and Verification of the Arm Confidential Compute Architecture | Xupeng Li et al. | USENIX OSDI, 2022 | https://www.usenix.org/conference/osdi22/presentation/li | Official landing page and abstract read | G-stage ownership and verified monitor comparison for capability-resource correspondence | formal-verification-research | All reachable indexes in `RESEARCH-SOURCES.md` | new | public | unknown | 2026-09-14 |

`Status` is `new` or `unconfirmed`. Only this agent writes these two values,
and only the Project Manager advances an entry beyond them in the outbox.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Session scaffolder | Created the discovery record. | No discovery has been recorded. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Checked all used sources against reachable XRV, formal-verification, and prior-session indexes. | Initial parent pass found no new pointer. |
| ACTIVITY-003 | 2026-09-14 | Claude Fable 5.1 research reviewer | Identified five formal-verification sources absent from reachable owning indexes. | DISC-022 through DISC-026 require Project Manager coordination; no owning component was modified. |
| ACTIVITY-004 | 2026-09-14 | Analysis orchestrator | Corrected DISC-022 and DISC-026 author ordering after independent metadata review. | Queue IDs and source locators are unchanged. |
