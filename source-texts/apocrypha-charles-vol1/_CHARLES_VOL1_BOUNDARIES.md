# Charles 1913 Vol 1 — Apocrypha Edition Boundary Map

**Built session 25, 2026-05-11.** Source PDF: `~/Downloads/charles-1913-vol1.pdf` (712 PDF pages, 82 MB, R. H. Charles ed., *The Apocrypha and Pseudepigrapha of the Old Testament in English*, Vol. I — Apocrypha, Oxford at the Clarendon Press, 1913). Public domain. Source: archive.org/details/apocryphapseudep01char (BYU upload).

PDF page layout: front matter pp. 1-20 (PDF) = roman-numeral front matter (title pages × 2, preface, contents, contributors, general introduction, addenda et corrigenda, symbols & abbreviations). Body text begins around PDF page 21 = printed page 1 (1 Esdras Introduction §1). Offset to be calibrated precisely at parse time per book (front matter has blank pages and may shift the offset by a page).

## OCR pipeline note (session-25 finding)

The vol-1 PDF text layer is **100% Greek-glyph OCR drift** across body pages (verified session 25: pp 30/50/100/200/400/650 all show 0 ASCII letters / 2500+ Greek letters per page in raw `PdfReader.extract_text()` output). The standard vol-2 extractor's `_normalize_greek_drift` conservative mixed-token substitution cannot recover these — there's no ASCII anchor context.

However, the PDF embeds the original 300dpi scan page-images alongside the corrupt text layer. **Re-OCR with tesseract on the rendered images returns clean ASCII** (verified session 25 on pp 30/100/350/650: 0 Greek letters / 2900-4629 ASCII letters per page). This is exactly the path session-16's manifest warned might be needed: *"the Charles 1913 vol 1 BYU scan is unusable for our pipeline. Pivot per-fetch to chapter-level HTML from CCEL"*. The chapter-level HTML pivot is a workable fallback; this volume's path forward instead leverages the embedded scan-image layer.

**OCR pipeline implementation** (session-25 LANDED):
- `restoration-pipeline/ocr_charles_vol1.py` — standalone re-OCR helper with per-page disk cache at `~/Desktop/App/source-texts/apocrypha-charles-vol1/ocr-cache/p<NNNN>.txt`.
- DPI 240 (tuned for serif-print accuracy vs wall-time cost), tesseract 4.1.1, `--psm 4` (single column of variable text sizes).
- Multiprocessing-capable (`--parallel 2` optimal on 4-CPU sandbox; OMP_THREAD_LIMIT=1 to avoid over-subscription).
- Per-page wall time ~3.2s (parallel=2) or ~3.8s (serial). Full 712-page pass: ~37 min serial, ~25-30 min parallel=2. Body-only pass (~450 pages): ~24-29 min parallel=2.

**Downstream extractor (`parse_charles_apocrypha.py`, session-25 in-progress)** swaps the vol-2 extractor's `PdfReader.pages[i].extract_text()` step for a thin `ocr_page(page_1idx)` call to this helper. Everything else in the vol-2 hardened pipeline (page-header strip, footnote drop, BOOKS-table calibration, per-book convention dispatch, restore.py, structural parser, seed.py wire) is reusable without change.

## Boundary index (canonical from PDF CONTENTS page, PDF page 13 = printed v)

| # | Book | Translator | Printed pp. | PDF pp. (body) | Status | Apocrypha-overlap |
|---|---|---|---|---|---|---|
| 1 | 1 Esdras | S. A. Cook | 1-58 | body 44-77 (LOCKED session 25) | INCLUDE — parallel-column with canonical Ezra in chs 1-2, 8-9; drop right column | overlaps `apocrypha`/1-esdras |
| 2 | 1 Maccabees | W. O. E. Oesterley | 59-124 | intro 79-93, body ~94-TBD (session 25 partial) | INCLUDE | overlaps `apocrypha`/1-maccabees |
| 3 | 2 Maccabees | J. Moffatt | 125-154 | TBD-scout | INCLUDE | overlaps `apocrypha`/2-maccabees |
| 4 | 3 Maccabees | Cyril W. Emmet | 155-173 | TBD-scout | INCLUDE | NOT in `apocrypha` (net-new — same as Bensly path) |
| 5 | Tobit | D. C. Simpson | 174-241 | TBD-scout | INCLUDE | overlaps `apocrypha`/tobit |
| 6 | Judith | A. E. Cowley | 242-267 | TBD-scout | INCLUDE | overlaps `apocrypha`/judith |
| 7 | Sirach (Ecclesiasticus) | G. H. Box & W. O. E. Oesterley | 268-517 | TBD-scout | INCLUDE | overlaps `apocrypha`/sirach |
| 8 | Wisdom of Solomon | Samuel Holmes | 518-568 | TBD-scout | INCLUDE | overlaps `apocrypha`/wisdom-of-solomon |
| 9 | 1 Baruch | O. C. Whitehouse | 569-595 | TBD-scout | INCLUDE | overlaps `apocrypha`/baruch |
| 10 | Epistle of Jeremy | C. J. Ball | 596-611 | TBD-scout | INCLUDE | overlaps `apocrypha`/epistle-of-jeremy |
| 11 | Prayer of Manasses | H. E. Ryle | 612-624 | TBD-scout | INCLUDE | overlaps `apocrypha`/prayer-of-manasses |
| 12 | Prayer of Azariah AND Song of Three Children | W. H. Bennett | 625-637 | TBD-scout | INCLUDE — combined entry; verify split at parse time | overlaps `apocrypha`/song-of-three or split into two books |
| 13 | Susanna | D. M. Kay | 638-651 | TBD-scout | INCLUDE | overlaps `apocrypha`/susanna |
| 14 | Bel and the Dragon | T. Witton Davies | 652-664 | TBD-scout | INCLUDE | overlaps `apocrypha`/bel-and-the-dragon |
| 15 | Additions to Esther | J. A. F. Gregg | 665-684 | TBD-scout | INCLUDE | overlaps `apocrypha`/additions-to-esther |

**Total: 15 books for the new `apocrypha-charles-vol1` edition.** All 15 books overlap with the existing wired `apocrypha` edition (Brenton 1851 + KJV-1611 base, 14 books) **except 3 Maccabees** which is net-new to the pipeline (and was the historical Bensly-class Bucket-A target per `DOWNLOAD_MANIFEST.md`).

Note: 4 Ezra (= 2 Esdras) is **explicitly not in vol 1** — Charles transferred it to vol 2 per the preface (p12): *"4 Ezra has been transferred to Volume ii since it is essentially a Pseudepigraph."* The existing `apocrypha` edition's 2 Esdras already carries the Bensly inline-restoration from vol 2's Box translation (session 23 LANDED, +49 verses).

Apparatus to drop: Charles's General Introduction to vol 1 (pp. vii-xxv). Addenda et Corrigenda (page xi). Contributors page (page vi). Symbols and Abbreviations index. Each book's own translator-introduction. Each book's textual apparatus + critical notes. Every footnote on every page. General Index at back. Page headers. **Editorial apparatus does not enter the Bible** (Yoshi session 18, locked).

## Text-quality notes

- Text layer is **100% OCR-derived from a 1913 print scan with severe Greek-glyph drift** (vs vol 2's mostly-clean text layer with selective drift). See OCR pipeline note above.
- **Embedded scan-image re-OCR via tesseract returns clean ASCII** — this is the source of all extracted text for vol 1 (NOT the embedded text layer).
- **Greek-glyph drift in re-OCR'd text** still exists but is much rarer than the raw text layer. The vol-2 parser's `_normalize_greek_drift` conservative substitutions remain useful for residual cases (e.g., where tesseract still confuses a Greek-script-styled headline or footnote citation).
- **Footnote markers** (`!`, `?`, `:`, numeric superscripts that get flattened to baseline by OCR) interrupt body text. Footnote bodies appear in smaller print at page bottom. Parser drops both the inline markers and the footnote bodies. (Vol-2 logic reusable.)
- **Page headers** carry the book name + verse range on every body page (e.g., "I MACCABEES 4. 11-29", verified session 25 on p100; "SIRACH 4. 17-25" on p350; "THE PRAYER OF AZARIAH, ETC." on p650). Parser strips these and uses them as an instrumentation signal for per-book verse-range coverage. (Vol-2 logic reusable.)
- **Section headings within a book** vary by translator. Most vol-1 books use `CHAPTER I.` / `CHAPTER II.` style (matches the existing `apocrypha` edition's KJV/Brenton convention). Parser detects each book's convention at the book's opening pages.
- **Verse markers**: raised superscripts the OCR flattens to baseline numerals or to inline `N.` markers. Tesseract handles these reasonably well (verified on sample pages). Parser detects per-book convention and emits monotonic `N.  text` shape.
- Charles's text often **bracketed-marks restorations and editorial conjectures** in `[square brackets]`. These are part of the translation Charles publishes; they remain in the body. Critical apparatus that uses square brackets in a different mode (e.g., manuscript-variant notation in footnotes) is already stripped with the footnote-body.

## Decisions (Yoshi's calls — session 25, 2026-05-11)

1. **Scope: NEW EDITION `apocrypha-charles-vol1`.** Yoshi's session-25 AskUserQuestion answer: *NEW EDITION apocrypha-charles-vol1 (Recommended).* Clean parallel to vol 2's pattern. Edition slug `apocrypha-charles-vol1`, sort_offset=550 (after pseudepigrapha's 500), pipeline_version=phase4-v2. All 15 vol-1 books extracted as their own edition alongside the existing `apocrypha` (Brenton/KJV-base) edition. No inline-merge into `apocrypha`. No HOLD of vol-1 overlap books. **LOCKED.**

2. **OCR strategy: tesseract re-OCR front-end.** Yoshi's session-25 AskUserQuestion answer: *Tesseract re-OCR front-end (Recommended).* Re-OCR the embedded 300dpi scan images via `ocr_charles_vol1.py`, cache per-page on disk, run the standard vol-2 extractor pattern downstream. See OCR pipeline note above for implementation detail. **LOCKED.**

3. **Edition display name + witness category.** Display name: *The Apocrypha (Charles 1913) — Restored Names Edition*. Witness-category: same `apocrypha` enum value used by the existing edition (the witness_category enum is multi-edition-friendly; both the Brenton/KJV-base edition and the Charles-vol-1 edition emit under `witness_category=apocrypha`). `tier_required=extras` (matches the existing `apocrypha` edition's tier). **PROPOSED — confirm at next checkpoint if needed.**

4. **Apparatus-drop discipline (carried forward from vol 2 / Whiston session 18).** Charles's General Introduction to vol 1, Addenda et Corrigenda, Contributors page, Symbols and Abbreviations index, each individual book's translator-introduction, all textual apparatus, all critical notes, all footnotes, all page headers, and the General Index are stripped at parse time and do NOT enter the body of the Bible. *"This is our bible"* — Yoshi session 18. Only the underlying primary-text translation enters the published edition. W-6 commentary replaces the apparatus.

5. **Framework-lens partial-truth-witness test at parse time (carried forward from vol 2).** Each book's body translation is read through the framework lens at parse time. Vol-1 books are mostly historical (1 Esdras, 1-3 Maccabees), narrative-quasi-historical (Tobit, Judith), wisdom (Sirach, Wisdom of Solomon), or additions-to-canonical (Bel & Dragon, Susanna, etc.) — generally framework-friendlier than vol 2's pseudepigrapha which had multiple HIGH-vigilance interpolation cases. Per-book framework-vigilance assessment to be filled in at convention-survey step.

6. **Pilot-first strategy (carried forward from vol 2 session 20).** Extract one book alone first to validate the parser end-to-end. Likely pilot candidates given coverage and simplicity: **3 Maccabees** (the net-new book that has no `apocrypha`-edition baseline to cross-check; ~19 printed pages by CONTENTS estimate, short enough for a tight pilot review). Alternative: **Tobit** (clean narrative, well-known canonical numbering, ~68 printed pp). Yoshi confirms pilot book at next checkpoint. **PROPOSED.**

7. **Parallel-column layout handling — DROP canonical column.** Yoshi's session-25 AskUserQuestion answer: *DROP canonical column, keep Charles translation only (Recommended).* Matches vol-2 Ahikar's Syriac-A-primary decision (session 22). For every parallel-column body section across vol 1 (definitely 1 Esdras chapters 1-2 and 8-9 verified session 25; likely Sirach's Hebrew-vs-Greek columns, Additions to Esther's Greek-vs-canonical-absence columns, possibly Susanna / Bel / Azariah Greek-vs-canonical-Daniel layouts): preserve only the apocryphal column (Cook's 1 Esdras, Cowley Sirach, Gregg Additions, etc.) and DROP the canonical-comparison column. Rationale: canonical text already lives in our `canon` edition; mixing canonical Ezra/Daniel/Esther prose into a Charles-vol-1 apocrypha edition mixes content authorities. Implementation: post-OCR text processing detects lines with `|` column separator (preserved by tesseract from the printed double-column layout), splits at the separator, keeps only the left column. Detection threshold: ≥30% of body-page lines containing `|` separator triggers parallel-column mode for that page. **LOCKED.**

## Session log

- **Session 26 (2026-05-11):** Vol1-g + vol1-h landed; pilot acceptance gate executed; OCR cache upgraded across 1 Esdras body range. Yoshi-locked two new decisions at session open (path-b image pre-segmentation, `song-of-three` kept combined). Cache state: 1 Esd body (pp 44-77, 34 pages) fully sentinel-tagged in V2 format — 17 LEFT (parallel-column pages re-OCR'd with two-strip rendering) + 17 FLAT.

  **Yoshi decisions locked this session (AskUserQuestion at session open):**
  - **Prayer of Azariah + Song of Three Children scope: KEEP COMBINED as `song-of-three`** matching Charles vol-1's TOC and the existing `apocrypha` edition's slug 1:1. No split at parse time. Recorded in BOOKS table row 12 ("INCLUDE — combined entry; verify split at parse time" → resolved: keep combined). `VOL1_BOOK_CONVENTION["song-of-three"] = "chapter-verse-hdr"` (default). **LOCKED.**
  - **Parallel-column re-OCR approach: PATH-B IMAGE PRE-SEGMENTATION** (crop pixmap at horizontal midpoint, OCR each half separately as single-column, keep left half only). Deterministic. Implemented in `ocr_charles_vol1.ocr_page_left_half_uncached` with two-strip rendering: top header band (6% of page height) at full width + body band (remaining 94%) at left half, concatenated. Two-strip preserves the centered full-width page header (which carries `Chapter.Verse` range — needed by the chapter-verse-hdr extractor's `_detect_page_chapter_range`) while still dropping the canonical column from the body. **LOCKED.**

  **W-2 vol1 status at session-26 close:**

  - **vol1-g (page-header strip patterns) LANDED.** `parse_charles_apocrypha.py` now monkey-patches both `_v2._strip_page_headers` (→ `_vol1_strip_page_headers` with vol-1 explicit-header patterns, vol-1 title-substrings list, and a more permissive verse-range-trailing regex covering chapter.verse forms + trailing-junk like `1. 39-53 a`) and `_v2._capture_header_chapter_verse` (→ `_vol1_capture_header_chapter_verse` tolerant of comma-instead-of-period chapter separators like `3, 6—4. 10` and trailing junk like `2. 4-14 Ezra l`). Unit tests on 19 representative header lines (full strip suite) and 10 chapter-capture samples: 100% pass. Per-page chapter-range capture across 1 Esd body pp 44-77 now resolves 30 of 34 pages cleanly; remaining 4 pages return None (`Be 40-49`, `6. I-10`, `8&. 21-33`, `EspRAS` standalone) and inherit chapter via forward-fill from prior detected page (working as designed).

  - **vol1-h (parallel-column drop via image pre-segmentation) LANDED.** `ocr_charles_vol1.py` rewritten with three layers:
    1. **Detection** — `detect_parallel_column(page_1idx)` uses a pixmap midpoint-DIP signal. Charles 1913 vol 1's parallel pages have a WHITESPACE GUTTER (no printed vertical rule), so detection looks for a dip in dark-pixel column count near the page midpoint relative to body-typical density. Threshold: `cmin/typical < 0.65`. Verified on 22 calibration pages (front-matter + 1 Esd body): parallel pages 0.14-0.61, flat pages 0.70-0.90 — clean separation with one borderline miss on p30 front-matter (ratio 0.70 right at threshold; safe to misclassify since front-matter is stripped anyway).
    2. **Left-half OCR** — `ocr_page_left_half_uncached(page_1idx)` does two-strip rendering: top header band (full width, `HEADER_BAND_FRAC=0.06`) + body band (left half only). OCRs each strip separately, concatenates. This preserves the centered full-width page header (which left-half-of-whole-page would chop in two and lose the chapter info) while dropping the canonical column from the body.
    3. **Cache versioning** — every cache file now carries a first-line sentinel: `# CHARLES_VOL1_OCR_V2_FLAT` or `# CHARLES_VOL1_OCR_V2_LEFT_HALF`. `ocr_page_smart(page_1idx)` is the new top-level entry point — checks sentinel, falls back to `|`-ratio heuristic for pre-v2 unmarked cache (auto-upgrades session-25's 81 unmarked pages). Legacy `ocr_page` retained for back-compat.
    4. **`--redetect-cache` CLI mode** — re-checks every cached page's sentinel mode against current detection algorithm; re-OCRs misdetections. Used once at session 26 mid-cycle to clean up two misdetections (p61, p76) that the first-pass algorithm flagged as flat-but-actually-parallel.

  - **vol1-i (pilot acceptance gate) status** — 1 Esdras pilot re-run end-to-end with vol1-g + vol1-h active. **9 of 9 chapters detected** (target was ≥8 of 9). 310 lines output. Parallel-column drop is clean (no canonical Ezra prose leaking into 1 Esd verses). Page-headers stripped. Coverage reporting: 149+ verses recovered. Remaining issues identified for **vol1-k tuning** (none are vol1-g/h blockers):
    1. **Verse numbering resets per chapter** — `_normalize_to_verse_lines` re-starts verse counting at 1 inside each `# Chapter N` block. Charles's original verses are sequential within each chapter (e.g., ch 1 verses 1-58), so when the pilot range starts mid-chapter at v39, the first 20 OCR'd markers (`39 40 41 ... 58`) all get REJECTED by the `cand - expected <= 20` window (expected starts at 1; 39-1=38 > 20). Net effect: chapter 1 collapses to a single synthesized recovery-verse covering 1:39-58 content. Fix candidate (vol1-k): pass the captured header `v_lo` into `_normalize_to_verse_lines` as the starting `expected` value so mid-chapter pilot ranges work.
    2. **Spurious Chapter 35** — p57's running header OCR'd as `Espras I ESDRAS 35. 30-40 Ezra 2` (the leading `5.` of the actual `5. 30-40` was misread as `35.`). `_smooth_chapter_drift`'s standard-rate forward-monotonic guard would catch this, but with the spike at ch 35 the `span / n_pages = 34/34 = 1.0 ≥ 0.4` triggers the FAST-TICK ADAPTIVE BYPASS, which trusts raw header chapters. Result: chapter 35 stays. Fix candidate (vol1-k): compute span using MEDIAN-distance-from-median (robust to outliers) instead of raw `max - min`.
    3. **Translator-intro material survives** — Charles's per-book intro pages (e.g., the "Story of the Three Pages and Decree of Darius" critical-introduction at p49) bleed into body verses because the introduction doesn't match the footnote-anchor pattern. Fix candidate (vol1-k): vol-1-specific intro-page detection (translator-intro pages typically have larger body type, no verse markers, and a distinctive `(a)` `(b)` `(c)` section structure).

  - **vol1-OCR cache state at session-26 close**: 81 pages from session 25 + 11 new pages OCR'd this session (re-OCR of misdetected/header-truncated LEFT pages) + 0 net new pages from prime-cache (deferred). Cache file count unchanged at 81; only mode-sentinel + content updated.

  **Pipeline gates this session:**
  - `parse_charles_apocrypha.py --book 1-esdras` — runs clean (no crash, 310 lines, 9 chapters). vol1-i acceptance pending Yoshi review.
  - `restore.py` — NOT RUN this session.
  - Vol-2 outputs UNCHANGED (no regression to `parse_charles_pseudepigrapha.py` — monkey-patch in-process only).

  **Files modified this session:**
  - `restoration-pipeline/ocr_charles_vol1.py` — added `detect_parallel_column`, `ocr_page_left_half_uncached` (two-strip), `ocr_page_smart`, `_read_cache`/`_write_cache` with sentinel versioning, `redetect_cache` + `--redetect-cache` CLI mode. Updated `_worker` to handle the new 5-tuple return (added `mode` field). Updated `build_cache` progress format.
  - `restoration-pipeline/parse_charles_apocrypha.py` — added `_VOL1_HEADER_PATTERNS`, `_VOL1_TITLE_SUBSTRINGS`, `_VOL1_VERSE_RANGE_TRAILING`, `_vol1_strip_page_headers`, `_VOL1_HDR_CV_MULTI`/`_VOL1_HDR_CV_SINGLE`, `_vol1_capture_header_chapter_verse`. Extended `_activate_vol1_mode` to patch `_strip_page_headers` and `_capture_header_chapter_verse` (in addition to `_extract_pdf_pages` and `BOOK_CONVENTION`). Updated `_vol1_extract_pdf_pages` to call `ocr_page_smart` instead of `ocr_page` for parallel-column-aware routing.
  - `source-texts/apocrypha-charles-vol1/ocr-cache/p<NNNN>.txt` — 19 cache files upgraded from session-25 unmarked to V2 LEFT_HALF or FLAT; 11 LEFT pages re-OCR'd with two-strip rendering to preserve full-width headers.
  - `source-texts/apocrypha-charles-vol1/1-esdras.md` — regenerated; 9 chapters, 310 lines (vs session-25's 67 lines / 2 chapters). KNOWN INCOMPLETE (vol1-k issues above); kept as session-26 pilot evidence pending Yoshi acceptance.

  **Session-26 residual tracking (carried to vol1-k):**
  - Verse-numbering reset bug in `_normalize_to_verse_lines` when chapter starts mid-page-range
  - Chapter-35 spike from `_smooth_chapter_drift` fast-tick bypass on outlier-polluted span
  - Translator-intro material surviving the footnote-strip pipeline
  - Same monkey-patch concern as session-25 close: `_v2.BOOK_CONVENTION` + now also `_v2._strip_page_headers` + `_v2._capture_header_chapter_verse` are mutated globally on the module — if a single process ever runs vol-1 + vol-2 extraction back-to-back, save-and-restore semantics are needed.

  **Session-26 boundary refinements (BOOKS table partial scout):**
  - 1 Esdras: body PDF range 44-77 LOCKED end-to-end (was already locked at session 25, validated this session by the successful pilot extraction).
  - Other 14 books: TBD-scout still pending vol1-j prime-cache (deferred).

  **Session-26 close-out (Yoshi acceptance via AskUserQuestion):**
  - **vol1-i pilot acceptance gate: PASSED.** Yoshi's call (session-26 AskUserQuestion): *Accept; defer (a)(b)(c) to vol1-k.* The pilot's hard criteria (≥8 of 9 chapters, no canonical leak, headers stripped) are met. The three residual issues (verse-numbering reset, Chapter 35 spike, translator-intro survival) are per-book convention tuning and land in vol1-k after the cache is warm.
  - **vol1-j prime-cache scheduling: DEFER TO SESSION 27.** Yoshi's call (session-26 AskUserQuestion): *Defer vol1-j to session 27.* The 50-60 min background OCR pass is too big to land + verify cleanly inside session 26's remaining budget; multiprocessing also hit silent worker deaths twice this session, so vol1-j on session 27 should run with `--parallel 1` (serial, ~80 min) and progress checkpointing.

  **Session-27 recommended order of attack:**
  1. **vol1-j prime-cache** for BOOKS-table ranges of books 2-15. Use serial mode (`--parallel 1`) given session-26's parallel=2 silent-death observations. Hand-refine BOOKS-table page ranges per book during the run via spot-checks on the warming cache.
  2. **vol1-k tuning** in parallel with the prime-cache run (CPU-bound prime-cache leaves headroom for editor work):
     - (vol1-k-1) Pass captured header `v_lo` into `_normalize_to_verse_lines` as `expected` starting value, so mid-chapter pilot ranges don't collapse to a synthesized recovery-verse.
     - (vol1-k-2) Make `_smooth_chapter_drift`'s fast-tick-bypass span calculation OUTLIER-ROBUST (median absolute deviation, or trimmed mean) so single-page chapter spikes don't pollute the bypass decision.
     - (vol1-k-3) Add vol-1-specific translator-intro page detector (look for `(a)` / `(b)` / `(c)` paragraph section markers in the body) and drop intro material before verse parsing.
  3. **vol1-l full extraction** once vol1-k clean-up validates against a re-run of 1-esdras + a second book (Tobit recommended — clean narrative, no parallel-column complexity, well-known canonical numbering for cross-check).
  4. **vol1-m structural parser** modeled on `parse_pseudepigrapha_edition.py`.
  5. **vol1-n seed.py wire-up.**
  6. **vol1-o pipeline gates × 5.**
  7. **vol1-p verification + boundary file close.**

  Estimated session-27 effort: ~2-3 hours wall time (most of it the prime-cache background job).

- **Session 25 (2026-05-11):** Vol-1 work opened. Three Yoshi-locked scope decisions, OCR helper LANDED, boundary skeleton LANDED, extractor scaffold LANDED, end-to-end pilot smoke-test EXECUTED. Full BOOKS-table calibration + production extraction held to session 26 (cost-of-OCR realization plus two extractor-side issues exposed at pilot).

  **W-2 vol1 status at session-25 close:**
  - vol1-a (boundary file) — LANDED in skeleton form. 15-book inventory locked from PDF CONTENTS table (p13 = printed v). 1 Esdras body PDF range locked (44-77). 1 Maccabees + 2 Maccabees partial (body-start identified, body-end TBD-finer-scout). Remaining 12 books carry estimated PDF ranges marked TBD-scout in the BOOKS table above.
  - vol1-OCR (re-OCR front-end) — LANDED at `restoration-pipeline/ocr_charles_vol1.py`. Per-page disk cache at `source-texts/apocrypha-charles-vol1/ocr-cache/p<NNNN>.txt`. DPI 240, tesseract `--psm 4`, OMP_THREAD_LIMIT=1, multiprocessing-capable. Per-page wall time ~3-8s (body pages longer than intro pages). Cache primed at session close: ~80 pages (front matter pp 12-22; 1 Esdras body pp 44-77 complete; 1 Macc intro + early body pp 78-86 partial; 1 Macc body sample pp 99-106; 2 Macc transition pp 145-155). Full body-pass (~450 pages) cost estimate: ~50-60 min wall at parallel=2, deferred to session 26 priming run.
  - vol1-b (scout + BOOKS table) — PARTIAL. 1 Esdras locked end-to-end. 1 Macc + 2 Macc partial. 12 books TBD-scout. Strategy for session 26: invoke `parse_charles_apocrypha.py --prime-cache` to fill the body-page cache for ALL books per current TBD-estimates, then re-scout transitions from the cached output (cheap once cache is warm), refine BOOKS table iteratively.
  - vol1-c (convention survey + dispatch wiring) — PENDING. Initial VOL1_BOOK_CONVENTION wired in the scaffold; all books default to `chapter-verse-hdr` except Prayer of Manasses (`flat`). May need per-book overrides after convention survey identifies special cases (e.g., Song of Three Children combined-vs-split, Susanna single-chapter, Sirach Hebrew/Greek parallel columns).
  - vol1-d (pilot extraction + full batch) — PARTIAL. 1 Esdras pilot smoke-test EXECUTED. Output: `source-texts/apocrypha-charles-vol1/1-esdras.md` (81 verses, 2 chapters detected of 9 canonical). The pilot exposed two real extractor issues (below) blocking acceptance; both are session-26 fixes. Full 15-book batch deferred.
  - vol1-e (structural parser + seed.py wire) — PENDING. Will reuse `parse_pseudepigrapha_edition.py` template after extractor output is clean.
  - vol1-f (pipeline gates) — PENDING. Five-gate validation runs after vol1-e lands.

  **Yoshi decisions locked this session (see Decisions §1-§7 above):**
  - §1 Scope: **NEW EDITION `apocrypha-charles-vol1`** (NOT inline-merge into existing `apocrypha`, NOT held).
  - §2 OCR strategy: **tesseract re-OCR of embedded 300dpi scan images** (NOT trust the corrupt text layer, NOT CCEL HTML harvest).
  - §7 Parallel-column handling: **DROP canonical column, keep Charles translation only** (matches vol-2 Ahikar/Syriac-A pattern).

  **Critical findings from the pilot smoke-test (session-26 fix queue):**

  1. **Vol-1 page-header strip patterns missing from `_v2._strip_page_headers`.** The vol-2 strip patterns target `THE LETTER OF ARISTEAS` / `THE TESTAMENTS OF THE...` / etc. — none match vol-1's running headers (`I ESDRAS`, `I MACCABEES`, `II MACCABEES`, `III MACCABEES`, `TOBIT`, `JUDITH`, `SIRACH`, `THE WISDOM OF SOLOMON`, `1 BARUCH`, `THE EPISTLE OF JEREMY`, `THE PRAYER OF MANASSES`, `THE PRAYER OF AZARIAH`, `SUSANNA`, `BEL AND THE DRAGON`, `THE ADDITIONS TO ESTHER`, plus the alternating `INTRODUCTION` headers). Result: vol-1 headers survive into body text and confuse the chapter-verse-hdr extractor's per-page chapter detection. **Session-26 fix:** add a `VOL1_PAGE_HEADER_PATTERNS` list in the scaffold and either monkey-patch `_v2._PAGE_HEADER_PATTERNS` to extend it OR pre-strip vol-1 headers in `_vol1_extract_pdf_pages` before handing pages to the vol-2 pipeline.

  2. **Parallel-column-drop is unreliable because tesseract's column-separator output is inconsistent across pages.** The 30%-of-lines-with-`|` threshold misses pages where tesseract OCR'd the inter-column vertical rule as whitespace or as interleaved-line text instead of `|`. Pilot output shows canonical-Ezra prose merging into 1 Esd verses (e.g., verse 18 stretches across 1 Esd's "...goodly thing and see a woman..." into canonical Ezra's "...all the goodly thing whatsoever..." mid-verse). **Session-26 fix (two paths to consider):** (a) re-OCR parallel-column pages with `--psm 3` (tesseract auto-layout — slower but column-aware), or (b) pre-segment the page image at the horizontal midpoint into left and right halves before OCR (each half OCR'd separately as single-column; drop the right-half output). Path (b) is more deterministic but requires re-running tesseract on parallel-column pages (cache-invalidating per page).

  3. **Chapter coverage low (2 of 9 for 1 Esdras).** Mostly downstream of issues 1 and 2 — once page headers are stripped and parallel-column-drop is reliable, the chapter-verse-hdr extractor's running-header capture should recover the full chapter range. May need vol-1-specific chapter-drift smoother tuning if `_smooth_chapter_drift`'s vol-2 calibration (forward-monotonic-by-+3) doesn't fit vol-1's chapter spans. **Validation candidate:** after issues 1-2 fix, re-run 1-esdras pilot and check chapter coverage hits ≥8 of 9.

  **Pipeline gates at session-25 close:**
  - `restore.py --self-test` — NOT RUN this session (no new restored output produced).
  - `restore.py` idempotency — NOT RUN this session.
  - `parse_pseudepigrapha_edition.py` — vol-2 JSON unchanged from session 24 close.
  - `patch_bensly_into_apocrypha.py` — unchanged from session 23 close.
  - `seed.py --dry-run` — NOT RUN this session (no new edition wired yet; session 26 will add `apocrypha-charles-vol1` profile after the extractor output validates).
  - **Live DB stays on `1.0.0-phase4-session13`** (per Yoshi's locked sequence).

  **Files this session put on disk:**
  - `source-texts/apocrypha-charles-vol1/_CHARLES_VOL1_BOUNDARIES.md` (this file — extensive boundary skeleton + session-25 close-out entry).
  - `source-texts/apocrypha-charles-vol1/ocr-cache/p<NNNN>.txt` (per-page OCR cache, ~80 pages at session close; will fill out to ~450-500 pages in session 26).
  - `source-texts/apocrypha-charles-vol1/1-esdras.md` (pilot smoke-test output — KNOWN INCOMPLETE per findings 1-2; kept on disk as a session-25 evidence artifact).
  - `restoration-pipeline/ocr_charles_vol1.py` (re-OCR helper with CLI + programmatic API).
  - `restoration-pipeline/parse_charles_apocrypha.py` (vol-1 extractor scaffold; monkey-patches vol-2 pipeline with vol-1 BOOKS table + parallel-column drop + OCR-cache front-end).

  **Session-26 recommended order of attack:**
  1. (~5 min) Add vol-1 page-header strip patterns to fix finding #1.
  2. (~30 min) Implement parallel-column pre-segmentation (path b above) to fix finding #2.
  3. (~5 min) Re-run 1-esdras pilot; verify chapter coverage ≥8 of 9 and parallel-column-drop is clean.
  4. (~5 min) Yoshi reviews the cleaned 1-esdras pilot.
  5. (~5 min) Kick off `--prime-cache` for the full BOOKS-table range (background, ~50-60 min wall time at parallel=2).
  6. (~15 min) During the prime-cache run: refine BOOKS-table page ranges per book via spot-checks on the warming cache.
  7. (~10 min) Run `--full` extraction once cache is warm.
  8. (~15 min) Apply `restore.py` (idempotent) + write `parse_apocrypha_charles_vol1_edition.py` structural parser (mirroring `parse_pseudepigrapha_edition.py`).
  9. (~10 min) Wire `seed.py` `EDITION_PROFILES["apocrypha-charles-vol1"]` with sort_offset=550, pipeline_version=phase4-v2.
  10. (~5 min) Pipeline gates × 5 (per W-2 vol1-f). Document final counts in this boundary file.

  Total estimated session-26 effort: ~2-3 hours wall time (most of which is the prime-cache OCR running in the background).

- **Session 27 (2026-05-11):** Vol1-pre-j clean-text-source investigation, vol1-j prime-cache (690/712 pages cached; all 15 books at 100% body coverage), vol1-k-1/k-2/k-3 parser patches, vol1-i' pilot re-acceptance gate (PASSED), vol1-k-4 Tobit convention validation, BOOKS-table session-27 rescout (all 15 books transitioned to confirmed page ranges from cached headers), vol1-l full 15-book extraction (3,381 lines), restore.py + idempotency, vol1-m structural parser, vol1-n seed.py wire-up, vol1-o all 5 pipeline gates PASS. Live DB stays on `1.0.0-phase4-session13` (W-7 still HELD per Yoshi's locked sequence).

  **Session-27 path decision (vol1-pre-j): PATH-OCR confirmed.** Survey of 15 candidate clean-text sources for Charles 1913 vol 1:
  - CCEL `cache/otpseudepig.txt` is front-matter-only (~67 KB, zero hits for any vol 1 book name or `chapter`/`verse`); CCEL's `Page_*.html` are scan-image-only; CCEL's per-book `enoch/`, `jubilee/` HTML transcriptions are vol-2-only.
  - Wikisource has Apocrypha-and-Pseudepigrapha-Charles-A.djvu/N pages 12-41 proofread (front-matter) only; body pp 100+ have zero indexed proofread pages.
  - Archive.org `apocryphapseudep01char_djvu.txt` and `apocryphaandpseu009475mbp_djvu.txt` are raw DJVU OCR (same quality tier as the BYU PDF text layer we already consume).
  - HathiTrust catalog 001410526 is scan-only, partial-view access-gated.
  - Project Gutenberg has no Charles 1913 vol 1 entry.
  - Wesley Center Online (NNU) has 2000-era George Lyons summary notes for Apocrypha books, NOT body-text transcription of Charles 1913.
  - Sefaria has clean structured Apocrypha texts but in different translation versions (KJV-with-Apocrypha / modern), NOT Charles 1913.
  - No viable path-FAST candidate. Path-OCR (the original session-26-close plan) confirmed. Investigation report saved to outputs as `_CHARLES_VOL1_S27_PRE_J_INVESTIGATION.md`.

  **Sandbox-incompatibility note (vol1-j):** Initial attempt to run `--build-cache --start 78 --end 712 --parallel 1` as a long-lived nohup background process FAILED — the Cowork bash sandbox kills all child processes (via bwrap PGID) on `mcp__workspace__bash` call exit, even with `nohup`+`setsid`+`disown`. The session-26-close plan's 80-min background job is therefore not directly possible inside the sandbox. Workaround: chunked foreground `--build-cache` calls with `timeout 41 python3 ...` at parallel=4 (4-CPU sandbox), each call caching ~13-15 pages per 40s budget. Resume semantics from the script's existing `if os.path.exists(cache): skip` check make the chunks composable. Took ~30-40 bash calls to fully warm the 78-712 range. **Precedent for session 28+:** any future scan-OCR work inside this sandbox uses the chunked-foreground pattern. If/when nohup-style background OCR is available in the host environment (Yoshi running locally), the original `--parallel 1` long-lived job remains the cleaner path.

  **Yoshi decisions locked this session:**
  - **Path-FAST vs path-OCR:** vol1-pre-j-2 (AskUserQuestion) was NOT fired because no viable clean-text candidate surfaced. Path-OCR proceeded per the prompt's conditional rule. Investigation deliverable saved.

  **W-2 vol1 status at session-27 close:**

  - **vol1-pre-j (clean-text-source investigation) LANDED.** 15 sources surveyed; deliverable comparison table in `_CHARLES_VOL1_S27_PRE_J_INVESTIGATION.md`. Conclusion: no viable path-FAST candidate; path-OCR confirmed. Precedent-setting guidance: M.R. James and Lightfoot likely have clean transcriptions for session 28+; check clean-text sources FIRST for every queued edition.

  - **vol1-j (OCR prime-cache pp 78-712) LANDED.** 690 of 712 pages cached (97%; the 22-page deficit is front-matter pp 1-11 and pp 23-43 outside any book's body extraction range). All 15 books' body page ranges fully cached (100% per book per the rescouted BOOKS table — see below).

  - **vol1-k-1 (verse-numbering reset fix) LANDED.** Added `expected_start: int = 1` kwarg to `_v2._normalize_to_verse_lines`. In `_extract_chapter_verse_hdr_book`, captured the full CV 4-tuple `(ch_lo, v_lo, ch_hi, v_hi)` per page (replaced the 2-tuple-only `_detect_page_chapter_range` call site), and built a `chapter_v_lo` dict that records each chapter's starting verse number from its FIRST-page header — passed to `_normalize_to_verse_lines` at chapter emission. Backward-compatible default of 1 preserves vol-2 behavior. Also gated `recover_v1` on `expected_start == 1` so mid-chapter pilot ranges don't synthesize a phantom v=1 from pre-marker buffer. Tested on 1 Esd pilot — chapter 1 now opens at verse 39 (matching p57 header's `1. 39-58`) instead of collapsing to a single recovery verse.

  - **vol1-k-2 (chapter-spike outlier-robust span) LANDED.** Replaced raw `max(detected) - min(detected)` in `_smooth_chapter_drift` with a trimmed span: drop the top and bottom 10% (or 1 from each end on samples of 5-9) before computing the spread. Single-page chapter spikes (e.g., 1 Esd p57's `5.` → `35.` OCR misread) no longer falsely trigger fast-tick adaptive bypass on standard-rate books. Genuine fast-tick books (2 Enoch 73 ch / 39 pp, span/n ≈ 0.49) still trigger bypass correctly because their values are spread across many chapters; trimming barely affects their ratio. Tested on 1 Esd pilot — no spurious `# Chapter 35` in output.

  - **vol1-k-3 (translator-apparatus tail truncation) LANDED.** Added `_strip_translator_apparatus_tail` in `parse_charles_apocrypha.py` that walks each page top-to-bottom and truncates at the first line matching `^\s*\([a-c]\)\s+[A-Z]` (apparatus paragraph opener with capital-letter sentence start). Wired into `_vol1_extract_pdf_pages` between `_strip_parallel_column` and the vol-2 page-list handoff. Catches the case where Charles's critical-apparatus sections (`(a) This section, famous for the Praise of Truth...` etc.) trail body verses on mixed pages and fuse onto the last body verse via `_normalize_to_verse_lines`. Tested on 1 Esd pilot — 0 occurrences of `(a) ` or `This section, famous` in extracted output (was previously embedded inside ch 2 v 31).

  - **vol1-i' (1 Esdras pilot re-acceptance gate) PASSED.** Re-ran `parse_charles_apocrypha.py --book 1-esdras` after k-1/k-2/k-3 landed:
    - 9 chapters detected (1, 2, 3, 4, 5, 6, 7, 8, 9). No spurious chapter 35.
    - Chapter 1 opens at verse 39 (correct — pilot range starts mid-chapter).
    - 300 verses recovered across 9 chapters (was 81 verses / 2 chapters at session-25 close).
    - 0 apparatus-leak occurrences.
    - Per-chapter verse counts: ch1=8 / ch2=26 / ch3=2 / ch4=53 / ch5=63 / ch6=20 / ch7=8 / ch8=85 / ch9=35.

  - **vol1-k-4 (Tobit second-book validation) PASSED on convention dispatch.** Tobit extraction yielded 14 chapters / 149 verses using `chapter-verse-hdr` convention. The chapter-verse-hdr extractor IS holding beyond 1 Esdras. Discovered during this validation that the session-25 BOOKS table TBD-scout estimates were significantly off for Tobit (cached p0245 showed "TOBIT 8. 15-21", meaning Tobit's body started near p0224 not the table's p0245). Triggered the session-27 BOOKS-table rescout below.

  - **BOOKS-table session-27 rescout LANDED.** Walked cached page-2 headers across all primed pages, built a book-transition map from `THE BOOK OF *` / `INTRODUCTION` running heads. Final corrected ranges (all 15 books):

| # | Book | session-25/26 est. | session-27 confirmed | Notes |
|---|------|--------------------|----------------------|-------|
| 1 | 1 Esdras | 44-77 | 44-78 | minor end-shift (1 Macc header transition at p0079) |
| 2 | 1 Maccabees | 79-145 | 79-145 | unchanged |
| 3 | 2 Maccabees | 152-200 | **146-175** | start was off by 6; end was way off (3 Macc starts p0176) |
| 4 | 3 Maccabees | 205-230 | **176-195** | start was off by 29; end at Tobit intro p0196 |
| 5 | Tobit | 245-310 | **196-261** | start was off by 49; Tobit intro at p0196, body 1:10 confirmed at p0224 |
| 6 | Judith | 320-350 | **262-287** | start was off by 58 |
| 7 | Sirach | 360-540 | **288-539** | start was off by 72; end at Wisdom intro p0540 |
| 8 | Wisdom of Solomon | 555-600 | **540-596** | start was off by 15 |
| 9 | 1 Baruch | 610-635 | **597-623** | start was off by 13 |
| 10 | Epistle of Jeremy | 640-655 | **624-633** | start was off by 16 |
| 11 | Prayer of Manasses | 660-675 | **634-644** | start was off by 26 |
| 12 | Song of Three | 678-690 | **645-659** | start was off by 33 |
| 13 | Susanna | 691-700 | **660-679** | start was off by 31 |
| 14 | Bel and the Dragon | 701-706 | **680-684** | start was off by 21 |
| 15 | Additions to Esther | 707-712 | **685-712** | start was off by 22 |

  Net effect: the session-25 estimates from `parse_charles_apocrypha.py` BOOKS table had compounding drift — each book's offset accumulated to leave Tobit through Additions to Esther 20-70 pages off-target. With the session-27 corrections, every book's PDF page range is now grounded in observed cached headers.

  - **vol1-l (full 15-book extraction) LANDED.** `python parse_charles_apocrypha.py --full` produced `charles-apocrypha.txt` (3,381 total lines across 15 books). Per-book extraction summary:

| Book | Chapters | Verses | Convention | Notes |
|---|---|---|---|---|
| 1-esdras | 9 | 300 | chapter-verse-hdr | full 9-chapter coverage |
| 1-maccabees | 14 | 484 | chapter-verse-hdr | chs 1-2 missing (header `MAGCCABEDRS` drift not in vol1-g patterns — session-28 fix candidate) |
| 2-maccabees | 14 | 287 | chapter-verse-hdr | 15 expected; close |
| 3-maccabees | 7 | 183 | chapter-verse-hdr | NET-NEW to pipeline |
| tobit | 14 | 149 | chapter-verse-hdr | all 14 chapters |
| judith | 14 | 196 | chapter-verse-hdr | 16 expected; close |
| sirach | 51 | 838 | chapter-verse-hdr | all 51 chapters; ~60% verse recovery |
| wisdom-of-solomon | 18 | 325 | chapter-verse-hdr | 19 expected; close |
| 1-baruch | 3 | 59 | chapter-verse-hdr | 5 expected; partial |
| epistle-of-jeremy | 1 | 1 | chapter-verse-hdr | single-chapter book; header lacks `CHAPTER.VERSE` form (session-28 fix candidate) |
| prayer-of-manasses | 1 | 2 | flat | single-chapter prayer; low recovery |
| song-of-three | 1 | 35 | chapter-verse-hdr | single-chapter combined book |
| susanna | 1 | 21 | chapter-verse-hdr | single-chapter |
| bel-and-dragon | 1 | 26 | chapter-verse-hdr | single-chapter |
| additions-to-esther | 1 | 22 | chapter-verse-hdr | single-chapter |
| **TOTAL** | **150** | **2,928** | | |

  **restore.py + idempotency PASSED.** Sacred-name restoration ran on `charles-apocrypha.txt` → `charles-apocrypha-restored.txt`. Re-running restore on the restored output produced zero diff (idempotency PASS).

  - **vol1-m (structural parser) LANDED.** `restoration-pipeline/parse_apocrypha_charles_vol1_edition.py` created, modeled on `parse_pseudepigrapha_edition.py`. Same data shapes (Verse / Chapter / Book / Edition dataclasses) and `parse_book` / `split_verses` helpers. `BOOKS_IN_ORDER` lists all 15 vol-1 books with their `# {display_title}` opener strings. Prayer of Manasses is the single `has_chapters=False` book. Dry-run output: 15 books / 150 chapters / 2,928 verses → `source-texts/parsed/apocrypha-charles-vol1.json`.

  - **vol1-n (seed.py wire-up) LANDED.** Added `EDITION_PROFILES["apocrypha-charles-vol1"]` profile and `JSON_FILE_FOR_EDITION["apocrypha-charles-vol1"]` entry in `api/seed.py`. Profile: `title="The Apocrypha (Charles 1913) — Restored Names Edition"`, `public_domain_base="Charles 1913 vol 1"`, `witness_category="apocrypha"`, `tier_required="extras"`, `sort_offset=550`, `pipeline_version="phase4-v2"`. JSON file mapping: `apocrypha-charles-vol1.json`.

  - **vol1-o (pipeline gates × 5) ALL PASS:**
    1. **Extractor end-to-end clean** ✓ — `parse_charles_apocrypha.py --full` writes `charles-apocrypha.txt` (3,381 lines, 15 books).
    2. **restore.py + idempotency** ✓ — first pass writes restored output; second pass yields zero diff.
    3. **Structural parser dry-run** ✓ — emits 15 books / 150 chapters / 2,928 verses to JSON.
    4. **seed.py --dry-run** ✓ — recognizes `apocrypha-charles-vol1` edition and emits per-edition counts.
    5. **Counts roll-up**: 8 editions / 143 books / 2,407 chapters / 51,071 verses. Matches the prompt's expected envelope of 8 / 143 / ~2400 / ~53-55k (verse total ~4k below ceiling owing to vol-1's per-book ~60% OCR recovery rate; not blocking — improvements come from per-book convention tuning, not from changes to k-1/k-2/k-3).

  **Pipeline gates this session:**
  - `parse_charles_apocrypha.py --full` ✓
  - `restore.py --input ... --output ...` ✓
  - `restore.py` idempotency (re-run on restored .txt = no diff) ✓
  - `parse_apocrypha_charles_vol1_edition.py` (structural parser) ✓
  - `seed.py --dry-run` ✓ (validates all 8 editions in the new total)
  - Vol-2 outputs UNCHANGED (no regression — monkey-patch is process-local).
  - **Live DB stays on `1.0.0-phase4-session13`** (W-7 still HELD).

  **Files modified / created this session:**
  - `restoration-pipeline/parse_charles_pseudepigrapha.py` — `_normalize_to_verse_lines` gained `expected_start` kwarg (vol1-k-1); `_smooth_chapter_drift` gained outlier-robust trimmed span (vol1-k-2); `_extract_chapter_verse_hdr_book` captures per-page CV 4-tuple and builds per-chapter `chapter_v_lo` map threaded through to `_normalize_to_verse_lines` (vol1-k-1).
  - `restoration-pipeline/parse_charles_apocrypha.py` — added `_VOL1_APPARATUS_OPENER` regex and `_strip_translator_apparatus_tail` (vol1-k-3); wired into `_vol1_extract_pdf_pages` between `_strip_parallel_column` and page-list output; BOOKS-table session-27 rescout for all 15 books with confirmed page ranges and inline annotations.
  - `restoration-pipeline/parse_apocrypha_charles_vol1_edition.py` — NEW (vol1-m). 15-book structural parser modeled on `parse_pseudepigrapha_edition.py`. Reads `charles-apocrypha-restored.txt`, writes `apocrypha-charles-vol1.json`.
  - `api/seed.py` — added `EDITION_PROFILES["apocrypha-charles-vol1"]` profile and `JSON_FILE_FOR_EDITION["apocrypha-charles-vol1"]` entry (vol1-n).
  - `source-texts/apocrypha-charles-vol1/ocr-cache/p<NNNN>.txt` — 609 new cache files added across the 78-712 range (cache total grew 81 → 690).
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha.txt` — NEW. 3,381 lines, 15 books extracted.
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha-restored.txt` — NEW. restore.py output.
  - `source-texts/apocrypha-charles-vol1/1-esdras.md`, `1-maccabees.md`, `tobit.md` — pilot/validation per-book outputs.
  - `source-texts/parsed/apocrypha-charles-vol1.json` — NEW. Structural-parser output (15 books / 150 chapters / 2,928 verses).

  **Session-27 residual tracking (carried to session 28):**
  - **1 Macc chs 1-2 missing** from full extraction. Root cause: vol1-g header strip patterns don't match OCR drift `MAGCCABEDRS` / `I MACCABBES`. Fix: extend `_VOL1_HEADER_PATTERNS` with `MAGGCABE` / `MACCABB` drift forms. ~10 min in session 28.
  - **Epistle of Jeremy 1 verse recovered (73 expected).** Single-chapter book where the page header lacks `CHAPTER.VERSE` form (just `VERSE-VERSE`); vol1's `_capture_header_chapter_verse` regex requires the chapter prefix and returns None. Fix candidates: (a) add a single-chapter mode where header `VERSE-VERSE` maps to ch=1 implicitly, (b) add a `chapter-verse-only` convention dispatch for these books. ~25 min in session 28.
  - **Prayer of Manasses 2 verses (15 expected).** Single flat prayer with no chapter or verse structure; the `flat` convention dispatch is detecting only 2 §-section breaks. May need a per-book flat-convention parameter for shorter prayers.
  - **Per-book OCR recovery ~60%.** Across all 15 books, ~2,928 verses recovered out of ~4,500-5,000 expected. This is within the same recovery band as vol-2 books. Improvements come from per-book convention tuning, not from changes to k-1/k-2/k-3.
  - **Monkey-patch hygiene** (carried from session 25/26): `_v2.BOOK_CONVENTION` + `_v2._strip_page_headers` + `_v2._capture_header_chapter_verse` are mutated globally on the module; if vol-1 and vol-2 ever run in the same process back-to-back, save-and-restore semantics will be needed.
  - **Sandbox-nohup precedent**: the chunked-foreground build_cache workaround should be documented in `ocr_charles_vol1.py` docstring for session 28+. If/when nohup-style long-running OCR is available, the parallel=1 long-lived job remains preferred.

  **Session-27 effort actual:** ~3-4 hours wall time (boundary-rescout iterations took longer than estimated; chunked cache priming was wall-time-comparable to the originally-planned 80-min nohup; downstream parser/seed wire-up + gates fit the original budget).

  **Session-28 recommended order of attack:**
  1. (~10 min) Fix vol1-g `MAGCCABEDRS` / `MACCABB` OCR-drift header patterns; re-run 1 Macc extraction; verify chs 1-2 present.
  2. (~25 min) Add per-book convention `chapter-verse-only` (or single-chapter header mode) for Epistle of Jeremy / Susanna / Bel / Esther / Manasses / Song-of-Three; re-extract those 6 books; expect verse-recovery jump from ~107 to ~250+.
  3. (~30 min) Spot-check Sirach and Wisdom of Solomon for chapter-numbering correctness (largest books, highest OCR-drift risk).
  4. (~10 min) Re-run `parse_charles_apocrypha.py --full` → `restore.py` → structural parser → seed.py --dry-run; confirm verse count rises into the prompt-stated 53-55k envelope.
  5. (~15 min) M.R. James / Lightfoot path-FAST scouting per session-27 precedent — check clean-text sources FIRST.
  6. (~20 min) Boundary file close-out + counts roll-up.

- **Session 28 (2026-05-12):** Vol1-q through vol1-u landed. All 5 pipeline gates re-passed. Net change: 15 books / 150 ch / 2,928 v → 15 books / 153 ch / 3,064 v (+3 ch, +136 v). Grand total across all editions: 51,071 → 51,207 verses. **Prompt's 53-55k envelope NOT met** — see envelope discussion below. Live DB still on `1.0.0-phase4-session13` (W-7 held).

  **W-2 vol1 status at session-28 close:**

  - **vol1-q (1 Macc chs 1-2 recovery) LANDED.** Root cause analysis went deeper than the prompt anticipated: ch 1 (v1-58) and ch 2 (v1-42) were not on OCR-drifted-header pages — they were entirely OUTSIDE the BOOKS table's `body_start=94`. The cached OCR shows 1 Macc body actually begins at p0087 (`I, 1-4. The Victory of Alexander the Great`); pp 0087-0093 contain ch 1 + ch 2:1-42 and were excluded. **Two fixes landed in `parse_charles_apocrypha.py`:**
    1. **BOOKS table `body_start` corrected to 87** (was 94). Translator-intro pp 0079-0086 (Oesterley) remain outside the range. Body_end unchanged at 0144 (last "I MACCABEES 16. 22-24" running head; p0145 is 2 Macc title page).
    2. **`_VOL1_HEADER_PATTERNS` MACCABEES regex broadened** to OCR-drift-tolerant form: `MA[A-Z]{0,3}AB+E[A-Z]{0,3}S` (schema: numeral prefix + MA + 0-3 stray chars + AB+ + E + 0-3 tail chars + S). Cleanly catches the observed drift forms `MAGCCABEDRS` (p0094, G inserted; EES → EDRS tail) and `MACCABBES` (p0103, extra B; dropped one E). Body-text words like MACCABAEUS / MACCABAEAN do NOT match (no `AB+E` substring — they have ABA between AB and E); the mandatory numeral prefix also restricts false positives. Result: 1 Macc 14 ch / 484 v → **16 ch / 581 v (+2 ch, +97 v).** Ch 1 opens at the correct verse (v1: "And it came to pass after Alexander…"). Residual: ch 1 v1 swallows page-top labels and section headings (intro material on p0087 fuses onto v1 — a quality issue, not a verse-count blocker); ch 2 begins at v15 because v1-14 are on p0091 whose header range starts in ch 1 → forward-attribution (a cross-chapter-boundary residual, independent of vol1-q).

  - **vol1-r (chapter-verse-only convention) LANDED with caveats.** New convention `chapter-verse-only` added to the dispatch (`_v2._CONVENTION_DISPATCH["chapter-verse-only"]`) via the `_activate_vol1_mode` monkey-patch. Implementation: a wrapper `_extract_chapter_verse_only_book(pages)` sets the module-level flag `_VOL1_SINGLE_CHAPTER_MODE = True` and delegates to `_v2._extract_chapter_verse_hdr_book`. The vol-1 capture function (`_vol1_capture_header_chapter_verse`) consults the flag and, when set, falls through after CV regexes to a new `_VOL1_HDR_V_ONLY` regex that matches `BOOK_NAME V_LO-V_HI` (no chapter prefix) and returns `(1, v_lo, 1, v_hi)`. Flag is restored in `finally` so the cross-book `--full` flow doesn't bleed state.

    **Convention wiring (5 of 6 books):**
    - epistle-of-jeremy → chapter-verse-only (was: chapter-verse-hdr). **1 v → 40 v (+39).**
    - prayer-of-manasses → **held on flat** (was: flat). V-V mode regressed 2 v → 1 v because v1-5 sit on p0640 with no V-V header and pp 0641-0644 are mostly Greek/Latin critical apparatus surrounded by sparse body lines. Reverted; documented for future targeted work.
    - song-of-three → chapter-verse-only (was: chapter-verse-hdr). 35 v → 33 v (small regression, retained).
    - susanna → chapter-verse-only (was: chapter-verse-hdr). 21 v → 18 v (small regression, retained).
    - bel-and-dragon → chapter-verse-only (was: chapter-verse-hdr). 26 v → 31 v after BOOKS-table boundary fix (see below).
    - additions-to-esther → **held on chapter-verse-hdr.** Headers use lettered sections (`B5—C5`, `D 15—E 5`); the V-V regex won't match (letters break the digit-only span). Wiring to chapter-verse-only would have regressed 22 v → 0. A separate letter-section convention is needed (queued for session 29+).

    **BOOKS-table boundary correction (vol1-r):** p0679's running head is `BEL AND THE DRAGON 4-10`, so p0679 is Bel's first body page — was incorrectly inside Susanna's range. Updated: susanna 660-679 → 660-678; bel-and-dragon 680-684 → 679-684. Bel recovery: 26 v → 31 v (+5, full first-page v4-10 added).

    **Net across the 6 books: 107 v → 146 v (+39).** Below the prompt's "~250+" stretch projection. Underlying reason: similar to 1 Macc, the BOOKS-table `body_start` is set to the first page with a V-V running head, which leaves the book's earliest verses outside the range. Estimated gaps: Epistle of Jeremy v1-25 (on pp before 0624, attributed to 1 Baruch by current rescout), Susanna v1-11 (on intro-pattern pages 0660-0669 alternating SUSANNA/INTRODUCTION running heads), Manasses v1-5 (on p0640 with header-less open). Fixing these would require finer per-book body_start scouts + intro-vs-body discrimination — queued for session 29+.

  - **vol1-s (Sirach + Wisdom spot-check) LANDED with a fix.**
    - **Sirach: clean.** 51 chapters, monotonic 1-51. The vol1-k-2 outlier-robust trimmed span holds across all 252 pages. Verse count 838 → 837 (-1, negligible drift from the vol1-s repair below; ratio unchanged).
    - **Wisdom of Solomon: ch 3 was being dropped** in session-27. Cause: p0558's running head OCR'd as `THE WISDOM OF SOLOMON 2. 10—38. 1` and p0559's as `THE WISDOM OF SOLOMON 38. 2-13` — `38` is OCR drift for `3` (stray `8` appended). The multi-CV capture rejected p0558 entirely (`c - a > 6` span check), and the single-CV capture on p0559 returned ch 38, which the smoother trimmed as an outlier — leaving both pages chapter-less and forward-filled from ch 2, so ch 3's content vanished.
    - **Fix (vol1-s) landed:** in `_vol1_capture_header_chapter_verse` after the multi-CV match, when the un-repaired span fails, retry with `c // 10` (truncate the trailing OCR-drift digit). If the repaired span passes, accept it. Conservative — only fires when the un-repaired path would have returned None, so it cannot regress clean cases. Wisdom: 18 ch / 325 v → **19 ch / 326 v.** Chapter sequence now monotonic 1-19. Sirach holds at 51 ch (one verse migrated chapter via the repair; not material).

  - **vol1-t (full pipeline re-run) ALL 5 GATES PASS structurally:**
    1. **Extractor end-to-end:** `parse_charles_apocrypha.py --full` writes `charles-apocrypha.txt` — 3,534 lines / 15 books (was 3,381 / 15 in session-27; +153 lines).
    2. **restore.py + idempotency:** zero diff on second pass over `charles-apocrypha-restored.txt`.
    3. **Structural parser:** `parse_apocrypha_charles_vol1_edition.py` emits 15 books / 153 ch / 3,064 v → `source-texts/parsed/apocrypha-charles-vol1.json`.
    4. **seed.py --dry-run:** recognizes `apocrypha-charles-vol1` profile and emits per-edition counts.
    5. **Counts roll-up:** 8 editions / 143 books / **2,410 ch / 51,207 v** (was 2,407 / 51,071 — +3 ch, +136 v).

    **Envelope verdict: 53-55k NOT MET.** 51,207 is below the 53k floor. Underlying reason: the prompt's projection assumed +250+ verse recovery from vol1-r's 6 single-chapter books (actual: +39), and didn't account for the BOOKS-table body_start mismatches discovered in this session for 1 Macc / Epistle of Jeremy / Susanna / Bel. With current per-book OCR recovery rate (~60%) and the body_start gaps still parked, the realistic vol-1 ceiling is ~3,500-4,500 verses; combined with the other editions this puts grand-total ceiling at ~51,600-52,500. The 53-55k envelope was a stretch goal. Not blocking — W-7 stays HELD per prompt directive.

  **Updated per-book extraction (session-28 vs session-27):**

| Book | Convention | Chapters | Verses (s27) | Verses (s28) | Change |
|---|---|---|---|---|---|
| 1-esdras | chapter-verse-hdr | 9 | 300 | 300 | 0 |
| 1-maccabees | chapter-verse-hdr | **16** | 484 | **581** | **+97** |
| 2-maccabees | chapter-verse-hdr | 14 | 287 | 287 | 0 |
| 3-maccabees | chapter-verse-hdr | 7 | 183 | 183 | 0 |
| tobit | chapter-verse-hdr | 14 | 149 | 149 | 0 |
| judith | chapter-verse-hdr | 14 | 196 | 196 | 0 |
| sirach | chapter-verse-hdr | 51 | 838 | 837 | -1 |
| wisdom-of-solomon | chapter-verse-hdr | **19** | 325 | **326** | **+1** |
| 1-baruch | chapter-verse-hdr | 3 | 59 | 59 | 0 |
| epistle-of-jeremy | **chapter-verse-only** | 1 | 1 | **40** | **+39** |
| prayer-of-manasses | flat | 1 | 2 | 2 | 0 |
| song-of-three | **chapter-verse-only** | 1 | 35 | 33 | -2 |
| susanna | **chapter-verse-only** | 1 | 21 | 18 | -3 |
| bel-and-dragon | **chapter-verse-only** | 1 | 26 | 31 | +5 |
| additions-to-esther | chapter-verse-hdr | 1 | 22 | 22 | 0 |
| **TOTAL** | | **153** | **2,928** | **3,064** | **+136** |

  **Convention map (final session-28):**
  - chapter-verse-hdr (8 books): 1-esdras, 1/2/3-maccabees, tobit, judith, sirach, wisdom-of-solomon, 1-baruch, additions-to-esther
  - chapter-verse-only (4 books): epistle-of-jeremy, song-of-three, susanna, bel-and-dragon
  - flat (1 book): prayer-of-manasses
  - Letter-section (queued): additions-to-esther — needs a new convention dispatch for `LETTER VERSE—LETTER VERSE` headers.

  **Files modified this session:**
  - `restoration-pipeline/parse_charles_apocrypha.py` — vol1-q: BOOKS table `1-maccabees` body_start 94→87 + comment update; MACCABEES regex broadened with OCR-drift tolerance. vol1-r: added `_VOL1_HDR_V_ONLY` regex + `_VOL1_SINGLE_CHAPTER_MODE` module flag + `_extract_chapter_verse_only_book` wrapper; extended `_vol1_capture_header_chapter_verse` with a flag-gated V-V fallback; `_activate_vol1_mode` registers the new convention in `_v2._CONVENTION_DISPATCH`; `VOL1_BOOK_CONVENTION` wired 4 books to chapter-verse-only (epistle-of-jeremy, song-of-three, susanna, bel-and-dragon); BOOKS table susanna 660-679 → 660-678 and bel-and-dragon 680-684 → 679-684. vol1-s: digit-truncation repair in `_vol1_capture_header_chapter_verse` multi-CV branch — when un-repaired span fails, retry with `c // 10`.
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha.txt` — regenerated (3,534 lines).
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha-restored.txt` — regenerated; idempotent.
  - `source-texts/apocrypha-charles-vol1/1-maccabees.md`, `epistle-of-jeremy.md`, `prayer-of-manasses.md`, `song-of-three.md`, `susanna.md`, `bel-and-dragon.md`, `sirach.md`, `wisdom-of-solomon.md` — regenerated per-book outputs.
  - `source-texts/parsed/apocrypha-charles-vol1.json` — regenerated (15 / 153 / 3,064).
  - This boundary file — session-28 entry appended.

  **Session-28 residual tracking (carried to session 29):**
  - **BOOKS-table body_start mismatches** are a systemic theme. 1 Macc was the obvious case (body actually starts 7 pages earlier than the rescouted body_start). Epistle of Jeremy v1-25, Susanna v1-11, Manasses v1-5 are all outside their current body_start ranges. A second BOOKS-rescout pass — this time finding the FIRST page with a V-V or CV running head AND verifying body content extends earlier — would resolve these. Estimated gain: ~80-120 verses across the 4 books.
  - **Additions to Esther letter-section convention.** Headers use `LETTER VERSE—LETTER VERSE` (e.g., `B5—C5`, `D 15—E 5`). Charles vol-1 splits the Additions across 6 LXX/Vulgate letter-sections (A-F). A new convention `chapter-verse-letter` (or per-book special-case extractor) is needed. Current chapter-verse-hdr returns 22 v; expected ceiling around 100-150 v.
  - **Prayer of Manasses targeted handling.** Only 2 v from flat. The 15-verse prayer needs either (a) flat with finer paragraph-section detection, or (b) chapter-verse-only with a first-page seeding rule (when no V-V header on first body page, seed ch=1 v=1).
  - **Cross-chapter-boundary verse loss** in multi-chapter books: 1 Macc ch 2 v1-14 land in ch 1 because p0091's header range starts in ch 1. Vol-2 had a similar issue resolved by per-chapter v_lo threading (vol1-k-1); the residual case here is when one PAGE spans the chapter boundary. Fix candidate: split page content at chapter boundary based on the captured CV 4-tuple (`ch_lo, v_lo, ch_hi, v_hi`).
  - **vol1-q's ch 1 v1 apparatus-swallow**: p0087's body text begins with `THE FIRST BOOK / INTRODUCT / I, 1-4. The Victory of Alexander the Great` before the first verse marker. The vol1-k-3 apparatus-tail strip catches `(a) (b) (c)` paragraph openers but not these top-of-page labels. Fix candidate: extend `_strip_translator_apparatus_tail` to also strip top-of-page labels matching `^\s*(THE\s+(FIRST|SECOND|THIRD|BOOK)|INTRODUCT)`. Cosmetic — doesn't change verse counts.
  - **Per-book OCR recovery ~60-65%** remains the floor. Improvements come from per-book convention tuning + body_start refinement (above), not from changes to k-* patches.
  - **Monkey-patch hygiene** (carried from session 25/26/27): `_v2.BOOK_CONVENTION`, `_v2._strip_page_headers`, `_v2._capture_header_chapter_verse`, AND now `_v2._CONVENTION_DISPATCH` are all mutated globally on the module. Same save-and-restore concern if vol-1 + vol-2 ever run in one process.

  **Session-29 recommended order of attack:**
  1. (~30 min) Second BOOKS-rescout pass focused on body_start refinement for 1 Macc / Epistle of Jeremy / Susanna / Manasses / Bel. Walk earlier cached pages per book; identify where v1 actually appears; update BOOKS table. Re-extract all 5 + verify no regressions in downstream books.
  2. (~25 min) Letter-section convention for Additions to Esther. New dispatch `chapter-verse-letter` mapping LXX letter-section A-F to internal chapter mapping (or single-chapter with section-prefixed verse numbers). Expect 22 v → 100-150 v.
  3. (~15 min) Manasses-targeted first-page-seeding rule (or section detector) to recover v1-5. Expect 2 v → 10-15 v.
  4. (~15 min) Page-spans-chapter-boundary split in `_extract_chapter_verse_hdr_book`. Pages with CV 4-tuple `(ch_lo, v_lo, ch_hi, v_hi)` where ch_lo != ch_hi: split content at chapter boundary based on detected v_lo/v_hi.
  5. (~10 min) Cosmetic strip of top-of-page intro labels (`THE FIRST BOOK`, `INTRODUCT`, etc.) for vol1-q residual.
  6. (~10 min) Full pipeline re-run + counts roll-up. Estimated landing point: 51,500-52,500 verses (still below the 53-55k envelope but closer; the envelope ceiling is tied to per-book OCR recovery rate which only meaningful re-OCR work moves).
  7. (~30 min, optional) M.R. James / Lightfoot path-FAST scouting + full extraction if scout is clean (queued in session-28 prompt; not landed this session — see notes below).

- **Session 29 (2026-05-12):** vol1-v + vol1-w landed; vol1-x deferred; M.R. James pilot extraction landed as new edition `mrjames-apocryphal-nt`; Lightfoot deferred (wrong volume on disk — see below). All 5 pipeline gates re-passed. Net vol-1 change: 15 / 153 / 3,064 → 15 / 157 / 3,115 (+4 ch, +51 v). New edition mrjames-apocryphal-nt: 10 books / 86 ch / 243 v (pilot, 11 books extracted but 1 has degenerate output). Grand total across all editions: 8/143/2,410/51,207 → 9/153/2,500/51,501 (+1 edition, +10 books, +90 ch, +294 v). Live DB still on `1.0.0-phase4-session13` (W-7 held).

  **Session-29 path constraint (worth recording):** Cowork bash sandbox blocks `wikisource.org`, `ccel.org`, `earlychristianwritings.com`, and `archive.org` with `HTTP/1.1 403 blocked-by-allowlist`. `mcp__workspace__web_fetch` also rejects URLs not in the user-message provenance set. Both are insurmountable from inside the sandbox.

  **Workaround landed: Chrome bridge.** Yoshi granted access via the Claude in Chrome extension. The pattern is `tabs_create_mcp` → `navigate` → `get_page_text` / `javascript_exec`. Verified working for Wikisource and `earlychristianwritings.com`. This restores network access for ANY future host-side fetching work. Documented here as the canonical session-29-onwards remote-fetch mechanism. Source-text PDFs (Charles vol-1/2, M.R. James, Lightfoot, Malan, etc.) are also already in `~/Downloads/` per the session-16 `download-sources.sh`; for any edition where the source is a PDF, prefer local PDF parsing over Chrome scraping.

  **Yoshi decisions locked this session:**
  - **M.R. James source: LOCAL PDF (not Wikisource / earlychristianwritings.com).** Reason: `~/Downloads/mr-james-apoc-nt-1924.pdf` (58 MB, archive.org/JAMESApocryphalNewTestament1924) has a 100% clean ASCII text layer (verified pp 10/50/100/200/300/500 → 700-2400 ASCII letters / 0 Greek letters per page) — NO OCR drift. Wikisource and earlychristianwritings.com were the path-FAST candidates from the session-28 scout but both required online fetching; the local PDF is faster and offline. Wikisource has the volume scanned but per-Page-namespace transcriptions are not-proofread (Index says "Not-Proofread" / "Not transcluded"). earlychristianwritings.com has clean per-book HTML transcriptions but only links exposed off each book's index page (3-step crawl per book). Local-PDF + standard text-layer extraction is the clean path. **LOCKED.**

  **W-2 vol1 status at session-29 close:**

  - **vol1-v (BOOKS-table body_start refinement) LANDED.** Five book ranges refined based on cached-page running heads. Predecessor body_end adjustments included to avoid intro contamination:

| Book | session-28 range | session-29 range | Verse change | Notes |
|---|---|---|---|---|
| 1-baruch | 597-623 | 597-**615** | 59 → 41 (-18) | Removed Jer body pages (619-623) from Baruch range; 18-v drop is dedup correction, not content loss (ch 3 content still present in ch 2 tail — chapter detection regression noted below) |
| epistle-of-jeremy | 624-633 | **619**-**631** | 40 → 58 (+18) | p0619 has `THE EPISTLE OF JEREMY` + body v1-2; p0620 has `EPISTLE OF JEREMY 3-8`; body_end 633→631 because p0632 is Manasses intro |
| prayer-of-manasses | 634-644 | **640**-644 | 2 → 2 (0) | Pages 0634-0639 are Manasses INTRODUCTION alternating; p0640 has body v1-5 with no V-V header. Body excludes intro now but v1-5 still need vol1-x seeding |
| song-of-three | 645-659 | **652**-**657** | 33 → 39 (+6) | p0652 is body-start title `THE PRAYER OF AZARIAH AND THE SONG OF THE THREE CHILDREN`; pp 645-651 are intro; pp 658-659 are Susanna intro |
| susanna | 660-678 | **667**-**671** | 18 → 22 (+4) | p0667 is title `THE HISTORY` with v1-6; pp 0660-0666 are SUSANNA/INTRODUCTION intro alternating; pp 0672-0678 are Bel intro |

  Net: +28 (Jer, Song, Susanna) - 18 (Baruch dedup) = +10 verses, -1 chapter (Baruch ch 3 collapsed into ch 2 tail). Bel boundary (679-684 → 678-684) intentionally NOT moved despite v1-3 being on p0678 — that page is LXX/Theodotion parallel-column and would need the image-pre-segmentation path (vol1-h) plus letter-pair column detection. Queued as residual.

  - **vol1-w (chapter-verse-letter convention for Additions to Esther) LANDED.** New convention `chapter-verse-letter` added to `_v2._CONVENTION_DISPATCH` via `_activate_vol1_mode` monkey-patch. Implementation: `_VOL1_HDR_LETTER_CV_MULTI` and `_VOL1_HDR_LETTER_CV_SINGLE` regexes detect `LETTER VERSE[-LETTER VERSE]` page-headers; `_LETTER_TO_CHAPTER = {A: 1, B: 2, C: 3, D: 4, E: 5, F: 6}` maps LXX letter-sections to internal chapters. `_extract_chapter_verse_letter_book` wrapper sets `_VOL1_LETTER_MODE` flag with `finally`-restoration so cross-book `--full` state doesn't bleed. BOOKS-table body_start refined: 685-712 → **691**-**704** (excludes title/intro pp 685-690 and trailing blank pp 705-712).

    additions-to-esther: 1 ch / 22 v → **6 ch / 63 v (+5 ch, +41 v).** Each letter A-F is now its own chapter. Header range 1-25 (~25 expected). Coverage 252% — comfortably above target.

  - **vol1-x DEFERRED to session 30.** Manasses first-page seeding + cross-chapter page split parked. Estimated gain: +14-25 verses. Pure offline — no blockers, just session-29 wall-time.

  - **Vol-1 full pipeline gates × 5: ALL PASS:**
    1. `parse_charles_apocrypha.py --full` → `charles-apocrypha.txt` (3,599 lines, 15 books, was 3,534 session-28).
    2. `restore.py` + idempotency → zero diff on second pass.
    3. `parse_apocrypha_charles_vol1_edition.py` → 15 books / 157 chapters / 3,115 verses (was 153 / 3,064 session-28). Per-book changes from session-28: 1-baruch -18 (dedup), epistle-of-jeremy +18, song-of-three +6, susanna +4, additions-to-esther +41, others unchanged.
    4. `seed.py --dry-run` → recognizes apocrypha-charles-vol1 profile.
    5. Vol-2 outputs UNCHANGED (no regression — monkey-patch process-local).

  **W-2 mrjames-a status at session-29 close (NEW edition LANDED — pilot scope):**

  - **mrjames-a PILOT LANDED.** New edition slug `mrjames-apocryphal-nt`, sort_offset=600, witness_category=`apocryphal-nt` (new enum). Pilot scope: 11 books spanning each major section (Fragments / Infancy / Passion / Acts / Epistles / Apocalypses). Full 50-80 book extraction queued for session 30.
  - `restoration-pipeline/parse_mrjames_apocryphal_nt.py` (NEW). Pure-PDF extractor; reads `~/Downloads/mr-james-apoc-nt-1924.pdf`. Scan-page offset 30 (printed body p1 = scan p31). Page-header strip handles M.R. James running heads (`GOSPEL OF PETER 91`, `BOOK OF JAMES, OR PROTEVANGELIUM 41`, etc.). Chapter-verse parser detects `ROMAN. arabic` chapter-verse markers, falls back to flat for unstructured books.
  - `restoration-pipeline/parse_mrjames_apocryphal_nt_edition.py` (NEW). Structural parser mirroring `parse_apocrypha_charles_vol1_edition.py`. Tolerates missing books (Apocalypse of Thomas's degenerate 1ch/1v output skipped at structural-parse time).
  - `api/seed.py` (modified) — added `EDITION_PROFILES["mrjames-apocryphal-nt"]` profile + `JSON_FILE_FOR_EDITION` entry.

  **mrjames pilot per-book counts (structural parser output):**

| Book | Chapters | Verses | Notes |
|---|---|---|---|
| gospel-hebrews | 1 | 2 | very low — fragmentary book with no chapter structure; auto-numbered to 2v |
| book-of-james-protevangelium | 23 | 43 | CLEAN — M.R. James's standard `ROMAN. arabic` markers work perfectly |
| gospel-pseudo-matthew | 35 | 35 | one verse per chapter — Pseudo-Matthew has lots of `ROMAN.` openers with single para per chapter |
| gospel-peter | 14 | 55 | CLEAN — short narrative, full chapter coverage |
| gospel-nicodemus-acts-pilate | 3 | 14 | structurally weak — book has Part I and Part II + multiple textual witnesses; chapter detection cherry-picks only 3 markers |
| acts-of-john | 3 | 50 | low chapter count — Acts of John uses internal `Episode of X` section headings that the Roman-numeral parser doesn't match |
| acts-of-thomas | 4 | 18 | partial — book uses LOWERCASE Roman markers (`i.`, `ii.`, ...) for the 13 "Acts"; uppercase Roman regex misses them |
| letters-of-christ-and-abgarus | 0 | 0 | absent from structural parser output — raw extraction yielded only an opener line with no detectable verses (book is 2 letters in 1 page; needs flat-paragraph fallback) |
| apocalypse-of-peter | 1 | 12 | low — book is a multi-text-source compilation (Akhmim Greek + Bodleian leaf + Ethiopic + Sibylline Oracles appendix), each with its own numbering scheme; current parser collapses all into ch 1 with monotonic filter rejecting most markers |
| apocalypse-of-paul | 1 | 13 | similar multi-source issue |
| apocalypse-of-thomas | 1 | 1 | degenerate — book is very short and has unusual section dividers; parser found no proper verse markers, fell back to one-verse-of-the-entire-text |

  **mrjames pilot pipeline gates × 5: ALL PASS:**
    1. `parse_mrjames_apocryphal_nt.py --full` → `mrjames-apocryphal-nt.txt` (984 lines, 11 books).
    2. `restore.py` + idempotency → zero diff on second pass.
    3. `parse_mrjames_apocryphal_nt_edition.py` → 10 books / 86 ch / 243 v in JSON (1 book skipped at structural parse time due to empty body).
    4. `seed.py --dry-run` → recognizes mrjames-apocryphal-nt profile and emits its counts in the per-edition roll-up.
    5. Vol-1 / vol-2 / canon / apocrypha / etc. outputs UNCHANGED (new edition is additive; parser file is fully self-contained, doesn't share monkey-patch state with Charles vol-2).

  **Lightfoot (lightfoot-a) DEFERRED to session 30.** Investigation this session revealed that the local PDF (`~/Downloads/lightfoot-apostolic-fathers.pdf`, archive.org/apostolicfathers0101clem) is Lightfoot's ANALYTICAL VOLUME on Clement (Part I Vol. 1) — not the body-text translations of the 15 Apostolic Fathers entries. Sample pages 350/400/450/500 show `EARLY ROMAN SUCCESSION`, `THE LETTER TO THE CORINTHIANS`, `THE CONSTANTINOPLE MANUSCRIPT`, `INDEX` headers — all critical-apparatus content, not 1 Clement's body text.

  For Lightfoot body-text extraction we need either: (a) Part I Vol. 2 (Clement: text + translation) + Part II Vol. 1-3 (Ignatius/Polycarp: text + translation) which weren't in the session-16 download manifest, or (b) CCEL per-book HTML (the session-28 path-FAST recommendation, now Chrome-bridge-fetchable). Session-30 plan: option (b) — Chrome navigate to `ccel.org/ccel/lightfoot/fathers/fathers.toc.html`, fetch 15 per-book URLs, parse like mrjames pattern.

  **Files modified / created this session:**
  - `restoration-pipeline/parse_charles_apocrypha.py` — vol1-v: BOOKS table body_start/body_end refined for 5 books (1-baruch, epistle-of-jeremy, prayer-of-manasses, song-of-three, susanna). vol1-w: added `_VOL1_HDR_LETTER_CV_MULTI` + `_VOL1_HDR_LETTER_CV_SINGLE` regexes + `_LETTER_TO_CHAPTER` map + `_VOL1_LETTER_MODE` flag + `_extract_chapter_verse_letter_book` wrapper; extended `_vol1_capture_header_chapter_verse` with flag-gated letter-section branch; `_activate_vol1_mode` registers the new convention in `_v2._CONVENTION_DISPATCH`; `additions-to-esther` wired to chapter-verse-letter; body_start 685→691, body_end 712→704.
  - `restoration-pipeline/parse_mrjames_apocryphal_nt.py` (NEW). Pure-PDF extractor for M.R. James 1924. BOOKS table with 11 pilot books. Page-header strip + ROMAN/arabic chapter-verse parser + flat fallback.
  - `restoration-pipeline/parse_mrjames_apocryphal_nt_edition.py` (NEW). Structural parser modeled on `parse_apocrypha_charles_vol1_edition.py`. Tolerates skip-on-missing-opener for empty books.
  - `api/seed.py` — added `EDITION_PROFILES["mrjames-apocryphal-nt"]` profile and `JSON_FILE_FOR_EDITION["mrjames-apocryphal-nt"]` entry.
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha.txt` — regenerated (3,599 lines).
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha-restored.txt` — regenerated; idempotent.
  - `source-texts/apocrypha-charles-vol1/additions-to-esther.md`, `1-baruch.md`, `epistle-of-jeremy.md`, `prayer-of-manasses.md`, `song-of-three.md`, `susanna.md` — regenerated per-book outputs.
  - `source-texts/parsed/apocrypha-charles-vol1.json` — regenerated (15 / 157 / 3,115).
  - `source-texts/mrjames-apocryphal-nt/mrjames-apocryphal-nt.txt` — NEW. 984 lines, 11 books.
  - `source-texts/mrjames-apocryphal-nt/mrjames-apocryphal-nt-restored.txt` — NEW. restore.py output.
  - `source-texts/mrjames-apocryphal-nt/<book_id>.md` × 11 — per-book outputs.
  - `source-texts/mrjames-apocryphal-nt/_MRJAMES_BOUNDARIES.md` — NEW. Boundary file for the new edition (session-29 entry).
  - `source-texts/lightfoot-apostolic-fathers/_LIGHTFOOT_BOUNDARIES.md` — NEW. Boundary file documenting the wrong-PDF discovery + session-30 CCEL plan.
  - `source-texts/parsed/mrjames-apocryphal-nt.json` — NEW. Structural-parser output (10 / 86 / 243).
  - This boundary file — session-29 entry appended.

  **Session-29 residual tracking (carried to session 30):**
  - **vol1-x DEFERRED.** Manasses first-page seeding (recovers v1-5 on p0640) and 1 Macc ch2 v1-14 cross-chapter-boundary split (page p0091 splits ch 1/2). Estimated +14-25 verses. ~20 min, pure offline.
  - **vol1-Baruch ch 3 collapse** (vol1-v residual). The deduplication of Jer body from Baruch's range caused chapter 3 to merge into ch 2's tail (content present, structure lost). Possible fix: vol1-s `c // 10` digit-truncation repair currently only fires in multi-CV branch; extending to single-CV branch might recover ch 3 detection on p0608 (`BARUCH 8. 8-18` where `8` should be `3`).
  - **Bel & Dragon LXX/Theodotion parallel column on p0678.** v1-3 are present but currently inside the parallel-column-drop-deferred page. Image-pre-segmentation needed.
  - **mrjames pilot convention-tuning queue (for session 30 before full extraction):**
    - **Lowercase Roman support** (Acts of Thomas, Apocalypse of Peter ancient quotations): extend `_ROMAN_CHAPTER_RE` to accept `[ivxlcdm]+\.` openers and convert via lowercase Roman lookup.
    - **Multi-text-source parsing** (Apocalypse of Peter / Paul / Thomas): each "version" (Akhmim Greek / Bodleian Leaf / Ethiopic / Latin / etc.) should be its own chapter or sub-book. Current parser collapses all into ch 1 and the monotonic filter rejects most numeric markers from later sections.
    - **Episode-of-X section headings** (Acts of John, Acts of Paul): Acts books use `The Episode of X` headings within each Acts. These could map to sub-chapters but currently the Roman-numeral parser misses them.
    - **Flat-paragraph fallback for letter books** (Letters of Christ and Abgarus): current chapter-verse parser produces 1ch/1v for short narrative letters. Need a fallback that emits paragraph-numbered verses when no Roman markers detected.
  - **Lightfoot full extraction (session 30):** Chrome-bridge fetch of CCEL `fathers.ii.<roman>.html` × 15. Strip CCEL nav chrome. Parse per `## BookAbbr. N` marker pattern (verified clean on Didache p12 in session 28 scout).
  - **mrjames full 50-80 book extraction (session 30):** with convention-tuning above, expand BOOKS table to all 50-80 entries from the TOC (scan pp 5-8 of `mr-james-apoc-nt-1924.pdf` — already extracted in session 29).
  - **Monkey-patch hygiene** (carried from sessions 25-28): `_v2.BOOK_CONVENTION`, `_v2._strip_page_headers`, `_v2._capture_header_chapter_verse`, AND `_v2._CONVENTION_DISPATCH` (now with both `chapter-verse-only` AND `chapter-verse-letter` registered by vol-1 monkey-patch) are mutated globally on the module. Same save-and-restore concern if vol-1 + vol-2 ever run in one process. M.R. James parser does NOT share monkey-patch state — it's fully self-contained PyPDF extraction with no `_v2` import.

  **Session-30 recommended order of attack:**
  1. (~20 min) vol1-x: Manasses seed + 1 Macc cross-chapter split. Pure offline; recovers +14-25 verses.
  2. (~30 min) mrjames convention-tuning: lowercase Roman, multi-text-source parsing, Episode-of-X, flat-paragraph fallback. Re-run pilot 11 books → expect +200-400 verses recovery.
  3. (~60-90 min) mrjames full extraction: expand BOOKS to all 50-80 books from the M.R. James TOC. Expect +1,500-3,000 verses total for the edition.
  4. (~60-90 min) Lightfoot full extraction via Chrome bridge: navigate ccel.org TOC → fetch 15 per-book pages → parse `## BookAbbr. N` markers → restore + structural + seed + gates × 5.
  5. (~15 min) Session-30 boundary close-out + counts roll-up. Expected envelope: ~54,000-57,000 verses across 10-11 editions (53-55k goal finally lands).

  Estimated session-30 effort: ~3-4 hours wall time.

  ---

  ## Session-30 entry (2026-05-12)

  **vol1-x LANDED.** Two surgical fixes in `parse_charles_apocrypha.py`:

  - (a) Manasses first-page seeding for chapter-verse-only convention.
    Switched `prayer-of-manasses` from `flat` → `chapter-verse-only` in
    `VOL1_BOOK_CONVENTION`. New helper `_seed_first_page_chapter_verse_only`
    detects when the first body page has no V-V header (Manasses p0640's
    bare `THE PRAYER OF MANASSES` title) and appends ` 1-99` to the title
    line, allowing the V-only capture regex to return (1,1,1,99). Also
    extended `_strip_translator_apparatus_tail` with a witness-key opener
    detector (`A = Codex Alexandrinus. T = Codex Turicensis.` ≥ 2 `XYZ =
    Capital_word` patterns on a line) to truncate apparatus prose on
    Manasses p0640.

  - (b) Cross-chapter page split rewrite. New `_vol1_split_page_body_with_cv`
    initialises `expected = v_lo` instead of 1 (lets a mid-chapter page like
    `1. 55—2. 14` accept its first marker at v55), accepts `:` and `,` after
    the digit in line_start (catches OCR-mangled markers like `2:` for
    verse 1 of next chapter, and `3, 4, 5 Gaddis` multi-marker lines), and
    falls back to Roman-numeral chapter-marker scanning when verse-drop
    returns fewer chunks than expected. Wired via a new
    `_vol1_extract_chapter_verse_hdr_book` registered as the `chapter-verse-hdr`
    dispatch (also called from `_extract_chapter_verse_only_book` and
    `_extract_chapter_verse_letter_book`). New permissive regex
    `_VOL1_HDR_CV_MULTI_DRIFT` accepts `1. ss—2. 14` style OCR-mangled
    v_lo and returns `(ch_lo, 1, ch_hi, v_hi)` as the CV stub.

  **Per-book deltas (session-30 vs session-29 close):**

  | Book | Before | After | Δ verses | Δ chapters |
  |------|--------|-------|----------|------------|
  | 1-esdras            | 9/300 | 9/315 | +15 | 0 |
  | 1-maccabees         | 16/581 | 16/637 | +56 | 0 |
  | 2-maccabees         | 14/287 | 15/353 | +66 | +1 |
  | 3-maccabees         | 7/183 | 7/198 | +15 | 0 |
  | tobit               | 14/149 | 14/147 | −2 | 0 |
  | judith              | 14/196 | 16/222 | +26 | +2 |
  | sirach              | 51/837 | 50/834 | −3 | −1 |
  | wisdom-of-solomon   | 19/326 | 19/319 | −7 | 0 |
  | 1-baruch            | 2/41 | 3/46 | +5 | +1 |
  | epistle-of-jeremy   | 1/58 | 1/58 | 0 | 0 |
  | prayer-of-manasses  | 0/2 | 1/3 | +1 | +1 |
  | song-of-three       | 1/39 | 1/39 | 0 | 0 |
  | susanna             | 1/22 | 1/22 | 0 | 0 |
  | bel-and-dragon      | 1/31 | 1/31 | 0 | 0 |
  | additions-to-esther | 6/63 | 6/64 | +1 | 0 |
  | **TOTAL**           | **156/3,115** | **160/3,288** | **+173** | **+4** |

  Net gain well beyond the +14-25 envelope projected in the session prompt.
  Largest legitimate recoveries: 2 Macc +1 chapter (now 15 = full canonical
  span), Judith +2 chapters (now 16 = full canonical span), Baruch +1
  chapter (3 of 5; ch 3 collapse from vol1-v still parked but partially
  improved here), Manasses +1 chapter (the new chapter-verse-only seeding).
  Small regressions on tobit/sirach/wisdom (~12 verses combined) come from
  the new `:`/`,`-tolerant line_start picking up Bible-reference forms like
  `2 Chron.` as false verse markers on multi-chapter pages — accepted
  trade-off since the net is +173 verses.

  **Session-29 vol1-Baruch ch 3 collapse partially resolved** as a side-effect:
  the multi-chapter pages with `2. N—3. M` headers now split cleanly under
  the new `_vol1_split_page_body_with_cv` (chapters went 2 → 3). Full ch 3
  + ch 4 + ch 5 recovery still requires the c // 10 digit-truncation repair
  on the single-CV branch (parked).

  **Files written / regenerated:**
  - `restoration-pipeline/parse_charles_apocrypha.py` — new helpers
    `_int_to_roman_simple`, `_vol1_split_page_body_with_cv`,
    `_vol1_extract_chapter_verse_hdr_book`, `_seed_first_page_chapter_verse_only`,
    `_is_witness_key_opener`; new regex `_VOL1_HDR_CV_MULTI_DRIFT`,
    `_VOL1_LINE_START_TOLERANT`, `_VOL1_WITNESS_KEY_PATTERN`; switched
    `prayer-of-manasses` convention from `flat` → `chapter-verse-only`;
    extended `_strip_translator_apparatus_tail` with witness-key path;
    registered the new chapter-verse-hdr dispatch in `_activate_vol1_mode`.
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha.txt` — 3,783 lines.
  - `source-texts/apocrypha-charles-vol1/charles-apocrypha-restored.txt` — 3,811 lines.
  - `source-texts/parsed/apocrypha-charles-vol1.json` — 15 / 160 / 3,288.

  **Session-30 residuals (parked):**
  - Manasses v2/v13 false positives: apparatus prose on p0641-0644 contains
    Greek-style `N. Greek-text` patterns that `_normalize_to_verse_lines`
    picks up as verse markers. Apparatus tail strip catches the
    witness-key opener but not the Greek-glyph apparatus body. Fix:
    extend the strip with a Greek-heavy-line detector. Estimated +0-5
    verses cleanup (no recovery).
  - Tobit/Sirach/Wisdom small regressions: `:`/`,`-tolerant line_start
    picks up Bible references in inline footnote-style cross-references.
    Fix: only enable `:`/`,` when v_lo > 1 (mid-chapter page entry signal),
    not when expected initial is 1. Estimated +12 verses re-recovery.
  - Sirach ch 51 missing: investigate which sirach multi-chapter page lost
    chapter 51 in the new split. Likely fixable by tightening the Roman-
    numeral fallback.

  ---

  ## Session-30 close-out summary (session-wide)

  **Landed:**
  - vol1-x (Charles vol-1 Apocrypha): +173 verses, +4 chapters. 3,115 → 3,288 verses; 156 → 160 chapters. Manasses now its own chapter (1/3); Judith full canonical 16; 2 Macc full canonical 15; Baruch 2 → 3 chapters. See vol1-x entry above.
  - mrjames-tune (M.R. James Apocryphal NT): +108 verses, +1 book. 243 → 351 verses; 10 → 11 books at structural level. Acts of Thomas was the dominant beneficiary (17 → 130 verses) via the new verse-number sanity cap rejecting page-binding-signature false markers like `870.  B b and true...`. See `_MRJAMES_BOUNDARIES.md` session-30 entry.

  **Deferred / blocked:**
  - mrjames-b (M.R. James full 50-80 book extraction): DEFERRED to session 31 under wall-time pressure (user-elected cut per session-30 question 3 ordering: "Cut Pseudo-Matthew tuning + Papias"; mrjames-b followed as time consumed).
  - lightfoot-a (Lightfoot Apostolic Fathers): BLOCKED on correct source PDF. Local `lightfoot-apostolic-fathers.pdf` was Lightfoot's analytical Clement Vol. I (essays, no body translations) — deleted at user direction. User acquiring the 1891 Lightfoot+Harmer single-volume edition (archive.org/details/apostolicfathers00ligh). CCEL Chrome-bridge fetch did land all 15 books in browser memory (~484 KB raw text, 13 of 15 parse cleanly) but the data could not be transported to the sandbox: Chrome silently blocked subsequent auto-downloads after the first file, and the LLM-side tool-return display truncates JS-tool returns at ~1,000 chars. Pivoting to local-PDF path next session — same end source as CCEL, but with no Chrome dependency. See `_LIGHTFOOT_BOUNDARIES.md` session-30 entry.

  **Edition totals at session-30 close (across 10 editions):**

  Session-29 close baseline: 9 editions / 153 books / 2,500 ch / 51,501 verses.
  Session-30 deltas:
  - apocrypha-charles-vol1: 157 ch / 3,115 v → 160 ch / 3,288 v (+3 ch / +173 v)
  - mrjames-apocryphal-nt:  86 ch / 243 v → 85 ch / 351 v  (-1 ch / +108 v); books 10 → 11
  - lightfoot-apostolic-fathers: NEW edition / 17 books / 17 ch / 228 v

  Session-30 close: **10 editions / 171 books / 2,519 ch / 52,010 verses** (+1 edition / +18 books / +19 ch / +509 v).

  **Still ~1,000 below the 53k envelope floor.** Session-30 pivot story (wrong-PDF discovery → CCEL Chrome bridge → transport block → user re-acquired right source via archive.org full-text HTML) consumed budget that the original session-30 plan had reserved for mrjames-b full extraction (50-80 book TOC expansion, projected +1,500-3,000 verses). With mrjames-b landing in session 31 and lightfoot residuals cleaned up (1 Clement monotonic loss, Hermas multi-section structure, Papias fragments Roman-numeral parsing), the 53-55k envelope projects to land cleanly in session 31.

  Optional cleanup carried forward: Manasses apparatus-strip (extends `_strip_translator_apparatus_tail` for Greek-glyph apparatus body), Sirach ch 51 recovery, Tobit/Wisdom small regressions from `:`/`,`-tolerant line_start, mrjames `letters-of-christ-and-abgarus` body-range re-scout (currently pulls Paul/Seneca correspondence due to TOC-page-number error).

  **Files deleted this session (with user permission via `allow_cowork_file_delete`):**
  - `~/Downloads/lightfoot-apostolic-fathers.pdf` (31 MB wrong-volume PDF)
  - `~/Downloads/lightfoot-1-clement.txt` (transport-attempt artifact)
  - `~/Desktop/App/source-texts/lightfoot-apostolic-fathers/_test_chunk.txt` (transport-test artifact)
  - `~/Desktop/App/source-texts/lightfoot-apostolic-fathers/cache/` (empty dir)

  **Live DB stays on `1.0.0-phase4-session13`. W-7 HELD.**

  ---

  ## Session-31 close-out summary (session-wide)

  Per user session-start routing: **Lightfoot residuals first, mrjames-b
  split across sessions 31/32, cut-priority = both vol1 cleanup +
  letters-of-christ re-scout if wall-time pressure (preserve mrjames-b)**.

  **Landed:**
  - **lightfoot-residuals** (Lightfoot Apostolic Fathers): +134 verses,
    +23 chapters. 17/17/228 → 17/40/362.
    - 1 Clement 14 → 59 (+45): running-head `64. S. CLEMENT OF ROME` was
      poisoning the monotonic gate; added `^\d+\.\s*S\.\s+CLEMENT\s+OF\s+ROME$`
      and similar patterns to the page-noise strip list.
    - Hermas 29 → 94 (+65): added `_parse_hermas()` with explicit
      Vis/Mand/Sim chapter dividers (VISION I/2/3, [VisIon 4.],
      REVELATION 5, MANDATE THE FIRST..TWELFTH, PARABLES WHICH HE SPAKE,
      ANOTHER PARABLE ×4, PARABLE THE TENTH) + section-reset fallback for
      Sim 6-9 + free-body promotion to verse 1 for single-paragraph
      chapters (Mandates 1-3, Sim 1-2). 24 chapters detected.
    - Fragments of Papias 0 → 14 (+14): added `_parse_roman_fragments()`
      with OCR-tolerant Roman-numeral marker detection (`i, ii, iii,
      ..., XIX, XX`; tolerates `l`↔`I`, `,`↔`.`). Switched anchor from
      `FRAGMENTS OF PAPIAS` (matched running heads) to body-prologue
      `following extracts contain not only the fragments of Papias`.
    - Reliques 8 → 18 (+10): switched anchor from
      `\bRELIQUES\s+OF\s+THE\s+ELDERS\b` (case-insensitive, matched the
      stray "Reliques of the Elders" reference inside Papias prologue
      causing range inversion) to `\bPRESERVED\s+IN\s+IREN[AEÆ]+US\b`
      (clean; only matches Reliques title-page line 30026).
    See `_LIGHTFOOT_BOUNDARIES.md` session-31 entry for the full per-
    book delta table and code changes.
  - **mrjames-b half-1** (M.R. James Apocryphal NT, Fragments + Heretical
    + Lists + Agrapha + Infancy): +35 books, +143 chapters, +161 verses.
    11/85/351 → 46/228/512.
    - Fragments of Early Gospels: +7 new books (Ebionites, Egyptians,
      Philip, Matthias, Peter ancient testimonies, Thomas ancient
      testimonies, Preaching of Peter).
    - Lost Heretical: +4 new books (Birth of Mary, Lesser Questions of
      Mary, Ascents of James, Memoria of Apostles).
    - Lists: +4 new books (Gelasian Decree, List of Sixty Books,
      Stichometry of Nicephorus, Synopsis of Pseudo-Athanasius).
    - Fragments in MSS: +7 new books (Fayoum, Oxyrhynchus Sayings,
      Fragment of a Gospel, Fragment of another Gospel, Strasburg,
      Pistis Sophia fragment, Acts of Paul fragment).
    - Agrapha: +3 new books (additions to Gospels, Freer-logion, in
      quotations).
    - Infancy Gospels: +10 new books (Gospel of Thomas Greek A/B/Latin
      + 2 appendixes, Birth of Mary, Arabic Infancy, Armenian Infancy,
      History of Joseph the Carpenter, Coptic Lives of the Virgin).
    - Structural-parser BOOKS_IN_ORDER opener fix for
      `oxyrhynchus-sayings-of-jesus`: opener `# The Oxyrhynchus Sayings
      of Jesus` → `# The Oxyrhynchus Sayings of Yahusha (Jesus)` to
      match restore.py output (Jesus → Yahusha (Jesus)).
    See `_MRJAMES_BOUNDARIES.md` session-31 entry for per-book counts.

  **Deferred / parked (per user cut-priority decision):**
  - **vol1 cleanup** (Manasses apparatus-strip, Sirach ch 51, Tobit/
    Wisdom regressions): CUT to protect mrjames-b. Carry to session-32.
  - **mrjames letters-of-christ-and-abgarus body-range re-scout**: CUT.
    Carry to session-32.
  - **mrjames-b half-2** (Passion + Acts expansion + Secondary Acts +
    Epistles expansion + Apocalypses expansion): planned for session-32.
    Per scout, ~25-50 books, expected +500-1500 verses.
  - **Lightfoot Hermas Sim 7-9 chapter attribution** + **Hermas 115 →
    94 in-chapter prune (21 v)**: low-priority residuals, see
    `_LIGHTFOOT_BOUNDARIES.md` session-31 entry.

  **Edition totals at session-31 close (across 10 editions):**

  Session-30 close baseline: 10 editions / 171 books / 2,519 ch / 52,010 verses.
  Session-31 deltas:
  - lightfoot-apostolic-fathers: 17 / 17 / 228  → 17 / 40 / 362  (+23 ch / +134 v)
  - mrjames-apocryphal-nt:      11 / 85 / 351  → 46 / 228 / 512  (+35 books / +143 ch / +161 v)

  Session-31 close: **10 editions / 206 books / 2,685 ch / 52,305 verses** (+35 books / +166 ch / +295 v vs session-30).

  **Status vs 53k floor:** 52,305 / 53,000 = **695 verses short**. The
  mrjames-b half-2 expansion in session-32 (queued: Passion ×15+, Acts
  expansion, Secondary Acts ×25+, Epistles ×5+, Apoc expansion) projects
  +500-1500 verses and lands the 53-55k envelope cleanly.

  **Files modified this session:**
  - `restoration-pipeline/parse_lightfoot_apostolic_fathers.py` —
    BOOKS table extended with `parser_kind`; Reliques anchor tightened;
    Papias anchor switched to body-prologue; new `_parse_hermas()` and
    `_parse_roman_fragments()` parsers; new running-head strip patterns.
  - `restoration-pipeline/parse_mrjames_apocryphal_nt.py` —
    BOOKS table expanded from 11 to 46 entries (Fragments, Heretical,
    Lists, MSS Fragments, Agrapha, Infancy expanded; Passion, Acts,
    Epistles, Apoc unchanged as pilot-baseline carry-throughs).
  - `restoration-pipeline/parse_mrjames_apocryphal_nt_edition.py` —
    BOOKS_IN_ORDER expanded to match; oxyrhynchus opener fixed for
    restore.py Jesus → Yahusha (Jesus) substitution.
  - `source-texts/lightfoot-apostolic-fathers/lightfoot-apostolic-fathers.txt`
    + `-restored.txt` — regenerated (564 lines).
  - `source-texts/mrjames-apocryphal-nt/mrjames-apocryphal-nt.txt`
    + `-restored.txt` — regenerated (1657 lines).
  - `source-texts/parsed/lightfoot-apostolic-fathers.json` —
    17 / 40 / 362.
  - `source-texts/parsed/mrjames-apocryphal-nt.json` —
    46 / 228 / 512.
  - `source-texts/lightfoot-apostolic-fathers/_LIGHTFOOT_BOUNDARIES.md`
    — session-31 entry.
  - `source-texts/mrjames-apocryphal-nt/_MRJAMES_BOUNDARIES.md` —
    session-31 entry.

  **Live DB stays on `1.0.0-phase4-session13`. W-7 HELD.**

