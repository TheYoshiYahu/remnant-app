# S212 — open prompt (short)

Load `yoshi-voice` first. Mount `~/Desktop/App`.
(Sibling task `S213` = the chronological chapter weave. This one — the Gospel
cross-references — runs first.)

## Primary task — fill the missing Gospel cross-references
All four Gospels have SOME cross-reference coverage, but Yoshi knows a LOT is
missing. Audit every Gospel chapter and author the gaps — the verse ↔ library
connections that should be there and aren't. This is the chapter-end
cross-reference card (the ChapterEndCard / xref apparatus), per
`api/CHAPTER_END_CARD_CONTRACT.md`.

Existing baseline (in `data-schema/migrations/`):
- Matthew — `session110_matthew_cross_references.sql` + the per-chapter
  `session131…156_matt_N_extras_cross_references.sql` series (ch 1–28). Most
  covered, but still audit for gaps.
- Mark — `session183_mark_xref_members_and_threads.sql`.
- Luke — `session185_luke_xref_members_and_threads.sql`.
- John — `session181_john_xref_threads.sql` + `session194_john_2_7_9_16_xref_threads.sql`.
- Audit helper: `data-schema/migrations/_xref_audit.py`.

Method: for each Gospel chapter, read the text
(`source-texts/parsed/canon.json`), check current coverage, and author the
missing threads/members. Cross-references are **bidirectional across the FULL
restored library** (canon + Apocrypha + 1 Enoch + Jubilees + Jasher +
Testaments XII + Sonnini, etc., per voice skill §"Cross-references draw from
the full restored library"). Come-and-see posture: quote in full, stand-alone
italics; no appendix; curated + framework-bearing rows only (NOT the TSK
comprehensive baseline — that rolled back at S75).

## Parallelize — minions per Gospel chapter-range
Dispatch subagents (Task tool). Each: (1) loads `yoshi-voice` and reads
`api/CHAPTER_END_CARD_CONTRACT.md` + one existing xref migration as the SQL
format template; (2) owns ONE bounded range — e.g. "Matthew 5–7 (Sermon on
the Mount)", "John 1", "Luke 15", "Mark 1–4"; (3) reads the chapter text and
the current coverage; (4) returns ONLY the missing threads/members as SQL
`INSERT`s following the contract. Orchestrator assembles into one migration
per Gospel (or per range), dedups thread-keys, applies. Smaller ranges =
tighter context, fewer collisions.

## Locked / keep
- Thread keys / data slugs use conventional ENGLISH book-name fragments
  (voice skill), never Hebrew — `isaiah-53-suffering-servant`, not
  `yeshayahu-53-…`.
- Extras in a thread are quoted in full inside `summary_md` per the
  canon-edition member-row scoping (S181/S183 precedent: extras quoted, not
  inserted as member rows) — UNLESS the latest `CHAPTER_END_CARD_CONTRACT.md`
  now supports extras anchors; check it first.
- Don't disturb the chapter-end stack order set in S211: xref → Witness →
  Kingdom → pills → commentary.

## State / carryover
- S210 LANDED: Esdras→Ezra dual-label rename; commentary moved to end of stack.
- S211 LANDED: verse-pills reorder + ArrangedReading chronological overlay.
- Git push + DB migrations only from Yoshi's Mac Terminal (sandbox .git is
  read-only; no DB egress). Apply xref migrations:
  `python3 api/apply_migration.py data-schema/migrations/<file>.sql`
  (Render IP allowlist must include the current IP — re-add at the dashboard
  if "connection closed mid-operation").
- This is data-only; no UI change expected. If anything in `app/` is touched,
  `cd app && npx tsc -b`.

## Verify before close
Run `_xref_audit.py` (or spot-check) for coverage; confirm no duplicate
thread-keys; apply migrations clean; eyeball a few Gospel chapters in the
reader (Render) that the new cross-references render in the chapter-end card.
