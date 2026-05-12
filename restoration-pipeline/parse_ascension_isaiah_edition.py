#!/usr/bin/env python3
"""
parse_ascension_isaiah_edition.py
---------------------------------
Edition parser for the Ascension of Isaiah, full composite (chapters 1-11),
R.H. Charles 1900 English translation — public domain.

Source: ~/Desktop/App/source-texts/ascension-isaiah/ascension-isaiah-restored.txt
Output: ~/Desktop/App/source-texts/parsed/ascension-isaiah.json

The Ascension of Isaiah is a composite work:
  - Chapters 1-5: Martyrdom of Isaiah (Jewish core)
  - Chapters 3:13-4:22 contain a Christian insertion (Testament of Hezekiah)
  - Chapters 6-11: Vision of Isaiah (Christian)

The Martyrdom-only portion was previously parsed via Charles vol 2 in
parse_charles_pseudepigrapha.py as `martyrdom-isaiah`. Session 32
(2026-05-12) replaced that entry with this full-composite parse from
the dedicated Charles 1900 edition. The Charles vol 2 martyrdom-isaiah
entry was removed in the same session.

Edition slug: `ascension-isaiah`. Witness category: pseudepigrapha.
Tier required: extras. Source family: Cepher Shamayim
(H'Alah Yesha'yahu).
"""
from __future__ import annotations
from dataclasses import dataclass, field, asdict
from typing import List
import json
import os
import re
import sys

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

def _resolve_app_root() -> str:
    here = os.path.dirname(os.path.abspath(__file__))
    for _ in range(4):
        if os.path.basename(here) == "App":
            return here
        here = os.path.dirname(here)
    return os.path.expanduser("~/Desktop/App")

APP_ROOT = _resolve_app_root()
SRC_PATH = os.path.join(APP_ROOT, "source-texts", "ascension-isaiah",
                       "ascension-isaiah-restored.txt")
OUT_PATH = os.path.join(APP_ROOT, "source-texts", "parsed",
                       "ascension-isaiah.json")


# ---------------------------------------------------------------------------
# Data model
# ---------------------------------------------------------------------------

@dataclass
class Verse:
    number: int
    text: str


@dataclass
class Chapter:
    number: int
    title: str
    verses: List[Verse] = field(default_factory=list)


@dataclass
class Book:
    book_id: str
    book_title: str
    chapters: List[Chapter] = field(default_factory=list)


@dataclass
class Edition:
    edition_slug: str = "ascension-isaiah"
    source_translation: str = "R.H. Charles 1900"
    source_file: str = SRC_PATH
    front_matter: str = ""
    books: List[Book] = field(default_factory=list)


BOOKS_IN_ORDER: list[tuple[str, str, str, bool]] = [
    ("ascension-isaiah",  "# The Ascension of Isaiah",
     "The Ascension of Isaiah", True),
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
        title = m.group(1).strip()
        body_start = m.end()
        body_end = chapter_matches[i + 1].start() if i + 1 < len(chapter_matches) else len(book_body)
        body = book_body[body_start:body_end]
        # Pull chapter number from "Chapter N" heading
        cn_match = re.match(r"^Chapter\s+(\d+)", title)
        cn = int(cn_match.group(1)) if cn_match else (i + 1)
        chapters.append(Chapter(number=cn, title=title, verses=split_verses(body)))
    return chapters


def parse_edition(text: str) -> Edition:
    edition = Edition(source_file=SRC_PATH)
    cursor = 0
    opener_indices: list[tuple[int, str, str, str, bool]] = []
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


def main() -> int:
    if not os.path.exists(SRC_PATH):
        print(f"[error] source not found: {SRC_PATH}", file=sys.stderr)
        return 2
    with open(SRC_PATH, "r", encoding="utf-8") as f:
        text = f.read()
    edition = parse_edition(text)
    os.makedirs(os.path.dirname(OUT_PATH), exist_ok=True)
    with open(OUT_PATH, "w", encoding="utf-8") as f:
        json.dump(asdict(edition), f, ensure_ascii=False, indent=2)
    total_chapters = sum(len(b.chapters) for b in edition.books)
    total_verses = sum(len(c.verses) for b in edition.books for c in b.chapters)
    print(f"ascension-isaiah books={len(edition.books):3d}  "
          f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
          f"-> {OUT_PATH}")
    print()
    print("Per-book counts:")
    for b in edition.books:
        ch = len(b.chapters)
        vs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:25s}  chapters={ch:4d}  verses={vs:5d}  {b.book_title}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
