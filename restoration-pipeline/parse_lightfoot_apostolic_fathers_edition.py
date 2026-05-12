#!/usr/bin/env python3
"""
parse_lightfoot_apostolic_fathers_edition.py
--------------------------------------------
W-2 structural parser for the restored Lightfoot+Harmer 1891 Apostolic
Fathers edition (slug `lightfoot-apostolic-fathers`, session 30).

Reads:  ~/Desktop/App/source-texts/lightfoot-apostolic-fathers/lightfoot-apostolic-fathers-restored.txt
Writes: ~/Desktop/App/source-texts/parsed/lightfoot-apostolic-fathers.json

Edition layout: 17 books — 15 traditional Apostolic Fathers entries +
Papias fragments + Reliques of the Elders (Lightfoot+Harmer 1891
table-of-contents order). Each book emits a single chapter with N
numbered sections as verses (M.R. James-style flat layout).
"""

from __future__ import annotations
import json
import os
import re
import sys
from dataclasses import dataclass, field, asdict
from typing import List


def _resolve_root() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    here = os.path.dirname(os.path.abspath(__file__))
    return os.path.dirname(here)


ROOT = _resolve_root()
SRC_PATH = os.path.join(
    ROOT, "source-texts", "lightfoot-apostolic-fathers",
    "lightfoot-apostolic-fathers-restored.txt",
)
OUT_DIR = os.path.join(ROOT, "source-texts", "parsed")
OUT_PATH = os.path.join(OUT_DIR, "lightfoot-apostolic-fathers.json")
os.makedirs(OUT_DIR, exist_ok=True)


@dataclass
class Verse:
    number: int
    text: str

@dataclass
class Chapter:
    number: int
    title: str = ""
    verses: List[Verse] = field(default_factory=list)

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


# Book openers must match what `parse_lightfoot_apostolic_fathers.py`
# emits. restore.py may rewrite book titles too (e.g. Jesus → Yahusha
# (Jesus)). Check the actual file for current openers.
BOOKS_IN_ORDER: list[tuple[str, str, str, bool]] = [
    ("1-clement",                "# The First Epistle of S. Clement to the Corinthians",                       "The First Epistle of S. Clement to the Corinthians",              True),
    ("2-clement",                "# An Ancient Homily by an Unknown Author (Second Clement)",                  "An Ancient Homily by an Unknown Author (Second Clement)",         True),
    ("ignatius-ephesians",       "# The Epistle of S. Ignatius to the Ephesians",                              "The Epistle of S. Ignatius to the Ephesians",                     True),
    ("ignatius-magnesians",      "# The Epistle of S. Ignatius to the Magnesians",                             "The Epistle of S. Ignatius to the Magnesians",                    True),
    ("ignatius-trallians",       "# The Epistle of S. Ignatius to the Trallians",                              "The Epistle of S. Ignatius to the Trallians",                     True),
    ("ignatius-romans",          "# The Epistle of S. Ignatius to the Romans",                                 "The Epistle of S. Ignatius to the Romans",                        True),
    ("ignatius-philadelphians",  "# The Epistle of S. Ignatius to the Philadelphians",                         "The Epistle of S. Ignatius to the Philadelphians",                True),
    ("ignatius-smyrnaeans",      "# The Epistle of S. Ignatius to the Smyrnaeans",                             "The Epistle of S. Ignatius to the Smyrnaeans",                    True),
    ("ignatius-polycarp",        "# The Epistle of S. Ignatius to S. Polycarp",                                "The Epistle of S. Ignatius to S. Polycarp",                       True),
    # SCOPE LOCKED 2026-05-12 (session 32): polycarp-philippians removed —
    # Cepher Ha'avoth approves Martyrdom of Polycarp only, not Polycarp's
    # own letter to the Philippians.
    ("martyrdom-polycarp",       "# The Martyrdom of S. Polycarp",                                             "The Martyrdom of S. Polycarp",                                    True),
    ("didache",                  "# The Teaching of the Twelve Apostles (Didache)",                            "The Teaching of the Twelve Apostles (Didache)",                   True),
    ("barnabas",                 "# The Epistle of Barnabas",                                                  "The Epistle of Barnabas",                                         True),
    ("hermas",                   "# The Shepherd of Hermas",                                                   "The Shepherd of Hermas",                                          True),
    # SCOPE LOCKED 2026-05-12 (session 32): diognetus, fragments-papias,
    # reliques-elders all removed — Lightfoot-edition extras not in
    # Cepher Ha'avoth manifest.
]


CHAPTER_HEADING_RE = re.compile(r"^# (.+)$", re.MULTILINE)
VERSE_MARKER_RE = re.compile(r"^(\d+)\.\s{2,}(.*)$", re.MULTILINE)


def normalize_text(s: str) -> str:
    return re.sub(r"\s+", " ", s).strip()


def split_verses(block: str) -> list[Verse]:
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


def parse_book(book_body: str, has_chapters: bool) -> list[Chapter]:
    if not has_chapters:
        return [Chapter(number=1, title="", verses=split_verses(book_body))]
    chapter_matches = list(CHAPTER_HEADING_RE.finditer(book_body))
    if not chapter_matches:
        return [Chapter(number=1, title="", verses=split_verses(book_body))]
    chapters: list[Chapter] = []
    for i, m in enumerate(chapter_matches):
        ch_label = m.group(1).strip()
        body_start = m.end()
        body_end = chapter_matches[i + 1].start() if i + 1 < len(chapter_matches) else len(book_body)
        body = book_body[body_start:body_end]
        chapters.append(Chapter(number=i + 1, title=ch_label, verses=split_verses(body)))
    return chapters


def parse_edition(text: str) -> Edition:
    edition = Edition(
        edition_id="lightfoot-apostolic-fathers",
        title="J.B. Lightfoot & J.R. Harmer, The Apostolic Fathers (1891) — Restored Names Edition",
        source_file="lightfoot-apostolic-fathers-restored.txt",
    )
    opener_indices: list[tuple[int, str, str, bool]] = []
    cursor = 0
    for book_id, opener, display_title, has_chapters in BOOKS_IN_ORDER:
        idx = text.find("\n" + opener + "\n", cursor)
        if idx == -1:
            if cursor == 0 and text.startswith(opener + "\n"):
                idx = 0
            else:
                continue
        else:
            idx += 1
        opener_indices.append((idx, book_id, opener, display_title, has_chapters))
        cursor = idx + len(opener)
    if opener_indices:
        edition.front_matter = text[: opener_indices[0][0]].strip()
    for i, (start, book_id, opener, display_title, has_chapters) in enumerate(opener_indices):
        body_start = start + len(opener)
        body_end = opener_indices[i + 1][0] if i + 1 < len(opener_indices) else len(text)
        body = text[body_start:body_end]
        book = Book(book_id=book_id, book_title=display_title)
        book.chapters = parse_book(body, has_chapters)
        edition.books.append(book)
    return edition


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
    print(f"lightfoot-apostolic-fathers books={len(edition.books):3d}  "
          f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
          f"-> {OUT_PATH}")
    print()
    print("Per-book counts:")
    for b in edition.books:
        ch = len(b.chapters)
        vs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:30s}  chapters={ch:4d}  verses={vs:5d}  {b.book_title}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
