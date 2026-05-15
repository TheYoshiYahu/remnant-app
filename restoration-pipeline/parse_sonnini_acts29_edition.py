#!/usr/bin/env python3
"""
parse_sonnini_acts29_edition.py
-------------------------------
Edition parser for Acts 29 — The Sonnini Manuscript.

Source: ~/Desktop/App/source-texts/sonnini-acts-29/sonnini-acts-29-restored.txt
        (the public-domain 1801 English, run through restore.py)
Output: ~/Desktop/App/source-texts/parsed/sonnini-acts-29.json

The "Long Lost Chapter of Acts" — published 1801, interleaved in a copy of
Sonnini's *Travels in Turkey and Greece* (London: Longman & Rees). Narrates
Paul's journey to Spain and Britain after Acts 28. Public-domain 1801 text;
the 2011 Covenant Publishing editorial introduction is NOT republished.

Authenticity is disputed — the inherited academy position is 18th-century
pseudepigraphic composition. Per SOURCE_TEXT_INVENTORY.md and Yoshi's
2026-05-09 inventory note, it ships in the extras tier under
witness_category `disputed_witness`, UI-labeled "Acts 29 (Sonnini
Manuscript) — disputed authenticity, included for study and discernment."

Structure: 1 book, 1 chapter (Chapter 29), 26 verses.

Edition slug: `sonnini-acts-29`. Witness category: disputed_witness.
Tier required: extras. Source family: Bucket B (SOURCE_TEXT_INVENTORY.md
"Acts 29 / Sonnini Manuscript"). Wired into seed.py Session 48,
2026-05-14.
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
SRC_PATH = os.path.join(APP_ROOT, "source-texts", "sonnini-acts-29",
                        "sonnini-acts-29-restored.txt")
OUT_PATH = os.path.join(APP_ROOT, "source-texts", "parsed",
                        "sonnini-acts-29.json")


# ---------------------------------------------------------------------------
# Data model  (matches the seed.py JSON contract — see api/seed.py docstring)
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
    commentary: str = ""


@dataclass
class Book:
    book_id: str
    book_title: str
    chapters: List[Chapter] = field(default_factory=list)


@dataclass
class Edition:
    edition_id: str = "sonnini-acts-29"
    title: str = "Acts 29 — The Sonnini Manuscript (Restored Names Edition)"
    source_translation: str = "Sonnini 1801 (public domain)"
    source_file: str = SRC_PATH
    front_matter: str = ""
    books: List[Book] = field(default_factory=list)


BOOK_OPENER_RE = re.compile(r"^# Acts 29 — The Sonnini Manuscript\s*$", re.MULTILINE)
CHAPTER_HEADING_RE = re.compile(r"^# Chapter\s+(\d+)\s*—\s*(.+?)\s*$", re.MULTILINE)
VERSE_MARKER_RE = re.compile(r"^(\d+)\.\s{2,}(.*)$", re.MULTILINE)


def normalize_text(s: str) -> str:
    return re.sub(r"\s+", " ", s).strip()


def split_verses(block: str) -> List[Verse]:
    matches = list(VERSE_MARKER_RE.finditer(block))
    if not matches:
        flat = normalize_text(block)
        return [Verse(number=1, text=flat)] if flat else []
    verses: List[Verse] = []
    last = 0
    for i, m in enumerate(matches):
        n = int(m.group(1))
        # monotonic guard — drop any out-of-order marker (defensive; the
        # Sonnini source is a clean 1..26 run)
        if n <= last:
            continue
        start = m.start()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(block)
        body = re.sub(r"^\d+\.\s{2,}", "", block[start:end])
        text = normalize_text(body)
        if text:
            verses.append(Verse(number=n, text=text))
            last = n
    return verses


def parse_edition(text: str) -> Edition:
    edition = Edition()

    book_m = BOOK_OPENER_RE.search(text)
    if book_m is None:
        raise SystemExit("[error] book opener '# Acts 29 — The Sonnini "
                         "Manuscript' not found in source")
    edition.front_matter = text[: book_m.start()].strip()
    book_body = text[book_m.end():]

    chapter_matches = list(CHAPTER_HEADING_RE.finditer(book_body))
    if not chapter_matches:
        raise SystemExit("[error] no '# Chapter N — ...' heading found in source")

    book = Book(book_id="sonnini-acts-29",
                book_title="Acts 29 — The Sonnini Manuscript")
    for i, m in enumerate(chapter_matches):
        cn = int(m.group(1))
        title = f"Chapter {cn} — {m.group(2).strip()}"
        body_start = m.end()
        body_end = (chapter_matches[i + 1].start()
                    if i + 1 < len(chapter_matches) else len(book_body))
        body = book_body[body_start:body_end]
        book.chapters.append(
            Chapter(number=cn, title=title, verses=split_verses(body))
        )
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
    print(f"sonnini-acts-29  books={len(edition.books):3d}  "
          f"chapters={total_chapters:5d}  verses={total_verses:6d}  -> {OUT_PATH}")
    for b in edition.books:
        for c in b.chapters:
            print(f"  {b.book_id:20s}  ch {c.number}: {len(c.verses)} verses  "
                  f"({c.title})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
