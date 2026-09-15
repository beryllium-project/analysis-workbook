# What Is the Demonstrated Maturity? - Summary

Session ID: `AWB-20260914-001`
Inquiry ID: `Q-002`
Distribution: `private`
Created: `2026-09-14`
Status: `Complete`
Topic: Literature, project, product, and community maturity
Confidence: High

The condensed document. It must stand alone for a reader who has not read the
report, and it must not introduce a claim that is absent from the report.

Full analysis: [report.md](report.md)

## Question

What maturity is demonstrated by the qualifying systems?

## Answer

**NOVA, Hedron, and L4Re** have the strongest current project or offering
maturity. NOVA also has active formal-specification and proof work; Hedron is
used in a commercial platform; L4Re is professionally supported and listed by
an industry partner. **CAP-VMs/ORC** are strong peer-reviewed research
prototypes. **Bao-CHERI** remains poster-level without a located artifact, and
**CheriBSD/bhyve** remains experimental CHERI-aware virtualization. No
shipping CHERI-secured hypervisor product was established.

## Confidence

High, except Medium for the product-wide negative.

## Load-bearing evidence

The two or three items the answer actually rests on.

| Evidence ID | What it shows | Locator |
| --- | --- | --- |
| AWB-20260914-001-E0012 | NOVA has active 2026 development and public formal-verification work. | NOVA and BlueRock primary records |
| AWB-20260914-001-E0014 | L4Re is current, supported, and offered for industry platforms. | L4Re, Kernkonzept, and ST records |
| AWB-20260914-001-E0016 | Bao-CHERI lacks a located implementation artifact. | Summit abstract and Bao upstream |

## Open questions

The questions that would most change this answer.

| Open ID | Question | Blocking |
| --- | --- | --- |
| OPEN-003 | What does the candidate post-March-2016 cap-talk continuation contain about CHERI and capability virtualization? | No |

## Limitations

No outreach or private product evidence was used. A public candidate cap-talk
group path is identified, but continuity, coverage, and content remain
unreviewed. This limits exhaustive modern community-history claims, not the
main maturity position.

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | 2026-09-14 | Inquiry scaffolder | Created the summary. | Initial scaffold created. |
| ACTIVITY-002 | 2026-09-14 | Analysis orchestrator | Completed the standalone maturity summary. | Matches the report. |
| ACTIVITY-003 | 2026-09-15 | Analysis orchestrator | Updated the cap-talk limitation after the public access check. | OPEN-003 supersedes OPEN-001; the technical maturity answer is unchanged. |
