#!/usr/bin/env python3
"""
parse_canon.py
--------------
Parses the eBible USFX KJV distribution into the canonical Edition shape
(matching apocrypha/enoch/jubilees/jasher) and applies the deterministic
restoration pipeline (restore.Restorer) to every verse.

Input:  ~/Desktop/App/source-texts/kjv/eng-kjv_usfx.xml
Output: ~/Desktop/App/source-texts/parsed/canon.json

The USFX file at eBible.org carries the Protestant 66 plus 14 Apocrypha
plus a front-matter section. This parser filters to the Protestant 66
in canonical order and emits them as a single Edition.

Provenance: eBible.org public-domain KJV distribution (Crosswire-equivalent),
schema-validated against https://eBible.org/usfx.xsd, signed at the source.
The text is the 1769 Blayney revision. Strong's tags and italics are present
in the source as <w s="H####"> and <add> markers; for Phase-4 (this session)
they are stripped to plain restored text. Phase 5 will re-ingest preserving
the Strong's metadata as a side-table for tap-on-word lookup.
"""

from __future__ import annotations
import json
import os
import re
import sys
from dataclasses import dataclass, field, asdict
from typing import List

# Re-use the data shapes and the Restorer from sibling modules
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from parse_published_editions import Edition, Book, Chapter, Verse  # noqa: E402
from restore import Restorer  # noqa: E402
from yoshi_overrides import Overrides, load_overrides  # noqa: E402


# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

def _resolve_root() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    host_path = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host_path):
        return host_path
    script_dir = os.path.dirname(os.path.abspath(__file__))
    candidate = os.path.dirname(script_dir)
    if os.path.isdir(os.path.join(candidate, "source-texts")):
        return candidate
    return host_path


ROOT = _resolve_root()
USFX_PATH = os.path.join(ROOT, "source-texts", "kjv", "eng-kjv_usfx.xml")
OUT_PATH = os.path.join(ROOT, "source-texts", "parsed", "canon.json")


# ---------------------------------------------------------------------------
# The Protestant 66 in canonical order
# (USFX code, Display title, our internal book_id slug)
# ---------------------------------------------------------------------------

PROTESTANT_66 = [
    # OT (39)
    ("GEN", "Genesis", "genesis"),
    ("EXO", "Exodus", "exodus"),
    ("LEV", "Leviticus", "leviticus"),
    ("NUM", "Numbers", "numbers"),
    ("DEU", "Deuteronomy", "deuteronomy"),
    ("JOS", "Joshua", "joshua"),
    ("JDG", "Judges", "judges"),
    ("RUT", "Ruth", "ruth"),
    ("1SA", "1 Samuel", "1-samuel"),
    ("2SA", "2 Samuel", "2-samuel"),
    ("1KI", "1 Kings", "1-kings"),
    ("2KI", "2 Kings", "2-kings"),
    ("1CH", "1 Chronicles", "1-chronicles"),
    ("2CH", "2 Chronicles", "2-chronicles"),
    ("EZR", "Ezra", "ezra"),
    ("NEH", "Nehemiah", "nehemiah"),
    ("EST", "Esther", "esther"),
    ("JOB", "Job", "job"),
    ("PSA", "Psalms", "psalms"),
    ("PRO", "Proverbs", "proverbs"),
    ("ECC", "Ecclesiastes", "ecclesiastes"),
    ("SNG", "Song of Solomon", "song-of-solomon"),
    ("ISA", "Isaiah", "isaiah"),
    ("JER", "Jeremiah", "jeremiah"),
    ("LAM", "Lamentations", "lamentations"),
    ("EZK", "Ezekiel", "ezekiel"),
    ("DAN", "Daniel", "daniel"),
    ("HOS", "Hosea", "hosea"),
    ("JOL", "Joel", "joel"),
    ("AMO", "Amos", "amos"),
    ("OBA", "Obadiah", "obadiah"),
    ("JON", "Jonah", "jonah"),
    ("MIC", "Micah", "micah"),
    ("NAM", "Nahum", "nahum"),
    ("HAB", "Habakkuk", "habakkuk"),
    ("ZEP", "Zephaniah", "zephaniah"),
    ("HAG", "Haggai", "haggai"),
    ("ZEC", "Zechariah", "zechariah"),
    ("MAL", "Malachi", "malachi"),
    # NT (27)
    ("MAT", "Matthew", "matthew"),
    ("MRK", "Mark", "mark"),
    ("LUK", "Luke", "luke"),
    ("JHN", "John", "john"),
    ("ACT", "Acts", "acts"),
    ("ROM", "Romans", "romans"),
    ("1CO", "1 Corinthians", "1-corinthians"),
    ("2CO", "2 Corinthians", "2-corinthians"),
    ("GAL", "Galatians", "galatians"),
    ("EPH", "Ephesians", "ephesians"),
    ("PHP", "Philippians", "philippians"),
    ("COL", "Colossians", "colossians"),
    ("1TH", "1 Thessalonians", "1-thessalonians"),
    ("2TH", "2 Thessalonians", "2-thessalonians"),
    ("1TI", "1 Timothy", "1-timothy"),
    ("2TI", "2 Timothy", "2-timothy"),
    ("TIT", "Titus", "titus"),
    ("PHM", "Philemon", "philemon"),
    ("HEB", "Hebrews", "hebrews"),
    ("JAS", "James", "james"),
    ("1PE", "1 Peter", "1-peter"),
    ("2PE", "2 Peter", "2-peter"),
    ("1JN", "1 John", "1-john"),
    ("2JN", "2 John", "2-john"),
    ("3JN", "3 John", "3-john"),
    ("JUD", "Jude", "jude"),
    ("REV", "Revelation", "revelation"),
]

assert len(PROTESTANT_66) == 66, f"Expected 66 books, have {len(PROTESTANT_66)}"


# ---------------------------------------------------------------------------
# USFX cleanup
# ---------------------------------------------------------------------------

# Order matters here. Footnotes/cross-refs MUST be stripped before generic
# tag stripping so their inner content (which contains book.chapter.verse
# refs that look like text) is removed entirely, not folded into the verse.
_FOOTNOTE_RE   = re.compile(r"<f\b[^>]*>.*?</f>", re.DOTALL)
_XREF_RE       = re.compile(r"<x\b[^>]*>.*?</x>", re.DOTALL)
_VEEND_RE      = re.compile(r"<ve\s*/>")
_W_TAG_RE      = re.compile(r"<w\b[^>]*>([^<]*)</w>")
_ADD_TAG_RE    = re.compile(r"<add\b[^>]*>([^<]*)</add>")
_NDREMARK_RE   = re.compile(r"<nd\b[^>]*>([^<]*)</nd>")  # name-of-deity formatting
_WJ_TAG_RE     = re.compile(r"</?wj\b[^>]*>")            # words of Jesus
_TL_TAG_RE     = re.compile(r"<tl\b[^>]*>([^<]*)</tl>")  # transliterated word
_SC_TAG_RE     = re.compile(r"<sc\b[^>]*>([^<]*)</sc>")  # small caps
_BD_TAG_RE     = re.compile(r"<bd\b[^>]*>([^<]*)</bd>")  # bold
_IT_TAG_RE     = re.compile(r"<it\b[^>]*>([^<]*)</it>")  # italic
_PARA_TAG_RE   = re.compile(r"</?p\b[^>]*>")
_QPARA_TAG_RE  = re.compile(r"</?q\b[^>]*>")             # poetry / quote line
_GENERIC_TAG   = re.compile(r"</?[A-Za-z][A-Za-z0-9]*\b[^>]*/?>")
_PILCROW_RE    = re.compile(r"¶")
_WS_RE         = re.compile(r"\s+")


def _clean_usfx_verse(raw: str) -> str:
    """
    Strip USFX markup from a verse. Preserve verse text content only;
    footnotes, cross-refs, and structural markers are dropped.

    Italic/added words: USFX uses <add> for translator-supplied text
    (rendered as italics in print). The standard four extras editions
    flatten italics to plain text — we match that. If we ever want to
    surface italics in the reader UI, that gets re-ingested with the
    Phase-5 Strong's pass.
    """
    s = raw
    s = _FOOTNOTE_RE.sub("", s)
    s = _XREF_RE.sub("", s)
    s = _VEEND_RE.sub("", s)
    s = _PARA_TAG_RE.sub("", s)
    s = _QPARA_TAG_RE.sub("", s)
    s = _WJ_TAG_RE.sub("", s)
    s = _W_TAG_RE.sub(r"\1", s)
    s = _ADD_TAG_RE.sub(r"\1", s)
    s = _NDREMARK_RE.sub(r"\1", s)
    s = _TL_TAG_RE.sub(r"\1", s)
    s = _SC_TAG_RE.sub(r"\1", s)
    s = _BD_TAG_RE.sub(r"\1", s)
    s = _IT_TAG_RE.sub(r"\1", s)
    # Catch-all for anything we missed; safe because we've already
    # handled the tags whose content we want to preserve.
    s = _GENERIC_TAG.sub("", s)
    s = _PILCROW_RE.sub("", s)
    s = _WS_RE.sub(" ", s)
    return s.strip()


# ---------------------------------------------------------------------------
# Parser
# ---------------------------------------------------------------------------

_BOOK_OPEN_RE  = re.compile(r'<book id="([A-Z0-9]+)"[^>]*>')
_CHAPTER_RE    = re.compile(r'<c id="(\d+)"\s*/>')
_VERSE_OPEN_RE = re.compile(r'<v id="([0-9A-Za-z\-]+)"[^/]*/>')


def _split_books(text: str) -> dict[str, str]:
    """Split the USFX file into per-book sections keyed by USFX code."""
    matches = list(_BOOK_OPEN_RE.finditer(text))
    out: dict[str, str] = {}
    for i, m in enumerate(matches):
        code = m.group(1)
        start = m.end()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        section = text[start:end]
        # Trim a trailing </book> if present
        section = re.sub(r"</book>\s*$", "", section)
        out[code] = section
    return out


def _parse_book_section(
    section: str,
    book_id: str,
    book_title: str,
    restorer: Restorer,
    overrides: Overrides,
) -> Book:
    book = Book(book_id=book_id, book_title=book_title)
    chapter_matches = list(_CHAPTER_RE.finditer(section))
    for i, m in enumerate(chapter_matches):
        ch_num = int(m.group(1))
        ch_start = m.end()
        ch_end = chapter_matches[i + 1].start() if i + 1 < len(chapter_matches) else len(section)
        ch_body = section[ch_start:ch_end]

        chapter = Chapter(number=ch_num, title=f"Chapter {ch_num}")

        # Attach chapter-level Yoshi commentary if the registry carries one
        # for this (book, chapter). The pipeline picks it up here so the
        # downstream JSON / API carries the commentary on the chapter object.
        chapter_footnote = overrides.chapter_footnote(book_id, ch_num)
        if chapter_footnote:
            chapter.commentary = chapter_footnote

        verse_matches = list(_VERSE_OPEN_RE.finditer(ch_body))
        for j, vm in enumerate(verse_matches):
            v_id_raw = vm.group(1)
            # Verse IDs are usually plain integers but can be e.g. "1a", "1b"
            # in some manuscripts — accept and coerce to integer where possible.
            v_num: int
            try:
                v_num = int(v_id_raw)
            except ValueError:
                v_num = int(re.match(r"(\d+)", v_id_raw).group(1))
            v_start = vm.end()
            v_end = verse_matches[j + 1].start() if j + 1 < len(verse_matches) else len(ch_body)
            raw_text = ch_body[v_start:v_end]
            cleaned = _clean_usfx_verse(raw_text)
            if not cleaned:
                continue

            # Yoshi-rendering override check.
            # The registry of LANDED Yoshi renderings is loaded once at the
            # top of parse_canon(). If this (book, chapter, verse) has a
            # LANDED override, substitute it for the standard-pipeline
            # output and tag the verse with source_type="yoshi-rendering"
            # so the data layer can distinguish it from the regex-restored
            # base text. The chapter-level footnote (loaded above) carries
            # the apologetic for the entire chapter's rendering.
            override = overrides.verse(book_id, ch_num, v_num)
            if override is not None:
                chapter.verses.append(Verse(
                    number=v_num,
                    text=override.text,
                    source_type=override.source_type,
                    footnote=override.footnote_id,
                ))
            else:
                restored = restorer.restore_text(cleaned)
                chapter.verses.append(Verse(number=v_num, text=restored))

        book.chapters.append(chapter)
    return book


def parse_canon(text: str) -> Edition:
    edition = Edition(
        edition_id="canon",
        title="The Holy Bible — King James Version (Restored Names)",
        source_file="eng-kjv_usfx.xml",
    )
    restorer = Restorer()
    # Load the Yoshi-rendering registry once at the top of the parse. The
    # _parse_book_section helper uses this to substitute LANDED renderings
    # for the standard pipeline output on the registered verses.
    overrides = load_overrides()
    book_sections = _split_books(text)

    for code, title, slug in PROTESTANT_66:
        if code not in book_sections:
            print(f"  WARN — USFX code {code} ({title}) not found in source", file=sys.stderr)
            continue
        book = _parse_book_section(
            book_sections[code],
            book_id=slug,
            book_title=title,
            restorer=restorer,
            overrides=overrides,
        )
        edition.books.append(book)

    return edition


# ---------------------------------------------------------------------------
# Driver
# ---------------------------------------------------------------------------

def main():
    if not os.path.exists(USFX_PATH):
        print(f"FATAL — USFX source not found at {USFX_PATH}", file=sys.stderr)
        sys.exit(1)
    with open(USFX_PATH, "r", encoding="utf-8") as f:
        text = f.read()
    edition = parse_canon(text)

    os.makedirs(os.path.dirname(OUT_PATH), exist_ok=True)
    with open(OUT_PATH, "w", encoding="utf-8") as f:
        json.dump(asdict(edition), f, ensure_ascii=False, indent=2)

    total_chapters = sum(len(b.chapters) for b in edition.books)
    total_verses = sum(len(c.verses) for b in edition.books for c in b.chapters)
    print(
        f"{edition.edition_id:12s}  "
        f"books={len(edition.books):2d}  "
        f"chapters={total_chapters:5d}  "
        f"verses={total_verses:6d}  "
        f"-> {OUT_PATH}"
    )

    # Sanity checks against canonical Protestant 66 KJV totals
    expected = {"books": 66, "chapters": 1189, "verses": 31102}
    actual = {"books": len(edition.books), "chapters": total_chapters, "verses": total_verses}
    if actual == expected:
        print(f"OK  — matches canonical Protestant 66 KJV totals ({expected})")
    else:
        print(f"WARN — counts {actual} differ from canonical {expected}", file=sys.stderr)
        # Per-book diff
        kjv_chapter_counts = {
            "genesis": 50, "exodus": 40, "leviticus": 27, "numbers": 36,
            "deuteronomy": 34, "joshua": 24, "judges": 21, "ruth": 4,
            "1-samuel": 31, "2-samuel": 24, "1-kings": 22, "2-kings": 25,
            "1-chronicles": 29, "2-chronicles": 36, "ezra": 10, "nehemiah": 13,
            "esther": 10, "job": 42, "psalms": 150, "proverbs": 31,
            "ecclesiastes": 12, "song-of-solomon": 8, "isaiah": 66, "jeremiah": 52,
            "lamentations": 5, "ezekiel": 48, "daniel": 12, "hosea": 14,
            "joel": 3, "amos": 9, "obadiah": 1, "jonah": 4, "micah": 7,
            "nahum": 3, "habakkuk": 3, "zephaniah": 3, "haggai": 2,
            "zechariah": 14, "malachi": 4,
            "matthew": 28, "mark": 16, "luke": 24, "john": 21, "acts": 28,
            "romans": 16, "1-corinthians": 16, "2-corinthians": 13, "galatians": 6,
            "ephesians": 6, "philippians": 4, "colossians": 4,
            "1-thessalonians": 5, "2-thessalonians": 3, "1-timothy": 6,
            "2-timothy": 4, "titus": 3, "philemon": 1, "hebrews": 13,
            "james": 5, "1-peter": 5, "2-peter": 3, "1-john": 5,
            "2-john": 1, "3-john": 1, "jude": 1, "revelation": 22,
        }
        for b in edition.books:
            exp = kjv_chapter_counts.get(b.book_id)
            got = len(b.chapters)
            if exp != got:
                print(f"  {b.book_id}: expected {exp} chapters, got {got}", file=sys.stderr)


if __name__ == "__main__":
    main()
