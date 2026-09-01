# Establish the post-G-stage install readback use case - Report

Session ID: `AWB-20260829-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-08-29`
Status: `Complete`
Topic: Post-G-stage install readback use case
Confidence: Medium

The comprehensive analysis document. Every substantive statement cites
evidence IDs and carries confidence, alternatives, and limitations.

## Question

Does post-G-stage install readback have a defensible security or assurance use
case in Beryllium? Which concrete threats can it address, which attacks or
faults bypass it, how does it compare with alternatives, and under what
assumptions and requirements would retaining or developing it be justified?

## Method

The inquiry used the eight-tier order in `RESEARCH-SOURCES.md`. A
write-disabled local specialist swept the frozen component revisions, local
instructions, handoffs, implementation, assurance records, completed
provenance package, and research corpora. Material local claims were then
checked against frozen Beryllium and Helium records through the maintained
read-only wrapper.

Ten explicit local gaps were carried into a public-safe external pass. The
designated external specialist had no retrieval capability, so that negative
result was recorded and a separate public-primary-source specialist searched
specifications, upstream source, security advisories, incident reports, and
research. A second focused audit checked stable URLs, exact source locators,
and applicability; it qualified several claims and rejected Starbleed as an
example of defensive-readback spoofing. Newly surfaced sources were checked
against the complete required reference set before being queued as
discoveries.

No component command was approved or run. No component was modified. The
analysis distinguishes direct Beryllium evidence from analogous external
systems, observation from inference, and software consistency from hardware
or adversarial assurance.

## Surfaces examined

| Surface ID | Surface | Logical locator | Revision or checked date | Coverage |
| --- | --- | --- | --- | --- |
| SURFACE-001 | Feature definition, lifecycle position, semantics, and intended claim | `component://beryllium-repo/`; `component://helium-te-poc/` | Frozen revisions in `session.md` | Complete; three distinct local meanings identified |
| SURFACE-002 | Assets, objectives, trust boundaries, adversaries, and timing | Component security and evidence records | Frozen revisions in `session.md` | Complete within current documented profiles |
| SURFACE-003 | Acquisition, transport, expected value, comparison, interpretation, and reporting | R2/R3/R5 and Helium implementation/evidence records | Frozen revisions in `session.md` | Complete for software paths; independent hardware path absent |
| SURFACE-004 | Malicious installer/host, toolchain, replay, equivocation, stale data, verifier compromise | Local TCB records; RFC 9334; Petroni evidence | Local revisions and external sources checked 2026-08-29 | Complete at architectural level |
| SURFACE-005 | Physical, interposer, fault, bus, storage, and adversarial-device scenarios | R8 plan; Xen advisories; Rowhammer; Thunderclap | Checked 2026-08-29 | Partial; no direct Beryllium or bus-interposer experiment |
| SURFACE-006 | TOCTOU, later mutation, alternate views, and false assurance | Local lifecycle limits; RFC 9334; Xen advisories | Checked 2026-08-29 | Complete for bounded conclusions |
| SURFACE-007 | Specific research, standards, incidents, and deployed examples | External sources in evidence ledger | Checked 2026-08-29 | Deep pass complete; blocked sources recorded |
| SURFACE-008 | Alternative and complementary controls | Local research, ISA, incidents, and standards | Checked 2026-08-29 | Complete for current decision criteria |
| SURFACE-009 | Current status, requirements, residual risk, and decision criteria | Beryllium R2-R8 and Helium assurance records | Frozen revisions in `session.md` | Complete; no hardware or approval inference |

## Findings

### FINDING-001

- Statement: "Post-G-stage install readback" is not one feature in the current evidence. It can mean Helium's per-leaf software PTE reconciliation, Beryllium R2's complete pre-publication root walk, or Beryllium R3/R5's architectural HGATP selector readback after a write and fence. These checks observe different objects and must carry separate claims.
- Evidence IDs: AWB-20260829-001-E0002, AWB-20260829-001-E0003, AWB-20260829-001-E0006, AWB-20260829-001-E0008, AWB-20260829-001-E0009, AWB-20260829-001-E0014, AWB-20260829-001-E0034
- Confidence: High
- Evidence basis: Frozen implementation and assurance records directly identify the software PTE checks, full root walk, and selector transaction. The local deep sweep found no lifecycle phase named Stage G and no persistent-flash or FPGA feature under this term.
- Alternatives considered: The user's phrase may have intended only the HGATP readback at root installation or only the earlier Helium policy/PTE check.
- Counter-evidence: The ambiguity remains unresolved in OPEN-001; treating both as in scope avoids silently choosing one interpretation but makes a single yes/no answer inappropriate.
- Limitations: The finding classifies current local meanings; it does not rule out a future design document using the term differently.

The report therefore uses:

- **semantic root check** for comparison of complete PTE structure and
  mappings against sealed canonical authority;
- **selector readback** for reading the architectural HGATP value after the
  intended write and fence; and
- **effective-translation evidence** for an access or fault produced through
  the actual translation path. Neither of the first two automatically
  supplies the third.

### FINDING-002

- Statement: A defensible use case exists, but it is narrow: pre-activation admission and diagnostic detection of persistent accidental divergence between independently defined expected authority and the constructed table, plus immediate confirmation that hardware accepted the intended legal HGATP selector. It is defense-in-depth and error detection, not a new adversarial isolation boundary.
- Evidence IDs: AWB-20260829-001-E0003, AWB-20260829-001-E0006, AWB-20260829-001-E0008, AWB-20260829-001-E0016, AWB-20260829-001-E0017, AWB-20260829-001-E0021, AWB-20260829-001-E0030
- Confidence: Medium
- Evidence basis: R2 directly checks full constructed roots against sealed canonical authority, while R3/R5 checks the installed selector before publication. The RISC-V ISA explicitly uses write/readback to reveal accepted WARL values, and Linux uses it for mode and VMID capability discovery. XSA-148 and CVE-2022-1158 supply concrete wrong-permission and wrong-write-target defect classes, but also show why independent expected state matters.
- Alternatives considered: Barriers, immutability, tests, or proof could make all readback redundant; conversely, readback could be treated as a security control against malicious privileged code.
- Counter-evidence: Barriers do not detect a persistent wrong mapping or wrong selector, while ordinary same-path equality does not detect wrong policy logic. No accessible normative source quantified transient-hardware-fault coverage, and no direct Beryllium hardware fault injection was run.
- Limitations: "Defensible" is conditional on requirements in FINDING-007. The evidence does not quantify defect probability, performance cost, or safety diagnostic coverage.

Threat classes for which the check has bounded value:

| Scenario | Semantic root check | Selector readback | Necessary condition | Example or evidence |
| --- | --- | --- | --- | --- |
| Extra, missing, malformed, or wrong PTE structure | Detectable by a complete walk | Not detectable | Walker must compare the final-use buffer with separate sealed authority | Beryllium R2, AWB-20260829-001-E0006 |
| Wrong R/W/X or PPN produced by construction logic | Detectable only if expectation is independently derived | Not detectable | Expected policy cannot be the same erroneous value just written | XSA-148, AWB-20260829-001-E0021 |
| Write reaches the wrong table address | The intended entry may remain unchanged and fail comparison | Not detectable | Checker must inspect the intended final address and complete tree | CVE-2022-1158 analogy, AWB-20260829-001-E0030 |
| Wrong root value passed to the CSR wrapper | Not sufficient by itself | Detectable at the sampled CSR | Expected root binding must be independently fixed and legal | Beryllium R3/R5, AWB-20260829-001-E0008 and AWB-20260829-001-E0009 |
| Unsupported mode or reduced VMID width | Not applicable | Directly observable through WARL readback | Probe must be scoped as capability discovery | RISC-V ISA and Linux, AWB-20260829-001-E0016 and AWB-20260829-001-E0017 |
| Persistent accidental corruption before final check | Potentially detectable | Detectable only if it affects the selector | Corruption must be visible through the sampled path and occur before check | Local construction checks, AWB-20260829-001-E0006 and AWB-20260829-001-E0008 |

### FINDING-003

- Statement: Same-path readback does not provide independent security evidence against a malicious or compromised component inside the privileged TCB when that component can control installation, the expected value, the read path, comparison, or result reporting.
- Evidence IDs: AWB-20260829-001-E0004, AWB-20260829-001-E0005, AWB-20260829-001-E0012, AWB-20260829-001-E0023, AWB-20260829-001-E0024
- Confidence: High
- Evidence basis: Helium's builder and checker share memory, privilege, compiler, and trusted code. RFC 9334 separately identifies verifier, reference-value, and attesting-environment compromise as assurance failures. Copilot's design goal is useful monitoring despite a compromised host precisely because the monitor is moved to a coprocessor.
- Alternatives considered: Diverse functions, separate source modules, two compilers, or fail-stop behavior might be considered sufficient independence.
- Counter-evidence: Software diversity can catch ordinary implementation defects and common review errors even without a separate trust domain; the current R2 builder and walker are separate paths and therefore have diagnostic value.
- Limitations: This finding concerns resistance to malicious shared-TCB behavior. It does not deny the reliability benefit of a second implementation or assertion in a trusted environment.

For a malicious privileged actor, a passing same-path check can be created by
writing a benign value for the check window, supplying a matching false
expectation, redirecting the checker to an alias, skipping or forging the
comparison, reporting success unconditionally, or changing the state after
the check. Meaningful resistance to that actor requires some combination of
independent privilege, independently protected reference values, a separate
processor or acquisition path, authenticated reporting, and freshness.

### FINDING-004

- Statement: Neither table-byte readback nor HGATP selector readback establishes the effective translation state. Architecturally required fencing, cache visibility, and translation-cache invalidation are separate obligations that readback cannot replace.
- Evidence IDs: AWB-20260829-001-E0008, AWB-20260829-001-E0009, AWB-20260829-001-E0016, AWB-20260829-001-E0017, AWB-20260829-001-E0018, AWB-20260829-001-E0019, AWB-20260829-001-E0022, AWB-20260829-001-E0029
- Confidence: High
- Evidence basis: The RISC-V specification directly says writing HGATP does not order table updates and defines HFENCE.GVMA ordering. Linux follows capability probes with a flush. XSA-286 demonstrates stale TLB state after table changes; XSA-321 demonstrates CPU/IOMMU visibility divergence; seL4 explicitly excludes cache/TLB management from its cited proof boundary.
- Alternatives considered: Reading the selector after the fence might indirectly prove that the fence executed or that translations are current.
- Counter-evidence: In Beryllium the assembly acknowledgement and ordered trace jointly record a selector write, fence, and readback, so the transaction is stronger than an isolated CSR read. That evidence still does not inspect TLB contents.
- Limitations: Xen examples are architecture- and configuration-specific analogues. No direct K3 translation-cache observation or erratum search was available.

The security-relevant ordering is therefore not "write, read, trust." It is a
specified transaction whose separate obligations include final table
visibility, the required local and, where applicable, remote invalidation,
selector installation, exact selector confirmation, and publication only
after every acknowledgement. Effective-translation tests add evidence for
selected paths but do not exhaust cache state.

### FINDING-005

- Statement: One-time pre-activation readback is a point-in-time check. It does not close later CPU writes, DMA or IOMMU activity, debug/system-bus access, Rowhammer or other faults, in-flight transactions, rollback, replay, or a physical split-view/interposer path.
- Evidence IDs: AWB-20260829-001-E0011, AWB-20260829-001-E0015, AWB-20260829-001-E0019, AWB-20260829-001-E0020, AWB-20260829-001-E0023, AWB-20260829-001-E0025, AWB-20260829-001-E0026
- Confidence: High
- Evidence basis: R8 explicitly treats external masters, debug, cache, IOMMU/IOPMP, firmware, and secure-boot state as separate characterization requirements. XSA-302 records in-flight DMA after reassignment; RFC 9334 states the general post-evidence race; Project Zero demonstrated later physical PTE corruption; Thunderclap demonstrates malicious-peripheral DMA through IOMMU usage weaknesses.
- Alternatives considered: Design-level root immutability and a single active hart might eliminate the mutation window.
- Counter-evidence: In the current fixed Beryllium design, roots are not edited after sealing, switches run with virtualization off, and the bounded profile excludes devices and concurrency. These constraints materially reduce ordinary software mutation but do not establish physical or external-master enforcement on K3.
- Limitations: No direct Beryllium physical, interposer, DMA, debug, or fault-injection experiment exists. Thunderclap did not specifically demonstrate writing a stage-2 table, and physical split-view spoofing remains a plausible hypothesis rather than a demonstrated Beryllium scenario.

### FINDING-006

- Statement: Current Beryllium already composes the controls that make readback useful: complete semantic root walk, immutable post-seal roots, HGATP write/fence/readback before publication, and selected real access/fault probes. An additional same-memory per-PTE readback after selector installation has low marginal value unless a new copy/programming boundary, independently derived expectation, or explicit hardware-fault diagnostic objective is introduced.
- Evidence IDs: AWB-20260829-001-E0006, AWB-20260829-001-E0007, AWB-20260829-001-E0008, AWB-20260829-001-E0009, AWB-20260829-001-E0010, AWB-20260829-001-E0031
- Confidence: Medium
- Evidence basis: R2 walks the final physical pools before output publication; R3 re-walks and then installs, fences, reads, and publishes the selector; R5 repeats the checked switch transaction and records no post-seal PTE changes. The external implementation search found barriers/invalidation rather than duplicate post-install table readback in the inspected production paths.
- Alternatives considered: A repeated read could catch a transient corruption between R2's walk and R3's selector installation even without another transformation boundary.
- Counter-evidence: Any nonzero time gap admits that possibility, and a cheap repeated check can be a useful assertion. Conversely, a second same-path read can create assurance theatre if its claim is not explicitly limited and it delays or complicates the trusted transition.
- Limitations: OPEN-003 assumes the current final-buffer design remains unchanged. Cost, generated code, exact placement, and fault-injection behavior of a proposed extra feature were not available.

Comparison of controls:

| Control | Strongest supported use | What it still does not establish |
| --- | --- | --- |
| R2 complete independent root walk | Full structural and semantic correspondence to sealed canonical authority before publication | Hardware walker behavior, compiler correctness, later mutation, malicious common TCB |
| HGATP write/fence/readback transaction | Intended legal selector was accepted at the sampled point and the checked transaction reached its publication gate | PTE content, TLB contents, IOMMU state, later selector changes |
| Post-seal design immutability | Removes intended runtime PTE edits and narrows TOCTOU | Enforcement against firmware, DMA, debug, physical faults, or malicious HS code |
| Real positive and denial probes | Exercises selected effective translation and fault paths | Exhaustive mapping correctness, untested addresses, all cache/device states |
| Bounded model checking and model proofs | Named properties within exact source, model, property, and tool bounds | Compiler, live capture, privileged effects, ISA implementation, hardware |
| Secure/measured boot and attestation | Component identity and fresh evidence when rooted and appraised correctly | Continuous mapping state, compromised verifier/reference values, post-evidence race |
| Independent continuous monitor | Detects persistent live divergence outside a compromised host path | Detection latency, transient attacks, response integrity, added hardware/TCB |
| IOMMU/IOPMP, debug lockdown, ECC, and physical controls | Prevents or detects selected alternate-writer and fault paths | Policy correctness and all implementation or physical attacks |

### FINDING-007

- Statement: Retaining or adding readback is justified only if its contract states the observed object, expected authority, independence dimensions, timing, mutation exclusion, fence obligations, failure action, and non-claims. Without those requirements, the feature risks overstating a diagnostic check as security assurance.
- Evidence IDs: AWB-20260829-001-E0004, AWB-20260829-001-E0006, AWB-20260829-001-E0011, AWB-20260829-001-E0012, AWB-20260829-001-E0016, AWB-20260829-001-E0023, AWB-20260829-001-E0027
- Confidence: Medium
- Evidence basis: Local checks obtain value from sealed canonical authority, complete walks, terminal failure, immutability, and publication gating. External sources separately require ordering, freshness, protected roots, and trustworthy reference/appraisal paths.
- Alternatives considered: Treat readback as an ordinary assertion with no security contract, or remove it because it cannot defeat privileged attackers.
- Counter-evidence: Ordinary assertions can still be worthwhile at low cost, and requiring a separate hardware root for every diagnostic would be disproportionate. The requirements therefore scale with the claimed adversary rather than banning same-path checks.
- Limitations: Requirements are analysis-derived decision criteria, not accepted design, implementation authorization, or proof.

Minimum contract for a defensible feature:

1. **Name the object.** State whether the check reads PTE bytes, a complete
   root, HGATP, effective access behavior, or retained evidence.
2. **Name the fault class.** The default supported class is accidental,
   persistent construction/write/selection divergence before activation.
3. **Protect the expectation.** Compare with sealed canonical authority or an
   independently derived reference, not merely the value supplied to the
   write.
4. **Check the final-use object.** The verified buffer and root must be the
   exact physical object selected for hardware use; aliases and post-check
   copies need separate treatment.
5. **Check completely enough.** A semantic root check should cover table
   shape, pointers, missing/extra entries, PPNs, permissions, reserved bits,
   and unused storage; a selector check should cover the exact legal HGATP
   binding.
6. **Make mutation impossible or explicit.** No concurrent CPU writer,
   intended post-seal edit, uncontrolled DMA master, debug write path, or
   unbounded gap may exist between check and activation under the claim.
7. **Keep fences separate.** Required cache maintenance and
   `HFENCE.GVMA`/remote invalidation remain mandatory even after a passing
   readback.
8. **Fail before publication.** Mismatch must prevent active-binding
   publication and lead to one explicit terminal or recovery state; a warning
   that continues is a different control.
9. **Use effective-path evidence where claimed.** Selected positive and
   negative accesses may corroborate actual translation behavior but must be
   described as bounded probes.
10. **State non-claims.** A passing same-path check is not attestation,
    hardware validation, resistance to a malicious privileged TCB, proof of
    TLB/IOMMU state, or protection against later physical modification.

### FINDING-008

- Statement: The use-case decision separates cleanly: the existing HGATP readback has positive value as a low-cost transaction acknowledgement and WARL-aware selector assertion; the existing R2 full walk has stronger value for semantic mapping correspondence; a new duplicate post-install PTE readback needs a distinct boundary or fault objective to avoid redundancy; and any claim against malicious privileged or physical actors requires controls outside same-path readback.
- Evidence IDs: AWB-20260829-001-E0006, AWB-20260829-001-E0008, AWB-20260829-001-E0009, AWB-20260829-001-E0016, AWB-20260829-001-E0018, AWB-20260829-001-E0019, AWB-20260829-001-E0023, AWB-20260829-001-E0024, AWB-20260829-001-E0025
- Confidence: Medium
- Evidence basis: The two current checks have non-overlapping direct purposes, while normative and incident evidence establishes their limits. Independent monitoring, freshness, external-master control, and physical-fault evidence belong to separate assurance layers.
- Alternatives considered: Remove all readback as redundant with trusted stores and fences, or elevate all readback into a security invariant.
- Counter-evidence: Wrong-write and wrong-selector defects show diagnostic value, while stale-cache, malicious-TCB, DMA, and Rowhammer examples show why the claim cannot be elevated. The exact feature intended by the user remains open.
- Limitations: This is decision support, not the decision. It does not estimate implementation cost or certify that the current assembly/readback path is bug-free.

Practical decision test:

| Proposed action | Evidence-led criterion |
| --- | --- |
| Retain current HGATP readback | Defensible if kept inside the write-fence-readback-publication transaction and documented as selector acknowledgement, not mapping or cache verification |
| Retain R2 semantic walk | Defensible as the primary mapping-correspondence admission check because it compares complete realized roots with sealed authority |
| Add another software PTE pass after HGATP install | Justified only if it crosses a real transformation/copy/fault boundary, uses meaningfully independent expected state/path, or satisfies a stated safety fault model |
| Claim resistance to malicious HS/firmware/toolchain | Not supported by same-path readback; requires an independent trust and acquisition path plus authenticated reference/reporting |
| Claim protection against DMA/debug/physical modification | Not supported until platform mechanisms exclude those writers and retained hardware evidence demonstrates the bounded state |
| Replace fencing or behavioral probes with readback | Not justified; they address different properties |

### FINDING-009

- Statement: This finding supersedes the selector wording in FINDING-002 and qualifies the word "independent" in FINDING-006. In the bounded R3/R5 QEMU transactions, architectural HGATP readback equaled the expected selector; this is not evidence that K3 or other hardware accepted the selector. Separately, RISC-V WARL semantics establish the generic architectural purpose of write/readback for capability discovery. R2 is a complete fixed-profile software walk with logically separate builder and walker paths, but it shares the same process, privilege and trust domain, compiler, CPU memory/acquisition path, and trusted computing base.
- Evidence IDs: AWB-20260829-001-E0006, AWB-20260829-001-E0008, AWB-20260829-001-E0009, AWB-20260829-001-E0016, AWB-20260829-001-E0039, AWB-20260829-001-E0041, AWB-20260829-001-E0042, AWB-20260829-001-E0043
- Confidence: High
- Evidence basis: The frozen R2, R3, and R5 records directly identify the software paths, QEMU transaction, and selected effective-path observations. The ISA and Linux evidence separately establish architectural WARL capability discovery without transferring that generic purpose into a hardware-validation claim.
- Alternatives considered: The QEMU CSR model could be described as hardware acceptance, or separate builder and walker functions could be described as fully independent.
- Counter-evidence: QEMU does execute an architectural model and R2's separate logic can catch implementation defects, so both provide useful evidence. They do not cross the hardware or trust-domain boundaries required by the stronger wording.
- Limitations: The correction does not inspect a live K3 CSR, translation cache, compiler diversity path, separate processor, or separately trusted acquisition channel.

For future claims, independence must be stated by axis:

| Axis | Current R2 position |
| --- | --- |
| Specification/logical | Separate builder and complete walker logic compare realized roots with sealed canonical authority |
| Implementation diversity | Distinct code paths, but not a separately developed implementation, compiler, or toolchain |
| Privilege/trust-domain | Same process, privilege domain, and trusted computing base |
| Acquisition-path | Same CPU and memory path over the final in-memory pools |

### FINDING-010

- Statement: This finding supersedes the underspecified fence language in FINDING-004 and requirement 7 of FINDING-007. Both fixed roots use VMID 0, and R3/R5 order `csrw hgatp -> hfence.gvma x0,x0 -> csrr hgatp`. Selector equality is consistent with stale translations; the all-address/all-VMID fence, not the readback, discharges the current same-VMID reuse case. The write-then-fence placement is safe in this bounded transaction because R5 writes while `V=0` and no G-stage translation occurs before the fence. Device translation has a separate RISC-V IOMMU invalidation contract.
- Evidence IDs: AWB-20260829-001-E0016, AWB-20260829-001-E0041, AWB-20260829-001-E0044, AWB-20260829-001-E0045
- Confidence: Medium
- Evidence basis: The local records directly state VMID 0, the instruction order, `V=0`, immutable roots, and no post-seal PTE writes. The ISA assigns ordering to `HFENCE.GVMA`; the IOMMU guidelines separately permit old or new PTE use until the corresponding `IOTINVAL.GVMA` is processed and distinguish leaf from non-leaf invalidation.
- Alternatives considered: Readback equality might prove fresh translations, the fence might need to precede the HGATP write, or Svvptc might remove the G-stage fence requirement.
- Counter-evidence: The current transaction has no intervening G-stage translation while `V=0`, so a fence after the write can order the earlier final table stores before later use and invalidate the reused VMID context. Svvptc v1.0 is an S-mode Invalid-to-Valid guarantee, not a separately ratified Hvvptc/G-stage rule; Linux's G-stage use is implementation evidence only.
- Limitations: The conclusion is bounded to the single-hart, same-VMID, no-concurrent-translation QEMU profile. It does not establish remote-hart, targeted-VMID, IOMMU, K3 cache-coherence, or device-integration behavior.

Correct requirement language is:

1. State which final table stores precede the fence and place the required
   `HFENCE.GVMA` after those stores and before any G-stage translation that
   relies on them.
2. State the selector-write placement, fence scope, address scope, VMID scope,
   and whether a VMID is new or reused. For the current roots, VMID 0 is
   reused and `x0,x0` supplies all-address/all-VMID scope.
3. State the assumption that no G-stage translation occurs between the
   HGATP write and fence; the current basis is `V=0` in the bounded switch.
4. Treat IOMMU invalidation separately. If a platform uses the cited RISC-V
   IOMMU revision, record the applicable leaf or non-leaf `IOTINVAL.GVMA`
   form and wait for processing before relying on the device-visible update.

### FINDING-011

- Statement: This finding qualifies the defect examples in FINDING-002. XSA-148 and CVE-2022-1158 are runtime, guest-driven defect-class analogues; neither is an instance known to have been caught by Beryllium's pre-activation check. In XSA-148, same-source readback would confirm the wrongly authorized value, so only comparison with independently derived policy addresses the class. For CVE-2022-1158, intended-address readback could reveal a missing intended update, but even a bounded complete walk of the intended pool cannot locate the spurious out-of-pool write.
- Evidence IDs: AWB-20260829-001-E0006, AWB-20260829-001-E0021, AWB-20260829-001-E0030
- Confidence: High
- Evidence basis: The advisories describe wrong authorization and wrong-target behavior, while R2's direct evidence bounds its complete walk to the two intended fixed roots and their spare storage.
- Alternatives considered: Both incidents could be presented as direct precedents for defects that Beryllium readback would catch.
- Counter-evidence: Their failure shapes are useful for testing the limits of policy comparison and intended-address checking, but their runtime guest-controlled paths and architectures differ from the fixed Beryllium admission transaction.
- Limitations: No replay of either defect against Beryllium was performed, and no claim is made that the current implementation contains either defect.

### FINDING-012

- Statement: This finding supersedes the absolute mutation-exclusion wording in requirement 6 of FINDING-007. A defensible claim requires a documented mutation-exclusion argument naming the exact profile, evidence basis, excluded and residual writers, and check-to-use interval. The current argument is bounded to the single-hart, no-DMA, `V=0`, immutable-root QEMU profile; protection from K3 firmware, DMA/IOMMU, debug or system-bus writers, and physical faults is not established.
- Evidence IDs: AWB-20260829-001-E0005, AWB-20260829-001-E0009, AWB-20260829-001-E0036, AWB-20260829-001-E0038, AWB-20260829-001-E0041, AWB-20260829-001-E0044
- Confidence: Medium
- Evidence basis: Helium and Beryllium state their fixed single-hart, no-DMA, immutable-root, and virtualization-off assumptions. Parent coordination keeps R8-H0 unaccepted and K3 `NOT RUN`; local research and the IOMMU specification identify additional writer and invalidation surfaces.
- Alternatives considered: Design immutability could be treated as proof that mutation is impossible, or no mutation-exclusion claim could be made until hardware validation.
- Counter-evidence: Within the bounded QEMU transaction, no intended PTE writer or G-stage translation is active, which supports a useful local argument. That basis does not establish enforcement against platform actors absent from the profile.
- Limitations: The residual-writer inventory for the eventual K3 platform remains OPEN-004 and OPEN-006; no accepted H0 profile or retained K3 observation closes it.

The corrected requirement is: document the exact profile; enumerate CPU,
firmware, DMA/IOMMU, debug/system-bus, and physical mutation paths; cite the
mechanism or retained evidence excluding each path; state the check-to-use
interval and concurrency assumptions; and list every residual writer. A
passing readback may claim only that bounded profile.

### FINDING-013

- Statement: This finding qualifies FINDING-005 and HYPOTHESIS-002. A physical split-view or interposer remains a hypothesis: same-path CPU readback provides no evidence against such a split view, but the inquiry has no demonstration that one exists in Beryllium. Established evidence must remain separated by threat class: later physical PTE mutation, CPU/IOMMU visibility and invalidation, in-flight or malicious-device DMA, and debug/replay/rollback lifecycle concerns.
- Evidence IDs: AWB-20260829-001-E0019, AWB-20260829-001-E0020, AWB-20260829-001-E0023, AWB-20260829-001-E0025, AWB-20260829-001-E0026, AWB-20260829-001-E0038, AWB-20260829-001-E0044
- Confidence: Medium
- Evidence basis: Rowhammer demonstrates later physical PTE mutation; Xen and Thunderclap establish bounded DMA/IOMMU and visibility hazards; RFC 9334 and local lifecycle records establish freshness, replay/rollback, debug, and post-evidence concerns. None demonstrates a Beryllium physical interposer or split view.
- Alternatives considered: The CPU/IOMMU visibility example could be treated as proof of a general physical split view, or the absence of a Beryllium experiment could be treated as evidence that the threat is irrelevant.
- Counter-evidence: XSA-321 is a real split in CPU/IOMMU visibility for a specific configuration, but it is not a physical interposer and does not establish K3 applicability. The current no-device QEMU profile also does not expose the relevant device path.
- Limitations: Reachability and ranking for the intended K3 deployment remain open. Same-path readback neither confirms nor refutes a physical split-view hypothesis.

### FINDING-014

- Statement: This finding supersedes the evidentiary emphasis in FINDING-006. The strong basis for low marginal value of another post-install same-memory PTE pass is local: R2 already walks the complete final pools against sealed authority, R3 rechecks before installation, and R5 records immutable roots with no post-seal PTE write. The dynamic-hypervisor negative searches are weak corroboration only and did not inspect exact Xen activation paths.
- Evidence IDs: AWB-20260829-001-E0006, AWB-20260829-001-E0007, AWB-20260829-001-E0009, AWB-20260829-001-E0035, AWB-20260829-001-E0041
- Confidence: Medium
- Evidence basis: Frozen local evidence directly establishes the final-buffer and no-post-seal-write argument. E0035 limits the public search to the actual EXT-006 through EXT-009 and EXT-032 records and removes the unsupported Xen-path statement.
- Alternatives considered: Absence in production hypervisor searches could be the primary argument against the feature, or any additional read could be assumed valuable because a time gap remains.
- Counter-evidence: Terminology-sensitive searches cannot establish global absence, and a new copy, programming, trust, or hardware-fault boundary could justify another pass. No such boundary exists in the current fixed profile.
- Limitations: The marginal-value judgment remains conditional on OPEN-003 and does not estimate implementation cost or transient-fault coverage.

### FINDING-015

- Statement: The fleet audit corrected five additional current-source projections without changing the overall answer: R8-H0 committed/unaccepted and K3 `NOT RUN` now use parent coordination anchors; the formal-research path is corrected; the lifecycle ledger observation is source-neutral; the Linux VMID anchor includes the full function; and NIST SP 800-193 uses its DOI and canonical page without asserting a permanent PDF move.
- Evidence IDs: AWB-20260829-001-E0036, AWB-20260829-001-E0037, AWB-20260829-001-E0038, AWB-20260829-001-E0039, AWB-20260829-001-E0040
- Confidence: High
- Evidence basis: Each superseding ledger row records the corrected locator or observation and identifies the earlier row it supersedes.
- Alternatives considered: The earlier rows could be silently edited because these are clerical corrections.
- Counter-evidence: The package contract is append-only; preserving the earlier rows and adding explicit supersession makes the correction history auditable.
- Limitations: Parent coordination contains stale earlier H0 wording alongside its later current-status section; E0036 states which records control the present projection.

### FINDING-016

- Statement: This finding supersedes E0044 as the current citation basis for the RISC-V IOMMU comparison used in FINDING-010, FINDING-012, and FINDING-013. At release `20260222`, the exact source section is `Changing second-stage page table entry` at `src/iommu_sw_guidelines.adoc:210-231`, pinned to commit `054005f4ffe30838a4ffe144a01ea3933ffea6f2`; it states that the IOMMU may use the old or new PTE until the corresponding invalidation is processed.
- Evidence IDs: AWB-20260829-001-E0046
- Confidence: High
- Evidence basis: The focused citation audit resolved the lightweight release tag to an exact commit, opened the release-version path and lines, and checked the CC-BY-4.0 licence.
- Alternatives considered: The earlier tag URL and current-main line range might have identified equivalent text well enough without correction.
- Counter-evidence: The substantive text was equivalent, but the current-main file location and line range did not bind the claimed release revision; an exact commit locator is required for stable evidence.
- Limitations: The correction strengthens citation stability only. It does not establish that the intended K3 platform implements, enables, or correctly configures the cited IOMMU.

## Hypotheses

Possibilities that the evidence suggests but does not establish. These are not
conclusions.

| Hypothesis ID | Statement | Supporting evidence IDs | What would confirm it | What would refute it |
| --- | --- | --- | --- | --- |
| HYPOTHESIS-001 | Immediate selector readback could provide useful diagnostic coverage for transient CSR or write-path hardware faults beyond software construction defects. | AWB-20260829-001-E0016 | Accessible functional-safety standard, platform fault model, and repeatable hardware fault-injection evidence showing detection | Evidence that legal HGATP writes/readbacks are fault-atomic for the target or that the same faults corrupt both write and read paths undetectably |
| HYPOTHESIS-002 | A physical bus interposer or malicious platform could present benign bytes to CPU readback while a walker or device receives a different view. | AWB-20260829-001-E0019, AWB-20260829-001-E0023 | Reproducible split-view experiment, processor or SoC advisory, or platform threat model | A hardware integrity mechanism proving one authenticated coherent view for all relevant requesters |
| HYPOTHESIS-003 | Hardware-backed ownership or effective-mapping attestation could extend the useful threat boundary beyond trusted-software diagnostics. | AWB-20260829-001-E0023, AWB-20260829-001-E0027 | Accessible authoritative specification plus evaluated implementation binding effective translation or ownership and freshness | Evidence that the mechanism reports only software-supplied table bytes or remains controlled by the same malicious host |

## Assumptions in use

Assumptions standing in for unanswered non-blocking questions.

| Open ID | Assumption | Why it was necessary | Effect if wrong |
| --- | --- | --- | --- |
| OPEN-001 | Both software PTE/root checks and HGATP selector readback are in scope and must remain distinct. | The user's wording is ambiguous and local sources use readback in multiple senses. | A narrower intended feature would remove some findings but not transfer one check's guarantee to another. |
| OPEN-002 | Accidental and malicious threat models are both considered, with separate conclusions. | The confirmed boundary was broad but did not rank the primary adversary. | A safety-only objective would increase the relative value of diagnostic readback; a malicious-TCB objective would reduce it. |
| OPEN-003 | R2 constructs and checks the final physical buffers and no later transformation or copy occurs before use. | Marginal value of a second PTE pass depends on whether another boundary exists. | A new copy or programming boundary could make post-boundary readback materially useful. |
| OPEN-004 | No platform protection against firmware, DMA, debug, or physical mutation is credited before K3 evidence exists. | Current R8 work is incomplete and hardware is `NOT RUN`. | Verified platform protections could narrow residual risk and strengthen a point-in-time claim. |
| OPEN-005 | No quantified transient-fault diagnostic claim is made. | The relevant safety standard and hardware fault evidence were unavailable. | A required safety case could independently justify readback even when security value is limited. |
| OPEN-006 | Platform-dependent threats remain unranked until the exact K3 writer, device, trust-domain, and protection profile is retained. | The broad analysis cannot infer deployment reachability from QEMU or cross-platform analogues. | An accepted exact platform profile could remove theoretical threats, identify reachable ones, and change control priorities. |

## Disagreements and terminology

The phrase **G-stage** denotes RISC-V guest-physical translation in the
inspected implementation and ISA sources. No source defines a lifecycle
phase called **Stage G**. The report therefore interprets "post G stage
install" as "after installing G-stage state" (AWB-20260829-001-E0014,
AWB-20260829-001-E0034).

**Readback** means at least three things locally: software PTE inspection,
architectural HGATP read, and retained-file correspondence. **Verification**
ranges from assertions and host tests through bounded model checking and
formal proof. **Measurement** may mean a non-cryptographic configuration
identity or a cryptographically rooted attestation measurement. **Immutable**
in the accepted runtime means no intended PTE edit after sealing; it does not
by itself mean protection from M-mode, DMA, debug, or physical faults
(AWB-20260829-001-E0004, AWB-20260829-001-E0009,
AWB-20260829-001-E0011).

External implementation patterns are also not uniform. Linux uses HGATP
write/readback for capability discovery, while inspected pKVM and Xen paths
use barrier and invalidation protocols without an equivalent security
readback. This is counter-evidence to universality, not proof that
Beryllium's bounded assertion is wrong (AWB-20260829-001-E0017,
AWB-20260829-001-E0031).

## Assurance boundaries preserved

- Helium at `1ab289c066b69acdd8b55c9f77055b0145be1316` is a
  review-and-test proof of concept. It is neither formally verified nor
  hardware validated; it assumes one hart, no DMA, and no concurrent
  mutation (AWB-20260829-001-E0005).
- Beryllium R2-R5 evidence applies to exact accepted targets and bounded
  host/QEMU profiles. It does not establish K3 or other hardware behavior,
  arbitrary page tables, devices, multicore execution, or production
  isolation (AWB-20260829-001-E0007 through AWB-20260829-001-E0009).
- Beryllium R7 and later Helium CBMC results remain bounded to the stated
  source, properties, models, and tools. They do not establish compiler, ISA,
  firmware, live-capture, or hardware correctness
  (AWB-20260829-001-E0010).
- Beryllium R8-H0 is committed but unaccepted, successor packages remain
  gated, and K3 hardware is `NOT RUN`. R8 requirements are plans, not
  observations (AWB-20260829-001-E0011).
- A public source about Xen, Linux, seL4, Rowhammer, Thunderclap, firmware, or
  attestation is an analogue unless the report explicitly states a direct
  architectural fact. None validates Beryllium.

## Limitations

- No component command was approved, so no new build, test, model check, QEMU
  run, hardware run, or fault injection was generated.
- The exact user-intended readback meaning and primary threat objective remain
  open; both mechanisms and both threat classes were analyzed separately.
- No direct Beryllium physical, DMA, debug, interposer, stale-TLB, or
  Rowhammer demonstration exists.
- The full Copilot, OSLO, SWATT, TPM, Arm architecture, IEC safety, and AMD
  SEV-SNP primary texts were wholly or partly inaccessible as recorded in
  `inaccessible-resources.md`.
- External negative code search was bounded and cannot prove absence of a
  readback pattern under other names or in other systems.
- No quantitative cost, latency, defect-rate, false-positive, or
  fault-diagnostic-coverage evidence was available.
- The package contains private and redistribution-unknown evidence; intended
  `public-candidate` distribution remains only a request and cannot be
  promoted by this analysis.

## What would change the answer

The answer would change most if:

1. the user identifies exactly which readback mechanism and primary adversary
   the feature is intended to address;
2. a design introduces a distinct post-R2 copy, serialization, programming,
   or privilege boundary before hardware use;
3. K3 characterization demonstrates enforceable table immutability, external
   master quiescence or default-deny, debug lockdown, and exact HGATP/fence
   behavior;
4. hardware fault injection or an applicable safety standard establishes a
   required readback diagnostic-coverage target;
5. an independent monitor or hardware root can acquire effective mapping state
   and protect reference values and reporting from the privileged installer;
   or
6. measured defect data shows that the additional check catches a meaningful
   class not already covered by R2 walking, transaction checks, immutability,
   and behavioral probes.

## Activity log

| Activity ID | Date | Actor | Action | Evidence IDs | Result or limitation |
| --- | --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-08-29 | Inquiry scaffolder | Created the report. | None | The report was initialized for Q-001. |
| ACTIVITY-002 | 2026-08-29 | Analysis agent | Synthesized the local-first and externally audited evidence, threat matrix, alternatives, falsification, requirements, and decision criteria. | AWB-20260829-001-E0001 through AWB-20260829-001-E0034 | The answer remains conditional and Medium confidence because the exact mechanism, primary threat objective, hardware state, and safety fault model remain open. |
| ACTIVITY-003 | 2026-08-29 | Analysis agent | Appended FINDING-009 through FINDING-015 to supersede or qualify the fleet-audited wording and source projections. | AWB-20260829-001-E0035 through AWB-20260829-001-E0045 | Overall confidence remains Medium; earlier findings remain visible but the later findings are the current disposition. |
| ACTIVITY-004 | 2026-08-29 | Analysis agent | Appended FINDING-016 to correct and commit-pin the RISC-V IOMMU release citation. | AWB-20260829-001-E0046 | The substantive IOMMU limitation is unchanged; the exact release locator now supports it. |
