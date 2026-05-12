#!/usr/bin/env python3
"""
parse_apocrypha_charles_vol1_edition.py
---------------------------------------
W-2 vol1-m structural parser for the restored Charles 1913 vol 1 Apocrypha
edition (NEW edition `apocrypha-charles-vol1` per session-25 Yoshi
Decision §1).

Reads:  ~/Desktop/App/source-texts/apocrypha-charles-vol1/charles-apocrypha-restored.txt
Writes: ~/Desktop/App/source-texts/parsed/apocrypha-charles-vol1.json

The restored .txt is produced by parse_charles_apocrypha.py (OCR cache +
per-book convention dispatch + chapter-aware emission) → restore.py
(sacred-name restoration, idempotent). This script reads that body text
and emits a structured JSON matching the shape seed.py consumes:

    {
      "edition_id": "apocrypha-charles-vol1",
      "title": "The Apocrypha (Charles 1913) — Restored Names Edition",
      "source_file": "charles-apocrypha-restored.txt",
      "front_matter": "",
      "books": [
        {
          "book_id": "1-esdras",
          "book_title": "1 Esdras",
          "chapters": [
            {"number": 1, "title": "", "verses": [{"number": 1, "text": "..."}, ...]},
            ...
          ]
        },
        ...
      ]
    }

Edition structure (per `_CHARLES_VOL1_BOUNDARIES.md`, locked sessions 25–27):
- 15 labeled books — see BOOKS table in the boundary file.
- Verse markers: `N.  ` (digit, period, two spaces) at line start — same
  convention as Whiston Josephus and Charles vol 2.
- Chapter markers: `# Chapter N` at line start (vol-1 books use the
  standard convention; no testaments-named or sibylline variants here).
- Prayer of Manasses is the single flat book (single-chapter prayer with
  no internal chapter markers — emitted as one synthetic chapter).
- Song of Three is KEPT COMBINED per Yoshi session-26 decision (no split
  into Azariah-prayer / Three-children-song); the structural parser
  treats it as a single book with its chapter-verse-hdr emission.

Apparatus-drop discipline is applied at extraction time (vol1-g header
strip, vol1-k-3 translator-apparatus tail truncation, plus the inherited
vol-2 footnote-strip pipeline). This parser does not re-process
apparatus.
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
SRC_PATH = os.path.join(
    ROOT,
    "source-texts",
    "apocrypha-charles-vol1",
    "charles-apocrypha-restored.txt",
)
OUT_DIR = os.path.join(ROOT, "source-texts", "parsed")
OUT_PATH = os.path.join(OUT_DIR, "apocrypha-charles-vol1.json")
os.makedirs(OUT_DIR, exist_ok=True)


# ---------------------------------------------------------------------------
# Data shapes (identical to parse_pseudepigrapha_edition.py)
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
# Book opener map (matches BOOKS table order in parse_charles_apocrypha.py;
# all 15 books)
# ---------------------------------------------------------------------------
# Each entry: (book_id, opener_line, display_title, has_chapters)
# has_chapters=False means the book has no internal `# Chapter N` heading
# in the restored .txt — its body is treated as one synthetic chapter
# with N. markers as verses (Prayer of Manasses).

BOOKS_IN_ORDER: list[tuple[str, str, str, bool]] = [
    ("1-esdras",            "# 1 Esdras",                                                  "1 Esdras",                                                    True),
    ("1-maccabees",         "# 1 Maccabees",                                               "1 Maccabees",                                                 True),
    ("2-maccabees",         "# 2 Maccabees",                                               "2 Maccabees",                                                 True),
    ("3-maccabees",         "# 3 Maccabees",                                               "3 Maccabees",                                                 True),
    ("tobit",               "# Tobit",                                                     "Tobit",                                                       True),
    ("judith",              "# Judith",                                                    "Judith",                                                      True),
    ("sirach",              "# Sirach (Ecclesiasticus)",                                   "Sirach (Ecclesiasticus)",                                     True),
    ("wisdom-of-solomon",   "# The Wisdom of Solomon",                                     "The Wisdom of Solomon",                                       True),
    ("1-baruch",            "# 1 Baruch",                                                  "1 Baruch",                                                    True),
    ("epistle-of-jeremy",   "# The Epistle of Jeremy",                                     "The Epistle of Jeremy",                                       True),
    ("prayer-of-manasses",  "# The Prayer of Manasses",                                    "The Prayer of Manasses",                                      False),
    ("song-of-three",       "# The Prayer of Azariah and the Song of the Three Children",  "The Prayer of Azariah and the Song of the Three Children",    True),
    ("susanna",             "# The History of Susanna",                                    "The History of Susanna",                                      True),
    ("bel-and-dragon",      "# The History of Bel and the Dragon",                         "The History of Bel and the Dragon",                           True),
    ("additions-to-esther", "# The Additions to Esther",                                   "The Additions to Esther",                                     True),
]


# ---------------------------------------------------------------------------
# Helpers (identical to parse_pseudepigrapha_edition.py — vol 1 emission
# shape is the same as vol 2 / Whiston Josephus)
# ---------------------------------------------------------------------------

CHAPTER_HEADING_RE = re.compile(r"^# (.+)$", re.MULTILINE)
VERSE_MARKER_RE = re.compile(r"^(\d+)\.\s{2,}(.*)$", re.MULTILINE)


def normalize_text(s: str) -> str:
    """Collapse whitespace within a verse to a single space; preserve content."""
    s = re.sub(r"\s+", " ", s)
    return s.strip()


def split_verses(block: str) -> list[Verse]:
    """Walk `N.  ` verse markers at line start and emit one Verse per marker.

    Monotonic-increasing filter discards spurious numeric prefixes
    (years, list items inside running prose). The first match establishes
    the chain's starting number; numbers can be non-contiguous (OCR-lost
    verse markers leave gaps) but must be strictly increasing within a
    chapter.

    Transplanted from parse_pseudepigrapha_edition.split_verses() with no
    behavioural change — Charles vol 1 and vol 2 share the same emission
    shape at the verse-marker layer.
    """
    matches = list(VERSE_MARKER_RE.finditer(block))
    if not matches:
        flat = normalize_text(block)
        return [Verse(number=1, text=flat)] if flat else []

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
        body = block[start:end]
        body = re.sub(r"^\d+\.\s{2,}", "", body)
        text = normalize_text(body)
        if text:
            verses.append(Verse(number=n, text=text))

    return verses


def parse_book(book_id: str, book_body: str, has_chapters: bool) -> list[Chapter]:
    """Parse one book's body text into a list of Chapter objects.

    For has_chapters=False (Prayer of Manasses): one synthetic chapter
    containing all of the body's `N.  ` sections as verses.

    For has_chapters=True (all other vol-1 books): split on `^# Chapter N`
    markers, sequentially number chapters 1..N within the book, and
    preserve the full marker label as chapter.title. Charles vol-1 books
    use the standard `Chapter N` convention; sequential renumbering is
    a stability guard against OCR-mangled chapter numbers that vol1-k-2
    has already filtered.
    """
    if not has_chapters:
        verses = split_verses(book_body)
        return [Chapter(number=1, title="", verses=verses)]

    chapter_matches = list(CHAPTER_HEADING_RE.finditer(book_body))
    if not chapter_matches:
        verses = split_verses(book_body)
        return [Chapter(number=1, title="", verses=verses)]

    chapters: list[Chapter] = []
    for i, m in enumerate(chapter_matches):
        ch_label = m.group(1).strip()
        body_start = m.end()
        body_end = chapter_matches[i + 1].start() if i + 1 < len(chapter_matches) else len(book_body)
        body = book_body[body_start:body_end]

        chapters.append(
            Chapter(
                number=i + 1,
                title=ch_label,
                verses=split_verses(body),
            )
        )

    return chapters


def parse_edition(text: str) -> Edition:
    """Parse the full restored Charles vol 1 body into an Edition object."""
    edition = Edition(
        edition_id="apocrypha-charles-vol1",
        title="The Apocrypha (Charles 1913) — Restored Names Edition",
        source_file="charles-apocrypha-restored.txt",
    )

    # Locate each book opener line and build slice indices.
    opener_indices: list[tuple[int, str, str, str, bool]] = []
    cursor = 0
    for book_id, opener, display_title, has_chapters in BOOKS_IN_ORDER:
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

    if opener_indices:
        edition.front_matter = text[: opener_indices[0][0]].strip()

    for i, (start, book_id, opener, display_title, has_chapters) in enumerate(opener_indices):
        body_start = start + len(opener)
        body_end = opener_indices[i + 1][0] if i + 1 < len(opener_indices) else len(text)
        body = text[body_start:body_end]

        book = Book(book_id=book_id, book_title=display_title)
        book.chapters = parse_book(book_id, body, has_chapters)
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
        f"apocrypha-charles-vol1 books={len(edition.books):3d}  "
        f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
        f"-> {OUT_PATH}"
    )

    print()
    print("Per-book counts:")
    for b in edition.books:
        ch = len(b.chapters)
        vs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:22s}  chapters={ch:4d}  verses={vs:5d}  {b.book_title}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
