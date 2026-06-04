# S195 — Session Open Prompt (cross-reference sweep — PAUSED, this is the resume-point)

> **Paused per Yoshi (S194 close).** The next session is the public-domain tooling inventory —
> `NEXT_SESSION_PUBLIC_DOMAIN_TOOLING_PROMPT.md` — followed by tooling integration, then the
> notes/bookmarks apparatus, then the chronological option (see `App/APP_BUILDOUT_ROADMAP.md`).
> This prompt is the resume-point for the cross-reference sweep after that arc.

Mount `~/Desktop`. Read `App/S194_BATCH1_VERIFICATION.md` and `App/S194_MINION_ORCHESTRATION_PLAN.md`
first — they carry the locked decisions and the QA gate.

## ⚠ Correction carried in from S194 — full restored library, not canon-only

S194 caught a regression. Matthew's extras layer (S131–156, worked example
`session135_matt_6_extras_cross_references.sql`) cross-references into the **full restored
library** — it uses an edition-aware lookup view (`WHERE e.slug IN ('canon','enoch','jubilees',
'jasher', …)`) and input tuples that carry `src_edition` / `tgt_edition` columns
(e.g. `('canon','matthew',6,9, 'enoch','1-enoch',9,4, …)`). The John/Mark/Luke passes
(S181/183/185) used a simpler **canon-only** schema with no edition columns, so their cards cannot
reach 1 Enoch, Jubilees, Jasher, the Apocrypha, the Pseudepigrapha, Adam-Eve, Apocalypse of
Abraham, or Ascension of Isaiah. That is below the Matthew standard and against the Come-and-See
*all-of-the-library ↔ all-of-the-library* discipline.

**From here on, the edition-aware Matthew schema is the required template for the relational
mechanics.** `session135_matt_6` is the schema model; `session183_mark` / `session194_john` are
voice/structure models but are **canon-only and must not be copied for edition scope.** Every
minion targets the full restored library, bidirectional within scripture-level texts; historical-
witness texts (Josephus, Apostolic Fathers, M.R. James) stay deferred from V1.

## This session's jobs

1. **Close the live-render gap (first).** Stand up a local Postgres in the sandbox, load the base
   schema + canon (`session149_modernize_canon.sql`) + the extras editions + the cross-reference
   migrations through `session194`, and run `session181_smoke_test.sql` and `session183_smoke_test.sql`.
   Confirm John 2, 7, 9, 16 return cards. "Loads into Postgres and the card renders" is now part of
   the per-batch QA gate — no more static-only acceptance.

2. **Start the gospel back-fill — John first.** The S194 file (and the S181 John layer) are clean on
   anchoring/voice but canon-only. Re-author John on the edition-aware schema in one extras pass
   (fold S181 + S194), keeping every canon member and adding the extras targets the framework
   warrants (e.g. John 7 rivers → 1 Enoch fountains; John 9 light → 1 Enoch 48–49 light-of-the-
   nations Elect One; John 2 banquet → 1 Enoch / 2 Baruch messianic-banquet; John 16 travail →
   1 Enoch / 4 Ezra birth-pang). This both fixes the S194 regression and proves the full-library
   pipeline end-to-end before scaling. Mark and Luke follow per the roadmap.

3. **Begin Acts — full book, full library from the start.** Acts has no card layer. Minions produce
   anchored threads + member rows in 3–5-chapter batches on the edition-aware schema; you
   orchestrate and verify each batch. **Target: finish all 28 chapters of Acts across S195–S197 —
   aim a solid first chunk this session.** Start Acts 1–5.

## Carried rules (unchanged, non-negotiable)

- Minions are Claude subagents, **paragraph-only, and NEVER open the question box / AskUserQuestion**
  — it jams the system. You-to-me is plain paragraph too.
- Every minion reads in full before producing: `yoshi-voice` SKILL.md + `references/framework-deep.md`,
  `api/CHAPTER_END_CARD_CONTRACT.md`, and the worked examples — `session135_matt_6…` (the
  edition-aware schema model), `session183_mark…`, and `session194_john…` (voice/structure models).
- Cards teach strictly in-chapter (thread anchored in-chapter, every member SOURCE verse in-chapter,
  every note written fresh — no bleed). Sacred Names + Come-and-See (quote-don't-cite) throughout;
  English book-name slugs; idempotent SQL.

## Per-batch QA gate (you run it every time)

`_xref_audit.py` (zero spanning without distinct members, zero duplicated notes) + a 12-Red-Lines
voice pass + **full-library coverage check (extras targets present where the framework warrants —
not canon-only)** + **load into local Postgres and confirm each chapter's card renders.**

## Back-fill plan (decided — see `App/XREF_LIBRARY_COVERAGE_ROADMAP.md`)

The audit guard hard-fails 8 canon-only migrations: John (S181 + S194), Mark (S183), Luke (S185),
Galatians/Romans/Revelation (S181), and the thematic `session184_right_hand_face_east`. The order is
settled: **gospels back-fill first** (John → Mark → Luke), the **forward sweep runs full-library
from the start** (Acts onward), and **Romans/Galatians/Revelation back-fill folds into the forward
sweep** when it reaches them rather than as a separate trip. The thematic S184 migration is reviewed
after the gospel back-fill. Run `_xref_audit.py` each batch — anything it marks CANON-ONLY does not
merge.

## Open items (unchanged)

§0 shipped-list check still needs `REMNANT_STUDY_BIBLE_SPEC.md` (re-supply to close); S192
wheel-gate (TestFlight under Remnant of Promise vs. defer iOS) still open.
