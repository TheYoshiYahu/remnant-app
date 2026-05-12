# M.R. James, *The Apocryphal New Testament* (1924) — Path-FAST scout

**Session 28, 2026-05-12.** Source: M. R. James, ed./tr., *The Apocryphal New Testament, being the apocryphal Gospels, Acts, Epistles, and Apocalypses, with other narratives and fragments newly translated* (Oxford: Clarendon Press, 1924). Public domain (1924 publication, US PD by date; UK PD via 70-year-post-author-death = James d. 1936 → PD since 2007).

## Conclusion: PATH-FAST IS VIABLE.

Two strong clean-text transcriptions exist; either can drive the parser. Pick one at session-29 open and write `parse_mrjames_apocryphal_nt.py` against the chosen source format.

## Candidate sources surveyed

| Source | URL pattern | Format | Coverage | Quality | Fetchability (this sandbox) |
|---|---|---|---|---|---|
| **Wikisource** | `https://en.wikisource.org/wiki/The_Apocryphal_New_Testament_(1924)/CATEGORY/BOOK` | structured per-book HTML | Confirmed: Infancy Gospels (Book of James, Pseudo-Matthew, ...), Apocalypses (Apocalypse of Peter, ...), Epistles (Paul & Seneca, Laodiceans, Christ & Abgarus, ...), Secondary Acts (Pseudo-Abdias, ...), Preface, more | Proofread by Wikisource volunteers (high) | `web_fetch` returned empty for the test URLs — likely a Wikisource API/UA filter. Workaround: use the bot-friendly `https://en.wikisource.org/wiki/Special:Export/...` or `/wiki/Page?action=raw` endpoints, or fetch via the Wikimedia REST API. Verify in implementation. |
| **earlychristianwritings.com** | `https://www.earlychristianwritings.com/text/<BOOKSLUG>-mrjames.html` | per-book HTML with M.R. James translation inline | Per-book pages confirmed (e.g., `apocalypsepeter-mrjames.html`). Site has an index for all of James's ANT books. | Clean transcription (this site is widely linked from the academic literature) | Confirmed fetchable (returned 70k chars for the Apocalypse-of-Peter page in this session). |
| Internet Archive plain text | `https://archive.org/stream/JAMESApocryphalNewTestament1924/JAMES_Apocryphal_New_Testament_1924_djvu.txt` | DJVU OCR plain text | Full book in one stream | Same tier as the Charles vol-1 DJVU OCR (Greek-glyph drift, headers mangled). | Should be fetchable. Path-OCR-equivalent, NOT path-FAST. |
| HathiTrust catalog | various | scan-only, partial access | n/a | n/a | Not viable for transcription. |
| Project Gutenberg | n/a | n/a | NO Project Gutenberg entry for James 1924. | n/a | n/a |
| Tertullian.org | n/a | n/a | Hosts some apocryphal texts but NOT a complete M.R. James 1924 transcription. | n/a | n/a |
| sacred-texts.com | n/a | n/a | Hosts William Hone's 1820 ANT (different, archaic work) — NOT M.R. James 1924. | n/a | n/a |

## Path decision — AskUserQuestion at session-29 open

Two viable candidates. Recommended order at session 29 open:

1. **Wikisource** (recommended) — structured per-book HTML, proofread by volunteer editors, machine-friendly URLs. Implementation needs to verify fetch path (use `?action=raw` or Wikimedia REST API to bypass the apparent default-fetch filter).
2. **earlychristianwritings.com** — proven fetchable, per-book pages, but custom HTML structure per page (variability across the 60+ entries) means more parser-side normalization.

Either source covers Charles's catalog of M.R. James ANT material. Estimated full extraction: 2-3 hours at session 29 if Wikisource fetch is resolved, or 3-4 hours via earlychristianwritings.com.

## Books expected in scope (from M.R. James 1924 TOC)

Per the article by R.A. Kraft (UPenn, 2004, fetched this session for reference): the 1924 ANT follows the four-fold structure Gospels / Acts / Epistles / Apocalypses. Subsections:

- **Gospels** — Infancy Gospels (Book of James/Protevangelium, Gospel of Pseudo-Matthew, Gospel of Thomas, Arabic Infancy Gospel, ...), Passion and Resurrection narratives (Gospel of Peter, Gospel of Nicodemus / Acts of Pilate), Sayings/Fragmentary Gospels (Gospel of the Hebrews, Gospel of the Ebionites, Egerton Papyrus, ...), Gospel of Mary, others
- **Acts** — Leucian Acts (John, Paul, Peter, Andrew, Thomas), Secondary Acts (Pseudo-Abdias material, individual martyrdom-acta)
- **Epistles** — Letters of Christ and Abgarus, Epistle to the Laodiceans, Correspondence of Paul and Seneca, ...
- **Apocalypses** — Apocalypse of Peter, Apocalypse of Paul, Apocalypse of Thomas, ...

Estimated total: 50-80 individual texts depending on lumping/splitting of the secondary/fragmentary material. Verse-equivalent total: hard to estimate without the TOC pull (some texts are short fragments, others are full narratives); rough projection 1,500-3,000 "verses" (Charles-style paragraph or §-section numbering) for the full edition.

## Followup-needed for session 29

1. Open Wikisource page via a fetch path that returns content (try `/wiki/Page?action=raw`).
2. Pull the full TOC from `/wiki/The_Apocryphal_New_Testament_(1924)` to enumerate every per-book page URL.
3. AskUserQuestion: Wikisource vs earlychristianwritings.com source choice (recommend Wikisource).
4. Write `parse_mrjames_apocryphal_nt.py` modeled on `parse_pseudepigrapha_edition.py` — fetch per-book HTML, strip navigation/footer, identify verse markers (M.R. James used numbered sections within each work), emit `# Chapter N` / `N. text` shape.
5. `restore.py` + idempotency, structural parser, seed.py wire-up, pipeline gates × 5.

Live DB stays on `1.0.0-phase4-session13`. W-7 HELD.

## Session log
- Session 28 (2026-05-12): vol1-q through vol1-u landed on Charles 1913 vol 1. Spent ~10 min on this scout. Path-FAST confirmed viable; full extraction queued for session 29.
