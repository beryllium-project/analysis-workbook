# CHERI-Native Hypervisor Security Model

Session ID: `AWB-20260914-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Draft research model`

This document proposes a research model, not an approved architecture,
implementation plan, or assurance claim.

## Security objective

Compromise of any non-nucleus service must not grant memory, CPU, interrupt,
device, DMA, lifecycle, attestation, or policy authority that was not
explicitly delegated to that service for the current object generation.

CHERI protects the integrity and use of software-visible references. It does
not replace G-stage translation, IOMMU translation, interrupt-controller
state, physical ownership metadata, device reset, or lifecycle coordination.
The security model therefore joins two complementary layers:

1. a **capability authority layer**, which governs which software principal may
   request or inspect an operation; and
2. a **hardware-resource enforcement layer**, which governs what CPUs, page
   walkers, devices, and interrupt controllers can actually access.

## Principals

| Principal | Required role | Authority that must remain absent |
| --- | --- | --- |
| Boot and measurement root | Establish initial code identity, manifests, and root objects | Runtime policy or ordinary VM administration |
| Enforcement nucleus | Own hardware-visible roots, authoritative resource state, validation, and forced teardown | Rich device models, management policy, or general parsing |
| VM-control service | Express create/start/stop policy using sealed VM handles | Direct page-table, IOMMU, interrupt-controller, or allocator mutation |
| Stage-2 builder | Construct candidate guest mappings from delegated page capabilities | Hardware root installation or unrelated VM memory |
| Device/DMA service | Construct bounded device and DMA transactions | General host memory, CPU scheduling, or arbitrary stage-2 mutation |
| Interrupt service | Manage delegated routes and virtual endpoints | Arbitrary interrupt identities or scheduler authority |
| Scheduler/vCPU service | Select execution and manage delegated vCPU state | Device ownership or arbitrary interrupt injection |
| Attestation service | Sign measurements for explicitly delegated objects and states | General resource mutation or unrestricted signing |
| Policy service | Decide allowed delegations under a named policy version | Direct hardware mutation or authority outside the policy root |
| Guest VM | Use resources assigned to its current generation | Host or other-VM resources |

The nucleus is trusted for enforcement correctness but should not be treated as
the owner of high-level policy. Services may be mutually distrustful.

## Protected objects

Every security-relevant object has:

- a stable object identifier;
- an object type;
- an owner principal;
- a monotonically increasing generation;
- a lifecycle state;
- an authoritative resource record;
- a set of currently valid delegations; and
- links to hardware-visible state derived from the object.

Object classes include VMs, vCPUs, physical-memory extents, stage-2 roots,
devices, DMA domains, interrupt sources and endpoints, service instances,
policy versions, measurements, and cryptographic signing contexts.

## Capability forms

### Resource capabilities

Unsealed capabilities may grant bounded access to ordinary software memory.
Capabilities covering MMIO or installed as an executable PCC with Access
System Registers (ASR) permission can authorize hardware-visible mutation and
must be treated as root-derived hardware authority.

### Sealed object handles

Cross-service authority uses sealed, typed handles that identify an object,
generation, operation class, and maximum delegation envelope. Unsealing is
limited to the service or nucleus entry point responsible for that object
type.

On RISC-V CHERI, the proposed `Zyseal` extension makes seal and unseal
authority explicit as bounded type capabilities. A hypervisor object-type
namespace still needs software allocation and lifecycle policy; the extension
is outside the v1 ratification package and its current maturity labels are not
fully consistent.

### Local and global capabilities

Where `Zylevels1` is available, global/local state plus load-global and
store-local permissions can support capability non-egress rules. These
mechanisms constrain capability flow but do not replace VM ownership,
generation, policy, or hardware-resource checks.

### Transaction capabilities

A hardware mutation requires a single-use or explicitly invalidated
transaction object. It names:

- the target object and expected generation;
- the requested before-and-after state;
- all affected physical resources;
- the policy version and authorizing principal;
- required invalidations, quiescence, reset, and scrub actions; and
- rollback or forced-completion behavior.

Holding a resource capability is insufficient to mint a transaction. The
nucleus validates the complete transaction against authoritative state.

## Root authority

The initial root is a measured boot object, not an ambient omnipotent pointer
distributed to services. Boot constructs:

1. the nucleus's private authority over hardware roots;
2. typed creation authorities for each object class;
3. the initial policy-version object;
4. service identities and entry capabilities; and
5. the initial resource inventory.

Creation authorities are non-transferable unless a policy explicitly permits
delegated creation. No service receives a capability from which it can derive
authority over all physical memory or all devices.

On RISC-V CHERI, service PCCs must lack ASR permission unless the service is an
explicit nucleus entry point. ASR is the architectural mechanism that prevents
same-privilege code from executing privileged instructions or accessing
restricted CSRs despite its privilege mode.

## Delegation rules

A delegation is valid only if:

- it is derived from an existing authority;
- bounds and permissions do not increase;
- its object generation matches authoritative state;
- its operation class is allowed by the active policy version;
- the recipient is the intended service identity;
- any temporal limit or single-use condition is satisfied; and
- using it cannot mutate hardware-visible state without nucleus validation.

Delegation is explicit and auditable. Copying a capability may duplicate
software authority, so protocols must not rely on uniqueness unless uniqueness
is enforced by an additional linear, affine, or nucleus-managed state rule.

## Revocation and temporal authority

Sealing is not revocation. A sealed handle can remain valid after the
underlying resource should no longer be usable.

The authoritative revocation mechanism is generation invalidation:

1. stop affected vCPUs and capture any architectural capability state needed
   for bounded recovery;
2. mark the object unreclaimable and advance its generation;
3. entry points compare every handle and transaction with current generation;
4. hardware mappings and routes for the old generation are removed and
   invalidated;
5. device activity is drained and reset;
6. memory and tags are scrubbed as required; and
7. reclamation occurs only after the quiescence predicate holds.

Memory-sweeping revocation may remove stale in-memory capabilities, but the
security model must remain safe if copies persist until the sweep completes.
Tag clearing is effective only relative to principals that hold no superset
capability capable of rebuilding authority; the unit of revocation is
superset possession and generation validity, not an individual tag bit.

## Policy relationship

Policy decides which delegations may be created. Capabilities encode bounded
authority after that decision. The nucleus enforces:

- that the policy version is current;
- that the requested operation is within the delegated envelope;
- that object and resource generations match;
- that cross-resource invariants remain true; and
- that hardware mutation follows an atomic or fail-closed protocol.

This separates centrally administered policy from decentralized capability
use without treating either as sufficient alone.

## Core invariants

1. **Unforgeability:** no principal can create authority without derivation
   from a valid root or delegated authority.
2. **Monotonicity:** derivation cannot increase bounds, permissions, object
   classes, or operation classes.
3. **Generation validity:** every operation is rejected if any referenced
   object's generation differs from authoritative state.
4. **Unique physical ownership:** every allocatable physical extent has one
   authoritative owner or is free. Shared access is represented by
   owner-derived grants, never overlapping owners.
5. **Complete mediation:** only the nucleus can commit hardware-visible roots
   or ownership transitions.
6. **Correspondence:** every live hardware mapping, DMA translation, interrupt
   route, and vCPU binding is justified by a current authoritative object and
   delegation.
7. **No orphan authority:** destruction or reassignment invalidates every
   path by which the prior generation could affect the resource.
8. **Transactional mutation:** multi-subsystem changes either reach a valid
   committed state or remain isolated in a recoverable intermediate state.
9. **Confused-deputy resistance:** a service cannot substitute an object,
   generation, VM, device, or policy context supplied by another principal.
10. **Fail-closed recovery:** service crash, timeout, or malformed response
    cannot widen authority or leave a resource reusable while still reachable
    by an old owner.
11. **Authority-measurement binding:** an attestation statement identifies the
    code, configuration, policy version, and authority graph it describes.
12. **Assurance scoping:** a proof or test result applies only to its modeled
    component, interface, assumptions, and hardware semantics.

## Explicit non-goals

This model does not claim that CHERI:

- makes a compromised service semantically correct;
- provides general revocation without software support;
- constrains a device that consumes integer DMA addresses;
- replaces stage-2 translation, IOMMU, or interrupt virtualization;
- proves availability, timing isolation, or freedom from side channels;
- makes raw capability representations portable across migration; or
- extends an existing kernel proof automatically to modified CHERI code,
  user-space VMMs, firmware, compilers, or hardware.

The current RISC-V CHERI H integration is experimental and outside the v1
ratification package. The separate `Svyrg` extension in the v1 package applies
capability load/store barriers to first-stage S-mode and guest VS-mode
translation; RVY fields are not currently defined for G-stage PTEs. Guest use
is controlled through hypervisor state such as `hstatus.YRGE` and requires the
specified VS-stage invalidation when that interpretation changes.
Morello exposes different stage-2 capability controls, so a concrete
CHERI-native hypervisor security model is ISA-profile-specific.

## Research status

The model synthesizes established CHERI and virtualization mechanisms with
explicit architectural proposals. The invariants are candidate requirements
for falsification and formalization; they are not demonstrated properties of
an implemented CHERI hypervisor.
