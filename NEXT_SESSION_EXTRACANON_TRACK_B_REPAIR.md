# Track B — Charles-Vol2 corrupted-book repair: runbook + resume point

## ★★★ TRACK B IS COMPLETE (2026-06-15) ★★★
All SIX corrupted `pseudepigrapha` (Charles-vol2) books are fully restored — TEXT
repaired + live AND outbound "It Ain't New" cross-references built + live + pushed.
Final piece landed on **origin/main 1a57661**: Adam & Eve (book 784) outbound xref,
**61 threads / 241 members**, band 91500-93825, session415, 0 orphans, six gates green.
Per-book receipts (all live in prod):
- 3-baruch 788 — text 17ch/126v + xref 41/117 (origin e31a534)
- 2-enoch 786 — text 68ch/321v + xref 110/334
- 2-baruch 787 — text 87ch/680v + xref 180/453 (session412, b5b6e6a)
- testaments-xii 785 — text 142ch/997v + xref 183/520 (session413, 2e46cc6)
- 4-maccabees 789 — text 18ch/467v + xref 51/280 (session414, a61c8be)
- adam-eve 784 — text 94ch/312v (6f6b7af) + xref 61/241 (session415, **1a57661**)
Nothing remains on Track B. Chapter-end cards render from the data (no separate artifact).
The runbook below is retained for historical reference only.

---

**Status at S232 close:** NOT executed to prod. De-risked and staged. The
repair is a dedicated focused pass — it is destructive prod-scripture surgery,
and half the books are xref-coupled. Do NOT rush it at the tail of a multi-track
session. Everything needed to execute is below.

## The 6 corrupted books (edition `pseudepigrapha`)

Source corruption = R.H. Charles's critical apparatus (sigla, Greek-glyph
footnotes, cross-refs) OCR'd inline into the verse text, plus intra-word OCR
scannos (Lorn→Lord, Ferusalem→Jerusalem, Moseson→Moses on). Re-parsing the
existing `.md`/`.txt` cannot fix it (apparatus is interleaved). See
`S214_CHARLES_VOL2_DEGRADATION_REPORT.md`.

| book | DB verses | corruption (gap%) | inbound xrefs | structure | safe to rebuild? |
|---|---:|---|---:|---|---|
| 2-enoch | 107 | ~34% missing | **0** | sequential chs (Charles 1-73) | **YES — no xref remap** |
| 3-baruch | 69 | ~19% missing | **0** | sequential chs (1-17) | **YES — no xref remap** |
| adam-eve | 20 | catastrophic (20 of ~900) | **0** | DUAL: Apoc.Moses 1-43 + Vita Adae 1-51 (locked decision #11) | YES structurally-safe, but heavily destroyed — needs full re-source |
| 4-maccabees | 163 | ~46% missing | **12** | sequential chs (1-18) | needs xref verse_id remap |
| 2-baruch | 245 | ~40% missing | **6** | sequential chs (Charles 1-87) | needs xref verse_id remap |
| testaments-xii | 515 | ~24% missing | **44** | per-Testament named chs (Reuben 1…Benjamin N) (locked decision #10) | needs xref verse_id remap |

## KEY DE-RISKING THIS SESSION — clean digital source found (supersedes PDF-OCR plan)

The Phase-1 plan was "layout-aware PDF extraction from charles-1913-vol2.pdf +
PD cross-check." **Better path discovered:** Wesley Center Online hosts the
**clean digital R.H. Charles 1913 translation**, curl-fetchable from this
environment (`curl` HAS network access here), and it matches the corrupted DB
text verbatim modulo the OCR errors. This is a clean digital transcription —
NOT another OCR — so it is the primary faithful source. No PDF OCR needed.

- Proven: `2 Baruch` full text fetched (154 KB) — opening "O LORD, my Lord, have
  I come into the world for this purpose..." matches DB's OCR "O Lorn, my
  Lord...". Saved: `scratch_extracanon2/wesley/3-baruch.html` etc. (some are
  summary landing pages; the full-text pages use long descriptive slugs).
- Wesley index: `…/noncanonical-literature-ot-pseudepigrapha/`. The 2 Baruch
  full-text URL that worked:
  `…/the-book-of-the-apocalypse-of-baruch-the-son-of-neriah-or-2-baruch/`.
  Per-book full-text slugs must be resolved from the index / each summary page
  (the bare `/2-enoch/`, `/3-baruch/` slugs are SUMMARY pages, not full text;
  the old `wesley.nnu.edu/noncanon/ot/pseudo/*.htm` paths are 404 — CMS migrated
  to Statamic). `earlyjewishwritings.com/<book>.html` lists translation links
  but some point at the dead old paths.
- WebFetch self-truncates quotes to ~125 chars (copyright caution) so it cannot
  dump full chapters — use raw `curl` + an HTML→text parser, not WebFetch, for
  the actual text extraction.

## Per-book repair recipe (faithful, fidelity-gated)

1. `curl` the book's Wesley full-text page (resolve slug from index first).
2. Strip HTML; parse to chapters+verses following the book's LOCKED structure
   (sequential N:M for most; per-Testament names for testaments-xii; dual
   Apoc.Moses/Vita-Adae ranges for adam-eve).
3. `from restore import Restorer; Restorer().restore_text(v)` over each verse
   (deterministic + idempotent; produces the `Yahuah (God)` / `Yashar'el
   (Israel)` style already used across the edition). venv with deps:
   `/private/tmp/extracanon-wt/scratch_extracanon/.venv/bin/python` (asyncpg +
   pdfplumber). DB helper: `scratch_extracanon2/db.py` (reads api/.env
   DATABASE_URL; SSL no-verify). Symlink real env into a fresh worktree:
   `ln -sf /Users/mtm/Desktop/App/api/.env <wt>/api/.env`.
4. FIDELITY GATE: verse count should rise to ~Charles totals (close the gap%);
   every verse one line, no apparatus tokens, no Greek-glyph drift, boundaries
   intact. Cross-check 100% against the Wesley text (it is the authority).
5. PROD APPLY (transactional, with backup):
   - Dump current chapters+verses for the book to a JSON backup first.
   - In ONE transaction: delete old verses+chapters for the book_id (book row
     preserved → book-level identity/links survive), insert clean chapters
     (chapter_number, chapter_title) + restored verses.
   - Verify counts + spot-check vs Wesley before COMMIT.
6. **xref remap (ONLY 2-baruch / 4-maccabees / testaments-xii):** the rebuild
   changes verses.id, so the 6/12/44 `cross_references.target_verse_id` rows
   (and any thread anchors) pointing into the book must be re-pointed to the new
   verse ids by matching (chapter_number, verse_number) — old→new. The S214
   degradation report flags 2-baruch + testaments-xii as the gating items for
   re-verifying the S212 xref rows; do the xref re-verification in the same
   pass. For the 3 xref-free books this step is skipped entirely.
7. After prod repair, paragraph the repaired book: re-dump its verses, run the
   paragraphing minion (see `para-extracanon-v2.js` template), merge the
   `edition::slug` key into `app/src/data/paragraph_starts.json`, commit.

## Recommended execution order
1. **3-baruch** (xref-free, sequential, short — cleanest proof of pipeline).
2. **2-enoch** (xref-free, sequential).
3. **adam-eve** (xref-free but catastrophically destroyed + dual structure —
   full re-source from Apoc.Moses + Vita-Adae Wesley pages; most rebuild work).
4. **4-maccabees** (12 xref remaps).
5. **2-baruch** (6 xref remaps + S212 re-verify).
6. **testaments-xii** (44 xref remaps + S212 re-verify + per-Testament chapter
   labels — largest).

## Already done this session (do NOT redo)
- Enoch ch25 mislabel FIXED in prod (title → "The Watchers Bidden to Intercede
  No More; the Origin of the Evil Spirits"; it is a verbatim duplicate of ch15).
- All 91 extra-canon books paragraphed (edition-qualified) + merged to main.
- Apocrypha de-dup (suppress charles-vol1 dups, keep 3-maccabees) merged to main.
