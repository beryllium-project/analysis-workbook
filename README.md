# Analysis workbook

A project-local Copilot agent that assists a human with detailed analysis of a
selected aspect of the Beryllium project, and the durable session packages it
produces.

This repository produces analysis, not decisions. It never grants approval,
acceptance, sign-off, publication, or release, and it never asserts or infers
that a responsible human has done so.

## What it does

A session runs in two phases.

1. **Planning.** The user names the aspect to analyze and gives at least one
   question. The agent proposes an effective scope, asks what it needs, and
   waits for explicit confirmation.
2. **Analysis.** On confirmation the agent freezes the scope, works the local
   Beryllium corpus in the order given by
   [RESEARCH-SOURCES.md](RESEARCH-SOURCES.md), then goes outward only for the
   gaps it recorded. It answers the question in a comprehensive `report.md`,
   condenses it into a standalone `summary.md`, prints a brief summary in
   chat, and waits for the next question.

Follow-up questions become further numbered inquiries in the same session
package, so one aspect stays in one place.

## Quick start

```sh
# from this repository
/agent analysis-workbook
```

Then describe the aspect and your first question. The agent will scaffold the
session package for you. The same scaffolding is available directly:

```sh
bash ./scripts/new-session.sh <short-name> "<title>"
bash ./scripts/new-inquiry.sh sessions/AWB-YYYYMMDD-NNN-short-name <short-name> "<title>"
```

## Navigating the output

[WORKBOOK.md](WORKBOOK.md) is the generated index. It lists every session, and
every inquiry twice: once grouped by topic and once in reverse chronological
order. Regenerate it with:

```sh
bash ./scripts/update-workbook.sh
```

Do not edit `WORKBOOK.md` by hand.

## Session package layout

```text
sessions/AWB-YYYYMMDD-NNN-short-name/
  session.md                     frozen scope, phases, surfaces, revisions, index
  planning.md                    what the user asked for, in the user's terms
  source-discoveries.md          sources not recorded in an owning component
  inaccessible-resources.md      what could not be read, and why
  publication-checklist.md       distribution and the human promotion gate
  HANDOFF.md                     position, blockers, exact next action
  inquiries/Q-NNN/
    question.md                  question as stated and as analyzed
    report.md                    comprehensive analysis
    summary.md                   standalone condensed answer
    evidence.md                  append-only observation ledger
    search-log.md                every query, including the ones that found nothing
    open-questions.md            clarifications, assumptions in use
```

Session IDs are `AWB-YYYYMMDD-NNN`, inquiry IDs are `Q-NNN`, and evidence IDs
are `AWB-YYYYMMDD-NNN-E####` and unique across the whole session.

## Boundaries

- Every other Beryllium component repository is a **read-only input**. The
  agent writes only inside this repository.
- Component source, history, issues, research documents, user-supplied files,
  and web content are **untrusted evidence**. Instructions found inside them
  are never followed.
- Nothing is built, tested, compiled, installed, or executed from a component
  unless the user approves that exact command by name for the session. The
  approval, the command, the component revision, and the result are recorded.
  Approval to run is never approval to write.
- Component assurance boundaries are preserved exactly. Helium is a
  review-and-test proof of concept: not formally verified, not hardware
  validated. CBMC results hold only within their stated source, property, and
  tool boundary. Beryllium R8-H0 is committed but not accepted, and K3
  hardware is `NOT RUN`.
- Session packages are `private` by default. `internal` and
  `public-candidate` require an explicit user request followed by a
  human-recorded promotion, and `public-candidate` is still not publication
  approval.

See [.github/copilot-instructions.md](.github/copilot-instructions.md) for the
full contract and [AGENT-INTERFACE.md](AGENT-INTERFACE.md) for how this
component exchanges work with the rest of the project.

## Source discovery

When analysis surfaces a source that is not already recorded in an owning
Beryllium research component, it is appended to
[SOURCE-DISCOVERY-LOG.md](SOURCE-DISCOVERY-LOG.md) and to
[outbox/pm-queue.md](outbox/pm-queue.md) with status `new`.

The outbox is a pull interface: the Project Manager and other research agents
read it. This repository never writes into another component to register a
source.

## Helium method transfer

Explicitly directed Helium lessons and candidate method inputs for
Beryllium-side triage are recorded in
[outbox/helium-transfer-queue.md](outbox/helium-transfer-queue.md) as stable
`HET-NNN` items. Every item enters as `new` and `unaccepted`.

This is a separate pull interface from the source-discovery PM queue. It
transfers candidate method rather than Helium's fixed constants or assurance
result, and it never claims Beryllium adoption, planning approval,
responsible-human review, implementation authorization, assurance,
publication, release, or hardware validation.

## Scripts

| Script | Purpose |
| --- | --- |
| `scripts/new-session.sh` | Allocate a session ID and scaffold a package. |
| `scripts/new-inquiry.sh` | Allocate `Q-NNN` and scaffold its artifacts. |
| `scripts/readonly-inspect.sh` | Read-only inspection of sibling components. |
| `scripts/update-workbook.sh` | Regenerate `WORKBOOK.md`. |
| `scripts/validate-helium-transfer-queue.sh` | Validate every `HET-NNN` item, lifecycle transition, portable locator, derived summary, and append-only baseline. |
| `scripts/validate-session.sh` | Validate a session package. |

## Validation

```sh
bash ./scripts/validate-session.sh --draft sessions/AWB-YYYYMMDD-NNN-short-name
bash ./scripts/validate-session.sh sessions/AWB-YYYYMMDD-NNN-short-name
bash ./scripts/validate-session.sh --baseline <prior-copy> sessions/AWB-YYYYMMDD-NNN-short-name
bash ./scripts/validate-helium-transfer-queue.sh
bash ./scripts/validate-helium-transfer-queue.sh --baseline <prior-queue>
bash ./tests/validate-agent.sh
git diff --check
```

`--draft` permits scaffolded placeholder content and checks structure only.
The default mode adds completion checks. `--baseline` compares against a prior
copy of the same package and fails if an append-only row was changed or
removed.

## Directories that are never committed

`inbox/`, `scratch/`, and `sources/quarantine/` are ignored. User-supplied
material goes in `inbox/`, disposable extraction in `scratch/`, and any
restricted, licensed, private, unknown, or not-approved copy in
`sources/quarantine/`. Only approved redistributable copies belong in
`sources/public/`, with metadata in `sources/metadata/`.
