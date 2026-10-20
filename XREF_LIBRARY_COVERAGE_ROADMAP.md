# Cross-Reference Library-Coverage Roadmap

**Locked S194.** The chapter-end-card apparatus must reach the **full restored library**, not canon
alone. This doc is the permanent tracker of which migrations meet that standard, the rule that keeps
new work from regressing, and the back-fill order for the migrations that don't yet.

## The locked rule (never regress)

Every cross-reference migration uses the **edition-aware Matthew schema** — a lookup view scoped
`WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29')`,
and `input(...)` tuples carrying `src_edition` / `tgt_edition` columns. Cross-references are
bidirectional within scripture-level texts. Historical-witness texts (Josephus, Apostolic Fathers,
M.R. James) stay one-way and deferred from V1.

The rule is enforced in three places so it cannot quietly slip again:

1. **`S194_MINION_ORCHESTRATION_PLAN.md`** — Locked Decision #4, the spawn template, and the QA gate.
2. **`api/CHAPTER_END_CARD_CONTRACT.md`** — the "Authoring requirement" section.
3. **`data-schema/migrations/_xref_audit.py`** — an automated guard that classifies every xref
   migration FULL-LIBRARY / CANON-ONLY / AMBIGUOUS and **hard-fails canon-only**. Run it every batch.

## Coverage matrix (verified by `_xref_audit.py`, 2026-06-03)

### Parity met — FULL-LIBRARY ✅
| Book | Migrations | Notes |
|------|-----------|-------|
| Matthew 1–28 | `session131…156_matt_*_extras_cross_references.sql` (28 files) | The standard. Reaches canon + 10–11 extras editions (1 Enoch, Jubilees, Jasher, Apocrypha, Pseudepigrapha, Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah, 2 Esdras, Sonnini). |

### Back-fill needed — CANON-ONLY ❌ (8 migrations)
| Book / target | Migration | Why it fails |
|---------------|-----------|--------------|
| John (S181 layer) | `session181_john_xref_threads.sql` | canon-only view, no edition columns |
| John 2/7/9/16 (S194) | `session194_john_2_7_9_16_xref_threads.sql` | canon-only view, no edition columns |
| Mark | `session183_mark_xref_members_and_threads.sql` | canon-only view, no edition columns |
| Luke | `session185_luke_xref_members_and_threads.sql` | canon-only view, no edition columns |
| Galatians | `session181_galatians_xref_threads.sql` | canon-only view, no edition columns |
| Romans | `session181_romans_xref_threads.sql` | canon-only view, no edition columns |
| Revelation | `session181_revelation_xref_threads.sql` | canon-only view, no edition columns |
| Thematic (right-hand / face-east) | `session184_right_hand_face_east_xref_threads.sql` | canon-only; thematic cross-cutting thread — review whether extras targets apply (Adam-Eve, 1 Enoch, Jasher likely) |

## Back-fill approach

The back-fill **adds** extras member rows to the existing threads; it does not discard the clean
canon work already done. Each canon-only migration gets a companion `*_extras_backfill.sql` (or is
re-authored in place) that: keeps every existing canon member, widens the lookup view to the
edition-aware set, and adds the extras-edition targets the framework warrants per chapter — same
per-chapter anchoring, fresh notes, Sacred Names, Come-and-See, idempotent SQL, run through the same
QA gate (now including the full-library guard + live render). Idempotent `ON CONFLICT DO NOTHING`
means a back-fill can re-run safely over the already-merged canon rows.

## Order (interleaved with the forward sweep)

1. **Gospels back-fill first** (we are in the gospels): John (fold S181 + S194 into one extras pass),
   then Mark, then Luke. This also closes the S194 regression.
2. **Forward sweep on the full-library schema**: Acts → epistles → Revelation → Tanakh, every new
   batch FULL-LIBRARY from the start so the backlog never grows again.
3. **Epistles/Revelation back-fill folds into the forward sweep** as it reaches them: when the sweep
   hits Romans, Galatians, and Revelation, re-author those S181 migrations to parity in the same
   pass rather than as a separate trip.
4. **Thematic review**: `session184_right_hand_face_east` — decide its extras targets when the
   gospel back-fill is done (it is cross-cutting, not a single book).

## Status log

- **2026-06-03 (S194):** Regression identified and rule hard-wired. Guard added and verified —
  PASSes all 28 Matthew migrations, FAILs the 8 canon-only migrations above. Back-fill not yet
  started.
- **2026-06-08 (S212):** Gospels extras parity (step 1) LANDED for **Mark, Luke, John** — authored as
  *new* FULL-LIBRARY migrations alongside the canon-only baselines (not rewrites of them):
  `session212_mark_extras_cross_references.sql`, `session212_luke_extras_cross_references.sql`,
  `session212_john_extras_cross_references.sql`. 59 threads / 205 cross-ref rows / 202 members; all
  PASS the guard (S212 glob added to `_xref_audit.py`). The original canon-only S181/S183/S185/S194
  Gospel baselines still appear in the CANON-ONLY table above — they are not deleted; the extras
  parity now lives in the companion S212 files. Verified clean (`scratch_xref/verify_fidelity.py`
  202/202; `verify_offset.py` clean). Still PENDING apply from Yoshi's Mac Terminal.
- **2026-06-08 (S212) — DECIDED, NEXT SESSION:** **Re-parse `pseudepigrapha-charles-vol2`
  (Testaments XII / 2 Baruch).** The source parse is OCR-degraded (verse boundaries split
  mid-sentence; scanning artifacts interleaved into verse text). S212 used Testaments XII only in
  John 13-17 with every row hand-verified against the parse (one fabricated quote corrected); the
  minions routed around 2 Baruch entirely. Yoshi's call: fix the parse next session, then
  re-verify the S212 John 13-17 Testaments XII rows and open the deferred 2 Baruch xref adds.
  Quantify degradation extent as step 1. (Full detail in `SESSION212_CLOSE.md`.)
- **2026-06-08 (S212) — DECIDED, NEXT SESSION (sequence AFTER the re-parse):** **John canon
  (Tanakh + NT) cross-reference pass.** Yoshi observed in the reader that John now surfaces only
  the extra-canonical (library) cross-references from S212 — the canonical Tanakh + New Testament
  pairings are NOT rendering. The canon John threads exist as migrations (S181 `session181_john_
  xref_threads.sql`, S194 `session194_john_2_7_9_16_xref_threads.sql`) but aren't showing — so
  step 1 is to diagnose (applied to DB? tier-gated? slug/anchor mismatch with the chapter-end-card
  query?), then ensure full canon coverage across all 21 John chapters: Tanakh sources AND
  NT-to-NT pairings, same Come-and-See + Red Lines standard.
- **2026-06-08 (S214) — DIAGNOSED + RE-VERIFIED (heavy builds scoped behind a verification gate):**
  - *charles-vol2 re-parse:* degradation quantified (it's the OCR source, not the parser — Charles's
    footnote apparatus is interleaved into verses because extraction used coordinate-blind pypdf;
    Testaments XII ~24% verses missing/fused, 2 Baruch ~40%). Faithful fix proven: layout-aware
    pdfplumber re-extraction from `~/Downloads/charles-1913-vol2.pdf` drops the footnote block by
    font-size + page position, same Charles translation/versification. **S212 John 13–17 Testaments
    XII rows re-verified against the clean text — all 7 quotes verbatim-present, no fabrications, the
    S212 Gad 62:2 fix held;** one verse-boundary nuance flagged (Judah 35:4 vs 35:5 for *written down
    before the Lord*). Production JSON NOT yet swapped — held behind a CCEL cross-check gate. See
    `S214_CHARLES_VOL2_DEGRADATION_REPORT.md`, `S214_S212_JOHN_TESTAMENTS_XII_REVERIFY.md`.
  - *John canon render:* root cause = **(a) canon migrations not in the live DB**, NOT tier/slug. The
    card query keys only on `chapter_id` (no edition/tier filter, S136), so applied rows render at any
    tier — that's why S212 extras show and the identical S181/S194 canon rows don't. S181+S194 cover
    all 21 chapters (~265 rows) and are correct; **apply them from the Mac** to fix the symptom.
    Authoring gap: targets are 238 Tanakh vs 27 NT — NT-to-NT pairings still need a new FULL-LIBRARY
    `john_nt_to_nt` migration (minions per chapter-range). See `S214_JOHN_CANON_XREF_DIAGNOSIS.md`,
    `S214_SESSION_CLOSE.md`.
- **2026-06-08 (S216) — John NT-to-NT layer AUTHORED (FULL-LIBRARY from the start):**
  `data-schema/migrations/session216_john_nt_to_nt_xref_threads.sql`. **42 threads / 140
  cross_reference rows / 140 thread_member rows**, all `tier_required='free'`, sort band
  4000–4318 (no overlap with the S181/S194/S212 John bands). Source is always a canon John
  verse; targets are other NT books across all 21 chapters. **Pairing rule (Yoshi, S216):** pair
  by genuine textual fit wherever it falls — no per-family quota (synoptic / 1 John / Revelation
  / Pauline all drawn on only where the text actually warrants). Authored by six per-chapter-
  range minions (J1 / J2–4 / J5–8 / J9–12 / J13–17 / J18–21), each loading the voice skill and
  quoting from the local canon parse. **Gates all green:** `_xref_audit.py` classifier =
  FULL-LIBRARY PASS; `verify_fidelity.py` = 139 faithful + 1 confirmed-verbatim false positive
  (1 John 1:2, a wholly-parenthetical KJV verse the normalizer strips before shingling);
  real-PostgreSQL-grammar parse (pglast) = OK, 164 statements; S216 voice-gate review clean
  (zero son-of-man, no Jew/Gentile binary, no sola-fide grammar; Romans 11 olive / Romans 13
  love-as-Torah / John 8:44 seed-war / John 10:16 other-sheep / Thomas's Formed-one confession
  all read per the Red Lines). Provenance in `scratch_xref_ntnt/`. **PENDING apply from Yoshi's
  Mac Terminal** (apply AFTER the S181 + S194 canon baselines, which the reader still needs per
  the S214 diagnosis). This closes the NT-to-NT authoring gap; it does not itself close the
  S181/S194 apply gap (that is the Mac step).

- **2026-10-18 (S456) — GENERAL MAP, from the migration folder (the live DB not read this session):**
  - *Covered — canon:* every one of the 66 books has at least one cross-reference migration (S110–S156 Matthew;
    S181–S194 Gospel/Romans/Galatians/Revelation baselines; S216 John NT↔NT; S217–S245 Acts + every epistle +
    Revelation; S260 depth passes on the four Gospels, Acts, 1 Corinthians; S301–S346 the whole Tanakh, Genesis
    to Ruth). `_xref_audit.py`: every post-S194 file is FULL-LIBRARY; the 8 FAILs are the early S181/183/184/185/
    S194 baselines, superseded for extras by S212/S216 (Gospels) and S219/S223/S224 (Romans, Galatians,
    Revelation) but never retired, so the guard still fails on them.
  - *Covered — extras as source:* 1 Enoch (S250), Jubilees (S251), Jasher (S252), all 14 KJV Apocrypha books +
    1 & 2 Adam-Eve + Apocalypse of Abraham + Sonnini + 1 Clement (S253), Ascension of Isaiah (S403), 3 Baruch,
    2 Enoch, 2 Baruch, Testaments XII, 4 Maccabees, Adam-Eve (S410–S415), 3 Maccabees (S417).
  - *Not covered, by rule:* Josephus, Lightfoot (beyond 1 Clement), M.R. James — historical witnesses, one-way,
    deferred from V1 (M.R. James edition deleted S352).
  - *Not known from files:* which migrations are applied live (June entries say S181/S194/S216 were pending), and
    the live card totals — a read-back from the Mac is step 1 of the detail work.
  - *The real job now is not coverage, it is fidelity:* the S449–S455 audits changed the texts the cards quote.
    1 Enoch: 796 cards quote the old (invented/misplaced) verse + 87 reworded, 138 moved, 278 retired
    (enoch-citation-sweep.md, enoch-verse-status.json); Jubilees 102 moved / 97 "no evidence"
    (jub-card-sort-report.md); Apocrypha 12 moved; canon fix changes no verse numbers. Yoshi's order (Oct 14):
    "recheck all cross references" = read every card's quoted words against the now-faithful text, Enoch first.
  - *Still open from June:* thematic right-hand/face-east extras targets (S184); S212 John 13–17 Testaments XII
    rows vs the clean re-parse (S214 held the JSON swap behind a CCEL gate — S413 later authored Testaments XII
    cards; confirm which parse is live); the John canon render (S214: apply S181+S194 from the Mac).


- **2026-10-18 (S457) — LIVE READ-BACK (evidence, `_s457_xref_readback.py` → `_s457_xref_readback.log`):**
  schema 1.0.0-phase4-session455b; 8,846 threads / 37,067 cards / 35,601 member rows. Of 157 thread-inserting
  migration files, **153 are applied** (proved by thread slug); 0 live threads are orphans. **The June "pending
  apply" notes are CLOSED:** S181 John 16/16 (233 members), S194 12/12, S216 John NT↔NT 36/36 incl. the J13–17
  six — all live; John renders canon targets in every chapter. **Not applied (4):** S181 Romans / Galatians /
  Revelation canon-only baselines (superseded by the live S219 91 / S223 31 / S224 149 threads → retire on Yoshi's
  word, nothing lost) and `session154_matt_17_extras_cross_references.sql` (0/5 threads, 21 Enoch-era rows —
  written in the S153-incident session, used as the Matt 24–28 template, never applied; Matt 17 has one extras
  card today, from S260; re-verify its quotes against the live Enoch before any apply). Josephus (30 books) and
  Barnabas carry 0 cards, by rule. 273 duplicate slugs = Finder " 2.sql" copies (S314/315/316/317/417/419/420/
  427/428, consonantal_skeleton, S424 .json) — housekeeping, Yoshi's word.
- **2026-10-18 (S457) — 1 ENOCH CARD-FIDELITY MAP, read against the LIVE text** (`_s457_enoch_dump.py` →
  `source-texts/enoch-charles-1917/enoch-cards-live.json`; map `enoch-card-fidelity-map.md`; per-item verdicts
  `enoch-card-fidelity-sweep.json`). 1,965 cards: STAND 394 · REWORDED 100 · RE_ANCHOR 112 · NOT_FOUND 106 ·
  no Enoch quote 1,249 (588 on a *same* verse stand; 641 on a different/reworded/new verse need the gloss read).
  Members: 188 flagged (187 ride with their card). **Threads: 512 of 729 summaries carry a bad Enoch quote (988
  bad quotes; 342 are the S250 `1-enoch-N-…` chapter threads never rewritten at S449) — the largest body of work.**
  Live 1 Enoch = 1,063 real verses + 5 placeholders (11:7, 17:9, 17:21, 24:9, 25:9); no card sits on a placeholder.
  Nothing changed. Next: fix in the map's order (re-anchor → re-quote → not-found → gloss reads → thread summaries),
  Yoshi's voice, Come-and-See, Rule 10, scratch-tested, one deploy script; then Jubilees and Apocrypha the same way.
- **2026-10-19 (S459) — 1 ENOCH CARD FIX BUILT + SCRATCH-TESTED, not deployed** (`source-texts/enoch-charles-1917/s459-card-fix/`,
  `data-schema/migrations/session459_enoch_card_fix.sql`, deploy `_session459_enoch_card_fix_deploy.sh`, read-back `_s459_check.py`).
  Re-read by content: 364 flagged (REWORDED 123 · RE_ANCHOR 88 · RE_ANCHOR_REWORDED 76 · NOT_FOUND 77); 362 re-quoted from the live
  verse in full, 201 re-pointed (ids kept), 329 member notes, 2 duplicates retired; 185 notes rewritten in Yoshi's voice (the degraded
  "wisdom-stream / substance / the framework reads" prose). Scratch: 0 skipped, idempotent, post-run regrade all STAND. **New finding:
  127 Enoch cards / 107 member notes / 61 thread summaries carry degraded S1xx prose; 59 STAND cards still do → next pass.** Then the 641
  glosses, then the 512 thread summaries (the book's chapter-end text — Track A waits on these), then Jubilees / Apocrypha the same way.
- **2026-10-19 (S459, Yoshi) — SCOPE LOCKED: EVERY extra-canonical book gets the same card-fidelity sweep before the app is called
  sale-ready**, not just the three rebuilt texts. Order after Enoch (cards ✓ built → summaries → glosses): Jubilees → Apocrypha (KJV
  ebible, incl. 3 Maccabees) → Jasher → the pseudepigrapha editions (2 Enoch, Testaments of the Twelve, Apocalypse of Abraham, 1–2 Adam
  and Eve, Ascension of Isaiah, Jubilees-adjacent) → Cepher additions → Sonnini. Same chain each time: dump the live cards touching the
  book (`_s457_enoch_dump.py` pattern) → regrade by the words quoted (`s459-card-fix/regrade.py` pattern) → decide by hand → build →
  scratch Postgres twice → one deploy script → live read-back. Per-book status table to be kept here as each lands.

  | book | cards (quote-bearing) | sweep | fix built | deployed | summaries | glosses |
  |---|---|---|---|---|---|---|
  | 1 Enoch | 729 of 1,963 | ✓ S459 | ✓ S459 (362 + 2 retired) | ✓ S459 19:03 CDT, read-back 0 flagged | — (512 open) | — (641 open) |
  | Jubilees | — | — | — | — | — | — |
  | Apocrypha (+3 Macc) | — | — | — | — | — | — |
  | Jasher | — | — | — | — | — | — |
  | 2 Enoch / Test. XII / Apoc. Abraham / Adam-Eve / Asc. Isaiah | — | — | — | — | — | — |
  | Cepher additions / Sonnini | — | — | — | — | — | — |
