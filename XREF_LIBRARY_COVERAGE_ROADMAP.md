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
- **2026-11-14 (S501) — MATTHEW REBUILD BATCH 5 (Matthew 25–28) DEPLOYED — THE MATTHEW REBUILD IS CLOSED.** Matthew re-dumped first (Nov 13 22:09 CST,
  orphan 198 confirmed). 198 orphan cards rewritten in place, 198 members (16 existing threads filled, 8 new: matthew-26-the-plot-and-the-passover-lamb (26:1–5);
  matthew-26-bethany-the-anointing (26:6–13); matthew-26-the-arrest (26:47–56); matthew-26-peters-denial (26:69–75); matthew-27-judas-and-the-potters-field
  (27:3–10); matthew-27-pilate-and-barabbas (27:11–26); matthew-27-the-burial (27:57–66); matthew-28-the-watch-and-the-story-they-paid-for (28:11–15)),
  14 unanchored S1xx threads anchored on the anchors their own summaries name (sheep-and-goats 25:31–46, virgins 25:1–13, last-supper 26:26–29, Sanhedrin-
  trial 26:64, thirty-pieces 26:14–16, the Psalm 22 cry 27:46, his-blood-be-on-us 27:25, the crucifixion 27:33–50, the veil 27:51, the resurrection 28:1–10,
  women-first-witnesses 28:1–10, great-commission 28:18–20, teaching-them-to-observe 28:20, the baptism name 28:19; the talents thread 25:14–30, saints-
  arising 27:51–53 and gethsemane 26:36–46 sit ready in ref/anchors496.json — no card joined them). Same chain (`'b5'` in BATCHES; common496's prose
  scan now also flags "the King" in a drafter's prose — the b3 lesson made a check). Four Sonnet 5.5 drafters in parallel → Fable read of every card
  (`_s496/tools/read496_b5.py`: 4 corrections — brief instructions leaking into prose at 26:57→Daniel 7:13 ("Daniel keeps the word like… all Daniel's own
  page gives"), 27:27→Genesis 3:15 ("so this is a reading line on line"), 28:1→Leviticus 23:15 ("Nothing here fixes a date"); a verse number cited in passing)
  → assemble PASS (27 drafter flags, all working readings inside the texts) → scratch ×2 + five tampers PASS → first deploy attempt 13:21 CST failed at
  connect (Render's IP allowlist — Yoshi's IP had changed; nothing sent) → DEPLOYED Nov 14 13:24 CST (`_session496_matthew_b5_deploy.log`): 198/198 ·
  198/198 · 8/8 · 14/14 · 0 dups · 25–28 each 0 orphans · **orphan cards left in the whole book: 0** · check496 PASS. The cards as they read:
  `_s496/out/matthew_b5_cards.md`.
  HELD AS THE BRIEF SET THEM (ch 25–28): the virgins, the talents and the sheep and goats are one judging of the household's works — *I know you not*
  (25:12) is said to the unfruitful of the house; the gathered *before him* are the elect gathered out of all nations (24:31, Ezekiel 37:21), sorted sheep
  from goat by what was done to *the least of these my brethren*, and the brethren are kin by the fathers' blood (Hebrews 2:11, 2:16, Psalm 22:22,
  Deuteronomy 17:15, Matthew 28:10, John 20:17); the nations of Isaiah 2:2, 60:1, 66:18, Micah 4:1, Zechariah 14:16, Joel 3:1, Revelation 21:24 come up to
  Zion in the reign and are not the heirs; the fire of 25:41 was prepared for the angels that sinned (2 Peter 2:4, Jude 6); Passover kept as Moses gave it
  and filled, not undone (Exodus 12, 1 Corinthians 5:7–8); the cup of 26:28 is the new covenant with both houses, Torah on the heart (Exodus 24:8, Jeremiah
  31:31–33); 26:64 Psalm 110:1 + Daniel 7:13 with Daniel's *like* kept and only Daniel 7:14 given him; Deuteronomy 19:15 — the Torah stood, the court did
  not keep it; Peter fell, wept, was restored, never condemned; 27:25 is on the rulers and the court that owned it, never a curse on a people (Zechariah
  12:10 the same house mourns); the thorns (Genesis 3:18, 3:15) read line on line, not as a stated fulfilment; the veil torn with the preparation and the
  Sabbath still kept; 28:16's mountain is not 17:1's or 5:1's; 28:18–20 — all power *given*, the one name of Father, Son and Ruach HaKodesh (no Trinity
  language, no collapse), *teach them to observe all things* = the Torah taught (5:17–19, 7:21, John 14:15); *all nations* = where the scattered sheep are.
  No drafter called him "the King".
  MATTHEW REBUILD TOTALS (b1–b5, S496–S501, Nov 10–14): 1,308 orphan cards rewritten in place → 0 orphans; 1,308 thread members; 30 new Matthew-anchored
  threads (3 + 5 + 3 + 11 + 8); 37 unanchored S1xx threads anchored (10 + 9 + 3 + 1 + 14); 5 migrations `session496_matthew_b1…b5_rebuild.sql`; Fable
  corrections ~20 (b1, counted from read496.py) / 12 (b2) / 34 (b3) / 17 (b4) / 4 (b5). The chain (`_s496/tools`) is the reusable UPDATE path for the rest of the orphan block.
  FOR THE RE-POINT PASS (with 3675, 3815, 3806, 3912, 3913, 4009): 4109 Matthew 25:41 → John 3:16 — the old note meant 1 John 3:16–18 (*not in word, but
  in deed*); written honestly to John 3:16 meanwhile.
  FOR THE PIPELINE (not changed, flagged): live Isaiah 2:2 reads *the mountain of the LORD'S house* — the possessive small-caps LORD'S is not restored
  (quoted as it stands in cards 3008/3009); live Luke 22:61 reads *Yahusha (Lord) turned, and looked upon Peter* and 1 Corinthians 11:23 *received of
  Yahusha (the Lord)… Yahusha (the Lord Jesus)* — the S182 NT-*Lord* rule (Lord referring to Yahusha stays *Lord*) is not applied there; quoted as they
  stand in the Peter-denial summary and card 4129.
  FOR THE SUMMARIES SWEEP: the 14 threads anchored today still carry their S1xx summaries ("the substantial-substance…", "the King", "grid", "FRAMEWORK-
  MAJOR", slug in bold code) — next after the centurion thread; the `_s499c` chain does title/summary.
  NEXT (S502): the Mark (169) and Luke (61) orphans, same chain, likely one session. Differences from Matthew: every Mark note and 56 Luke notes carry a
  `thread:slug |` prefix (no slug resolves to a live thread — strip it, pass it as a map hint); 5 Mark + 12 Luke DOCREF cards; packet496 hard-codes
  `live/canon__matthew.json` / `map/matthew_orphan_map.json` and must take the book from BATCHES (gen_sql/seed/check are keyed by `{book}_{batch}` already —
  verify before trusting); re-dump Mark AND Luke first (the Nov 9 dumps are stale); batches `'m1': ('mark', range(1, 17))` and `'l1': ('luke', range(1, 25))`,
  drafters by block (Mark 1–4 / 5–8 / 9–12 / 13–16; Luke 1–8 / 9–16 / 17–24), 4 reversed-pair dups each against Matthew cards now threaded and sound —
  retire the Mark/Luke orphan only if its Matthew twin says the same thing. Then the 24 stragglers (Joshua 12, Revelation 6, Romans 3, 1 Thess 2, Genesis/
  Ezekiel/2 Esdras/2 Baruch 1 each), the re-point pass, the summaries sweep.
- **2026-11-14 (S502) — MARK (169) AND LUKE (61) ORPHAN REBUILDS DEPLOYED — THE GOSPEL ORPHAN BLOCK IS CLOSED (Matthew 0, Mark 0, Luke 0).** Both
  books re-dumped first (Yoshi's paste, Nov 14 13:32–13:33 CST; orphan 169 / 61 confirmed, map ids = live orphan ids). The chain made two-book:
  `'m1': ('mark', range(1, 17))`, `'l1': ('luke', range(1, 25))` in BATCHES; `batch_of(book, ch)` + `split_prefix()` in common496; packet496 rewritten
  (book from BATCHES, `thread:slug |` stripped into `author_thread_hint`, `threads_on_the_target_verse` = the live thread whose anchor covers a
  parallel-verse target plus threads the other gospel's latest read-back shows a member on — `live/matthew_members.json` = matthew_b5_live_after);
  Matthew was also hard-coded where the prompt did not say: `compose_note` ("(Matthew N:V)" in the card itself — now the source book's title),
  check496 line 30, assemble496's file names, seed496's anchor tamper (`28:20` → the book's last verse), SQL/deploy comments; precheck496 takes
  `<ch> <book>`; assemble496 skips a chapter with no orphan cards (Mark 16, Luke 20, 22–24). Proven end to end in scratch on a 3-card Mark 15 test
  batch BEFORE drafting (Fable drafted those three). Brief: header + packet shape two-book; "Batch notes" rewritten for Mark and Luke (Mark 7 Lo-Ammi /
  *let the children first be filled* as an inference; Mark 7:19 the belly not the beasts; Mark 13:26 Daniel's *like* kept, 13:27 the gathering not a
  rapture; Mark 14:62 twin in the Sanhedrin thread; Luke 1 horn of salvation / covenant with Abraham; Luke 4 the widow and Naaman as seed revealed;
  Luke 7 the centurion the same; Luke 15 the prodigal = the divorced house, as a reading; Luke 17:34 taken by judgment; Luke 21:24 keep *Gentiles*,
  settle nothing). 17 anchors pre-seeded in ref/anchors496.json for unanchored wide threads the packets offered (1 used: beliar → Matthew 4:8–10).
  Eight Sonnet 5.5 drafters in parallel (Mark 1–4 / 5–6 / 7–8 / 9–12 / 13–14; Luke 1–8 / 9–16 / 17–21 — Mark 5–8 split so ch 7 had a drafter to
  itself) → Fable read of every card (`_s496/tools/read496_m1l1.py`: 10 corrections — brief phrases leaking into reader prose ("in its own words" ×3
  incl. two new-thread summaries, "line on line" at 7061), 5116 Mark 7:24 firmed from "looks like one of those sheep" to "is", 5253 a Mark 12:33
  callback in straight quotes made an italic citation, 7006 Luke 7:9 the centurion said as a sheep who heard out where the house was scattered, 5050
  El Elyon "Abram's own" → "goes back to Abram's day") → assemble PASS ×2 (20 drafter flags, working readings inside the texts) → scratch ×2 + five
  tampers PASS for both (the anchor tamper exercised on Luke) → DEPLOYED Nov 14 14:15 CST Mark, 14:16 CST Luke (`_session496_mark_m1_deploy.log`,
  `_session496_luke_l1_deploy.log`): Mark 169/169 · 169/169 · 4/4 · 0/0 · 0 dups · **0 orphans in the book** · PASS; Luke 61/61 · 61/61 · 1/1 · 1/1 ·
  0 dups · **0 orphans in the book** · PASS. Mark: 68 existing threads filled (37 Mark-anchored, 23 Matthew-anchored for the parallel-verse cards,
  8 wide), 4 new (mark-9-the-son-of-adam-must-suffer-and-be-killed-isaiah-53-zechariah-13 9:9–32; mark-12-more-than-all-whole-burnt-offerings-the-
  scribe-says-what-the-prophets-said 12:28–34; mark-13-signs-and-wonders-do-not-vouch-for-the-prophet 13:22; mark-13-the-son-of-adam-coming-in-the-
  clouds 13:26 — takes the Matthew 24:30 card too, one scene one thread). Luke: 45 existing filled (24 Luke-anchored, 16 Matthew-anchored, 5 wide),
  1 new (luke-1-the-throne-of-his-father-david-and-the-kingdom-without-end 1:31–33). The cards as they read: `_s496/out/mark_m1_cards.md`,
  `_s496/out/luke_l1_cards.md`.
  REVERSED-PAIR DUPS (4 Mark: 5069, 5144, 5231, 5328; 4 Luke: 7007, 7022, 7044, 7056): ALL KEPT — the Matthew twin is the card on Matthew's page;
  retiring the Mark/Luke orphan would strip the link from the Mark/Luke chapter-end, and the chain deletes nothing. Each written from Mark's/Luke's side
  (what this gospel adds) and joined to the twin's thread. Two twins are themselves still shorthand — 3013 Matthew 26:64→Mark 14:62 ("The Markan-
  parallel.") and 120012 Matthew 6:14→Mark 11:25 (no prose) — for the re-point/sweep list.
  HELD AS THE BRIEF SET THEM: the Sabbath scenes clear the fence and keep the day; Mark 7:19 is the belly and the draught, Leviticus 11 stood for
  Peter (Acts 10:14); the Syrophenician is one of the lost sheep (Matthew 15:24 said to the disciples), the children first, no "Gentile woman"; the
  twelve are the tribes; Mark 12:26 the fathers asleep awaiting the rising; Mark 13:26/14:62 Daniel's *like* kept, Revelation 1:7 and Zechariah 12:10
  each in their own words, never through each other; 13:27 the gathering of the scattered out of all nations (Deuteronomy 30:4, Ezekiel 37:21), tares
  out first (Matthew 13:41); the new covenant cup with both houses; Luke 3:8 the stones = the scattered house (Hosea 1:10), not nations by faith; Luke
  4:25–27 and 7:9 seed revealed, never "individual mercy"; Luke 12:47 the household's servants judged; Luke 17:34 taken by judgment; Luke 21:24
  *Gentiles* kept as the verse has it, who they are not settled. No drafter called him "the King"; all Greek-form names in OT spellings; the old
  notes' Kefa/Yochanan/Eliyahu/Zakkay → Peter/John/Elijah/Zacchaeus.
  FOR THE SUMMARIES SWEEP (drafters flagged, cards do not follow them): matthew-8-many-from-east-and-west… ("Gentile soldier", "believing stranger" —
  already listed); matthew-3-fruits-meet-for-repentance-stones-to-abraham… (reads the stones as nations grafted in); matthew-13-the-mustard-seed-the-
  leaven… (reads leaven as the kingdom's growth; the cards read corruption); both Luke 4 Nazareth threads (nazareth-scroll-…-individual-mercy-contrast-
  cases and its sibling — "individual mercy" in title and summary); mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach ("the King",
  "diagnostic"); gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit (old shorthand); rich-man-and-lazaros-the-framework-honest-
  sheol… (slug and summary say "framework"). The `_s499c` chain does title/summary.
  FOR THE RE-POINT PASS: 3013 and 120012 above (shorthand twins on Matthew's page). FLAGGED, NOT CHANGED: 5177/9:13→Matthew 23:35 holds Jehoiada and
  Barachias open (as b4); 5232 Mark 11:27→Matthew 16:13 is a loose pair (who he is / by what authority), written honestly; 7011 Luke 7:33→1 Kings 19:8
  rests on the forty days, not a fast; 5172 (9:9→Isaiah 53:3) sits in the new Mark 9 passion thread whose anchor 9:9–32 overlaps the Elijah thread's
  9:9–13 — move it if Yoshi prefers.
  GOSPEL ORPHAN BLOCK TOTALS (S496–S502, Nov 10–14): Matthew 1,308 + Mark 169 + Luke 61 = 1,538 orphan cards rewritten in place → 0 in all three;
  1,538 members; 35 new threads (30 + 4 + 1); 38 anchors (37 + 1); 7 migrations. Left of the Phase 2 orphan block: the 24 stragglers (Joshua 12,
  Revelation 6, Romans 3, 1 Thessalonians 2, Genesis / Ezekiel / 2 Esdras / 2 Baruch 1 each) — a different shape (no gospel threads to lean on; the
  extras need the edition in the chain's `t_ed` guard, which is canon-only: see assemble496 `if c['t_ed'] != ED`).
  NEXT (S503): the 24 stragglers (extend the chain for non-canon targets or do them by hand in one small migration), then the re-point pass (3675,
  3815, 3806, 3912, 3913, 4009, 4109 + 3013, 120012), then the summaries sweep (centurion thread first, the 14 S1xx threads anchored in S501, the list
  above) on the `_s499c` chain.
- **2026-11-15 (S503) — THE 27 STRAGGLERS DEPLOYED (0 orphans in the whole library); THE RE-POINT PASS DEPLOYED; 14 THREAD SUMMARIES REWRITTEN.**
  THE STRAGGLERS (a). The eight books re-dumped first (Yoshi's paste, Nov 15 20:00 CST; the open prompt's "24" was a miscount — 12 Joshua 12 + 6
  Revelation 1/11/20 + 3 Romans 11 + 2 1 Thessalonians 4 + Genesis 35, Ezekiel 17, 2 Esdras 7, 2 Baruch 50 one each = 27). A small EDITION-AWARE
  chain `_s503/tools` beside `_s496` (common503 / dump503 <edition> <book> / packet503 / build503 / gen_sql503 / check503 / seed503 / gen_deploy503):
  the lookup view carries `e.slug`, so 2 Esdras and 2 Baruch sources and Testaments XII (140:8 ×2, 60:1) and Ascension of Isaiah (9:9, 4:17) targets
  resolve; canon targets from parsed/canon.json, extras targets from the live text (the S495 target_text convention). Fable drafted and read all 27
  (no fan-out at this size); every card joined a thread already anchored on its own verses — 16 threads, 0 new, 0 anchors. Scratch ×2 + four tampers
  PASS on the Nov 9 read-backs, then again on the fresh ones. DEPLOYED 20:13 CST (`_session503_stragglers_deploy.log`): 27/27 · 27/27 · 0 dups ·
  **orphans left 0 in all eight books** · PASS. With the gospel block (S496–S502) that is **0 orphan cards in the whole library**: Phase 2's orphan
  block is CLOSED (1,538 + 27 = 1,565 cards). Thread choices to know: 177479 Revelation 20:7 → Isaiah 24:22 joined the dragon-bound thread
  (20:1–3, which carries Isaiah 24:22 and the loosing), not Gog-and-Magog (20:7–8); 133755 2 Baruch 50:3 → John 20:25 joined resurrection-keeps-the-form.
  THE RE-POINT PASS (b) — Yoshi: "move them". 3675 Matthew 19:16, 3815 21:28 → 1 John 2:3; 3806 21:21 → 1 John 5:14; 3912 22:40 → 1 John 4:7; 3913
  22:40 → 1 John 5:2; 4009 24:9 → 1 John 2:18; 4109 25:41 → 1 John 3:16 — a `target_verse_id` UPDATE each (id, source, thread kept; note and member note
  rewritten Come-and-See to the 1 John pair), guard: the card must still read as written to the John verse (or already as the new card), and no live
  card may already hold the new pair. Plus 3013 (26:64 → Mark 14:62, "The Markan-parallel.") and 120012 (6:14 → Mark 11:25) rewritten in place.
  `session503b_matthew_repoint.sql`; DEPLOYED ~20:38 CST with the centurion thread, check503b PASS. **Three more of the same slip found afterward,
  not in the list, FOR S504: 3206 Matthew 28:20 → John 2:3 and 3207 28:20 → John 5:2 (the "teaching them to observe" thread; the notes mean 1 John
  2:3 and 5:2) and 3634 Matthew 18:19 → John 5:14 (1 John 5:14, asking according to his will).** Yoshi's standing answer on the pattern is "move them".
  THE SUMMARIES SWEEP (c) — `_s503/tools/build503c <slug>` / gen_sql503c / check503c / seed503x (the S499c chain made general: title + summary + any
  named member cards). Yoshi read every summary before deploy. (1) The centurion thread 30423 (matthew-8-many-from-east-and-west…): title + summary
  + 7 of 9 member cards (121850, 2547, 121852, 121853, 121854, 121855, 5513 — "the stranger grafted in" / "the centurion is the firstfruit" gone; the
  centurion a sheep who heard out where the house was scattered, Luke 7:5; the many from east and west = Isaiah 11:12 / Psalm 107:3 / Isaiah 49:12,
  the outcasts and the dispersed; 8:12 = the sifting of the house, Luke 13:28, Romans 11:1; "Gentiles" kept where Malachi 1:11 has it). (2) The 14
  S1xx threads anchored in S501: 13 rewritten (sheep-and-goats already clean) — sanhedrin-trial (Psalm 110 + Daniel 7 at his own mouth, Daniel's
  *like* kept, title-naming at the trial, Revelation 1:7 and Matthew 24:30 each in its own words); eli-eli (Psalm 22 whole, Hebrews 2:11–12 *all of
  one*, Psalm 31:5); the crucifixion (Psalm 22 / Isaiah 53 / Zechariah 12:10 + 13:7 / Amos 8:9 / Psalm 69:21, Genesis 3:18 line on line not stated,
  Deuteronomy 21:23 the Torah kept at the cross); the veil (Exodus 26:33, Leviticus 16:2, Hebrews 10:19–20, Isaiah 25:7, Luke 23:56 — the Sabbath
  still kept, nothing abolished); his-blood-be-on-us (Deuteronomy 21:8, Jeremiah 26:15, Acts 5:28 *upon us* = the court, Matthew 23:35–37, Zechariah
  12:10 + 13:8 the same house mourns — never a curse on a people; the "Yom Kippur blood" angle dropped, no verse carried it); last-supper (Passover
  kept and filled, Exodus 12:14, 1 Corinthians 5:7–8, Exodus 24:8, Jeremiah 31:31–33 both houses, Leviticus 17:11, Isaiah 25:6 + Revelation 19:9);
  thirty-pieces (Zechariah 11:12–13, Exodus 21:32 the gored servant's price, Psalm 41:9 + John 13:18); ten-virgins (oil = Ezekiel 36:26–27 +
  Jeremiah 31:33, Zechariah 4; the five outside are of the house, Matthew 7:21–23 + Luke 13:25, Genesis 7:16 — the sifting at the door); the
  resurrection (Psalm 16:10 via Acts 2:31 / 13:35, Hosea 6:2, Jonah 1:17 + Matthew 12:40, Leviticus 23:10–11 the firstfruits sheaf + 1 Corinthians
  15:20–23, Romans 1:4); women-witnesses (Luke 8:2–3, 27:55–56, 27:61, 28:1–10, Mark 16:9, John 20:17–18, Deuteronomy 19:15 two witnesses,
  Proverbs 31:10); great-commission (*all nations* = where the sheep are, not who they are; Daniel 7:14 power *given*; 10:5–6 / 15:24 the fence that
  came down; Hosea 1:10, Isaiah 11:11–12, Ezekiel 37:21, Romans 9:26, James 1:1, 1 Peter 1:1; Micah 4:2 the nations' later hour); teaching-to-observe
  (5:17–19, 7:21, John 14:15/21, 1 John 2:3 + 5:2, Romans 3:31, James 2:14, Ezekiel 36:27, Revelation 14:12 + 22:14); baptism-in-the-name
  (**Yoshi's correction: the one all-encompassing name is Yah, as in HalleluYah** — Psalm 68:4's JAH, in Yahuah and in Yahusha, the Spirit sent in it,
  Revelation 19:1 Alleluia; Acts 2:38 / 8:16 / 19:5 one name; he is Elohim and has a Father, no Trinity words, no collapse). Each summary opens
  *It ain't new* where the older scripture held it; every quote stand-alone italic with citation from parsed/canon.json. Scratch (seed503x) 6/6 ×13;
  DEPLOYED 23:01 CST (`_session503_sweep13_deploy.log`): 13 × check503c PASS. Migrations: `session503_stragglers_rebuild.sql`,
  `session503b_matthew_repoint.sql`, `session503c_<thread>.sql` ×14 (centurion + 13).
  FOR THE PIPELINE (not changed, flagged): parsed/canon.json John 20:25 *We have seen Yahusha (Lord)* where live reads *the Lord* (S182 rule — the
  parsed file is behind the live text here, the reverse of Luke 22:61); Psalm 68:4 still reads **JAH** (rule: → Yah); Isaiah 12:2 and 26:4 read
  *Yahuah (LORD) JEHOVAH* (the KJV doubled name, unrestored); Matthew 22:45 / 25:11 / 7:21 render *Adonai (Lord)* for the vocative to Yahusha.
  THE NEXT BLOCK — PHASE 3, THE THREADED SHORTHAND (found tonight while sweeping): the Phase 2 rebuild only reached ORPHAN cards. Cards that were
  already in a thread kept their S1xx notes. Counted on tonight's read-backs (16 books): **1,504 threaded cards still trip the jargon/forbidden scan**
  (Matthew 396, Luke 350, Mark 243, 2 Baruch 162, Testaments XII 105, Genesis 66, Ezekiel 49, Revelation 36, 1 Enoch 29, Joshua 20, Romans 19…);
  **746 carry a reader-visible `thread:slug |` prefix in the live note** (Luke 340, Mark 304, Ezekiel 41, Genesis 31, Revelation 15); **180 Matthew
  stubs under 60 characters** ("The Markan-parallel.", "The substantial-…"); a further 2,147 only miss sacred-name parentheticals. The 14 S1xx threads
  rewritten tonight alone hold ~230 such member cards (sanhedrin 20, crucifixion 26, great-commission 26, sheep-and-goats 24…). Same shape as the
  orphan rebuild (packets → Sonnet drafters → Fable read → UPDATE in place), but the guard is "member of thread X with member note Y", not "orphan" —
  build503c already does single cards; it needs a packet step and batching by thread or chapter. Counting script: the one-off in this session; make it
  `_s503/tools/shorthand_census.py` first thing.
  NEXT (S504): (1) the three re-points 3206, 3207, 3634 (one small migration on the S503b chain); (2) the rest of the S502 sweep list — matthew-3
  stones ("nations grafted in"), matthew-13 mustard-seed/leaven ("growth"), both Luke 4 Nazareth threads ("individual mercy"), mark-7 corban ("the
  King", "diagnostic"), gathering-of-the-scattered-twelve-tribes-in-sirach…, rich-man-and-lazaros… ("framework" in slug — keep slug, rewrite summary) —
  the sweep chain is ready, Yoshi reads each; (3) the Phase 3 census and its first batch (Luke's 340 `thread:` prefixes are the ugliest reader-facing
  thing and the most mechanical fix). SEPARATE, Yoshi asked tonight: the app VISIT COUNTER (a visit_events table — time, user if signed in, anonymous
  id if not, app or walk site — written on sign-in and page load; a migration + API line + PWA beacon + Render deploy, his push) so "how many different
  people, how many times each, per day" becomes one query; today the DB has only users.last_seen_at. Baseline Nov 15: 78 accounts, 22 seen in 30
  days, 8 in 7 days, 2 today, 17 on a paid tier incl. trials/comps, 7 paying (`_s503/out/users_baseline_2026-11-15.txt`). Housekeeping with it:
  duplicate active subscription rows (assemblyofrop ×2 everything, Jeni ×2 complete_study) and a duplicate account (Goshen24 ×2).

- **2026-11-15/16 — S504 (Claude Fable 5.1) — visit counter DESIGNED (not coded); re-point ×3 BUILT and DEPLOYED (23:52 CST, check503b PASS); Phase 3 census RUN.**
  NO LIVE DATABASE THIS SESSION: the Mac-side shell's volume was full (9.8 GB at 100%, not our folder) so asyncpg would not install; every DB touch
  became a paste for Yoshi. Deploy state at close: S503 pushed Nov 15 23:40; nothing of S504 deployed.
  (a) THE VISIT COUNTER — `S504_VISIT_COUNTER_DESIGN.md` (one page, Yoshi reads before code). FINDING: half of it already exists — S467b built
  `user_activity_days` (one row per signed-in person per Central day: first/last, visits with a 30-quiet-minute rule, active_seconds, hits), written in
  `upsert_user` on every authenticated request, table created at API startup (email_prefs.ensure_email_columns), report
  `python -m jobs.activity_report --days 30`. So daily distinct sign-ins and visits-per-person have been counted since S467b deployed; what is missing is
  the ANONYMOUS reader (free canon in the PWA, the whole walk site), the surface, a raw log, and one report. Design: `visit_events` (ts, user_id null,
  anon_id = sha256(ANON_SALT+browser UUID) — localStorage, NOT a cookie, no IP ever; surface app|walk; path; edition/book/chapter) — one row per VISIT,
  written in upsert_user only when the S467 upsert opened a new visit (so the two tables agree), and by `POST /v1/visit` beacon (204, 30-min dedupe)
  from app/src and walk/build.mjs's page script; view `visit_days` unions both; report `_s503/tools/visits_report504.py` (same shape as
  users_baseline503); raw kept 400 days, pruned by the daily trial-reminders cron; migration `session504_visit_events.sql` first, then Yoshi's push
  (Render auto-deploys api/pwa/walk), one env var ANON_SALT. Housekeeping SETTLED Nov 15 23:54 (Yoshi: he has no way of knowing which stays, so the data decides — keep the Stripe-billed row / the account with the paid subscription; the other marked ended, nothing deleted) — sibling migration in S505: assemblyofrop ×2 everything/active,
  Jeni ×2 complete_study/active (proposal: keep the Stripe-backed row, status=canceled + ended_at on the other, nothing deleted); Goshen24 ×2 accounts
  (keep the paying one; show both rows + the WP id first). Paste to see what S467 has counted: `cd ~/Desktop/App/api && python3 -m jobs.activity_report --days 30`.
  (b) THE THREE RE-POINTS — 3206 Matthew 28:20 → 1 John 2:3, 3207 28:20 → 1 John 5:2 (thread 20 teaching-them-to-observe…), 3634 18:19 → 1 John
  5:14 (thread 43283 binding-and-loosing; its S501 note had forced sense onto the gospel verse — moved, as Yoshi's standing answer says). Fable drafted,
  added to out/draft503b.json (ids 10–12), build503b PASS (S503B_IDS=3206,3207,3634 — fix/repoint503.json now holds these 3; the deployed 9 are in
  `_session503_repoint_deploy.log`), `data-schema/migrations/session503b2_matthew_repoint3.sql` (same guards: old pair + old note or already new;
  live text unmoved; member row carries old or new note; no card holds the new pair). Built against the post-deploy Matthew dump (Nov 16 05:01 UTC =
  23:01 CST, nothing touched Matthew since) — the re-dump could not run; the guards cover it. DEPLOY PASTE (Yoshi, from Terminal):
  `bash ~/Desktop/App/_s503/deploy/_session503_repoint3_deploy.sh` (applies, re-dumps Matthew, check503b must end PASS). Then `git push` — his.
  (c) THE S502 SWEEP LIST — NOT STARTED (Luke/Mark dumps on disk are Nov 14; re-dump first: `python3 _s503/tools/dump503.py canon luke` and `canon mark`).
  (d) PHASE 3 CENSUS — `_s503/tools/shorthand_census.py` written and run on the 16 dumps → `_s503/out/shorthand_census_2026-11-16.md/.json`.
  **1,781 threaded cards need a rewrite** of 11,031 threaded (230 orphans on the Nov 14 Luke/Mark dumps — those were closed by S502/S503 deploys; the
  dumps predate them): `thread:` prefix 745 · forbidden/EXTRA scan 1,503 · stub < 60 chars 206; a further 2,134 only miss a sacred-name parenthetical.
  By book: Matthew 484 (177 stubs, 115 "the King", 99 hyphen-chains, 88 "substance"), Luke 383 (340 prefix), Mark 335 (304 prefix), 2 Baruch 162 (all
  abbreviated book names), Testaments XII 105 (abbreviations), Genesis 86, Ezekiel 76, Revelation 46, 1 Enoch 30, Romans 23, Joshua 20, the rest ≤ 10.
  623 threads carry shorthand members. Worst: scattered-seed-gathering (id 4) 41 of 67; effort-over-accomplishment (229) 40/40 across 8 books;
  the-east-as-the-direction… (444) 33/33 Ezekiel; the-face-of-yahuah… (443) 31/31 Genesis; crucifixion (19) 30/51; great-commission (8) 28/37;
  gethsemane (7) 26/27; sanhedrin (17) 23/32; last-supper (11) 21/26; heart-torah-not-abolition (9) 20/24; talents (13) 20/20.
  PROPOSED FIRST BATCH (S505): the 13 S1xx threads whose SUMMARIES S503 already rewrote — their ~230 member cards (crucifixion 30, great-commission 28,
  gethsemane 26, sanhedrin 23, last-supper 21, talents 20, sheep-and-goats 19, women-witnesses 18, baptism-in-the-name 17, eli-eli 14, resurrection 14,
  his-blood 13, veil 12, ten-virgins 12, thirty-pieces 11) — the summaries are clean, so the member notes can be written to them; then Luke's 340
  prefixes thread by thread (effort-over-accomplishment 40, son-of-adam-as-judge 16, my-sheep-hear 12, the-seventy 11). Mechanics: build503c already
  takes named member cards per thread; it needs a packet step (packet503 → Sonnet first drafts, Fable reads) and the census JSON as its worklist.
  2 Baruch's 162 and Testaments XII's 105 are a different fix (abbreviated book names in otherwise clean notes — a mechanical expansion, one
  migration, no redraft).

- **2026-11-16 — S505 (Claude Fable 5.1) — visit counter CODED (pushed; PWA + API deploys needed two follow-up pushes); S502 sweep list BUILT (7 threads, not yet deployed); abbreviation expansion BUILT (264 cards, not yet deployed).**
  Mac shell volume still 100% full → every DB step a paste; scratch proofs ran on a real Postgres 16 in the cloud sandbox and died with it.
  (a) THE VISIT COUNTER — exactly the S504 design: `data-schema/migrations/session504_visit_events.sql` (table + 3 indexes + view `visit_days`;
  signed-in APP visits are read from `user_activity_days`, everything else from `visit_events`), `api/visits.py` (POST /v1/visit, 204 always — even a
  bad body; sha256(ANON_SALT + anon_id); no salt → anonymous rows are simply not written; query string never stored, only ?book/?chapter/?edition;
  30-min dedupe per reader per surface), `upsert_user` wraps the S467 upsert in a CTE that reports whether it OPENED a visit and then writes one
  `visit_events` row (deduped against a beacon row), `app/src/lib/visit.ts` + `recordVisit()` in main.tsx (UUID in localStorage `rop_visit_id`,
  no cookie), six lines in walk/build.mjs's page script, `ANON_SALT` (sync: false) in render.yaml, 400-day prune first thing in
  jobs/trial_reminders.py, `_s503/tools/visits_report504.py` (baseline on top). `api/apply_migration.py` now prints RAISE NOTICE lines.
  Sibling `session504_housekeeping.sql` per the settled rule (prints six rows, RAISES if the data does not fit; Goshen24: refuses if the FREE
  account was seen more recently than the paying one). Scratch: 1st request opens a visit, 2nd does not, beacon dedupes, 40-min gap opens one,
  view = activity table. DEPLOY: Yoshi pushed 6ec9b88; PWA build failed on a TS narrowing in visit.ts (fixed, 2nd push); API failed to START
  because the push took api/main.py (imports walk) without the untracked WALK 1 files — 3rd push adds api/walk.py, walk/data, Dockerfile line,
  .gitignore, walk/photos.mjs, walk/public. LESSON: a `git add` list must include every untracked file the listed files import. Migrations
  (visit_events, housekeeping) and ANON_SALT are Yoshi's pastes/clicks — see S506 prompt for the state check. Privacy sentence handed to Yoshi.
  (b) THE S502 SWEEP LIST — 7 thread summaries rewritten (slug kept, 0 cards): 30413 matthew-3 stones (Joshua 4 tribe-stones in the Jordan; Hosea
  1:10, Ezekiel 37 — the scattered house, not nations grafted); 30901 matthew-13 mustard/leaven (leaven = corruption: Exodus 12, Leviticus 2,
  Matthew 16, Luke 12, Galatians 5; mustard = herb grown past its kind, Daniel 4 / Ezekiel 31 trees, Ezekiel 17 cedar still to come — FLAGGED
  to Yoshi, he only ruled on the leaven); 221 gathering (jargon gone; 2 Esdras 13:40/48, Tobit 13:5, Sirach 36:1/11, Ezekiel 37:21, Deuteronomy
  30:3; Canaanite woman = seed revealed by hearing); 554 Nazareth scroll (stopped at the comma; widow + Naaman = seed revealed, John 10:16/27);
  636 Luke 4 / Sirach 48 (48:12 now quoted as the live text reads — old summary mis-quoted it); 622 mark-7 corban (no "the King"/"diagnostic");
  571 rich man (Luke's words: bosom, torments, gulf; Enoch 22 dropped from the summary; John 11–12 proof). build503c PASS ×7, scratch twice PASS
  (controls byte-identical). Read file `_s503/out/sweep7_s505_read.md`. Deploy pastes: `_s503/deploy/_session503_sweep7a_deploy.sh` (Matthew
  3) and `_session503_sweep7b_deploy.sh` (Luke/Mark 4; re-dumps luke + mark — gen_deploy503bc now re-dumps every anchor book). Luke/Mark
  built on the Nov 14 dumps; guards cover it.
  (c) PHASE 3 — the cheap one done first: `_s503/tools/gen_sql505_abbrev.py` → `session505_abbrev_book_names.sql` (264 cards: 2 Baruch 161,
  Testaments XII 103; opening `Prov 6:23` → `Proverbs 6:23`, `1 Jn` → `1 John`; each abbreviation checked against the card's own target before
  generation; note + member note; nothing else touched); scratch twice PASS; `check505_abbrev.py`; paste `_s503/deploy/_session505_abbrev_deploy.sh`.
  NOT STARTED: the packet step on build503c and batch 1 (the 13 S1xx threads' ~230 member cards) — S506's first item after the deploy checks.

- **2026-11-16 — S506 (Claude Fable 5.1) — DEPLOY STATE CONFIRMED GREEN (counter live, sweep7 + abbreviations in); PHASE 3 BATCH 1 BUILT AND DEPLOYED — the 13 clean-summary S1xx threads' member cards, 232 cards in 4 pastes.**
  Yoshi answered the five S505 questions yes ×5; `visits_report504` rows prove the counter (visit_events since Nov 16 00:23). Mac shell volume still 100% full and no DNS to the DB host → every DB step a paste; scratch proofs on Postgres 16 in the cloud sandbox.
  (a) THE PACKET STEP — `_s503/tools/packet506.py <slug>`: a book dump carries only the members whose card touches that book, so the thread's members are MERGED from every dump on disk into `out/packet506/<slug>_readback.json` (read-back shape + books/editions; the thread record from the FRESHEST dump — the first version took it from the alphabetically-first dump and showed S503's summaries as undeployed, a false alarm), plus the packet `.md/.json` (title, live summary, every member card whose note OR member note is still shorthand: both verses, neighbours, old note, old member note). `prep506.py` pins a card's prose when its note is already clean (member line only) or already built for another thread in fix/sweep506 — a card's note is ONE text on its verse pair; only the member line is per thread (3216/3217 shared by resurrection + women). `check506.py <slug> <live-dir>` merges and runs check503c. `run506_group.sh <group> <slug>...` = prep → build503c (S503_OUT/S503_FIX=sweep506, merged read-back) → gen_sql503c (S503_TAG=506 → `session506_<short>.sql`) → read file `out/s506_<group>_read.md` → `gen_deploy506.py` (re-dumps every contributing book, check506 on the live dir). Patches: build503c/gen_sql503c/check503c take S503_OUT/S503_FIX/S503_TAG env (defaults unchanged); gen_sql503c's thread UPDATE now fires only when old≠new (an unchanged summary no longer reports "thread rewritten 1" on every run); seed503x takes `--redump` (seed from the merged fixture, re-dump the real books) and its run-1 assertion knows an unchanged thread.
  Drafting: brief `DRAFT_BRIEF.md` (sandbox); Sonnet first draft per thread, Fable read every card (corrections: ten-virgins 2973 said Isaiah 55 offers "the oil" free — wine and milk; women 5359 garbled Luke 23:49; baptism 3194/3196 leaned toward counting persons — reworded to "all three are there, and the name is one"; sheep-goats 2917 had the sheep standing apart from the seed, 2921 said the brethren are "not a family by birth" — they are the seed; plus parentheticals, 9-word runs, re-quotes). Checker reality: prose must say "Yahusha (Jesus)", never "Yahusha HaMashiach (Jesus Christ)" or "Yahuah Tseva'ot (…)" — BARE_SACRED backtracks onto the bare name.
  (b) DEPLOYED (each: build503c PASS, scratch ×2 PASS 6/6 + one note-tamper → guard RAISED, migrations byte-identical to the proved ones, live check PASS): g1 11:42 CST — thirty-pieces 11, veil 12, ten-virgins 12, his-blood 13 (`_session506_g1_deploy.log`); g2 11:50 — eli-eli 14, resurrection 14, baptism-in-the-name 17, women-witnesses 18 (16 notes + 2 already there — the shared cards, by design); g3 11:57 — sanhedrin 23, last-supper 21, sheep-and-goats 19, great-commission 28; g4 12:05 — crucifixion 30 (`_session506_g4_deploy.log`, notes 30, check PASS). **Batch 1 CLOSED: 232 cards, 13 threads, 4 pastes, 0 guard RAISEs.** Summaries untouched (thread rewritten 0 / already there 1 everywhere). Sheep-and-goats' live summary was checked clean (305 words, the sifting-of-the-gathered reading) though S503 had no sweep file for it.
  NOT DONE: gethsemane (26) and talents (20) — their live summaries are still S1xx shorthand, so they need a summary rewrite (Yoshi reads it) in the same migration as their member cards; then Luke's 340 `thread:` prefixes thread by thread (effort-over-accomplishment 40 across 8 books first). Mustard seed (30901) stays as deployed ("herb grown past its kind") — Yoshi did not rule; rewrite on his word. Phase 3 census after this batch: re-run `shorthand_census.py` on fresh dumps at S507 open (expect ~1,549 of 1,781 left).

- **2026-11-16 — S507 (Claude Fable 5.1) — PHASE 3 BATCH 2 DEPLOYED: gethsemane + talents (summaries + 46 cards, g5 12:28 CST) and the first four Luke-batch threads (summaries + 135 cards, g6 16:26 CST); the census became library-wide (38 dumps).**
  Mac shell volume still 100% full → every DB step a paste; scratch proofs on Postgres 16 in the cloud sandbox (kit = S506 kit + this session's files; it died with the sandbox).
  (a) CENSUS. The g4 deploy's read-back was 3 minutes old, so no re-dump paste: 1,550 of 11,261 threaded (16 dumps). After g5 Yoshi ran `dump507_thread.py` (NEW, read-only: dumps every book a thread's members
  touch — a thread whose members span books with no dump on disk cannot be merged by packet506) for the four Luke threads + 2 Baruch + Testaments XII → 38 dumps on disk; the SAME census then read
  **2,650 of 25,662 threaded** (prefix 1,038 · scan 2,270 · stub 63; names-only 6,755). The old 1,781 / 1,550 figures were the 16-book slice. After g6: 2,529; after the effort3 follow-up ≈ 2,515.
  (b) GETHSEMANE (7, 26 of 27) + TALENTS (13, 20 of 20): both live summaries were S1xx shorthand → title + summary written by Fable (It ain't new; every verse whole, stand-alone italics, verbatim against
  parsed/canon.json; gethsemane: Psalm 42:5, 75:8, Isaiah 51:17/22, Matthew 20:22, Luke 22:42–44, John 5:19 / 12:27 / 10:18, Luke 23:46, Hebrews 5:7–8, Philippians 2:5/8, Genesis 22:2 side by side not stated,
  Zechariah 13:7 — he is Elohim (God) and has a Father, no Trinity words, no collapse; talents: his own servants, Luke 19:12–13, Mark 13:34, Matthew 25:19–30, Luke 12:47, Matthew 8:12 = the cast-out servant is of
  the house, Proverbs 13:4 / 6:6, Daniel 7:18/27 in its own words, Matthew 19:28, Revelation 2:26 / 5:10 in its own words, 1 Peter 4:10, Matthew 24:42). Yoshi read both (read file `_s503/out/s507_summaries_read.md`)
  and said go. Cards: Sonnet 5.5 first drafts (two drafters), Fable read every card — 3055 "no picture, a real cup" (the cup is Isaiah's figure), 3056 "someone has to hold it in her place" removed (Isaiah 51:23 sends
  it to her afflicters), 3064 brief-leak tightened, 2980 Revelation 5:10 read through Daniel 7 removed, 2983 made plain, 5352 a 9-word run. run506_group g5 → build PASS ×2, scratch ×2 PASS 6/6 + tamper RAISED →
  DEPLOYED 12:28 CST (`_session506_g5_deploy.log`: 26/26 + 20/20, thread rewritten 1 each, check PASS ×2). Migrations `session506_gethsemane-cup-of-suffering.sql`, `session506_parable-of-the-talents.sql`.
  (c) THE LUKE BATCH — the prompt's "Luke's 340 prefixes" is really the per-thread work: every one of the four threads' LIVE SUMMARIES tripped the scan itself ("framework", "register", "the King", Hebrew book
  names, FRAMEWORK-MAJOR), and `effort-over-accomplishment` (229) is **77 members across 26 books**, not 40 (21 sat on no dump — hence dump507_thread). Four summaries written by Fable, Yoshi read all four
  (`_s503/out/s507_summaries_read_c.md`; he kept the Deuteronomy 32:8 "oldest copies read sons of Elohim (God)" line and the Formed-one-above-the-ladder line as written): 229 (Proverbs 24:16 hinge; nobody is the
  man who never fell; the just rises, the wicked stops his ears; Ezekiel 36:22 → 26–27 → 31 the new heart loathes itself; names blotted out; Ephesians 2:8–9–10 "the pulpit stops after the second"; "period where
  there was a colon" kept; Luke 17:4; Isaiah 46:9–10 quoted as the text reads, not "El"); 692 son-of-adam (Genesis 5:1 + Luke 3:38; John 1:51 + Genesis 28:12–13 he is the ladder; John 5:27 judgment because of the
  name; Daniel 7:13–14 with the *like* kept; Psalm 8; Mark's four uses, master of the sabbath ≠ the sabbath put away; Isaiah 53:11; Hebrews 2:16; Ezekiel 1:26 → John 3:13 / 6:62 / 13:31); 680 my-sheep (Ezekiel
  34:11–12 first; John 10:26–29 "read the order"; John 8:47, 6:65, Matthew 13:11; Jeremiah 31:3, Romans 8:29, Revelation 13:8; Luke 7:50 / 18:42 = a sheep hearing; John 10:16 other sheep = the scattered of the house;
  Matthew 10:14 / 7:6; Luke 15:4; "Hearing does not make a sheep. It finds one."); 558 the-seventy (Genesis 10:32, 46:27, Exodus 1:5, Deuteronomy 32:8–9, Psalm 82:6–8 the princes over the nations, Numbers 11:16,
  Luke 10:9/11/17–22, Genesis 3:15). Cards 77 + 25 + 22 + 11 = 135: five Sonnet 5.5 drafters (229 in three parts), Fable read every card — no theological corrections needed (Daniel's *like* kept on every Daniel 7
  card, Revelation never read through Daniel, Galatians 3:21–22 with the law not against the promises, 1 Peter 1:1's scattered strangers as the elect of the house); checker items: 2410 italic made verbatim,
  2433/2415 "Yahuah Tseva'ot (…)" → Yahuah (LORD) (BARE_SACRED backtracks), 2451/8075 parentheticals, 5184 a 9-word run, 6981/8196 "Elohim (God)'s" recast. Scratch found a CHAIN FIX: a verse that is a parsed-text
  TARGET on one card and a live-text SOURCE on another (Zechariah 7:12 in 2426/2429) must be in the merged live map — packet506 now takes every contributing dump's verses and lists zero-hit dumps in the
  schema_note so gen_deploy506/check506 re-dump every book that carries the thread. run506_group g6 → PASS ×4, scratch ×2 PASS 6/6 ×4 + tamper RAISED ×4, md5 identical → DEPLOYED 16:26 CST
  (`_session506_g6_deploy.log`: 77/77, 25/25, 22/22, 11/11, thread rewritten 1 ×4, 29 books re-dumped, check PASS ×4). Migrations `session506_effort-over-accomplishment.sql`, `session506_son-of-adam-as.sql`,
  `session506_my-sheep-hear-my.sql`, `session506_the-seventy-sent-out.sql`. Read file `_s503/out/s506_g6_read.md`.
  (d) FOLLOW-UP FOUND BY THE POST-DEPLOY CENSUS: three effort cards whose SOURCE is Baruch / the Prayer of Manasseh (2519, 2520, 2521) carried the book SLUG into the reader's note — common503.XTITLES lacked
  them. XTITLES now carries every apocrypha + Apostolic-Fathers slug; `session507_effort-over-accomplishment.sql` (S503_OUT/S503_FIX=sweep507, S503_TAG=507 — the g6 fix and migration untouched) re-composes the
  three notes (prose unchanged; member notes already right); scratch: run 1 notes 3 / member notes already there 3 / thread already there 1, run 2 zero, check PASS, tamper RAISED. Paste
  `_s503/deploy/_session507_effort3_deploy.sh` (also re-dumps the six zero-hit dumps g6 skipped: job, leviticus, revelation, romans, zechariah, 1-enoch). check506 now honours an existing S503_FIX.
  FOR THE PIPELINE (not changed, flagged): the live gospel text is partly MODERNISED against parsed/canon.json — Matthew 471 of 1,071 verses differ, Mark 249 of 678, Luke 436 of 1,151 (thou→you, cometh→comes,
  "Sit ye here"→"Sit you here"). Cards quote the source verse as it reads live (the standing convention) while summaries quote parsed/canon.json (the checker's authority) — so a summary's *Sit ye here* sits above a
  page that reads *Sit you here*. Yoshi has not ruled which text is the reader's; raise it before the next summaries batch.
  CENSUS WORST-FIRST AFTER THIS SESSION (38 dumps): scattered-seed-gathering (4) 41/68; the-east-as-the-direction… (444) 33/33 Ezekiel; the-face-of-yahuah… (443) 31/31 Genesis; i-am-statements… (677) 29/29;
  yahuahs-right-hand… (441) 23/23 Exodus; fulfill-as-prophecy (26) 21/41; heart-torah-not-abolition (9) 20/24; bread-from-heaven (685) 19/19; the-formed-acting-with-his-own-right-hand (442) 18/18 Acts;
  gather-together-in-one (687) 17/18; born-not-of-blood (691) 14/14; word-made-flesh (678) 13/13; other-sheep (679) 13/13; post-harvest-sifting (1) 13/13; tehillim-110-1 (433) 13/13; i-and-my-father-are-one (686)
  12/12; passover-lamb (684) 11/11; the-hour-and-the-cup (688) 11/11; benedictus (552) 10/11; pharisee-and-publican (575) 10/11. Expect every one of these summaries to need a rewrite Yoshi reads (the S1xx
  "Formed/Formless" threads say "framework" and "register" in their summaries); run dump507_thread on each before packet506.
