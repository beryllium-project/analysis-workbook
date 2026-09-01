# Post-G-stage install readback use case and threat analysis - Inaccessible resources

Session ID: `AWB-20260829-001`
Distribution: `private`
Created: `2026-08-29`
Status: `Complete`

Resources that could not be read. Record the block; never bypass a control and
never imply the contents of a resource that was not read.

## Blocked resources

| Blocked ID | Resource | Logical locator or URL | Access result | Alternatives tried | Priority | What a user-supplied copy would confirm | Checked date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| BLOCKED-001 | IEC 61508-2:2010 normative readback-diagnostic text | https://webstore.iec.ch/en/publication/5515 | paywalled | Public metadata, standards references, and free vendor-safety guidance were checked; no readable normative substitute was verified. | High | Whether the standard actually classifies write/readback comparison as a diagnostic, the covered hardware fault model, required independence, and claimed diagnostic coverage. | 2026-08-29 |
| BLOCKED-002 | AMD SEV-SNP Firmware ABI Specification, document 56860 | https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56860.pdf | licence restricted | Official URL variants and the public AMDSEV repository were checked; local metadata confirms a no-duplication licence and records public whitepaper alternatives. | Medium | Exact RMP and PVALIDATE semantics, page-ownership guarantees, and their limits relative to PTE flag correctness. | 2026-08-29 |
| BLOCKED-003 | Full text of Copilot - a Coprocessor-based Kernel Runtime Integrity Monitor | https://www.usenix.org/legacy/event/sec04/tech/petroni.html | authentication required | Public event page and abstract were read; the separately accessible 2006 semantic-integrity paper was used for detailed state-comparison evidence. | Medium | Which kernel structures were monitored, exact PCI acquisition semantics, experiment conditions, detection latency, and lab-versus-production status. | 2026-08-29 |
| BLOCKED-004 | Arm Architecture Reference Manual DDI 0487 normative break-before-make and VTTBR text | https://developer.arm.com/documentation/ddi0487/ | authentication required | Public landing and pKVM implementation comments were checked; no Arm-specific conclusion depends on the unread text. | Low | Exact architectural update, TLBI, DSB, ISB, and VTTBR requirements for comparison with RISC-V. | 2026-08-29 |
| BLOCKED-005 | TCG TPM 2.0 Part 1 Architecture | https://trustedcomputinggroup.org/resource/tpm-library-specification/ | authentication required | Official route returned HTTP 403; RFC 9334 supplied the general freshness and trust-root architecture instead. | Low | PCR extend, quote, nonce, locality, platform-binding, and runtime-state limits for a hardware-backed alternative. | 2026-08-29 |
| BLOCKED-006 | Primary RATA or equivalent TOCTOU-resistant attestation paper | https://cs.uic.edu/~arahmati/docs/rata.pdf | unreachable | Author URL, USENIX, NDSS, and title or term variants were checked without a readable primary copy; RFC 9334 was used only for the general race principle. | Medium | The precise temporal evidence mechanism, hardware assumptions, attack model, and whether its conclusions transfer to local table checks. | 2026-08-29 |
| BLOCKED-007 | Technical advisory or patch details for CVE-2016-8443 | https://source.android.com/docs/security/bulletin/2017-01-01 | not found | Android bulletin metadata was read; NVD was blocked and Qualcomm detail was internal or unavailable. | Low | The actual incorrect-mapping defect and whether any construction-time readback could have detected it. | 2026-08-29 |
| BLOCKED-008 | Full text of OSLO: Improving the Security of Trusted Computing | https://www.usenix.org/legacy/event/sec07/tech/kauer.html | authentication required | Public abstract was read; RFC 9334 and NIST SP 800-193 supplied stronger accessible architecture context. | Low | Exact static-root attacks, platform-binding mechanism, and limits of the proposed dynamic root. | 2026-08-29 |
| BLOCKED-009 | Full text of SWATT: SoftWare-based ATTestation for Embedded Devices | https://doi.org/10.1109/SECPRI.2004.1301329 | paywalled | DOI metadata and public citation trails were checked; no substantive claim relies on unread content. | Low | The traversal, timing, adversary, and post-attestation modification model for comparison with one-time readback. | 2026-08-29 |

`Access result` is one of `paywalled`, `authentication required`,
`robots disallowed`, `licence restricted`, `not found`, `withdrawn`,
`unreachable`, or `out of scope`.

`Priority` is `High`, `Medium`, or `Low`, judged by how much the missing
resource would change the answer.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Session scaffolder | Created the inaccessible-resource record. | The record was initialized for the session. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Recorded nine inaccessible primary resources and the alternatives checked. | No control was bypassed and no unread content is implied. |
