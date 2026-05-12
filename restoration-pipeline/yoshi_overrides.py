#!/usr/bin/env python3
"""
yoshi_overrides.py
------------------
Loads YOSHI_RENDERED_PASSAGES.md and exposes a lookup of LANDED
verse-level renderings that should substitute for the standard
restoration-pipeline output during parsing.

The registry is the source of truth. This module parses the markdown
shape the registry uses and returns a structured form the parsers
(parse_canon.py, parse_published_editions.py) can consume directly.

Recognized registry shape for a chapter-level LANDED entry:

    ### 1 Corinthians 11 (entire chapter) — LANDED 2026-05-11

    ... arbitrary prose ...

    **Yoshi rendering — LANDED.**

    11:1 — Be ye imitators of me, even as I am of the Messiah (Christ).

    11:2 — Now I praise you, brethren, that ye remember me ...

    ... etc. all 34 verses ...

    **Footnote (LANDED — chapter-level, ...):**

    > *... the chapter-end commentary ...*

    **Status:** LANDED ...

The parser is intentionally narrow: it looks for the header pattern,
the verse-line pattern (NUM:NUM — text), and the footnote blockquote
that follows the chapter-level footnote header. Anything else in the
entry (the standard-reading prose, the problem analysis, the
convergence notes) is ignored — it's documentation, not data.

Other entry shapes the registry carries (per-name rules like
Melek Tsadiq, single-verse renderings like Psalm 81:3) are handled
either by the regex-restoration layer in restore.py or by future
extensions of this module.

Public API:
    load_overrides(registry_path: str | None = None) -> Overrides
    Overrides.verse(book_slug, chapter, verse) -> VerseOverride | None
    Overrides.chapter_footnote(book_slug, chapter) -> str

Where:
    VerseOverride = (text: str, source_type: str, footnote_id: str)
"""

from __future__ import annotations
import os
import re
from dataclasses import dataclass, field
from typing import Optional


# ---------------------------------------------------------------------------
# Default registry path resolution
# ---------------------------------------------------------------------------

def _default_registry_path() -> str:
    here = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(here, "YOSHI_RENDERED_PASSAGES.md")


# ---------------------------------------------------------------------------
# Book-name -> slug map
# ---------------------------------------------------------------------------
# The registry headers carry the human-readable book name ("1 Corinthians").
# parse_canon.py uses URL-style slugs ("1-corinthians"). Map them here.
# Keep this list in sync with PROTESTANT_66 in parse_canon.py and with the
# book names parse_published_editions.py emits for Enoch/Jubilees/Jasher/
# Apocrypha.

_BOOK_NAME_TO_SLUG: dict[str, str] = {
    # New Testament
    "matthew": "matthew",
    "mark": "mark",
    "luke": "luke",
    "john": "john",
    "acts": "acts",
    "romans": "romans",
    "1 corinthians": "1-corinthians",
    "2 corinthians": "2-corinthians",
    "galatians": "galatians",
    "ephesians": "ephesians",
    "philippians": "philippians",
    "colossians": "colossians",
    "1 thessalonians": "1-thessalonians",
    "2 thessalonians": "2-thessalonians",
    "1 timothy": "1-timothy",
    "2 timothy": "2-timothy",
    "titus": "titus",
    "philemon": "philemon",
    "hebrews": "hebrews",
    "james": "james",
    "1 peter": "1-peter",
    "2 peter": "2-peter",
    "1 john": "1-john",
    "2 john": "2-john",
    "3 john": "3-john",
    "jude": "jude",
    "revelation": "revelation",
    # Old Testament — common short names; extend as needed.
    "genesis": "genesis",
    "exodus": "exodus",
    "leviticus": "leviticus",
    "numbers": "numbers",
    "deuteronomy": "deuteronomy",
    "psalm": "psalms",
    "psalms": "psalms",
    "proverbs": "proverbs",
    "isaiah": "isaiah",
    "jeremiah": "jeremiah",
    "ezekiel": "ezekiel",
    "daniel": "daniel",
    "hosea": "hosea",
    "joel": "joel",
    "amos": "amos",
    "obadiah": "obadiah",
    "jonah": "jonah",
    "micah": "micah",
    "nahum": "nahum",
    "habakkuk": "habakkuk",
    "zephaniah": "zephaniah",
    "haggai": "haggai",
    "zechariah": "zechariah",
    "malachi": "malachi",
}


def _slugify_book_name(name: str) -> Optional[str]:
    return _BOOK_NAME_TO_SLUG.get(name.strip().lower())


# ---------------------------------------------------------------------------
# Data shapes
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class VerseOverride:
    text: str
    source_type: str  # always "yoshi-rendering" for now
    footnote_id: str  # references a chapter-level footnote


@dataclass
class Overrides:
    # key: (book_slug, chapter_num, verse_num) -> VerseOverride
    verses: dict[tuple[str, int, int], VerseOverride] = field(default_factory=dict)
    # key: (book_slug, chapter_num) -> footnote text (plain paragraph)
    chapter_footnotes: dict[tuple[str, int], str] = field(default_factory=dict)

    def verse(self, book_slug: str, chapter: int, verse: int) -> Optional[VerseOverride]:
        return self.verses.get((book_slug, chapter, verse))

    def chapter_footnote(self, book_slug: str, chapter: int) -> str:
        return self.chapter_footnotes.get((book_slug, chapter), "")

    def __len__(self) -> int:
        return len(self.verses)


# ---------------------------------------------------------------------------
# Parser
# ---------------------------------------------------------------------------

# Matches a chapter-level LANDED header. Captures the book name and the
# chapter number. Example matches:
#   "### 1 Corinthians 11 (entire chapter) — LANDED 2026-05-11"
#   "### Romans 9 — LANDED 2026-06-02"
#   "### Psalm 81 (entire chapter) — LANDED ..."
_CHAPTER_HEADER_RE = re.compile(
    r"^###\s+(?P<book>[1-3]?\s*[A-Za-z]+)\s+(?P<chapter>\d+)\b[^\n]*?\bLANDED\b",
    re.MULTILINE,
)

# Matches a verse line inside the rendering. Example: "11:5 — Not every ..."
# The chapter prefix isn't necessarily the same as the section's chapter
# number (e.g. cross-chapter references), but for chapter-scoped entries
# it will be. We capture chapter:verse and the body.
_VERSE_LINE_RE = re.compile(
    r"^(?P<chapter>\d+):(?P<verse>\d+)\s+—\s+(?P<text>.+?)$",
    re.MULTILINE,
)

# Matches the chapter-level footnote header. Captures nothing, just locates
# the start of the blockquote.
_CHAPTER_FOOTNOTE_HEADER_RE = re.compile(
    r"^\*\*Footnote\s*\([^)]*chapter-level[^)]*\)[^*]*\*\*:?\s*$",
    re.MULTILINE,
)

# Matches a single-paragraph blockquote (the actual footnote text). We
# expect the footnote to be a single quoted paragraph starting with ">".
_FOOTNOTE_BLOCKQUOTE_RE = re.compile(
    r"^>\s*\*?(?P<text>[^\n]+?)\*?\s*$",
    re.MULTILINE,
)


def _find_entry_bounds(text: str, header_match: re.Match) -> tuple[int, int]:
    """Return (start, end) byte offsets for the entry started by header_match.

    An entry ends at the next "### " header or at the end of the document,
    whichever comes first.
    """
    start = header_match.start()
    next_header = re.search(r"^###\s", text[header_match.end():], re.MULTILINE)
    end = header_match.end() + next_header.start() if next_header else len(text)
    return start, end


def parse_registry(registry_text: str) -> Overrides:
    """Parse the registry markdown into an Overrides object.

    The parser is forgiving about the prose around each entry — it only
    extracts:
      1. chapter-level LANDED headers (### Book N ... LANDED ...)
      2. verse lines inside each entry (N:N — text)
      3. the chapter-level footnote blockquote
    """
    overrides = Overrides()
    next_footnote_id = 1

    for header in _CHAPTER_HEADER_RE.finditer(registry_text):
        book_name = header.group("book").strip()
        chapter_num = int(header.group("chapter"))
        slug = _slugify_book_name(book_name)
        if slug is None:
            # Unknown book — skip silently rather than fail the whole load.
            # When a new book is added to the registry, add it to the map.
            continue

        entry_start, entry_end = _find_entry_bounds(registry_text, header)
        entry_text = registry_text[entry_start:entry_end]

        # Footnote: locate the chapter-level footnote header, then take the
        # first blockquote line after it.
        footnote_text = ""
        footnote_id = ""
        fn_header = _CHAPTER_FOOTNOTE_HEADER_RE.search(entry_text)
        if fn_header:
            after_fn = entry_text[fn_header.end():]
            fn_quote = _FOOTNOTE_BLOCKQUOTE_RE.search(after_fn)
            if fn_quote:
                footnote_text = fn_quote.group("text").strip()
                footnote_id = f"yoshi-fn-{next_footnote_id:04d}"
                overrides.chapter_footnotes[(slug, chapter_num)] = footnote_text
                next_footnote_id += 1

        # Verses: collect every N:N — text line. Filter to lines whose
        # chapter prefix matches this entry's chapter (defensive: ignore
        # cross-references that might appear in prose).
        for vm in _VERSE_LINE_RE.finditer(entry_text):
            v_ch = int(vm.group("chapter"))
            v_num = int(vm.group("verse"))
            if v_ch != chapter_num:
                continue
            v_text = vm.group("text").strip()
            key = (slug, chapter_num, v_num)
            overrides.verses[key] = VerseOverride(
                text=v_text,
                source_type="yoshi-rendering",
                footnote_id=footnote_id,
            )

    return overrides


def load_overrides(registry_path: Optional[str] = None) -> Overrides:
    """Load and parse the registry. Returns an Overrides object."""
    path = registry_path or _default_registry_path()
    if not os.path.exists(path):
        return Overrides()
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()
    return parse_registry(text)


# ---------------------------------------------------------------------------
# CLI for inspection / self-test
# ---------------------------------------------------------------------------

def main():
    import argparse
    p = argparse.ArgumentParser(description="Inspect Yoshi-rendering overrides.")
    p.add_argument("--registry", default=None,
                   help="Path to YOSHI_RENDERED_PASSAGES.md (defaults to sibling).")
    p.add_argument("--show", nargs="?", const="all",
                   help="Show loaded overrides. Optional value: BOOK:CH (e.g. 1-corinthians:11).")
    args = p.parse_args()

    overrides = load_overrides(args.registry)
    total = len(overrides.verses)
    chapters = len(overrides.chapter_footnotes)
    print(f"Loaded {total} verse overrides across {chapters} chapter footnotes.")

    if not args.show:
        return

    if args.show == "all":
        for (book, ch, v), vo in sorted(overrides.verses.items()):
            print(f"  {book} {ch}:{v}  [{vo.source_type}]  {vo.text[:80]}{'…' if len(vo.text) > 80 else ''}")
        for (book, ch), fn in sorted(overrides.chapter_footnotes.items()):
            print(f"  FOOTNOTE  {book} {ch}: {fn[:100]}{'…' if len(fn) > 100 else ''}")
    else:
        # filter by BOOK:CH
        try:
            book_filter, ch_filter = args.show.split(":")
            ch_filter = int(ch_filter)
        except ValueError:
            print(f"  bad --show value: {args.show}")
            return
        for (book, ch, v), vo in sorted(overrides.verses.items()):
            if book == book_filter and ch == ch_filter:
                print(f"  {book} {ch}:{v}  {vo.text}")
        fn = overrides.chapter_footnote(book_filter, ch_filter)
        if fn:
            print(f"  FOOTNOTE: {fn}")


if __name__ == "__main__":
    main()
