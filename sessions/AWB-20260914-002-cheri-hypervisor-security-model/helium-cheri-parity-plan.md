# Helium-to-CHERI Parity Research Plan

Session ID: `AWB-20260914-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Research proposal`

This plan interprets “He” as the Helium fixed Type Enforcement proof of
concept. It proposes a later controlled comparator; it does not authorize
implementation, change Helium's endpoint, or claim formal verification.

## Objective

Construct a CHERI-based counterpart that is comparable to one exact frozen
Helium revision under a common external specification. The comparison should
answer what CHERI changes in:

- trusted code and mutable security state;
- authority representation and delegation;
- memory-isolation enforcement;
- failure and rollback behavior;
- evidence and proof obligations; and
- performance and implementation complexity.

Parity means equivalent externally specified behavior and security properties,
not identical code structure or enforcement mechanisms.

## Comparator freeze

Before implementation, record a responsible-human-selected Helium commit and
its complete validation/evidence bundle. The existing method-transfer record
names Tier 8 H6 candidate `ed1545155c8d09aa75803a256eee0d2fa8844b91`,
which contains bounded CBMC checks for named source-level properties, but that
reference is not automatically the approved comparison baseline and is not a
whole-system formal-verification claim.

Freeze:

- source commit and toolchain;
- QEMU/platform profile;
- two subjects, resource map, and fixed policy;
- initial architectural state;
- allowed, denied, terminal, and recovery traces;
- build and execution commands;
- evidence and provenance format; and
- exact claim and non-claim wording.

## Common external specification

Define a mechanism-neutral relation over:

- subjects and security identities;
- resources and ownership;
- requested operations and permissions;
- current subject and active translation root;
- allow, deny, terminal, and recovery outcomes;
- pre-state, post-state, and no-effect behavior; and
- observable execution trace.

Both Helium and the CHERI counterpart must refine this relation. The common
specification must not reuse either implementation's control flow, tables, or
helper structure.

## Functional parity

At minimum, both candidates must implement the same bounded scenario:

1. two sequential VS-mode subjects;
2. distinct monitor-assigned security identities;
3. distinct G-stage roots;
4. one shared page with asymmetric write permission;
5. one private page per subject;
6. the same allowed and denied access matrix;
7. the same initial GPR and VS-CSR contract;
8. the same externally specified allow, deny, terminal, recovery, and
   no-effect outcomes; and
9. implementation-specific refinement obligations for trap, fence,
   root-switch, and capability-state sequences.

Differences required by CHERI must be recorded explicitly, including
capability register state, tag handling, PCC/DDC/CSP setup, capability-safe
interfaces, and any sealing or compartment transition.

The fixed TE identities, resource set, and six-rule policy are retained by
choice to create a controlled comparison. They are not asserted to be the
natural or preferred CHERI policy representation.

## Security-property parity

Use the same named properties for both candidates:

- no authority before identity establishment;
- no permission increase through policy lookup;
- malformed input is not authority;
- denied access causes no protected-state mutation;
- subject switch does not preserve unauthorized authority;
- old translation state is invalid before the next subject executes;
- unexpected privileged behavior terminates rather than silently emulates;
- recovery changes only the specified state;
- test-only controls cannot affect production behavior; and
- every claimed observation is bound to the exact source and evidence.

CHERI-specific additional properties are allowed, but must not be counted as
parity evidence for Helium. Examples include capability tag preservation,
bounds, permission monotonicity, sealed-entry correctness, and capability
register clearing.

## Formal-verification parity

“Including FV” should mean matched proof obligations, not merely using formal
tools on both sides.

1. Define one common abstract transition relation.
2. Give each implementation an independent abstraction function.
3. Prove or boundedly check the same functional and security properties
   against both abstractions.
4. State implementation-specific assumptions separately.
5. Plan the same authority-widening, skipped-denial, stale-state, and rollback
   mutations before acceptance.
6. Retain exact source, tools, options, bounds, solver results, counterexamples,
   and mutation outcomes.
7. Keep source-level proof, compiler/ISA correspondence, emulator behavior,
   hardware behavior, and noninterference as separate claims.

If only one side has a proof for a property, report an evidence asymmetry, not
parity.

## Direct-comparison matrix

| Dimension | Helium reference | CHERI counterpart | Comparison rule |
| --- | --- | --- | --- |
| External behavior | Fixed two-subject TE trace | Same trace | Must match common specification |
| Policy | Fixed six-rule TE policy | Semantically equivalent policy | Compare decisions, not table layout |
| CPU isolation | G-stage plus monitor state | G-stage plus CHERI confinement | Record incremental mechanism |
| Authority | Monitor-owned labels and tables | Bounded capabilities plus authoritative VM state | Compare ambient and delegated authority |
| Subject switch | Explicit state reset and fences | Same plus capability-state handling | Compare complete observable transition |
| Failure behavior | Defined denial/terminal paths | Same common outcomes | No success-shaped fallback |
| Verification | Tests plus named CBMC source-level properties and killed mutations at the selected Tier 1-8 baseline | Matched properties and bounds | Report property-level evidence asymmetry |
| Residual assumptions | Compiler, ISA, QEMU, single hart | Same plus CHERI profile and tag semantics | Keep adjacent to claims |

## Entry criteria for a later implementation

- A responsible human selects the exact Helium baseline.
- The common external specification is reviewed independently.
- The CHERI target implements required virtualization and capability state.
- Toolchains and emulators are pinned and available.
- Emulator fidelity for ordinary virtualization and CHERI capability/tag
  behavior is stated as a residual assumption unless separately validated.
- Functional, security, FV, and performance comparison metrics are frozen.
- The work is explicitly authorized as a new component or bounded branch.

## Exit criteria

- Both implementations satisfy the common test suite at exact clean commits.
- Matched formal properties have comparable proof or bounded-check evidence.
- All planned security-significant mutations are killed or retained as
  unresolved findings.
- Differences in TCB, authority graph, code size, trusted mutable state,
  runtime overhead, and residual assumptions are reported.
- No stronger claim is made for the CHERI candidate merely because it uses
  CHERI.

## Non-claims

This plan does not establish that Helium is formally verified, that a CHERI
counterpart exists, that the two systems are equivalent, that CHERI is
superior, or that implementation work is approved.
