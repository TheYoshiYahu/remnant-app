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
  | 1 Enoch | 729 of 1,963 | ✓ S459 | ✓ S459 (362 + 2 retired) | ✓ S459 19:03 CDT, read-back 0 flagged | ✓ S460 (532 of 719), deployed Oct 19 22:31 CDT, read-back 0 (532/532 live) | ✓ S463a (63 STAND rewritten; 631 glosses: 349 moved, 55 re-worded, 22 patched, 61 retired, 4 Q), deployed Oct 23 10:55 CDT, read-back 0 flagged, 490/490; S463a2 4 Q retired 11:07 CDT — CLOSED |
  | Jubilees | 1,741 of 1,754 anchored | ✓ S463b | ✓ built S463b (126 rebuilt, 140 moved, 92 re-cited) | ✓ built S463b | ✓ built S463b (5) | ✓ built S463b (312 read: 179 stay / 131 move / 2 Q) | ✓ deployed Oct 23 12:55 CDT, read-back 347/347, 0 degraded — CLOSED |
  | Apocrypha (+3 Macc) | 1,784 stand + 58 off of 4,597 anchored | ✓ S463c | ✓ built S463c (485 rebuilt, 1 moved, 22 re-quoted, 3 re-cited, 63 slug cites) | ✓ deployed Oct 23 14:55 CDT, read-back 573/573, 0 degraded — CLOSED | ✓ built S463c (55) | ✓ built S463c (13 S454-changed read: all stay) | scratch 573/573, 607/607, 55/55, 4,907 quotations verbatim, 0 degraded |
  | Jasher | 315 stand + 6 off of 1,943 anchored (1,624 canon-first glosses, canon quotes 1,428/1,429 verbatim) | ✓ S463d | ✓ built S463d (53 rebuilt, 1 moved, 3 re-quoted, 2 patched) | ✓ deployed Oct 23 18:59 CDT, read-back 59/59, 0 degraded — CLOSED | ✓ built S463d (65) | ✓ built S463d (36 S450-changed read: all stay; 13 off-address read: 1 moved) | scratch 59/59, 58/58, 65/65, 1,628 quotations verbatim, 0 degraded |
  | 2 Enoch / Test. XII / 2–3 Baruch / 1–2 Adam-Eve / Apoc. Abraham / Asc. Isaiah | 134 extra italics (97 stand + 23 off) + 3,102 canon leads of 3,497 anchored (3,388 canon-first glosses) | ✓ S463e (S476) | ✓ built S463e (74 rebuilt, 14 moved, 84 canon re-quotes, 76 patches, 7 address, 227 slug) | ✓ deployed Oct 26 19:05 CDT, read-back 468/468, 0 degraded — CLOSED (Charles adam-eve + 4 Macc held for text lane) | ✓ deployed Oct 26 (154) | ✓ built S463e (97 phrase reads + 4 S440 reads) | scratch 468/468, 467/467, 154/154, 134 quotations verbatim, canon leads off 0, 0 degraded, 0 slug, 0 stale T.XII cites |
  | Charles adam-eve (784) + 4 Maccabees (789) | 533 cards (241 + 292), 112 thread anchors; 13 own-book italics, 520 canon-first glosses | text merged + DEPLOYED S477 Oct 26 20:45 CDT (141 + 247 verses, 533/533, 112/112); ✓ sweep S478 (Oct 27) | ✓ built S478: 12 rebuilt Come-and-See, 12 moved (8 by two cold reads), 15 phrase patches, 35 old-numbering cite fixes, 3 canon re-quotes; ✓ DEPLOYED Oct 27 17:30 CDT, live read-back 73/73, 71/71, 58/58, 0 flagged — CLOSED | ✓ built S478 (71 member rows) | ✓ built S478 (58 summaries: 3 patched, 55 re-cited) | — | scratch 73/73, 71/71, 58/58, 13 own-book quotations verbatim, canon leads off 0, 0 degraded, 0 chains, 0 old-numbering cites, 0 dup pairs; run 2 = 0 changed; both guards tested |
  | Apostolic Fathers (Lightfoot: 1–2 Clement, Ignatius ×7, Mart. Polycarp, Didache, Hermas) + Acts 29 (Sonnini) — the "Cepher additions" | 516 anchored (all canon-first glosses; 3 S1xx canon-side cards) | ✓ S463f (Nov 8) — regrade + an ADDRESS READ of all 516 by content, two cold reads on every move | ✓ built S463f: 180 cards (3 rebuilt, 56 re-pointed — the S253 cards sat a verse off the words they describe, 43 prose, 89 script: NT-Lord canon re-quotes + English citations), 146 member notes, 8 thread anchors, 2 verse typos ('Cod') | ✓ DEPLOYED Nov 8 15:21 CST, live read-back 180/180 (56/56 moved), 146/146, 65/65, 8/8, 2/2, 0 flagged — CLOSED. **PHASE 1 CLOSED for every edition.** | ✓ built S463f (65 + 1 title; 14 Hermas Sim 8–10 summaries re-cited 23/24 → 25/26/27; 40 witness quotations re-quoted verbatim) | — (no glosses: the witness text is on the page) |
- **2026-10-19 (S460) — 1 ENOCH THREAD SUMMARIES: MAP + FIX BUILT, scratch-tested, not deployed** (`source-texts/enoch-charles-1917/
  s460-summary-fix/`, migration `session460_enoch_summary_fix.sql`, deploy `_session460_enoch_summary_fix_deploy.sh`, read-back
  `_s460_check.py`). Re-graded by the words: 719 summaries cite 1 Enoch, STAND 183 · RE_QUOTE 207 · REWRITE 300 · CITATION_ONLY 29 (the
  S457 512/988 was inflated). 532 summaries replaced — 306 rewritten by hand in Yoshi's voice, 59 adjusted, 166 re-quoted; 168 titles;
  ids/slugs kept; every Enoch and canon italic verified verbatim; scratch run 1 = 531 updated, run 2 = 0; post-run regrade 0 bad quotes.
  Status table: 1 Enoch summaries column → "✓ built S460 (532), deploy pending". Next: the 59 degraded STAND cards, the 641 glosses, then Jubilees.
- **2026-10-22 (S463a) — 1 ENOCH CLOSE-OUT BUILT, scratch-tested twice, NOT deployed** (`source-texts/enoch-charles-1917/s463a-closeout/`,
  migration `session463a_enoch_closeout.sql`, deploy `_session463a_enoch_closeout_deploy.sh`, read-back `_s463a_check.py`, report
  `enoch-closeout-report.md`). Job 1: the 63 degraded-prose STAND cards rewritten (live verse in italics, cited, then prose; 65 member
  notes). Job 2: the 631 glosses on verses S449 changed — old text traced into the live book, each read by hand: 349 re-pointed (ids kept),
  55 re-worded, 22 patched, 61 retired as duplicates, 4 questions for Yoshi. Two cold verifier passes corrected 46 wrong moves before
  commit. Scratch run 1 = 141 in place / 349 moved / 410 member notes / 61 retired / 0 skipped; run 2 = 0 changed, 490 landed; read-back
  551/551, 0 dup pairs, 0 degraded. Status table: 1 Enoch glosses column → "✓ built S463a, deploy pending". Next: deploy + read-back, then Jubilees (S463b).
- **2026-10-23 (S463a) — DEPLOYED 10:55 CDT, live read-back 0 flagged, 490/490 landed, 0 retired present, 0 member notes off.** 1 Enoch is closed
  (2253 live Enoch cards: 729 STAND, 1524 no-Enoch-quote). 9 degraded-marker cards remain that are not Enoch-anchored (notes mention Enoch only):
  Jubilees 4538, 34532 → S463b; Apocrypha 4556, 4614, 4618; Testaments 4737; canon-canon 6985, 7036, 7053 → their own sweeps. Status table updated.
- **2026-10-23 (S463b) — JUBILEES SWEEP BUILT, scratch-tested twice, NOT deployed** (`source-texts/jubilees-charles-1917/s463b-sweep/`, migration
  `session463b_jubilees_sweep.sql`, deploy `_session463b_jubilees_sweep_deploy.sh`, read-back `_s463b_check.py`, report `jubilees-sweep-report.md`).
  Whole S459/S460/S463a chain in one migration: 126 notes rebuilt (11 re-pointed), 129 glosses re-pointed, 92 citations widened to the span quoted,
  256 member notes, 5 summaries. Two cold reads of every move + one voice read of every rebuilt note. Scratch run 1 = 207 in place / 140 moved /
  0 skipped; run 2 = 0 changed, 347 landed; read-back all 1,943 Jubilees quotations verbatim, 0 degraded. Status table: Jubilees row → built, deploy pending.
  Next: deploy + read-back, then Apocrypha + 3 Maccabees (S463c).
- **2026-10-23 (S463b) — DEPLOYED 12:55 CDT, live read-back 347/347 cards, 256/256 member notes, 5/5 summaries, 1,943 quotations verbatim, 0 degraded. Jubilees closed.**
- **2026-10-23 (S463a2) — the 4 S463a question cards retired, DEPLOYED 11:07 CDT** (`session463a2_enoch_four.sql`): 25364, 25399, 25466, 25486 stood
  on renumbered verses their notes no longer matched; the pairings survive on 25467 / 25362 / 25504. Read-back retired 4/4, twins live 4/4. **1 Enoch closed.**
- **2026-10-23 (S463c) — APOCRYPHA + 3 MACCABEES SWEEP BUILT, scratch-tested twice, NOT deployed** (`source-texts/apocrypha-kjv-ebible/s463c-sweep/`,
  migration `session463c_apocrypha_sweep.sql`, deploy `_session463c_apocrypha_sweep_deploy.sh`, read-back `_s463c_check.py`, report
  `apocrypha-sweep-report.md`). Dump: 5,720 + 228 live verses, 4,969 cards (4,597 anchored), 4,943 member notes, 1,990 threads. Map: quotes 1,784 stand /
  58 off / 3 neighbor / 6 not found; degraded prose 411 markers + 139 hyphen-chain-only = 550, 485 anchored (incl. 4556, 4614, 4618); slug citations 66 cards +
  13 summaries; 13 glosses on S454-changed verses (all stay). Build: 485 notes rebuilt Come-and-See (4507 → Ecclesiasticus 35:14), 22 re-quoted, 3 re-cited as
  ranges, 63 slug citations → English names, 607 member notes, 55 summaries. Reads: 13 glosses by content; 19 address decisions cold-read by two agents (19/19
  agree); 485 notes + 112 member notes + 55 summaries voice-read cold by six readers (27 findings applied). Scratch run 1 = 572 in place / 1 moved / 607 / 55 /
  0 skipped; run 2 = 0 changed, 573 landed; post-run read-back 4,907 Apocrypha quotations verbatim, 0 degraded, 0 chains, 0 slugs, 0 dup pairs; both guards
  tested. Status table: Apocrypha row → built, deploy pending. Next: deploy + read-back, then Jasher (S463d).
- **2026-10-23 (S463c) — DEPLOYED 14:55 CDT, live read-back 573/573 cards, 607/607 member notes, 55/55 summaries, 4,907 quotations verbatim, 0 degraded. Apocrypha + 3 Maccabees closed. Next: Jasher (S463d).**
- **2026-10-23 (S463d) — JASHER SWEEP BUILT, scratch-tested twice, NOT deployed** (`source-texts/jasher-noah-1840/s463d-sweep/`, migration
  `session463d_jasher_sweep.sql`, deploy `_session463d_jasher_sweep_deploy.sh`, read-back `_s463d_check.py`, report `jasher-sweep-report.md`).
  Dump 1,943 anchored cards; every quotation graded: 315 stand / 6 off / 0 re-anchor; 53 degraded-prose notes rebuilt Come-and-See; 1 card
  re-pointed (31322 34:60 → 34:55); 3 re-quoted; 2 patched; 58 member notes; 65 summaries (21 with quotations re-cited off the old 7:18 / 9:7
  blob text and pre-S450 wording). Two cold readers 27/27 agree on every address decision; three voice readers, 8 findings applied. Scratch run 1 =
  58 in place / 1 moved / 58 / 65, 0 skipped; run 2 = 0 changed, 59 landed; read-back 1,628 Jasher quotations verbatim, 0 degraded, 0 chains,
  0 slugs, 0 dup pairs; both guards tested. Status table: Jasher row → built, deploy pending. Next: deploy + read-back, then the pseudepigrapha
  editions (S463e — confirm which Testaments XII parse is live first).
- **2026-10-23 (S463d) — DEPLOYED 18:59 CDT, live read-back 59/59 cards, 58/58 member notes, 65/65 summaries, 1,628 quotations verbatim, 0 degraded. Jasher closed. Next: the pseudepigrapha editions (S463e).**
- **2026-10-26 (S476 = S463e) — PSEUDEPIGRAPHA EDITIONS SWEEP BUILT, scratch-tested twice, NOT deployed** (`source-texts/pseudepigrapha-charles-vol2/s463e-sweep/`,
  migrations `session463e_pseudepigrapha_sweep.sql` / `session463e_adam_eve_sweep.sql` / `session463e_apocalypse_abraham_sweep.sql` /
  `session463e_ascension_isaiah_sweep.sql`, deploy `_session463e_<edition>_deploy.sh` ×4, read-back `_s463e_check.py`, report `pseud-sweep-report.md`).
  Parse question settled by content: live text = Desktop JSON 4,962/4,962; live Testaments XII is the Track B repair (142 ch / 997 vv, clean), not the
  S214-measured pypdf parse — no re-parse. Scope: the eight clean books; Charles adam-eve (784) and 4 Maccabees (789) HELD for the text lane (line-end verse
  breaks in ~half their verses), then swept in one pass. Dump 4,120 cards (4,116 anchored), 4,115 member notes, 1,280 threads. Map: 74 degraded-prose notes,
  23 extra quotations off, 84 canon leads off canon.json (42 × 1 John 3:8 = Yoshi's rendering; NT-Lord rule), 244 slug cites, 8 stale Testaments cites,
  97 phrase reads, 78 summaries with canon quotes off. Build: 468 cards (14 re-pointed), 467 member rows, 154 summaries. Reads: 22 address decisions cold
  by two agents (22/22 agree); 77 notes + 32 summaries + 7 member notes voice-read on Fable (21 findings applied). Scratch run 1 = 468 landed / 0 skipped;
  run 2 = 0 changed; read-back 134 extra quotations verbatim, canon leads off 0, 0 degraded / chains / slugs / Hebrew names / stale cites, 0 dup pairs;
  both guards tested. Status table: pseudepigrapha row → built, deploy pending. Next: deploy ×4 + read-back, then the Charles adam-eve / 4 Macc text fix,
  then S463f (Cepher additions + Sonnini).
- **2026-10-26 (S476 = S463e) — DEPLOYED 19:05 CDT, live read-back 468/468 cards, 467/467 member notes, 154/154 summaries, 134 quotations verbatim, canon leads off 0, 0 degraded. The eight clean pseudepigrapha books are closed. Next: text lane for Charles adam-eve (784) + 4 Maccabees (789), their sweep, then S463f (Cepher additions + Sonnini).**
- **2026-10-26 (S477) — TEXT LANE for Charles adam-eve (784) + 4 Maccabees (789): MERGED + MIGRATION BUILT, scratch ×2 clean, NOT deployed** (`source-texts/pseudepigrapha-charles-vol2/s477-text-lane/`: merge477.py, s477_map.json, s477_cards_map.json, s477_report.md, out/cold*.json; migration `session477_adam_eve_4macc_text_lane.sql`; deploy `_session477_text_lane_deploy.sh`; read-back `_s477_check.py`; audio `_s477_audio_remap.mjs` now / `_s477_audio_redo.mjs` on the voices lane). The two books' Track B verses were print lines: 57 % / 53 % ended mid-clause. Merged back into whole clauses (boundary = . ! ? : ; or a dropped question mark before a capital; 8 de-hyphenations; Vita 49:2/3 kept; two sentences moved to the chapter whose standard division carries them — Vita 46:1 and 4 Macc 14:1). parsed/pseudepigrapha-charles-vol2.json saved over the original (backup .pre-s477); app/src/data/paragraph_starts.json remapped for the four keys. Every card and anchor re-pointed by content (old line traced into the new verse 533/533; card 69502 Joel 2:10 follows its sentence 88:3 → 89:1). Reads: two cold Sonnet reads of every move (adam-eve full text; 4 Macc addresses — the narrative text cannot be passed through the chat; join quality by script: 220 joins, 0 doubled words). Next: deploy + read-back → `_s477_audio_remap.mjs` → S478 sweep of the two books → S463f.
- **2026-10-27 (S478) — SWEEP of Charles adam-eve (784) + 4 Maccabees (789) BUILT on the merged live text, scratch ×2 clean, NOT deployed** (`source-texts/pseudepigrapha-charles-vol2/s478-sweep/`: s478-sweep-map.md, s478-sweep-report.md, stale_cites.py, build_packets478.py, assemble478.py, gen_sql478.py, seed478.mjs, packets/, out/, fix/; migration `session478_adam_eve_4macc_sweep.sql`; deploy `_session478_sweep_deploy.sh`; read-back `_s478_check.py`). S477 text lane was confirmed deployed Oct 26 20:45 CDT from its log (read-back 141/141, 247/247, 533/533, 112/112, 0 dup), audio remap run. Sweep: 73 cards (12 S154-era framework cards rebuilt Come-and-See, 12 moved — 4 rebuilt cards to the verse their quotation sits in, 8 neighbour-verse cards by two Sonnet cold reads 9/9 agree — 15 phrase patches incl. the 6 'substance … shadow' Yoshi had patched to plain words, 35 pre-merge citations re-cited by the S477 map, 3 canon re-quotes), 71 member rows, 58 summaries (3 patched, 55 re-cited; quotations traced into the live text). Two Fable voice reads, 17 fixes applied. Scratch (PGlite): run 1 = 73/73, 71/71, 58/58, 0 degraded, 0 chains, 0 old-numbering cites, canon leads off 0; run 2 = 0 changed; guards: tampered verse → RAISE, nothing landed; card moved since read-back → skipped. Next: Yoshi's deploy paste + read-back → S463f (Cepher additions + Sonnini) → the audio re-record of the two books (voices lane, LAST).
- **2026-11-08 (S463f) — APOSTOLIC FATHERS + SONNINI SWEEP BUILT, scratch-tested twice on Postgres 16, NOT deployed** (`source-texts/lightfoot-apostolic-fathers/s463f-sweep/`:
  BRIEF463f.md, map463f.py, s463f-sweep-map.md, s463f-sweep-report.md, regrade*.py/.json, packets/, out/ (model named in each: Sonnet 5.5 drafters + address readers, two
  cold reads; Fable voice read in assemble463f.py), fix/, gen_sql463f.py, seed463f.py; migrations `session463f_apostolic_fathers_sweep.sql` + `session463f_sonnini_sweep.sql`;
  deploy `_session463f_sweep_deploy.sh`; read-back `_s463f_check.py`; dump `_s463f_dump.py` → `af-cards-live.json` + the whole-library inventory `_s463f_library_inventory.md`).
  Dump: 373 live verses = Desktop parse 373/373; 520 cards (516 anchored), 517 member notes, 158 threads. "Cepher additions" in the live DB = the Lightfoot edition (the
  Ha'avoth collection); Psalms 151–155 / Shamayim books are not live. Map: 13 canon leads off (NT-Lord rule), 94 ambiguous/slug citations, 5+9 Hebrew book names, 14 Hermas
  summaries on an old chapter numbering (23/24 → live 25/26/27), 40 witness quotations off in 35 summaries, 20 degraded/chain cards, 24 paraphrases inside quotation marks,
  3 S1xx canon-side cards; the address read of ALL 516 cards found 60 candidates → 56 moves agreed by two cold reads (Hermas 12, Magnesians 10, 1 Clement 7, Didache 7,
  Philadelphians 7, 2 Clement 5, Trallians 4, Martyrdom 3, Acts 29 1), 8 thread anchors follow. Build: 180 cards, 146 member notes, 65 summaries + 1 title, 8 anchors,
  2 verse typos. Scratch run 1 = 180/180 landed (56/56 moved), run 2 = 0 changed; guards tested (tampered verse → RAISE nothing lands; card moved since read-back → skipped).
  Coverage gaps seen (phase 2): Hermas 23 + 24 (Sim 6–7) carry no card; Barnabas none. Next: Yoshi's deploy paste + read-back → **Phase 1 CLOSED** → phase 2.

- **2026-11-08 (S495) — PHASE 2 GAP FILL DEPLOYED, every chapter in the library now carries a card.** Gap map from the live read-back
  (`_s495_gapmap_dump.py` → `_s495_gap_map.md`): 78 real gap chapters / 305 verses (1 Enoch 9, Testaments XII 31, Charles adam-eve 34, 2 Enoch 57,
  2 Baruch 33, Hermas 23–24); the 14 apocrypha "chapter 0" rows are Introduction rows with 0 verses (no card possible); Josephus 369 + Barnabas 1 by rule.
  Per-book read-back (`_s495_dump.py` → `source-texts/_s495/live/<edition>__<book>.json`, 16 books + `_unanchored_threads.md`). Chain in `_s495/`
  (tools/assemble495 · gen_sql495 · seed495 · check495 · dump495 · gen_deploy495; BRIEF495_GAPFILL.md): Sonnet drafters per book (model named in
  every out/*.json) → Fable voice read (out/*_fixed.json carry the read note) → assemble (both verses verbatim — canon from parsed/canon.json by
  the standing convention, extras from the live text; forbidden-phrase scan; slug/anchor/dup checks) → one INSERT migration per book with guards
  (source-text RAISE, target missing, non-canon note must carry the live target) → scratch ×2 on Postgres 16 (both tampers) → deploy script with
  its own read-back proof. DEPLOYED Nov 8 16:59–17:02 CST (logs `_session495_<book>_deploy.log`): 2-enoch 4 cards/1 thread; 2-baruch 4/1;
  hermas 6/2; 1-enoch 36 cards / 7 new threads + 8 existing anchored threads filled (105, 107 had summaries but 0 members); adam-eve 69/23 new +
  11 joined; testaments-xii 101/29 new + 1 joined — 220 cards, 63 new threads, 220 member rows, 0 dup pairs, check495 PASS ×6. Card tier = each
  book's live majority (all `free`), threads `extras`. Migrations `data-schema/migrations/session495_<book>_gap_fill.sql` (×6).
- **2026-11-08 (S495) — THE REST OF PHASE 2, mapped not built:** (a) ORPHAN CARDS — 1,565 live cards sit in no thread (Matthew 1,308, Mark 169,
  Luke 61, Joshua 12, Revelation 6, Romans 3, 1 Thess 2, Genesis/Ezekiel/2 Esdras/2 Baruch 1 each); no whole chapter lacks a thread. The Matthew
  block graded by content (`_s495/out/matthew_orphan_map.{json,md}`, Mark + Luke likewise): FULL 24 · PARTIAL 454 · BARE 776 · DOCREF 54; 451
  hyphen-chains; 59 reversed-pair dups; 921 fit existing Matthew threads (326 sure / 595 to read), 387 need ~91 new threads. Every Mark note and 56
  Luke notes begin `thread:<slug> |` with slugs that never became threads (73 slugs). THIS IS A REBUILD (Come-and-See, both verses), the size of the
  Enoch sweep — chapter batches, 2–3 sessions. (b) 144 threads with no anchor — 140 have Matthew members; proposed anchors in the map. (c) The
  four never-applied files (S181 Romans 0/16, Galatians 0/12, Revelation 0/17 slugs live; S154 Matt 17 0/5) — superseded live by S219 91/91,
  S223 31/31, S224 149/149; Matt 17 has 1 extras card (→ Sirach 48:10). Retire = `git rm` on Yoshi's word (not yet given). (d) Duplicate " 2.*"
  files: 38 outside node_modules, 26 tracked; the 12 in data-schema/migrations are byte-identical to their originals — `git rm` on Yoshi's word.
  (e) Doc-ref hits library-wide: 27 real (20 Matthew S1xx cards, 2 Mark `thread:` notes, 5 member notes incl. "queued for S184", 2 summaries
  naming Yoshi/a session) + 6 Matthew threads (ids 7–19) whose summary opens with the slug in bold code — all inside the Matthew rebuild.
- **2026-11-09 (S495 close, Yoshi's word): CLOSED (c) and (d) above** — `git rm` of session181_{romans,galatians,revelation}_xref_threads.sql + session154_matt_17_extras_cross_references.sql and the 12 identical " 2.*" migration copies, committed 340228b and pushed. `session181_john_xref_threads.sql` stays (applied, 16/16 live); `session181_revelation_xref_threads.sql.pre-s440` left in place. S495 commit fb90f56 also pushed.
- **2026-11-10 (S496 close) — MATTHEW REBUILD BATCH 1 (Matthew 1–7) DEPLOYED.** 200 orphan cards rewritten in place (ids kept; Come-and-See:
  target verse whole from parsed/canon.json, Matthew verse whole as it reads live, plain prose), 200 thread members added (49 existing threads
  filled, 3 new threads), 10 unanchored threads anchored. Chain `_s496/` (assemble496 · gen_sql496 · seed496 · check496 · dump496 · gen_deploy496 —
  the UPDATE path beside the S495 INSERT chain, same guards): Sonnet 5.5 drafts per chapter packet → Fable voice read (out/*_fixed.json; 15 drafter
  flags kept as working readings inside the texts) → assemble PASS → migration `data-schema/migrations/session496_matthew_b1_rebuild.sql`
  (guards: live text moved / live note edited / card already in another thread / thread already anchored elsewhere → RAISE, nothing lands;
  partial → reported, the rest lands) → scratch ×2 on Postgres 16 seeded from the Nov 9 read-back, plus all five tampers, PASS (re-run Nov 10
  before deploy, since the Nov 9 scratch proof did not survive the sandbox) → DEPLOYED Nov 10 22:21 CST (`_session496_matthew_b1_deploy.log`):
  read-back 200/200 notes, 200/200 members, 3/3 threads, 10/10 anchors, 0 dup pairs, chapters 1–7 each 0 orphans, check496 PASS.
  Matthew orphans left: 1,108 (chapters 8–28); Mark 169, Luke 61, the rest 24 untouched. Live read-back of Matthew after deploy:
  `_s496/scratch/matthew_b1_live_after.json` — the next batch re-dumps anyway.
  NEXT (S497): batch b2 = Matthew 8–13 (248 orphans per the map; add `'b2': ('matthew', range(8, 14))` to BATCHES in common496 — the chain is
  otherwise batch-agnostic); then 14–19 (294), 20–24 (368), 25–28 (198), then Mark + Luke together (230). Each batch: re-dump Matthew first,
  Sonnet packets → Fable read → assemble → scratch ×2 + tampers → Yoshi's deploy paste → read-back → close.
- **2026-11-11 (S497) — MATTHEW REBUILD BATCH 2 (Matthew 8–13) DEPLOYED.** Live Matthew re-dumped first (Nov 10 22:34, orphan 1,108 confirmed).
  248 orphan cards rewritten in place, 248 members (44 existing threads filled, 5 new: matthew-8-let-the-dead-bury-their-dead; matthew-10-the-twelve-
  called-and-the-twelve-tribes; matthew-10-heal-the-sick-freely-ye-have-received; matthew-10-shake-off-the-dust-and-sodom; matthew-10-until-the-son-
  of-adam-be-come), 9 unanchored extras threads anchored on their own summaries' opening verses (10:22; 10:32–33; 13:10–17; 13:24–30 ×2; 13:34–35;
  13:38–39; 13:43; 13:47–50). Same chain as b1 (`'b2'` added to BATCHES; packet496 takes the batch; precheck496 finds the batch from the chapter).
  Six Sonnet 5.5 drafters in parallel → Fable read of every card (`_s496/tools/read496_b2.py`: 12 corrections — ch 12 family-of-the-Father cards
  "made by / not by blood" → "known by"; ch 13 leaven cards de-hedged to the thread's corruption reading; Genesis 18:6 restored to Yahuah at
  Abraham's tent; the rest grammar) → assemble PASS (38 drafter flags, all working readings inside the texts) → scratch ×2 + five tampers PASS →
  DEPLOYED Nov 11 00:28 CST (`_session496_matthew_b2_deploy.log`): 248/248 · 248/248 · 5/5 · 9/9 · 0 dups · 8–13 each 0 orphans · check496 PASS.
  Matthew orphans left: 860 (chapters 14–28). The cards as they read: `_s496/out/matthew_b2_cards.md`.
  FOR THE SUMMARIES SWEEP (outside this chain): the live centurion thread (matthew-8-many-from-east-and-west…) summary still says "Gentile soldier"
  and "the believing stranger"; other S1xx thread summaries carry "stranger grafted in" language the cards no longer follow. NOTED: 1 John 3:4 and
  3:8 in parsed/canon.json read "goes on sinning" (a per-verse rendering, not the KJV wording) — cards quote it as the library carries it.
  NEXT (S498): batch b3 = Matthew 14–19 (map counts 42, 41, 38, 51, 50, 72 = 294) — add `'b3': ('matthew', range(14, 20))`; re-dump first.
- **2026-11-13 (S499) — MATTHEW REBUILD BATCH 3 (Matthew 14–19) DEPLOYED.** S499/S499b had gone live first (Noah and the Old Testament spellings of the
  Greek-form names in live verses, cards, notes and summaries; parsed/canon.json the same), so Matthew was re-dumped (Nov 13 12:45 CST, orphan 860 confirmed)
  and every quotation this batch writes carries the new spellings. 294 orphan cards rewritten in place, 294 members (28 existing threads filled, 3 new:
  matthew-14-the-mountain-where-he-goes-apart (14:22–23); matthew-15-plants-the-father-did-not-plant-and-blind-guides (15:13–14); matthew-18-binding-and-
  loosing-by-two-or-three-witnesses (18:18–20)), 3 unanchored extras threads anchored on their summaries' opening verses (gathering-of-the-scattered-twelve-
  tribes… 15:24; reward-according-to-works… 16:27; the-gates-of-sheol… 16:18; 12 more ch 14–16 anchors sit ready in ref/anchors496.json for threads no card
  joined). Same chain (`'b3'` in BATCHES). Six Sonnet 5.5 drafters in parallel → Fable read of every card (`_s496/tools/read496_b3.py`: 34 corrections —
  ch 19's "the King" as the drafter's name for Yahusha (Jesus), the S1xx shorthand, → Yahusha (Jesus) throughout; 14:23→28:16 no longer one mountain;
  Genesis 17:1 member "long before Sinai") → assemble PASS (40 drafter flags, all working readings inside the texts) → scratch ×2 + five tampers PASS →
  DEPLOYED Nov 13 20:11 CST (`_session496_matthew_b3_deploy.log`): 294/294 · 294/294 · 3/3 · 3/3 · 0 dups · 14–19 each 0 orphans · check496 PASS.
  Matthew orphans left: 566 (chapters 20–28). The cards as they read: `_s496/out/matthew_b3_cards.md`.
  READ AND SETTLED (Yoshi, Nov 13): the woman of Canaan is seed revealed — a woman from that land who quoted the covenant (*Son of David*, 15:22) and
  believed, one of the scattered sheep of 15:24; not the marriage door (Ruth, Rahab), which stays a separate mechanism. Cards 2871–2878, 3518–3521,
  177460 read that way. Counter-text to be ready for: Mark 7:26 *a Greek, a Syrophenician by nation* — answered by Lo-Ammi (Hosea 1:9–10).
  FOR THE SUMMARIES SWEEP (outside this chain): the live thread matthew-15-the-canaanite-woman-the-lost-sheep-first-the-stranger-grafted-isaiah-56-
  psalm-22-1-kings-17 — its title and summary still read her as a stranger joined by faith ("grafted", "gentile woman", Psalm 22:27 as the nations
  turning); the cards inside it no longer say so. Add to the centurion-thread item from S497.
  FOR A RE-POINT PASS (not this chain): card 3675 pairs Matthew 19:16 with John 2:3 (no wine at Cana); its old note was "the 1234 of Truth" — 1 John 2:3
  was meant. The card is written to John 2:3–5 honestly meanwhile.
  NEXT (S500): batch b4 = Matthew 20–24 (map counts 56, 88, 62, 70, 92 = 368 — the biggest; split 20–22 / 23–24 if the read runs long) — add
  `'b4': ('matthew', range(20, 25))`; re-dump first.
  YOSHI'S READING OF MATTHEW 15:21–28 (Nov 13, for the Canaanite-woman thread summary when the sweep rewrites it): v.24 is said to the disciples who
  said *send her away* — he is telling them who she is: the lost sheep of the house of Yashar'el, his whole errand (10:6). She is called a dog because
  the divorced house (Jeremiah 3:8) cannot be taken back while the husband lives (Deuteronomy 24:4; Romans 7:2–4) — *let the children first be filled*
  (Mark 7:27): the undivorced house of Yahudah first, while he lived; the dogs after the death and resurrection, when the scattered are redeemed and
  the bread is theirs (Hosea 2:23; 1:9–10; 28:19 after 10:5). "Dogs everywhere else in scripture" is what the scattered became — Lo-Ammi. An
  inference line on line (Matthew 15 does not state the death as the reason); present it as one.
- **2026-11-13 (S499c) — THE CANAANITE-WOMAN THREAD REWRITTEN AND DEPLOYED on Yoshi's reading above.** Thread 30911 (slug kept): title + summary
  rewritten (It ain't new; 15:24 said to the disciples; Son of David; Lo-Ammi; Jeremiah 3:8; Deuteronomy 24:4; Romans 7:2,4; Mark 7:27 first;
  Hosea 2:23; 10:5 → 28:19). Four S1xx cards rebuilt Come-and-See with member notes (124214 Isaiah 56:8, 124215 Isaiah 56:6, 124216 Psalm 22:27,
  124217 1 Kings 17:9 — "stranger grafted"/"gentile woman" gone); three S499 cards given the reason the bread was withheld (2876, 177460, 3520).
  Own small chain `_s496/tools/{build,gen_sql,scratch,check}_s499c.py` + `_s496/c15/` (the UPDATE path for thread title/summary and member notes,
  which the rebuild chain does not do — reusable for the summaries sweep). Scratch ×2 + four tampers PASS → DEPLOYED Nov 13 20:32 CST
  (`_session499c_canaanite_thread_deploy.log`): 7/7 · 7/7 · thread yes · check_s499c PASS. Summaries-sweep list: the centurion thread
  (matthew-8-many-from-east-and-west…, "Gentile soldier") is the next item, same chain.
- **2026-11-13 (S500) — MATTHEW REBUILD BATCH 4 (Matthew 20–24) DEPLOYED.** Matthew re-dumped first (Nov 13 21:01 CST, orphan 566 confirmed). 368 orphan
  cards rewritten in place, 368 members (25 existing threads filled, 11 new: matthew-20-the-third-passion-foretelling (20:17–19); matthew-21-faith-and-the-
  mountain-removed (21:21–22); matthew-21-by-what-authority (21:23–27); matthew-22-their-city-burned-and-the-house-left-desolate (22:6–7); matthew-23-the-seat-
  of-moses-and-what-was-laid-on-it (23:2–9); matthew-24-the-temple-torn-down-and-the-question (24:1–3); -the-beginning-of-sorrows (24:4–14); -the-abomination-
  of-desolation (24:15–22); -false-christs-and-the-lightning (24:23–28); -heaven-and-earth-pass-but-my-words-shall-not (24:32–35); -the-day-and-hour-and-the-
  thief (24:36–44)), 1 unanchored thread anchored (lord-lord-and-torahlessness → Matthew 7:21–23). Same chain (`'b4'` in BATCHES; packets also offered a few
  threads anchored in Mark/Luke/the Psalms for the parallel-verse cards — 4 cards joined those: 24:15→Daniel 9:27 thread, 24:15→Luke 21:20 thread, 24:36→Mark
  13:32 thread, 24:29→Isaiah 24:23 thread). Five Sonnet 5.5 drafters in parallel → Fable read of every card (`_s496/tools/read496_b4.py`: 17 corrections —
  the brief's own instructions leaking into prose ("Keep the *like*", "each book is read in its own words", "says what it says") removed; two drafter-made
  threads folded back into the live threads whose anchors already hold the scene (evil-eye cards → the 20:1–16 vineyard thread, sons-of-Zebedee cards → the
  20:22–23 cup thread); the 1 Thessalonians 4:13 card under 24:31 now says plainly that the catching up of 4:17 is a later thing and the gathering of the
  elect is not it) → assemble PASS (43 drafter flags, all working readings inside the texts) → scratch ×2 + five tampers PASS → DEPLOYED Nov 13 21:34 CST
  (`_session496_matthew_b4_deploy.log`): 368/368 · 368/368 · 11/11 · 1/1 · 0 dups · 20–24 each 0 orphans · check496 PASS.
  Matthew orphans left: 198 (chapters 25–28: 69, 67, 37, 25). The cards as they read: `_s496/out/matthew_b4_cards.md`.
  HELD AS THE BRIEF SET THEM (ch 23–24): Moses' seat reads Moses and the Torah they wore stands (he wore the border himself, 9:20, 14:36); the proselyte's
  yoke (Acts 15:10) is the rite-first gospel, never the Torah; 21:43's nation is the gathered twelve tribes (Hosea 1:9–10, Ezekiel 37, 1 Peter 2:9–10), never
  the church; 24:31 is the gathering of the scattered tribes (Deuteronomy 30:4, Isaiah 11:12, 27:13, 43:5, 56:8, Jeremiah 31:8, Ezekiel 37:21), not a rapture;
  24:40–41 read with 24:39 and 13:30 — the taken are taken by judgment, tares first; 24:36 the Son submits to the Father and remains Elohim (God); Daniel and
  Revelation each read in their own words (Matthew 24:15 cites Daniel by name, so the Daniel 9:27/12:1 cards stand on Matthew's own citation); no drafter
  called him "the King" (the b3 lesson held).
  FOR THE RE-POINT PASS (with 3675): four more cards whose old note meant 1 John but whose target is the gospel of John — 3815 Matthew 21:28→John 2:3 ("the
  1234 of Truth"), 3912 22:40→John 4:7 and 3913 22:40→John 5:2 (love of Elohim and the brother; keep his commandments), 4009 24:9→John 2:18 (many antichrists).
  Also 3806 21:21→John 5:14 (meant 1 John 5:14 "according to his will"). All five written honestly to the John verse on the page meanwhile.
  FOR YOSHI TO SETTLE (flagged, not changed): 3756 Matthew 20:28→1 Timothy 2:5–6 Paul's *ransom for all* beside Matthew's *for many* — the card reads *all* as
  Isaiah's seed and says nothing more; 3979/3980 which Zechariah Matthew 23:35 means (Jehoiada's son, 2 Chronicles 24, or Berechiah's, Zechariah 1:1) — the
  cards hold both open; 4058 24:31→1 Corinthians 15:51 — the old note's "last trump = the seventh trumpet after the reign" was left out (Revelation re-map is
  hypothesis), the card says only the change at the trumpet of his coming.
  NEXT (S501): batch b5 = Matthew 25–28 (map counts 69, 67, 37, 25 = 198 — the last Matthew batch) — add `'b5': ('matthew', range(25, 29))`; re-dump first.
  Ch 25 (the virgins, the talents, the sheep and goats — the post-harvest sifting, works judged) and 26–27 (the Sanhedrin trial's Psalm 110 + Daniel 7, "his
  blood be on us" = system not people, the veil) carry the weight. After b5: Mark and Luke orphans per the S495 maps.
