#!/usr/bin/env python3
"""
parse_charles_pseudepigrapha.py
-------------------------------
W-2 extractor for R. H. Charles, *The Apocrypha and Pseudepigrapha of the Old
Testament in English*, Vol. II — Pseudepigrapha (Oxford, Clarendon Press, 1913).

Source: ~/Downloads/charles-1913-vol2.pdf (898 pages, OCR'd 1913 print scan).

Output:
  ~/Desktop/App/source-texts/pseudepigrapha-charles-vol2/charles-pseudepigrapha.txt
    (full edition; 15 books, Jubilees + 1 Enoch held per session-20 decisions).

  --pilot writes a single-book pilot file (default: Letter of Aristeas) to
  ~/Desktop/App/source-texts/pseudepigrapha-charles-vol2/<book_id>.md for Yoshi's
  review before the full batch runs.

What it strips at extraction time:
- Each book's translator-introduction pages (printed before the body of the book).
- Every footnote body and inline footnote marker.
- Page headers (running headers carrying the book title + verse range).
- Charles's general apparatus (General Introduction, Addenda, Symbols).
- General Index at the back of the volume.

What it preserves:
- The body translation only.
- Per-book chapter/section structure where the printed edition labels it.
- Verse markers reformatted to the existing-edition convention "N.  ".

Greek-glyph OCR drift is normalized where the surrounding context makes the
correct ASCII letter unambiguous.

Decisions and per-book scope: see
  ~/Desktop/App/source-texts/pseudepigrapha-charles-vol2/_CHARLES_VOL2_BOUNDARIES.md
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
    candidate = os.path.dirname(script_dir)
    if os.path.isdir(os.path.join(candidate, "source-texts")):
        return candidate
    return host

ROOT = _resolve_root()
PDF_PATH = os.environ.get(
    "CHARLES_VOL2_PDF",
    os.path.expanduser("~/Downloads/charles-1913-vol2.pdf"),
)
OUT_DIR = os.path.join(ROOT, "source-texts", "pseudepigrapha-charles-vol2")
os.makedirs(OUT_DIR, exist_ok=True)

# ---------------------------------------------------------------------------
# Book boundary map (per _CHARLES_VOL2_BOUNDARIES.md)
#
# PDF page numbers are 1-indexed. body_start / body_end are inclusive page
# ranges that contain ONLY the primary-text translation body — the
# translator-introduction pages that precede each book's body are excluded.
#
# Jubilees and 1 Enoch are HELD per session-20 calls (already wired in seed.py
# from raw-charles sources). They are NOT extracted from this PDF.
# ---------------------------------------------------------------------------

BOOKS = [
    # book_id, display_title, body_start_pdf_page, body_end_pdf_page (inclusive)
    #
    # SCOPE LOCKED 2026-05-12 (session 32) — seven books only, per Yoshi's
    # SOURCE_TEXT_INVENTORY.md.
    #
    # KEPT (Cepher Shamayim + Adam-Eve + Bucket A 4 Macc):
    #   adam-eve, martyrdom-isaiah (Ascension of Isaiah part), testaments-xii,
    #   2-enoch, 2-baruch, 3-baruch, 4-maccabees
    #
    # REMOVED — Bucket C HOLD (Yoshi has not authorized include):
    #   aristeas, sibylline, assumption-moses, psalms-solomon, pirke-aboth
    # REMOVED — off-manifest (not in Shamayim, not in Bucket C):
    #   ahikar, zadokite-fragments
    # REMOVED — duplicate of charles_apocrypha 2 Esdras (Bensly fragment
    # goes into the apocrypha 2 Esdras, not here):
    #   4-ezra
    #
    ("adam-eve",             "The Books of Adam and Eve",              155, 174),
    # SCOPE LOCKED 2026-05-12 (session 32, second pass): martyrdom-isaiah
    # removed from Charles vol 2 — full Ascension of Isaiah now sourced from
    # Charles 1900 (parse_ascension_isaiah_edition.py), which contains the
    # Martyrdom (ch 1-5) as part of the composite.
    # 1 Enoch HELD (printed pp. 163-281) — Enoch already in published Restored Names edition
    ("testaments-xii",       "The Testaments of the XII Patriarchs",   316, 386),
    ("2-enoch",              "2 Enoch (The Book of the Secrets of Enoch)", 451, 489),
    ("2-baruch",             "2 Baruch (The Syriac Apocalypse)",       501, 546),
    ("3-baruch",             "3 Baruch (The Greek Apocalypse)",        553, 561),
    ("4-maccabees",          "4 Maccabees",                            686, 705),
]

# ---------------------------------------------------------------------------
# Greek-glyph OCR drift normalization
#
# The 1913 print scan's OCR engine substitutes visually-similar Greek glyphs
# for English letters in title-case, bold-face, and serif-italic contexts.
# We normalize a conservative set where the substitution is unambiguous in
# context (single-character drift in an otherwise-ASCII word).
# ---------------------------------------------------------------------------

GREEK_TO_ASCII = {
    "Α": "A", "Β": "B", "Ε": "E", "Ζ": "Z", "Η": "H", "Ι": "I", "Κ": "K",
    "Μ": "M", "Ν": "N", "Ο": "O", "Ρ": "P", "Τ": "T", "Υ": "Y", "Χ": "X",
    "α": "a", "β": "b", "ε": "e", "ι": "i", "ν": "n", "ο": "o", "ρ": "p",
    "τ": "t", "υ": "u", "χ": "x", "ΒΟΜΒΑΥ": "BOMBAY",
}

def _normalize_greek_drift(line: str) -> str:
    """Conservative Greek→ASCII substitution.

    Only normalizes Greek characters that appear inside otherwise-ASCII
    tokens. Pure-Greek tokens (footnote citations like ἅπαξ λεγόμενον) are
    left alone — those are intentional editorial Greek, not OCR drift.
    """
    out_tokens = []
    for tok in re.split(r"(\s+)", line):
        if not tok.strip():
            out_tokens.append(tok)
            continue
        # Skip pure-Greek tokens (3+ Greek chars in a row, no ASCII letters)
        ascii_letters = sum(1 for c in tok if c.isascii() and c.isalpha())
        greek_letters = sum(1 for c in tok if c in GREEK_TO_ASCII)
        if greek_letters >= 3 and ascii_letters == 0:
            out_tokens.append(tok)
            continue
        # Mixed token: substitute Greek → ASCII
        new_chars = [GREEK_TO_ASCII.get(c, c) for c in tok]
        out_tokens.append("".join(new_chars))
    return "".join(out_tokens)

# ---------------------------------------------------------------------------
# Per-book extraction
# ---------------------------------------------------------------------------

def _extract_pdf_pages(pdf_path: str, start_page: int, end_page: int) -> list[str]:
    """Return per-page extracted text for pages [start_page .. end_page] (1-indexed)."""
    from pypdf import PdfReader
    r = PdfReader(pdf_path)
    out = []
    for i in range(start_page - 1, end_page):  # convert to 0-indexed
        out.append(r.pages[i].extract_text() or "")
    return out


# Page-header patterns to strip. The running header on body pages typically
# carries the book title (sometimes with stray glyphs/diacritics from OCR) and
# a verse-range in the form "84-95" or "112-124". We strip the entire line.
_PAGE_HEADER_PATTERNS = [
    re.compile(r"^\s*THE\s+LETTER\s+OF\s+[‘'']?ARISTEAS\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+B[ΟO][ΟO]KS?\s+\.?[ΟO]F\s+ADAM\s+AND\s+EVE\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+MARTYRDOM\s+OF\s+ISAIAH\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+TESTAMENTS\s+OF\s+THE\s+(XII|TWELVE)\s+PATRIARCHS\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+SIBYLLINE\s+OR?ACLES?\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+ASSUMPTION\s+OF\s+MOSES\b.*$", re.IGNORECASE),
    re.compile(r"^\s*2\s+ENOCH\b.*$", re.IGNORECASE),
    re.compile(r"^\s*2\s+BARUCH\b.*$", re.IGNORECASE),
    re.compile(r"^\s*3\s+BARUCH\b.*$", re.IGNORECASE),
    re.compile(r"^\s*4\s+EZRA\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+PSALMS\s+OF\s+SOLOMON\b.*$", re.IGNORECASE),
    re.compile(r"^\s*4\s+MACCABEES\b.*$", re.IGNORECASE),
    re.compile(r"^\s*PIRK[EÉé]?\s+ABOTH\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+STORY\s+OF\s+AHIKAR\b.*$", re.IGNORECASE),
    re.compile(r"^\s*THE\s+FRAGMENTS\s+OF\s+A\s+ZADOKITE\s+WORK\b.*$", re.IGNORECASE),
    re.compile(r"^\s*INTRODUCTION\b\s*$", re.IGNORECASE),
]


def _strip_page_headers(text: str) -> str:
    """Remove running-page-header lines from extracted page text.

    Three rules:
      1. Line matches one of the explicit book-title page-header patterns.
      2. Line contains "LETTER OF" + "ARISTEAS" (catches OCR-mangled variants
         where "THE" became a Greek-glyph drift like "ἘΠEῚ").
      3. Line contains a known book title substring + ends with a verse-range
         pattern like "112-124" (catches running headers with verse ranges).
    """
    lines = text.split("\n")
    kept = []
    title_substrings = [
        "LETTER OF", "BOOKS OF ADAM", "MARTYRDOM OF ISAIAH",
        "TESTAMENTS OF THE", "SIBYLLINE ORACLE", "ASSUMPTION OF MOSES",
        "2 ENOCH", "BOOK OF THE SECRETS", "2 BARUCH", "SYRIAC APOCALYPSE",
        "3 BARUCH", "GREEK APOCALYPSE", "4 EZRA", "PSALMS OF SOLOMON",
        "4 MACCABEES", "PIRK", "STORY OF AHIKAR", "ZADOKITE",
    ]
    verse_range_at_end = re.compile(r"\s\d{1,3}-\d{1,3}\s*$")
    for ln in lines:
        s = ln.strip()
        if not s:
            kept.append(ln)
            continue
        # Rule 1: explicit page-header patterns
        if any(pat.match(ln) for pat in _PAGE_HEADER_PATTERNS):
            continue
        # Rule 2: OCR-mangled "THE LETTER OF ARISTEAS"
        if "LETTER OF" in s.upper() and ("ARISTEA" in s.upper() or "RISTEA" in s.upper()):
            continue
        # Rule 3: title substring + trailing verse range
        upper = s.upper()
        if verse_range_at_end.search(s):
            for sub in title_substrings:
                if sub in upper:
                    break
            else:
                kept.append(ln)
                continue
            continue
        # Drop short ALL-CAPS-or-title-glyph lines that match any title substring
        if len(s) < 60 and any(sub in upper for sub in title_substrings) and \
                sum(1 for c in s if c.isupper() or not c.isalpha()) > len(s) * 0.5:
            continue
        kept.append(ln)
    return "\n".join(kept)


# Footnote patterns. Charles's footnotes are anchored by superscript digits/
# letters in the prose that OCR usually flattens. The footnote bodies appear at
# the bottom of each page in smaller print, separated from the body by a thin
# horizontal rule. After page-text extraction (which loses the visual hierarchy),
# the footnotes appear as trailing paragraphs starting with a digit or letter
# followed by a space. The detection rule used here: a paragraph whose first
# alphanumeric token is a 1-2 digit number followed by a period or letter,
# AND which appears in the bottom third of the page text, is treated as a
# footnote body and dropped.
#
# For the pilot, we use a conservative shape: any line that looks like
#   "1 <smaller body> 2 <smaller body>" trailing the main verse content gets
# stripped at line level by a heuristic — pages where >25% of lines are short
# (< 50 chars) AND the page ends with such short-line clusters get those
# clusters dropped.
#
# This is rougher than the Whiston parser's footnote stripping because
# Charles's OCR'd footnotes do not have a clean "ENDNOTES" heading marker.

_FOOTNOTE_ANCHOR = re.compile(r"^\s*\d{1,3}\.\s+[A-Za-z]")
_PAGE_NUMBER_ONLY = re.compile(r"^\s*\d{1,4}\s*$")

# Page-header verse-range capture (fix i — session 21). The running header on
# body pages often carries a verse range, e.g.,
#   THE LETTER OF ARISTEAS 84-95
#   THE TESTAMENT OF REUBEN 1. 1-3. 6      (chapter.verse form)
#   IV EZRA 8. 1-18                         (chapter.verse form, OCR-mangled)
# We capture the LAST digit-dash-digit on the header line as the "expected
# verse range" for that page (use it post-parse to log coverage).
_HEADER_VERSE_RANGE = re.compile(r"(\d{1,3})\s*[-—]\s*(\d{1,3})\s*$")


def _capture_header_verse_range(line: str) -> tuple[int, int] | None:
    """If a line looks like a page header with trailing verse range, return (lo, hi).
    Returns None if no range or the numbers are implausible (e.g., zero, > 999).
    """
    s = line.strip()
    if not s or len(s) > 120:
        return None
    # Must have at least one uppercase letter (page header signal) before the digits
    if not re.search(r"[A-Z]{2,}", s):
        return None
    m = _HEADER_VERSE_RANGE.search(s)
    if not m:
        return None
    lo, hi = int(m.group(1)), int(m.group(2))
    if lo == 0 or hi == 0 or hi < lo or (hi - lo) > 200:
        return None
    return (lo, hi)


# Inline OCR-artifact cleanup (fix ii — session 21). Body verses pick up pipe
# characters (`|`), backslashes (`\`), stray double-underscores (`__`), and
# isolated single-character residues. Strip these conservatively from each
# assembled verse body without disturbing legitimate punctuation.
_ARTIFACT_PIPE = re.compile(r"(?<=\s)\|+(?=\s)")          # pipe surrounded by space
_ARTIFACT_PIPE_BOUNDARY = re.compile(r"(?:^|\s)\|+(?:\s|$)")  # leading/trailing pipe
_ARTIFACT_BACKSLASH = re.compile(r"(?<=\s)\\+(?=\s)")     # backslash surrounded by space
_ARTIFACT_UNDERSCORES = re.compile(r"_{2,}")              # 2+ underscores
_ARTIFACT_LEADING_PUNCT_GLYPHS = re.compile(r"^[\.\,\;\:\|\\\^\*~`·‘’]+\s*")
_ARTIFACT_WHITESPACE = re.compile(r"\s{2,}")


def _clean_inline_artifacts(text: str) -> str:
    """Strip common OCR artifacts from a single verse-body string.

    Conservative: only touches patterns that are clearly non-content (pipe and
    backslash standalone-tokens, runs of underscores, leading glyph residue).
    Leaves periods, commas, quotes, and other legitimate punctuation intact.
    """
    if not text:
        return text
    out = text
    out = _ARTIFACT_PIPE.sub(" ", out)
    out = _ARTIFACT_PIPE_BOUNDARY.sub(" ", out)
    out = _ARTIFACT_BACKSLASH.sub(" ", out)
    out = _ARTIFACT_UNDERSCORES.sub("", out)
    out = _ARTIFACT_LEADING_PUNCT_GLYPHS.sub("", out)
    out = _ARTIFACT_WHITESPACE.sub(" ", out)
    return out.strip()


def _strip_trailing_footnote_block(page_text: str) -> str:
    """Drop the trailing footnote block from page text.

    Rule (calibrated on Aristeas page 114): Charles's footnotes are anchored
    by a line matching `^\\d+\\.\\s+<word>` — a verse-number followed by a
    period, a space, and the verse-phrase the footnote comments on. Body
    verses, by contrast, use `^\\d+\\s` (no period). Once a footnote-anchor
    line appears on a page, everything from that line to end-of-page is
    footnote material and is dropped.

    Also drop bare page-number-only lines.
    """
    lines = page_text.split("\n")
    # Find the FIRST footnote-anchor line; everything from there is footnotes
    cut_idx = None
    for i, ln in enumerate(lines):
        if _FOOTNOTE_ANCHOR.match(ln):
            cut_idx = i
            break
    if cut_idx is not None:
        lines = lines[:cut_idx]
    # Drop bare page-number-only lines (e.g., "94" at the end)
    lines = [ln for ln in lines if not _PAGE_NUMBER_ONLY.match(ln) or len(ln.strip()) > 4]
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# Chapter-aware extraction (session 22 — W-2 hardening)
#
# Session 21 closed with every book extracted as a flat monotonic verse stream
# under a single (synthetic) chapter. This worked for Aristeas's §-section
# pattern but silently merged verses across chapter boundaries in every other
# book and missed the parenthesized-line-number convention of Sibylline
# entirely. Per-book verse counts in the coverage table below `# Session log`
# entry tell the story.
#
# The session-22 wheel: per-book convention detection + chapter-aware
# emission. Each book is dispatched to a convention handler that emits the
# verse stream with `# Chapter N` (or `# Name Chapter N`) markers between
# chapters; the downstream structural parser (`parse_pseudepigrapha_edition.py`,
# W-3) walks those markers to slice the book into chapters cleanly.
#
# Conventions, mapped per book in BOOK_CONVENTION below:
#   - flat:               no internal chapter divisions; one synthetic chapter
#                         (Aristeas's 322 §-sections; Pirké Aboth flatten
#                         per W-3 spec).
#   - chapter-verse-hdr:  running header carries `CHAPTER. V_LO-V_HI` or
#                         `CHAPTER. V_LO-CHAPTER. V_HI`. Detect chapter
#                         per-page from header; group pages by chapter; emit
#                         `# Chapter N` between groups. Verse-number-drop in
#                         body is a fallback boundary signal where header is
#                         missing.
#   - sibylline-paren:    Sibylline's parenthesized inline `(N)`, `(M)` line
#                         markers; printed Book/Fragment number from header
#                         becomes chapter label.
#   - adam-eve-roman:     Roman-numeral chapter markers mid-line (`vii. 1`,
#                         `xxv. 1`). Charles vol 2 prints both Apocalypse of
#                         Moses (Greek tradition) and Vita Adae et Evae (Latin
#                         tradition); we group chapter markers into two
#                         manuscript runs per Yoshi's session-22 call
#                         ("Two chapter ranges, prefixed labels").
#   - testaments-named:   Per-Testament reset; named chapters per Yoshi's
#                         session-22 call ("Reuben 1", "Reuben 2", ...,
#                         "Simeon 1", ...). Detection: the "THE TESTAMENT OF
#                         <NAME>" line at each new Testament's opening page;
#                         verse-number-drop within the Testament splits its
#                         chapters.
#   - ahikar-syriac:      Parallel-manuscript columns (Syriac A / Syriac B /
#                         Arabic / Armenian / Ethiopic / Greek). Yoshi's
#                         session-22 content-authority call: take Syriac A as
#                         primary, drop other columns. Detect column-label
#                         lines (`Syr. A`, `ARABIC`, `ARMENIAN`, etc.) and
#                         retain only Syriac content.
# ---------------------------------------------------------------------------

BOOK_CONVENTION = {
    "aristeas":            "flat",
    "adam-eve":            "adam-eve-roman",
    "martyrdom-isaiah":    "chapter-verse-hdr",
    "testaments-xii":      "testaments-named",
    "sibylline":           "sibylline-paren",
    "assumption-moses":    "chapter-verse-hdr",
    "2-enoch":             "chapter-verse-hdr",
    "2-baruch":            "chapter-verse-hdr",
    "3-baruch":            "chapter-verse-hdr",
    "4-ezra":              "chapter-verse-hdr",
    "psalms-solomon":      "chapter-verse-hdr",
    "4-maccabees":         "chapter-verse-hdr",
    "pirke-aboth":         "pirke-aboth-sayings",
    "ahikar":              "ahikar-syriac",
    "zadokite-fragments":  "chapter-verse-hdr",
}


# Header chapter+verse capture. Extends the session-21 verse-range capture
# (which threw away the chapter prefix) so we can track per-page chapter.
# Matches (after a trailing-anchor):
#   "1. 1-3. 6"  or  "1. 1—3. 6"   (multi-chapter page)  -> (1, 1, 3, 6)
#   "8. 1-15"                       (single-chapter page) -> (8, 1, 8, 15)
#   "4. 18—5, 3"                    (OCR-mangled comma)   -> (4, 18, 5, 3)
_HDR_CV_MULTI = re.compile(
    r"(\d{1,3})\.\s*(\d{1,3})\s*[-—]\s*(\d{1,3})[.,]\s*(\d{1,3})\s*$"
)
_HDR_CV_SINGLE = re.compile(
    r"(\d{1,3})\.\s*(\d{1,3})\s*[-—]\s*(\d{1,3})\s*$"
)


def _capture_header_chapter_verse(line: str) -> tuple[int, int, int, int] | None:
    """Capture (ch_start, v_start, ch_end, v_end) from a page-header line.

    Returns None if the line isn't a header or no chapter.verse range present.

    OCR-drift recovery for backward-span headers: if the multi-range capture
    yields ch_lo > ch_hi (impossible — chapter ranges only increase), the
    ch_lo digit is OCR-corrupted. The ch_hi digit is far more reliable
    (it's typically a small-magnitude end-of-page number); we correct ch_lo
    to ch_hi - 1 (the typical multi-chapter span on a single page is 1-2
    chapters). Example: ``IV EZRA 8. 35—4. 7`` reads as (8, 35, 4, 7);
    the canonical is ``IV EZRA 3. 35—4. 7`` (the 8 is OCR drift for 3),
    so we return (3, 35, 4, 7).
    """
    s = line.strip()
    if not s or len(s) > 140:
        return None
    if not re.search(r"[A-Z]{2,}", s):
        return None
    m = _HDR_CV_MULTI.search(s)
    if m:
        a, b, c, d = (int(m.group(1)), int(m.group(2)),
                      int(m.group(3)), int(m.group(4)))
        if a > c:
            # Backward span — fix ch_lo to ch_hi - 1
            a = max(1, c - 1)
        return (a, b, c, d)
    m = _HDR_CV_SINGLE.search(s)
    if m:
        ch = int(m.group(1))
        return (ch, int(m.group(2)), ch, int(m.group(3)))
    return None


def _detect_page_chapter(page_text: str) -> int | None:
    """Return the chapter the page primarily covers (from header), or None."""
    for ln in page_text.split("\n")[:6]:
        cv = _capture_header_chapter_verse(ln)
        if cv is not None:
            return cv[0]
    return None


def _detect_page_chapter_range(page_text: str) -> tuple[int, int] | None:
    """Return the (ch_lo, ch_hi) range of chapters this page covers, or None.

    A page-header like `IV EZRA 6. 7—9. 1` returns (6, 9): the page covers
    chapters 6 through 9 inclusive. A single-chapter header `IV EZRA 8. 1-18`
    returns (8, 8). Used by the multi-chapter-aware extractor to split a page
    body across multiple chapter outputs.
    """
    for ln in page_text.split("\n")[:6]:
        cv = _capture_header_chapter_verse(ln)
        if cv is not None:
            return (cv[0], cv[2])
    return None


def _smooth_chapter_drift(chapters: list[int | None]) -> list[int | None]:
    """Forward-monotonic smoothing of per-page chapter numbers.

    The session-22 calibration revealed that Charles vol 2 OCR mangles digits
    consistently across MULTIPLE adjacent pages (e.g., ``3`` rendered as ``8``
    or ``13`` as ``18`` for every page covering chapters 3 / 13 — the digit
    confusion is systematic because the same source-typeface glyph is being
    misread the same way each time).

    Strategy: chapters in Charles's translated body MUST monotonically
    increase from the book's first chapter to its last (modulo small
    boundary-page overlaps where two chapters share a page). We walk pages
    forward; chapter only advances by +1 to +3 per page (typical chapter
    spans 5-30 pages). A detected reading higher than current+3 is treated
    as OCR drift and rejected (current value retained). A detected reading
    lower than current is treated as a chapter-overlap-on-boundary page and
    accepted only if it matches the running counter; backward jumps are
    rejected.

    The book's STARTING chapter is computed from the MINIMUM of the first
    few detected values (not the first detected value alone), to defend
    against an OCR-drift-up reading on the very first page (the briefing's
    classic ``IV EZRA 8. 1-18`` case where 8 was OCR drift for 3).

    Session-24 W-2.5a: fast-tick adaptive bypass. Books where chapters tick
    more than once per page on average (2 Enoch 73 ch / 39 pp; 2 Baruch 87 ch
    / 46 pp; 3 Baruch 17 ch / 9 pp; 4 Maccabees 18 ch / 20 pp) systematically
    fail the +3 forward-monotonic guard — adjacent pages legitimately read
    `12 → 18 → 24` (header chapters advance by ~5-6 per page) and ALL get
    rejected. For fast-tick books we bypass the forward-monotonic guard and
    trust the raw header chapter (the backward-span fix in
    `_capture_header_chapter_verse` already corrects OCR-mangled ch_lo per
    page); the only filter we keep is 3-neighbor isolated-spike rejection
    (reject a single-page chapter assignment that diverges sharply from both
    neighbors). Detection rule: `span(max_ch − min_ch) / page_count ≥ 0.8`
    — calibrated to clearly separate fast-tick books (ratio 1.5-2.0+) from
    standard-rate books like 4 Ezra (ratio ~0.2) and zadokite-fragments
    (~0.5).
    """
    n = len(chapters)
    if n == 0:
        return []
    detected = [c for c in chapters if c is not None]
    if not detected:
        return list(chapters)

    # ---- Fast-tick detection + adaptive bypass (W-2.5a) ----
    # Ratio threshold tuned at 0.4 to catch fast-tick books where header
    # detection partially fails (2 Enoch: detected ~15 of 73 unique chapter
    # values across 39 pages, span/n ≈ 0.49). Pure-standard books like 4
    # Ezra (12 ch / 63 pp, ratio ≈ 0.19) stay on the standard forward-
    # monotonic path.
    #
    # Per session-23 W-2.5a spec: trust raw header chapter (the backward-
    # span fix in _capture_header_chapter_verse already lands the right
    # chapter on each page) and apply ONLY 3-neighbor isolated-spike
    # rejection. An experimental forward-jump cap was tested but lost
    # chapter-count coverage on 2 Enoch (17 ch vs 20 ch without cap),
    # because the cap dropped page bodies that downstream
    # _split_page_body_by_verse_drop chunking would have spread across
    # multiple "wrongly-numbered" chapters that the structural parser
    # renumbers 1..N anyway. Spec-aligned implementation retained.
    #
    # Session-27 vol1-k-2: outlier-robust span. A single OCR misread (e.g.,
    # `5.` → `35.` on 1 Esd p57) inflates raw max-min span and falsely
    # triggers fast-tick bypass on standard-rate books. Replace
    # `max(detected) - min(detected)` with a trimmed span: drop the top and
    # bottom 10% (or 1 from each end on small samples) before computing the
    # spread. Genuine fast-tick books spread values across many chapter
    # numbers, so trimming barely affects their ratio (still ≥ 0.4). A
    # single-page outlier loses its grip on the detection.
    sorted_det = sorted(detected)
    m = len(sorted_det)
    if m >= 10:
        trim = max(1, m // 10)
        robust_max = sorted_det[m - 1 - trim]
        robust_min = sorted_det[trim]
    elif m >= 5:
        # Trim 1 from each end on small samples.
        robust_max = sorted_det[m - 2]
        robust_min = sorted_det[1]
    else:
        robust_max = sorted_det[-1]
        robust_min = sorted_det[0]
    span = robust_max - robust_min
    if (span / max(n, 1)) >= 0.4:
        out: list[int | None] = list(chapters)
        # 3-neighbor isolated-spike rejection on the raw chapter list:
        # a page whose detected chapter is far from BOTH consistent
        # neighbors is OCR drift and gets snapped to the neighbor-
        # consensus value. "Consistent" neighbors differ by at most 3;
        # "far" means current diverges by 5+ from each neighbor.
        for i in range(1, n - 1):
            here = out[i]
            left = out[i - 1]
            right = out[i + 1]
            if here is None or left is None or right is None:
                continue
            if abs(left - right) <= 3 and abs(here - left) >= 5 and abs(here - right) >= 5:
                out[i] = (left + right) // 2 if left != right else left
        # Forward-fill None pages from prior detected reading
        last: int | None = None
        for i in range(n):
            if out[i] is None:
                out[i] = last
            else:
                last = out[i]
        return out

    # ---- Standard-rate path (unchanged from session 22) ----
    out: list[int | None] = []
    # Initial chapter: take the minimum of the first window of detected values
    window = [c for c in chapters[:5] if c is not None]
    cur: int | None = min(window) if window else None
    # Rejected-run recovery: when 3+ adjacent pages all detect the same OFF
    # value (consensus systematic OCR drift), promote those pages to the next
    # chapter retroactively. This handles the chapter-13 mangled-as-18 pattern
    # in 4-Ezra where the digit pair (1,3) consistently OCRs as (1,8).
    rejected_run: list[int] = []  # indices in out[] of recent rejections
    rejected_value: int | None = None
    for ch in chapters:
        if ch is None:
            out.append(cur)
            rejected_run = []
            rejected_value = None
            continue
        if cur is None:
            cur = ch
            out.append(cur)
            continue
        if ch > cur and ch - cur <= 3:
            cur = ch
            out.append(cur)
            rejected_run = []
            rejected_value = None
        elif cur - 1 <= ch <= cur:
            out.append(cur)
            rejected_run = []
            rejected_value = None
        else:
            # Rejected reading — log for consensus-drift recovery
            if rejected_value == ch:
                rejected_run.append(len(out))
            else:
                rejected_run = [len(out)]
                rejected_value = ch
            out.append(cur)
            if len(rejected_run) >= 3:
                # Promote to next chapter
                new_ch = cur + 1
                for idx in rejected_run:
                    out[idx] = new_ch
                cur = new_ch
                rejected_run = []
                rejected_value = None
    return out


def _roman_to_int(r: str) -> int:
    """Convert a lowercase roman numeral (i, v, x, l, c) to int.

    Raises ValueError if the input isn't valid roman characters.
    """
    r = r.lower()
    table = {'i': 1, 'v': 5, 'x': 10, 'l': 50, 'c': 100}
    if not r or not all(c in table for c in r):
        raise ValueError(f"not roman: {r!r}")
    total = 0
    prev = 0
    for c in reversed(r):
        val = table[c]
        if val < prev:
            total -= val
        else:
            total += val
            prev = val
    return total


# Verse marker normalization. Charles's body uses left-margin marginal verse
# numbers that surface in OCR'd text as standalone integers preceding a
# paragraph or, more often, as integers immediately preceding the first word
# of a paragraph after a newline.
#
# We extract verse-numbered chunks and emit them in the convention:
#   N.  body text on a single physical line
# matching the existing-edition verse shape consumed by `seed.py`.

def _normalize_to_verse_lines(body_text: str, recover_v1: bool = False,
                              expected_start: int = 1) -> str:
    """Re-flow body text into one-verse-per-line shape.

    Strategy: verse markers are reliable ONLY at PDF-line start. We walk the
    text line-by-line, treating any line that begins with "<1-3 digits><space>"
    AND whose digit fits the monotonic-increase pattern as the start of a new
    verse. All other lines are continuation of the current verse.

    This is more conservative than the previous mid-line / sentence-boundary
    detection — it gives up some pages where OCR has merged the marginal
    verse number onto the previous line, in exchange for robustness against
    in-body digit false-positives.

    Session-24 W-2.5e: optional verse-1 recovery. When `recover_v1=True`, any
    substantial content (>= 30 chars after collapsing) that precedes the
    first detected verse-marker is treated as verse 1's body and synthesized
    as an emitted verse — IF the first detected marker is verse 2 or higher
    (i.e., the page-header v_lo claims this chapter starts at v=1 but the
    OCR lost the marginal "1" marker, fusing v=1's body onto the prior
    page's tail). Disabled by default to preserve flat-book behavior
    (Aristeas's §-section pilot starts at §6, not §1, and would mis-synthesize
    a verse 1 from prior-page residue). v1-recovery only fires when
    `expected_start == 1` — i.e., we're nominally at a chapter beginning;
    mid-chapter pilot ranges (expected_start>1) suppress v1 synthesis.

    Session-27 vol1-k-1: `expected_start` kwarg. When the chapter body's
    content begins partway into the chapter (e.g., a pilot extraction range
    that opens mid-chapter at v=39), the initial-expected verse number can
    be passed in. Without this, the cand-expected window (`cand - expected
    <= 20`) rejects the first 20+ markers and collapses the chapter to a
    single synthesized recovery-verse. Backward-compatible default of 1
    matches prior behavior for full-book extractions.
    """
    lines = body_text.split("\n")
    verses = []  # list of (num, [body_lines])
    current_num = 0
    current_body = []
    pre_first_buffer: list[str] = []  # content before any digit-marker, when recover_v1
    expected = expected_start
    # Verse-marker patterns. The clean form is "<digit(s)><space>". The OCR
    # commonly mangles three-digit verse numbers: it can drop the leading
    # digit (103 → 03), turn the final digit into a bracket (161 → 16]), or
    # produce other one-off corruptions. We accept both clean and bracket-
    # corrupted forms as candidates, then disambiguate by the monotonic-
    # increase rule below.
    line_start = re.compile(r"^\s*([0-9]{1,3})[\]\)\}]?\s+(.*)$")

    for ln in lines:
        if not ln.strip():
            # blank line — preserve as body separator if inside a verse
            if current_num > 0:
                current_body.append("")
            continue
        m = line_start.match(ln)
        if m:
            cand = int(m.group(1))
            # OCR-drift recovery: if cand is < expected but close to (expected
            # mod 100), it may be a three-digit number with the hundreds digit
            # dropped (e.g., expected=103, cand=03 → match). Snap to expected.
            if cand < expected and (expected - cand) >= 100 and (expected % 100) == cand:
                cand = expected
            # Accept if cand fits the monotonic-increase chain. Tolerance is
            # widened to +20 to ride over OCR-lost verse markers (a few
            # verses' worth of skipped numbering) without abandoning the
            # parse for the rest of the book.
            if cand == expected or (cand > expected and cand - expected <= 20):
                # W-2.5e: synthesize verse 1 from pre-first-marker content
                # when recover_v1 is enabled, the first marker found is v>=2,
                # and the buffered pre-content is substantial.
                # vol1-k-1: only synthesize when expected_start == 1; mid-
                # chapter ranges (expected_start > 1) suppress v1 recovery.
                if (recover_v1 and expected_start == 1
                        and current_num == 0 and cand >= 2
                        and pre_first_buffer):
                    v1_text = " ".join(p.strip() for p in pre_first_buffer if p.strip())
                    v1_text = re.sub(r"\s+", " ", v1_text).strip()
                    v1_text = _clean_inline_artifacts(v1_text)
                    if len(v1_text) >= 30:
                        verses.append((1, [v1_text]))
                # New verse boundary
                if current_num > 0:
                    verses.append((current_num, current_body))
                current_num = cand
                current_body = [m.group(2)]
                expected = cand + 1
                pre_first_buffer = []
                continue
        # not a verse boundary — append to current verse body, or buffer
        # for verse-1 recovery if we haven't seen any marker yet.
        if current_num > 0:
            current_body.append(ln.strip())
        elif recover_v1:
            pre_first_buffer.append(ln)
    if current_num > 0:
        verses.append((current_num, current_body))

    out_lines = []
    for num, body_parts in verses:
        body = " ".join(p for p in body_parts if p)
        body = re.sub(r"\s+", " ", body).strip()
        # Fix ii (session 21): strip pipes, backslashes, underscore-runs, and
        # leading-glyph residue from each assembled verse body.
        body = _clean_inline_artifacts(body)
        out_lines.append(f"{num}.  {body}")
    return "\n".join(out_lines)


# ---------------------------------------------------------------------------
# Per-convention extractors (session 22 — W-2 hardening). Each takes the raw
# per-page text list (PRE-strip — they handle stripping internally where they
# need access to running headers for chapter detection) and returns the
# extracted body in the chapter-aware shape:
#
#   # Chapter <N>
#
#   1.  verse 1
#   2.  verse 2
#   ...
#
#   # Chapter <N+1>
#
#   1.  verse 1
#   ...
#
# ---------------------------------------------------------------------------


def _strip_clean_page(page_text: str) -> str:
    """Apply the page-level strip-and-clean pipeline shared by all conventions."""
    page_text = _strip_page_headers(page_text)
    page_text = _strip_trailing_footnote_block(page_text)
    page_text = _normalize_greek_drift(page_text)
    return page_text


def _extract_flat_book(pages: list[str]) -> str:
    """flat convention: one synthetic chapter, monotonic §-section sequence.

    Used for Aristeas (322 §-sections) and Pirké Aboth (6 traditional
    chapters collapsed to a single flat sequence per the W-3 spec). No
    `# Chapter N` markers emitted; the downstream structural parser detects
    absence and creates one synthetic chapter per book.
    """
    stripped = [_strip_clean_page(p) for p in pages]
    body = "\n".join(stripped)
    body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
    body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
    return _normalize_to_verse_lines(body)


def _extract_chapter_verse_hdr_book(pages: list[str]) -> str:
    """chapter-verse-hdr convention: page-header `CH. V_LO-V_HI` drives chapter.

    Captures per-page chapter RANGE (ch_lo, ch_hi) from the running header
    BEFORE the strip pipeline destroys it; this is critical because Charles
    vol 2 frequently runs 2-4 chapters across a single page (notably 2 Baruch
    with 87 chapters in 45 pages, and 2 Enoch with 73 chapters in 38 pages).

    Strategy: walk pages in order. Within each page, the body's
    verse-number-drop signal is the AUTHORITY for chapter boundaries; the
    header's chapter-range is used to NUMBER the chapters correctly. When
    header and body disagree on chapter count, we prefer body (header digits
    are far more OCR-mangled than body verse-number markers).

    Per-chapter output: `# Chapter N` header + flat-monotonic-numbered verse
    lines beneath. Verse counter resets per chapter.
    """
    # Detect chapter range per page BEFORE stripping. vol1-k-1: also capture
    # the full CV 4-tuple (ch_lo, v_lo, ch_hi, v_hi) so we can thread per-
    # chapter starting-verse numbers through to _normalize_to_verse_lines.
    page_cv: list[tuple[int, int, int, int] | None] = []
    for p in pages:
        cv = None
        for ln in p.split("\n")[:6]:
            cv = _capture_header_chapter_verse(ln)
            if cv is not None:
                break
        page_cv.append(cv)
    page_ranges = [(c[0], c[2]) if c is not None else None for c in page_cv]
    # Apply forward-monotonic smoothing to the start-chapter of each range
    raw_starts = [r[0] if r else None for r in page_ranges]
    smoothed_starts = _smooth_chapter_drift(raw_starts)
    # Reattach smoothed starts to ranges (keeping original hi where present)
    smoothed_ranges: list[tuple[int, int] | None] = []
    for orig, smoothed_lo in zip(page_ranges, smoothed_starts):
        if smoothed_lo is None:
            smoothed_ranges.append(None)
        elif orig is None:
            # No header on this page; assume single-chapter continuation
            smoothed_ranges.append((smoothed_lo, smoothed_lo))
        else:
            orig_lo, orig_hi = orig
            # If the smoother changed lo (OCR-correction), recompute hi by
            # preserving the original span width (hi - lo) when reasonable
            span = orig_hi - orig_lo
            if 0 <= span <= 6:
                smoothed_ranges.append((smoothed_lo, smoothed_lo + span))
            else:
                smoothed_ranges.append((smoothed_lo, smoothed_lo))

    # Strip
    stripped = [_strip_clean_page(p) for p in pages]

    # If no chapters detected at all, fall back to flat
    if all(r is None for r in smoothed_ranges):
        body = "\n".join(stripped)
        body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
        body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
        return _normalize_to_verse_lines(body)

    # Forward-fill: a None page inherits the previous page's hi chapter as a
    # continuation (single-chapter page in the chapter the prior page ended in)
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

    # vol1-k-1: per-chapter starting-verse capture. For each chapter, record
    # the v_lo we should expect when normalising its body to verse lines.
    # Rule: the page's first chapter (smoothed ch_lo) gets the page-header
    # v_lo IF smoothing didn't override the original ch_lo. All later
    # chapters on the same multi-chapter page start at v=1 (verse-drop
    # splitting always restarts counters at the chapter boundary).
    chapter_v_lo: dict[int, int] = {}
    for r, cv in zip(filled, page_cv):
        if r is None:
            continue
        ch_lo, ch_hi = r
        if ch_lo not in chapter_v_lo:
            if cv is not None and cv[0] == ch_lo:
                # Smoothing left ch_lo intact — trust header v_lo.
                chapter_v_lo[ch_lo] = cv[1]
            else:
                # Forward-filled page (no header) or smoothing-corrected
                # ch_lo (header v_lo applies to a different chapter number);
                # safe default is v=1.
                chapter_v_lo[ch_lo] = 1
        # Later chapters on a multi-chapter page restart at v=1.
        for c in range(ch_lo + 1, ch_hi + 1):
            if c not in chapter_v_lo:
                chapter_v_lo[c] = 1

    # Accumulate body per chapter, walking pages in order and splitting
    # multi-chapter pages by body verse-drop
    chapter_bodies: dict[int, list[str]] = {}
    chapter_order: list[int] = []  # first-appearance order

    for r, body in zip(filled, stripped):
        if r is None:
            continue
        ch_lo, ch_hi = r
        if ch_lo == ch_hi:
            # Single-chapter page: whole body to chapter ch_lo
            chapter_bodies.setdefault(ch_lo, [])
            if ch_lo not in chapter_order:
                chapter_order.append(ch_lo)
            chapter_bodies[ch_lo].append(body)
        else:
            # Multi-chapter page: split body by verse-drop into pieces, then
            # assign pieces to chapters in order ch_lo, ch_lo+1, ..., ch_hi
            pieces = _split_page_body_by_verse_drop(body)
            # If we got fewer pieces than chapters in range, pad with empty;
            # if more, merge extras into the last chapter
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
            # If we got fewer pieces than chapters, the remaining chapters
            # don't get content on this page (they'll get content from
            # subsequent pages or be empty)

    # Emit chapters in numeric order. recover_v1=True (W-2.5e): each chapter
    # block runs through verse-1 recovery — when the OCR loses the marginal
    # "1" marker at chapter open and the v=1 body fuses onto prior content,
    # we re-synthesize verse 1 from the pre-first-marker body if it's
    # substantial (>= 30 chars). The header chapter-range tells us this is a
    # new chapter so the pre-first-marker content is genuinely chapter-body.
    out_blocks = []
    for ch in sorted(chapter_bodies.keys()):
        body = "\n".join(chapter_bodies[ch])
        body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
        body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
        # vol1-k-1: thread per-chapter expected_start. Default 1 = legacy
        # behavior. Mid-chapter pilot ranges get v_lo from header capture.
        v_start = chapter_v_lo.get(ch, 1)
        verses = _normalize_to_verse_lines(body, recover_v1=True,
                                           expected_start=v_start)
        if verses.strip():
            out_blocks.append(f"# Chapter {ch}\n\n{verses}")
    return "\n\n".join(out_blocks)


def _split_page_body_by_verse_drop(body_text: str) -> list[str]:
    """Split a single page's body into chunks at verse-number-drop boundaries.

    Returns a list of body-text chunks; each chunk's verse numbers run
    monotonically increasing. A drop from a high verse number (>=4) back
    to a low verse number (<=3) signals a chapter boundary within the page.
    """
    line_start = re.compile(r"^\s*([0-9]{1,3})[\]\)\}]?\s+")
    lines = body_text.split("\n")
    chunks: list[list[str]] = [[]]
    expected = 1
    prev_was_high = False
    for ln in lines:
        m = line_start.match(ln)
        if m:
            cand = int(m.group(1))
            if cand <= 3 and prev_was_high:
                # Chapter break — open a new chunk
                chunks.append([])
                expected = cand + 1
                prev_was_high = False
            elif cand >= expected - 1 and cand - expected <= 20:
                expected = cand + 1
                if cand >= 4:
                    prev_was_high = True
        chunks[-1].append(ln)
    return ["\n".join(c) for c in chunks if c]


# Sibylline page-header: "THE SIBYLLINE BOOKS. <BOOK_OR_FRAG> <ROMAN>, Lines NN-NN"
# OCR drift mangles `Book` -> `Βοοκ`, `Fragment` -> `Fracmenr`, `Lines` -> `Lᴜes`
# or `Lives`. Detection requires three signals: Book-or-Fragment keyword
# (loose), roman numeral, line-range numerals.

def _parse_sibylline_header(line: str) -> tuple[str, int, int] | None:
    """Return (label, line_lo, line_hi) from a Sibylline page header, or None.

    label: "Book III" / "Fragment III" / etc.
    """
    s = line.strip()
    if not s or len(s) > 160:
        return None
    is_frag = bool(re.search(r"FRA[GC]M?[EH][NR]?[RT]", s, re.IGNORECASE))
    has_book = bool(re.search(r"B[oOοΟ]+K", s, re.IGNORECASE))
    if not (is_frag or has_book):
        return None
    # Roman numeral after the Book/Fragment keyword
    rm = re.search(r"\b([IVXLM]{1,5})\b", s)
    if not rm:
        return None
    roman = rm.group(1).upper()
    try:
        _roman_to_int(roman)
    except ValueError:
        return None
    lr = re.search(r"(\d{1,4})\s*[-—]\s*(\d{1,4})", s)
    if not lr:
        return None
    lo, hi = int(lr.group(1)), int(lr.group(2))
    if lo == 0 or hi == 0 or hi < lo or (hi - lo) > 1500:
        return None
    label = ("Fragment " if is_frag else "Book ") + roman
    return (label, lo, hi)


def _normalize_sibylline_chapter(body_text: str) -> str:
    """Parse parenthesized inline `(N)` line-numbers in body as verse markers.

    Pattern: `(N)` marks the start of verse N; text from `(N)` to just before
    the next `(M)` is verse N's body. Pre-first-marker text is treated as a
    tail-continuation from the prior chapter and discarded here.

    Session-24 W-2.5c: backward-jump tolerance. Per Decisions §12, the
    sibylline-paren convention preserves Charles's original line numbering
    rather than renumbering to 1-N per chapter (matches scholarly citation
    form Sib.Or. 3.46). The OCR sometimes emits line markers out of order
    on parallel-column/wrap-around pages — e.g., Fragment III runs
    `8..38, 49, 45, 46, 47, 48` where the 49 marker landed early. The
    session-22 monotonic-tolerance filter (`num < expected - 5`) rejected
    these out-of-order markers and discarded their verses. Since the
    downstream structural parser handles non-monotonic verse numbers
    cleanly (each verse is keyed by its number, not by position), we now
    accept every detected parenthesized marker that's a plausible line
    number (1..2000) and let the parser sort verses by their N. A duplicate
    line number lands a single verse keyed by that number; the latter body
    wins. This recovers the ~10 verses across Fragment III + an unknown
    additional handful elsewhere in the sibylline output.
    """
    body_text = _clean_inline_artifacts(body_text)
    body_text = re.sub(r"\s+", " ", body_text).strip()
    parts = re.split(r"\((\d{1,4})\)", body_text)
    # parts: [pre, num1, body1, num2, body2, ...]
    if len(parts) < 3:
        return ""
    out = []
    expected: int | None = None
    for i in range(1, len(parts), 2):
        try:
            num = int(parts[i])
        except (TypeError, ValueError):
            continue
        body = parts[i + 1].strip() if i + 1 < len(parts) else ""
        # Range sanity check
        if num < 1 or num > 2000:
            continue
        # W-2.5c soft filter: accept forward jumps freely (OCR-lost markers
        # leave gaps that should not block downstream markers) and accept
        # backward jumps up to 30 lines (covers Fragment III's 49→40
        # out-of-order recovery and similar OCR-flow inversions on
        # parallel-column pages). Reject larger backward jumps — those are
        # footnote-body line-number references (e.g., `(23) See line 23
        # above`) that remained after the page strip pipeline, not body
        # verse markers.
        if expected is not None and num < expected - 30:
            continue
        body = _clean_inline_artifacts(body)
        body = re.sub(r"\s+", " ", body).strip()
        if body:
            out.append(f"{num}.  {body}")
        # Track the highest forward position we've reached (not just last
        # accepted) so subsequent backward-jump checks measure against the
        # body's flow rather than a transient backward jump's resting point.
        if expected is None or num > expected:
            expected = num + 1
    return "\n".join(out)


def _extract_sibylline_book(pages: list[str]) -> str:
    """sibylline-paren convention: parenthesized line-numbers + Book-from-header.

    Per-page header carries `Βοοκ III, Lines 634-696` or `Fracmenr III, Lines
    8-49` (with OCR drift). Group pages by Book/Fragment label; within each
    chapter, parse `(N)` parenthesized markers as verse numbers (Sibylline
    preserves original line numbering, so verse N starts at the printed N
    rather than renumbering to 1).
    """
    # Detect per-page sibylline label BEFORE stripping
    page_labels = []
    for p in pages:
        lbl = None
        for ln in p.split("\n")[:5]:
            hdr = _parse_sibylline_header(ln)
            if hdr is not None:
                lbl = hdr[0]
                break
        page_labels.append(lbl)

    # Forward-fill
    last_lbl = None
    filled = []
    for lbl in page_labels:
        if lbl is not None:
            last_lbl = lbl
        filled.append(last_lbl)

    # Strip
    stripped = [_strip_clean_page(p) for p in pages]

    # Group by label
    groups: list[tuple[str | None, list[str]]] = []
    cur_lbl, cur_pages = None, []
    for lbl, body in zip(filled, stripped):
        if lbl != cur_lbl:
            if cur_pages:
                groups.append((cur_lbl, cur_pages))
            cur_lbl, cur_pages = lbl, []
        cur_pages.append(body)
    if cur_pages:
        groups.append((cur_lbl, cur_pages))

    out = []
    for lbl, page_bodies in groups:
        if lbl is None:
            continue
        body = "\n".join(page_bodies)
        verses = _normalize_sibylline_chapter(body)
        if verses.strip():
            out.append(f"# Chapter {lbl}\n\n{verses}")
    return "\n\n".join(out)


def _extract_adam_eve_book(pages: list[str]) -> str:
    """adam-eve-roman convention: Roman-numeral chapter markers, two-MS split.

    Charles vol 2 prints both Apocalypse of Moses (Greek, chs i-xliii) and
    Vita Adae et Evae (Latin, chs i-li) in the combined Adam-Eve section,
    partly in parallel layout. Detection scheme:
      1. Scan body for Roman-numeral chapter markers `\b[ivxl]{1,4}\. \d+`
      2. Walk markers in document order; when a high chapter (>=10) is
         followed by a low chapter (<=3), treat that as the manuscript
         transition (Apoc. Moses -> Vita Adae)
      3. Emit chapters prefixed with the manuscript label per Yoshi's call

    The session-22 ship is a first-cut split; the parallel-text OCR layout
    makes perfect manuscript attribution unreliable, so the boundary file
    flags this as needing a refinement pass.
    """
    stripped = [_strip_clean_page(p) for p in pages]
    body = "\n".join(stripped)
    body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
    body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
    body = _clean_inline_artifacts(body)

    # Roman-numeral chapter marker regex: lowercase roman + period + space + digit
    # Match: vii. 1 / xxv. 1 / xlix. 1
    rm = re.compile(r"(?<![A-Za-z])([ivxl]{1,5})\.\s+(\d{1,3})(?=\s)", re.IGNORECASE)
    markers = []
    for m in rm.finditer(body):
        roman_tok = m.group(1).lower()
        try:
            ch_num = _roman_to_int(roman_tok)
        except ValueError:
            continue
        if ch_num < 1 or ch_num > 60:
            continue
        try:
            v_num = int(m.group(2))
        except ValueError:
            continue
        if v_num < 1 or v_num > 100:
            continue
        markers.append((m.start(), m.end(), ch_num, v_num))

    if not markers:
        # No markers — fall back to flat
        return _normalize_to_verse_lines(body)

    # Session-24 W-2.5f: multi-transition manuscript-split heuristic.
    # Charles vol 2's Adam-Eve section interleaves Apocalypse of Moses (Greek
    # tradition) and Vita Adae et Evae (Latin tradition) in parallel-text
    # layout. OCR flattens parallel columns into one stream that can show
    # multiple high→low chapter transitions (each restart marks a switch
    # back to the other manuscript). We now collect EVERY high→low transition
    # and alternate manuscript labels across the splits, starting with
    # Apoc. Moses (which Charles prints first in his combined section).
    # A still-imperfect heuristic — perfect attribution would require column-
    # aware OCR reflow — but better than the single-transition session-22
    # approach for books with three or more manuscript weave points.
    transitions: list[int] = []
    for i in range(1, len(markers)):
        prev_ch = markers[i - 1][2]
        here_ch = markers[i][2]
        if prev_ch >= 10 and here_ch <= 3:
            transitions.append(i)

    labels = ["Apoc. Moses", "Vita Adae"]
    manuscripts: list[tuple[str, list[tuple[int, int, int, int]]]] = []
    start = 0
    for ti, t_idx in enumerate(transitions):
        manuscripts.append((labels[ti % 2], markers[start:t_idx]))
        start = t_idx
    manuscripts.append((labels[len(transitions) % 2], markers[start:]))

    out = []
    for ms_label, ms_markers in manuscripts:
        if not ms_markers:
            continue
        # Group markers by chapter number; within each chapter, capture verse
        # body as text from marker.end() to next-marker.start() (or body end)
        chapter_groups: dict[int, list[tuple[int, str]]] = {}
        for i, mk in enumerate(ms_markers):
            ch = mk[2]
            v_num = mk[3]
            next_start = ms_markers[i + 1][0] if i + 1 < len(ms_markers) else len(body)
            v_body = body[mk[1]:next_start].strip()
            v_body = _clean_inline_artifacts(v_body)
            v_body = re.sub(r"\s+", " ", v_body).strip()
            chapter_groups.setdefault(ch, []).append((v_num, v_body))
        # Emit chapters in numeric order
        for ch in sorted(chapter_groups.keys()):
            verses = chapter_groups[ch]
            lines = [f"# {ms_label} Chapter {ch}", ""]
            for v_num, v_body in verses:
                if v_body:
                    lines.append(f"{v_num}.  {v_body}")
            out.append("\n".join(lines))
    return "\n\n".join(out)


def _extract_testaments_book(pages: list[str]) -> str:
    """testaments-named convention: per-Testament reset, named chapters.

    The running page header for every page in this book is just
    "THE TESTAMENTS OF THE TWELVE PATRIARCHS" (no chapter info). The signal
    that a new Testament begins is the SECOND line on the first page of each
    Testament: "THE TESTAMENT OF <NAME>, <epithet>". Detect that line,
    use NAME as the chapter-label prefix.

    Within each Testament, verse numbers count up monotonically and split
    into chapters when the verse number drops back to ~1. We use the
    verse-drop signal to slice each Testament into its sub-chapters.
    """
    testament_names = [
        "REUBEN", "SIMEON", "LEVI", "JUDAH", "ISSACHAR", "ZEBULUN",
        "DAN", "NAPHTALI", "GAD", "ASHER", "JOSEPH", "BENJAMIN",
    ]
    test_re = re.compile(
        r"THE\s+TESTAMENT\s+OF\s+(" + "|".join(testament_names) + r")\b",
        re.IGNORECASE,
    )

    # Detect per-page testament from the title-header line (first 6 lines)
    page_testaments: list[str | None] = []
    for p in pages:
        found = None
        for ln in p.split("\n")[:6]:
            m = test_re.search(ln)
            if m:
                found = m.group(1).capitalize()
                break
        page_testaments.append(found)

    # Forward-fill
    last_t = None
    filled: list[str | None] = []
    for t in page_testaments:
        if t is not None:
            last_t = t
        filled.append(last_t)

    # Strip
    stripped = [_strip_clean_page(p) for p in pages]

    if all(t is None for t in filled):
        body = "\n".join(stripped)
        body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
        return _normalize_to_verse_lines(body)

    # Group consecutive pages by Testament
    groups: list[tuple[str | None, list[str]]] = []
    cur_t, cur_pages = None, []
    for t, body in zip(filled, stripped):
        if t != cur_t:
            if cur_pages:
                groups.append((cur_t, cur_pages))
            cur_t = t
            cur_pages = []
        cur_pages.append(body)
    if cur_pages:
        groups.append((cur_t, cur_pages))

    # Session-24 W-2.5d (ii): end-of-Benjamin boundary. After Benjamin's
    # Testament closes, Charles vol 2 prints Appendices I & II (Aramaic Levi
    # apparatus + Hebrew Naphtali manuscript) which carry "THE TESTAMENT OF
    # NAPHTALI" and "THE TESTAMENT OF LEVI" title headers in their body that
    # the page-by-page scan above re-detects, producing duplicate
    # "Naphtali Chapter 1..12" + "Levi Chapter 1..2" blocks after Benjamin in
    # the emission. Per the session-21 boundary-page calibration directive
    # "drops Appendices I & II (Aramaic Levi apparatus)" and per Yoshi's
    # session-24 W-2.5d content-authority call (DROP), we truncate the
    # groups list after the first Benjamin block: anything after Benjamin
    # is appendix material outside the canonical Testaments of the XII
    # Patriarchs scope.
    benjamin_idx = None
    for i, (t, _) in enumerate(groups):
        if t == "Benjamin":
            benjamin_idx = i
            break
    if benjamin_idx is not None:
        groups = groups[: benjamin_idx + 1]

    out = []
    for t, page_bodies in groups:
        if t is None:
            continue
        body = "\n".join(page_bodies)
        body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
        body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
        for ch_num, verse_block in _split_body_into_chapters_by_verse_drop(body):
            out.append(f"# {t} Chapter {ch_num}\n\n{verse_block}")
    return "\n\n".join(out)


def _split_body_into_chapters_by_verse_drop(body_text: str) -> list[tuple[int, str]]:
    """Walk verse-line numbers in body; when verse N drops to ~1 from a higher
    number, treat it as a new chapter boundary.

    Returns a list of (chapter_num, normalized_verse_lines_string).
    Chapters are numbered 1, 2, 3, ... starting from 1.

    Session-24 W-2.5d (i) note: an experimental paragraph-break validator
    (require blank line before chapter-1 candidate) over-rejected legitimate
    intra-testament breaks because the OCR/strip pipeline frequently loses
    visual paragraph-break cues across page borders. The validator was
    reverted; the bulk of the Naphtali over-detection (21 ghost chapters →
    1 ghost chapter) was addressed by W-2.5d (ii)'s end-of-Benjamin
    truncation, which drops the Hebrew Naphtali + Aramaic Levi appendix
    blocks entirely. Naphtali's remaining single ghost chapter is
    acceptable per the canonical-8 vs detected-9 trade-off.
    """
    line_start = re.compile(r"^\s*([0-9]{1,3})[\]\)\}]?\s+(.*)$")
    lines = body_text.split("\n")

    # First pass: identify chapter boundary positions by walking verse numbers
    chapter_starts = [0]  # line indices where each chapter begins
    expected = 1
    for i, ln in enumerate(lines):
        m = line_start.match(ln)
        if not m:
            continue
        cand = int(m.group(1))
        # Chapter break: candidate is low (<=3) AND previous expected was high (>=5)
        if cand <= 3 and expected >= 5:
            if i != chapter_starts[-1]:
                chapter_starts.append(i)
            expected = cand + 1
        elif cand >= expected - 1 and cand - expected <= 20:
            expected = cand + 1

    chapter_starts.append(len(lines))

    out = []
    for ch_idx in range(len(chapter_starts) - 1):
        chunk = "\n".join(lines[chapter_starts[ch_idx]:chapter_starts[ch_idx + 1]])
        # W-2.5e: recover_v1 within each testament chapter (chapter splits
        # were established by the verse-drop scan above; each chunk
        # legitimately starts at verse 1 of its sub-chapter).
        verses = _normalize_to_verse_lines(chunk, recover_v1=True)
        if verses.strip():
            out.append((ch_idx + 1, verses))
    return out


def _extract_ahikar_syriac_book(pages: list[str]) -> str:
    """ahikar-syriac convention: parallel-column manuscript apparatus, keep Syriac.

    Yoshi's session-22 content-authority call: take Syriac A as primary.
    Drop all Syr. B / Arabic / Armenian / Ethiopic / Greek column text.

    Implementation: state machine over each page's lines. Column-label lines
    (`Syr. A`, `ARABIC VERSION`, `ARMENIAN`, `ETHIOPIC`, `GREEK`, etc.)
    toggle whether subsequent lines are kept (Syriac) or dropped. Chapter is
    detected from the page-header `STORY OF AHIKAR <CH>. <V>` prefix.
    """
    # Column-label patterns
    syriac_re = re.compile(
        r"^\s*(?:Syr\.?\s*A|Syr\.?\s*[AB]\b|SYRIAC|Syr\.?\b|ΞΥΕΙΑΟ)\.?\s*$",
        re.IGNORECASE,
    )
    other_col_re = re.compile(
        r"^\s*(?:Syr\.?\s*B|ARABIC(?:\s+VERSION)?|ARMENIAN|ARMEN\.?|"
        r"ETHIOPIC|ETHIOP\.?|GREEK|GR\.?|Arm\.?|Arab\.?|Eth\.?)\.?\s*$",
        re.IGNORECASE,
    )
    chapter_hdr_re = re.compile(
        r"\bSTORY\s+OF\s+AHIKAR\s+(\d+)\.\s*(\d+)", re.IGNORECASE
    )

    body_chunks: list[tuple[int | None, str]] = []
    current_chapter: int | None = None

    for page_text in pages:
        # Detect chapter from running header BEFORE strip
        for ln in page_text.split("\n")[:5]:
            m = chapter_hdr_re.search(ln)
            if m:
                current_chapter = int(m.group(1))
                break

        # Now strip headers/footnotes/Greek drift
        page_text = _strip_clean_page(page_text)

        # Walk lines as state machine: keep only Syriac-column lines.
        # Default: keep (in case page opens with body before any column label).
        in_syriac = True
        kept = []
        for ln in page_text.split("\n"):
            s = ln.strip()
            if not s:
                if in_syriac:
                    kept.append("")
                continue
            # Toggle on column-label lines
            if other_col_re.match(s):
                in_syriac = False
                continue
            if syriac_re.match(s):
                in_syriac = True
                continue
            # Skip pure-separator artifacts
            if re.match(r"^[\|\\/\-_·\.]+$", s):
                continue
            if in_syriac:
                kept.append(ln)
        body_chunks.append((current_chapter, "\n".join(kept)))

    # Group by chapter
    groups: list[tuple[int | None, list[str]]] = []
    cur_ch, cur_body = None, []
    for ch, body in body_chunks:
        if ch != cur_ch:
            if cur_body:
                groups.append((cur_ch, cur_body))
            cur_ch, cur_body = ch, []
        cur_body.append(body)
    if cur_body:
        groups.append((cur_ch, cur_body))

    out = []
    for ch, body_pages in groups:
        if ch is None:
            continue
        body = "\n".join(body_pages)
        body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
        body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
        verses = _normalize_to_verse_lines(body)
        if verses.strip():
            out.append(f"# Chapter {ch}\n\n{verses}")
    return "\n\n".join(out)


# ---------------------------------------------------------------------------
# Pirké Aboth saying-detection (session 24 — W-2.5b)
#
# Pirké Aboth's print convention in Charles vol 2 (Herford 1925 reproduction)
# uses left-margin digit markers, but the OCR captures only ~15 of the ~120
# canonical sayings as `digit + period + space + capital` line starts. The
# remaining sayings flatten into the body of preceding verses, recognizable
# only by rabbinic-saying content cues (`R. <Name> said:`, `He used to say:`,
# `Rabban <Name> said:`, `<Name> b. <Patronym> said:`, `Ben <Name> said:`,
# `He said to them:`). The cues are highly consistent across the text because
# they map the structure of the Mishnah's chain-of-tradition exposition.
#
# Strategy: flatten the cleaned body to a single line, find every boundary
# position (digit-marker OR content-cue), merge near-duplicates (digit+cue at
# the same chapter boundary), sort by position, and slice the body at each
# boundary. Each slice becomes a sequentially-numbered saying. Per the W-3
# `flat` convention, pirke-aboth emits no `# Chapter N` markers — the
# downstream structural parser creates one synthetic chapter for the book.
# ---------------------------------------------------------------------------


_PIRKE_NAME_TOKEN = r"[A-Z][a-zA-Z']{1,18}(?:-[A-Z][a-zA-Z']{1,18})?"
# Patronym clause: " b. <Name>" or " ben <Name>"
_PIRKE_PATRON = r"(?:\s+(?:b\.|ben)\s+" + _PIRKE_NAME_TOKEN + r")?"
# Optional " of <Place>" clause; up to two place tokens (e.g. "of Chephar Hanania")
_PIRKE_OF = r"(?:\s+of\s+" + _PIRKE_NAME_TOKEN + r"(?:\s+" + _PIRKE_NAME_TOKEN + r")?)?"
# Optional honorific/qualifier clause: ", the deputy of the priests" / ", the small"
_PIRKE_HONORIFIC = r"(?:,\s*(?:the\s+[a-z]+(?:\s+of\s+the\s+[a-z]+)?|in\s+the\s+name\s+of\s+R\.\s+" + _PIRKE_NAME_TOKEN + r"))?"

_PIRKE_SAYING_CUE_RE = re.compile(
    r"(?<![A-Za-z\d])(?:"
    # R. <Name> [b. <Patron>] [of <Place>] [the <qualifier>] said
    r"R\.\s+" + _PIRKE_NAME_TOKEN + _PIRKE_PATRON + _PIRKE_OF + _PIRKE_HONORIFIC +
    r"(?:\s+(?:his\s+son|the\s+(?:son|priest|sandal-maker|Modiite|small|deputy)"
    r"(?:\s+of\s+(?:the\s+priests|[A-Z][a-zA-Z']+))?))?\s+said"
    # Rabban / Rabbi <Name> [b. <Patron>] [of <Place>] said
    r"|Rabb(?:an|i)\s+" + _PIRKE_NAME_TOKEN + _PIRKE_PATRON + _PIRKE_OF +
    r"(?:\s+the\s+(?:son\s+of\s+Rabbi\s+" + _PIRKE_NAME_TOKEN + r"(?:\s+the\s+Prince)?|Prince))?\s+said"
    # Ben <Name> said
    r"|Ben\s+" + _PIRKE_NAME_TOKEN + r"\s+said"
    # <Name> b. <Patron> [of <Place>] said
    r"|" + _PIRKE_NAME_TOKEN + r"\s+(?:b\.|ben)\s+" + _PIRKE_NAME_TOKEN + _PIRKE_OF +
    r"(?:\s+the\s+[A-Z][a-zA-Z']+)?\s+said"
    # "Simeon the Just" / "Antigonos of Socho" "received from" + later "said" — covered by " said" above where pattern allows
    # He used to say / He said to them
    r"|He\s+used\s+to\s+say"
    r"|He\s+said\s+to\s+them"
    r")\b"
)

# Digit-marker pattern for Pirké Aboth — `N. <Capital>` or `N <Capital>` at
# what was originally a line start, now flattened. Require capital letter
# follow so we don't catch dates inside sentences.
_PIRKE_DIGIT_RE = re.compile(
    r"(?<![A-Za-z\d.])(\d{1,3})\.?\s+(?=[A-Z‘’\"'])"
)


def _extract_pirke_aboth_book(pages: list[str]) -> str:
    """pirke-aboth-sayings convention: digit-marker + content-cue detection.

    Session-24 W-2.5b: enrich the previously flat 15-marker emission with
    rabbinic-saying content cues. Charles vol 2's Pirké Aboth carries ~120
    sayings in five chapters (per the Herford 1925 critical edition); the
    OCR preserves ~15 digit-marker line starts and flattens the rest into
    surrounding verse bodies. We re-detect saying boundaries by combining
    digit-marker positions with content-cue positions (`R. <Name> said:`,
    `He used to say:`, etc.) — see _PIRKE_SAYING_CUE_RE above for the full
    cue set.

    Sayings are renumbered 1..N sequentially. Per the W-3 `flat` convention
    spec, Pirké Aboth's chapter structure (Herford's five chapters) is NOT
    preserved — the canonical citation form is `Aboth N` referring to the
    Nth saying, not chapter:verse. The downstream structural parser creates
    one synthetic chapter and walks the sequential sayings as verses.
    """
    stripped = [_strip_clean_page(p) for p in pages]
    body = "\n".join(stripped)
    body = re.sub(r"\n\s*\n\s*\n+", "\n\n", body)
    body = re.sub(r"\b[Ss]ee\s+note(s)?\b[^.]*\.", "", body)
    body = _clean_inline_artifacts(body)
    # Flatten to one line; we'll boundary-detect over the flat stream
    flat = re.sub(r"\s+", " ", body).strip()

    # Collect boundary positions. Each entry: (position, source)
    boundaries: list[tuple[int, str]] = []
    for m in _PIRKE_DIGIT_RE.finditer(flat):
        boundaries.append((m.start(), "digit"))
    for m in _PIRKE_SAYING_CUE_RE.finditer(flat):
        boundaries.append((m.start(), "cue"))

    if not boundaries:
        # No boundaries detected — fall back to flat normalization
        return _normalize_to_verse_lines(body)

    # Sort and dedupe: collapse boundaries that are within 8 chars of one
    # another (digit-marker plus immediately-following cue describe the same
    # saying-start position). Keep the earlier position.
    boundaries.sort(key=lambda b: b[0])
    deduped: list[int] = []
    for pos, _src in boundaries:
        if deduped and pos - deduped[-1] < 8:
            continue
        deduped.append(pos)

    # Sanity-check: drop a boundary whose carved body would be < 10 chars
    # (likely a regex false-positive in the middle of a long verse).
    # Apply the check by carving each slice and skipping tiny ones.
    slices: list[str] = []
    for i, start in enumerate(deduped):
        end = deduped[i + 1] if i + 1 < len(deduped) else len(flat)
        chunk = flat[start:end].strip()
        if len(chunk) < 10:
            continue
        slices.append(chunk)

    if not slices:
        return _normalize_to_verse_lines(body)

    # Renumber 1..N. Strip any leading digit-prefix (`12. `, `34 `) since we
    # are imposing our own monotonic numbering.
    leading_digit = re.compile(r"^\d{1,3}\.?\s+")
    out_lines = []
    for i, saying in enumerate(slices, start=1):
        text = leading_digit.sub("", saying).strip()
        text = _clean_inline_artifacts(text)
        text = re.sub(r"\s+", " ", text).strip()
        if text:
            out_lines.append(f"{i}.  {text}")
    return "\n".join(out_lines)


# Dispatch table: convention -> extractor function
_CONVENTION_DISPATCH = {
    "flat":                  _extract_flat_book,
    "chapter-verse-hdr":     _extract_chapter_verse_hdr_book,
    "sibylline-paren":       _extract_sibylline_book,
    "adam-eve-roman":        _extract_adam_eve_book,
    "testaments-named":      _extract_testaments_book,
    "ahikar-syriac":         _extract_ahikar_syriac_book,
    "pirke-aboth-sayings":   _extract_pirke_aboth_book,
}


def extract_book(book_id: str, display_title: str, body_start: int, body_end: int,
                 verbose: bool = False) -> str:
    """Extract one book's body from the PDF and return a clean body string.

    Returns the body in chapter-aware verse-line shape:

        # {display_title}

        # Chapter <N>

        1.  verse text
        2.  verse text
        ...

    `# Chapter N` markers (or `# <Name> Chapter N` for testaments-named /
    adam-eve-roman) are emitted between chapters; the downstream structural
    parser slices on them. Books with `flat` convention emit no chapter
    markers (the downstream parser treats absent markers as one synthetic
    chapter).

    Per-book convention dispatch is driven by BOOK_CONVENTION. Coverage
    instrumentation (session-21 fix i) still runs against the page-header
    verse-range capture.
    """
    pages = _extract_pdf_pages(PDF_PATH, body_start, body_end)
    # Capture per-page expected verse range BEFORE header strip
    expected_ranges = []  # list of (page_idx, lo, hi)
    for pi, page_text in enumerate(pages):
        for ln in page_text.split("\n")[:6]:  # headers live in first few lines
            r = _capture_header_verse_range(ln)
            if r is not None:
                expected_ranges.append((pi, r[0], r[1]))
                break

    # Dispatch to per-convention extractor (session-22 chapter-aware path)
    convention = BOOK_CONVENTION.get(book_id, "flat")
    extractor = _CONVENTION_DISPATCH.get(convention)
    if extractor is None:
        raise ValueError(f"unknown convention {convention!r} for book {book_id!r}")
    body_out = extractor(pages)

    # Coverage report (session-21 fix i — preserved against the new pipeline)
    actual_count = sum(1 for ln in body_out.split("\n") if re.match(r"^\d+\.\s", ln))
    chapter_count = sum(1 for ln in body_out.split("\n") if ln.startswith("# Chapter ")
                         or re.match(r"^# .+ Chapter ", ln))
    if expected_ranges:
        all_los = [lo for _, lo, _ in expected_ranges]
        all_his = [hi for _, _, hi in expected_ranges]
        expected_min, expected_max = min(all_los), max(all_his)
        expected_total = expected_max - expected_min + 1
        coverage_pct = 100.0 * actual_count / expected_total if expected_total else 0.0
        msg = (f"  [{book_id}] verses: {actual_count} recovered; "
               f"chapters: {chapter_count}; "
               f"header-range {expected_min}-{expected_max} "
               f"(~{expected_total} expected); "
               f"coverage ~{coverage_pct:.0f}% [{convention}]")
    else:
        msg = (f"  [{book_id}] verses: {actual_count} recovered; "
               f"chapters: {chapter_count}; no page-range headers detected "
               f"[{convention}]")
    if verbose:
        print(msg)
    return f"# {display_title}\n\n{body_out}\n"


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "--pilot",
        default="aristeas",
        help="Book id to pilot-extract (default: aristeas)",
    )
    ap.add_argument(
        "--full",
        action="store_true",
        help="Extract ALL 15 books into one charles-pseudepigrapha.txt file",
    )
    args = ap.parse_args()

    if not os.path.exists(PDF_PATH):
        print(f"ERROR: PDF not found at {PDF_PATH}", file=sys.stderr)
        return 1

    if args.full:
        out_path = os.path.join(OUT_DIR, "charles-pseudepigrapha.txt")
        chunks = []
        for book_id, title, s, e in BOOKS:
            print(f"  extracting {book_id} ({title}) pp. PDF {s}-{e} ...")
            body = extract_book(book_id, title, s, e, verbose=True)
            chunks.append(body)
        with open(out_path, "w", encoding="utf-8") as f:
            f.write("\n\n".join(chunks))
        # Brief summary
        total_lines = sum(c.count("\n") for c in chunks)
        print(f"wrote {out_path} ({total_lines} total lines across {len(BOOKS)} books)")
        return 0

    # Pilot: extract one book
    book_id = args.pilot
    match = next((b for b in BOOKS if b[0] == book_id), None)
    if match is None:
        print(f"ERROR: unknown book_id {book_id!r}", file=sys.stderr)
        print(f"available: {[b[0] for b in BOOKS]}", file=sys.stderr)
        return 1
    _, title, s, e = match
    body = extract_book(book_id, title, s, e, verbose=True)
    out_path = os.path.join(OUT_DIR, f"{book_id}.md")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(body)
    print(f"wrote {out_path}")
    # Echo a small sample for sanity check
    lines = body.split("\n")
    print(f"  total lines: {len(lines)}")
    print(f"  first 5 verses:")
    for ln in lines[:7]:
        print(f"    {ln[:140]}")
    print(f"  last 3 verses:")
    for ln in lines[-4:]:
        print(f"    {ln[:140]}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
