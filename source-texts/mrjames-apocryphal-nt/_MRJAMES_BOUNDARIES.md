# M.R. James, *The Apocryphal New Testament* (1924) — Edition Boundary Map

**Built session 29, 2026-05-12.** Source PDF: `~/Downloads/mr-james-apoc-nt-1924.pdf` (620 PDF pages, 58 MB, archive.org/JAMESApocryphalNewTestament1924). Public domain (1924 publication, US PD by date; UK PD via 70-year-post-author-death = James d. 1936 → PD since 2007).

Edition slug: `mrjames-apocryphal-nt`. sort_offset=600. witness_category=`apocryphal-nt` (new enum value). tier_required=`extras`. pipeline_version=`phase4-v2`.

## Text-quality finding (session 29)

- **Clean ASCII text layer.** Verified on pp 10/50/100/200/300/500: 700-2400 ASCII letters / 0 Greek letters per page. NO OCR-drift correction needed. Direct PyPDF extraction is the path; no re-OCR, no Wikisource/CCEL fallback.

## Scan-page offset

Body page 1 = scan page 31 → `SCAN_PAGE_OFFSET = 30`. Verified at three calibration points:
- scan p31 = printed p1 (Gospel according to Hebrews title)
- scan p71 = printed p41 (BOOK OF JAMES VI.)
- scan p121 = printed p91 (GOSPEL OF PETER III. 6)

## Verse-marker convention

M.R. James's edition uses **uppercase Roman chapters + Arabic verses**:

```
VI. 1 And day by day the child waxed strong...
2 And the first year of the child was fulfilled...
III. 6 And he delivered him unto the people...
7 And they put on him a purple robe...
```

Some books use lowercase Roman (`i.`, `ii.`) for sub-sections (Acts of Thomas, Oxyrhynchus 654 sayings). Multi-text-source books (Apocalypse of Peter) carry multiple parallel numbering schemes within one chapter — the Akhmim Greek section's `Gr. 22.`, `Gr. 23.` line-start markers vs. the Ethiopic continuation's `190.`, `200.` Sibylline-line numbers — and current parser collapses these into ch 1.

## Session 29 — PILOT scope (11 books)

| # | Book | Printed pp. | Scan pp. | Convention | Status |
|---|---|---|---|---|---|
| 1 | The Gospel according to the Hebrews | 1-7 | 31-37 | flat-fallback | LANDED — 1 ch / 2 v (fragmentary book, sparse markers) |
| 2 | The Book of James, or Protevangelium | 38-48 | 68-78 | chapter-verse-hdr | LANDED — 23 ch / 43 v (clean ROMAN/arabic) |
| 3 | The Gospel of Pseudo-Matthew | 70-78 | 100-108 | chapter-verse-hdr | LANDED — 35 ch / 35 v (one-verse-per-chapter pattern) |
| 4 | The Gospel of Peter | 90-93 | 120-123 | chapter-verse-hdr | LANDED — 14 ch / 55 v (full chapter coverage) |
| 5 | The Gospel of Nicodemus / Acts of Pilate | 94-145 | 124-175 | chapter-verse-hdr | LANDED — 3 ch / 14 v (structurally weak; Part I/II + multiple witnesses) |
| 6 | The Acts of John | 228-269 | 258-299 | chapter-verse-hdr | LANDED — 3 ch / 50 v (Episode-of-X headings missed) |
| 7 | The Acts of Thomas | 364-437 | 394-467 | chapter-verse-hdr | LANDED — 4 ch / 18 v (lowercase Roman markers missed) |
| 8 | The Letters of Christ and Abgarus | 476-477 | 506-507 | (degenerate) | EXTRACTED but skipped by structural parser (1ch/1v at extract; 0/0 at structural) |
| 9 | The Apocalypse of Peter | 505-523 | 535-553 | chapter-verse-hdr | LANDED — 1 ch / 12 v (multi-text-source collapse) |
| 10 | The Apocalypse of Paul | 525-554 | 555-584 | chapter-verse-hdr | LANDED — 1 ch / 13 v (similar) |
| 11 | The Apocalypse of Thomas | 555-562 | 585-592 | (degenerate) | LANDED — 1 ch / 1 v (no proper markers detected) |

**Session-29 totals:** 11 books extracted at the raw layer (`mrjames-apocryphal-nt.txt` = 984 lines / 11 books / 85 chapters / 696 verses raw); 10 books / 86 ch / 243 v at the structural parser layer after monotonic-increasing filter rejects spurious markers.

## Session 29 — DEFERRED (session-30 queue, full 50-80 book extraction)

Sections still to land (per the TOC at scan pp 5-8):
- **FRAGMENTS OF EARLY GOSPELS** (8 entries) — Gospel of Ebionites, Egyptians, Philip, Matthias, Peter (ancient testimonies), Thomas (ancient testimonies), Preaching of Peter
- **LOST HERETICAL BOOKS** (4 entries) — Birth of Mary, Lesser Questions of Mary, Ascents of James, Memoria of the Apostles
- **LISTS OF APOCRYPHAL BOOKS** (4 entries) — Gelasian Decree, List of Sixty, Stichometry of Nicephorus, Synopsis of Pseudo-Athanasius
- **FRAGMENTS PRESERVED IN MANUSCRIPTS** (~7 entries) — Fayoum Gospel-fragment, Oxyrhynchus Sayings, Strasburg papyrus, &c.
- **AGRAPHA** (1+ entries) — Freer-logion + agrapha-in-quotations
- **INFANCY GOSPELS** (8 entries, only Book of James + Pseudo-Matthew piloted) — Gospel of Thomas (Greek A/B/Latin/Pistis Sophia), Gospel of Birth of Mary, Arabic Infancy, Armenian Infancy, History of Joseph the Carpenter, Coptic Lives of the Virgin
- **PASSION GOSPELS** (15+ entries, only Gospel of Peter + Nicodemus piloted) — Letter of Pilate to Claudius, Coptic Narratives, Book of the Cock, Ethiopic fragment, Pilate appendixes (×6), Vengeance of the Saviour, Story of Joseph of Arimathaea, Gospel of Bartholomew, Book of the Resurrection of Christ, Book of John the Evangelist, Assumption of the Virgin (×10 sub-entries)
- **ACTS** (Acts of Paul, Acts of Peter, Acts of Andrew, Acts of Thomas) — only Acts of John + Thomas piloted; Acts of Paul (with Thecla), Acts of Peter (with Quo Vadis tradition), Acts of Andrew, all need expanding
- **THE SECONDARY ACTS** (~25 entries) — Acts of Philip with all sub-entries (i-xv), Acts of Andrew and Matthias, Pseudo-Abdias's 10 books, Minor Acts notices
- **EPISTLES** (6 entries, only Letters of Christ and Abgarus piloted) — Letter of Lentulus, Epistle to the Laodiceans, fragment-perhaps-of-Epistle, Paul and Seneca, Epistle of the Apostles
- **APOCALYPSES** (5 entries, all piloted) — Peter / Paul / Thomas / Virgin (Greek + Ethiopic) / Revelation of Stephen

**Total target: 50-80 books. Estimated verse-equivalent: 1,500-3,000.**

## Session 29 — convention-tuning required before full extraction

1. **Lowercase Roman support** — Acts of Thomas / Apocalypse of Peter ancient-quotations sections use `i.`, `ii.`, etc. for sub-chapters. `_ROMAN_CHAPTER_RE` currently uppercase-only; needs lowercase branch + lookup.
2. **Multi-text-source parsing** — Apocalypse of Peter has A. Ancient Quotations / B. Akhmim Fragment / C. Bodleian Leaf / D. Ethiopic Text / E. Sibylline Oracles appendix. Each should be its own chapter or sub-book.
3. **Episode-of-X section headings** — Acts of John, Acts of Paul use `The Episode of Lycomedes`, `The Story of Thecla`, etc. as section markers. Could map to sub-chapters; currently missed.
4. **Flat-paragraph fallback for letter books** — Letters of Christ and Abgarus is two short letters in one page. Current parser produces 1ch/1v; should auto-detect paragraph boundaries and emit numbered paragraphs as verses.
5. **Pseudo-Matthew "one-verse-per-chapter" pattern** — currently 35 ch / 35 v means each chapter only has one verse (the rest fuses onto the chapter title's body line). Pseudo-Matthew likely has more verses per chapter; needs investigation.

## Pipeline gates × 5 (session-29 close)

1. **Extractor end-to-end:** `parse_mrjames_apocryphal_nt.py --full` writes `mrjames-apocryphal-nt.txt` (984 lines / 11 books). ✓
2. **restore.py + idempotency:** zero diff on second pass. ✓
3. **Structural parser:** `parse_mrjames_apocryphal_nt_edition.py` writes `mrjames-apocryphal-nt.json` (10 books / 86 ch / 243 v). ✓
4. **seed.py --dry-run:** recognizes `mrjames-apocryphal-nt` profile and emits per-edition counts. ✓
5. **Counts roll-up:** 9 editions / 153 books / 2,500 ch / 51,501 v (was 8 / 143 / 2,410 / 51,207 at session-28 close). +1 edition / +10 books / +90 ch / +294 v. ✓

Live DB stays on `1.0.0-phase4-session13`. W-7 HELD.

## Session log
- Session 29 (2026-05-12): Pilot extraction LANDED — 11 books across 6 sections. Convention-tuning queue + full 50-80 book expansion documented for session 30. See `_CHARLES_VOL1_BOUNDARIES.md` session-29 entry for full session-wide accounting.

- Session 30 (2026-05-12): mrjames-tune partial. Three fixes landed in `parse_mrjames_apocryphal_nt.py` + `parse_mrjames_apocryphal_nt_edition.py`:

  1. **Verse-number sanity cap.** New gate in `_parse_body_to_verse_lines` rejects verse-marker candidates >300 OR more than 100 ahead of `current_verse`. Page-binding signatures like `870.  B b and true marriage` (printer's signature on printed page 870) were being picked up as verse markers and killing monotonicity downstream — the structural parser dropped most of each chapter after the spurious 870-verse "marker". The cap treats out-of-range candidates as continuation of the current verse. Acts of Thomas was the largest beneficiary (130 verses vs prior 17 at structural level).
  2. **Flat-paragraph fallback (partial).** New `in_auto_mode` flag in `_parse_body_to_verse_lines`: when no explicit chapter/verse marker has fired, blank lines flush the current verse so the next paragraph opens as a new auto-verse. Once any explicit marker fires, the flag is locked off (so mid-book switches still work). Did NOT improve Letters of Christ and Abgarus / Apocalypse of Thomas in this run because those pages' BOOKS-table boundaries appear to cover the wrong printed range (need re-scout). Still cheap and may help future books.
  3. **Lowercase Roman support (regex added, not yet wired).** New `_ROMAN_NUMERAL_LOWER`, `_ROMAN_CHAPTER_LOWER_RE`, `_roman_lower_to_int`. Held as a separate regex; would need to be threaded into `_parse_body_to_verse_lines` as a secondary chapter-opener signal. Parked for follow-up.
  4. **Restore-aware book opener (`letters-of-christ-and-abgarus`).** Updated `BOOKS_IN_ORDER` opener from `# The Letters of Christ and Abgarus` to `# The Letters of Messiah (Christ) and Abgarus` (matches `restore.py` Christ → Messiah (Christ) transformation). Recovered the book from being silently dropped at structural parsing (session-29 was 10 books / 86 / 243 because letters-of-christ-and-abgarus's opener-match failed and its content fused into Acts of Thomas).
  5. **PDF path glob.** `_resolve_pdf_path` now globs `/sessions/*/mnt/Downloads/mr-james-apoc-nt-1924.pdf` rather than hard-coding the session-29 mount path.

  **Per-book deltas (session-30 mrjames-tune vs session-29 close):**

  | Book | Before (struct) | After (struct) | Δ |
  |------|----------------|-----------------|---|
  | gospel-hebrews                       | 1/2  | 1/1   | -1  |
  | book-of-james-protevangelium         | 23/43 | 23/43 | 0   |
  | gospel-pseudo-matthew                | 35/35 | 35/35 | 0   |
  | gospel-peter                         | 14/55 | 14/55 | 0   |
  | gospel-nicodemus-acts-pilate         | 3/14  | 3/12  | -2  |
  | acts-of-john                         | 3/50  | 3/49  | -1  |
  | acts-of-thomas                       | (4/18 fused) | 2/130 | +112 |
  | letters-of-christ-and-abgarus        | (missing)    | 1/1   | +1  |
  | apocalypse-of-peter                  | 1/12  | 1/11  | -1  |
  | apocalypse-of-paul                   | 1/13  | 1/13  | 0   |
  | apocalypse-of-thomas                 | 1/1   | 1/1   | 0   |
  | **TOTAL**                            | **10/86/243** | **11/85/351** | **+1 book / -1 ch / +108 v** |

  The acts-of-thomas gain (+112 verses) is the dominant effect: the sanity cap removes the spurious 870-style markers that previously killed monotonic filtering across the chapter.

  **Residuals parked for follow-up (lower priority than lightfoot-a):**

  - **Multi-text-source parsing for Apocalypse of Peter** (A. Ancient Quotations / B. Akhmim / C. Bodleian / D. Ethiopic / E. Sibylline). Current 1ch/11v fuses all sources. Would need each source as a separate chapter or sub-book.
  - **Episode-of-X section headings** (Acts of John, Acts of Paul). Roman-numeral parser still misses these.
  - **Pseudo-Matthew one-verse-per-chapter pattern** (35ch/35v). User-elected to defer per session-30 question 3.
  - **Letters of Christ and Abgarus body-range mismatch.** The body content fetched from pp 476-477 contains Paul/Seneca correspondence (sigh, first-page numbered as `1. SENECA TO PAUL, greeting`), not the actual Abgarus letters. Likely a TOC-page-number error; needs re-scout.
  - **Lowercase Roman wiring.** Regex added but not wired into the chapter-opener logic. Wire next session if Acts of Thomas / Apocalypse of Peter ancient quotation sub-sections matter.

  **mrjames-b full 50-80 book extraction DEFERRED to session 31** under session-30 wall-time pressure. Lightfoot-a (~600-900 verse yield) takes priority for the 53-55k envelope landing.

- Session 31 (2026-05-12): **mrjames-b HALF-1 LANDED** (+35 books / +161 verses).

  Per user session-start routing decision (split-into-2-sessions): session-31
  expands BOOKS table for FRAGMENTS OF EARLY GOSPELS + LOST HERETICAL +
  LISTS + FRAGMENTS PRESERVED IN MSS + AGRAPHA + INFANCY GOSPELS (~25-30
  books). Session-32 will land PASSION + ACTS + EPISTLES + APOC half-2.

  **TOC scout (scan pp 3-8) — 29 new books across half-1 sections:**

  | Section | New entries (printed pp.) |
  |---------|---------------------------|
  | Fragments of Early Gospels | Ebionites (8-9), Egyptians (10-11), Philip (12), Matthias (12), Peter ancient testimonies (13), Thomas ancient testimonies (14-15), Preaching of Peter (16-17) — 7 |
  | Lost Heretical Books       | Birth of Mary (19), Lesser Questions of Mary (20), Ascents of James (20), Memoria of Apostles (21) — 4 |
  | Lists                      | Gelasian Decree (21-22), List of Sixty Books (23), Stichometry of Nicephorus (23), Synopsis of Pseudo-Athanasius (24) — 4 |
  | Fragments in MSS           | Fayoum (25), Oxyrhynchus Sayings (25-27), Fragment of a Gospel (28), Fragment of another Gospel (29), Strasburg papyrus (30), Pistis Sophia fragment (31), Acts of Paul fragment (31-32) — 7 |
  | Agrapha                    | Additions to Gospels (33), Freer-logion (34), In quotations (34-37) — 3 |
  | Infancy Gospels            | Thomas Greek A (49-54), Thomas Greek B (55-57), Thomas Latin (58-65), Pistis-Sophia appendix (66), Miracles appendix (66-69), Birth of Mary (79), Arabic Infancy (80-82), Armenian Infancy (83), History of Joseph the Carpenter (84-86), Coptic Lives of the Virgin (87-88) — 10 |

  **Pipeline (extract → restore → structural):**

  - Extractor wrote 46 books / 228 chapters / 836 verses raw to
    `mrjames-apocryphal-nt.txt`.
  - restore.py applied idempotently (1657 lines in / out).
  - Structural parser wrote 46 books / 228 chapters / **512 verses** to
    `mrjames-apocryphal-nt.json`.

  **Per-book counts (full session-31 listing):**

  | Book | ch | v | Notes |
  |------|----|----|-------|
  | gospel-hebrews                       |  1 |   1 | (was 1/1; baseline) |
  | gospel-ebionites                     |  1 |   1 | NEW — short fragment |
  | gospel-egyptians                     |  1 |   1 | NEW — short fragment |
  | gospel-philip-fragments              |  1 |   1 | NEW |
  | gospel-traditions-of-matthias        |  1 |   1 | NEW |
  | gospel-peter-ancient-testimonies     |  1 |   1 | NEW |
  | gospel-thomas-ancient-testimonies    |  1 |   1 | NEW |
  | preaching-of-peter                   |  1 |   1 | NEW |
  | birth-of-mary                        |  1 |   1 | NEW |
  | lesser-questions-of-mary             |  1 |   1 | NEW |
  | ascents-of-james                     |  1 |   1 | NEW |
  | memoria-of-apostles                  |  1 |   1 | NEW |
  | gelasian-decree                      |  1 |   1 | NEW |
  | list-of-sixty-books                  |  1 |   1 | NEW |
  | stichometry-of-nicephorus            |  1 |   1 | NEW |
  | synopsis-of-pseudo-athanasius        |  1 |   1 | NEW |
  | fayoum-gospel-fragment               |  1 |   1 | NEW |
  | oxyrhynchus-sayings-of-jesus         |  1 |   1 | NEW (Jesus → Yahusha (Jesus) opener fix) |
  | fragment-of-a-gospel                 |  1 |   2 | NEW |
  | fragment-of-another-gospel           |  1 |   1 | NEW |
  | strasburg-papyrus                    |  1 |   1 | NEW |
  | pistis-sophia-fragment               |  1 |   1 | NEW |
  | acts-of-paul-fragment                |  1 |   1 | NEW |
  | agrapha-additions-to-gospels         |  1 |   1 | NEW |
  | freer-logion                         |  1 |   1 | NEW |
  | agrapha-in-quotations                |  1 |   2 | NEW |
  | book-of-james-protevangelium         | 23 |  43 | (no change) |
  | gospel-thomas-greek-a                | 20 |  24 | NEW |
  | gospel-thomas-greek-b                | 11 |  11 | NEW |
  | gospel-thomas-latin                  | 14 |  26 | NEW |
  | gospel-thomas-pistis-appendix        |  2 |   2 | NEW |
  | gospel-thomas-miracles-appendix      |  4 |   4 | NEW |
  | gospel-pseudo-matthew                | 35 |  35 | (no change; one-verse-per-chapter pattern parked) |
  | gospel-birth-of-mary                 |  8 |   8 | NEW |
  | arabic-infancy-gospel                | 23 |  23 | NEW |
  | armenian-infancy-gospel              |  7 |   7 | NEW |
  | history-of-joseph-carpenter          | 28 |  28 | NEW |
  | coptic-lives-of-virgin               |  1 |   1 | NEW |
  | gospel-peter                         | 14 |  55 | (no change) |
  | gospel-nicodemus-acts-pilate         |  3 |  12 | (no change) |
  | acts-of-john                         |  3 |  49 | (no change) |
  | acts-of-thomas                       |  2 | 130 | (no change) |
  | letters-of-christ-and-abgarus        |  1 |   1 | (no change; half-2 re-scout queued) |
  | apocalypse-of-peter                  |  1 |  11 | (no change) |
  | apocalypse-of-paul                   |  1 |  13 | (no change) |
  | apocalypse-of-thomas                 |  1 |   1 | (no change) |
  | **TOTAL** | **228** | **512** | (s30: 85/351 → s31: 228/512 = +143 ch / +161 v) |

  **Session-31 delta vs session-30:** +35 books / +143 chapters / +161 verses.

  **Half-2 queue for session 32:**

  - PASSION GOSPELS (15+ entries): Letter of Pilate to Claudius, Coptic
    Narratives, Book of the Cock, Ethiopic fragment, Pilate appendixes
    (Letters of Pilate ×6, Death of Pilate), Vengeance of the Saviour,
    Story of Joseph of Arimathaea, Gospel of Bartholomew, Book of the
    Resurrection of Christ, Book of John the Evangelist, Assumption of
    the Virgin (×10 sub-entries) — pp 117-227.
  - ACTS expansion (Acts of Paul + Thecla, Acts of Peter, Acts of
    Andrew) — pp 270-363.
  - SECONDARY ACTS (Acts of Philip i-xv, Acts of Andrew & Matthias,
    Pseudo-Abdias's 10 books, Minor Acts notices) — pp 438-475.
  - EPISTLES expansion (Letter of Lentulus, Epistle to the Laodiceans,
    Paul + Seneca, Epistle of the Apostles) + letters-of-christ-and-
    abgarus body-range re-scout (currently pulls Paul/Seneca by
    mistake) — pp 476-503.
  - APOCALYPSES expansion (Apocalypse of the Virgin Greek + Ethiopic,
    Revelation of Stephen) — pp 563-568.

  Expected half-2 yield: +25-50 books, +500-1500 verses.
