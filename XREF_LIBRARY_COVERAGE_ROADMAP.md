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
