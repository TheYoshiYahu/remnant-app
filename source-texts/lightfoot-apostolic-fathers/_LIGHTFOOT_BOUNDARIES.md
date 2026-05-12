# Lightfoot, *The Apostolic Fathers* — Edition Boundary Map (skeleton, NOT YET EXTRACTED)

**Built session 29, 2026-05-12 — DEFERRED status.** The local PDF (`~/Downloads/lightfoot-apostolic-fathers.pdf`, 31 MB, archive.org/apostolicfathers0101clem) was discovered this session to be Lightfoot's **analytical Clement volume (Part I Vol. 1: S. CLEMENT OF ROME — Volume I)**, NOT the body-text translations of the 15 Apostolic Fathers entries. Sample pages 350/400/450/500 carry `EARLY ROMAN SUCCESSION`, `THE LETTER TO THE CORINTHIANS`, `THE CONSTANTINOPLE MANUSCRIPT`, `INDEX` headers — all critical-apparatus content discussing 1 Clement's transmission, not 1 Clement's body text.

For Lightfoot body-text extraction we need either:
- **(a) Different PDF volumes** — Part I Vol. 2 (Clement: text + translation) + Part II Vol. 1-3 (Ignatius / Polycarp: text + translation). These weren't in the session-16 `download-sources.sh` manifest. Could be added via archive.org/details/apostolicfather*.
- **(b) CCEL per-book HTML** — session-28's path-FAST recommendation. URLs: `ccel.org/ccel/lightfoot/fathers/fathers.toc.html` + 15 sub-pages `fathers.ii.<roman>.html` (i..xv). CCEL is network-allowlist-blocked from the sandbox but **Chrome-bridge-fetchable** (verified session 29 against wikisource.org and earlychristianwritings.com).

**Session-30 plan: option (b).** Chrome navigate to the CCEL TOC, fetch each of the 15 per-book URLs, strip CCEL nav chrome, parse the `## BookAbbr. N` marker pattern (verified clean on Didache p12 in session-28 scout). Edition slug `lightfoot-apostolic-fathers`, sort_offset=650, witness_category=`apostolic-fathers` (new enum value — Yoshi confirmed in session-28 prompt). Expected: 15 books, ~600-900 paragraph-verses.

## 15 Apostolic Fathers entries expected (per session-28 scout)

The CCEL volume covers Lightfoot's J.B. Lightfoot, J.R. Harmer's edition (1891):
1. Epistle of Barnabas
2. 1 Clement (Letter to the Corinthians)
3. 2 Clement (homily, traditionally grouped)
4. Didache (Teaching of the Twelve Apostles)
5. Shepherd of Hermas
6. Martyrdom of Polycarp
7. Polycarp to the Philippians
8. Ignatius to the Ephesians
9. Ignatius to the Magnesians
10. Ignatius to the Trallians
11. Ignatius to the Romans
12. Ignatius to the Philadelphians
13. Ignatius to the Smyrnaeans
14. Ignatius to Polycarp
15. Diognetus (Epistle to Diognetus)

Papias's fragments are NOT in CCEL Lightfoot's per-book volume — defer or fall back to earlychristianwritings.com `pt1vol2` per session-28 scout.

## Path-FAST viability (session 28 scout, session 29 re-confirmed)

- **CCEL** — session-28 verified clean parser-ready HTML with `## BookAbbr. N` markers.
- **Chrome bridge** — session-29 verified working for related hosts (wikisource.org returned full TOC; earlychristianwritings.com returned full Apocalypse of Peter MRJ translation HTML). Tab navigation + `get_page_text` / `javascript_exec` pattern is the canonical remote-fetch mechanism.

## Pipeline plan for session 30

1. **Chrome scrape** — 16 navigations (1 TOC + 15 per-book). Estimated 5-10 min wall time.
2. **Local cache** — save each fetched HTML to `~/Desktop/App/source-texts/lightfoot-apostolic-fathers/cache/<roman>.html` for offline re-runs.
3. **Parse** — write `parse_lightfoot_apostolic_fathers.py` with new `chapter-abbr-hdr` convention detecting `## BookAbbr. N` markers. Strip CCEL nav chrome (header/footer/sidebar). Flatten any HTML tables (Lightfoot has liturgical-quote tables in 1 Clement).
4. **Emit** verse-line shape (`N.  text`) matching all other W-2 editions.
5. **restore.py** + idempotency.
6. **Structural parser** (`parse_lightfoot_apostolic_fathers_edition.py`) modeled on `parse_apocrypha_charles_vol1_edition.py` / `parse_mrjames_apocryphal_nt_edition.py`.
7. **seed.py wire-up** — edition profile + JSON file map.
8. **Pipeline gates × 5.**
9. **Boundary file close-out** — replace this skeleton.

Estimated session-30 effort: ~60 min (well-known small-corpus, CCEL has clean structure, Chrome bridge proven).

## Session log
- Session 28 (2026-05-12): Path-FAST scout LANDED. CCEL identified as clean source. `_LIGHTFOOT_PRE_A_SCOUT.md` saved.
- Session 29 (2026-05-12): Wrong-PDF-on-disk discovery. Pipeline DEFERRED to session 30 with Chrome-bridge plan.
- Session 30 (2026-05-12): Chrome-bridge fetch LANDED in browser, transport FAILED, pivoted to local-PDF path.
  - **Chrome scrape:** all 15 CCEL URLs `fathers.ii.<roman>.html` (i..xv) fetched into `window.__lightfoot` (~484 KB total raw text across the 15 books). Per-book sizes (KB): 1-clement 74, 2-clement 22, ignatius-ephesians 14, magnesians 9, trallians 8, romans 9, philadelphians 8, smyrnaeans 9, polycarp 6, polycarp-philippians 12, martyrdom-polycarp 21, didache 16, barnabas 51, hermas 204, diognetus 21.
  - **Parsing:** 13 of 15 books parse cleanly with `BookAbbr. N` regex (1 Clem./2 Clem./IgnEph./IgnMagn./IgnTrall./IgnRom./IgnPhld./IgnSmyrn./IgnPol./PolPhil./MartPol./Barn.). Three need regex updates: Didache uses bare `Didache N` (probably needs `Did. N` variant or just numbered sections), Hermas uses 3-tier `Herm.Vis./Herm.Mand./Herm.Sim. N`, Diognetus uses `Diog. N` (confirmed working but parser captured only 1 verse — needs investigation). Parsed text shape: per-book single chapter, Prologue mapped to verse 1, then sequential.
  - **Transport block:** Chrome auto-downloads worked for the first file (lightfoot-1-clement.txt landed at 73,863 bytes) but silently blocked subsequent downloads. Tool-return chunking failed because the LLM-side context truncates JS-tool returns at ~1,000 chars (verified by writing a 5,000-char chunk via Write and getting only the first ~1,000 chars).
  - **Pivot:** discovered that the local PDF `~/Downloads/lightfoot-apostolic-fathers.pdf` (31 MB) is the WRONG volume — it's Lightfoot's analytical Clement Vol. I (essays only). User deleted that PDF and is acquiring the correct 1891 Lightfoot+Harmer single-volume edition from `archive.org/details/apostolicfathers00ligh`. CCEL's hosted edition IS the 1891 Lightfoot+Harmer (CCEL mis-labels author as "John Lightfoot"), so the body translations from the new PDF will match the data we already parsed in the browser.
  - **Next-session plan:** use the new PDF with a pure-PyPDF extractor modeled on `parse_mrjames_apocryphal_nt.py`. Skip Chrome entirely. Wire `chapter-abbr-hdr` convention with the 13 known `BookAbbr. N` patterns (extend for Hermas 3-tier and Didache as found). Restore + structural + seed-py + gates × 5 unchanged.
  - **Files written this session:** none. `parse_lightfoot_apostolic_fathers.py` NOT written. `cache/` directory created but empty. Re-create with PDF-derived content next session.

- Session 30 LATE (2026-05-12, post-pivot): **LIGHTFOOT EDITION LANDED**.

  After deleting the wrong-volume PDF and pivoting away from Chrome, the user
  downloaded archive.org's full-text page for apostolicfathers00ligh as HTML
  (1.46 MB, file path `~/Downloads/Full text of "The apostolic fathers ..".html`).
  The HTML wraps the entire OCR text in a single 1.28 MB `<pre>` block —
  Lightfoot+Harmer 1891 (CCEL's hosted "John Lightfoot" edition is the same
  source). All 17 books verified present (1 Clement, 2 Clement, 7 Ignatius
  letters, Polycarp to Philippians, Martyrdom of Polycarp, Didache, Barnabas,
  Hermas, Diognetus, Papias fragments, Reliques of the Elders).

  **Built end-to-end pipeline:**

  - `restoration-pipeline/parse_lightfoot_apostolic_fathers.py` — HTML loader
    + `<pre>` extractor + per-book body-prologue regex anchors + page-noise
    strip (running heads, isolated page numbers, drop-cap title chrome) +
    section-marker parser (`^\d+\.\s+` flat per book).
  - `restoration-pipeline/parse_lightfoot_apostolic_fathers_edition.py` —
    structural parser modeled on `parse_mrjames_apocryphal_nt_edition.py`.
  - `api/seed.py` — new EDITION_PROFILES entry `lightfoot-apostolic-fathers`
    (sort_offset=650, witness_category=`apostolic-fathers`, tier_required=
    `extras`, pipeline_version=`phase4-v2`) + JSON_FILE_FOR_EDITION mapping.

  **OCR-drift workaround:** The print-shop drop-caps on each book's opening
  letter render badly in OCR (e.g. "THE EPISTLE OF S. CLEMENT" → "fee Se
  PIStee OF Ss. CLEMENT"), so title-page anchoring failed. Pivoted to anchoring
  on body-prologue substrings — phrases like "Church of God which sojourneth
  in Rome" (1 Clement), "church which is in Ephesus" (Ignatius Eph), "INCE I
  see, most excellent Diognetus" (Diognetus, drop-cap S lost), and "master,
  who reared me, had sold me to one Rhoda" (Hermas, drop-cap T lost). All 17
  books detected by these anchors.

  **Per-book outcome (extraction → structural):**

  | Book | Ext verses | Struct verses |
  |------|------------|---------------|
  | 1-clement                 | 20 | 14 |
  | 2-clement                 | 17 | 17 |
  | ignatius-ephesians        | 20 | 20 |
  | ignatius-magnesians       | 13 | 13 |
  | ignatius-trallians        | 12 | 12 |
  | ignatius-romans           |  8 |  8 |
  | ignatius-philadelphians   |  8 |  8 |
  | ignatius-smyrnaeans       | 11 | 11 |
  | ignatius-polycarp         | 13 |  9 |
  | polycarp-philippians      | 12 | 12 |
  | martyrdom-polycarp        | 22 | 20 |
  | didache                   | 17 | 17 |
  | barnabas                  | 23 | 19 |
  | hermas                    | 47 | 29 |
  | diognetus                 | 11 | 11 |
  | fragments-papias          |  0 |  0 |
  | reliques-elders           |  9 |  8 |
  | **TOTAL**                 | **263** | **228** |

  **Final landed:** 17 books / 17 chapters / 228 verses.

  **Residuals for session 31 (parked):**

  - **1 Clement loss (20 → 14):** structural-parser monotonic filter drops 6
    sections. Likely a stray verse-marker drift in 1 Clement (e.g. an OCR'd
    `100.` or footnote anchor). Investigate and either filter at extraction
    or relax the monotonic gate.
  - **Hermas loss (47 → 29):** same monotonic-filter issue, larger. Hermas
    uses Vision/Mandate/Similitude sub-divisions which each restart at 1, so
    the flat-monotonic filter aggressively prunes. Should treat Hermas as
    multi-chapter (Vis 1-5 / Mand 1-12 / Sim 1-10) instead of flat.
  - **Fragments of Papias 0/0:** the body-prologue anchor `FRAGMENTS OF
    PAPIAS` matches a header line but the BODY consists of Greek-glyph
    Roman-numeral-anchored fragments that current parser doesn't see as
    `^\d+\.\s+` markers. Needs Roman-numeral parsing (i, ii, iii ...) and
    Greek-glyph-tolerant section bodies.
  - **Reliques 9 → 8:** small loss, likely one-off marker drift. Low priority.
  - **Body-prologue anchor for Reliques** matches at line 28883 (only 11 lines
    past the Papias header at line 28872). This is because the Reliques anchor
    `RELIQUES OF THE ELDERS` matches a stray reference WITHIN the Papias body,
    not the Reliques body. Result: Papias range is 11 lines (too small) while
    Reliques range absorbs ~3500 lines including most of Papias. Fix: tighten
    Reliques anchor to a body-prologue substring like "These are the words of
    the Elder which Irenaeus quoteth" (or similar) rather than the section
    title.

  Files written:
  - `restoration-pipeline/parse_lightfoot_apostolic_fathers.py` (NEW, ~280 lines)
  - `restoration-pipeline/parse_lightfoot_apostolic_fathers_edition.py` (NEW, ~155 lines)
  - `source-texts/lightfoot-apostolic-fathers/lightfoot-apostolic-fathers.txt` (NEW, 364 lines)
  - `source-texts/lightfoot-apostolic-fathers/lightfoot-apostolic-fathers-restored.txt` (NEW, 363 lines)
  - `source-texts/parsed/lightfoot-apostolic-fathers.json` (NEW, 17/17/228)
  - `api/seed.py` — added EDITION_PROFILES + JSON_FILE_FOR_EDITION entries.

- Session 31 (2026-05-12): **LIGHTFOOT RESIDUALS LANDED** (+134 verses).

  All four session-30 residuals fixed in one pass. Structural-gate output
  rose 228 → 362 (+134 v, +59%), well above the expected +60-110 envelope.

  **Per-book delta (session-30 baseline → session-31 final):**

  | Book | s30 | s31 | Δ |
  |------|-----|-----|---|
  | 1-clement                 | 14 |  59 | +45 |
  | 2-clement                 | 17 |  17 |  0  |
  | ignatius-ephesians        | 20 |  20 |  0  |
  | ignatius-magnesians       | 13 |  13 |  0  |
  | ignatius-trallians        | 12 |  12 |  0  |
  | ignatius-romans           |  8 |   8 |  0  |
  | ignatius-philadelphians   |  8 |   8 |  0  |
  | ignatius-smyrnaeans       | 11 |  11 |  0  |
  | ignatius-polycarp         |  9 |   9 |  0  |
  | polycarp-philippians      | 12 |  12 |  0  |
  | martyrdom-polycarp        | 20 |  20 |  0  |
  | didache                   | 17 |  17 |  0  |
  | barnabas                  | 19 |  19 |  0  |
  | hermas                    | 29 |  94 | +65 |
  | diognetus                 | 11 |  11 |  0  |
  | fragments-papias          |  0 |  14 | +14 |
  | reliques-elders           |  8 |  18 | +10 |
  | **TOTAL**                 | **228** | **362** | **+134** |

  **Final landed:** 17 books / 40 chapters / 362 verses.

  **Changes (parse_lightfoot_apostolic_fathers.py):**

  - BOOKS table extended with `parser_kind` field (`flat` /
    `hermas-multi-tier` / `roman-fragments`).
  - Reliques anchor: `\bRELIQUES\s+OF\s+THE\s+ELDERS\b` (case-insensitive,
    matched the stray "Reliques of the Elders" reference inside the
    Papias prologue at line 28889 causing range inversion) →
    `\bPRESERVED\s+IN\s+IREN[AEÆ]+US\b` (case-insensitive; only matches
    TOC — skipped via TOC_END_LINE — and the Reliques title-page line
    30026). Papias and Reliques line-ranges now correctly disjoint.
  - Papias anchor: `\bFRAGMENTS\s+OF\s+PAPIAS\b` (matched a running-
    head-shaped line followed by Greek glyphs) → `\bfollowing\s+extracts
    \s+contain\s+not\s+only\s+the\s+fragments\s+of\s+Papias\b` (matches
    the editorial prologue at line 28878, unique in the document).
  - New `_parse_hermas()` parser — Vis 1-5 / Mand 1-12 / Sim 1-10 chapter
    dividers with explicit regex per known marker (`VISION I`, `VISION 2`,
    `[VisIon 4.]`, `REVELATION 5`, `MANDATE THE FIRST`..`TWELFTH`,
    `PARABLES WHICH HE SPAKE WITH ME` for Sim 1, `ANOTHER PARABLE` ×4
    for Sim 2-5, `PARABLE THE TENTH` for Sim 10). Plus section-reset
    fallback for Sim 6-9 which lack explicit body headers. Plus
    free-body promotion to verse 1 when a chapter has no numbered
    sections (Mandates 1-3, Sim 1-2 are single-paragraph chapters in
    Lightfoot's translation).
  - New `_parse_roman_fragments()` parser — Roman-numeral fragment
    markers (`i, ii, iii, ...`) with OCR tolerance (`l`↔`I`, comma↔
    period). Greek-glyph bodies preserved as-is. Sequential 1-based
    output regardless of OCR'd Roman value (handles `Vill.` → `VIII`
    OCR errors gracefully).
  - New running-head strip patterns: `^\d+\.\s*S\.\s+CLEMENT\s+OF\s+ROME$`
    et al — the stray `64. S. CLEMENT OF ROME` running head at OCR line
    4116 was the 1 Clement 20→14 drift driver. With it stripped, 1 Clem
    extracts cleanly 1, 2, 3, 4, 6, 7, 8, 11, 12, 14, ..., 65 (no jump-
    backs). Also added `^[VMS]\.?\s*\d+\.\s*[ivxlcdmIVXLCDM]+\s*\]` for
    Hermas in-body running heads (`S. 6. iii] THE SHEPHERD ...`).

  **Residuals (low priority, parked):**

  - **Hermas Sim 7, 8, 9** missing as separate chapter entries. The
    Lightfoot translation has Sim 7 as a very short single-paragraph
    chapter and Sim 8/9 as long multi-section chapters; the section-
    reset heuristic detected only one chapter break between Sim 6 and
    Sim 10 (giving Sim 6 → Sim 10 directly). Their content is captured
    under adjacent chapters. Verse content not lost — only chapter
    attribution. Fix path: use running-head transitions (`S. N. roman]`
    → `S. N+1. roman]`) as chapter dividers. Park: ~10 min, low yield.
  - **Hermas 115 → 94 in-chapter prune (21 verses).** Some chapters
    have stray markers from sub-section numbering inside Lightfoot's
    long similitudes; the structural monotonic gate prunes them. Park
    to session-32 if needed.
