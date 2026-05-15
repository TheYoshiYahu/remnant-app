#!/usr/bin/env python3
"""
parse_adam_eve_edition.py
-------------------------
Edition parser for the First and Second Books of Adam and Eve — the
Conflict of Adam and Eve with Satan.

Sources (restored-names text, run through restore.py Session 49):
    source-texts/adam-eve/1-adam-eve-restored.txt
    source-texts/adam-eve/2-adam-eve-restored.txt
Output:
    source-texts/parsed/adam-eve-conflict.json

The Conflict of Adam and Eve with Satan is an Ethiopic Christian
pseudepigraphon (the underlying composition is commonly dated to the
6th c. CE; it preserves much older Adam-and-Eve traditions). The English
lineage carried here: S. C. Malan & E. Trumpp 1882 (from the Arabic and
Ethiopic) -> Rutherford H. Platt, Jr., *The Forgotten Books of Eden*
(1926/1927) -> 1995 modernization (Dennis Hawkins: thou->you, art->are).

Source-base decision (Yoshi, Session 49): the corpus restores language
and sacred names regardless, so the modernized Platt register is the
accepted base. Book I text: Project Gutenberg #398 (the modernized Platt
text). Book II text: the reluctant-messenger.com single-page mirror of
the same modernized Platt text. The Malan 1882 scan
(~/Downloads/malan-1882-adam-and-eve.pdf) is on disk as a reference scan
only — its OCR text layer is unusable.

The Gutenberg #398 "Prologue" (Dennis Hawkins' 1995 editorial note,
describing the electronic conversion itself) is NOT republished — the
same standing practice the Sonnini parser applies to the 2011 Covenant
Publishing introduction. Both books open at Chapter I.

Structure: 2 books. Book I — 79 chapters / 920 verses. Book II — 22
chapters / 322 verses.

Edition slug: `adam-eve-conflict`. Witness category: pseudepigrapha
(already in schema.sql; no enum extension). Tier required: extras.
Source family: Bucket B (SOURCE_TEXT_INVENTORY.md / DOWNLOAD_MANIFEST.md
B-3 "Adam and Eve material"). Wired into seed.py Session 49, 2026-05-15.
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
SRC_DIR = os.path.join(APP_ROOT, "source-texts", "adam-eve")
OUT_PATH = os.path.join(APP_ROOT, "source-texts", "parsed",
                        "adam-eve-conflict.json")

# (restored source file, book_id, book_title)
BOOK_SOURCES = [
    ("1-adam-eve-restored.txt", "1-adam-eve", "The First Book of Adam and Eve"),
    ("2-adam-eve-restored.txt", "2-adam-eve", "The Second Book of Adam and Eve"),
]


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
    edition_id: str = "adam-eve-conflict"
    title: str = ("The First and Second Books of Adam and Eve "
                  "(The Conflict of Adam and Eve with Satan) — "
                  "Restored Names Edition")
    source_translation: str = "Malan & Trumpp 1882 / Platt 1926 (modernized)"
    source_file: str = SRC_DIR
    front_matter: str = ""
    books: List[Book] = field(default_factory=list)


BOOK_OPENER_RE = re.compile(r"^#\s+(.+?)\s*$", re.MULTILINE)
CHAPTER_HEADING_RE = re.compile(r"^##\s+Chapter\s+(\d+)\s*—\s*(.+?)\s*$",
                                re.MULTILINE)
VERSE_LINE_RE = re.compile(r"^(\d+)\t(.*)$", re.MULTILINE)


def normalize_text(s: str) -> str:
    return re.sub(r"[ \t]+", " ", s).strip()


def parse_book(text: str, book_id: str, book_title: str) -> Book:
    opener = BOOK_OPENER_RE.search(text)
    if opener is None:
        raise SystemExit(f"[error] {book_id}: no '# <title>' opener found")
    body = text[opener.end():]

    chapter_matches = list(CHAPTER_HEADING_RE.finditer(body))
    if not chapter_matches:
        raise SystemExit(f"[error] {book_id}: no '## Chapter N — ...' headings")

    book = Book(book_id=book_id, book_title=book_title)
    last_chapter = 0
    for i, m in enumerate(chapter_matches):
        cn = int(m.group(1))
        if cn <= last_chapter:
            raise SystemExit(f"[error] {book_id}: chapter {cn} out of order")
        last_chapter = cn
        title = f"Chapter {cn} — {m.group(2).strip()}"
        body_start = m.end()
        body_end = (chapter_matches[i + 1].start()
                    if i + 1 < len(chapter_matches) else len(body))
        block = body[body_start:body_end]

        verses: List[Verse] = []
        last_verse = 0
        for vm in VERSE_LINE_RE.finditer(block):
            vn = int(vm.group(1))
            if vn != last_verse + 1:
                raise SystemExit(
                    f"[error] {book_id} ch{cn}: verse {vn} breaks the "
                    f"1..N run (expected {last_verse + 1})")
            last_verse = vn
            vtext = normalize_text(vm.group(2))
            if vtext:
                verses.append(Verse(number=vn, text=vtext))
        if not verses:
            raise SystemExit(f"[error] {book_id} ch{cn}: no verses parsed")
        book.chapters.append(Chapter(number=cn, title=title, verses=verses))
    return book


def parse_edition() -> Edition:
    edition = Edition()
    for fname, book_id, book_title in BOOK_SOURCES:
        path = os.path.join(SRC_DIR, fname)
        if not os.path.exists(path):
            raise SystemExit(f"[error] source not found: {path}")
        with open(path, "r", encoding="utf-8") as f:
            edition.books.append(parse_book(f.read(), book_id, book_title))
    return edition


def main() -> int:
    edition = parse_edition()
    os.makedirs(os.path.dirname(OUT_PATH), exist_ok=True)
    with open(OUT_PATH, "w", encoding="utf-8") as f:
        json.dump(asdict(edition), f, ensure_ascii=False, indent=2)

    total_chapters = sum(len(b.chapters) for b in edition.books)
    total_verses = sum(len(c.verses) for b in edition.books for c in b.chapters)
    print(f"adam-eve-conflict  books={len(edition.books):3d}  "
          f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
          f"-> {OUT_PATH}")
    for b in edition.books:
        bch = len(b.chapters)
        bvs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:14s}  chapters={bch:3d}  verses={bvs:5d}  "
              f"({b.book_title})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
