#!/usr/bin/env python3
"""
parse_charles_apocrypha.py
--------------------------
W-2 extractor for R. H. Charles, *The Apocrypha and Pseudepigrapha of the
Old Testament in English*, Vol. I — Apocrypha (Oxford, Clarendon Press, 1913).

Source: ~/Downloads/charles-1913-vol1.pdf (712 pages, archive.org BYU upload).

**Key architectural difference from `parse_charles_pseudepigrapha.py` (vol 2):**
The vol-1 PDF's text layer is 100% Greek-glyph OCR drift across body pages
(session-25 finding). Where vol 2 used `PdfReader.pages[i].extract_text()` as
the front-end, vol 1 uses `ocr_charles_vol1.ocr_page(page_1idx)` — a cached
re-OCR of the embedded 300dpi scan images via tesseract.

This module **monkey-patches** the vol-2 module's `_extract_pdf_pages` to
use the OCR cache (and to apply vol-1's parallel-column-drop pre-step), then
overrides `_v2.BOOK_CONVENTION` with vol-1's per-book conventions, then calls
`_v2.extract_book(book_id, title, start, end)` directly. This reuses every
vol-2 hardened pipeline component without duplication:
  - convention dispatch (`_CONVENTION_DISPATCH`)
  - per-convention extractors (chapter-verse-hdr, flat, sibylline-paren, etc.)
  - page-header strip, footnote drop, Greek-glyph normalization
  - chapter-drift smoother, saying detector, recover_v1
  - coverage instrumentation

Output:
  ~/Desktop/App/source-texts/apocrypha-charles-vol1/charles-apocrypha.txt
    (full edition; 15 books per vol 1 CONTENTS).

  --pilot writes a single-book pilot file (default: 3-maccabees) to
  ~/Desktop/App/source-texts/apocrypha-charles-vol1/<book_id>.md for Yoshi's
  review before the full batch runs.

Decisions and per-book scope: see
  ~/Desktop/App/source-texts/apocrypha-charles-vol1/_CHARLES_VOL1_BOUNDARIES.md

SESSION-25 STATE: this scaffold is LANDED but the BOOKS table is partially
calibrated. Session 26 completes the per-book PDF-page scout (most books
TBD-scout) and runs the full extraction pipeline.
"""

from __future__ import annotations
import argparse
import os
import re
import sys
import warnings

warnings.filterwarnings("ignore")

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

def _resolve_root() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    script_dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.dirname(script_dir)

ROOT = _resolve_root()
OUT_DIR = os.path.join(ROOT, "source-texts", "apocrypha-charles-vol1")
os.makedirs(OUT_DIR, exist_ok=True)

# Import the OCR-cache front-end (vol-1-specific) and the hardened vol-2
# parser module. Both must be importable from the same directory.
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import ocr_charles_vol1 as _ocr_vol1
import parse_charles_pseudepigrapha as _v2

# ---------------------------------------------------------------------------
# Vol-1 BOOKS table — per _CHARLES_VOL1_BOUNDARIES.md
#
# PDF page numbers are 1-indexed. body_start / body_end are inclusive page
# ranges that contain ONLY the primary-text translation body — the
# translator-introduction pages that precede each book's body are excluded.
#
# SESSION-25 state: 1 Esdras body locked (44-77); 1 Macc + 2 Macc partial.
# Remaining 12 books TBD-scout in session 26 as the OCR cache fills.
# ---------------------------------------------------------------------------

BOOKS = [
    # book_id,                  display_title,                       body_start, body_end
    ("1-esdras",                "1 Esdras",                          44,  77),     # LOCKED session 25
    ("1-maccabees",             "1 Maccabees",                       87,  144),    # session-28 vol1-q: body_start was 94 (mid-ch 2); ch 1 v1-9 actually begins at p0087 ("I, 1-4. The Victory of Alexander the Great"). Translator-intro pp 0079-0086 (Oesterley) excluded. body_end 0144 unchanged (last "I MACCABEES 16. 22-24" running head; p0145 is 2 Macc title page).
    ("2-maccabees",             "2 Maccabees",                       146, 175),    # session-27 rescout: header transitions from I MACCABEES at p0145 → II MACCABEES at p0146; II → III at p0176 so 2 Macc ends p0175
    ("3-maccabees",             "3 Maccabees",                       176, 195),    # session-27 rescout: 3 Macc intro+body p0176-0195 (Tobit intro starts p0196 with "THE BOOK OF TOBIT" running head)
    ("tobit",                   "Tobit",                             196, 261),    # session-27 rescout: Tobit intro p0196-0223 ("THE BOOK OF TOBIT" / "INTRODUCTION" alternating headers); body starts p0224 ("THE BOOK OF TOBIT 1. 10-18"); ends p0261 (JUDITH starts p0262)
    ("judith",                  "Judith",                            262, 287),    # session-27 rescout: starts p0262 (JUDITH header confirmed); SIRACH starts p0288 so Judith ends p0287
    ("sirach",                  "Sirach (Ecclesiasticus)",           288, 539),    # session-27 rescout: SIRACH starts p0288; WISDOM OF SOLOMON intro starts p0540 so Sirach ends p0539 (~250 PDF pp = ~250 printed pp, matching the largest-book label)
    ("wisdom-of-solomon",       "The Wisdom of Solomon",             540, 596),    # session-27 rescout: starts p0540 (WISDOM OF SOLOMON intro alternating with INTRODUCTION running heads); body verses appear by p0565 (WoS 6:18—7:9); ends ~p0596 (Baruch body chapter 1 visible at p0605)
    ("1-baruch",                "1 Baruch",                          597, 615),    # session-29 vol1-v: body_end 623→615; p0615 is last Baruch body page (`THE BOOK OF BARUCH 5. 5-9`); pp 0616-0618 are Jeremy intro alternating with `EPISTLE OF JEREMY`/`INTRODUCTION` headers (Jer body starts p0619, not p0624 — see Jer entry).
    ("epistle-of-jeremy",       "The Epistle of Jeremy",             619, 631),    # session-29 vol1-v: body_start 624→619 (recovers v1-25; p0619 has header `THE EPISTLE OF JEREMY` with body `<A copy of an epistle, which Jeremy sent unto them...` = v1; p0620 has `EPISTLE OF JEREMY 3-8`); body_end 633→631 (p0631 has `EPISTLE OF JEREMY 73`; p0632 is `THE PRAYER OF MANASSES / INTRODUCTION` for Manasses intro).
    ("prayer-of-manasses",      "The Prayer of Manasses",            640, 644),    # session-29 vol1-v: body_start 634→640 (pp 0634-0639 are alternating Manasses INTRODUCTION pages with apparatus content; p0640 is title `THE PRAYER OF MANASSES` with body `O Lord Almighty, which art...` = v1-5; p0641 onwards have `THE PRAYER OF MANASSES N-M` V-V running heads). session-30 vol1-x: switched to `chapter-verse-only` with first-page seeding (see VOL1_BOOK_CONVENTION below).
    ("song-of-three",           "The Prayer of Azariah and the Song of the Three Children", 652, 657),  # session-29 vol1-v: body_start 645→652 (pp 0645-0651 are title/intro alternating `THE PRAYER OF AZARIAH, ETC.`/`INTRODUCTION`; p0652 is body-start title `THE PRAYER OF AZARIAH AND THE SONG OF THE THREE CHILDREN` with v1-7); body_end 659→657 (p0657 has `THE SONG OF THE THREE CHILDREN 66-68`; pp 0658-0659 are Susanna intro pages).
    ("susanna",                 "The History of Susanna",            667, 671),    # session-29 vol1-v: body_start 660→667 (pp 0660-0666 are alternating intro `SUSANNA`/`INTRODUCTION` pages with apparatus content; p0667 is title `THE HISTORY` with v1-6); body_end 678→671 (p0671 has `SUSANNA 56-64`; pp 0672-0678 are Bel intro pages, Bel body begins at p0679).
    ("bel-and-dragon",          "The History of Bel and the Dragon", 679, 684),    # session-28 vol1-r: body_start was 680; p0679 has running head `BEL AND THE DRAGON 4-10` so it's Bel's first body page; THE ADDITIONS TO ESTHER starts p0685
    ("additions-to-esther",     "The Additions to Esther",           691, 704),    # session-29 vol1-w: body_start 685→691 (pp 0685-0690 are alternating title/intro `THE ADDITIONS TO ESTHER`/`INTRODUCTION` pages; p0691 is heavily OCR-drifted first body page potentially carrying A 1-8; p0693 starts clean with `A 9-17`); body_end 712→704 (p0703 has `F 2-11`, p0704 has `Fur` = OCR-truncated `F` trailing range; pp 0705-0712 are blank/junk trailing pages).
]

# Per-book convention dispatch (overrides _v2.BOOK_CONVENTION at runtime).
# Vol-1 books are mostly chapter-verse-hdr (matching the existing apocrypha
# edition's KJV/Brenton convention); Prayer of Manasses is flat.
VOL1_BOOK_CONVENTION = {
    "1-esdras":            "chapter-verse-hdr",
    "1-maccabees":         "chapter-verse-hdr",
    "2-maccabees":         "chapter-verse-hdr",
    "3-maccabees":         "chapter-verse-hdr",
    "tobit":               "chapter-verse-hdr",
    "judith":              "chapter-verse-hdr",
    "sirach":              "chapter-verse-hdr",
    "wisdom-of-solomon":   "chapter-verse-hdr",
    "1-baruch":            "chapter-verse-hdr",
    # vol1-r (session 28): single-chapter books with V-V-only running heads.
    # Page headers carry `BOOK_NAME V_LO-V_HI` (no chapter prefix); the new
    # chapter-verse-only convention maps these to implicit chapter 1.
    "epistle-of-jeremy":   "chapter-verse-only",
    "prayer-of-manasses":  "chapter-verse-only",  # session-30 vol1-x: switched off `flat` (which gave 2 verses) and onto `chapter-verse-only` with vol1-x first-page seeding. p0640 has bare title `THE PRAYER OF MANASSES` (no V-V range); the seeding step injects ` 1-99` into the title line so capture detects (1,1,1,99) and assigns p0640 body to chapter 1.
    "song-of-three":       "chapter-verse-only",  # combined per Yoshi session-26 decision
    "susanna":             "chapter-verse-only",
    "bel-and-dragon":      "chapter-verse-only",
    # vol1-w (session 29): chapter-verse-letter for Additions to Esther.
    # Letters A-F mapped to chapters 1-6 (A: Mordecai's dream / B: Letter
    # of Artaxerxes I / C: Prayer of Mordecai+Esther / D: Esther before
    # the king / E: Letter of Artaxerxes II / F: Interpretation).
    "additions-to-esther": "chapter-verse-letter",
}

# ---------------------------------------------------------------------------
# Parallel-column drop (session-25 Yoshi-locked decision; session-26 vol1-h)
#
# Two layers:
#  1. IMAGE LEVEL (session-26 vol1-h, primary): `ocr_charles_vol1.ocr_page_smart`
#     detects parallel-column pages via pixmap vertical-rule projection,
#     crops the page image at the horizontal midpoint, and OCRs only the
#     left half (Charles's apocryphal-text column). The canonical column
#     never reaches the parser. This is the cache-correct path.
#  2. TEXT LEVEL (session-25 legacy, safety net): `_strip_parallel_column`
#     below is kept for backward compatibility with cache files where the
#     image-level detection didn't fire (legacy pre-session-26 cache or
#     edge-case pages). On parallel pages with `|` separators preserved
#     by tesseract, it splits each line at the first `|` and keeps the left
#     side. With vol1-h active, this is mostly a no-op.
# ---------------------------------------------------------------------------

_PIPE_LINE = re.compile(r"\|")
_PARALLEL_COLUMN_THRESHOLD = 0.30


# vol1-k-3 (session 27): translator-apparatus tail truncation.
#
# Charles vol-1 frequently ends body pages with a critical-apparatus block:
# a section-rubric line ("The Story of the Three Pages and the Decree of
# Darius, iii. 1-v. 6, wanting in E ; see Jos. xi. 32-6.") followed by
# multi-paragraph prose introduced by `(a)`, `(b)`, `(c)` paragraph-letter
# markers. Without truncation, these paragraphs fuse onto the last body
# verse on the page (verse N's body swallows several hundred lines of
# apparatus prose). The vol-2 footnote-strip pipeline does NOT catch this
# because the apparatus prose has no leading footnote-anchor character —
# only the bare `(a)` paragraph letter.
#
# Strategy: walk each page from top to bottom and truncate at the first
# line matching `^\s*\([a-c]\)\s+[A-Z]` (apparatus paragraph opener with
# a capital-letter sentence start). Conservative: in-body parenthetical
# references like "see (a) above" don't appear at line-start so they
# don't trigger.
#
# Note this is distinct from vol-1's per-book translator-INTRODUCTION
# pages (which the session-27 prompt also referenced). Those pages sit
# OUTSIDE the BOOKS-table body range (e.g., 1 Esdras body is pp 44-77;
# its translator-intro is pp 23-43). Pages inside the body range
# occasionally trail their last verse with an apparatus block — that's
# what we strip here.
_VOL1_APPARATUS_OPENER = re.compile(r"^\s*\([a-c]\)\s+[A-Z]")

# vol1-x (session 30): manuscript-witness-key opener. Pages whose translator
# apparatus opens with a witness-key list — e.g.
#   `A = Codex Alexandrinus. T = Codex Turicensis. Const. Apost. = ...`
# — are not caught by `_VOL1_APPARATUS_OPENER` (which expects an `(a)`
# paragraph letter). Prayer of Manasses p0640 is the motivating case: the
# body ends at line 16, then line 17 opens with `A = Codex Alexandrinus`,
# fusing apparatus into the prayer body when switching from `flat` to
# `chapter-verse-only` convention. To avoid false-positives on body lines
# containing a single inline equation (`A = B`), we require >=2 occurrences
# of the witness-key pattern (a "list", e.g. `A = X. T = Y. Const. = Z`).
_VOL1_WITNESS_KEY_PATTERN = re.compile(
    r"[A-Z][A-Za-z]{0,5}\.?\s*=\s*[A-Z][a-z]"
)


def _is_witness_key_opener(line: str) -> bool:
    """True iff line is a witness-key list (vol1-x apparatus opener)."""
    if not line or len(line) < 12:
        return False
    return len(_VOL1_WITNESS_KEY_PATTERN.findall(line)) >= 2


def _strip_translator_apparatus_tail(page_text: str) -> str:
    """Truncate a page at the first apparatus-paragraph opener line.

    Returns the page text with everything from the apparatus-opener line
    onward removed. If no opener is found, returns the page unchanged.

    Two opener patterns are recognised:
      - `_VOL1_APPARATUS_OPENER`: `(a) Foo` paragraph-letter rubric (legacy)
      - witness-key list (vol1-x session 30): `A = Codex... T = Codex...`,
        required for Prayer of Manasses p0640 and similar pages where the
        manuscript-witness key opens the apparatus block.
    """
    lines = page_text.split("\n")
    for i, ln in enumerate(lines):
        if _VOL1_APPARATUS_OPENER.match(ln) or _is_witness_key_opener(ln):
            return "\n".join(lines[:i])
    return page_text


def _strip_parallel_column(page_text: str) -> str:
    """Text-level parallel-column-drop (session-25 legacy, safety net).

    See module-level comment above for the layered design. With vol1-h
    image-level pre-segmentation active, this function is mostly a no-op
    because `|` separators don't appear in left-half-OCR'd text. Kept for
    safety on edge-case pages where image-level detection misses.
    """
    lines = page_text.split("\n")
    content_lines = [ln for ln in lines if ln.strip()]
    if not content_lines:
        return page_text
    pipe_lines = sum(1 for ln in content_lines if _PIPE_LINE.search(ln))
    ratio = pipe_lines / len(content_lines)
    if ratio < _PARALLEL_COLUMN_THRESHOLD:
        return page_text
    out = []
    for ln in lines:
        if "|" in ln:
            left, _, _right = ln.partition("|")
            out.append(left.rstrip())
        else:
            out.append(ln)
    return "\n".join(out)


# ---------------------------------------------------------------------------
# Vol-1 page-header strip (session-26 vol1-g)
#
# The vol-2 `_v2._strip_page_headers` patterns match vol-2 book titles (THE
# LETTER OF ARISTEAS, etc.) — none of vol 1's headers match those. The
# session-25 pilot output showed vol-1 running headers like
# `I ESDRAS 4. 36-42`, `Espras I ESDRAS 5. 7-13`, `EspRas I ESDRAS 6, 11-23`
# (note the comma instead of period), `Espras ] ESDRAS by 13-29` (heavily
# mangled), and standalone OCR-drift words (`Espras`, `Tunes`) surviving
# into the body text and confusing the chapter-verse-hdr extractor.
#
# This module installs vol-1-aware patterns by monkey-patching:
#   - _v2._strip_page_headers      → _vol1_strip_page_headers
#   - _v2._capture_header_chapter_verse → _vol1_capture_header_chapter_verse
#
# Chapter detection runs BEFORE strip (see `_extract_chapter_verse_hdr_book`
# in vol-2), so the more-permissive vol-1 capture function preserves the
# chapter signal; then the vol-1 strip removes the header line.
# ---------------------------------------------------------------------------

_VOL1_HEADER_PATTERNS = [
    # Main vol-1 book headers. Allow an optional OCR-drift prefix word
    # (CamelCase or "Espras"/"Esdras"/"Tunes" picked up from the page spine).
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?(?:I{1,3}|1|2|3)\s+ESDRAS\b.*$"),
    # MACCABEES — OCR-drift tolerant (session 28 vol1-q).
    # Observed drift forms in the OCR cache for the 1 Macc page range:
    #   p0094: "I MAGCCABEDRS 2. 43°66"   (G inserted; EES → EDRS at tail)
    #   p0103: "I MACCABBES 6. 219"       (extra B inserted; dropped one E)
    # Schema: numeral prefix + MA + 0-3 stray chars + AB+ + E + 0-3 tail chars + S.
    # Body-text words like MACCABAEUS / MACCABAEAN do NOT match (no AB+E substring
    # — they have ABA between AB and E). The mandatory numeral prefix further
    # restricts false positives from inline body references.
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?(?:I{1,3}|1|2|3)\s+MA[A-Z]{0,3}AB+E[A-Z]{0,3}S\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?TOBIT\b.*$"),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?JUDITH\b.*$"),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?SIRACH\b.*$"),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?(?:THE\s+)?WISDOM\s+OF\s+SOLOMON\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?(?:I{1,3}|1|2|3)?\s*BARUCH\b.*$"),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?(?:THE\s+)?EPISTLE\s+OF\s+JEREMY\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?(?:THE\s+)?PRAYER\s+OF\s+MANASSES\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:[A-Z][a-zA-Z]{1,12}\s+)?(?:THE\s+)?PRAYER\s+OF\s+AZARIAH\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:THE\s+)?SONG\s+OF\s+(?:THE\s+)?THREE\s+CHILDREN\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:THE\s+(?:HISTORY\s+OF\s+)?)?SUSANNA\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:THE\s+(?:HISTORY\s+OF\s+)?)?BEL\s+AND\s+(?:THE\s+)?DRAGON\b.*$", re.IGNORECASE),
    re.compile(r"^\s*(?:THE\s+)?ADDITIONS\s+TO\s+ESTHER\b.*$", re.IGNORECASE),
    # OCR-drift artifacts that show up as standalone lines (spine text picked
    # up by OCR sometimes lands as a single word: "Espras" / "EspRas" /
    # "EspRAs" / "Tunes" / "EsdRas").
    re.compile(r"^\s*[Ee]s[pd]\s*[Rr]?[Aa][Ss]\s*$"),
    re.compile(r"^\s*Tunes\s*$"),
    # Canonical-column sub-headers and column labels left over from
    # parallel-column pages where image-level segmentation didn't fully
    # exclude the canonical-side header (e.g., "2 CHRON." stamped centered).
    re.compile(r"^\s*\d+\s*CHRON\.?\s*$", re.IGNORECASE),
    re.compile(r"^\s*CHRON\.?\s*$"),
    re.compile(r"^\s*Ezra\s*\d*\s*$"),
    re.compile(r"^\s*Neh\.?\s*\d*\s*$"),
    # Standalone translator-intro header (also covered by the vol-2 patterns
    # but harmless to duplicate).
    re.compile(r"^\s*INTRODUCTION\s*$"),
]

_VOL1_TITLE_SUBSTRINGS = [
    "ESDRAS", "MACCABEES", "TOBIT", "JUDITH", "SIRACH",
    "WISDOM OF SOLOMON", "BARUCH", "EPISTLE OF JEREMY",
    "PRAYER OF MANASSES", "PRAYER OF AZARIAH",
    "SONG OF THREE", "SONG OF THE THREE",
    "SUSANNA", "BEL AND", "ADDITIONS TO ESTHER",
    # Canonical-column markers (defense-in-depth, in case the canonical
    # column's header line survives the image-level crop on edge pages)
    "CHRON", "EZRA", "NEH",
    # OCR-drift variants of "Esdras" / "Espras"
    "ESPRAS", "ESPRA", "ESDRA",
]

# Vol-1 verse-range trailing patterns. The vol-2 strip uses `\s\d{1,3}-\d{1,3}\s*$`
# which misses (a) chapter.verse forms like `4. 36-42` and (b) trailing junk
# after the range (`1. 39-53 a`). This regex catches both.
_VOL1_VERSE_RANGE_TRAILING = re.compile(
    r"(\d{1,3})\s*[.,]?\s*(\d{1,3})\s*[-—]\s*(\d{1,3})(?:\s*[.,]\s*\d{1,3})?(?:\s+[a-zA-Z]{1,4})?\s*$"
)


def _vol1_strip_page_headers(text: str) -> str:
    """Vol-1-aware page-header strip. Replaces `_v2._strip_page_headers` when
    parse_charles_apocrypha is loaded.

    Four rules, in order:
      1. Line matches one of `_VOL1_HEADER_PATTERNS` (vol-1 explicit headers).
      2. Line matches one of the legacy `_v2._PAGE_HEADER_PATTERNS` (vol-2
         titles — none should fire in vol-1, but kept for safety).
      3. Line has a vol-1 title substring AND ends with a verse-range pattern
         (catches headers with chapter.verse range trailing junk).
      4. Short ALL-CAPS-or-glyph line with a vol-1 title substring and >50%
         non-lowercase chars (catches short residue lines).
    """
    lines = text.split("\n")
    kept = []
    for ln in lines:
        s = ln.strip()
        if not s:
            kept.append(ln)
            continue
        # Rule 1: vol-1 explicit page-header patterns
        if any(pat.match(ln) for pat in _VOL1_HEADER_PATTERNS):
            continue
        # Rule 2: legacy vol-2 patterns (safety; almost never fires in vol-1)
        if any(pat.match(ln) for pat in _v2._PAGE_HEADER_PATTERNS):
            continue
        upper = s.upper()
        has_title = any(sub in upper for sub in _VOL1_TITLE_SUBSTRINGS)
        # Rule 3: title substring + trailing verse range (handles chapter.verse
        # forms and trailing-junk forms the vol-2 strip misses)
        if has_title and _VOL1_VERSE_RANGE_TRAILING.search(s):
            continue
        # Rule 4: short ALL-CAPS-or-glyph line with a title substring
        if len(s) < 60 and has_title and \
                sum(1 for c in s if c.isupper() or not c.isalpha()) > len(s) * 0.5:
            continue
        kept.append(ln)
    return "\n".join(kept)


# Vol-1 chapter+verse capture. Two relaxations vs vol-2:
#  (a) comma-or-period separator between chapter and verse (`3, 6—4. 10`)
#  (b) trailing junk after the verse range (`1. 39-53 a`, `2. 4-14 Ezra l`)
# Implementation: search (not match-to-end-of-line) with a lookahead that
# rejects the multi-chapter case from the single-chapter branch.
_VOL1_HDR_CV_MULTI = re.compile(
    r"(\d{1,3})\s*[.,]\s*(\d{1,3})\s*[-—]\s*(\d{1,3})\s*[.,]\s*(\d{1,3})"
)
_VOL1_HDR_CV_SINGLE = re.compile(
    r"(\d{1,3})\s*[.,]\s*(\d{1,3})\s*[-—]\s*(\d{1,3})(?!\s*[.,]\s*\d)"
)

# vol1-x (session 30): OCR-drift-tolerant multi-chapter capture. The strict
# `_VOL1_HDR_CV_MULTI` regex requires all four numerals to be digit
# sequences. Real running heads like `I MACCABEES 1. ss—2. 14` on p0091
# show `ss` for `55` (s↔5 OCR drift) and similar substitutions. This
# permissive variant accepts non-digit tokens for v_lo while keeping
# ch_lo, ch_hi, v_hi strictly digit. When this fires, the capture function
# returns (ch_lo, 1, ch_hi, v_hi) — v_lo defaults to 1 since the OCR drift
# made it unrecoverable; downstream `chapter_v_lo` will be set from the
# previous page's continuation (forward-fill).
_VOL1_HDR_CV_MULTI_DRIFT = re.compile(
    r"(\d{1,3})\s*[.,]\s*[A-Za-z0-9°]{1,4}\s*[-—]\s*(\d{1,3})\s*[.,]\s*(\d{1,3})"
)

# vol1-r (session 28): chapter-verse-only convention regex.
#
# 5 single-chapter vol-1 books carry page-headers as `BOOK_NAME V_LO-V_HI`
# with no chapter prefix (Epistle of Jeremy, Prayer of Manasses, Song of
# Three, Susanna, Bel & Dragon). The existing CV regexes return None on
# these because there's no `CHAPTER. VERSE` form, leaving the pages with
# undetected chapter → mass-loss into the unknown bucket.
#
# This regex matches at line-start: an uppercase-and-punctuation book-name
# prefix, then whitespace, then `V_LO-V_HI`. Lazy prefix avoids consuming
# the digits. Search-not-anchored on trailing allows the regex to ignore
# whatever junk comes after the range. Gated on `_VOL1_SINGLE_CHAPTER_MODE`
# so it never fires for the multi-chapter books that share
# `_vol1_capture_header_chapter_verse` — those continue to fall through
# cleanly when their CV form is OCR-mangled (current behaviour).
#
# Additions to Esther uses lettered sections — see chapter-verse-letter
# convention below for that case.
_VOL1_HDR_V_ONLY = re.compile(
    r"^[A-Z][A-Z\s,.()'’\-—]{1,80}?\s+(\d{1,3})\s*[-—]\s*(\d{1,3})\b"
)
_VOL1_SINGLE_CHAPTER_MODE: bool = False

# vol1-w (session 29): chapter-verse-letter convention regex for Additions
# to Esther.
#
# Charles vol 1 splits Additions to Esther across LXX letter-sections A-F
# (A: Mordecai's dream; B: Letter of Artaxerxes [first]; C: Prayer of
# Mordecai + Prayer of Esther; D: Esther before the king; E: Letter of
# Artaxerxes [second]; F: Interpretation of Mordecai's dream). Page-headers
# carry forms like:
#   `THE ADDITIONS TO ESTHER. A 9-17`           (single-letter, V-V)
#   `THE ADDITIONS TO ESTHER. B 1-5`            (single-letter, V-V)
#   `THE ADDITIONS TO ESTHER. B5—C5`            (multi-letter, no spaces)
#   `THE ADDITIONS TO ESTHER. C 26—D 3`         (multi-letter, with spaces)
#   `THE ADDITIONS TO ESTHER. D 15—E 5`         (multi-letter)
#
# Letter→chapter mapping: A=1, B=2, C=3, D=4, E=5, F=6. The extractor
# captures these as (ch_lo, v_lo, ch_hi, v_hi) with letters resolved to
# their chapter integers; downstream chapter-verse-hdr pipeline (smoother,
# verse-line normalization) is unchanged.
#
# Multi-letter pattern is more specific than single-letter and runs first.
# Trailing junk after the verse range is tolerated (the regex does not
# anchor to end-of-line). Gated on `_VOL1_LETTER_MODE` so it only fires
# for Additions to Esther.
_LETTER_TO_CHAPTER = {"A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6}
_VOL1_HDR_LETTER_CV_MULTI = re.compile(
    r"([A-F])\s*(\d{1,3})\s*[-—]\s*([A-F])\s*(\d{1,3})\b"
)
_VOL1_HDR_LETTER_CV_SINGLE = re.compile(
    r"([A-F])\s+(\d{1,3})\s*[-—]\s*(\d{1,3})(?!\s*[A-F])"
)
_VOL1_LETTER_MODE: bool = False


def _vol1_capture_header_chapter_verse(line: str) -> tuple[int, int, int, int] | None:
    """Vol-1-aware chapter+verse capture from a page-header line.

    More permissive than vol-2's: tolerates trailing junk after the range
    and comma-instead-of-period chapter separators (both common in vol-1
    OCR'd headers). Backward-span fix (ch_lo > ch_hi → snap ch_lo to ch_hi - 1)
    is preserved from the vol-2 implementation.
    """
    s = line.strip()
    if not s or len(s) > 200:
        return None
    if not re.search(r"[A-Z]{2,}", s):
        return None
    # Multi-chapter pattern first (more specific)
    m = _VOL1_HDR_CV_MULTI.search(s)
    if m:
        a, b, c, d = (int(m.group(1)), int(m.group(2)),
                      int(m.group(3)), int(m.group(4)))
        if 1 <= a <= 999 and 1 <= b <= 999 and 1 <= c <= 999 and 1 <= d <= 999:
            if a > c:
                a = max(1, c - 1)
            if d - b > 200 or c - a > 6:
                # vol1-s (session 28): OCR-drift repair — Wisdom p0558 shows
                # `2. 10—38. 1` where `38` is OCR drift (stray `8` appended
                # to `3`). If c has more digits than a and truncating the
                # trailing digit yields a valid span, accept the repaired
                # value. Conservative: only fires when the un-repaired span
                # already failed validation, so it can't regress clean cases.
                if c >= 10:
                    c_trunc = c // 10
                    if 1 <= c_trunc <= 999 and c_trunc >= a and c_trunc - a <= 6:
                        return (a, b, c_trunc, d)
                return None
            return (a, b, c, d)
    # vol1-x (session 30): OCR-drift-tolerant multi-chapter capture. When
    # the strict regex above misses because v_lo has been OCR-mangled
    # (e.g. `1. ss—2. 14` for `1. 55—2. 14` on 1 Macc p0091), fall back to
    # the permissive regex that allows non-digit v_lo. Returns v_lo=1 as a
    # placeholder; downstream split logic uses the page's last-known verse
    # state rather than this stub. Safe because the strict regex is tried
    # first — clean cases never reach this fallback.
    m = _VOL1_HDR_CV_MULTI_DRIFT.search(s)
    if m:
        a, c, d = int(m.group(1)), int(m.group(2)), int(m.group(3))
        if 1 <= a <= 999 and 1 <= c <= 999 and 1 <= d <= 999:
            if a > c:
                a = max(1, c - 1)
            if c - a <= 6 and d <= 200:
                return (a, 1, c, d)
    # Single-chapter pattern
    m = _VOL1_HDR_CV_SINGLE.search(s)
    if m:
        ch = int(m.group(1))
        v_lo = int(m.group(2))
        v_hi = int(m.group(3))
        if 1 <= ch <= 999 and 1 <= v_lo <= 999 and 1 <= v_hi <= 999 \
                and v_hi >= v_lo and v_hi - v_lo <= 200:
            return (ch, v_lo, ch, v_hi)
    # vol1-r (session 28): chapter-verse-only fallback — V-V with no chapter
    # prefix → implicit ch=1. Only fires when the active book's convention
    # is `chapter-verse-only` (flag set by `_extract_chapter_verse_only_book`).
    if _VOL1_SINGLE_CHAPTER_MODE:
        m = _VOL1_HDR_V_ONLY.match(s)
        if m:
            v_lo = int(m.group(1))
            v_hi = int(m.group(2))
            if 1 <= v_lo <= 999 and 1 <= v_hi <= 999 \
                    and v_hi >= v_lo and v_hi - v_lo <= 200:
                return (1, v_lo, 1, v_hi)
    # vol1-w (session 29): chapter-verse-letter fallback for Additions to
    # Esther. Letters A-F mapped to chapters 1-6. Multi-letter form first
    # (more specific), then single-letter form. Only fires when active
    # book's convention is `chapter-verse-letter` (flag set by
    # `_extract_chapter_verse_letter_book`).
    if _VOL1_LETTER_MODE:
        m = _VOL1_HDR_LETTER_CV_MULTI.search(s)
        if m:
            l_a = m.group(1)
            v_a = int(m.group(2))
            l_b = m.group(3)
            v_b = int(m.group(4))
            ch_lo = _LETTER_TO_CHAPTER.get(l_a)
            ch_hi = _LETTER_TO_CHAPTER.get(l_b)
            if ch_lo and ch_hi and 1 <= v_a <= 999 and 1 <= v_b <= 999:
                if ch_lo > ch_hi:
                    ch_lo = max(1, ch_hi - 1)
                if ch_hi - ch_lo <= 6:
                    return (ch_lo, v_a, ch_hi, v_b)
        m = _VOL1_HDR_LETTER_CV_SINGLE.search(s)
        if m:
            l = m.group(1)
            v_lo = int(m.group(2))
            v_hi = int(m.group(3))
            ch = _LETTER_TO_CHAPTER.get(l)
            if ch and 1 <= v_lo <= 999 and 1 <= v_hi <= 999 \
                    and v_hi >= v_lo and v_hi - v_lo <= 200:
                return (ch, v_lo, ch, v_hi)
    return None


# ---------------------------------------------------------------------------
# vol1-x (session 30): CV-aware cross-chapter page split.
#
# vol-2's `_split_page_body_by_verse_drop` initializes `expected = 1` and
# uses a digit-then-optional-bracket-then-whitespace line-start regex. Two
# vol-1-specific failure modes are not handled:
#  (i) Pages starting mid-chapter (e.g. 1 Macc p0091 starts at ch 1 v55).
#      Initial expected=1 rejects v55+ as too-far ahead, leaving
#      prev_was_high=False and the chapter-2 boundary at "verse 1" goes
#      undetected — all of ch 2 v1-14 stays mis-attributed to ch 1.
# (ii) OCR-mangled punctuation after the verse number. `2: In those days`
#      is the OCR rendering of `1. In those days` (verse-1 marker of ch 2):
#      the `2` is bleed from the chapter heading and the `:` is OCR drift
#      for `.`. The current regex rejects `:` after the digit so the marker
#      goes unrecognised.
#
# The vol-1 split helper below:
#  - Initialises `expected` to the page's v_lo (from the CV header).
#  - Accepts `:` and `,` after the digit in `line_start` (catches `2:` and
#    `3, 4, 5 Gaddis` style multi-marker lines).
#  - Falls back to a Roman-numeral chapter-marker scan when the verse-drop
#    split returns fewer pieces than the header's `ch_hi - ch_lo + 1`.
# ---------------------------------------------------------------------------

_VOL1_ROMAN_LOOKUP = {
    1: "I", 2: "II", 3: "III", 4: "IV", 5: "V", 6: "VI", 7: "VII",
    8: "VIII", 9: "IX", 10: "X", 11: "XI", 12: "XII", 13: "XIII",
    14: "XIV", 15: "XV", 16: "XVI", 17: "XVII", 18: "XVIII", 19: "XIX",
    20: "XX", 21: "XXI", 22: "XXII", 23: "XXIII", 24: "XXIV", 25: "XXV",
    26: "XXVI", 27: "XXVII", 28: "XXVIII", 29: "XXIX", 30: "XXX",
    31: "XXXI", 32: "XXXII", 33: "XXXIII", 34: "XXXIV", 35: "XXXV",
    36: "XXXVI", 37: "XXXVII", 38: "XXXVIII", 39: "XXXIX", 40: "XL",
}


def _int_to_roman_simple(n: int) -> str | None:
    """Return uppercase Roman numeral for 1..40, else None."""
    return _VOL1_ROMAN_LOOKUP.get(n)


_VOL1_LINE_START_TOLERANT = re.compile(r"^\s*([0-9]{1,3})[\]\)\}:,]?\s+")


def _vol1_split_page_body_with_cv(body_text: str, ch_lo: int, ch_hi: int,
                                  v_lo: int) -> list[str]:
    """vol1-x verse-drop split, initialised at v_lo and `:`/`,`-tolerant.

    Mirrors the structure of `_v2._split_page_body_by_verse_drop` with two
    relaxations:
      - `expected` starts at v_lo (not 1), so a page beginning mid-chapter
        accepts its first marker.
      - `line_start` accepts `:` and `,` after the digit (OCR drift for the
        marginal-number trailing punctuation).

    If the verse-drop split returns fewer chunks than the header's chapter
    span (`ch_hi - ch_lo + 1`), a Roman-numeral chapter-marker scan
    provides a fallback split. Lines matching `^[opt-prefix.]?\\s*ROMAN.\\s+\\d`
    (e.g. `II. 1-5.` or `MaAtTTATHIAS. II. 1-70.`) are treated as
    chapter-N start lines for N = ch_lo + i + 1.
    """
    if v_lo is None or v_lo < 1:
        v_lo = 1
    line_start = _VOL1_LINE_START_TOLERANT
    lines = body_text.split("\n")
    chunks: list[list[str]] = [[]]
    expected = v_lo
    prev_was_high = False
    for ln in lines:
        m = line_start.match(ln)
        if m:
            cand = int(m.group(1))
            if cand <= 3 and prev_was_high:
                chunks.append([])
                expected = cand + 1
                prev_was_high = False
            elif cand >= expected - 1 and cand - expected <= 20:
                expected = cand + 1
                if cand >= 4:
                    prev_was_high = True
        chunks[-1].append(ln)
    pieces = ["\n".join(c) for c in chunks if c]

    expected_pieces = max(1, ch_hi - ch_lo + 1)
    if len(pieces) >= expected_pieces:
        return pieces

    # Fallback: scan for Roman-numeral chapter markers for chapters
    # ch_lo+1 .. ch_hi. The match line is treated as the START of the
    # corresponding chapter chunk.
    expected_markers = []
    for c in range(ch_lo + 1, ch_hi + 1):
        r = _int_to_roman_simple(c)
        if r:
            expected_markers.append(r)
    if not expected_markers:
        return pieces

    marker_re = re.compile(
        r"^\s*(?:[A-Za-z][A-Za-z]*\.?\s+)?(" +
        "|".join(re.escape(m) for m in expected_markers) +
        r")\.\s+\d"
    )
    split_indices: list[int] = []
    next_idx = 0
    for i, ln in enumerate(lines):
        if next_idx >= len(expected_markers):
            break
        m = marker_re.match(ln)
        if m and m.group(1).upper() == expected_markers[next_idx]:
            split_indices.append(i)
            next_idx += 1

    if not split_indices:
        return pieces

    new_chunks = []
    start = 0
    for idx in split_indices:
        new_chunks.append("\n".join(lines[start:idx]))
        start = idx
    new_chunks.append("\n".join(lines[start:]))
    return [c for c in new_chunks if c.strip()]


def _vol1_extract_chapter_verse_hdr_book(pages: list[str]) -> str:
    """vol1-x chapter-verse-hdr extractor with CV-aware page splitting.

    Mirrors `_v2._extract_chapter_verse_hdr_book` line-for-line except that
    the multi-chapter page split is performed via
    `_vol1_split_page_body_with_cv` (threading v_lo from the page-CV
    4-tuple) instead of the v_lo-agnostic `_split_page_body_by_verse_drop`.

    Used as the dispatched implementation for `chapter-verse-hdr` in vol-1
    mode AND delegated to from `_extract_chapter_verse_only_book` and
    `_extract_chapter_verse_letter_book` so all vol-1 chapter conventions
    benefit from the fix.
    """
    # Detect chapter range per page BEFORE stripping.
    page_cv: list[tuple[int, int, int, int] | None] = []
    for p in pages:
        cv = None
        for ln in p.split("\n")[:6]:
            cv = _v2._capture_header_chapter_verse(ln)
            if cv is not None:
                break
        page_cv.append(cv)
    page_ranges = [(c[0], c[2]) if c is not None else None for c in page_cv]
    raw_starts = [r[0] if r else None for r in page_ranges]
    smoothed_starts = _v2._smooth_chapter_drift(raw_starts)
    smoothed_ranges: list[tuple[int, int] | None] = []
    for orig, smoothed_lo in zip(page_ranges, smoothed_starts):
        if smoothed_lo is None:
            smoothed_ranges.append(None)
        elif orig is None:
            smoothed_ranges.append((smoothed_lo, smoothed_lo))
        else:
            orig_lo, orig_hi = orig
            span = orig_hi - orig_lo
            if 0 <= span <= 6:
                smoothed_ranges.append((smoothed_lo, smoothed_lo + span))
            else:
                smoothed_ranges.append((smoothed_lo, smoothed_lo))

    stripped = [_v2._strip_clean_page(p) for p in pages]

    if all(r is None for r in smoothed_ranges):
        body = "\n".join(stripped)
        body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
        body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
        return _v2._normalize_to_verse_lines(body)

    filled: list[tuple[int, int] | None] = []
    last_hi = None
    for r in smoothed_ranges:
        if r is None:
            if last_hi is not None:
                filled.append((last_hi, last_hi))
            else:
                filled.append(None)
        else:
            filled.append(r)
            last_hi = r[1]

    chapter_v_lo: dict[int, int] = {}
    for r, cv in zip(filled, page_cv):
        if r is None:
            continue
        ch_lo, ch_hi = r
        if ch_lo not in chapter_v_lo:
            if cv is not None and cv[0] == ch_lo:
                chapter_v_lo[ch_lo] = cv[1]
            else:
                chapter_v_lo[ch_lo] = 1
        for c in range(ch_lo + 1, ch_hi + 1):
            if c not in chapter_v_lo:
                chapter_v_lo[c] = 1

    chapter_bodies: dict[int, list[str]] = {}
    chapter_order: list[int] = []

    for r, cv, body in zip(filled, page_cv, stripped):
        if r is None:
            continue
        ch_lo, ch_hi = r
        if ch_lo == ch_hi:
            chapter_bodies.setdefault(ch_lo, [])
            if ch_lo not in chapter_order:
                chapter_order.append(ch_lo)
            chapter_bodies[ch_lo].append(body)
        else:
            # vol1-x: pass v_lo to the new split helper. Prefer the page's
            # captured v_lo when available; fall back to chapter_v_lo[ch_lo]
            # (forward-filled) when capture was incomplete (drift regex
            # fired, returning v_lo=1 as a stub).
            if cv is not None and cv[0] == ch_lo and cv[1] > 1:
                v_lo_for_split = cv[1]
            else:
                v_lo_for_split = chapter_v_lo.get(ch_lo, 1)
            pieces = _vol1_split_page_body_with_cv(
                body, ch_lo, ch_hi, v_lo_for_split,
            )
            n_chapters = ch_hi - ch_lo + 1
            if len(pieces) > n_chapters:
                pieces = pieces[:n_chapters - 1] + ["\n".join(pieces[n_chapters - 1:])]
            for i, piece in enumerate(pieces):
                ch_num = ch_lo + i
                if ch_num > ch_hi:
                    break
                chapter_bodies.setdefault(ch_num, [])
                if ch_num not in chapter_order:
                    chapter_order.append(ch_num)
                chapter_bodies[ch_num].append(piece)

    out_blocks = []
    for ch in sorted(chapter_bodies.keys()):
        body = "\n".join(chapter_bodies[ch])
        body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
        body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
        v_start = chapter_v_lo.get(ch, 1)
        verses = _v2._normalize_to_verse_lines(body, recover_v1=True,
                                               expected_start=v_start)
        if verses.strip():
            out_blocks.append(f"# Chapter {ch}\n\n{verses}")
    return "\n\n".join(out_blocks)


# vol1-x first-page-seeding title-substring detector. Used by
# `_extract_chapter_verse_only_book` to find the title line on the first
# body page and append a synthetic ` 1-99` range so capture detects ch=1
# v_lo=1.

def _seed_first_page_chapter_verse_only(pages: list[str]) -> list[str]:
    """If the first page has no V-V header, mutate the title line in-place
    to append ` 1-99`, allowing the V-only capture regex to return (1,1,1,99).

    Returns the (possibly mutated) page list. No-op when the first page
    already has a detectable CV header.
    """
    if not pages:
        return pages
    first_lines = pages[0].split("\n")
    for ln in first_lines[:6]:
        if _vol1_capture_header_chapter_verse(ln) is not None:
            return pages  # already detectable
    # Find first vol-1-title-substring line in the first 8 lines and append
    title_idx = None
    for i, ln in enumerate(first_lines[:8]):
        upper = ln.upper()
        if any(sub in upper for sub in _VOL1_TITLE_SUBSTRINGS):
            title_idx = i
            break
    if title_idx is None:
        return pages  # no anchor; bail out cleanly
    first_lines[title_idx] = first_lines[title_idx].rstrip() + " 1-99"
    new_pages = ["\n".join(first_lines)] + list(pages[1:])
    return new_pages


def _extract_chapter_verse_only_book(pages: list[str]) -> str:
    """vol1-r (session 28): chapter-verse-only convention extractor.

    Wraps `_vol1_extract_chapter_verse_hdr_book` with the
    `_VOL1_SINGLE_CHAPTER_MODE` flag set so that the vol-1 capture function
    accepts page-headers carrying VERSE-VERSE only (no chapter prefix) and
    returns implicit chapter 1. The flag is reset in `finally` so that
    cross-book extraction inside `--full` doesn't bleed state into the next
    book.

    vol1-x (session 30): if the first body page has no V-V header (e.g.
    Prayer of Manasses p0640 with bare title `THE PRAYER OF MANASSES`),
    `_seed_first_page_chapter_verse_only` injects ` 1-99` into the title
    line so capture detects ch=1 v_lo=1 and the page body is assigned to
    chapter 1 instead of being dropped.

    vol1-x (session 30): delegates to `_vol1_extract_chapter_verse_hdr_book`
    instead of `_v2._extract_chapter_verse_hdr_book` so the chapter-verse-
    only path also benefits from CV-aware cross-chapter splitting.
    """
    global _VOL1_SINGLE_CHAPTER_MODE
    prev = _VOL1_SINGLE_CHAPTER_MODE
    _VOL1_SINGLE_CHAPTER_MODE = True
    try:
        pages = _seed_first_page_chapter_verse_only(pages)
        return _vol1_extract_chapter_verse_hdr_book(pages)
    finally:
        _VOL1_SINGLE_CHAPTER_MODE = prev


def _extract_chapter_verse_letter_book(pages: list[str]) -> str:
    """vol1-w (session 29): chapter-verse-letter convention extractor.

    Wraps `_vol1_extract_chapter_verse_hdr_book` with the `_VOL1_LETTER_MODE`
    flag set so that the vol-1 capture function accepts page-headers
    carrying `LETTER VERSE-VERSE` or `LETTER VERSE—LETTER VERSE` forms,
    mapping letters A-F to chapters 1-6. Used for Additions to Esther
    (Charles vol-1's LXX letter-section layout). Flag is reset in `finally`
    so that cross-book extraction inside `--full` doesn't bleed state.

    vol1-x (session 30): delegates to `_vol1_extract_chapter_verse_hdr_book`
    instead of `_v2._extract_chapter_verse_hdr_book` so the letter
    convention also benefits from CV-aware cross-chapter splitting.
    """
    global _VOL1_LETTER_MODE
    prev = _VOL1_LETTER_MODE
    _VOL1_LETTER_MODE = True
    try:
        return _vol1_extract_chapter_verse_hdr_book(pages)
    finally:
        _VOL1_LETTER_MODE = prev


# ---------------------------------------------------------------------------
# Monkey-patch the vol-2 module: replace text-layer extraction with OCR
# cache (parallel-column-aware via vol1-h smart routing) + vol-1 header
# patterns. After patching, _v2.extract_book() reads vol-1 page text via the
# left-half-aware cache, captures chapter ranges via the vol-1-tolerant
# regex, and strips vol-1 running headers before parsing verse bodies.
# Idempotent — calling _activate_vol1_mode() twice is harmless.
# ---------------------------------------------------------------------------

def _vol1_extract_pdf_pages(_pdf_path: str, start_page: int, end_page: int) -> list[str]:
    """Drop-in replacement for `_v2._extract_pdf_pages` that uses the smart
    parallel-column-aware OCR cache (vol1-h), strips translator-apparatus
    tails (vol1-k-3), and applies the text-level safety-net parallel-
    column-drop (vol1-h legacy)."""
    out = []
    for p in range(start_page, end_page + 1):
        text = _ocr_vol1.ocr_page_smart(p)
        text = _strip_parallel_column(text)
        text = _strip_translator_apparatus_tail(text)
        out.append(text)
    return out


def _activate_vol1_mode():
    """Patch the vol-2 module to operate on vol-1 inputs. Idempotent.

    Patches:
      - _extract_pdf_pages          → OCR cache front-end (vol1-h smart routing)
      - BOOK_CONVENTION             → vol-1 per-book convention table
      - _strip_page_headers         → vol-1 page-header patterns (vol1-g)
      - _capture_header_chapter_verse → vol-1 chapter+verse capture (vol1-g)
    """
    _v2._extract_pdf_pages = _vol1_extract_pdf_pages
    _v2.BOOK_CONVENTION = dict(VOL1_BOOK_CONVENTION)
    _v2._strip_page_headers = _vol1_strip_page_headers
    _v2._capture_header_chapter_verse = _vol1_capture_header_chapter_verse
    # vol1-x (session 30): replace the vol-2 chapter-verse-hdr extractor
    # with the vol-1 CV-aware variant. The vol-1 variant uses the page-CV
    # 4-tuple's v_lo when splitting multi-chapter pages, and falls back to
    # a Roman-numeral chapter-marker scan when the verse-drop split is
    # short. Required for 1 Macc p0091 (ch 1 v55-64 / ch 2 v1-14) where
    # the v_lo-agnostic split mis-attributes ch 2 v1-14 to ch 1.
    _v2._CONVENTION_DISPATCH["chapter-verse-hdr"] = _vol1_extract_chapter_verse_hdr_book
    # vol1-r (session 28): register the chapter-verse-only convention for
    # single-chapter books whose page-headers carry V-V only.
    _v2._CONVENTION_DISPATCH["chapter-verse-only"] = _extract_chapter_verse_only_book
    # vol1-w (session 29): register the chapter-verse-letter convention for
    # Additions to Esther's LXX letter-section layout (A-F → chs 1-6).
    _v2._CONVENTION_DISPATCH["chapter-verse-letter"] = _extract_chapter_verse_letter_book


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "--pilot",
        default="3-maccabees",
        help="Book id to pilot-extract (default: 3-maccabees, the net-new "
             "book vs the existing apocrypha edition).",
    )
    ap.add_argument(
        "--full",
        action="store_true",
        help="Extract ALL 15 books into one charles-apocrypha.txt file",
    )
    ap.add_argument(
        "--book",
        default=None,
        help="Extract a specific book by book_id (overrides --pilot).",
    )
    ap.add_argument(
        "--prime-cache",
        action="store_true",
        help="Walk the BOOKS table and ensure every body page is in the OCR "
             "cache. Skips already-cached pages. Run this FIRST before "
             "--full or --book to warm the cache.",
    )
    ap.add_argument(
        "--parallel",
        type=int,
        default=2,
        help="OCR worker parallelism for --prime-cache (default 2).",
    )
    args = ap.parse_args()

    if args.prime_cache:
        # Walk every BOOKS-table entry and prime the OCR cache for its body range.
        for book_id, title, start, end in BOOKS:
            print(f"Priming cache: {book_id} (PDF pp {start}-{end}, "
                  f"{end - start + 1} pages)", flush=True)
            _ocr_vol1.build_cache(
                start=start, end=end,
                parallel=args.parallel, progress_every=10,
            )
        return 0

    # All extraction modes need the patched vol-2 module
    _activate_vol1_mode()

    if args.full:
        out_path = os.path.join(OUT_DIR, "charles-apocrypha.txt")
        chunks = []
        for book_id, title, s, e in BOOKS:
            print(f"  extracting {book_id} ({title}) pp. PDF {s}-{e} ...")
            body = _v2.extract_book(book_id, title, s, e, verbose=True)
            chunks.append(body)
        with open(out_path, "w", encoding="utf-8") as f:
            f.write("\n\n".join(chunks))
        total_lines = sum(c.count("\n") for c in chunks)
        print(f"wrote {out_path} ({total_lines} total lines across {len(BOOKS)} books)")
        return 0

    # Single-book pilot
    book_id = args.book or args.pilot
    match = next((b for b in BOOKS if b[0] == book_id), None)
    if match is None:
        print(f"ERROR: unknown book_id {book_id!r}", file=sys.stderr)
        print(f"available: {[b[0] for b in BOOKS]}", file=sys.stderr)
        return 1
    _, title, s, e = match
    body = _v2.extract_book(book_id, title, s, e, verbose=True)
    out_path = os.path.join(OUT_DIR, f"{book_id}.md")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(body)
    print(f"wrote {out_path}")
    lines = body.split("\n")
    print(f"  total lines: {len(lines)}")
    print(f"  first 7 lines:")
    for ln in lines[:7]:
        print(f"    {ln[:140]}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
