# Establish the post-G-stage install readback use case - Search log

Session ID: `AWB-20260829-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-08-29`
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
| LOCAL-001 | 2026-08-29 | Inventory | `workspace://RESEARCH-SOURCES.md`; registered components | `scripts/readonly-inspect.sh components`; authoritative registry and topology inspection | Seven registered components were present and clean at the revisions frozen in `session.md`; eight local tiers were identified. | AWB-20260829-001-E0001 |
| LOCAL-002 | 2026-08-29 | 1 | `component://provenance-review/reviews/` | Completed-package indexes; `G-stage`, `readback`, policy/PTE consistency, mapping divergence, fail-stop, pKVM, Xen, seL4, Bao, Petroni | Found one completed relevant package, the exact Helium reconciliation sequence, semantic-monitor precedent, mapping-divergence analogues, and bounded negative prior-art searches. | AWB-20260829-001-E0002, AWB-20260829-001-E0013 |
| LOCAL-003 | 2026-08-29 | 2 | `component://beryllium-repo/` | Current instructions/handoff, planning and evidence indexes; `post-G`, `G-stage`, `readback`, `re-walk`, `HGATP`, PTE, install, fence, immutable, publication, DMA, debug, secure boot, attestation | Found R2 full-tree construction/re-walk, R3/R5 selector write-fence-readback-publication, behavioral probes, bounded machine-checks, and R8 hardware-boundary requirements. | AWB-20260829-001-E0006, AWB-20260829-001-E0007, AWB-20260829-001-E0008, AWB-20260829-001-E0009, AWB-20260829-001-E0010, AWB-20260829-001-E0011 |
| LOCAL-004 | 2026-08-29 | 3 | `component://helium-te-poc/` | Current instructions/handoff, architecture, policy model, security limits, verification and source symbols; `install readback`, policy/PTE divergence, `HGATP`, `HFENCE.GVMA`, stale translation, malicious toolchain, DMA, attestation | Found per-leaf software PTE reconciliation in fixed initialization and explicit common-path, static-lifecycle, no-DMA, no-hardware, and no-formal-proof limits. | AWB-20260829-001-E0003, AWB-20260829-001-E0004, AWB-20260829-001-E0005 |
| LOCAL-005 | 2026-08-29 | 4 | `workspace://formal-verification/`; `workspace://HANDOFF.md`; `workspace://COMPONENTS.md`; `workspace://SOT.md` | Parent status/topology and assurance-transfer records; readback threat model, lifecycle term, incident register | Found component roles, current status boundaries, and later Helium machine-check limits; no separate readback threat model or lifecycle phase named Stage G. | AWB-20260829-001-E0001, AWB-20260829-001-E0034 |
| LOCAL-006 | 2026-08-29 | 5 | `component://formal-verification-research/` | Instructions/handoff, bibliography, Beryllium strategy, codebase assessment, seL4, Nitro, CHERIoT; independent specification, correspondence, trusted path, compiler, secure boot, attestation | Found layered assurance alternatives and policy-to-installed-mapping correspondence as a natural verification target; no Beryllium-specific readback attack study. | AWB-20260829-001-E0012 |
| LOCAL-007 | 2026-08-29 | 6 | `component://cheri-riscv-notes-repo/` | Instructions/handoff, authoritative wiki, bibliography; capability integrity, immutable authority, differential testing, DMA, replay, attestation, confused deputy | Found hardware-on-use and formal/differential assurance alternatives plus separate DMA, side-channel, revocation, and runtime-assignment gaps; no direct G-stage install-readback precedent. | AWB-20260829-001-E0015 |
| LOCAL-008 | 2026-08-29 | 7 | `component://xrv-research-repo/` | Instructions/handoff, review log, hypervisor and confidential-computing streams; stage-2 consistency, ownership lifecycle, measurement, attestation, rollback, DMA/IOMMU, device reset, transactional update | Found lifecycle and hardware-backed alternatives, explicit policy-to-PTE correspondence gaps, and separate device/attestation boundaries; no direct readback incident study. | AWB-20260829-001-E0015 |
| LOCAL-009 | 2026-08-29 | 8 | `component://osr-claude/` | Instructions/handoff, source README/WANTED, nonrestricted manifests, Supervisor Domains survey; invalidation, stale translation, DMA, replay, debug, physical enforcement, policy/hardware consistency | Found stale CPU/I/O translation and lifecycle risks plus retained source metadata; no direct Beryllium, flash-programmer, or FPGA defensive-readback evidence. | AWB-20260829-001-E0014, AWB-20260829-001-E0015 |

## Tier coverage

| Tier | Component | Checked | Found | Missing |
| --- | --- | --- | --- | --- |
| 1 | provenance-review | Complete at `d698e7598e44928e4a64d7ebc3de7655cfbefb29` | Exact Helium sequence; 2006 semantic monitor; mapping-consistency analogues | Exact independent PTE readback/fail-stop precedent; flash/FPGA evidence |
| 2 | beryllium-repo | Complete at `65f6d895a2007e8e093582cc48726375fd23b563` | R2 tree walk; R3/R5 selector readback; immutability; behavioral probes; R8 requirements | Hardware execution; independent acquisition; named Stage G lifecycle phase |
| 3 | helium-te-poc | Complete at `1ab289c066b69acdd8b55c9f77055b0145be1316` | Per-leaf policy/PTE check and explicit limits | Independent hardware view; dynamic lifecycle; devices/DMA; hardware validation |
| 4 | Parent coordination | Complete, checked 2026-08-29 | Roles, assurance transfer, current boundary warnings | Separate readback threat model or incident register |
| 5 | formal-verification-research | Complete at `8b91ebda1d4a5c733596a67ef7c5cc83486212e9` | Correspondence theorem target and assurance alternatives | Readback-specific empirical or physical study |
| 6 | cheri-riscv-notes-repo | Complete at `655309289ee715cbe40690d41b222e3cba05e6b5` | Hardware-enforced authority and formal/differential testing alternatives | G-stage install readback or programmer verification |
| 7 | xrv-research-repo | Complete at `ca414903b93cab82697a30ec2a57ed62c357d380` | Translation/device lifecycle and attestation boundaries | Deployed complete stage-2/device/attestation assurance; readback incident study |
| 8 | osr-claude | Complete at `f2edd17c6ed70f09a9b3db98eec27e54e185612a` | Invalidation and lifecycle risks; source archive metadata | Direct defensive-readback, bus-interposer, or Beryllium physical example |

## Gaps carried to external research

| Gap ID | Gap | Kind of source that would close it | Status |
| --- | --- | --- | --- |
| GAP-001 | Can table or HGATP bytes be correct while active translation state is stale or different? | Normative ISA text plus a primary incident/advisory | Addressed by RISC-V specification and qualified Xen advisories |
| GAP-002 | What adversary can same-path readback resist when installer, checker, compiler, memory path, and expected value share trust? | Explicit threat model or independently acquired monitoring study | Partially addressed; independent monitor precedent found, no direct G-stage attacker model |
| GAP-003 | Can split-view, stale-read, physical-interposer, or fault attacks deceive readback? | Reproducible hardware experiment or vendor advisory | Partially addressed for CPU/IOMMU visibility and Rowhammer; physical interposer spoofing remains unclosed |
| GAP-004 | What assurance do flash/programmer/FPGA defensive readback mechanisms provide? | Primary specifications and security evaluations | Unresolved; Starbleed was checked and rejected as a defensive-readback bypass example |
| GAP-005 | Can hardware independently attest effective translation state? | Ratified specification and evaluated implementation | Partially addressed conceptually; authoritative SEV-SNP details remained inaccessible |
| GAP-006 | Which freshness/atomicity protocol is needed between construction, check, activation, and later mutation? | Primary lifecycle or attestation architecture | Addressed at principle level by RFC 9334 and DMA/TLB incidents; no G-stage-specific protocol found |
| GAP-007 | How should secure boot, measurement, attestation, rollback, debug, and device state be bound? | Complete attestation profile | Partially addressed by RFC 9334 and NIST firmware guidance; local implementation remains absent |
| GAP-008 | What production failures have independent semantic monitors detected? | Deployment study or incident dataset | Partially addressed by Petroni experimental reports; production incidence remains unclear |
| GAP-009 | How do DMA, IOMMU, reset, in-flight traffic, debug, and remanence affect the claim? | End-to-end platform security specification and evaluated lifecycle | Partially addressed by Xen and Thunderclap; no Beryllium hardware observation exists |
| GAP-010 | What exact mechanisms and state are available on the intended hardware platform? | Authoritative manuals and retained approved hardware observations | Open; K3 hardware is `NOT RUN` |

## External queries

| Query ID | Date | Tool | Terms | Result count | Conclusion | Evidence IDs |
| --- | --- | --- | --- | --- | --- | --- |
| EXT-001 | 2026-08-29 | analysis-research specialist | Public-safe ten-gap research brief | 0 | Specialist had no retrieval capability and ran no query; fallback public-primary research was required. | AWB-20260829-001-E0033 |
| EXT-002 | 2026-08-29 | GitHub API | `riscv/riscv-isa-manual hypervisor.adoc hgatp WARL VMID readback HFENCE.GVMA` | Full source | Located and later audited exact normative text and a stable release commit. | AWB-20260829-001-E0016 |
| EXT-003 | 2026-08-29 | GitHub API | `riscv/riscv-isa-manual supervisor.adoc satp SFENCE.VMA translation cache invalidation` | Full source | Corroborated that root-register writes do not by themselves order table updates or invalidate caches. | AWB-20260829-001-E0016 |
| EXT-004 | 2026-08-29 | GitHub API | `torvalds/linux arch/riscv/kvm gstage mode detect hgatp readback` | Full source | Found boot-time supported-mode probes followed by HGATP clear and local flush. | AWB-20260829-001-E0017 |
| EXT-005 | 2026-08-29 | GitHub API | `torvalds/linux arch/riscv/kvm vmid detect hgatp readback` | Full source | Found boot-time VMID-width probe followed by HGATP clear and local flush. | AWB-20260829-001-E0017 |
| EXT-006 | 2026-08-29 | GitHub code search | `"stage2 verify" repo:torvalds/linux` | 0 | No matching security verification pattern in the bounded repository search. | AWB-20260829-001-E0031 |
| EXT-007 | 2026-08-29 | GitHub code search | `"hgatp verify"` | 0 | No matching result; not proof of global absence. | AWB-20260829-001-E0031 |
| EXT-008 | 2026-08-29 | GitHub code search | `"readback hgatp"` | 0 | No matching result; terminology may differ. | AWB-20260829-001-E0031 |
| EXT-009 | 2026-08-29 | GitHub API | `Linux pKVM stage-2 install VTTBR barrier TLBI readback` | Relevant source paths | Inspected activation/mapping paths using barriers and invalidation; no post-install table readback was found in those paths. | AWB-20260829-001-E0031 |
| EXT-010 | 2026-08-29 | Xen security archive | `XSA-286 stale TLB non-leaf page table` | 1 advisory | Verified x86 PV stale-translation incident and bounded affected scope. | AWB-20260829-001-E0018 |
| EXT-011 | 2026-08-29 | Xen security archive | `XSA-321 IOMMU non-coherent cache writeback shared page tables` | 1 advisory | Verified CPU/IOMMU visibility divergence in an affected VT-d configuration. | AWB-20260829-001-E0019 |
| EXT-012 | 2026-08-29 | Xen security archive | `XSA-302 in-flight DMA device deassignment` | 1 advisory | Verified an in-flight DMA lifecycle hazard after reassignment. | AWB-20260829-001-E0020 |
| EXT-013 | 2026-08-29 | Xen security archive | `XSA-148 writable superpage mapping validation bypass` | 1 advisory | Verified a wrong-permission construction/authorization defect; same-source readback would not detect it. | AWB-20260829-001-E0021 |
| EXT-014 | 2026-08-29 | Xen security archive | `XSA-304 page table change TLB invalidation machine check` | 1 advisory | Verified an Intel-specific transition erratum and corrected the earlier overclaim. | AWB-20260829-001-E0022 |
| EXT-015 | 2026-08-29 | RFC Editor | `RFC 9334 freshness race immutable root compromised verifier reference values` | 1 RFC | Verified freshness, root-of-trust, and verifier-compromise passages with corrected section numbers. | AWB-20260829-001-E0023 |
| EXT-016 | 2026-08-29 | USENIX | `Petroni Copilot coprocessor kernel runtime integrity monitor 2004` | 1 event page | Abstract accessible; full paper gated. Established independent monitoring and bounded reported detections only. | AWB-20260829-001-E0024 |
| EXT-017 | 2026-08-29 | USENIX and citation navigation | `Petroni semantic integrity violations kernel dynamic data SELinux AVC 2006` | 1 primary paper already recorded locally | Corroborated the local provenance package's stronger 2006 semantic-monitor precedent. | AWB-20260829-001-E0013 |
| EXT-018 | 2026-08-29 | Google Project Zero | `rowhammer page table entry privilege escalation` | 1 primary report | Verified induced PTE bit flips and privilege escalation; corrected the canonical URL. | AWB-20260829-001-E0025 |
| EXT-019 | 2026-08-29 | NDSS and project site | `Thunderclap IOMMU DMA untrustworthy peripheral memory structures` | 2 primary pages | Verified malicious-device DMA/IOMMU attack class; rejected the unsupported claim that stage-2 tables were specifically written. | AWB-20260829-001-E0026 |
| EXT-020 | 2026-08-29 | NIST | `NIST SP 800-193 Protect Detect Recover immutable root integrity` | 1 PDF | Full public PDF extracted; applicability bounded to platform firmware. | AWB-20260829-001-E0027 |
| EXT-021 | 2026-08-29 | USENIX | `Starbleed FPGA configuration readback defensive verify bypass` | 1 event page | The paper uses readback as a decryption oracle and does not support defensive-readback spoofing; analogy rejected. | AWB-20260829-001-E0028 |
| EXT-022 | 2026-08-29 | seL4 GitHub | `seL4 CAVEATS cache TLB boot code proof scope` | 1 file | Verified explicit proof exclusions without inferring activation helper behavior. | AWB-20260829-001-E0029 |
| EXT-023 | 2026-08-29 | Openwall oss-security | `CVE-2022-1158 KVM cmpxchg_gpte wrong PFN` | 1 disclosure | Verified wrong-target calculation and narrowed what intended-address readback could reveal. | AWB-20260829-001-E0030 |
| EXT-024 | 2026-08-29 | Android Security Bulletin | `CVE-2016-8443 hypervisor page table` | 1 metadata entry | Technical detail was unavailable; candidate excluded from conclusions. | None |
| EXT-025 | 2026-08-29 | AMD documentation and public GitHub mirror | `SEV-SNP ABI 56860 RMP PVALIDATE` | 0 readable specifications | Official routes were unreachable or licence-restricted; local metadata showed the source was already registered. | None |
| EXT-026 | 2026-08-29 | Arm documentation | `DDI 0487 break-before-make VTTBR TLBI DSB ISB` | 1 registration route | Full normative text was not retrieved; no ARM-specific claim depends on it. | None |
| EXT-027 | 2026-08-29 | Intel documentation | `Intel SDM page table modification TLB invalidation CR3` | 1 landing page | Document landing was accessible but the normative volume was not extracted; Xen advisories carry the bounded x86 examples. | None |
| EXT-028 | 2026-08-29 | USENIX, NDSS, author pages | `RATA TOCTOU-resistant remote attestation modification time` | 0 accessible primary papers | No readable primary paper was located; RFC 9334 supplies only the general freshness principle. | None |
| EXT-029 | 2026-08-29 | Standards and Arm documentation | `read-back control register diagnostic fault detection IEC 61508 ISO 26262` | 0 readable normative texts | Standards were paywalled and no free normative substitute was verified. | None |
| EXT-030 | 2026-08-29 | Trusted Computing Group | `TPM 2.0 architecture quote nonce PCR freshness` | 0 readable documents | Official PDF returned HTTP 403; no TPM-specific conclusion is used. | None |
| EXT-031 | 2026-08-29 | GitHub code search | `"verify after write"` | 10 sampled results | Results predominantly concerned firmware/flash programming; no translation-table precedent was established. | AWB-20260829-001-E0014 |
| EXT-032 | 2026-08-29 | GitHub and public source indexes | `page-table readback integrity verification stage-2 translation` | Multiple, not enumerated | Found incidents and alternatives but no exact independent post-install G-stage table-readback precedent. | AWB-20260829-001-E0031 |
| EXT-033 | 2026-08-29 | NVD and upstream navigation | `IOMMU DMA page table stale cache CVE` | 5 sampled records | Led to upstream Xen advisory evidence; CVE-only claims not retained when stronger primaries were available. | AWB-20260829-001-E0019, AWB-20260829-001-E0020 |
| EXT-034 | 2026-08-29 | NVD and upstream navigation | `hypervisor page table mapping CVE` | 5 sampled records | Led to XSA-148 and CVE-2022-1158 technical sources; inaccessible CVE-2016-8443 detail was excluded. | AWB-20260829-001-E0021, AWB-20260829-001-E0030 |
| EXT-035 | 2026-08-29 | Fleet audit of RISC-V primary sources | `RISC-V IOMMU 20260222 iommu_sw_guidelines Changing G-stage page table entry IOTINVAL.GVMA` | 1 release and source section | Confirmed the old-or-new PTE interval before processed invalidation and the distinct leaf/non-leaf invalidation forms; the source was already recorded in the XRV streams. | AWB-20260829-001-E0044 |
| EXT-036 | 2026-08-29 | Fleet audit of RISC-V and Linux primary sources | `Svvptc v1.0 Invalid-to-Valid G-stage Linux Hvvptc` | 1 specification repository and 1 implementation path | Confirmed that Svvptc normatively covers S-mode Invalid-to-Valid visibility, not a separate Hvvptc/G-stage extension; Linux G-stage use is implementation evidence. | AWB-20260829-001-E0045 |
| EXT-037 | 2026-08-29 | Fleet audit plus frozen local owner indexes | `CoVE AP-TEE v0.7 IOMMU privileged host programming` | Existing XRV and OSR records | Confirmed CoVE/AP-TEE v0.7 was already recorded; no new discovery was created and no separate report claim was needed. | None |
| EXT-038 | 2026-08-29 | Fleet audit of NIST primary locators | `NIST SP 800-193 DOI canonical page direct PDF` | DOI and canonical page; conflicting direct-PDF results | Confirmed the DOI and current CSRC page; retained both earlier HTTP 200 and later HTTP 404 as point-in-time access results without asserting a permanent move. | AWB-20260829-001-E0040 |
| EXT-039 | 2026-08-29 | Fleet audit of Linux primary source | `Linux RISC-V KVM vmid.c hgatp VMID sufficiency lines 26 42` | 1 source function | Confirmed that lines 26-42 cover the complete function and VMID-sufficiency policy. | AWB-20260829-001-E0039 |
| EXT-040 | 2026-08-29 | Frozen source-discovery reference set | `Svvptc riscv-svvptc 089ce2a0 Hvvptc` | 0 matches across reachable required indexes | The formal-verification bibliography, CHERI BibTeX index, OSR README/WANTED and five nonrestricted manifests, XRV review log and two streams, provenance metadata index, and workbook discovery log did not record Svvptc; DISC-016 was therefore appended. | AWB-20260829-001-E0045 |
| EXT-041 | 2026-08-29 | Fleet citation audit of RISC-V IOMMU release | `RISC-V IOMMU 20260222 src iommu_sw_guidelines second-stage PTE IOTINVAL.GVMA licence` | 1 lightweight tag, 1 exact commit, and 1 source section | Resolved tag `20260222` to commit `054005f4ffe30838a4ffe144a01ea3933ffea6f2`, verified `src/iommu_sw_guidelines.adoc:210-231`, and confirmed CC-BY-4.0; E0046 supersedes E0044's current-main line attribution. | AWB-20260829-001-E0046 |

## Terminology collisions

Terms that mean different things in different sources, and how each use was
disambiguated.

| Term | Sense A and source | Sense B and source | How it was disambiguated |
| --- | --- | --- | --- |
| G-stage / Stage G | RISC-V guest-physical translation in component and ISA records | A lifecycle phase named Stage G, which no inspected local source defines | The report uses `G-stage` architecturally and calls the timing `post-install` or `pre-activation`. |
| Readback | Software re-read of PTE arrays in Helium | Architectural HGATP CSR read in Beryllium R3/R5; retained-file correspondence elsewhere | Every finding names the object read and acquisition path. |
| Verify after write | Flash/programmer confirmation of nonvolatile write success | Translation table/register comparison | Flash results were not transferred to SRAM/CSR behavior without evidence. |
| Verification | Software checks, host tests, bounded model checking, formal proof, translation validation, or hardware validation | Different assurance levels | Each mechanism retains its source's exact boundary; no generic `verified` claim is made. |
| Measurement | Configuration identity or file hash in local records | Cryptographic measured boot/attestation evidence | Hash/correspondence records are not called attestation. |
| Immutable | No runtime PTE edit after seal in the accepted design | Physical or hardware write protection against firmware, DMA, debug, or faults | The report says `design-immutable` unless hardware enforcement is evidenced. |
| Independent | Separate function/walker implementation | Separate privilege, processor, bus, compiler, or root of trust | Independence is described dimension by dimension rather than as a binary property. |
| Read-after-write | Immediate register or memory consistency check | Storage command/cache semantics | Storage and FPGA analogies remain gaps unless a primary source establishes transferability. |

## Approved component commands run

Only commands the user approved by name for this session. Approval to run is
never approval to write.

| Command | Component | Revision | Date | Result | Evidence IDs |
| --- | --- | --- | --- | --- | --- |
| None | Not applicable | Not applicable | Not applicable | No command was approved. | None |

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Inquiry scaffolder | Created the search log. | The log was initialized for Q-001. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Recorded the complete eight-tier local pass, ten external gaps, 34 external query records, terminology collisions, and the no-command result. | The first external specialist had no retrieval capability; a separate public-primary-source pass and citation audit supplied the recorded evidence. |
| ACTIVITY-003 | 2026-08-29 | Analysis agent | Appended six fleet-audit query records for IOMMU, Svvptc, CoVE, NIST, Linux, and discovery-index rechecks. | Existing queries remain unchanged; E0035 supersedes E0031's incorrect query references. |
| ACTIVITY-004 | 2026-08-29 | Analysis agent | Appended the exact release-tag citation and licence recheck for RISC-V IOMMU evidence. | E0046 corrects E0044 without changing the substantive old-or-new PTE observation. |
