# S213 — open prompt (short)

Load `yoshi-voice` first. Mount `~/Desktop/App`.
(Sibling task `S212` = fill the missing Gospel cross-references; that one
likely runs first. This one is the chronological weave.)

## Primary task — weave the chronological order chapter-by-chapter (event order)
The draft is still whole-book blocks in the OT (Isaiah whole, Jeremiah
whole, Psalms whole, Kings/Chronicles as blocks). Yoshi does NOT like that.
He wants a TRUE event-order weave: the prophets dropped into the reigns they
spoke under, Chronicles interleaved with Samuel/Kings, Psalms placed at their
occasions. Chapter-level is the floor; set up to go verse-level next.

Source of truth: `_s211_build_chronological_order.py` → the `SEGMENTS` list
(era → ordered `(edition, book, ch_start, ch_end, note)` segments; ch_end
None = through last). Edit SEGMENTS, then
`python3 _s211_build_chronological_order.py` regenerates
`app/src/data/chronological-reading.json` + `CHRONOLOGICAL_READING_PLAN_DRAFT.md`.
The reader overlay (`app/src/components/ArrangedReading.tsx`) reads the JSON —
**no UI change needed for order edits.** The generator validates that all
1189 canon chapters stay present, unique, no dups/missing — keep that green.

Already done, LEAVE: Act IX (Gospels harmony) and Act X (Acts + letters
woven) are already chapter-level. Acts I–IV are fine.
NEEDS WEAVING: Act V (Chronicles + Psalms into Samuel/Kings), Act VI (the
prophets into the Kings/Chronicles narrative, chapter by chapter), Acts
VII–VIII.

## Parallelize — minions per SECTION of an act
Dispatch subagents (Task tool). Each one: (1) loads `yoshi-voice`; (2) owns
ONE bounded section — e.g. "David's rise: 1 Samuel + the flight psalms",
"Solomon", "the 8th-century prophets into 2 Kings", "the fall of Judah:
Jeremiah/Lamentations into 2 Kings 22–25 + 2 Chron 34–36"; (3) reads the
actual text (`source-texts/parsed/canon.json` + the extras JSONs) to place
chapters in event order; (4) returns ONLY its section's ordered `SEGMENTS`
tuples (chapter-level, with short notes + any verse-weave markers). The
orchestrator stitches the sections back into `SEGMENTS` in order, re-runs the
generator, confirms the canon-integrity check passes. Sections, not whole
acts — smaller = tighter context, fewer collisions.

## Locked decisions / keep
- Top label = "Act"; sub-groupings = "plans". Sellable plans are an
  AFTERTHOUGHT — defer; do not build the store/pricing now.
- Order BY EVENT. Extras = the scripture-level library only (Enoch, Jubilees,
  Jasher, Apocrypha, Adam&Eve, Apoc. of Abraham, Ascension of Isaiah,
  Testaments XII, 2 Enoch, 2/3 Baruch, Sonnini Acts 29). Josephus, Apostolic
  Fathers, M.R. James are EXCLUDED (one-way historical witnesses).
- Verse-weave fork: powered by Yoshi's cross-reference threads (the existing
  apparatus), NOT a Claude-invented merged text. Each woven verse carries a
  placement: `lead-in` (before) or `witness` (after).
- Queued verse-weave seed: Genesis 3 ↔ 1 Enoch 69:10 (Gadreel led Eve astray;
  placement = lead-in). Restoration catch: `tannin → dragon` (Aaron's rod,
  Exo 7:9/10/12 — H8577), distinct from `nachash → serpent/snake` (Moses' rod
  Exo 4:3, Gen 3 — H5175). Both confirmed in the tagged Hebrew (TAHOT).

## State / carryover
- S210 LANDED: Esdras→Ezra dual-label ("3 Ezra (also called 1 Esdras)" /
  "4 Ezra (also called 2 Esdras)"), migration `session210_*` applied;
  commentary moved to end of chapter stack.
- S211 LANDED (pushed, `eb313d3..3c15060`): verse-pills strip moved below the
  cards (order now xref → Witness → Kingdom → pills → commentary); the
  ArrangedReading overlay + `chronological-reading.json` are live; the
  generator + design docs are committed. Render auto-deploys — confirm the
  "Arranged reading" button shows in the reader.
- Git push + DB migrations only work from Yoshi's Mac Terminal (sandbox .git
  is read-only; sandbox has no DB egress). Migrations:
  `python3 api/apply_migration.py <file>` (Render IP allowlist must include
  the current IP — re-add at dashboard if "connection closed mid-operation").
- Design docs: `CHRONOLOGICAL_READING_SPEC.md` (3-layer architecture +
  verse-weave), `CHRONOLOGICAL_READING_PLAN_DRAFT.md` (redline view),
  `STUDY_PLAN_CATALOG_DRAFT.md`.

## Verify before close
Re-run the generator (canon integrity green), `cd app && npx tsc -b`, then
Yoshi eyeballs ArrangedReading on Render after push.
