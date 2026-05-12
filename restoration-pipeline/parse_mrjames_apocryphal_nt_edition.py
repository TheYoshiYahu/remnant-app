#!/usr/bin/env python3
"""
parse_mrjames_apocryphal_nt_edition.py
--------------------------------------
W-2 mrjames-a structural parser for M.R. James, *The Apocryphal New
Testament* (Oxford: Clarendon Press, 1924).

Reads:  ~/Desktop/App/source-texts/mrjames-apocryphal-nt/mrjames-apocryphal-nt-restored.txt
Writes: ~/Desktop/App/source-texts/parsed/mrjames-apocryphal-nt.json

Pilot scope: 11 books (Gospels / Infancy / Passion / Acts / Epistles /
Apocalypses). Full 50-80 book extraction queued for session 30.

Edition structure mirrors parse_apocrypha_charles_vol1_edition.py;
verse-marker shape (`N.  text`) is identical to all other W-2 editions.
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
    script_dir = os.path.dirname(os.path.abspath(__file__))
    candidate = os.path.dirname(script_dir)
    if os.path.isdir(os.path.join(candidate, "source-texts")):
        return candidate
    return host


ROOT = _resolve_root()
SRC_PATH = os.path.join(
    ROOT, "source-texts", "mrjames-apocryphal-nt",
    "mrjames-apocryphal-nt-restored.txt",
)
OUT_DIR = os.path.join(ROOT, "source-texts", "parsed")
OUT_PATH = os.path.join(OUT_DIR, "mrjames-apocryphal-nt.json")
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


# Book opener lines match the `# {display_title}` lines emitted by
# parse_mrjames_apocryphal_nt.py. Order matches the BOOKS table.
BOOKS_IN_ORDER: list[tuple[str, str, str, bool]] = [
    # SCOPE LOCKED 2026-05-12 (session 32) — five books only, per Yoshi's
    # SOURCE_TEXT_INVENTORY.md (Cepher Ha'avoth: BESORAH YA'AQOV, BESORAH
    # KEPHA, BESORAH NIQODYMON; Cepher Shamayim: CHIZAYON KEPHA, MACHAZEH
    # PA'AL). All other M.R. James 1924 entries were stripped — Gnostic
    # infancy gospels (Thomas ×3, Arabic, Armenian, Pseudo-Matthew, Birth-
    # of-Mary), Acts of John/Thomas, Apocalypse of Thomas, Letters of
    # Christ-Abgarus, the entire fragmentary apparatus (lists, agrapha,
    # papyrus fragments) — none in the manifest, all fail the voice
    # skill's contrary-to-Torah test.
    #
    # NOTE: Gospel of Mary is in the manifest (Cepher Ha'avoth) but
    # Cepher's attribution to M.R. James 1924 is a cataloguing error —
    # the text isn't in James 1924. Source needs to be relocated (Berlin
    # Codex 8502 / Akhmim PD English) before Gospel of Mary can be added.
    # Flagged for follow-up.
    # ---------- INFANCY GOSPELS ----------
    ("book-of-james-protevangelium",    "# The Book of James, or Protevangelium",         "The Book of James, or Protevangelium",       True),
    # ---------- PASSION GOSPELS ----------
    ("gospel-peter",                    "# The Gospel of Peter",                          "The Gospel of Peter",                        True),
    ("gospel-nicodemus-acts-pilate",    "# The Gospel of Nicodemus, or Acts of Pilate",   "The Gospel of Nicodemus, or Acts of Pilate", True),
    # ---------- APOCALYPSES ----------
    ("apocalypse-of-peter",             "# The Apocalypse of Peter",                      "The Apocalypse of Peter",                    True),
    ("apocalypse-of-paul",              "# The Apocalypse of Paul",                       "The Apocalypse of Paul",                     True),
]


CHAPTER_HEADING_RE = re.compile(r"^# (.+)$", re.MULTILINE)
VERSE_MARKER_RE = re.compile(r"^(\d+)\.\s{2,}(.*)$", re.MULTILINE)


def normalize_text(s: str) -> str:
    s = re.sub(r"\s+", " ", s)
    return s.strip()


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


def parse_book(book_id: str, book_body: str, has_chapters: bool) -> list[Chapter]:
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
        edition_id="mrjames-apocryphal-nt",
        title="M.R. James, The Apocryphal New Testament (1924) — Restored Names Edition (Pilot)",
        source_file="mrjames-apocryphal-nt-restored.txt",
    )
    opener_indices: list[tuple[int, str, str, str, bool]] = []
    cursor = 0
    for book_id, opener, display_title, has_chapters in BOOKS_IN_ORDER:
        idx = text.find("\n" + opener + "\n", cursor)
        if idx == -1:
            if cursor == 0 and text.startswith(opener + "\n"):
                idx = 0
            else:
                # Be tolerant: some openers may not appear if a book extracted
                # zero content (degenerate Apocalypse of Thomas case). Skip
                # missing books rather than crash.
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
        book.chapters = parse_book(book_id, body, has_chapters)
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
    print(
        f"mrjames-apocryphal-nt books={len(edition.books):3d}  "
        f"chapters={total_chapters:5d}  verses={total_verses:6d}  "
        f"-> {OUT_PATH}"
    )
    print()
    print("Per-book counts:")
    for b in edition.books:
        ch = len(b.chapters)
        vs = sum(len(c.verses) for c in b.chapters)
        print(f"  {b.book_id:35s}  chapters={ch:4d}  verses={vs:5d}  {b.book_title}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
