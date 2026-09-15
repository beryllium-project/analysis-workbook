# Smdbltrp consideration and coverage gaps - Summary

Session ID: `AWB-20260915-001`
Inquiry ID: `Q-001`
Distribution: `private`
Created: `2026-09-15`
Status: `Complete`
Topic: Smdbltrp and Ssdbltrp consideration across Beryllium and Helium
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

Has Beryllium, including Helium, considered the RISC-V double-trap
extensions across review, analysis, planning, and threat modeling?

## Answer

**The underlying hazard has been considered, but the named ISA mechanisms have
not been explicitly considered in the checked project corpus.** Beryllium has a
software nested-trap defense and generic optional-state fail-closed planning;
Helium explicitly assumes no nesting, carries several agent-produced
nested/fault-on-fault review findings, and retains the issue as a fixed-scope
non-goal; threat models analyze the same hazard. No located authored record names, evaluates, or
dispositions either ratified extension.

The terminology also needs correction: `Smdbltrp` is the M-mode extension.
`Ssdbltrp` is the extension relevant to S, HS, and VS double traps. The
ratified v1.0 specification was published on 2024-08-23, before the 2026
Beryllium and Helium artifacts, so the omission is not explained by the
extension being newer than the work.

## Confidence

High for the bounded corpus conclusion and terminology correction. Confidence
is lower on target applicability because hardware and firmware support remain
unknown and no target execution was approved.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260915-001-E0017 | Ratified v1.0 separates M-mode Smdbltrp from lower-privilege Ssdbltrp and predates the project artifacts. | RISC-V Double Trap Extensions v1.0 |
| AWB-20260915-001-E0004 | Beryllium explicitly defends a nested or partial HS trap in software without naming the extension. | component://beryllium-repo/.../arch/riscv/be/r5-trap.S |
| AWB-20260915-001-E0006 | Helium explicitly assumes the direct trap handler is not nested and does not promote that assumption into a proof claim. | component://helium-te-poc/docs/security-and-limits.md |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-001 | Does the intended K3/X100 hardware and firmware implement and enable either extension? | No |
| OPEN-002 | Should a future Beryllium review explicitly classify each extension as used, deferred, verified, or unsupported? | No |

## Limitations

Negative findings are bounded to the enumerated files, revisions, histories,
and indexes. The current Beryllium checkout is dirty and its substantive
observed tree is an untracked nested checkout. No hardware or firmware
capability evidence was produced. Private and not-approved local evidence
prevents current promotion to `public-candidate`.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-15 | Inquiry scaffolder | Created the summary. | Initial scaffold preceded the completed summary below. |
| ACTIVITY-002 | 2026-09-15 | Analysis orchestrator | Completed the standalone summary from the report. | No claim exceeds the report or component assurance boundaries. |
