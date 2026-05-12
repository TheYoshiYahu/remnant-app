#!/usr/bin/env python3
"""
parse_pseudepigrapha_edition.py
-------------------------------
W-3 structural parser for the restored Charles 1913 vol 2 Pseudepigrapha edition.

Reads:  ~/Desktop/App/source-texts/pseudepigrapha-charles-vol2/charles-pseudepigrapha-restored.txt
Writes: ~/Desktop/App/source-texts/parsed/pseudepigrapha-charles-vol2.json

The restored .txt is produced session 21–22 by parse_charles_pseudepigrapha.py
(PDF extraction + per-book convention dispatch + chapter-aware emission) →
restore.py (sacred-name restoration). This script reads that body text and
emits a structured JSON matching the shape seed.py consumes:

    {
      "edition_id": "pseudepigrapha",
      "title": "The Pseudepigrapha (Charles 1913) — Restored Names Edition",
      "source_file": "charles-pseudepigrapha-restored.txt",
      "front_matter": "",
      "books": [
        {
          "book_id": "aristeas",
          "book_title": "The Letter of Aristeas",
          "chapters": [
            {"number": 1, "title": "", "verses": [{"number": 1, "text": "..."}, ...]},
            ...
          ]
        },
        ...
      ]
    }

Edition structure (per _CHARLES_VOL2_BOUNDARIES.md, locked session 20–22):
- 15 labeled books (Jubilees and 1 Enoch HELD per Decisions §1–§2).
- Verse markers: `N.  ` (digit, period, two spaces) at line start — same
  convention as Whiston Josephus. See parse_josephus_edition.py.
- Chapter markers: `# <label>` at line start. The label varies per Decisions
  §10–§12 (testaments-named: `Reuben Chapter N`, `Simeon Chapter N`, …,
  `Yahudah (Judah) Chapter N`, …, `Benjamin Chapter N`; adam-eve-roman:
  `Apoc. Moses Chapter N` / `Vita Adae Chapter N`; sibylline-paren:
  `Chapter Fragment III` / `Chapter Book III` / `Chapter Book IV` /
  `Chapter Book V`; standard: `Chapter N`).
- Sequential 1..N chapter numbering within each book, with the full marker
  label preserved in chapter.title. This keeps (book_id, chapter_number)
  unique while preserving human-citation labels in the UI. Ahikar's chaotic
  OCR-mangled chapter numbering (1, 2, 8, 38, 5, 4, 5, 7, 8 — with `Chapter 5`
  and `Chapter 8` each duplicated) and testaments-xii's per-testament chapter
  resets both motivate sequential numbering.
- Books with no internal chapter markers (Aristeas's 224 §-sections, Pirké
  Aboth's flat sayings sequence per W-3 spec) get one synthetic chapter per
  book with sections-as-verses — matches the Whiston Life/Apion pattern.

Apparatus-drop discipline already applied at extraction time (session 21–22,
Decisions §6). This parser does not re-process apparatus — the restored .txt
has Charles's General Introduction, Addenda et Corrigenda, Symbols and
Abbreviations index, per-translator introductions, textual apparatus, and
critical-note footnotes already stripped.
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
    "pseudepigrapha-charles-vol2",
    "charles-pseudepigrapha-restored.txt",
)
OUT_DIR = os.path.join(ROOT, "source-texts", "parsed")
OUT_PATH = os.path.join(OUT_DIR, "pseudepigrapha-charles-vol2.json")
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
# Book opener map (matches boundary file order; all 15 books)
# ---------------------------------------------------------------------------
# Each entry: (book_id, opener_line, display_title, has_chapters)
# has_chapters=False means the book has no internal `# <label>` chapter
# headings in the restored .txt — its sections are numbered `N.  ` and we
# treat them as verses of one synthetic chapter (chapter number 1, title "").
# Per W-3 spec: aristeas and pirke-aboth are the two flat books in this
# edition (Aristeas's 224 §-sections, Pirké Aboth's flat sayings sequence).

BOOKS_IN_ORDER: list[tuple[str, str, str, bool]] = [
    # SCOPE LOCKED 2026-05-12 (session 32) — seven books only, per Yoshi's
    # SOURCE_TEXT_INVENTORY.md. Bucket C HOLD entries (aristeas, sibylline,
    # assumption-moses, psalms-solomon, pirke-aboth) and off-manifest
    # entries (ahikar, zadokite-fragments) removed. 4-ezra removed as
    # duplicate of charles_apocrypha 2 Esdras (Bensly fragment lands there).
    ("adam-eve",            "# The Books of Adam and Eve",                       "The Books of Adam and Eve",                          True),
    # SCOPE LOCKED 2026-05-12 (session 32, second pass): martyrdom-isaiah
    # removed — full Ascension of Isaiah now in ascension-isaiah edition
    # (Charles 1900), which contains the Martyrdom (ch 1-5) as part of the
    # composite.
    ("testaments-xii",      "# The Testaments of the XII Patriarchs",            "The Testaments of the XII Patriarchs",               True),
    ("2-enoch",             "# 2 Enoch (The Book of the Secrets of Enoch)",      "2 Enoch (The Book of the Secrets of Enoch)",         True),
    ("2-baruch",            "# 2 Baruch (The Syriac Apocalypse)",                "2 Baruch (The Syriac Apocalypse)",                   True),
    ("3-baruch",            "# 3 Baruch (The Greek Apocalypse)",                 "3 Baruch (The Greek Apocalypse)",                    True),
    ("4-maccabees",         "# 4 Maccabees",                                     "4 Maccabees",                                        True),
]


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

# Any line starting with `# ` inside a book's body is a chapter header.
# (Book openers are also `# <title>` lines; we slice books first by opener
# match, then look for chapter headers WITHIN each book's body — so book
# openers don't get re-matched as chapter headers.)
CHAPTER_HEADING_RE = re.compile(r"^# (.+)$", re.MULTILINE)

# Verse marker: `N.  ` (digit, period, TWO-OR-MORE spaces) at line start.
# Same convention as Whiston Josephus (the parse_charles_pseudepigrapha.py
# emission session 21–22 normalized to this form).
VERSE_MARKER_RE = re.compile(r"^(\d+)\.\s{2,}(.*)$", re.MULTILINE)


def normalize_text(s: str) -> str:
    """Collapse whitespace within a verse to a single space; preserve content."""
    s = re.sub(r"\s+", " ", s)
    return s.strip()


def split_verses(block: str) -> list[Verse]:
    """
    Walk `N.  ` verse markers at line start and emit one Verse per marker.
    Mid-paragraph continuations carry NO marker — they flow as new lines
    belonging to the preceding verse.

    Monotonic-increasing filter discards spurious numeric prefixes (years
    or list items inside running prose). The first match establishes the
    chain's starting number; numbers can be non-contiguous (OCR-lost verse
    markers leave gaps — e.g., 4 Ezra ch 3 begins at verse 3 because verses
    1 and 2 are OCR-merged into the prior chapter / chapter-intro material)
    but must be strictly increasing within a chapter.

    Transplanted from parse_josephus_edition.py's split_verses() with no
    behavioural change — the Whiston/Charles emission shapes are identical
    at the verse-marker layer.
    """
    matches = list(VERSE_MARKER_RE.finditer(block))
    if not matches:
        # No markers — entire block is verse 1.
        flat = normalize_text(block)
        return [Verse(number=1, text=flat)] if flat else []

    # Monotonic filter — accept only N values that form a strictly increasing
    # chain from the first match.
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
        # Strip leading "N.  "
        body = re.sub(r"^\d+\.\s{2,}", "", body)
        text = normalize_text(body)
        if text:
            verses.append(Verse(number=n, text=text))

    return verses


def parse_book(book_id: str, book_body: str, has_chapters: bool) -> list[Chapter]:
    """
    Parse one book's body text into a list of Chapter objects.

    For has_chapters=False (aristeas, pirke-aboth): one synthetic chapter
    containing all of the body's `N.  ` sections as verses.

    For has_chapters=True (all other books): split on `^# <label>` markers,
    sequentially number chapters 1..N within the book, and preserve the
    full marker label as chapter.title. Sequential numbering is uniform
    across all conventions (standard `Chapter N`, testaments-named
    `Reuben Chapter N`, adam-eve-roman `Apoc. Moses Chapter N`, sibylline
    `Chapter Book III`, ahikar's chaotic `Chapter N` re-uses) to keep the
    (book_id, chapter_number) database key unique and stable.
    """
    if not has_chapters:
        verses = split_verses(book_body)
        return [Chapter(number=1, title="", verses=verses)]

    chapter_matches = list(CHAPTER_HEADING_RE.finditer(book_body))
    if not chapter_matches:
        # Shouldn't happen for has_chapters=True books, but degrade gracefully.
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
    """Parse the full restored Charles vol 2 body into an Edition object."""
    edition = Edition(
        edition_id="pseudepigrapha",
        title="The Pseudepigrapha (Charles 1913) — Restored Names Edition",
        source_file="charles-pseudepigrapha-restored.txt",
    )

    # Locate each book opener line and build slice indices.
    opener_indices: list[tuple[int, str, str, str, bool]] = []
    cursor = 0
    for book_id, opener, display_title, has_chapters in BOOKS_IN_ORDER:
        # The opener line appears exactly once at this position in the file.
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

    # Front matter is text before the first opener (Charles vol 2's restored
    # .txt starts with the first book opener on line 1, so this is empty
    # in practice).
    if opener_indices:
        edition.front_matter = text[: opener_indices[0][0]].strip()

    # Walk the books, slicing each one's body between its opener and the next.
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
        f"pseudepigrapha books={len(edition.books):3d}  "
        f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
        f"-> {OUT_PATH}"
    )

    # Per-book summary for sanity-checking against the boundary file
    # (_CHARLES_VOL2_BOUNDARIES.md session-22 entry).
    print()
    print("Per-book counts:")
    for b in edition.books:
        ch = len(b.chapters)
        vs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:20s}  chapters={ch:4d}  verses={vs:5d}  {b.book_title}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
