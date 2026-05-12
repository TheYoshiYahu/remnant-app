#!/usr/bin/env python3
"""
parse_mrjames_apocryphal_nt.py
------------------------------
W-2 extractor for Montague Rhodes James, *The Apocryphal New Testament*
(Oxford: Clarendon Press, 1924).

Source: ~/Downloads/mr-james-apoc-nt-1924.pdf (620 PDF pages, archive.org
upload `JAMESApocryphalNewTestament1924`). Public domain (1924 publication,
US PD by date; James died 1936 so UK PD since 2007).

Output:
  ~/Desktop/App/source-texts/mrjames-apocryphal-nt/mrjames-apocryphal-nt.txt
    (pilot extraction; 10 books — full 50-80 book extraction queued for next session)

Session-29 status: PATH-FAST via local PDF (NOT Wikisource/CCEL — those
hosts are network-allowlist-blocked from this sandbox; local PDF is the
clean alternative). Text layer is clean ASCII with 0 Greek-glyph drift
(verified on pp 10/50/100/200/300/500 → 700-2400 ASCII letters per page,
0 Greek letters). No re-OCR needed.

What it strips at extraction time:
- Page headers (running heads like `GOSPEL OF PETER 91`, `FRAGMENTS OF EARLY
  GOSPELS, ETC.`, `BOOK OF JAMES, OR PROTEVANGELIUM 41`).
- Empty trailing pages and intro-only pages outside body ranges.

What it preserves:
- The body translation only.
- M.R. James's `ROMAN. ARABIC` chapter-verse marker convention. Roman-
  numeral upper-case dotted prefix (`I.`, `II.`, `III.`, etc.) opens a new
  chapter; Arabic-numeral leading-digit on the next non-marker line opens
  a verse within that chapter. Sequential within the chapter.
- For books without chapter markers (most fragmentary/short texts):
  paragraph-flat with auto-numbered verses.

Per-book scope and convention map: see
  ~/Desktop/App/source-texts/mrjames-apocryphal-nt/_MRJAMES_BOUNDARIES.md

CLI:
  --book <book_id>   extract single book
  --full             extract all books in BOOKS to mrjames-apocryphal-nt.txt
"""

from __future__ import annotations
import argparse
import os
import re
import sys
import warnings

warnings.filterwarnings("ignore")

from pypdf import PdfReader

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

def _resolve_root() -> str:
    """Locate the App project root, walking up from this file."""
    here = os.path.dirname(os.path.abspath(__file__))
    for _ in range(4):
        if os.path.basename(here) == "App":
            return here
        here = os.path.dirname(here)
    return os.path.expanduser("~/Desktop/App")


APP_ROOT = _resolve_root()


def _resolve_pdf_path() -> str:
    """Locate the source PDF. Tries host path first, sandbox mount path
    second; allows MRJAMES_PDF env var override for unusual setups."""
    env = os.environ.get("MRJAMES_PDF")
    if env and os.path.exists(env):
        return env
    candidates = [
        os.path.expanduser("~/Downloads/mr-james-apoc-nt-1924.pdf"),
        "/Users/mtm/Downloads/mr-james-apoc-nt-1924.pdf",
    ]
    # Session-30: also probe any session mount path under /sessions/*/mnt/Downloads/
    import glob as _glob
    for p in _glob.glob("/sessions/*/mnt/Downloads/mr-james-apoc-nt-1924.pdf"):
        candidates.append(p)
    for p in candidates:
        if os.path.exists(p):
            return p
    return candidates[0]


PDF_PATH = _resolve_pdf_path()
OUT_DIR = os.path.join(APP_ROOT, "source-texts", "mrjames-apocryphal-nt")
OUT_TXT = os.path.join(OUT_DIR, "mrjames-apocryphal-nt.txt")

# Scan-page = printed-page + SCAN_PAGE_OFFSET (front matter = 30 pages).
# Verified session 29: scan p31 = printed body p1 (Gospel according to Hebrews
# title); scan p71 = printed p41 (BOOK OF JAMES VI.); scan p121 = printed p91
# (GOSPEL OF PETER III. 6). Offset stable across the volume.
SCAN_PAGE_OFFSET = 30


def _printed_to_scan(printed_page: int) -> int:
    """Translate printed page number (1-indexed body) to scan page (1-indexed
    PDF page). Returns scan page suitable for PdfReader().pages[scan-1]."""
    return printed_page + SCAN_PAGE_OFFSET


# ---------------------------------------------------------------------------
# BOOKS table — pilot scope (session 29)
# ---------------------------------------------------------------------------
#
# Printed-page ranges from the M.R. James 1924 CONTENTS pages (scan pp 5-8).
# Stored in printed-page form for readability; converted to scan pages at
# extraction time. Body_start/body_end are inclusive printed-page ranges
# that contain ONLY the primary-text translation body.
#
# Pilot scope: 10 high-profile books spanning each major section
# (Fragments / Infancy / Passion / Acts / Epistles / Apocalypses). Full
# 50-80 book extraction queued for session 30 once pilot validates the
# parser end-to-end.

BOOKS = [
    # book_id,                          display_title,                              start, end
    #
    # SCOPE LOCKED 2026-05-12 (session 32) — five books only, the entries
    # named in Yoshi's SOURCE_TEXT_INVENTORY.md (Cepher Ha'avoth + Shamayim).
    # All other M.R. James 1924 entries were stripped — Gnostic infancy
    # gospels, Pilate fanfiction, Acts of John/Thomas, Apocalypse of Thomas,
    # and the fragmentary apparatus (lists, agrapha, fragments) are NOT in
    # the manifest. See ~/Desktop/App/source-texts/SOURCE_TEXT_INVENTORY.md.
    #
    # NOTE: Gospel of Mary is in the manifest (Cepher Ha'avoth) but Cepher's
    # attribution to M.R. James 1924 is a cataloguing error — the text isn't
    # in James 1924. Source needs to be relocated (Berlin Codex 8502 / Akhmim
    # PD English) before Gospel of Mary can be added. Flagged for follow-up.
    #
    # ---------- INFANCY GOSPELS (Cepher Ha'avoth: BESORAH YA'AQOV) ----------
    ("book-of-james-protevangelium",    "The Book of James, or Protevangelium",     38,  48),
    # ---------- PASSION GOSPELS (Cepher Ha'avoth: BESORAH KEPHA, BESORAH NIQODYMON) ----------
    ("gospel-peter",                    "The Gospel of Peter",                      90,  93),
    ("gospel-nicodemus-acts-pilate",    "The Gospel of Nicodemus, or Acts of Pilate", 94, 145),
    # ---------- APOCALYPSES (Cepher Shamayim: CHIZAYON KEPHA, MACHAZEH PA'AL) ----------
    ("apocalypse-of-peter",             "The Apocalypse of Peter",                  505, 523),
    ("apocalypse-of-paul",              "The Apocalypse of Paul",                   525, 554),
]


# ---------------------------------------------------------------------------
# Page-header strip
# ---------------------------------------------------------------------------
#
# M.R. James running heads (verified by sample scans):
#   `FRAGMENTS OF EARLY GOSPELS, ETC.`     (section header on even pages)
#   `GOSPEL OF PETER 91`                   (book header + page number)
#   `BOOK OF JAMES, OR PROTEVANGELIUM 41`  (book header + page number)
#   `THE GOSPEL ACCORDING TO THE HEBREWS 5` (book header + page number)
#   `GOSPEL OF PSEUDO-MATTHEW 71`          (book header + page number)
#   `28 FRAGMENTS OF EARLY GOSPELS, ETC.`  (page number + section header)
#   `CONTENTS Vll`                          (front matter)
#
# Pattern: book/section title (all-caps with optional punctuation), optional
# page number (1-3 digits) prefix or suffix. Stripped at line-start before
# verse parsing.

_HEADER_PATTERNS = [
    # Standard book-running-head with trailing page number
    re.compile(r"^\s*\d{1,3}\s+[A-Z][A-Z\s,.&'’()\-]{8,80}\s*$"),
    # Standard book-running-head with leading page number reversed
    re.compile(r"^\s*[A-Z][A-Z\s,.&'’()\-]{8,80}\s+\d{1,3}\s*$"),
    # All-caps section header alone
    re.compile(r"^\s*[A-Z][A-Z\s,.&'’()\-]{8,80}\s*$"),
    # CONTENTS / PREFACE etc.
    re.compile(r"^\s*CONTENTS\b.*$", re.IGNORECASE),
    re.compile(r"^\s*PREFACE\b.*$", re.IGNORECASE),
]


def _strip_page_headers(text: str) -> str:
    """Strip M.R. James running heads from page text."""
    lines = text.split("\n")
    kept = []
    for ln in lines:
        s = ln.strip()
        if not s:
            kept.append(ln)
            continue
        # Header pattern check
        if any(p.match(ln) for p in _HEADER_PATTERNS):
            # But don't strip if the line looks like a translation footer marker
            # or a body sentence starting with all-caps (rare)
            if len(s) < 15 and not s.endswith("."):
                kept.append(ln)
                continue
            # Look like a real header — strip it
            continue
        kept.append(ln)
    return "\n".join(kept)


# ---------------------------------------------------------------------------
# Chapter/verse detection
# ---------------------------------------------------------------------------
#
# M.R. James's convention:
#   `ROMAN.` opens a new chapter (e.g., `I.`, `II.`, `III.`, `IV.`, `V.`, `VI.`,
#   `VII.`, `VIII.`, `IX.`, `X.`, `XI.`, `XII.`, ...).
#   Arabic numerals on the same or following line open verses sequentially.
#
# Some books use lowercase Roman (`i.`, `ii.`, ...) for sub-sections (e.g.,
# Oxyrhynchus 654). Others use Arabic-only with no Roman chapter (e.g.,
# short fragments).
#
# Strategy: walk lines. Detect chapter markers (`ROMAN.` at line-start, with
# trailing whitespace or digit), emit `# Chapter N` blocks. Within each
# chapter, detect Arabic-numeral leading-digit verses.

_ROMAN_NUMERAL = (
    r"(?:M{0,3}(?:CM|CD|D?C{0,3})(?:XC|XL|L?X{0,3})(?:IX|IV|V?I{0,3}))"
)
_ROMAN_CHAPTER_RE = re.compile(
    rf"^\s*({_ROMAN_NUMERAL})\.\s+(?=[A-Z0-9])"
)

# mrjames-tune (session 30): lowercase Roman variant for sub-section
# markers (Acts of Thomas ancient quotations, Apocalypse of Peter Akhmim
# fragment, etc.). Held as a SEPARATE regex so the main uppercase chapter
# detector keeps its current strictness (uppercase-Roman + period + space
# + Capital-or-digit). Lowercase variant is used as a SECONDARY signal
# inside long books that otherwise emit a single chapter — when no
# uppercase Roman chapter has been seen for a stretch, a lowercase Roman
# can open a new chapter at chapter-counter+1.
_ROMAN_NUMERAL_LOWER = (
    r"(?:m{0,3}(?:cm|cd|d?c{0,3})(?:xc|xl|l?x{0,3})(?:ix|iv|v?i{0,3}))"
)
_ROMAN_CHAPTER_LOWER_RE = re.compile(
    rf"^\s*({_ROMAN_NUMERAL_LOWER})\.\s+(?=[A-Za-z0-9])"
)

# Lowercase Roman to int (mirrors _ROMAN_TO_INT but case-insensitive).
def _roman_lower_to_int(rom: str) -> int | None:
    try:
        return _ROMAN_TO_INT.get(rom.upper())
    except Exception:
        return None

# Verse-marker patterns
_VERSE_LEADING_DIGIT = re.compile(r"^\s*(\d{1,3})\s+(?=[A-Za-z(])")


_ROMAN_TO_INT = {
    "I": 1, "II": 2, "III": 3, "IV": 4, "V": 5, "VI": 6, "VII": 7, "VIII": 8,
    "IX": 9, "X": 10, "XI": 11, "XII": 12, "XIII": 13, "XIV": 14, "XV": 15,
    "XVI": 16, "XVII": 17, "XVIII": 18, "XIX": 19, "XX": 20, "XXI": 21,
    "XXII": 22, "XXIII": 23, "XXIV": 24, "XXV": 25, "XXVI": 26, "XXVII": 27,
    "XXVIII": 28, "XXIX": 29, "XXX": 30, "XXXI": 31, "XXXII": 32,
    "XXXIII": 33, "XXXIV": 34, "XXXV": 35, "XXXVI": 36, "XXXVII": 37,
    "XXXVIII": 38, "XXXIX": 39, "XL": 40, "XLI": 41, "XLII": 42, "XLIII": 43,
    "XLIV": 44, "XLV": 45, "XLVI": 46, "XLVII": 47, "XLVIII": 48,
    "XLIX": 49, "L": 50, "LI": 51, "LII": 52, "LIII": 53, "LIV": 54,
    "LV": 55, "LX": 60, "LXX": 70, "LXXX": 80, "XC": 90, "C": 100,
}


def _roman_to_int(rom: str) -> int | None:
    """Convert uppercase Roman numeral to integer (1-100). Returns None if
    not in our convention range or unrecognized."""
    return _ROMAN_TO_INT.get(rom.upper())


def _extract_book_body(printed_start: int, printed_end: int) -> str:
    """Extract a book's body text from the PDF.

    Walks scan pages corresponding to printed_start..printed_end, strips
    page headers, joins, then parses chapter/verse structure.
    """
    reader = PdfReader(PDF_PATH)
    pages_text = []
    scan_start = _printed_to_scan(printed_start)
    scan_end = _printed_to_scan(printed_end)
    for scan_p in range(scan_start, scan_end + 1):
        if scan_p - 1 >= len(reader.pages):
            continue
        t = reader.pages[scan_p - 1].extract_text() or ""
        t = _strip_page_headers(t)
        pages_text.append(t)
    full_text = "\n".join(pages_text)
    return full_text


def _parse_body_to_verse_lines(body: str) -> str:
    """Parse raw body text into the canonical edition format:

      # Chapter N
      <blank>
      1.  text...
      2.  text...

    M.R. James convention: `ROMAN. arabic body...` opens chapter ROMAN
    verse arabic. Subsequent `arabic body...` lines continue verses.
    Without chapter markers, content goes under `# Chapter 1` with
    sequential auto-numbered verses.
    """
    lines = body.split("\n")
    # Pre-clean: drop empty-only-whitespace, collapse multiple blanks
    cleaned = []
    prev_blank = False
    for ln in lines:
        if not ln.strip():
            if not prev_blank:
                cleaned.append("")
                prev_blank = True
            continue
        cleaned.append(ln.rstrip())
        prev_blank = False
    lines = cleaned

    chapters: dict[int, list[str]] = {}
    chapter_order: list[int] = []
    current_chapter = None
    current_verse = None
    verse_buffer: list[str] = []

    def flush_verse():
        nonlocal verse_buffer, current_verse, current_chapter
        if current_verse is None or not verse_buffer:
            return
        ch = current_chapter if current_chapter is not None else 1
        if ch not in chapters:
            chapters[ch] = []
            chapter_order.append(ch)
        text = " ".join(s.strip() for s in verse_buffer if s.strip())
        text = re.sub(r"\s+", " ", text).strip()
        if text:
            chapters[ch].append(f"{current_verse}.  {text}")
        verse_buffer = []

    auto_verse_counter = 0
    # mrjames-tune (session 30): track whether any explicit marker has fired.
    # When the whole book emits zero chapter/verse markers, the auto-numbering
    # path (current_verse=None on entry) takes over; blank lines between
    # paragraphs flush the current verse so the next paragraph starts as a
    # new auto-verse. Without this, all paragraphs fuse into one giant verse
    # 1 (the session-29 case for Letters of Christ and Abgarus and
    # Apocalypse of Thomas).
    in_auto_mode = True

    for ln in lines:
        s = ln.strip()
        if not s:
            # Blank line. In auto-numbering mode, treat as a paragraph break
            # — flush the current verse and let the next non-blank line open
            # a new auto-verse. Outside auto mode (explicit markers seen),
            # blank lines are ignored (the existing pre-clean step has
            # already collapsed multiple blanks).
            if in_auto_mode and current_verse is not None:
                flush_verse()
                current_verse = None
            continue

        # Check chapter marker (uppercase Roman)
        m_ch = _ROMAN_CHAPTER_RE.match(ln)
        if m_ch:
            in_auto_mode = False
            flush_verse()
            rom = m_ch.group(1)
            n = _roman_to_int(rom)
            if n is not None and 1 <= n <= 100:
                current_chapter = n
                # Strip the chapter marker from line and look for verse number
                rest = ln[m_ch.end():].lstrip()
                # Look for leading digit on rest
                m_v = re.match(r"^(\d{1,3})\s+(.*)$", rest)
                if m_v:
                    current_verse = int(m_v.group(1))
                    verse_buffer = [m_v.group(2)]
                else:
                    # No explicit verse; treat as v=1 if there's content
                    if rest:
                        current_verse = 1
                        verse_buffer = [rest]
                    else:
                        current_verse = None
                        verse_buffer = []
                continue

        # Check verse marker
        m_v = _VERSE_LEADING_DIGIT.match(ln)
        if m_v:
            cand_n = int(m_v.group(1))
            # mrjames-tune (session 30): sanity cap to filter page-number
            # footers masquerading as verse markers. Page-binding signatures
            # like `870.  B b and true marriage,` (printer's signature on
            # printed page 870) get picked up by the verse regex; without
            # the cap they overwrite current_verse to 870 and the monotonic
            # filter downstream drops the rest of the chapter. Cap rejects
            # candidates >300 (no M.R. James body has that many sections
            # per chapter) AND any cand more than 100 ahead of the current
            # verse (chapter-internal verses run sequentially with small
            # gaps, never skip by 100+).
            cand_ok = (cand_n <= 300 and
                       (current_verse is None or
                        cand_n - current_verse < 100))
            if cand_ok:
                in_auto_mode = False
                flush_verse()
                current_verse = cand_n
                rest = ln[m_v.end():]
                verse_buffer = [rest]
                continue
            # Out-of-range candidate — treat as continuation of current
            # verse (page-binding signatures and stray printer marks).
            # Fall through to the continuation path below.

        # Continuation of current verse OR pre-marker content
        if current_verse is not None:
            verse_buffer.append(s)
        else:
            # No chapter or verse seen yet — auto-number from v=1
            auto_verse_counter += 1
            current_chapter = current_chapter or 1
            current_verse = auto_verse_counter
            verse_buffer = [s]

    flush_verse()

    # Emit
    if not chapter_order:
        # No content at all
        return ""

    out_blocks = []
    for ch in sorted(chapter_order):
        verses = chapters.get(ch, [])
        if verses:
            out_blocks.append(f"# Chapter {ch}\n\n" + "\n".join(verses))
    return "\n\n".join(out_blocks)


def extract_book(book_id: str) -> tuple[str, str]:
    """Extract one book by book_id. Returns (display_title, body_text)."""
    entry = next((b for b in BOOKS if b[0] == book_id), None)
    if entry is None:
        raise ValueError(f"unknown book_id: {book_id}; "
                         f"available: {[b[0] for b in BOOKS]}")
    book_id_, title, printed_start, printed_end = entry
    raw = _extract_book_body(printed_start, printed_end)
    parsed = _parse_body_to_verse_lines(raw)
    return (title, parsed)


def write_book(book_id: str, out_path: str | None = None) -> int:
    """Extract a single book and write its .md output. Returns line count."""
    title, parsed = extract_book(book_id)
    if out_path is None:
        out_path = os.path.join(OUT_DIR, f"{book_id}.md")
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    content = f"# {title}\n\n{parsed}\n"
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(content)
    n_lines = len(content.split("\n"))
    n_verse_pat = re.findall(r"^\d+\.\s", parsed, re.M)
    n_chapters = parsed.count("# Chapter")
    print(f"  [{book_id}] chapters={n_chapters} verses={len(n_verse_pat)} -> {out_path}")
    return n_lines


def write_full():
    """Extract every book in BOOKS to the combined edition file."""
    os.makedirs(OUT_DIR, exist_ok=True)
    out_lines: list[str] = []
    total_v = 0
    total_c = 0
    for book_id, title, printed_start, printed_end in BOOKS:
        print(f"  extracting {book_id} ({title}) pp. {printed_start}-{printed_end} "
              f"(scan {_printed_to_scan(printed_start)}-{_printed_to_scan(printed_end)})...")
        raw = _extract_book_body(printed_start, printed_end)
        parsed = _parse_body_to_verse_lines(raw)
        n_verses = len(re.findall(r"^\d+\.\s", parsed, re.M))
        n_chapters = parsed.count("# Chapter")
        total_v += n_verses
        total_c += n_chapters
        print(f"    chapters={n_chapters} verses={n_verses}")
        out_lines.append(f"# {title}\n")
        out_lines.append(parsed)
        out_lines.append("\n")
    text = "\n".join(out_lines)
    with open(OUT_TXT, "w", encoding="utf-8") as f:
        f.write(text)
    n_lines = len(text.split("\n"))
    print(f"wrote {OUT_TXT} ({n_lines} total lines across {len(BOOKS)} books; "
          f"{total_c} chapters / {total_v} verses)")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--book", default=None,
                    help="Extract a specific book by book_id.")
    ap.add_argument("--full", action="store_true",
                    help="Extract all books in BOOKS table.")
    args = ap.parse_args()

    if args.full:
        write_full()
        return 0
    if args.book:
        write_book(args.book)
        return 0
    print("Specify --book <id> or --full. Available books:")
    for b in BOOKS:
        print(f"  {b[0]:40s} {b[1]}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
