# @@TITLE@@ - Handoff

Session ID: `@@SESSION_ID@@`
Distribution: `private`
Created: `@@CREATED_DATE@@`
Status: `Draft`

## Overall position

A private draft session package has been scaffolded. No scope has been frozen,
no question has been opened, and no analysis has been performed.

## Frozen scope

Not yet frozen.

## Completed inquiries

| Inquiry ID | Question | Confidence | Report | Summary |
| --- | --- | --- | --- | --- |
| None | No question has been answered. | Not applicable | Not created | Not created |

## Outstanding open questions

| Open ID | Question | Blocking | Assumption in use |
| --- | --- | --- | --- |
| None | No open question has been recorded. | Not applicable | Not applicable |

## Validation

Not yet run.

```sh
bash ./scripts/validate-session.sh --draft sessions/@@SESSION_DIR@@
```

## Exact next action

Confirm the effective analysis scope with the user, then freeze it in
`session.md` and open `Q-001` with:

```sh
bash ./scripts/new-inquiry.sh sessions/@@SESSION_DIR@@ <short-name> <title>
```

## Activity log

| Activity ID | Date | Actor | Action | Result or limitation |
| --- | --- | --- | --- | --- |
| ACTIVITY-001 | @@CREATED_DATE@@ | Session scaffolder | Created the session handoff. | Analysis has not started. |
