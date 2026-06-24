#!/usr/bin/env python3
"""
parse_josephus_edition.py
-------------------------
W-3 structural parser for the restored Whiston Josephus edition.

Reads:  ~/Desktop/App/source-texts/josephus/whiston-josephus-restored.txt
Writes: ~/Desktop/App/source-texts/parsed/josephus.json

The restored .txt was produced session 18 by parse_whiston_josephus.py
(PDF extraction) → restore.py (sacred-name restoration; possessive
handling added session 19). This script reads that body text and emits
a structured JSON matching the shape seed.py consumes:

    {
      "edition_id": "josephus",
      "title": "The Works of Flavius Josephus (Whiston 1737)",
      "source_file": "whiston-josephus-restored.txt",
      "front_matter": "",
      "books": [
        {
          "book_id": "wars-1",
          "book_title": "The Wars of the Yahudim (Jews) — Book I",
          "chapters": [
            {"number": 1, "title": "...", "verses": [{"number": 1, "text": "..."}, ...]},
            ...
          ]
        },
        ...
      ]
    }

Edition structure (per _WHISTON_BOUNDARIES.md, locked session 18):
- 30 labeled books (Hades held — Hippolytus authorship + ECT framing
  + Luke-16-as-literal-cosmology — see boundary file §4).
- Wars: 7 books (I–VII) with chapters and verses.
- Antiquities: 20 books (I–XX) with chapters and verses.
- Life: 1 book, no chapters (76 sections treated as verses of a
  single synthetic chapter).
- Against Apion: 2 books (I, II) with no chapter divisions in the
  PDF body — treated like Life as one synthetic chapter of N verses.
  (Verified at parse time; Apion's section numbering is 1.–N. inside
  each book the same way Life's is.)

Footnote-drop discipline already applied at extraction time (session 18,
Yoshi: "drop his foot notes, this is our bible"). This parser does not
re-process footnotes — the restored .txt has them stripped.
"""

from __future__ import annotations
import json
import os
import re
import sys
from dataclasses import dataclass, field, asdict
from typing import List


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
SRC_PATH = os.path.join(ROOT, "source-texts", "josephus", "whiston-josephus-restored.txt")
OUT_DIR = os.path.join(ROOT, "source-texts", "parsed")
OUT_PATH = os.path.join(OUT_DIR, "josephus.json")
os.makedirs(OUT_DIR, exist_ok=True)


# ---------------------------------------------------------------------------
# Data shapes
# ---------------------------------------------------------------------------

@dataclass
class Verse:
    number: int
    text: str


@dataclass
class Chapter:
    number: int
    title: str = ""
    verses: List[Verse] = field(default_factory=list)
    commentary: str = ""


@dataclass
class Book:
    book_id: str
    book_title: str
    chapters: List[Chapter] = field(default_factory=list)


@dataclass
class Edition:
    edition_id: str
    title: str
    source_file: str
    front_matter: str = ""
    books: List[Book] = field(default_factory=list)


# ---------------------------------------------------------------------------
# Book opener map (matches boundary file order; all 30 books)
# ---------------------------------------------------------------------------
# Each entry: (book_id, opener_line, display_title, has_chapters)
# has_chapters=False means the book has no internal "Chapter N." headings
# in the restored .txt — its sections are numbered `N.` and we treat them
# as verses of one synthetic chapter (chapter number 1, title "").
#
# Life is autobiography with 76 numbered sections, no chapter divisions.
# Apion I and II each have running numbered sections without "Chapter N."
# headings in Whiston — confirmed by inspection of the restored .txt at
# parse time.

BOOKS_IN_ORDER: list[tuple[str, str, str, bool]] = [
    # Wars (7 books)
    ("wars-1",       "The Wars of the Yahudim (Jews) — Book I",        "The Wars of the Yahudim (Jews) — Book I",       True),
    ("wars-2",       "The Wars of the Yahudim (Jews) — Book II",       "The Wars of the Yahudim (Jews) — Book II",      True),
    ("wars-3",       "The Wars of the Yahudim (Jews) — Book III",      "The Wars of the Yahudim (Jews) — Book III",     True),
    ("wars-4",       "The Wars of the Yahudim (Jews) — Book IV",       "The Wars of the Yahudim (Jews) — Book IV",      True),
    ("wars-5",       "The Wars of the Yahudim (Jews) — Book V",        "The Wars of the Yahudim (Jews) — Book V",       True),
    ("wars-6",       "The Wars of the Yahudim (Jews) — Book VI",       "The Wars of the Yahudim (Jews) — Book VI",      True),
    ("wars-7",       "The Wars of the Yahudim (Jews) — Book VII",      "The Wars of the Yahudim (Jews) — Book VII",     True),
    # Antiquities (20 books)
    ("antiq-1",      "Antiquities of the Yahudim (Jews) — Book I",     "Antiquities of the Yahudim (Jews) — Book I",    True),
    ("antiq-2",      "Antiquities of the Yahudim (Jews) — Book II",    "Antiquities of the Yahudim (Jews) — Book II",   True),
    ("antiq-3",      "Antiquities of the Yahudim (Jews) — Book III",   "Antiquities of the Yahudim (Jews) — Book III",  True),
    ("antiq-4",      "Antiquities of the Yahudim (Jews) — Book IV",    "Antiquities of the Yahudim (Jews) — Book IV",   True),
    ("antiq-5",      "Antiquities of the Yahudim (Jews) — Book V",     "Antiquities of the Yahudim (Jews) — Book V",    True),
    ("antiq-6",      "Antiquities of the Yahudim (Jews) — Book VI",    "Antiquities of the Yahudim (Jews) — Book VI",   True),
    ("antiq-7",      "Antiquities of the Yahudim (Jews) — Book VII",   "Antiquities of the Yahudim (Jews) — Book VII",  True),
    ("antiq-8",      "Antiquities of the Yahudim (Jews) — Book VIII",  "Antiquities of the Yahudim (Jews) — Book VIII", True),
    ("antiq-9",      "Antiquities of the Yahudim (Jews) — Book IX",    "Antiquities of the Yahudim (Jews) — Book IX",   True),
    ("antiq-10",     "Antiquities of the Yahudim (Jews) — Book X",     "Antiquities of the Yahudim (Jews) — Book X",    True),
    ("antiq-11",     "Antiquities of the Yahudim (Jews) — Book XI",    "Antiquities of the Yahudim (Jews) — Book XI",   True),
    ("antiq-12",     "Antiquities of the Yahudim (Jews) — Book XII",   "Antiquities of the Yahudim (Jews) — Book XII",  True),
    ("antiq-13",     "Antiquities of the Yahudim (Jews) — Book XIII",  "Antiquities of the Yahudim (Jews) — Book XIII", True),
    ("antiq-14",     "Antiquities of the Yahudim (Jews) — Book XIV",   "Antiquities of the Yahudim (Jews) — Book XIV",  True),
    ("antiq-15",     "Antiquities of the Yahudim (Jews) — Book XV",    "Antiquities of the Yahudim (Jews) — Book XV",   True),
    ("antiq-16",     "Antiquities of the Yahudim (Jews) — Book XVI",   "Antiquities of the Yahudim (Jews) — Book XVI",  True),
    ("antiq-17",     "Antiquities of the Yahudim (Jews) — Book XVII",  "Antiquities of the Yahudim (Jews) — Book XVII", True),
    ("antiq-18",     "Antiquities of the Yahudim (Jews) — Book XVIII", "Antiquities of the Yahudim (Jews) — Book XVIII",True),
    ("antiq-19",     "Antiquities of the Yahudim (Jews) — Book XIX",   "Antiquities of the Yahudim (Jews) — Book XIX",  True),
    ("antiq-20",     "Antiquities of the Yahudim (Jews) — Book XX",    "Antiquities of the Yahudim (Jews) — Book XX",   True),
    # Life (1 book — no chapters, 76 sections become verses of a single chapter)
    ("life",         "The Life of Flavius Josephus",                   "The Life of Flavius Josephus",                  False),
    # Apion (2 books — no chapters, sections become verses)
    ("apion-1",      "Flavius Josephus Against Apion — Book I",        "Flavius Josephus Against Apion — Book I",       False),
    ("apion-2",      "Flavius Josephus Against Apion — Book II",       "Flavius Josephus Against Apion — Book II",      False),
]


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

CHAPTER_HEADING_RE = re.compile(r"^Chapter\s+(\d+)\.\s*(.*)$", re.MULTILINE)
VERSE_MARKER_RE = re.compile(r"^(\d+)\.\s{2,}(.*)$", re.MULTILINE)

# --- S357 Josephus scrub: recover buried chapters + drop footnote bleed -----
# Some chapter headings survived the PDF extraction as raw uppercase
# "CHAPTER <roman|arabic>." — either glued inline to the end of the previous
# paragraph (e.g. "...we shall speak elsewhere. CHAPTER 9.") or as an
# un-normalized standalone caps/roman line ("CHAPTER V." / "CHAPTER 3"). The
# normalizer below didn't fire on these (it only matched mixed-case "Chapter
# N."), so the chapter's caption + sections were absorbed into the prior
# chapter's last verse and the chapter went missing from navigation. Recover
# them by rewriting every raw heading into the canonical "Chapter N. CAPTION"
# form (caption = the ALL-CAPS lines that follow, up to the first verse marker).
_ROMAN = {"I": 1, "II": 2, "III": 3, "IV": 4, "V": 5, "VI": 6, "VII": 7,
          "VIII": 8, "IX": 9, "X": 10}
_RAW_CHAPTER_RE = re.compile(r"\bCHAPTER\s+([IVXL]+|\d+)\.?")
_VERSE_LINE_RE = re.compile(r"^\s*\d+\.\s{2,}")


def _roman_or_int(tok: str) -> int:
    return int(tok) if tok.isdigit() else _ROMAN[tok]


def normalize_raw_chapter_headings(text: str) -> str:
    """Rewrite raw uppercase 'CHAPTER <n>.' headings into canonical
    'Chapter <arabic>. <CAPTION>' lines so the chapter splitter recovers them."""
    lines = text.split("\n")
    out: list[str] = []
    i = 0
    while i < len(lines):
        ln = lines[i]
        m = _RAW_CHAPTER_RE.search(ln)
        if m:
            num = _roman_or_int(m.group(1))
            before = ln[: m.start()].rstrip()
            tail = ln[m.end():].strip()
            cap_parts = [tail] if tail else []
            j = i + 1
            while j < len(lines):
                s = lines[j].strip()
                if s == "":
                    j += 1
                    continue
                if _VERSE_LINE_RE.match(lines[j]):
                    break
                cap_parts.append(s)
                j += 1
            caption = re.sub(r"\s+", " ", " ".join(cap_parts)).strip()
            if before:
                out.append(before)
                out.append("")
            out.append(f"Chapter {num}. {caption}")
            out.append("")
            i = j
            continue
        out.append(ln)
        i += 1
    return "\n".join(out)


# Whiston editorial footnotes that leaked as verses (the monotonic verse-number
# filter let footnotes numbered higher than the preceding verse through as
# standalone verses, and merged lower-numbered ones into the preceding verse's
# tail). Decision §5 (session 18): drop Whiston's footnotes entirely. These are
# the exact surviving cases (verified by editorial-signature sweep, S357).
_FOOTNOTE_PURE_HEADS = (
    "The entire buildings seem to have been called the New City",
    "And although Elohim (God) gave no direction for the lions",
    "Nor could Josephus well estimate it higher",
    "Of this Egyptian impostor, and the number of his followers",
)
# (genuine-text anchor) — truncate the verse to end at this anchor, dropping the
# footnote run merged onto its tail.
_FOOTNOTE_TRUNC_ANCHORS = (
    "These prisoners were taken on the eighth day of the month Gorpiaeus [Elul].",
    "having taken a resolution to gather all his other forces together at that place.",
    "they were blinded by that fate which was already coming upon the city, and upon themselves also.",
    "and Cyrenius, one that had been consul, was sent by Caesar to take account of people's effects in Syria, and to sell the house of Archelaus.",
    "Phannias, the son of Samuel.",
)


def strip_footnote_bleed(chapters: list[Chapter]) -> list[Chapter]:
    """Drop pure-footnote verses and truncate footnote tails merged onto
    genuine verses. Operates on already-parsed chapters."""
    for ch in chapters:
        kept: list[Verse] = []
        for v in ch.verses:
            if any(v.text.startswith(h) for h in _FOOTNOTE_PURE_HEADS):
                continue  # pure footnote — drop
            for anchor in _FOOTNOTE_TRUNC_ANCHORS:
                pos = v.text.find(anchor)
                if pos != -1 and not v.text.rstrip().endswith(anchor):
                    v.text = v.text[: pos + len(anchor)]
                    break
            kept.append(v)
        ch.verses = kept
    return chapters


# --- S357 paragraph walls -------------------------------------------------
# Many Josephus verses are a single very long Whiston section (e.g. Wars 2.16.4
# = Agrippa's whole oration, ~19k chars). Whiston himself didn't break them and
# they carry no internal section markers, so they render as solid walls. Break
# them into readable paragraphs by injecting \n\n at sentence-group boundaries.
# Whiston's section NUMBERING is preserved (the verse stays one cited section);
# the reader-app renderer splits \n\n into visual paragraphs.
_WALL_MIN = 1500     # only verses this long get internal paragraphing
_PARA_TARGET = 700   # aim for ~this many chars per sub-paragraph
_ABBR_END = re.compile(r"(?:ch|sect|B|c|v|vol|p|Mr|Dr|St|viz|etc|i\.e|e\.g)\.$", re.I)
_SENT_SPLIT = re.compile(r'(?<=[.?!])\s+(?=[A-Z"“‘(])')


def _paragraph_wall(text: str) -> str:
    if len(text) < _WALL_MIN or "\n" in text:
        return text
    parts = _SENT_SPLIT.split(text)
    sents: list[str] = []
    for p in parts:
        if sents and _ABBR_END.search(sents[-1]):
            sents[-1] = sents[-1] + " " + p
        else:
            sents.append(p)
    if len(sents) < 3:
        return text
    paras: list[str] = []
    cur = ""
    for s in sents:
        cur = (cur + " " + s).strip() if cur else s
        if len(cur) >= _PARA_TARGET:
            paras.append(cur)
            cur = ""
    if cur:
        if paras and len(cur) < 200:
            paras[-1] = paras[-1] + " " + cur
        else:
            paras.append(cur)
    return "\n\n".join(paras) if len(paras) > 1 else text


def break_walls(chapters: list[Chapter]) -> list[Chapter]:
    for ch in chapters:
        for v in ch.verses:
            v.text = _paragraph_wall(v.text)
    return chapters


def normalize_text(s: str) -> str:
    """Collapse whitespace within a verse to a single space; preserve content."""
    s = re.sub(r"\s+", " ", s)
    return s.strip()


def split_verses(block: str) -> list[Verse]:
    """
    Whiston's verse markers are `N.  ` (number, period, two spaces) at the
    start of a paragraph. Mid-paragraph continuations carry NO marker — they
    flow as new lines belonging to the preceding verse.

    Monotonic-increasing filter discards spurious numeric prefixes (years,
    list items inside running prose) — only N values that fit the +1 chain
    from the chapter's first verse are accepted as verse boundaries. The
    chain is rooted at 1 unless a chapter genuinely starts higher (e.g.,
    Wars Book II Chapter 1 occasionally starts mid-section — keep verses
    starting from any number and let monotonic do the gate-keeping).
    """
    # Flatten to a single string with all whitespace runs (including newlines)
    # collapsed — verse boundaries are then identified by the `(?:^|\s)N.\s\s+`
    # pattern. We DON'T flatten until we've found the boundaries, so that
    # the ^-anchored verse markers stay anchored to actual line starts where
    # Whiston's verse-marker convention applies.

    matches = list(VERSE_MARKER_RE.finditer(block))
    if not matches:
        # No markers — entire block is verse 1.
        flat = normalize_text(block)
        return [Verse(number=1, text=flat)] if flat else []

    # Monotonic filter — accept only N values that form a strictly increasing
    # chain from the first match. The first marker establishes the starting
    # number (typically 1; for some chapter-1 cases that quote-restart from
    # a higher number, the first marker can be ≥1 — accept whatever it is).
    valid = []
    last = -1
    for m in matches:
        n = int(m.group(1))
        if n > last:
            valid.append((m, n))
            last = n

    verses: list[Verse] = []
    for i, (m, n) in enumerate(valid):
        start = m.start()
        end = valid[i + 1][0].start() if i + 1 < len(valid) else len(block)
        # Verse body is everything from the marker's line to the next marker's
        # line — strip the leading "N.  " then normalize.
        body = block[start:end]
        # Strip leading "N.  "
        body = re.sub(r"^\d+\.\s{2,}", "", body)
        text = normalize_text(body)
        if text:
            verses.append(Verse(number=n, text=text))

    return verses


def parse_book(book_id: str, book_body: str, has_chapters: bool) -> list[Chapter]:
    """Parse one book's body text into a list of Chapter objects."""
    if not has_chapters:
        # Life / Apion — no Chapter N. headings; the whole body is verses
        # of one synthetic chapter (number 1, no title).
        verses = split_verses(book_body)
        return [Chapter(number=1, title="", verses=verses)]

    chapter_matches = list(CHAPTER_HEADING_RE.finditer(book_body))
    if not chapter_matches:
        # Shouldn't happen for has_chapters=True books, but degrade gracefully.
        verses = split_verses(book_body)
        return [Chapter(number=1, title="", verses=verses)]

    # S357+ POSITIONAL chapter numbering. The source carries chapter-number
    # TYPOS: antiq-5 prints two consecutive "Chapter 8." (the real ch7 + ch8);
    # antiq-12 mislabels ch4 as "6"; antiq-13 mislabels ch4 as "7". The old
    # seen_numbers-dedup dropped the duplicate-numbered chapter and mangled its
    # sections into the prior chapter's tail. Numbering chapters 1..N by their
    # detection ORDER (every heading begins its own chapter) self-corrects the
    # typos and recovers those chapters. Whiston body text never starts a line
    # with "Chapter N." outside a real heading, and normalize_raw_chapter_
    # headings has already canonicalized every recovered heading, so order-based
    # numbering is safe. Footnote stripping is text-anchored (coordinate-free),
    # so the renumber does not disturb it.
    chapters: list[Chapter] = []
    for i, m in enumerate(chapter_matches):
        ch_title = normalize_text(m.group(2) or "")
        body_start = m.end()
        body_end = chapter_matches[i + 1].start() if i + 1 < len(chapter_matches) else len(book_body)
        body = book_body[body_start:body_end]
        chapters.append(
            Chapter(
                number=i + 1,
                title=ch_title,
                verses=split_verses(body),
            )
        )

    return chapters


def parse_edition(text: str) -> Edition:
    """Parse the full restored Whiston body into an Edition object."""
    # S357 — recover buried chapters whose raw "CHAPTER N." headings the
    # mixed-case normalizer missed (inline-glued or un-normalized caps/roman).
    text = normalize_raw_chapter_headings(text)
    edition = Edition(
        edition_id="josephus",
        title="The Works of Flavius Josephus (Whiston 1737)",
        source_file="whiston-josephus-restored.txt",
    )

    # Locate each book opener line and build slice indices.
    opener_indices: list[tuple[int, str, str, str, bool]] = []
    cursor = 0
    for book_id, opener, display_title, has_chapters in BOOKS_IN_ORDER:
        # The opener line appears at most once at this position in the file.
        # Search forward from the cursor so the order is enforced and any
        # commentary mention of the title elsewhere is bypassed.
        idx = text.find("\n" + opener + "\n", cursor)
        if idx == -1:
            # Try start-of-file boundary for the first book.
            if cursor == 0 and text.startswith(opener + "\n"):
                idx = 0
            else:
                raise RuntimeError(
                    f"Could not locate book opener for {book_id!r}: {opener!r}"
                )
        else:
            idx += 1  # skip the leading newline so idx points at opener start
        opener_indices.append((idx, book_id, opener, display_title, has_chapters))
        cursor = idx + len(opener)

    # Front matter is text before the first opener (Whiston's edition starts
    # with the first book opener on line 1, so this is empty in practice).
    if opener_indices:
        edition.front_matter = text[: opener_indices[0][0]].strip()

    # Walk the books, slicing each one's body between its opener and the next.
    for i, (start, book_id, opener, display_title, has_chapters) in enumerate(opener_indices):
        body_start = start + len(opener)
        body_end = opener_indices[i + 1][0] if i + 1 < len(opener_indices) else len(text)
        body = text[body_start:body_end]

        book = Book(book_id=book_id, book_title=display_title)
        chapters = parse_book(book_id, body, has_chapters)
        book.chapters = break_walls(strip_footnote_bleed(chapters))
        edition.books.append(book)

    return edition


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main():
    if not os.path.exists(SRC_PATH):
        print(f"[error] source not found: {SRC_PATH}", file=sys.stderr)
        return 2

    with open(SRC_PATH, "r", encoding="utf-8") as f:
        text = f.read()

    edition = parse_edition(text)

    with open(OUT_PATH, "w", encoding="utf-8") as f:
        json.dump(asdict(edition), f, ensure_ascii=False, indent=2)

    total_chapters = sum(len(b.chapters) for b in edition.books)
    total_verses = sum(len(c.verses) for b in edition.books for c in b.chapters)
    print(
        f"josephus      books={len(edition.books):3d}  "
        f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
        f"-> {OUT_PATH}"
    )

    # Per-book summary for sanity-checking against the boundary file.
    print()
    print("Per-book counts:")
    for b in edition.books:
        ch = len(b.chapters)
        vs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:12s}  chapters={ch:3d}  verses={vs:5d}  {b.book_title}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
