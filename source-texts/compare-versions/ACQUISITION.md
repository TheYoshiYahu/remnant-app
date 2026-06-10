# Comparison Versions — Acquisition & Provenance

Backend/data layer for the **"compare this verse/chapter to another
version"** feature. These translations are **COMPARISON-ONLY**: a user
long-presses / right-clicks a verse → "compare to another version" → the
app pulls just that single verse or single chapter in the chosen version.
At most one chapter of any comparison version is ever viewable — a
comparison lens, not a reader.

In the data model this is enforced by `compare_versions.compare_only`, a
boolean **CHECK-pinned to TRUE** (`compare_versions_compare_only_pinned`).
The reading UI lists full Bibles from the canon `editions` table; it must
never read these tables as a readable Bible.

These tables are **completely separate** from the canon
(`editions` / `books` / `chapters` / `verses`) and from the
cross-reference apparatus (`cross_references` / `cross_reference_threads`).

## What was acquired (all PUBLIC DOMAIN)

| Slug | Version | Year | Source | Class |
|---|---|---|---|---|
| `kjv` | King James Version | 1769 | scrollmapper/bible_databases (CSV) | Protestant 66 |
| `asv` | American Standard Version | 1901 | scrollmapper/bible_databases (CSV) | Protestant 66 |
| `ylt` | Young's Literal Translation | 1898 | scrollmapper/bible_databases (CSV) | Protestant 66 |
| `darby` | Darby Translation | 1890 | scrollmapper/bible_databases (CSV) | Protestant 66 |
| `webster` | Webster's Bible | 1833 | scrollmapper/bible_databases (CSV) | Protestant 66 |
| `geneva` | Geneva Bible (1599) | 1599 | scrollmapper/bible_databases (CSV) | Protestant 66 |
| `dra` | Douay-Rheims (Challoner) | 1752 | scrollmapper/bible_databases (CSV, `DRC`) | Catholic + appendix (78 books) |
| `web` | World English Bible | 2000 | eBible.org `engwebp` (VPL) | Protestant 66 |
| `brenton-lxx` | Brenton's English Septuagint | 1851 | eBible.org `eng-Brenton` (VPL) | Greek OT only |

**Target set: 9 of 9 acquired.** Nothing in the requested set could not
be sourced cleanly.

### Sources

- **scrollmapper/bible_databases** — `https://github.com/scrollmapper/bible_databases`,
  `formats/csv/<VERSION>.csv` (header `Book,Chapter,Verse,Text`). The
  packaging is MIT-licensed; the underlying texts (KJV, ASV, YLT, Darby,
  Webster, Geneva 1599, Douay-Rheims Challoner) are all public domain.
- **eBible.org** — `https://ebible.org/Scriptures/<id>_vpl.zip`, the
  verse-per-line format (`BOOK chapter:verse text`, USFM/Haiola book
  codes). WEB = `engwebp`; Brenton = `eng-Brenton`. Both marked Public
  Domain in their `_about.htm`.

The raw downloads are staged under `raw/` (kept for re-verification /
re-builds). `build_compare_migration.py` reads `raw/` and emits the
migration plus `VERIFICATION_REPORT.md` — it acquires nothing itself, so
re-runs are deterministic against the staged files.

## Normalization

All sources are normalized to a single **USFM/OSIS-style book-code**
vocabulary so the comparison feature can align by code:

- The **protocanonical 66** share standard codes (`GEN`…`REV`, with
  `SNG`, `EZK`, `JOL`, `NAM`, `MRK`, `JHN`, `JAS`, `1JN`…) across every
  version — this is what makes "compare this verse" work.
- **Deuterocanon / apocrypha** in DRA and Brenton share codes where they
  are the same book (`TOB`, `JDT`, `WIS`, `SIR`, `BAR`, `1MA`, `2MA`,
  `MAN`, `1ES`, …).
- LXX-specific forms keep distinct codes (`ESG` Greek Esther, `SUS`,
  `BEL`, `EPJ`, `3MA`, `4MA`).
- **LXX lettered sub-verses** (`JOS 9:2a`, `9:2b`, …) are preserved in
  `compare_verses.verse_suffix` (`''` for every non-LXX version), so no
  Septuagint content is dropped and `WHERE verse = N` still returns the
  base verse plus its continuations.

## Versification caveats (documented in each version's `notes`)

- **Brenton LXX** is the Greek Old Testament only — **no New Testament**
  (by design). Psalm numbering runs one behind the Hebrew through much of
  the Psalter (KJV Ps 23 = LXX Ps 22). Greek Daniel folds the Song of the
  Three; Susanna (`SUS`) and Bel (`BEL`) are separate books; Greek Esther
  is `ESG`. This is the high-value text for comparing NT quotations to the
  Greek OT.
- **DRA** uses Vulgate versification: verse boundaries are renumbered
  throughout (≈801 KJV refs land on a different boundary) but no text is
  missing — every chapter is contiguous and complete. Esther carries the
  Greek additions (chs 11–16) and Daniel carries Susanna (13) and Bel
  (14). Baruch ch 6 is the Epistle of Jeremiah.
- **WEB** omits / relocates 4 textually-disputed verses net (Luke 17:36,
  Acts 8:37, 15:34, 24:7; the Romans doxology moves from 16:25–27 to
  14:24–26) per its critical-text base.

## Verification

`VERIFICATION_REPORT.md` is generated alongside the migration. Every
66-book version was checked for: all 66 books present, all 1189 chapters
present, internal verse contiguity (no holes), and a verse-by-verse diff
against the KJV reference set. The migration was additionally:

1. Parsed with `pglast` (real Postgres grammar) — 594 statements, clean.
2. Applied to an ephemeral local Postgres cluster end-to-end — 9 versions
   / 593 book rows / **283,971 verses**, in-transaction verify block
   passed (`verse_count` per book == actual rows), the `compare_only`
   CHECK rejects `FALSE`, and single-verse / single-chapter / sub-verse
   retrieval all confirmed.

## Status

Migration `data-schema/migrations/session221_compare_only_versions.sql` is
**built, verified, and committed — NOT applied to the production DB**
(per the cross-session coordination to avoid racing the live NT
cross-reference applies). Apply is a manual coordinated step:
`python3 api/apply_migration.py session221_compare_only_versions.sql`.
