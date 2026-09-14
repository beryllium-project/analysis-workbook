# Capability-to-Resource Correspondence

Session ID: `AWB-20260914-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Draft research model`

## Purpose

This document defines the correspondence obligation between CHERI-visible
software authority and hardware-visible virtualization state. It is a proposed
research model, not an implemented protocol or proof.

## State domains

Let the abstract state contain:

- `A`: principals, capabilities, sealed handles, and delegated operation
  envelopes;
- `O`: typed objects, owners, generations, and lifecycle states;
- `M`: physical pages, stage-2 roots and entries, permissions, and required
  translation invalidations;
- `D`: devices, IOMMU domains and entries, queues, reset state, and outstanding
  DMA;
- `I`: physical interrupt ownership, routes, virtual endpoints, pending state,
  and acknowledgments;
- `C`: physical CPUs, vCPUs, architectural capability state, scheduling
  bindings, guest CHERI enable state, `hstatus.YRGE`, and stop/quiescence
  state;
- `P`: policy versions, labels, rules, and delegation decisions; and
- `T`: measurements, manifests, code identities, and attestation keys.

No one state domain is a complete security model. Safety depends on relations
between them.

## Correspondence relations

### Memory

For every live stage-2 mapping from VM `v` generation `g` to physical extent
`p`:

- `O` records `p` as owned by `(v, g)`;
- or `O` records one owner plus a current owner-derived grant to `(v, g)`;
- `A` contains a current delegation permitting the requested access;
- the stage-2 permissions are no greater than the delegation;
- no incompatible live owner, grant, or permission-increasing alias exists;
- any page-table memory is inaccessible to unauthorized services; and
- required invalidations complete before the old mapping can be relied on as
  absent.

For current RISC-V CHERI, `Svyrg` can support first-stage S-mode and VS-mode
capability load/store barriers but does not define equivalent G-stage RVY PTE
fields. Morello
provides different stage-2 capability controls. The model must therefore bind
its memory correspondence rules to an explicit ISA profile.

### DMA

For every live IOMMU mapping from device domain `d` to physical extent `p`:

- `O` records the device and the owner or valid grant for `p` under the
  current VM generation;
- `A` authorizes the device/DMA service to request that exact mapping;
- `D` records the same ownership and permission envelope;
- CPU and DMA views do not create a permission-increasing alias; and
- unmap, drain, reset, and invalidation complete before `p` is reassigned.

A CHERI capability passed to a driver is not evidence that the device is
confined. The IOMMU relation is mandatory where DMA is possible.

Distinct device contexts must not reuse one GSCID for different G-stage roots.
The old DMA space remains authoritative until all required device-context and
translation invalidations have completed; during the invalidation window the
hardware may use old or new cached state.

### Interrupts

For every physical interrupt source routed to a virtual endpoint:

- `O` records the source and endpoint under the same current owner;
- `A` authorizes route creation and injection for the named identity;
- `I` contains no conflicting live route;
- the scheduler cannot invent interrupt authority; and
- the interrupt service cannot gain scheduling or guest-memory authority.

Virtual-hart migration must update MSI translations and synchronize IOMMUs and
interrupt controllers before execution resumes, so straggler interrupts
cannot reach a reassigned physical interrupt file.

### vCPU state

For every runnable vCPU:

- its VM generation is current;
- its architectural capability registers belong to that VM state object;
- its execution binding is authorized by the scheduler delegation;
- no stale vCPU instance can re-enter after stop or generation invalidation;
  and
- save/restore preserves architectural validity without treating saved bits as
  transferable authority outside the compatible execution environment.

### Devices and MMIO

For every MMIO capability or mapping:

- bounds and permissions reflect the reviewed register subrange;
- side-effect-equivalent aliases are included in the same authority analysis;
- reset, firmware, security-control, and DMA-programming registers remain
  separately authorized; and
- the hardware page-granularity mapping does not silently widen the
  capability-level register authority.

### Policy and attestation

For every delegated authority:

- `P` identifies the policy version that allowed it;
- a policy update either preserves the delegation or triggers explicit
  invalidation;
- `T` identifies the measured code and manifests responsible for enforcement;
  and
- attestation never reports a stronger authority graph or lifecycle state than
  the nucleus can establish.

### Walker and tag-storage integrity

Page-table walkers may perform implicit accesses outside ordinary CHERI checks.
Page-table memory, tag storage, and paths to the tag cache are therefore
explicit hardware ownership objects. Guests, DMA, and non-nucleus services
must not be able to modify them outside validated transactions.

## Transaction protocol

A cross-domain change proceeds through:

1. **Prepare:** services construct immutable candidate descriptions.
2. **Validate:** the nucleus checks capability authority, generations, policy,
   ownership, permissions, aliases, and required side effects.
3. **Quiesce:** affected vCPUs, DMA, and interrupt delivery are stopped or
   placed in a state that cannot access changing resources.
4. **Commit:** hardware-visible state and authoritative ownership move through
   a defined order.
5. **Invalidate:** translation and routing caches are invalidated with required
   completion and ordering, including `HFENCE.GVMA`, `HFENCE.VVMA`, device
   context invalidation, IOMMU translation invalidation, and interrupt-source
   synchronization where the selected architecture requires them.
6. **Publish:** new handles become usable only after the committed state is
   complete.
7. **Recover:** failures either restore the prior valid state or continue
   forced teardown without re-exposing the resource.

The protocol must define a durable commit point. Returning an error is not
rollback if hardware or ownership state has already changed.

## Required derived predicates

- `authorized(op, principal, object, generation, policy)`
- `owns(object, resource, generation)`
- `granted(owner, grantee, resource, permissions, generation)`
- `mapped_cpu(vm, resource, permissions, generation)`
- `mapped_dma(domain, resource, permissions, generation)`
- `routed_irq(source, endpoint, generation)`
- `bound_vcpu(cpu, vcpu, generation)`
- `quiescent(resource, generation)`
- `reclaimable(resource)`
- `measured(authority_graph, policy, code)`

`reclaimable(resource)` requires absence of old CPU mappings, DMA mappings,
interrupt routes, executing vCPUs, outstanding device transactions, and usable
old-generation entry paths.

## Candidate safety properties

1. **Authority soundness:** every successful hardware mutation has a valid
   authorizing derivation in `A`.
2. **Enforcement completeness:** every usable resource path represented in
   `M`, `D`, `I`, or `C` has a corresponding current object in `O`.
3. **No cross-generation access:** a principal or device from generation `g`
   cannot affect a resource after it is assigned to generation `g+1`.
4. **Permission non-amplification:** hardware permissions never exceed the
   conjunction of policy and delegated capability permissions.
5. **Isolation-preserving failure:** interruption at any transaction step
   cannot create simultaneous incompatible owners.
6. **Recovery convergence:** repeated recovery or forced-teardown steps
   converge to one valid committed state rather than oscillating or widening
   authority.
7. **Attestation accuracy:** signed state is no newer than the measurements and
   no stronger than the established correspondence relations.
8. **Identifier injectivity:** VMIDs, GSCIDs, device contexts, and interrupt
   identities are not reused for incompatible live roots or owners.
9. **Walker integrity:** every translation walker and tag-storage access path
   is confined by physical ownership even when ordinary capability checks do
   not apply.
10. **Grant lifetime:** every shared mapping or delegated DMA path is bounded
    by the granting owner's current generation and permissions.

## Falsification targets

The model is falsified by any trace in which:

- a stale sealed handle authorizes a new-generation resource;
- a page is reassigned while an old CPU or DMA translation remains usable;
- a service can substitute another VM's object into an otherwise authorized
  request;
- an interrupt identity can be injected without ownership of its source or
  endpoint;
- a failed transaction returns success-shaped state while only some hardware
  roots changed;
- device reset or queue draining is assumed rather than evidenced;
- a policy update narrows authority but old delegations remain usable;
- migration reconstructs capabilities with broader authority than the source
  semantic object; or
- an attestation signs a configuration whose authority graph cannot be
  reconstructed from measured manifests and current nucleus state.

## Formalization split

- Use a small transition system to model `O`, generations, lifecycle, and
  atomic cross-domain transactions.
- Use capability-machine or ISA models for unforgeability, monotonicity, bounds,
  permissions, sealing, and architectural state.
- Use refinement proofs for page-table/IOMMU builders and nucleus commit code.
- Use information-flow or noninterference arguments for cross-VM and
  cross-service confidentiality and integrity.
- Use model checking and fault injection for lifecycle interleavings,
  invalidation ordering, crashes, retries, and recovery.

No single proof layer should be reported as whole-system assurance.
