# Durable analysis session packages

Real sessions live in this directory as:

```text
AWB-YYYYMMDD-NNN-short-name/
```

The date is the UTC allocation date, `NNN` is a repository-wide sequence for
that date regardless of slug, and `short-name` is a lowercase hyphenated slug.

Use `scripts/new-session.sh <short-name> <title>` rather than creating package
directories manually. Allocation is serialized by a short-lived
repository-local lock and refuses collisions with every existing
`sessions/AWB-YYYYMMDD-NNN-*` directory.

Add questions with `scripts/new-inquiry.sh <session-directory> <short-name>
<title>`. Each question becomes `inquiries/Q-NNN/` with its own comprehensive
report and condensed summary.

Every generated package starts with:

```text
Distribution: private
Intended distribution: private
Status: Draft
```

An untouched scaffold is valid only with:

```sh
bash scripts/validate-session.sh --draft sessions/AWB-YYYYMMDD-NNN-short-name
```

Default validation is completion validation. Promotion to `internal` or
`public-candidate` is a separate human-recorded action; neither classification
is publication, licensing, release, or sign-off approval.

Evidence, search, discovery, and activity records are intended to be
append-only. Structural validation cannot prove historical integrity by itself;
use `--baseline <prior-directory-or-git-ref>` when validating an updated
package.
