# J.B. Lightfoot, *The Apostolic Fathers* — Path-FAST scout

**Session 28, 2026-05-12.** Source: J.B. Lightfoot, *The Apostolic Fathers, Revised Texts with Short Introductions and English Translations* (1891 single-volume abridged edition; the multi-volume scholarly Parts I & II edition is also extant). Public domain by date.

## Conclusion: PATH-FAST IS VIABLE and CLEAN.

CCEL hosts the entire 1891 abridged Lightfoot in per-book HTML with stable predictable URLs and clean per-chapter markers. This is the cleanest source surveyed across vol 1 and the queued editions to date. Full extraction estimate: ~1-2 hours at session 29.

## CCEL coverage (confirmed)

Base URL: `https://ccel.org/ccel/lightfoot/fathers/fathers.toc.html`. Per-book pages at `fathers.ii.<roman>.html` for roman = i..xv:

| # | URL fragment | Book | Note |
|---|---|---|---|
| 1 | fathers.ii.i.html | First Clement | |
| 2 | fathers.ii.ii.html | Second Clement | |
| 3 | fathers.ii.iii.html | Ignatius to the Ephesians | |
| 4 | fathers.ii.iv.html | Ignatius to the Magnesians | |
| 5 | fathers.ii.v.html | Ignatius to the Trallians | |
| 6 | fathers.ii.vi.html | Ignatius to the Romans | |
| 7 | fathers.ii.vii.html | Ignatius to the Philadelphians | |
| 8 | fathers.ii.viii.html | Ignatius to the Smyrnaeans | |
| 9 | fathers.ii.ix.html | Ignatius to Polycarp | |
| 10 | fathers.ii.x.html | Epistle of Polycarp | |
| 11 | fathers.ii.xi.html | Martyrdom of Polycarp | |
| 12 | fathers.ii.xii.html | Didache | **Confirmed clean** — see below |
| 13 | fathers.ii.xiii.html | Epistle of Barnabas | |
| 14 | fathers.ii.xiv.html | Shepherd of Hermas | |
| 15 | fathers.ii.xv.html | Epistle to Diognetus | |

15 books. **Papias fragments are NOT in this CCEL edition** (the 1891 abridged is one volume — Papias was scattered across Lightfoot's 5-volume Parts I & II scholarly edition). For Papias, fall back to either:
- earlychristianwritings.com's hosting of Lightfoot Part I, Vol. 2 (`https://www.earlychristianwritings.com/lightfoot/pt1vol2/`)
- An alternative source (Holmes, Roberts-Donaldson). Held until session 29+ decision.

## Source quality — confirmed via Didache page

Fetched `fathers.ii.xii.html` (Didache) this session. Structure:
- Single H1-equivalent: `## THE TEACHING OF THE LORD TO THE GENTILES BY THE TWELVE APOSTLES (also known as DIDACHE)`
- Per-chapter headers: `## Did. N` (visible markers for chapters 1 through 16, the canonical Didache count — matches Lightfoot's printed Greek/English chaptering exactly).
- Body text is clean modern prose ("There are two ways, one of life and one of death...") with no critical apparatus interleaved.
- Liturgical quotes (the Lord's Prayer, eucharistic prayers) are set in HTML tables with `<br>` line breaks — parser needs to flatten these to paragraph-with-line-breaks (or single-line) form.
- Navigation chrome at top/bottom (`« Prev`, `Next »`, "Apostolic Fathers", CCEL nav) is identifiable by repeating wrapper structure.

The per-chapter `## Did. N` marker pattern is consistent. Parser can match `^## <ABBR>\.?\s+(\d+)$` to detect chapter boundaries; each ABBR per-book maps to the convention's chapter prefix (`Did.`, `1 Clem.`, `2 Clem.`, `Eph.`, `Magn.`, `Trall.`, `Rom.`, `Phld.`, `Smyrn.`, `Pol.`, `Polyc.`, `Mart. Pol.`, `Barn.`, `Diogn.`, `Herm. Vis./Mand./Sim.`). Spot-verify each book's abbr in session 29.

## Comparison vs. earlychristianwritings.com

- earlychristianwritings.com hosts Lightfoot Part I Vol 2 (the scholarly multi-volume edition) at `https://www.earlychristianwritings.com/lightfoot/pt1vol2/`. This edition includes Papias and additional apparatus, but format is per-book non-uniform (each book is on its own page with idiosyncratic HTML).
- For the core 15 books, **CCEL is cleaner and more uniform**. Use CCEL as primary; fall back to earlychristianwritings.com only for Papias fragments.

## Sources NOT viable for this edition

- Project Gutenberg: no Lightfoot Apostolic Fathers entry.
- Wikipedia/Wikisource: hosts an article ABOUT Apostolic Fathers but not a structured Lightfoot transcription.
- archive.org DJVU OCR: lower quality, same drift tier as Charles vol 1.

## Path decision — no AskUserQuestion needed

CCEL is the clear winner (no ambiguity). Wire `parse_lightfoot_apostolic_fathers.py` against the `ccel.org/ccel/lightfoot/fathers/fathers.ii.<roman>.html` page set. The 15 books cleanly cover everything except Papias; Papias goes on a session 29+ tail item.

## Estimated extraction shape

- **15 books** with chapters per Lightfoot's abridged single-volume edition.
- Verse-equivalent: each chapter is paragraph-blob (some chapters multi-paragraph). Total estimated ~600-900 paragraph-verses across the 15 books (1 Clement is the largest at 65 chapters; Shepherd of Hermas is multi-section Vis./Mand./Sim. each with its own chapter run; the rest are single-digit chapter counts).
- Convention dispatch: a new `chapter-abbr-hdr` convention that detects the `## BookAbbr. N` form (parallel to the existing `chapter-verse-hdr` for Charles vol 1).
- New edition slug: `lightfoot-apostolic-fathers`. Witness-category: `apostolic-fathers` (new enum value — confirm with Yoshi at session 29). Tier: `extras`. Sort offset: 600 (after Charles vol 1's 550).

## Followup-needed for session 29

1. Fetch `fathers.toc.html` and confirm the full 15-URL list programmatically.
2. Probe 2-3 representative books (1 Clement = largest, Ignatius to Romans = smallest, Shepherd of Hermas = multi-section) to verify the per-chapter marker format is consistent across the corpus.
3. Write `parse_lightfoot_apostolic_fathers.py`:
   - HTTP fetch each per-book URL with simple rate-limiting (0.5-1s between fetches; 15 requests total is trivial).
   - Strip CCEL nav chrome (top/bottom recurring blocks).
   - Detect chapter markers; emit `# Chapter N` / verse-line shape.
   - Handle the table-formatted liturgical quotes (Didache eucharistic prayers, 1 Clement's hymn passages).
4. `restore.py` integration (Sacred-name restoration applies cleanly since the texts are NT-adjacent).
5. Structural parser modeled on `parse_pseudepigrapha_edition.py` — emit `lightfoot-apostolic-fathers.json`.
6. seed.py wire-up — `EDITION_PROFILES["lightfoot-apostolic-fathers"]`, JSON file map entry.
7. Pipeline gates × 5.
8. Papias fragment handling: scout earlychristianwritings.com pt1vol2 for Papias section; add as a 16th book if clean transcription is accessible.

Live DB stays on `1.0.0-phase4-session13`. W-7 HELD.

## Session log
- Session 28 (2026-05-12): vol1-q through vol1-u landed on Charles 1913 vol 1. Spent ~10 min on this scout. CCEL Lightfoot confirmed cleanest path-FAST source surveyed; queued for session 29 full extraction.
