#!/usr/bin/env python3
"""
parse_lightfoot_apostolic_fathers.py
------------------------------------
W-2 extractor for J.B. Lightfoot & J.R. Harmer, *The Apostolic Fathers*
(London: Macmillan, 1891 single-volume edition).

Source: ~/Downloads/Full text of "The apostolic fathers ..".html
(archive.org/details/apostolicfathers00ligh full-text page, 1.46 MB HTML
with the entire OCR text in a single <pre> block, ~1.28 MB inside.)

This is the Lightfoot+Harmer combined edition — Lightfoot died 1889,
Harmer completed and edited the single-volume revision in 1891. It
contains the body translations of all 15 traditional Apostolic Fathers
books (1 Clement, 2 Clement, the seven Ignatius letters, Polycarp to
the Philippians, Martyrdom of Polycarp, Didache, Barnabas, Shepherd of
Hermas, Diognetus) plus Fragments of Papias and Reliques of the Elders.

Body convention: each book opens with an all-caps section header (e.g.
`THE EPISTLE OF S. CLEMENT TO THE CORINTHIANS`), then numbered
sections in flat order (`1.`, `2.`, `3.`, ...). Section numbers reset
per book. We treat each book as a single chapter with N numbered
sections as verses — same shape used for Acts of Thomas in the M.R.
James edition.

Output:
  ~/Desktop/App/source-texts/lightfoot-apostolic-fathers/lightfoot-apostolic-fathers.txt

Edition slug: `lightfoot-apostolic-fathers`. sort_offset=650.
witness_category=`apostolic-fathers`. tier_required=`extras`.
"""

from __future__ import annotations
import argparse
import os
import re
import sys
import glob as _glob

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

def _resolve_root() -> str:
    here = os.path.dirname(os.path.abspath(__file__))
    for _ in range(4):
        if os.path.basename(here) == "App":
            return here
        here = os.path.dirname(here)
    return os.path.expanduser("~/Desktop/App")

APP_ROOT = _resolve_root()
OUT_DIR = os.path.join(APP_ROOT, "source-texts", "lightfoot-apostolic-fathers")
OUT_TXT = os.path.join(OUT_DIR, "lightfoot-apostolic-fathers.txt")

def _resolve_source() -> str:
    """Locate the archive.org full-text HTML. Allows LIGHTFOOT_HTML override."""
    env = os.environ.get("LIGHTFOOT_HTML")
    if env and os.path.exists(env):
        return env
    candidates = [
        os.path.expanduser('~/Downloads/Full text of "The apostolic fathers ..".html'),
        '/Users/mtm/Downloads/Full text of "The apostolic fathers ..".html',
    ]
    for p in _glob.glob('/sessions/*/mnt/Downloads/Full text of "The apostolic fathers ..".html'):
        candidates.append(p)
    for p in candidates:
        if os.path.exists(p):
            return p
    return candidates[0]

SRC_PATH = _resolve_source()


# ---------------------------------------------------------------------------
# BOOKS table
# ---------------------------------------------------------------------------
#
# Each book is identified by an opener pattern — a regex matched against
# the OCR'd <pre> body. The OCR has running headers and page numbers
# scattered through; we anchor at the FIRST occurrence of the body
# header (typically appearing on the title page or first body page of
# each book), then walk forward until the next book's opener.
#
# Order matters: books are listed in source order so we can scan
# sequentially. Each entry: (slug, display_title, opener_regex,
# tail_marker_regex_or_None). The tail marker (optional) is used when
# the next book's opener doesn't fire reliably — e.g. detect the
# CONCLUSION or trailing-pages signal of the current book.

# Body-prologue anchors. The print-shop drop-cap on each book's first
# letter makes the OCR butcher the title typography (e.g. "THE EPISTLE
# OF S. CLEMENT" → "fee Se PIStee OF Ss. CLEMENT"); the BODY OCR is much
# cleaner. We anchor each book on a distinctive phrase from its
# prologue salutation. Patterns are case-insensitive but the prologue
# substring should be unique to the book.
# Each entry: (slug, display_title, opener_regex, parser_kind).
# parser_kind drives body parsing:
#   "flat"             — single chapter, `^\d+\.\s+` flat sections (default)
#   "hermas-multi-tier"— Hermas: detect VIS/MAND/SIM dividers, emit per-chapter
#   "roman-fragments"  — Papias/Reliques: Roman-numeral section markers,
#                        Greek-glyph-tolerant section bodies
BOOKS = [
    ("1-clement",                "The First Epistle of S. Clement to the Corinthians",
        re.compile(r"\bChurch\s+of\s+God\s+which\s+sojourneth\s+in\s+Rome\b", re.IGNORECASE),
        "flat"),
    ("2-clement",                "An Ancient Homily by an Unknown Author (Second Clement)",
        re.compile(r"\bAN\s+ANCIENT\s+HOMILY\b", re.IGNORECASE),
        "flat"),
    ("ignatius-ephesians",       "The Epistle of S. Ignatius to the Ephesians",
        re.compile(r"\bchurch\s+which\s+is\s+in\s+Ephesus\b", re.IGNORECASE),
        "flat"),
    ("ignatius-magnesians",      "The Epistle of S. Ignatius to the Magnesians",
        re.compile(r"\bchurch\s+which\s+is\s+in\s+Magnesia\b", re.IGNORECASE),
        "flat"),
    ("ignatius-trallians",       "The Epistle of S. Ignatius to the Trallians",
        re.compile(r"\bchurch\s+which\s+is\s+in\s+Tralles\b", re.IGNORECASE),
        "flat"),
    ("ignatius-romans",          "The Epistle of S. Ignatius to the Romans",
        re.compile(r"\bchurch\s+that\s+is\s+beloved\s+and\s+enlightened\b", re.IGNORECASE),
        "flat"),
    ("ignatius-philadelphians",  "The Epistle of S. Ignatius to the Philadelphians",
        re.compile(r"\bin\s+Philadelphia\s+of\s+Asia\b", re.IGNORECASE),
        "flat"),
    ("ignatius-smyrnaeans",      "The Epistle of S. Ignatius to the Smyrnaeans",
        re.compile(r"\bchurch\s+of\s+God\s+the\s+Father\s+and\s+of\s+Jesus\s+Christ\s+the\s+Beloved\b", re.IGNORECASE),
        "flat"),
    ("ignatius-polycarp",        "The Epistle of S. Ignatius to S. Polycarp",
        re.compile(r"\bPolycarp\s+who\s+is\s+bishop\b", re.IGNORECASE),
        "flat"),
    # SCOPE LOCKED 2026-05-12 (session 32): polycarp-philippians removed —
    # Cepher Ha'avoth approves Martyrdom of Polycarp only, not Polycarp's
    # own letter to the Philippians.
    ("martyrdom-polycarp",       "The Martyrdom of S. Polycarp",
        re.compile(r"\bChurch\s+of\s+God\s+which\s+sojourneth\s+at\s+Smyrna\b", re.IGNORECASE),
        "flat"),
    ("didache",                  "The Teaching of the Twelve Apostles (Didache)",
        re.compile(r"\btwo\s+ways,\s+one\s+of\s+life\s+and\s+one\s+of\s+death\b", re.IGNORECASE),
        "flat"),
    ("barnabas",                 "The Epistle of Barnabas",
        re.compile(r"\bsons\s+and\s+daughters,\s+in\s+the\s+name\s+of\s+(?:the\s+)?Lord\b", re.IGNORECASE),
        "flat"),
    ("hermas",                   "The Shepherd of Hermas",
        re.compile(r"\bmaster,?\s+who\s+reared\s+me,?\s+had\s+sold\s+me\s+to\s+one\s+Rhoda\b", re.IGNORECASE),
        "hermas-multi-tier"),
    # SCOPE LOCKED 2026-05-12 (session 32): diognetus, fragments-papias,
    # reliques-elders all removed — Lightfoot-edition extras not in
    # Cepher Ha'avoth manifest.
]


# ---------------------------------------------------------------------------
# HTML → OCR text extraction
# ---------------------------------------------------------------------------

_PRE_RE = re.compile(r"<pre[^>]*>(.*?)</pre>", re.DOTALL | re.IGNORECASE)
_HTML_ENTITY = {"&amp;": "&", "&lt;": "<", "&gt;": ">", "&quot;": '"', "&apos;": "'"}

def _load_source_text() -> str:
    with open(SRC_PATH, "r", encoding="utf-8", errors="replace") as f:
        html = f.read()
    m = _PRE_RE.search(html)
    if not m:
        raise SystemExit(f"<pre> block not found in {SRC_PATH}")
    text = m.group(1)
    for k, v in _HTML_ENTITY.items():
        text = text.replace(k, v)
    return text


# ---------------------------------------------------------------------------
# Page-noise strip
# ---------------------------------------------------------------------------
#
# The archive.org OCR retains running heads and page numbers as
# free-floating short lines. Examples:
#   `THE EPISTLE OF S. CLEMENT TO THE CORINTHIANS 41`  (book header + page no.)
#   `BY AN UNKNOWN AUTHOR. 93`
#   `IGNATIUS TO THE EPHESIANS.`
#   `28`  (lone page number)
#   `[ I CLEM.`  (running head with bracket)
# We strip these so they don't fuse into verse bodies.

_PAGE_NO_LINE = re.compile(r"^\s*\d{1,3}\s*$")
_RUNNING_HEAD_PATTERNS = [
    # Page header containing book name + optional trailing page number
    re.compile(r"^\s*(?:THE\s+)?EPISTLE\s+OF\s+(?:S\.?\s+)?[A-Z]+(?:\s+(?:OF|TO|THE|AND)\s+\S+)*\s*\d{0,3}\s*$", re.IGNORECASE),
    re.compile(r"^\s*(?:THE\s+)?MARTYRDOM\s+OF\s+\S+\s*\d{0,3}\s*$", re.IGNORECASE),
    re.compile(r"^\s*(?:THE\s+)?TEACHING\s+OF\s+THE\s+APOSTLES\s*\d{0,3}\s*$", re.IGNORECASE),
    re.compile(r"^\s*(?:THE\s+)?SHEPHERD\s+OF\s+HERMAS\s*\d{0,3}\s*$", re.IGNORECASE),
    re.compile(r"^\s*BY\s+AN\s+UNKNOWN\s+AUTHOR\.?\s*\d{0,3}\s*$", re.IGNORECASE),
    re.compile(r"^\s*(?:VIS|MAND|SIM)\.?\s*[IVX]+\s*\d{0,3}\s*$", re.IGNORECASE),
    re.compile(r"^\s*\[\s*[1I]\s*CLEM\.?\s*$", re.IGNORECASE),
    re.compile(r"^\s*\[\s*BARN\.?\s*$", re.IGNORECASE),
    re.compile(r"^\s*\[\s*IGN\.?\s+\S+\s*$", re.IGNORECASE),
    # Session-31: page-number-prefix running heads that OCR'd with trailing
    # period look like section markers. The stray `64. S. CLEMENT OF ROME`
    # at OCR line 4116 was the 1 Clement 20→14 drift driver. Strip these
    # before _SECTION_MARKER runs.
    re.compile(r"^\s*\d{1,4}\.\s*S\.\s+CLEMENT\s+OF\s+ROME\s*$", re.IGNORECASE),
    re.compile(r"^\s*\d{1,4}\.\s*S\.\s+IGNATIUS(?:\s+TO\s+\S+)?\s*$", re.IGNORECASE),
    re.compile(r"^\s*\d{1,4}\.\s*S\.\s+POLYCARP(?:\s+TO\s+\S+)?\s*$", re.IGNORECASE),
    re.compile(r"^\s*\d{1,4}\.\s*EPISTLE\s+OF\s+BARNABAS\s*$", re.IGNORECASE),
    re.compile(r"^\s*\d{1,4}\.\s*SHEPHERD\s+OF\s+HERMAS\s*$", re.IGNORECASE),
    # Lightfoot in-body running heads with V./M./S. + roman + bracket
    re.compile(r"^\s*[VMS]\.?\s*\d{1,2}\.?\s*[ivxlcdmIVXLCDM]+\s*\]\s+THE\s+.*$", re.IGNORECASE),
    re.compile(r"^\s*AP\.?\s*FATH\.?\s*\d{0,4}\s*$", re.IGNORECASE),
    # Title-page chrome
    re.compile(r"^\s*Digitized\s+by\b.*$", re.IGNORECASE),
    re.compile(r"^\s*Internet\s+Archive\s*$", re.IGNORECASE),
    re.compile(r"^\s*https?://\S+\s*$", re.IGNORECASE),
]

def _is_page_noise(line: str) -> bool:
    s = line.strip()
    if not s:
        return False
    if _PAGE_NO_LINE.match(line):
        return True
    for p in _RUNNING_HEAD_PATTERNS:
        if p.match(line):
            return True
    return False


# ---------------------------------------------------------------------------
# Book boundary detection
# ---------------------------------------------------------------------------
#
# The OCR text contains the TOC near the top followed by intros and the
# actual body. To avoid matching TOC entries as book starts, we walk
# from a configurable starting line offset (set per scout) and find the
# FIRST occurrence of each book's opener after the previous book's
# starting line. This greedy left-to-right walk handles the multi-
# section structure.

# Scout-derived line offsets per book. From the session-30 grep:
#   Epistle of Clement (body): line 432
#   First IGNATIUS body: ~line 5979
#   Polycarp/Martyrdom: ~lines 10500-11800
#   Hermas: ~line 15912
#   Diognetus: ~line 31466
# We use line 400 as a safe lower bound past the TOC.
TOC_END_LINE = 400


def _find_book_boundaries(lines: list[str]) -> list[tuple[str, str, int, int, str]]:
    """Walk forward through `lines` and find the first body opener for each
    book in `BOOKS`. Returns a list of (slug, title, start_line, end_line,
    parser_kind) where `end_line` is exclusive.

    Strategy: anchor on body-prologue substrings (the print-shop
    drop-caps mangle title-page typography in OCR, but the prose body
    is clean). For each book, search the full text past the previous
    book's start. Each opener regex is allowed to span up to 6
    consecutive lines (joining with spaces) so that prologue salutations
    split across line breaks still match.
    """
    starts: list[tuple[str, str, int, str]] = []
    cursor = TOC_END_LINE
    n = len(lines)
    for slug, title, opener_re, parser_kind in BOOKS:
        found = None
        # Try each starting line; build a 6-line window and search
        for i in range(cursor, n):
            window = " ".join(lines[i:i + 6])
            if opener_re.search(window):
                found = i
                break
        if found is not None:
            starts.append((slug, title, found, parser_kind))
            cursor = found + 1
    out: list[tuple[str, str, int, int, str]] = []
    for idx, (slug, title, s, parser_kind) in enumerate(starts):
        e = starts[idx + 1][2] if idx + 1 < len(starts) else len(lines)
        out.append((slug, title, s, e, parser_kind))
    return out


# ---------------------------------------------------------------------------
# Verse extraction (per book)
# ---------------------------------------------------------------------------
#
# Within each book's line range, the body uses `^\d+\.\s+` markers. We
# also skip page-noise lines (running heads, isolated page numbers).
# Sections accumulate prose lines until the next section marker.

_SECTION_MARKER = re.compile(r"^\s*(\d{1,3})\.\s+(.*)$")

# ---------------------------------------------------------------------------
# Hermas multi-tier chapter dividers (session 31)
# ---------------------------------------------------------------------------
#
# The Shepherd of Hermas has 3 sub-structures: Visions (1-5, Vision 5 is
# editorially labelled "Revelation"), Mandates (1-12), Similitudes (1-10).
# Each restarts section numbering at 1, so the flat-monotonic structural
# gate prunes 47→29 unless we emit chapter dividers.
#
# OCR variants observed in the archive.org file:
#   `VISION I.` `VISION 2.` `VISION 3.`              (lines 23765, 23885, 23989)
#   `[VisIon 4.]`                                    (line 24412, brackets+mixed case)
#   `REVELATION 5.`                                  (line 24511)
#   `MANDATE THE FIRST` ... `MANDATE THE TWELFTH`    (lines 24547-25227)
#   `PARABLES WHICH HE SPAKE WITH ME,`               (line 25377, opens Sim 1)
#   `ANOTHER PARABLE.`                               (4 occurrences, Sim 2-5)
#   `PARABLE THE TENTH.`                             (line 27297, Sim 10)
# Similitudes 6-9 lack explicit body headers; we use the section-reset
# heuristic below to insert implicit chapter breaks when section numbering
# drops backward inside what would otherwise be one big Sim 5-10 chunk.

_HERMAS_DIVIDERS: list[tuple[re.Pattern, str | None]] = [
    (re.compile(r"^\s*VISION\s+(?:I|1)\.?\s*$", re.IGNORECASE),            "Vision 1"),
    (re.compile(r"^\s*VISION\s+(?:II|2)\.?\s*$", re.IGNORECASE),           "Vision 2"),
    (re.compile(r"^\s*VISION\s+(?:III|3)\.?\s*$", re.IGNORECASE),          "Vision 3"),
    (re.compile(r"^\s*\[?\s*Vis[Ii]on\s+(?:IV|4)\.?\s*\]?\s*$", re.IGNORECASE), "Vision 4"),
    (re.compile(r"^\s*REVELATION\s+(?:V|5)\.?\s*$", re.IGNORECASE),        "Vision 5 (Revelation)"),
    (re.compile(r"^\s*MANDATE\s+THE\s+FIRST\s*[,.]?\s*$", re.IGNORECASE),  "Mandate 1"),
    (re.compile(r"^\s*MANDATE\s+THE\s+SECOND\s*[,.]?\s*$", re.IGNORECASE), "Mandate 2"),
    (re.compile(r"^\s*MANDATE\s+THE\s+THIRD\s*[,.]?\s*$", re.IGNORECASE),  "Mandate 3"),
    (re.compile(r"^\s*MANDATE\s+THE\s+FOURTH\s*[,.]?\s*$", re.IGNORECASE), "Mandate 4"),
    (re.compile(r"^\s*MANDATE\s+THE\s+FIFTH\s*[,.]?\s*$", re.IGNORECASE),  "Mandate 5"),
    (re.compile(r"^\s*MANDATE\s+THE\s+SIXTH\s*[,.]?\s*$", re.IGNORECASE),  "Mandate 6"),
    (re.compile(r"^\s*MANDATE\s+THE\s+SEVENTH\s*[,.]?\s*$", re.IGNORECASE),"Mandate 7"),
    (re.compile(r"^\s*MANDATE\s+THE\s+EIGHTH\s*[,.]?\s*$", re.IGNORECASE), "Mandate 8"),
    (re.compile(r"^\s*MANDATE\s+THE\s+NINTH\s*[,.]?\s*$", re.IGNORECASE),  "Mandate 9"),
    (re.compile(r"^\s*MANDATE\s+THE\s+TENTH\s*[,.]?\s*$", re.IGNORECASE),  "Mandate 10"),
    (re.compile(r"^\s*MANDATE\s+THE\s+ELEVENTH\s*[,.]?\s*$", re.IGNORECASE),"Mandate 11"),
    (re.compile(r"^\s*MANDATE\s+THE\s+TWELFTH\s*[,.]?\s*$", re.IGNORECASE),"Mandate 12"),
    (re.compile(r"^\s*PARABLES\s+WHICH\s+HE\s+SPAKE\s+WITH\s+ME\s*[,.]?\s*$", re.IGNORECASE), "Similitude 1"),
    (re.compile(r"^\s*ANOTHER\s+PARABLE\s*[,.]?\s*$", re.IGNORECASE),      None),  # auto-numbered
    (re.compile(r"^\s*PARABLE\s+THE\s+TENTH\s*[,.]?\s*$", re.IGNORECASE),  "Similitude 10"),
]


def _detect_hermas_divider(line: str) -> str | None:
    """Return the chapter title for a Hermas divider line, or None.

    `ANOTHER PARABLE.` entries return the sentinel `__AUTO__` so callers
    can assign sequential Similitude numbers (Sim 2, Sim 3, ...).
    """
    for pat, title in _HERMAS_DIVIDERS:
        if pat.match(line):
            return title if title is not None else "__AUTO__"
    return None


def _parse_hermas(lines: list[str]) -> str:
    """Hermas-specific parser: emit `# <Chapter>` headers per Vis/Mand/Sim
    + flat `^\d+\.\s+` sections within each chapter.

    Lightfoot's Mandates 1-3 and Similitudes 1-2 are SHORT enough that
    their bodies have no internal numbering — they ARE verse 1 by
    default. We collect free-form body lines alongside numbered sections
    and emit them as verse 1 when no numbered sections were detected.

    For Similitudes 6-9 which lack explicit dividers, fall back to
    section-reset detection (cand==1 after last_n>=3 inside a Similitude
    auto-bumps sim_counter and opens an implicit `# Similitude N`).
    """
    chapters: list[tuple[str, list[tuple[int, str]]]] = []
    cur_title: str | None = None
    cur_sections: list[tuple[int, str]] = []
    cur_num: int | None = None
    cur_body: list[str] = []
    # Free-form lines accumulated while no numbered section is active.
    # Promoted to verse 1 at chapter close if no numbered sections fired.
    free_body: list[str] = []
    last_n = 0
    sim_counter = 0   # incremented to 1 when Similitude 1 (or its trigger) opens

    def flush_section():
        nonlocal cur_num, cur_body
        if cur_num is not None and cur_body:
            text = re.sub(r"\s+", " ", " ".join(s.strip() for s in cur_body if s.strip())).strip()
            if text:
                cur_sections.append((cur_num, text))
        cur_num = None
        cur_body = []

    def flush_chapter():
        nonlocal cur_title, cur_sections, last_n, free_body
        flush_section()
        if cur_title is not None:
            if not cur_sections and free_body:
                # Body had no numbered sections — promote free_body to verse 1
                text = re.sub(r"\s+", " ", " ".join(s.strip() for s in free_body if s.strip())).strip()
                if text:
                    cur_sections.append((1, text))
            if cur_sections:
                chapters.append((cur_title, cur_sections))
        cur_title = None
        cur_sections = []
        free_body = []
        last_n = 0

    def open_chapter(title: str, sim_num: int | None = None):
        """Open a new chapter; if sim_num is provided, sync sim_counter to it."""
        nonlocal cur_title, cur_sections, free_body, last_n, sim_counter
        cur_title = title
        cur_sections = []
        free_body = []
        last_n = 0
        if sim_num is not None:
            sim_counter = sim_num

    for ln in lines:
        divider = _detect_hermas_divider(ln)
        if divider is not None:
            flush_chapter()
            if divider == "__AUTO__":
                sim_counter += 1
                open_chapter(f"Similitude {sim_counter}")
            elif divider == "Similitude 1":
                open_chapter("Similitude 1", sim_num=1)
            elif divider == "Similitude 10":
                # Sync sim_counter so that any section-reset inside Sim 10
                # doesn't auto-create "Similitude 11" (we cap at 10).
                open_chapter("Similitude 10", sim_num=10)
            else:
                open_chapter(divider)
            continue
        if _is_page_noise(ln):
            continue
        m = _SECTION_MARKER.match(ln)
        if m:
            cand = int(m.group(1))
            # Within a Hermas chapter, numbering restarts at 1 and counts up
            # monotonically. Allow sanity bound; reject obvious page-noise.
            if 1 <= cand <= 99 and cand >= (last_n - 5) and cand <= (last_n + 30):
                # Implicit-chapter heuristic: inside the Similitudes
                # tail (Sim 5+ region), a hard reset from N≥3 back to 1
                # indicates an unmarked Similitude break (Sim 6-9 lack
                # explicit `ANOTHER PARABLE.` in OCR).
                if (cand == 1 and last_n >= 3 and cur_title is not None
                        and cur_title.startswith("Similitude")
                        and sim_counter < 10):
                    flush_chapter()
                    sim_counter += 1
                    open_chapter(f"Similitude {sim_counter}")
                flush_section()
                cur_num = cand
                cur_body = [m.group(2)]
                last_n = cand
                continue
        if cur_num is not None:
            cur_body.append(ln.strip())
        elif cur_title is not None:
            # Inside a chapter but no section started — accumulate as free body
            free_body.append(ln.strip())
    flush_chapter()

    if not chapters:
        return ""
    out: list[str] = []
    for title, sections in chapters:
        out.append(f"# {title}")
        out.append("")
        for n, body in sections:
            out.append(f"{n}.  {body}")
        out.append("")
    return "\n".join(out)


# ---------------------------------------------------------------------------
# Roman-numeral fragment parser (session 31 — Papias & Reliques)
# ---------------------------------------------------------------------------
#
# Papias and Reliques use Roman-numeral fragment markers (`i`, `ii`,
# `iii`, ... up through `XX` and similar). OCR variability:
#   - early fragments often lowercase (`i`, `ii`, `iii`)
#   - later fragments uppercase (`XIX.`, `XX.`)
#   - some garbled (`li,` for `II.`; `Vill.` for `VIII.`; `iV,` for `IV.`)
# We accept any standalone line that looks like a Roman numeral, with
# tolerant trailing punctuation. Bodies contain Greek glyphs which we
# preserve as-is — the line-joiner just concatenates non-empty lines.

# Match any standalone Roman-numeral line. Tolerates:
#   - upper or lower or mixed case
#   - OCR substitutions: l ↔ I, 1 ↔ I (we allow `l` in the char class)
#   - trailing `.` or `,` (comma is a common period mis-OCR)
_ROMAN_MARKER = re.compile(r"^\s*([ivxlcdmIVXLCDM]{1,7})\s*[.,;:]?\s*$")

# Permissible Roman-numeral character: case-insensitive sanity (must
# contain at least one Roman char). We don't strictly parse Roman →
# integer because the OCR has too many edge cases; instead we treat each
# standalone match as a sequential fragment marker.
_ROMAN_VALID = re.compile(r"^[ivxlcdmIVXLCDM]+$")


def _roman_to_int(s: str) -> int | None:
    """Loose Roman → int converter. Maps 'l' to 'I' before parsing to
    absorb the most common OCR substitution. Returns None if unparseable."""
    if not s:
        return None
    # Normalise OCR: lone `l` is almost always `I`; `vlI` → `VII` style
    t = s.upper().replace("L", "I")
    # Filter to canonical Roman chars only
    if not re.fullmatch(r"[IVXLCDM]+", t):
        return None
    vals = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
    total = 0
    prev = 0
    for ch in reversed(t):
        v = vals.get(ch, 0)
        if v < prev:
            total -= v
        else:
            total += v
        prev = v
    if total <= 0 or total > 99:
        return None
    return total


def _parse_roman_fragments(lines: list[str]) -> str:
    """Parse Papias/Reliques: Roman-numeral fragment markers, Greek-glyph-
    tolerant section bodies. Emits a single chapter with sequential
    fragment numbers (recomputed left-to-right; we don't trust OCR's
    `XIX. → XX.` perfectly, but sequential 1, 2, 3, ... within each book
    matches our flat-verse output convention).
    """
    fragments: list[str] = []
    cur_body: list[str] = []
    started = False
    last_int = 0

    def flush():
        nonlocal cur_body
        if cur_body:
            text = re.sub(r"\s+", " ", " ".join(s.strip() for s in cur_body if s.strip())).strip()
            if text:
                fragments.append(text)
        cur_body = []

    for ln in lines:
        if _is_page_noise(ln):
            continue
        m = _ROMAN_MARKER.match(ln)
        if m:
            token = m.group(1)
            if _ROMAN_VALID.match(token):
                n = _roman_to_int(token)
                # Sanity gate: accept if it's a plausible next number
                # (current_int +/- some drift) OR if we haven't started yet
                # (first marker can be `i` = 1).
                if n is None:
                    pass
                elif not started:
                    # First marker; require n in [1, 5] to start cleanly
                    if 1 <= n <= 5:
                        flush()
                        started = True
                        last_int = n
                        continue
                else:
                    # Continuing; allow drift within [last_int-2, last_int+5]
                    if (last_int - 2) <= n <= (last_int + 5):
                        flush()
                        last_int = n
                        continue
        if started:
            cur_body.append(ln.strip())
    flush()

    if not fragments:
        return ""
    out = ["# Chapter 1", ""]
    for i, body in enumerate(fragments, start=1):
        out.append(f"{i}.  {body}")
    return "\n".join(out)


# ---------------------------------------------------------------------------
# Flat (default) parser
# ---------------------------------------------------------------------------

def _parse_flat(lines: list[str]) -> str:
    """Parse a book's line range into the canonical format:

      # Chapter 1
      1.  text...
      2.  text...
    """
    sections: list[tuple[int, list[str]]] = []
    cur_num: int | None = None
    cur_body: list[str] = []
    last_n = 0

    def flush():
        nonlocal cur_num, cur_body
        if cur_num is not None and cur_body:
            text = " ".join(s.strip() for s in cur_body if s.strip())
            text = re.sub(r"\s+", " ", text).strip()
            if text:
                sections.append((cur_num, [text]))
        cur_num = None
        cur_body = []

    for ln in lines:
        if _is_page_noise(ln):
            continue
        m = _SECTION_MARKER.match(ln)
        if m:
            cand = int(m.group(1))
            # Sanity: monotonic-ish; allow small drift, reject if cand
            # is wildly off (page-noise like `872.`)
            if cand <= 250 and cand >= (last_n - 5) and cand <= (last_n + 50):
                flush()
                cur_num = cand
                cur_body = [m.group(2)]
                last_n = cand
                continue
        if cur_num is not None:
            cur_body.append(ln.strip())
    flush()

    if not sections:
        return ""
    out = ["# Chapter 1", ""]
    for n, body_parts in sections:
        out.append(f"{n}.  " + " ".join(body_parts))
    return "\n".join(out)


def _parse_book_body(lines: list[str], parser_kind: str = "flat") -> str:
    """Dispatch by parser_kind. Defaults to flat for backwards compat."""
    if parser_kind == "hermas-multi-tier":
        return _parse_hermas(lines)
    if parser_kind == "roman-fragments":
        return _parse_roman_fragments(lines)
    return _parse_flat(lines)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def write_full():
    os.makedirs(OUT_DIR, exist_ok=True)
    text = _load_source_text()
    lines = text.split("\n")
    boundaries = _find_book_boundaries(lines)
    out_blocks: list[str] = []
    total_v = 0
    total_c = 0
    for slug, title, s, e, parser_kind in boundaries:
        body_lines = lines[s + 1 : e]  # skip the opener line itself
        parsed = _parse_book_body(body_lines, parser_kind)
        n_verses = len(re.findall(r"^\d+\.\s", parsed, re.M))
        # Multi-chapter books emit `# <Chapter>` headers; flat books
        # emit only `# Chapter 1`. Count any `# ` header inside the
        # parsed block — they're all chapter dividers.
        n_chapters = len(re.findall(r"^# ", parsed, re.M))
        total_v += n_verses
        total_c += n_chapters
        print(f"  [{slug:30s}] lines {s}-{e}  chapters={n_chapters}  verses={n_verses}  "
              f"kind={parser_kind}  ({title})")
        out_blocks.append(f"# {title}\n")
        out_blocks.append(parsed)
        out_blocks.append("\n")
    body = "\n".join(out_blocks)
    with open(OUT_TXT, "w", encoding="utf-8") as f:
        f.write(body)
    n_lines = len(body.split("\n"))
    print(f"\nwrote {OUT_TXT} ({n_lines} total lines across {len(boundaries)} books; "
          f"{total_c} chapters / {total_v} verses)")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--full", action="store_true",
                    help="Extract all books in BOOKS to lightfoot-apostolic-fathers.txt")
    ap.add_argument("--book", default=None,
                    help="Extract a specific book by slug")
    args = ap.parse_args()

    if args.full:
        write_full()
        return 0
    if args.book:
        text = _load_source_text()
        lines = text.split("\n")
        boundaries = _find_book_boundaries(lines)
        match = next((b for b in boundaries if b[0] == args.book), None)
        if match is None:
            print(f"unknown book {args.book!r}; available: {[b[0] for b in boundaries]}",
                  file=sys.stderr)
            return 1
        slug, title, s, e, parser_kind = match
        body_lines = lines[s + 1 : e]
        parsed = _parse_book_body(body_lines, parser_kind)
        print(f"# {title}\n")
        print(parsed)
        return 0
    # Default: list books
    text = _load_source_text()
    lines = text.split("\n")
    boundaries = _find_book_boundaries(lines)
    for slug, title, s, e, parser_kind in boundaries:
        print(f"  {slug:30s} lines {s}-{e}  kind={parser_kind}  ({title})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
