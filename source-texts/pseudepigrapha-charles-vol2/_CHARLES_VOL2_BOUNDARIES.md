# Charles 1913 Vol 2 — Pseudepigrapha Edition Boundary Map

**Built session 20, 2026-05-11.** Source PDF: `~/Downloads/charles-1913-vol2.pdf` (898 PDF pages, 78 MB, R. H. Charles ed., *The Apocrypha and Pseudepigrapha of the Old Testament in English*, Vol. II — Pseudepigrapha, Oxford at the Clarendon Press, 1913). Public domain.

PDF page layout: front matter pp. 1-20 (PDF) = roman-numeral front matter (preface, contents, contributors, general introduction, addenda et corrigenda, symbols & abbreviations). Body text begins PDF page 21 = printed page 1 (Jubilees Introduction §1). Offset to be calibrated precisely at parse time (front matter has blank pages and may shift the offset by a page).

## Boundary index

| # | Book | Translator | Printed pp. | Status | Framework-lens vigilance |
|---|---|---|---|---|---|
| — | The Book of Jubilees | Charles | 1-82 | **HELD — already wired in seed.py** (raw-charles single-book edition). See Decisions §1. | n/a — not extracted |
| 1 | The Letter of Aristeas | Andrews | 83-122 | INCLUDE | Low — Hellenistic-Jewish framing of the LXX origin story; W-6 commentary navigates the Septuagint-legend layer |
| 2 | The Books of Adam and Eve | Wells | 123-154 | INCLUDE | Low-moderate — Apocalypse of Moses + Latin Life of Adam-Eve combined; narrates Adamic seed story (framework-friendly territory) |
| 3 | The Martyrdom of Isaiah | Charles | 155-162 | INCLUDE | Low — narrative account of the prophet's martyrdom; pre-Christian Jewish layer |
| — | 1 Enoch | Charles | 163-281 | **HELD — already wired in seed.py** (raw-charles single-book edition). See Decisions §2. | n/a — not extracted |
| 4 | The Testaments of the XII Patriarchs | Charles | 282-367 | INCLUDE — flag at parse time | **HIGH** — known Christian interpolations in the standard text (especially the Levi and Naphtali sections); body translation includes interpolated passages; framework-lens read required at parse time; flag every passage that reads as evangelistic Christological insertion for the boundary file |
| 5 | The Sibylline Oracles | Lanchester | 368-406 | INCLUDE — flag at parse time | **HIGH** — Jewish-Christian redactional layers throughout; books III-V are largely Jewish, books I-II and VI-VIII contain heavy Christian inclusions; parse-time framework-lens read identifies any Christological eschatology and Trinitarian-shaped doctrine for the boundary file |
| 6 | The Assumption of Moses | Charles | 407-424 | INCLUDE | Low-moderate — fragmentary Jewish apocalyptic; mostly pre-Christian; some eschatological frames W-6 navigates |
| 7 | 2 Enoch (Secrets of Enoch) | Forbes and Charles | 425-469 | INCLUDE — flag at parse time | **MODERATE** — Slavonic source has long/short recensions; some passages carry late-redactional theological layers (sevenfold-heavens cosmology, possible interpolation around the Melchizedek pericope) |
| 8 | 2 Baruch (Syriac Apocalypse) | Charles | 470-526 | INCLUDE | Moderate — pre-Christian Jewish apocalyptic; framework-friendly resurrection eschatology in most chapters; W-6 commentary on the appointed-reign-on-the-earth references |
| 9 | 3 Baruch (Greek Apocalypse) | Hughes | 527-541 | INCLUDE — flag at parse time | **MODERATE-HIGH** — Greek text has visible Christian interpolations especially in the heavenly-ascent middle chapters; parse-time read flags Christological inclusions |
| 10 | 4 Ezra | Box | 542-624 | INCLUDE (as standalone in new edition) | Low — pre-Christian Jewish apocalyptic; contains the Bensly fragment (ch 7:35a-35cv); body translation is Box's restored-Latin English; W-6 commentary on the eternal-conscious-torment passages in the fragment |
| 11 | The Psalms of Solomon | Gray | 625-652 | INCLUDE | Low — first-century-BC Jewish psalmody; Messianic Psalms 17 and 18 frame the Messiah's reign in framework-compatible terms (kingdom of priests, gathering of the dispersed) |
| 12 | 4 Maccabees | Townshend | 653-685 | INCLUDE — framework-lens articulation in boundary file | **MODERATE** — Greek Stoic-philosophical homily on martyrdom theology in Jewish garb; not narrative/Mosaic; not prophetic; rhetorical philosophy; keep as witness with framework-lens note that this is Hellenistic Jewish philosophy of suffering, not Torah instruction |
| 13 | Pirké Aboth (Sayings of the Fathers) | Herford | 686-714 | INCLUDE — framework-lens articulation in boundary file | **HIGH (architectural)** — Pharisaic-rabbinic literature; records the Mishnaic chain of tradition that the framework identifies as the Mark 7:13 second-blade Judaizer architecture (voiding Torah by tradition). The text records what the Pharisees taught; it does not preach contrary-to-Torah as scripture pretending to be Mosaic. Keep as witness with framework articulation that this is the body of inherited rabbinic tradition the framework's diagnostic exposes — W-6 commentary lays the Pharisee-architecture rebuke (Mark 7:13, Matthew 23) over the text directly |
| 14 | The Story of Ahikar | Harris, Lewis, Conybeare | 715-784 | INCLUDE | Low — pre-Christian Aramaic wisdom literature; sayings-genre; framework-neutral |
| 15 | The Fragments of a Zadokite Work | Charles | 785-834 | INCLUDE — flag at parse time | **HIGH** — Damascus Document material from a sectarian Yashar'el (Israelite) community; carries its own theological architecture; framework-lens read identifies where the sectarian frame stands with or against Torah; some passages frame the Messiah-of-Aaron / Messiah-of-Yashar'el (Israel) doctrine which W-6 commentary navigates |

**Total: 15 books for the new pseudepigrapha edition** (TOC 17 entries minus Jubilees minus 1 Enoch).

Plus: **Bensly fragment inline-restoration into the existing apocrypha edition's 2 Esdras 7** as a separate parse-time operation (lifted from Charles vol 2 4 Ezra ch 7, slotted between v35 and the current v36 per `DOWNLOAD_MANIFEST.md` A-2 spec). The fragment patches an already-wired edition (apocrypha), not the new pseudepigrapha edition.

Apparatus to drop: Charles's General Introduction to vol 2 (pp. vii-xi). Addenda et Corrigenda (pp. xii-xiii). Symbols and Abbreviations index. Each book's own translator-introduction. Each book's textual apparatus + critical notes. Every footnote on every page. General Index (pp. 835-871). Page headers. **Editorial apparatus does not enter the Bible** (Yoshi session 18, locked).

## Text-quality notes

- Text layer is **OCR-derived from a 1913 print scan**, not a clean Unicode source. Quality varies page-to-page.
- **Greek-glyph substitution drift** is the dominant OCR error pattern. The OCR engine substitutes visually-similar Greek glyphs for English letters in title-case and bold-face text (e.g., `BOMBAY → ΒΟΜΒΑΥ`, `OLD TESTAMENT → OLD BESTAMENT`, `R. H. → m. H.`, `BESEMENT → BESTAMENT`, `OF → ὦ`). Parser must normalize Greek-glyph drift back to ASCII where the underlying word is English. Detection rule: a token containing Greek characters in a context where surrounding tokens are ASCII English is almost certainly OCR drift.
- **Footnote markers** (`!`, `?`, `:`, numeric superscripts that get flattened to baseline by OCR) interrupt body text. Footnote bodies appear in smaller print at page bottom. Parser drops both the inline markers and the footnote bodies.
- **Page headers** typically carry the book name (`THE BOOK OF JUBILEES`, `INTRODUCTION TO VOLUME II`, etc.) at the top of every printed page. Parser strips these.
- **Section headings within a book** vary by translator. Some books use `§1.`, `§2.` style. Some use `CHAPTER I.`, `CHAPTER II.` style. Some use roman numerals. Parser detects each book's convention at the book's opening pages and normalizes to `Chapter N. CAPTION` style for downstream structural parsing.
- **Verse markers** also vary. Some books use Latin numerals (`1.`, `2.`), some use raised superscripts the OCR flattens, some use bold paragraph-starters. Parser detects per-book convention and emits monotonic `N.  text` shape.
- Charles's text often **bracketed-marks restorations and editorial conjectures** in `[square brackets]`. These are part of the translation Charles publishes; they remain in the body. Critical apparatus that uses square brackets in a different mode (e.g., manuscript-variant notation in footnotes) is already stripped with the footnote-body.

## Decisions (Yoshi's calls — session 20, 2026-05-11)

1. **Jubilees overlap — HOLD.** Yoshi's call (session 20 conversation, clarified after asking what HOLD meant): *"yes leave it out."* Charles vol 2's Jubilees text is NOT extracted. The existing `jubilees` edition (raw-charles single-book source, already wired in `seed.py`) stays as-is. Rationale: clean new-edition scope, no disturbance to a wired live edition; Charles vol 2's 1913 revision is the same translator's later revised version of essentially the same English text, so the swap-or-parallel decision would carry risk for marginal text-delta gain. If Yoshi wants the 1913 revision specifically at a later date, the swap lands as a W-4-or-W-7-class re-restoration. **LOCKED.**

2. **1 Enoch overlap — HOLD.** Yoshi's call (session 20 AskUserQuestion answer): *HOLD (Recommended).* Charles vol 2's 1 Enoch text is NOT extracted. The existing `enoch` edition (raw-charles single-book source, already wired in `seed.py`, sourced from `enoch-raw-charles.txt`) stays as-is. Same rationale as Jubilees. **LOCKED.**

3. **4 Ezra + Bensly fragment — INLINE + PARALLEL.** Yoshi's call (session 20 AskUserQuestion answer): *INLINE + PARALLEL (Recommended).* Two operations on Charles vol 2's 4 Ezra (pp. 542-624):

   (a) **INLINE-RESTORATION of the existing apocrypha edition's 2 Esdras 7.** Lift Box's 4 Ezra ch 7 from Charles vol 2; slot the Bensly fragment verses (canonical 4 Ezra 7:36-105 = 2 Esdras 7:36-105) into the existing parsed apocrypha 2 Esdras chapter 7 in the position the manifest specifies (between current v35 and current v36); renumber the existing v36-70 to v106-140 to match canonical 2 Esdras numbering. This patches the already-wired `apocrypha` edition. Run `restore.py` over the patched chapter to stamp sacred-name parentheticals onto the new verses. Document the inline operation in this boundary file when complete.

   **Session 23 implementation (2026-05-11, LANDED):** `restoration-pipeline/patch_bensly_into_apocrypha.py` performs the JSON-level surgical merge. Donor: `source-texts/parsed/pseudepigrapha-charles-vol2.json` 4-ezra Chapter 7 (canonical-numbered range 1..140; 93 of 140 captured under the ~33% OCR-loss baseline of 4 Ezra ch 7). Recipient: `source-texts/parsed/apocrypha.json` 2-esdras chapter 7 (pre-patch: 70 verses 1-70, KJV-1611 numbering without Bensly). Operation: split recipient at v35; insert donor verses 36-105 (Bensly fragment, 49 captured of 70 canonical — extraction loss mirrors the 4 Ezra ch 7 baseline); renumber recipient v36-70 → v106-140 with +70 offset. Result: 119 verses, top verse 140, delta +49. The lifted Bensly verses are restore.py-stamped already (they come from `charles-pseudepigrapha-restored.txt`, idempotent at the W-2 close); no additional restore.py pass needed on the patched chapter — sacred-name parentheticals (`Yashar'el (Israel)`, `Elohim (God)`, `Yahuah (Lord)`, `Yahudi (Jewish)`) carry through intact. Backup of pre-patch apocrypha.json at `source-texts/parsed/apocrypha.json.pre-bensly`. Idempotency: the patch script detects post-v35-v105 Bensly presence + max-verse-num ≥ 106 and skips on second run. `seed.py --dry-run` post-patch: apocrypha grows from 5711 → 5760 verses (delta +49), chapter count unchanged at 187, total 47,664 verses across 7 editions / 128 books / 2209 chapters.

   (b) **PARALLEL inclusion in the new pseudepigrapha edition.** Vol 2's full 4 Ezra (all chapters, Box's translation) is also extracted as a standalone book in the new pseudepigrapha edition. This preserves the parallel-text path for the future W-6 commentary's comparison work (parsed-apocrypha 2 Esdras vs. Charles-vol-2 4 Ezra side by side).

   **LOCKED.**

4. **Edition slug = `pseudepigrapha`.** Display name: *The Pseudepigrapha (Charles 1913)*. Witness-category enum extension: new value `pseudepigrapha` to be added to `seed.py`'s witness_category enum (one-time-add pattern matching how `historical_witness` was added in session 19). **LOCKED at session-20 open.**

5. **Granularity = 15 labeled books** as listed in the boundary index above. **LOCKED at session-20 open.**

6. **Apparatus-drop discipline (carried forward from Whiston session 18).** Charles's General Introduction to vol 2, Addenda et Corrigenda, Symbols and Abbreviations index, each individual book's translator-introduction, all textual apparatus, all critical notes, all footnotes, all page headers, and the General Index are stripped at parse time and do NOT enter the body of the Bible. *"This is our bible"* — Yoshi session 18. Only the underlying primary-text translation enters the published edition. W-6 commentary replaces the apparatus.

7. **Framework-lens partial-truth-witness test at parse time (carried forward from Whiston session 18).** Each book's body translation is read through the framework lens at parse time. If the body translation itself is a faithful rendering of the underlying Hebrew/Greek/Latin/Syriac source — even where the source text carries internal contradictions or where the W-6 commentary will need to navigate divergences — the book is INCLUDED in the edition. If the body itself preaches a contrary-to-Torah doctrine *as if scripture* (Hippolytus-Hades architecture: eternal-conscious-torment as cosmological fact, Luke-16-as-literal-cosmology, etc.), the book is HELD with framework-lens articulation transcribed to this boundary file. **The system does not enter the Bible.** The HIGH-vigilance books in the boundary index above (Testaments of XII Patriarchs, Sibylline Oracles, 3 Baruch, Pirké Aboth, Fragments of a Zadokite Work, 2 Enoch [moderate-high], 4 Maccabees [moderate-architectural]) get the test applied at parse time and any HOLD decisions get transcribed here.

8. **Pilot-first strategy (carried forward from Whiston session 18 §6).** Extract one book alone first to validate the parser end-to-end. Recommendation: **The Letter of Aristeas** (pp. 83-122, 40 printed pages, clean Hellenistic-Jewish prose, low framework-lens vigilance, Andrews's translation has clean section-numbering convention). Pilot output saves to `source-texts/pseudepigrapha-charles-vol2/aristeas.md`. Wire a temporary single-book edition profile in `seed.py` if needed for end-to-end verification; otherwise hold seed.py wiring until all 15 books extract cleanly. Yoshi reviews the pilot output. If clean, batch the remaining 14 books in one pass. **PROPOSED — confirm/override at next checkpoint.**

## Decisions (session 22 — Yoshi's calls, 2026-05-11)

9. **Ahikar parallel-column manuscripts — Syriac A as primary.** Yoshi's session-22 AskUserQuestion answer: *Syriac A as primary (Recommended).* Drop Syr. B / Arabic / Armenian / Ethiopic / Greek column text at parse time. Matches what most Restored Names editions of Ahikar do; preserves the oldest Semitic witness. **LOCKED.**

10. **Testaments of XII Patriarchs chapter labeling — per-Testament named chapters.** Yoshi's session-22 AskUserQuestion answer: *Per-Testament named chapters (Recommended).* Chapter labels in the live `testaments-xii` book carry the Testament name + chapter number — `Reuben 1`, `Reuben 2`, …, `Simeon 1`, …, `Levi 1`, …, `Benjamin N`. Matches scholarly citation convention (T.Reub 1.5, T.Lev 18.2). Verse counter resets per Testament-chapter. **LOCKED.**

11. **Adam and Eve dual-manuscript handling — two chapter ranges, prefixed labels.** Yoshi's session-22 AskUserQuestion answer: *Two chapter ranges, prefixed labels (Recommended).* Apocalypse of Moses (Greek tradition, chs 1-43) and Vita Adae et Evae (Latin Life of Adam and Eve, chs 1-51) both emit under the single `adam-eve` book entry with labels `Apoc. Moses Chapter N` and `Vita Adae Chapter N` respectively. Preserves both manuscript traditions intact; reader can navigate either tradition; matches Charles's published intent. **LOCKED.**

12. **Sibylline Oracles chapter mapping — printed Book → chapter.** Yoshi's session-22 AskUserQuestion answer: *Printed Book → chapter (Recommended).* Sibylline Book III → chapter labeled `Book III`; Book IV → `Book IV`; Book V → `Book V`; Fragment III → `Fragment III`. Parenthesized inline line numbers `(8)`, `(15)`, `(63)` become verse numbers within each Book; line numbers preserve Charles's original numbering (NOT renumbered to 1-N per chapter — this matches scholarly citation form Sib.Or. 3.46). **LOCKED.**

## Session log

- **Session 24 (2026-05-11):** W-2.5 extraction-quality limitations queue CLOSED. Six sub-pieces landed in `restoration-pipeline/parse_charles_pseudepigrapha.py` (extractor only — `parse_pseudepigrapha_edition.py` structural parser unchanged from session-23, regenerated the JSON automatically from the updated restored .txt).

  **W-2.5a fast-tick adaptive smoother** — `_smooth_chapter_drift` now detects fast-tick books via `span(max−min)/page_count ≥ 0.4` (calibrated lower than the originally-proposed 0.8 to catch books where header detection partially fails; 2 Enoch hits ratio ~0.49 with 15 unique chapter values detected of 73 canonical). On fast-tick detection the function bypasses the forward-monotonic-by-+3 guard, trusts raw header chapter (the `_capture_header_chapter_verse` backward-span fix already lands the right chapter per page), and applies only 3-neighbor isolated-spike rejection. An experimental forward-jump cap was tested but dropped chapter coverage on 2 Enoch (17 vs 20 ch) because the cap discarded page bodies that `_split_page_body_by_verse_drop` chunking would have spread across multiple wrongly-numbered-but-structurally-renumbered chapters; spec-aligned spike-rejection-only path retained.

  **W-2.5b Pirké Aboth saying-detection enrichment** — new dispatch convention `pirke-aboth-sayings` with dedicated `_extract_pirke_aboth_book` extractor. Detects rabbinic-saying boundary cues (`R. <Name> said:` / `Rabban <Name> said:` / `<Name> b. <Patron> said:` / `Ben <Name> said:` / `He used to say:` / `He said to them:`) and combines them with digit-marker positions in the flattened body; emits each detected saying as a sequentially-numbered verse. Pirké Aboth went from 15 sayings (sess 23) to **128 sayings** (target ≥ 80, exceeded).

  **W-2.5c Sibylline backward-jump tolerance** — `_normalize_sibylline_chapter` soft-filter rewrite. The session-22 hard monotonic filter (`num < expected − 5`) was replaced with `num < expected − 30` plus range sanity (1..2000). Fragment III's out-of-order `8..38, 49, 40, 41, 42, 43, 44, 45..49` sequence now lands cleanly (42 markers vs prior 37). A fully-disabled filter caused footnote line-number references (`(23) See line above`) to leak as spurious verse markers; the soft filter rejects those while preserving legitimate out-of-order Fragment III + parallel-column inversions. Sibylline went from 262 verses (sess 23) to **370 verses** across 4 chapters.

  **W-2.5d Naphtali over-detect + Hebrew Naphtali / Aramaic Levi appendix drop** — Yoshi's session-24 content-authority call: **DROP** (recommended). `_extract_testaments_book` now truncates the groups list after Benjamin's testament; the Hebrew Naphtali + Aramaic Levi Appendix I & II material that re-appeared as duplicate `Naphtali Chapter 1..12` + `Levi Chapter 1..2` blocks in the session-23 output is now cleanly excluded. An experimental paragraph-break validator for `_split_body_into_chapters_by_verse_drop` over-rejected legitimate intra-testament chapter breaks (testaments-xii dropped from 110 → 13 chapters); the validator was reverted, accepting Naphtali's residual 1-chapter over-detect (9 detected vs canonical 8) as a manageable trade. Testaments-XII went from 110 ch / 623 v (sess 23, with 14 ghost chapters) to **96 ch / 515 v** (canonical scope, no appendix material).

  **W-2.5e first-verse-of-chapter merge** — `_normalize_to_verse_lines` gained an optional `recover_v1=True` parameter that synthesizes verse 1 from pre-first-marker body content when the first detected marker is verse 2+ AND the pre-marker buffer carries ≥ 30 chars of substantive content. Wired into `_extract_chapter_verse_hdr_book` (every chapter) and `_split_body_into_chapters_by_verse_drop` (every testament sub-chapter). Modest verse-count gains across the affected books: martyrdom-isaiah +1, assumption-moses +4, 3-baruch +5, 4-ezra +6, psalms-solomon +5, zadokite-fragments +5.

  **W-2.5f Adam-Eve manuscript attribution refinement** — `_extract_adam_eve_book` multi-transition manuscript-split heuristic: scans for ALL high→low chapter transitions in the marker stream (was: first only) and alternates `Apoc. Moses` / `Vita Adae` labels across the splits. Modest improvement only — the parallel-column OCR flatten still constrains attribution accuracy; per-page running-header signal + content-keyword cues approach was scoped out because the marker-recovery floor (16 chapters detected of 94 canonical across both manuscripts) bounds the upside. No verse count change (20 verses, unchanged from session 23).

  **Per-book results (session 24 vs session 23 vs session 22):**

  | Book | S22 v | S23 v | S24 v | S22 ch | S23 ch | S24 ch | Notes |
  |---|---|---|---|---|---|---|---|
  | aristeas | 224 | 224 | 224 | 0 | 1 | 1 | unchanged (flat) |
  | adam-eve | 21 | 20 | 20 | 16 | 16 | 16 | unchanged (multi-transition heuristic) |
  | martyrdom-isaiah | 19 | 19 | 20 | 4 | 4 | 4 | +1 from W-2.5e |
  | testaments-xii | 623 | 623 | 515 | 110 | 110 | 96 | −108 v / −14 ch from W-2.5d appendix drop |
  | sibylline | 272 | 262 | 370 | 4 | 4 | 4 | +108 v from W-2.5c filter relaxation |
  | assumption-moses | 44 | 44 | 48 | 10 | 10 | 10 | +4 from W-2.5e |
  | 2-enoch | 22 | 22 | 107 | 3 | 3 | 20 | +85 v / +17 ch from W-2.5a (target ≥50 ch undershot due to 2 Enoch OCR floor on pp. 468-472) |
  | 2-baruch | 54 | 54 | 245 | 6 | 6 | 43 | +191 v / +37 ch from W-2.5a |
  | 3-baruch | 64 | 64 | 69 | 10 | 10 | 13 | +5 v / +3 ch from W-2.5e + smoother |
  | 4-ezra | 454 | 454 | 460 | 12 | 12 | 12 | +6 v from W-2.5e |
  | psalms-solomon | 172 | 172 | 177 | 16 | 16 | 16 | +5 v from W-2.5e |
  | 4-maccabees | 99 | 99 | 163 | 9 | 9 | 14 | +64 v / +5 ch from W-2.5a |
  | pirke-aboth | 15 | 15 | 128 | 0 | 1 | 1 | +113 v from W-2.5b (target ≥80, exceeded) |
  | ahikar | 83 | 83 | 83 | 9 | 9 | 9 | unchanged |
  | zadokite-fragments | 118 | 118 | 123 | 14 | 14 | 14 | +5 v from W-2.5e |
  | **TOTAL** | **2284** | **2273** | **2752** | **223** | **225** | **273** | **+479 v / +48 ch vs sess 23** |

  **Pipeline gates at session-24 close**: `restore.py --self-test` 83/83 PASS. `restore.py` idempotency PASS on regenerated `charles-pseudepigrapha-restored.txt` (1,112,987 chars). `parse_pseudepigrapha_edition.py` regenerated JSON (15 books / 273 chapters / 2752 verses; structural parser unchanged from session-23). `patch_bensly_into_apocrypha.py` re-ran cleanly from `apocrypha.json.pre-bensly` baseline (+49 verses to 2 Esdras chapter 7, top verse 140 — the W-2.5a fast-tick smoother did NOT improve Bensly recovery because 4 Ezra's chapter detection ratio (~0.19) falls below the fast-tick threshold; the +49 figure is identical to session-23 and bounded by the 4 Ezra ch 7 page-stripping OCR-loss baseline, not the smoother). `seed.py --dry-run`: **7 editions / 128 books / 2257 chapters / 48,143 verses** (vs session-23's 47,664; delta +479 verses, +48 chapters).

  **Known residual limitations queued for future passes:**
  - **2 Enoch chapter recovery floor (~20 of 73 canonical).** Pages 468-472 in the PDF carry OCR-corrupted chapter readings (80, 380, 88 where canonical is 27-32) that the spike-rejection smoother cannot recover because the readings cluster (no consistent neighbors). Forward-jump cap was tested and reverted (it lost downstream chapter coverage from `_split_page_body_by_verse_drop` chunking). Recovery would require either (a) OCR re-running with better engine on the affected pages, or (b) hand-correction of the BOOKS table or per-page chapter overrides for 2 Enoch specifically. Verse-count gain (22 → 107) is still substantial.
  - **Sibylline 1.36x verse inflation vs scholarly canon.** Soft-filter recovery accepts more parenthesized markers than session-22's harder filter; the structural parser's per-chapter verse-number-keying coalesces some duplicates, but a small residual of footnote-leakage markers remains. Plausible-but-imperfect; acceptable per W-3 architecture (chapter sequential 1..N, verse keyed by number).
  - **Naphtali 1-chapter over-detect (9 of canonical 8).** Paragraph-break validator was reverted because it over-rejected legitimate intra-testament chapter breaks (testaments-xii dropped from 110 → 13 chapters). Acceptable trade vs the appendix-drop gain.
  - **Adam-Eve manuscript attribution coverage (16 of ~94 canonical).** Multi-transition heuristic provides modest improvement only; parallel-column OCR flatten bounds the upside. Per-page running-header signal + content-keyword cues approach was scoped out as low-impact.

  **Files modified this session**:
  - `restoration-pipeline/parse_charles_pseudepigrapha.py` (W-2.5a/b/c/d/e/f landed — extractor only)
  - `source-texts/pseudepigrapha-charles-vol2/charles-pseudepigrapha.txt` (regenerated)
  - `source-texts/pseudepigrapha-charles-vol2/charles-pseudepigrapha-restored.txt` (regenerated, idempotent)
  - `source-texts/parsed/pseudepigrapha-charles-vol2.json` (regenerated via stable structural parser)
  - `source-texts/parsed/apocrypha.json` (re-patched from `.pre-bensly` baseline; +49 verses to 2 Esdras 7, unchanged from session-23 baseline since 4 Ezra didn't trigger fast-tick)
  - This boundary file (session-24 entry + per-book counts table extension)

  **W-2 / W-4 / W-5 / W-6 / W-7 status unchanged** — all deferred per Yoshi's locked sequence. Live DB stays on `1.0.0-phase4-session13` until W-6 substantially closes.

- **Session 23 (2026-05-11):** W-3 (structural parser + seed.py wire) and W-3b (Bensly inline-patch) both LANDED. The session 22 extraction output's chapter-aware `# Chapter N` markers walked cleanly through a Whiston-template structural parser.

  **W-3: `restoration-pipeline/parse_pseudepigrapha_edition.py` (new).** Modeled on `parse_josephus_edition.py`'s multi-book pattern. Walks each `# <book title>` opener from `charles-pseudepigrapha-restored.txt`, slices books, finds `^# <label>$` chapter markers within each book, splits each chapter on monotonic `N.  ` verse markers (same convention as Whiston). Sequential 1..N chapter numbering within each book — uniform across all conventions (standard `Chapter N`, testaments-named `Reuben Chapter N`, adam-eve-roman `Apoc. Moses Chapter N`, sibylline `Chapter Book III`) — preserves (book_id, chapter_number) uniqueness; the full marker label rides in `chapter.title` for human citation. Aristeas and Pirké Aboth (no internal chapter markers per W-3 spec) get one synthetic chapter with sections-as-verses, matching the Whiston Life/Apion pattern. Per-book output: aristeas 1 ch / 224 v, adam-eve 16 / 20, martyrdom-isaiah 4 / 19, testaments-xii 110 / 623, sibylline 4 / 262, assumption-moses 10 / 44, 2-enoch 3 / 22, 2-baruch 6 / 54, 3-baruch 10 / 64, 4-ezra 12 / 454, psalms-solomon 16 / 172, 4-maccabees 9 / 99, pirke-aboth 1 / 15, ahikar 9 / 83, zadokite-fragments 14 / 118. **Total: 15 books / 225 chapters / 2273 verses** = 99.5% of the ~2284-verse target. Output: `source-texts/parsed/pseudepigrapha-charles-vol2.json`.

  **W-3: `api/seed.py` wire-up.** Added `EDITION_PROFILES["pseudepigrapha"]` entry (title "The Pseudepigrapha (Charles 1913) — Restored Names Edition", public-domain base "Charles 1913 vol 2", `witness_category=pseudepigrapha`, `tier_required=extras`, `sort_offset=500` placing after Josephus's 400, `pipeline_version=phase4-v2` matching restore.py-3). Added `JSON_FILE_FOR_EDITION["pseudepigrapha"] = "pseudepigrapha-charles-vol2.json"`. Discovery (vs Yoshi's session-23 prompt): the `pseudepigrapha` witness_category is **already in the schema.sql enum at line 106** — used by the existing enoch/jubilees/jasher entries — so no enum extension was needed at the python OR SQL layer; the historical_witness-style one-time-add pattern Yoshi described was unnecessary for this category. `seed.py --dry-run` post-W-3: **7 editions, 128 books, 2209 chapters, 47,615 verses** (Yoshi's targets: 7 / 128 / ~2200 / ~47,600 — all hit).

  **W-3b: `restoration-pipeline/patch_bensly_into_apocrypha.py` (new).** Implementation of Decisions §3(a) — see the §3 update above for full operational detail. JSON-level surgical merge with backup + idempotency detection. Post-patch totals: **7 editions, 128 books, 2209 chapters, 47,664 verses** — apocrypha grew by exactly +49 verses (5711 → 5760). The +49 reflects 49 Bensly verses captured of 70 canonical (consistent with the ~33% OCR-loss baseline of 4 Ezra ch 7 elsewhere in the donor; an extraction-side improvement queued for future session refinement, not blocking this patch).

  **W-2.5 limitations status update.** Re-reading session-22's §e–§i limitations queue against the actual session-22 emission output yielded one surprise:
  - **§h (Judah Testament missing)** — appears RESOLVED at the file level. The session-22 boundary table claimed "Judah Testament shows 0 chapters", but `charles-pseudepigrapha-restored.txt` contains `# Yahudah (Judah) Chapter 1` through `# Yahudah (Judah) Chapter 16` (16 chapters, 105 verses). The boundary-table claim was likely a misread of the extractor's console output or pre-restore.py state; either way, the structural parser walked 16 Judah chapters cleanly into the JSON.
  - **§e (fast-tick chapter books undercount)** — still present (2-Enoch 3 of 73, 2-Baruch 6 of 87, 4-Maccabees 9 of 18, 3-Baruch 10 of 17). The structural parser correctly walks the chapters that ARE detected; full recovery requires session-24 adaptive-smoother work in the extractor, as Yoshi's prompt classed.
  - **§f, §g, §i (first-verse-merge, adam-eve manuscript heuristic, Naphtali over-detect)** — all deferred to session 24 per Yoshi's session-23 prompt.
  - **New finding: Pirké Aboth verse-marker OCR loss.** Boundary table claimed "(now 41 in restored)"; actual session-22 emission contains 15 monotonic verse markers (1, 3, 5, 6, 7, 8, 9, 10, 12, 13, 14, 19, 20, 23, 41). The "41" refers to the highest verse number, not the captured count. ~26 sayings (Hillel's, Shammai's, Gamaliel's groups around verses 11-22, plus several embedded sayings in verses 23 and 41) are OCR-merged into surrounding verse bodies as continuation prose. Structural parser correctly emits what's marked — extraction-side enrichment is a session-24 candidate.
  - **New finding: Sibylline monotonic-filter loss.** Fragment III has verse markers in order 8..38, 49, 45, 46, 47, 48 — the monotonic filter rejects the 45-48 quartet (backward span). 10 verses lost across the sibylline-paren convention out of 272 (~3.7%); acceptable.

  **Output files at session-23 close**:
  - `source-texts/parsed/pseudepigrapha-charles-vol2.json` (new — W-3 structural output, 15 books / 225 chapters / 2273 verses)
  - `source-texts/parsed/apocrypha.json` (patched — W-3b Bensly inline-restoration; 2 Esdras 7 went from 70 to 119 verses; total apocrypha now 14 books / 187 chapters / 5760 verses)
  - `source-texts/parsed/apocrypha.json.pre-bensly` (backup of pre-W-3b state, retained for diff-audit purposes)
  - `restoration-pipeline/parse_pseudepigrapha_edition.py` (new — W-3 structural parser)
  - `restoration-pipeline/patch_bensly_into_apocrypha.py` (new — W-3b inline-restoration script with idempotency detection)
  - `api/seed.py` (modified — `pseudepigrapha` edition profile + JSON_FILE_FOR_EDITION mapping)

  **Pipeline gates at session-23 close**: `seed.py --dry-run` clean lift: **7 editions / 128 books / 2209 chapters / 47,664 verses** (targets 7 / 128 / ~2200 / ~47,600 all hit). NO host-side seed run executed — W-7 explicitly held per Yoshi's locked sequence; live DB stays on `1.0.0-phase4-session13` until W-6 substantially closes.

  **Next session (W-2.5 + W-2 + W-4 + W-5 queue).** Session 24 candidates: (1) W-2.5 extraction refinements — §e fast-tick adaptive smoother for 2-Enoch / 2-Baruch / 3-Baruch / 4-Maccabees, plus the new Pirké Aboth verse-marker detection and Sibylline out-of-order tolerance; (2) W-2 remaining — Charles vol 1, Malan, Lightfoot, M.R. James extractions on the now-hardened parser pattern; (3) W-4 — Wright 1887 Syriac Psalms 152-155 + Brenton 1851 LXX Psalm 151 sourcing; (4) W-5 — resolve Bucket C's question of which of the not-in-pseudepigrapha-edition books Yoshi wants pulled in (Apocalypse of Abraham via Box 1918 PDF is the standalone exception now that the chapter-aware Charles vol 2 batch is wired). W-6 commentary pass and W-7 host-side seed both still HELD.

- **Session 21 (2026-05-11):** Parser hardening landed; all 14 remaining books' body-page boundaries CALIBRATED against the actual PDF (BOOKS table in `parse_charles_pseudepigrapha.py`); full 15-book batch ran end-to-end; `restore.py` applied cleanly with idempotency PASS. New per-book extraction limitations discovered and queued for session-22 hardening.

  **Parser fixes landed this session:**
  - **Fix (ii) — inline OCR-artifact cleanup pass.** New `_clean_inline_artifacts()` helper strips standalone pipes (`|`), backslashes (`\`), runs of underscores (`__`), and leading-glyph residue from each assembled verse body. Verified on Aristeas verse 4: prior session-20 output "This embassy then I undertook with | enthusiasm" now renders cleanly as "This embassy then I undertook with enthusiasm".
  - **Fix (i) — page-header verse-range coverage instrumentation.** New `_capture_header_verse_range()` helper extracts the digit-dash-digit pattern from each page's running header (pre-strip) and reports per-book coverage (verses recovered vs expected per-page-header range) at extract time. Aggressive in-prose marker recovery deferred — instrumentation only this session, since the per-book convention scope (below) is the actual blocker.
  - **Fix (iii) — Aristeas Yahusha (Jesus) flag investigation.** Both occurrences are in the LXX-translator catalog (verse 48: "Of the fifth tribe, Isaac, Jacob, Yahusha (Jesus), Sab-" + verse 49: "Of the eighth tribe, Theodosius, Jason, Yahusha (Jesus), Theodotus..."). These are legitimate personal-name references — *Yeshua* was a common Yahudi (Jewish) name in the Hellenistic period (cf. *Jesus son of Sirach*, *Jesus son of Nave / Joshua*, *Jesus called Justus*). Per voice-skill convention "other biblical human names: either form is acceptable", the Hebrew restoration is technically correct. NOTE the published Apocrypha preserves bare "Jesus" for non-Messiah figures (per `JESUS_NON_MESSIAH_GUARD` in `restore.py` lines 572-594, which catches "Jesus the son of X" patterns but NOT the bare-name-in-comma-list pattern Aristeas uses). Optional follow-up: extend the guard to catch list-context Jesus tokens. Not blocking the batch.
  - **Fix (iv) — per-book body-page boundary calibration.** All 14 remaining books locked against the actual PDF via `scout_charles_vol2.py`. Final BOOKS table (PDF page ranges):
    - aristeas (114-142) — locked session 20
    - adam-eve (155-174) — was 147-175
    - martyrdom-isaiah (179-182) — was 179-186
    - testaments-xii (316-386) — was 311-392; drops Appendices I & II (Aramaic Levi apparatus)
    - sibylline (398-426) — was 397-432
    - assumption-moses (434-444) — was 437-452
    - 2-enoch (451-489) — was 458-496
    - 2-baruch (501-546) — was 506-553
    - 3-baruch (553-561) — was 559-569
    - 4-ezra (582-644) — was 575-652
    - psalms-solomon (651-672) — was 659-680
    - 4-maccabees (686-705) — was 687-716
    - pirke-aboth (711-734) — was 721-745
    - ahikar (745-804) — was 755-812
    - zadokite-fragments (820-854) — was 819-866

  **Full 15-book batch results.** Raw extraction: `charles-pseudepigrapha.txt` (1.2 MB). Restored: `charles-pseudepigrapha-restored.txt` (idempotency PASS — second restore.py pass produced no diff). Sacred-name stamp counts in restored text: 183 × `Elohim (God)`, 57 × `Yashar'el (Israel)`, 24 × `Yahudah (Judah)`, 21 × `Yahudi (Jewish)`, 17 × `Yahudim (Jews)`, 4 × `Ruach HaKodesh (Holy Spirit)`, 3 × `Yahusha (Jesus)`, 3 × `Messiah (Christ)`, 2 × `Yahuah (God)`, 2 × `Yahudi (Jew)`, 2 × `son of Adam`, 1 × `Son of Adam`. Red Line #12 firing across the corpus.

  **Per-book extraction coverage (verses recovered / expected from header verse-range):**
  | Book | Verses | Header range | Coverage | Convention |
  |---|---|---|---|---|
  | aristeas | 224 | 6-322 | 71% | flat monotonic — Andrews's §-sections |
  | adam-eve | 8 | (none) | n/a | Roman-numeral chapters mid-line ("vii. 1") |
  | martyrdom-isaiah | 3 | (none) | n/a | chapter.verse not detected |
  | testaments-xii | 27 | (none) | n/a | "<C> <V> text" first-line + per-Testament resets |
  | sibylline | 0 | 1-809 | 0% | parenthesized line-nums "(N)" |
  | assumption-moses | 8 | 5-13 | 89% | chapter.verse, single-chapter range |
  | 2-enoch | 8 | 1-15 | 53% | chapter.verse |
  | 2-baruch | 32 | 1-50 | 64% | chapter.verse |
  | 3-baruch | 13 | (none) | n/a | chapter.verse |
  | 4-ezra | 120 | 1-132 | 91% | chapter.verse |
  | psalms-solomon | 35 | 1-46 | 76% | per-Psalm verses |
  | 4-maccabees | 21 | 2-25 | 88% | chapter.verse |
  | pirke-aboth | 15 | 1-29 | 52% | chapter.verse |
  | ahikar | 51 | 1-33 | 155% | parallel columns (Syr A / Syr B / Arabic / Armenian / Eth / Greek) inflate counts |
  | zadokite-fragments | 43 | 1-53 | 81% | chapter.verse |

  **Discovery (session 21, queued for session 22 as the next wheel):** Each book has its OWN verse-marker convention. The session-20 pilot validated the parser ONLY against Aristeas's flat monotonic §-section sequence. The other 14 books use chapter.verse numbering (most), Roman-numeral chapter markers mid-line (Adam-Eve), parenthesized line-numbers (Sibylline), or parallel-column manuscript apparatus (Ahikar). The current `_normalize_to_verse_lines` assumes a single global monotonic sequence, which silently merges most verses on chapter boundaries and entirely misses the parenthesized line-number convention. The wheel for session 22: **per-book convention detection + chapter-aware extraction**. Approach: parse the page header's chapter prefix (e.g., "1. 4-7" → chapter=1, v_lo=4, v_hi=7) to track which chapter each page belongs to, and reset the verse counter on chapter boundaries; emit `# Chapter N` markers between chapters so the structural parser can walk them. Sibylline needs a parenthesized-line-number mode (`(N)`-tokens inline). Ahikar needs special parallel-column handling (likely take Syriac A as primary, drop other-column text — a content-authority call for Yoshi).

  **Pilot extraction file preserved** at `aristeas.md` / `aristeas-restored.md` (sub-set of the batch output; idempotent against the new restore.py-3 pipeline). Full-batch raw + restored files at `charles-pseudepigrapha.txt` and `charles-pseudepigrapha-restored.txt` in this folder.

  **Bensly inline-patch into apocrypha 2 Esdras 7 (W-3b) — DEFERRED to session 22.** The patch lifts Charles vol 2 4 Ezra ch 7 verses 36-105 (the Bensly fragment) and slots them into the existing apocrypha 2 Esdras chapter 7 between v35 and the existing v36, renumbering the existing v36-70 to v106-140. This requires clean chapter-aware extraction of 4 Ezra ch 7 — which the session-22 parser wheel produces. Deferring keeps the patch operating on a clean source. The Bensly verses ARE present in the session-21 raw extraction (4-ezra block, 91% coverage), but the chapter-7 boundary isn't structurally identified without the chapter-aware parser.

  **Structural parser (`parse_pseudepigrapha_edition.py`) — DEFERRED to session 22.** Blocked by the chapter-aware extraction wheel.

  **Seed.py wire-up (`pseudepigrapha` edition profile + new `pseudepigrapha` witness_category) — DEFERRED to session 22.** Blocked by the structural parser.

  **Pipeline gates at session-21 close (UNCHANGED from session 20).** `restore.py --self-test` 83/83 PASS. `yoshi_overrides.py` 34/1 PASS. `seed.py --dry-run` 6 editions / 113 books / 1984 chapters / 45,342 verses (Charles vol 2 not yet wired pending session-22 work).

- **Session 20 (2026-05-11):** Boundary file built. Three content-authority calls landed (Jubilees HOLD, 1 Enoch HOLD, 4 Ezra INLINE+PARALLEL). Edition slug + granularity locked. Apparatus-drop and framework-lens disciplines carried forward from session 18.

  **Pilot extraction landed: Letter of Aristeas (PDF pp. 114-142, printed pp. 93-122).** Parser pair file: `restoration-pipeline/parse_charles_pseudepigrapha.py`. Output: `source-texts/pseudepigrapha-charles-vol2/aristeas.md` (raw, 224 verses) and `aristeas-restored.md` (after `restore.py`, idempotent: 116 × `Elohim (God)`, 17 × `Yahudim (Jews)`, 14 × `Yahudi (Jewish)`, 2 × `Yahusha (Jesus)`). End-to-end architecture validated: page-header strip + footnote-anchor strip + line-start verse normalization + restore.py + idempotency. Boundary detection rule discovered and locked: **Charles's footnotes anchor on `^\d+\.\s+<word>` (digit-period-space) while body verses use `^\d+\s+<word>` (digit-space — no period).** Once a footnote-anchor line appears on a page, everything from that line to end-of-page is footnote material and is dropped. This rule is calibrated on Aristeas but should generalize to the other 14 books with the same Andrews-style §-section convention; books with internal `N.` chapter-period numbering (some chapters of Sibylline / 2 Enoch / 4 Ezra) may need per-book adjustment.

  **Known limitations in the pilot, queued for session-21 hardening:**

  (a) **OCR drops or mangles 3-digit verse markers.** `103` shows up as `03` (leading digit dropped); `161` shows up as `16]` (final digit converted to bracket); the OCR also occasionally loses an entire verse number, leaving the verse body fused to the preceding verse. The pilot parser handles the bracket-corrupted form with a `[\]\)\}]?` tail-match and snaps "missing-hundreds" candidates (cand < expected by exactly 100) to the expected number. Tolerance widened from +5 to +20 to ride over OCR-lost markers. Result: 224 of ~322 verses recovered (~70%). The remaining ~100 are silently merged into adjacent verses. Session-21 hardening: correlate the page-header verse-range (e.g., `112-124` in the running header before strip) with expected per-page verse counts to detect lost markers more aggressively.

  (b) **Inline OCR artifacts in body text** — pipe characters (`|`), backslashes (`\`), stray underscores (`__`) from italic/bold rendering, marginal-glyph drift, footnote-marker remnants. These end up in the verse body unmodified (e.g., aristeas-restored.md verse 4: *"This embassy then I undertook with | enthusiasm"*). Session-21 hardening: a small cleanup pass that strips standalone `|`, `\`, `__` characters and isolated single-character residues at word boundaries.

  (c) **2 × `Yahusha (Jesus)` restorations in Aristeas — flag for parse-time review.** Aristeas is pre-Christian (3rd c. BC to early 1st c. AD); the body should not name Yahusha (Jesus). Three possibilities to check at session 21 open: (i) the restorations are legitimate references to Yeshua / Joshua / Jesus son of Sirach in a passage Aristeas mentions; (ii) the restorations are an OCR artifact where a different word got mangled into `Jesus`; (iii) `restore.py`'s pattern is over-matching. Run `grep -n "Yahusha" aristeas-restored.md` to locate both occurrences and read the surrounding context.

  (d) **Per-book body-page boundary calibration deferred.** The BOOKS table in `parse_charles_pseudepigrapha.py` has Aristeas locked (114-142, verified). The other 14 books' `body_start_pdf_page` and `body_end_pdf_page` are preliminary estimates from manifest math (printed-page → PDF-page with +20 offset). Each must be CALIBRATED by scouting the actual PDF page where the body §1 begins (translator-introduction pages must be excluded). Session-21 first move: scout all 14 remaining books and lock their body-page ranges.

  Status: pilot validated, batch deferred. Section X of `BIBLE_APP_ROADMAP.md` carries the session-20 entry. Section XI of the roadmap carries the session-21 handoff prompt.

- **Session 22 (2026-05-11):** Chapter-aware extraction (W-2 hardening) landed. Per-book convention dispatch added to `parse_charles_pseudepigrapha.py`; each book now routes to one of six convention handlers (`flat`, `chapter-verse-hdr`, `sibylline-paren`, `adam-eve-roman`, `testaments-named`, `ahikar-syriac`). Output now emits `# Chapter N` (or `# Name Chapter N`) markers between chapters; downstream structural parser (W-3, deferred) can walk them cleanly. `restore.py --self-test` 83/83 PASS; idempotency PASS on the new restored output.

  **Yoshi's session-22 content-authority calls** (Decisions §9–§12 above): Ahikar = Syriac A primary; Testaments = per-Testament named chapters; Adam-Eve = two chapter ranges with prefixed labels; Sibylline = printed Book → chapter mapping. All LOCKED.

  **Parser additions this session:**
  - `BOOK_CONVENTION` dispatch table mapping each of the 15 books to a convention name.
  - `_capture_header_chapter_verse(line)` — extends session-21's `_capture_header_verse_range` to ALSO capture the chapter prefix from page-header lines like `IV EZRA 8. 1-18` (single-chapter) and `IV EZRA 3. 35—4. 7` (multi-chapter). Includes a backward-span fix: if a captured multi-range has `ch_lo > ch_hi` (impossible — chapter ranges only increase), `ch_lo` is OCR-corrupted; we substitute `ch_hi - 1` since the typical multi-chapter page span is 1-2 chapters. Handles the `IV EZRA 8. 35—4. 7` → `(3, 35, 4, 7)` correction directly.
  - `_smooth_chapter_drift(chapters)` — forward-monotonic-by-+3 smoother with min-window initial seed (defends against first-page OCR drift up; the briefing's classic `IV EZRA 8. 1-18` where 8 should be 3) and rejected-run consensus-drift recovery (after 3 adjacent pages all systematically detect an OFF-by-+N value, retroactively promote them to the next chapter — handles 4-Ezra's mangled-13-as-18 systematic drift).
  - `_detect_page_chapter_range(page_text)` — returns `(ch_lo, ch_hi)` for chapter span on the page, used to split multi-chapter pages by body verse-drop.
  - `_split_page_body_by_verse_drop(body_text)` — splits a single page's body into chunks at verse-number-drop boundaries (verse number ≥ 4 followed by verse number ≤ 3 = chapter break within the page).
  - `_extract_chapter_verse_hdr_book(pages)` — full chapter-aware extractor for the standard convention; uses chapter range from header + multi-chapter page splitting + the existing flat-monotonic `_normalize_to_verse_lines` per chapter.
  - `_extract_sibylline_book(pages)` — parses parenthesized inline `(N)` markers as verses; groups pages by printed Sibylline Book/Fragment from header (`Βοοκ III, Lines 634-696` and Greek-drift variants); emits `# Chapter Book III` etc.
  - `_extract_adam_eve_book(pages)` — scans for Roman-numeral chapter markers (`\b[ivxl]{1,5}\.\s+\d{1,3}`); splits at the first chapter-restart point (high-chapter followed by low-chapter ≤ 3) into Apoc. Moses then Vita Adae manuscript runs; emits chapters under each label.
  - `_extract_testaments_book(pages)` — detects each `THE TESTAMENT OF <NAME>` title-header line; groups pages by Testament; within each Testament uses `_split_body_into_chapters_by_verse_drop` for sub-chapters; emits `# Reuben Chapter 1`, `# Reuben Chapter 2`, …, `# Benjamin Chapter N`.
  - `_extract_ahikar_syriac_book(pages)` — state-machine over column labels (`Syr. A`, `SYRIAC`, `ARABIC VERSION`, `ARMENIAN`, etc.); keeps only Syriac-column content; chapter detected from page header `STORY OF AHIKAR <CH>. <V>`.
  - `_extract_flat_book(pages)` — preserves the session-21 behavior for the two flat books (Aristeas, Pirké Aboth — both per W-3 spec one-synthetic-chapter).

  **Per-book results: verses recovered (session 22) vs session 21, with chapter count emerging:**

  | Book | S21 v | S22 v | S22 ch | Convention | Notes |
  |---|---|---|---|---|---|
  | aristeas | 224 | 224 | 0 (flat) | flat | unchanged ✓ |
  | adam-eve | 8 | 21 | 16 | adam-eve-roman | manuscript split working (Apoc. Moses 4-36 + Vita Adae 1, 49); verse 1 of many chapters still merged into prev chapter (OCR Roman-numeral mangle leaves verse-1 markers unrecovered); follow-up needed |
  | martyrdom-isaiah | 3 | 19 | 4 | chapter-verse-hdr | 4 of 5 canonical chapters emerging |
  | testaments-xii | 27 | **623** | **110** | testaments-named | all 12 Testaments extracted (Reuben → Benjamin); Judah Testament shows 0 chapters — the title line for Judah is OCR-mangled past detector (follow-up regex extension needed); Naphtali over-detects at 21 chs (verse-drop false positives); overall a >2200% verse-count gain |
  | sibylline | 0 | 272 | 4 | sibylline-paren | recovered from ZERO; Fragment III + Books III, IV, V emerging; parenthesized inline markers preserved as scholarly-citation verse indices |
  | assumption-moses | 8 | 44 | 10 | chapter-verse-hdr | 10 of 12 canonical chapters emerging |
  | 2-enoch | 8 | 22 | 3 | chapter-verse-hdr | **fast-book undercount**: 2 Enoch has 73 chapters in Charles; forward-monotonic-by-3 smoother is too restrictive for chapter-fast books; session-23 work to add adaptive smoother for fast-tick books (see Limitations below) |
  | 2-baruch | 32 | 54 | 6 | chapter-verse-hdr | **fast-book undercount**: 2 Baruch has 87 chapters; same forward-monotonic limitation as 2-enoch |
  | 3-baruch | 13 | 64 | 10 | chapter-verse-hdr | 10 of 17 canonical chapters emerging |
  | 4-ezra | 120 | **454** | **12** | chapter-verse-hdr | **best result**: chapters 3-14 emerging cleanly (Box's 4-Ezra-proper canonical range); first/last verse spot-check matches Charles's published text; this is the source for W-3b Bensly inline-patch |
  | psalms-solomon | 35 | 172 | 16 | chapter-verse-hdr | 16 of 18 psalms emerging (Psalms 1 missed at book opening — running header on first page lacks chapter info) |
  | 4-maccabees | 21 | 99 | 9 | chapter-verse-hdr | 9 of 18 canonical chapters; fast-tick limitation milder than 2-baruch / 2-enoch |
  | pirke-aboth | 15 | 15 (now 41 in restored) | 0 (flat) | flat | per W-3 spec — one synthetic chapter, sections-as-verses |
  | ahikar | 51 | 83 | 9 | ahikar-syriac | Syriac-only filter working; verse-count down from 51 inflated mixed-stream to 83 Syriac-only verses across 9 chapters (matches expected Syriac A chapter range 1-8 + closing) |
  | zadokite-fragments | 43 | 118 | 14 | chapter-verse-hdr | 14 of ~20 canonical sections emerging |
  | **TOTAL** | **608** | **2284** | **223** | | **+276% verse recovery + chapter signal emerged where previously absent** |

  **Sacred-name stamp counts in `charles-pseudepigrapha-restored.txt`** (idempotent against `restore.py`-3 pipeline): 432 × `Elohim (God)` (was 183 in session 21); 119 × `Yashar'el (Israel)` (was 57); 80 × `Yahudah (Judah)` (was 24); 21 × `Yahudi (Jewish)`; 17 × `Yahudim (Jews)`; 4 × `Ruach HaKodesh (Holy Spirit)`; 3 × `Yahusha (Jesus)`; 3 × `Messiah (Christ)`; 2 × `Yahuah (God)`; 2 × `Yahudi (Jew)`; 2 × `son of Adam`; 1 × `Son of Adam`. Red Line #12 firing across the corpus.

  **Limitations known at session-22 close (queued for follow-up):**

  (e) **Fast-tick chapter books undercount: 2-Baruch (54 of ~330 expected verses; 6 of 87 chapters), 2-Enoch (22 of ~210 expected; 3 of 73 chapters), 4-Maccabees (9 of 18 chapters), 3-Baruch (10 of 17 chapters).** The forward-monotonic-by-+3 smoother is too restrictive for books where chapters tick more than once per page; consecutive page-header readings like `5 → 15 → 24 → 89` (per-page chapter jumps of +5 to +10 from systematic OCR drift) all get rejected. Session-23 work: adaptive smoother based on detected `span(max_ch - min_ch) / page_count` — books with ratio ≥ 0.8 are "fast-tick" and should bypass the forward-monotonic guard, relying on raw header chapter (with backward-span fix) + isolated-spike rejection only.

  (f) **First-verse-of-chapter often merged into previous chapter.** The `_split_page_body_by_verse_drop` helper detects chapter-break BY finding `verse number ≥ 4` followed by `verse number ≤ 3`. The verse-1 line at chapter start is typically the very first line of new content, with the prior chapter's text ending mid-paragraph (no terminal punctuation cue). When the OCR fails to recover the marginal "1" verse marker, the body of verse 1 fuses to the previous chapter's last verse. Follow-up: cross-reference page-header verse range (`8. 1-15` says verse 1 IS on the page) with body's first detected verse number on the page; if header says v_lo=1 but body's first marker is v=2 or higher, search backward in body for content that should be verse 1.

  (g) **Adam-Eve manuscript attribution is heuristic.** The split between Apoc. Moses and Vita Adae uses a single rule: first high-chapter (≥ 10) followed by low-chapter (≤ 3) triggers the transition. The PDF's parallel-text layout interleaves the two manuscripts on some pages, which the OCR flattens into a mixed stream; perfect attribution requires per-page running-header analysis (Charles vol 2 uses `ViTA ADAE ET EVAE` vs `THE BOOKS OF ADAM AND EVE` headers ambiguously). Result: session 22 emits manuscript-prefixed chapters cleanly only for the non-interleaved sections; the parallel-text pages may have content attributed to one manuscript that's actually from the other. Follow-up: more nuanced detection using running-header signal + content-keyword cues.

  (h) **Testaments-XII: Judah Testament missing (0 chapters detected).** The `THE TESTAMENT OF JUDAH` title-line is being missed by the regex — likely the OCR mangled `JUDAH` into a non-ASCII form (e.g., `JUDAR` or with Greek drift). Follow-up: extend the testament-name regex to accept common Greek-drift variants OR look for the body-content opener phrase ("THE COPY OF THE WORDS OF JUDAH" or similar).

  (i) **Naphtali over-detects 21 chapters (canonical 8).** False-positive chapter-breaks from verse-number drops that aren't real chapter boundaries — Naphtali's text has poetic sections where verse numbering naturally restarts. The verse-drop signal needs additional validation (e.g., require a 2+ line blank gap or a paragraph-break signal AT the drop position).

  **Output files at session-22 close**:
  - `charles-pseudepigrapha.txt` (1.12 MB; 15 books, chapter-aware) — fresh extraction
  - `charles-pseudepigrapha-restored.txt` (1.17 MB) — idempotent against `restore.py`-3
  - All 15 per-book `.md` files (raw extraction, individual pilots) preserved

  **Pipeline gates at session-22 close**: `restore.py --self-test` 83/83 PASS. `restore.py` idempotency PASS on new chapter-aware output. `seed.py --dry-run` UNCHANGED (still 6 editions / 113 books / 1984 chapters / 45,342 verses — Charles vol 2 wire-up is W-3 work, deferred per Yoshi's wheel sequence).

  **Next session (W-3 + W-3b queue):** Structural parser `parse_pseudepigrapha_edition.py` walks the new `# Chapter N` markers; `seed.py` adds `pseudepigrapha` witness_category + edition profile (slug `pseudepigrapha`, public-domain base "Charles 1913 vol 2", `tier_required=extras`, `sort_offset=500`, `pipeline_version=phase4-v2`); Bensly fragment inline-patch lifts 4 Ezra ch 7 verses 36-105 into apocrypha 2 Esdras chapter 7 between v35 and current v36, renumbering existing v36-70 → v106-140.
