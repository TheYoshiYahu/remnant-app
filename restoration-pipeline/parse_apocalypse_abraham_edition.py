#!/usr/bin/env python3
"""
parse_apocalypse_abraham_edition.py
-----------------------------------
Edition parser for the Apocalypse of Abraham (Chizayon Avraham).

Source (restored-names text, run through restore.py Session 50):
    source-texts/apocalypse-of-abraham/apocalypse-of-abraham-restored.txt
Output:
    source-texts/parsed/apocalypse-of-abraham.json

The Apocalypse of Abraham is a Jewish pseudepigraphon (the underlying
composition is commonly dated to the late 1st / early 2nd c. CE; it
survives only in Old Church Slavonic). The English carried here is
G. H. Box's 1918 translation (*The Apocalypse of Abraham*, SPCK
"Translations of Early Documents" series), made with the assistance of
J. I. Landsman from the Slavonic Codex S and the printed editions.

Source-base decision: the corpus restores language and sacred names
regardless (the same standing decision Yoshi recorded Session 49 for the
Adam-and-Eve and other Chrome-sourced editions). Box 1918 is public
domain; it was Chrome-sourced to ~/Downloads/box-1918-apoc-abraham.pdf
and extracted Session 50. Box's running headers, page folios, and the
full textual-critical footnote apparatus were stripped (the body/footnote
split was hand-verified against the `pdftotext -layout` output for all 51
pages of the translation, since the footnote apparatus is discursive
scholarly prose that content-heuristics could not separate cleanly). The
post-text editorial sections — Box's "Additional Notes", "Appendix I/II/
III" and the long Introduction — are NOT republished, the same standing
practice the Sonnini parser applies to the Covenant Publishing
introduction and the Adam-Eve parser applies to the Hawkins 1995
Prologue. Box's section sub-headings (editorial chapter-group labels) and
his square-bracket manuscript-variant markers were also dropped; the text
inside the brackets is retained.

Versification decision (Session 50, Yoshi-delegated — "you decide the
best for us"): Box 1918 divides the work into 32 chapters with NO verse
numbers, and no standard public-domain AoA versification exists (the
standard line belongs to the copyrighted Cepher / OTP editions, which
DOWNLOAD_MANIFEST.md bars republishing). Adopted: sentence-split — each
sentence of Box's prose becomes one verse. Honest (does not fake a
standard), granular, fully reproducible (the split is mechanical —
split_apocalypse_abraham.py), and consistent with the verse-numbered
corpus. The book's incipit/superscription (Box's "Title" section, the
genealogy of Abraham) is carried as the edition's front_matter, not as a
chapter, preserving Box's 32-chapter structure exactly.

Structure: 1 book — 32 chapters / 293 verses.

Edition slug: `apocalypse-of-abraham`. Witness category: pseudepigrapha
(already in schema.sql; no enum extension). Tier required: extras.
Source family: Bucket B (DOWNLOAD_MANIFEST.md B-1 "Cepher Shamayim
Collection" — Chizayon Avraham). Wired into seed.py Session 50,
2026-05-15.
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
SRC_PATH = os.path.join(APP_ROOT, "source-texts", "apocalypse-of-abraham",
                        "apocalypse-of-abraham-restored.txt")
OUT_PATH = os.path.join(APP_ROOT, "source-texts", "parsed",
                        "apocalypse-of-abraham.json")

BOOK_ID = "apocalypse-of-abraham"
BOOK_TITLE = "The Apocalypse of Abraham"


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
    edition_id: str = "apocalypse-of-abraham"
    title: str = "The Apocalypse of Abraham — Restored Names Edition"
    source_translation: str = "Box 1918"
    source_file: str = SRC_PATH
    front_matter: str = ""
    books: List[Book] = field(default_factory=list)


TITLE_RE = re.compile(r"^#\s+(.+?)\s*$", re.MULTILINE)
CHAPTER_HEADING_RE = re.compile(r"^##\s+Chapter\s+(\d+)\s*$", re.MULTILINE)
VERSE_LINE_RE = re.compile(r"^(\d+)\t(.*)$", re.MULTILINE)


def normalize_text(s: str) -> str:
    return re.sub(r"[ \t]+", " ", s).strip()


def parse_edition() -> Edition:
    if not os.path.exists(SRC_PATH):
        raise SystemExit(f"[error] source not found: {SRC_PATH}")
    with open(SRC_PATH, "r", encoding="utf-8") as f:
        text = f.read()

    title_m = TITLE_RE.search(text)
    if title_m is None:
        raise SystemExit("[error] no '# <title>' opener found")

    chapter_matches = list(CHAPTER_HEADING_RE.finditer(text))
    if not chapter_matches:
        raise SystemExit("[error] no '## Chapter N' headings found")

    # front matter: everything between the '# <title>' line and the first
    # '## Chapter' heading (the incipit / genealogy superscription).
    front = normalize_text(text[title_m.end():chapter_matches[0].start()])

    book = Book(book_id=BOOK_ID, book_title=BOOK_TITLE)
    last_chapter = 0
    for i, m in enumerate(chapter_matches):
        cn = int(m.group(1))
        if cn != last_chapter + 1:
            raise SystemExit(
                f"[error] chapter {cn} breaks the 1..N run "
                f"(expected {last_chapter + 1})")
        last_chapter = cn
        body_start = m.end()
        body_end = (chapter_matches[i + 1].start()
                    if i + 1 < len(chapter_matches) else len(text))
        block = text[body_start:body_end]

        verses: List[Verse] = []
        last_verse = 0
        for vm in VERSE_LINE_RE.finditer(block):
            vn = int(vm.group(1))
            if vn != last_verse + 1:
                raise SystemExit(
                    f"[error] ch{cn}: verse {vn} breaks the 1..N run "
                    f"(expected {last_verse + 1})")
            last_verse = vn
            vtext = normalize_text(vm.group(2))
            if vtext:
                verses.append(Verse(number=vn, text=vtext))
        if not verses:
            raise SystemExit(f"[error] ch{cn}: no verses parsed")
        book.chapters.append(
            Chapter(number=cn, title=f"Chapter {cn}", verses=verses))

    if last_chapter != 32:
        raise SystemExit(
            f"[error] expected 32 chapters, parsed {last_chapter}")

    edition = Edition(front_matter=front)
    edition.books.append(book)
    return edition


def main() -> int:
    edition = parse_edition()
    os.makedirs(os.path.dirname(OUT_PATH), exist_ok=True)
    with open(OUT_PATH, "w", encoding="utf-8") as f:
        json.dump(asdict(edition), f, ensure_ascii=False, indent=2)

    total_chapters = sum(len(b.chapters) for b in edition.books)
    total_verses = sum(len(c.verses) for b in edition.books for c in b.chapters)
    print(f"apocalypse-of-abraham  books={len(edition.books):3d}  "
          f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
          f"-> {OUT_PATH}")
    for b in edition.books:
        bch = len(b.chapters)
        bvs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:22s}  chapters={bch:3d}  verses={bvs:5d}  "
              f"({b.book_title})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
