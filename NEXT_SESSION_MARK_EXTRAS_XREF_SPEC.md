# Next session — MARK: THE EXTRACANONICAL CROSS-REFERENCE PASS (Yoshi's call, S205 close)

## The mandate (Yoshi, verbatim — transcribed)
"Next session we need to go back over Mark, Luke and John for all
extra canonical cross references... we can only handle one book at a
time so let's go with Mark."

ONE BOOK AT A TIME. This session: **Mark only.** Luke and John follow
in their own sessions, same method, after Mark's pass is signed off.

## What it is
Walk Mark chapter by chapter against the FULL restored extras library
and surface every cross-reference where an extracanonical scripture
illuminates, sources, or parallels the text — the bidirectional
scripture-level rule from the voice skill: all-of-the-library ↔
all-of-the-library. When 1 Enoch illuminates a Mark passage, both get
quoted in stand-alone italics next to each other. Come and see; the
reader goes nowhere.

## The library to sweep against (scripture-level texts only)
1 Enoch · Jubilees · Jasher · the restored Apocrypha (1-2 Maccabees,
Tobit, Judith, Wisdom of Solomon, Sirach, Baruch, Susanna, Bel and
the Dragon, Prayer of Manasseh, 1-2 Esdras as published) ·
Adam and Eve (Conflict) · Apocalypse of Abraham · Ascension of
Isaiah · Testaments of the Twelve Patriarchs · Sonnini's Acts of
Paul · Havoth · Shamayim · Cepher additions — whatever is actually
loaded at scripture level in the app's editions. Inventory at session
open: check the editions/books tables and
~/Desktop/App/source-texts/ + existing-restored-editions for what is
live vs. parked. Historical witnesses (Josephus, Apostolic Fathers,
M.R. James) stay OUT per the one-way deferred rule in the skill.

## Known starting threads for Mark (floor, not ceiling — the sweep hunts)
- Mark 13 (the Olivet discourse) ↔ 1 Enoch's coming-of-the-Elect-One
  and tribulation fabric; 1 Enoch 62 (kings and mighty seeing the
  Son of Adam enthroned) beside Mark 13:26/14:62 — CAREFUL: 14:62 is
  Witness-marked (kaph card); the xref apparatus is a separate
  surface, no conflict, but don't duplicate the Witness card's work.
- Mark 1:13 (with the wild beasts; angels ministered) ↔ Adam-and-Eve
  and Jubilees wilderness/temptation fabric; Mark 1:2-3's wilderness
  voice ↔ extras where they carry it.
- Mark 4 harvest/sower ↔ 1 Enoch 62:8 (the congregation of the elect
  sown); 4 Ezra's sowing parables if 2 Esdras is live at scripture
  level.
- Mark 6:7-13 (sending of the twelve) ↔ Testaments of the Twelve
  Patriarchs' tribal last-words fabric where it carries.
- Mark 9 transfiguration / Elijah ↔ Jasher and 1 Enoch ascension
  fabric; Mark 9:48's worm-and-fire ↔ Judith 16:17 + Sirach 7:17.
- Mark 12:25 (as the angels) ↔ 1 Enoch 15 (the Watchers' violation
  of that order — the inverse witness); handle on the skill's rails.
- Wisdom of Solomon 2:12-20 (the righteous one condemned to a
  shameful death, claiming Elohim (God) as father) ↔ the passion
  chapters (Mark 14-15) — the extras' clearest passion fabric.
- Sirach's teaching fabric beside Mark's teaching strand where the
  sayings genuinely source or parallel.

## Which surface carries it (open question #1 for Yoshi at session open)
Options, not yet decided — ASK FIRST:
a) The existing cross-reference apparatus (cross_reference_threads /
   per-verse xrefs per api/CHAPTER_END_CARD_CONTRACT.md — read that
   contract file in full before building). Extras already have a cite
   register: argaman. The chapter-end card already renders threads.
b) Kingdom cards (extras quoted as sources — the nothing-new engine
   reaching the extras, wave 4 of the Kingdom).
c) Witness extras (1 Enoch 46-71 wave 2 per the S204 backlog).
Lean: (a) for the general illumination pass, with (b)/(c) entries
spun off where a find passes those overlays' engines. One find can
land in multiple surfaces; the xref apparatus is the catch-all.

## Other open questions for Yoshi at session open
2. Density: every legitimate parallel, or curated strongest-only?
   (The skill's posture: curated and framework-bearing — the S75 TSK
   rollback precedent says comprehensive-baseline was rejected once.)
3. Do extras-side verses get marked/linked back (bidirectional rows)
   in the same pass, or Mark-side first and the reverse direction in
   the extras' own future passes?
4. Tier: xref threads currently follow existing tier rules — extras
   threads same, or free?

## Method (locked by S205's lesson — concordance/inventory FIRST)
1. Inventory the live extras library (DB + source-texts).
2. Yoshi answers the open questions.
3. Chapter-walk minions: Mark 1-16 against the library, each minion
   loaded with the voice skill IN FULL + the hidden-passage hunting
   discipline (S205 build notes carry it) + the taken/existing-thread
   inventory so nothing duplicates.
4. Checker minion gates EVERY entry: Red Lines #11/#12 (1 Enoch's Son
   of Adam material is title-naming, NOT the kaph-comparative — the
   distinction is in Red Line #12), checklist 10, quote-don't-cite,
   sacred names, claim integrity, victims-not-enemies.
5. Proof render of ONE thread before schema/wiring if a new surface
   is needed; if riding the existing apparatus, load via the existing
   contract. Loader from the Mac, dry-run first.

## Hard constraints (unchanged)
- tsc -b / npm run build in ~/Desktop/App/app (package.json in app/,
  NOT repo root).
- Commit/push/delete from the Mac ONLY. Terminal blocks: COMMANDS
  ONLY — no comments, no parentheses.
- Prod DB: migrations/loaders from the Mac via api/apply_migration.py
  (--dry-run exists), Yoshi's IP in Render allowlist.
- Stale .git/index.lock blocks commits: rm -f .git/index.lock.

## State at S205 close (context for the next session)
The Kingdom is SHIPPED and live: 244 cards / 580 marked verses
(S205 + S205b exhaustive wave + S205c seed wave), two-stick
emerald+gold register, two-tone quote marks, chapter-end card, free,
default ON. Witness untouched and live (33 cards / 81 verses).
Concordance-first is the locked method for every sweep. See
S205_BUILD_NOTES.md.

## Backlog behind this
Luke extras pass · John extras pass · Kingdom wave 4 (concordance
scans: gather/gathered, remnant, outcasts/dispersed/driven, covenant;
extras-side Kingdom marks) · Witness wave 2
(RED_PILL_SWEEP_WAVE2_CANDIDATES.md, 149 candidates) · Witness extras
(1 Enoch 46-71) · Maps rebuild (NEXT_SESSION_MAPS_REBUILD_SPEC.md) ·
Timeline · Mark commentary consolidation.
