# S193 — Four-Gospel Cross-Reference Audit Findings

**Date:** 2026-06-03
**Scope:** Chapter-anchoring + template-bleed audit across all four gospels' cross-reference
migrations. Method: static parse of the migration SQL (no live DB), verifying every NEW thread's
anchor against its member rows, and scanning all member-note text for duplicated (template-bled)
content. Reproducible via `App/data-schema/migrations/_xref_audit.py`.

---

## Verdict: CLEAN

All four gospels clear the same bar Matthew's S110 layer cleared. The cross-reference layer is
chapter-anchored at the SQL level, and there is no template bleed — no chapter's teaching is
copy-pasted boilerplate masquerading as another chapter's distinct content.

---

## Counts (verified against raw SQL — `INSERT INTO cross_reference_threads` count matches parse)

| Gospel  | Migration(s)                                   | NEW threads | Single-chapter-anchored | Spanning | Member rows |
|---------|------------------------------------------------|-------------|-------------------------|----------|-------------|
| Matthew | session131–156 `*_matt_*_extras_cross_references.sql` | 178         | 177                     | 1        | 630         |
| Mark    | session183 `mark_xref_members_and_threads.sql` | 15          | 14                      | 1        | 473         |
| Luke    | session185 `luke_xref_members_and_threads.sql` | 35          | 35                      | 0        | 405         |
| John    | session181 `john_xref_threads.sql`             | 16          | 16                      | 0        | 169         |
| **Total** |                                              | **244**     | **242**                 | **2**    | **~1,677**  |

(Member-row totals are the parser's note-literal coverage; small deltas vs. the migration headers'
"input row" counts are non-note tuples and sub-40-char rows the parser intentionally skips. The
bleed conclusion is unaffected — every explanatory member note above 40 chars is captured.)

## The two spanning threads — proven genuine, not bleed

Only two NEW threads anchor across more than one chapter, and both have fully distinct,
chapter-specific member rows (no duplicated notes):

- **Matthew** — `matthean-yoseph-and-the-patriarch-yoseph` (Matt 1 → 2), 3 members, all DISTINCT.
- **Mark** — `unclean-spirits-recognize-the-holy-one-of-elohim` (Mark 1 → 3), 5 members, all DISTINCT.

These are the gospel equivalents of Matthew's S110 "FM" spanning threads: the anchor legitimately
covers a multi-chapter movement, and each member row carries its own chapter-specific content.

## Template-bleed scan

Across all ~1,677 member rows, **zero duplicated explanatory notes**. The only exact-duplicate
strings are three bare one-line proof-text citations, all 61–77 characters — a quote plus a
reference, not a templated teaching paragraph:

1. `*They shall look upon me whom they have pierced* (Zechariah 12:10).` — cited in two different
   threads (`first-passion-prediction…` and `like-the-son-of-adam-coming-with-the-clouds`). Same
   proof-text legitimately serving two distinct threads via different source verses. Defensible;
   optional dedup if a single canonical home is wanted.
2. `*Fear thou not; for I am with thee* (Isaiah 41:10).` — twice within one thread. Benign.
3. `*I will also give thee for a light to the Gentiles* (Isaiah 49:6).` — twice within one thread. Benign.

None of these are the failure mode the audit guards against (a multi-chapter thread whose
per-chapter member rows are identical copy-paste).

## API-layer confirmation

The chapter-end-card endpoint (`api/main.py`, the `thread_member_rows` query) selects threads for a
chapter page by **member source verse** — `WHERE sv.chapter_id = $1` — not by the thread's anchor.
This confirms the SQL-layer expectation:

- A chapter's card surfaces exactly the threads whose member **source** verses live in that chapter.
- Matt 6's seven extras threads (sort 217–223) all have source verses in Matt 6, so they render on
  the Matt 6 card and nowhere else.
- The Mark/Luke "bulk member-additions to existing threads" attach recurring-theme threads (e.g.
  `scattered-seed-gathering`, `lost-sheep-mission-scope`) at specific chapters — by design, they
  surface on those chapters' cards. This is correct behavior, not bleed, because each attachment
  carries its own distinct member note.

A live JSON render was not produced this session — it requires a running Postgres with the seeded
corpus, which isn't available here. The contract was confirmed statically against the migration
structure.

## Open item carried forward

- **§0 already-shipped check vs v1.0.9** could not be run: `REMNANT_STUDY_BIBLE_SPEC.md` was an
  S192 scratch output and did not survive into this session (not on Desktop). Re-supply the spec
  (or its location) to close this.
