#!/usr/bin/env python3
"""
parse_published_editions.py
---------------------------
Parses Yoshi's four already-published Restored Names editions
(extracted to plain text via pandoc) into structured JSON.

Input:  ~/Desktop/App/source-texts/existing-restored-editions/*.txt
Output: ~/Desktop/App/source-texts/parsed/*.json

Each output JSON has the shape:

    {
      "edition_id": "enoch",
      "title": "Book of Enoch",
      "source_file": "Enoch-Restored-Names-Edition.txt",
      "front_matter": "<introductory text before the first chapter>",
      "books": [
        {
          "book_id": "1-enoch",
          "book_title": "Book of Enoch",
          "chapters": [
            {
              "number": 1,
              "title": "The Blessing and Prophecy of Enoch",
              "verses": [
                {"number": 1, "text": "..."},
                ...
              ],
              "commentary": "..."
            }
          ]
        }
      ]
    }

The Apocrypha edition contains 14 distinct books and is split into
multiple book entries inside the single edition. The other three are
single-book editions.

This is a first-pass parser. It will miss edge cases. The validation
strategy is to round-trip a few sample chapters back to the published
.docx output and eyeball them, then iterate. Run, review diffs, refine.
"""

from __future__ import annotations
import json
import os
import re
import sys
from dataclasses import dataclass, field, asdict
from typing import List, Optional


# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

def _resolve_root() -> str:
    """
    Resolve the App/ root in a way that works in two environments:
    1. The bash sandbox where Desktop is mounted at /sessions/<id>/mnt/Desktop
    2. The user's host shell where Desktop is at ~/Desktop
    Override via APP_ROOT env var if needed.
    """
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    # Try the host path first.
    host_path = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host_path):
        return host_path
    # Fallback: walk up from this script's location.
    script_dir = os.path.dirname(os.path.abspath(__file__))
    candidate = os.path.dirname(script_dir)  # script lives in restoration-pipeline/
    if os.path.isdir(os.path.join(candidate, "source-texts")):
        return candidate
    return host_path  # last resort, will fail loudly if wrong


ROOT = _resolve_root()
SRC_DIR = os.path.join(ROOT, "source-texts", "existing-restored-editions")
OUT_DIR = os.path.join(ROOT, "source-texts", "parsed")
os.makedirs(OUT_DIR, exist_ok=True)


# ---------------------------------------------------------------------------
# Data shapes
# ---------------------------------------------------------------------------

@dataclass
class Verse:
    number: int
    text: str
    source_type: str = "restored-names-kjv"
    footnote: str = ""


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
# Common helpers
# ---------------------------------------------------------------------------

def slugify(s: str) -> str:
    s = s.lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    return s.strip("-")


def normalize_text(s: str) -> str:
    """Collapse whitespace, smooth line breaks within a verse."""
    s = re.sub(r"\s+", " ", s)
    return s.strip()


def split_verses(
    block: str,
    *,
    allow_implicit_verse_1: bool = False,
    allow_gaps: bool = False,
    max_forward_gap: int = 5,
) -> List[Verse]:
    """
    Parse a block of verse text into Verse objects. Handles four formats
    seen across Yoshi's published editions:

      A) Apocrypha / Enoch: `<N> <text>` — verses numbered at line start
         (sometimes with leading whitespace from indented blocks).
      B) Jasher: `<N>.  <text>\\n    <continuation>` — numbered list format,
         period after number, two-space indent on continuation lines.
      C) Jubilees: inline `<N>. ` markers within running paragraphs,
         where verse 1 typically has no marker (chapter starts in verse 1).
      D) Jubilees with missing markers: like C, but the published edition
         occasionally drops verse markers at paragraph breaks (e.g.,
         markers go 5 → 7 → ... or 16 → 18 → ...). For these, allow
         bounded forward gaps in the monotonic chain — the missing
         verse's text gets folded into the preceding verse's body
         rather than dropped, preserving content even when the published
         numbering is imperfect.

    The pragmatic rule: a verse boundary is a token preceded by a
    word-boundary-ish character (start, whitespace) and is a number followed
    by either `. ` or whitespace, where the number is monotonically
    increasing from 1 (or 2, if implicit-verse-1 mode). Strict monotonic
    is the default; allow_gaps relaxes to "strictly increasing, gap of
    at most max_forward_gap" — used for Jubilees where the source has
    missing markers at paragraph breaks.

    Monotonic filtering is what makes this robust against years, scripture
    references, list numbers in commentary, etc. — those don't form a
    monotonic sequence so they're dropped.
    """
    lines = [ln.rstrip() for ln in block.split("\n")]
    flattened = " ".join(ln.strip() for ln in lines if ln.strip())

    # Permissive boundary match. Number preceded by start-of-string or whitespace,
    # followed by `. ` or whitespace. Monotonic filter below picks the real ones.
    boundary_re = re.compile(r"(?:^|\s)(\d+)(?:\.\s+|\s+)")
    matches = list(boundary_re.finditer(flattened))

    verses: List[Verse] = []
    start_num = 1 if not allow_implicit_verse_1 else 2
    last_found = start_num - 1
    valid_starts: List[tuple[int, int, int]] = []

    for m in matches:
        n = int(m.group(1))
        if allow_gaps:
            # Allow strictly-increasing with bounded forward gap
            if n > last_found and (n - last_found) <= max_forward_gap:
                valid_starts.append((m.start(1), m.end(), n))
                last_found = n
        else:
            # Strict monotonic +1
            expected = last_found + 1
            if n == expected:
                valid_starts.append((m.start(1), m.end(), n))
                last_found = n

    # Implicit verse 1: text from start of block to first found verse marker
    if allow_implicit_verse_1 and valid_starts and valid_starts[0][2] >= 2:
        implicit_text = normalize_text(flattened[: valid_starts[0][0]])
        if implicit_text:
            verses.append(Verse(number=1, text=implicit_text))

    for i, (m_start, t_start, n) in enumerate(valid_starts):
        if i + 1 < len(valid_starts):
            t_end = valid_starts[i + 1][0]
        else:
            t_end = len(flattened)
        text = normalize_text(flattened[t_start:t_end])
        verses.append(Verse(number=n, text=text))

    if not verses and flattened.strip():
        verses.append(Verse(number=1, text=normalize_text(flattened)))

    return verses


def is_real_chapter_heading(
    text: str,
    heading_match: re.Match,
    look_ahead_chars: int = 400,
    allow_implicit_verse_1: bool = False,
) -> bool:
    """
    A real chapter heading is followed soon by a verse-like marker.
    For most editions: a `1 ` or `1.` in the next look_ahead_chars.
    For Jubilees-style editions where verse 1 is implicit: any small
    integer marker (`2.` through ~`6.`) in the next look_ahead_chars,
    because some Jubilees chapters skip verse 2 in the source numbering
    (the marker lands at 3 or higher) and the look-ahead must be
    larger anyway because the implicit verse 1 can run ~800-1500 chars
    of prose before the first explicit marker.

    Commentary mentions of "Chapter N" are followed by prose without these
    verse markers.
    """
    body = text[heading_match.end(): heading_match.end() + look_ahead_chars]
    if allow_implicit_verse_1:
        # Look for any small verse marker in the early window — Jubilees
        # source has verse 2 markers up to ~1500 chars from the heading
        # (long verse-1 prose), and occasionally the first marker is 3
        # rather than 2 because verse 2 was dropped in publication.
        return bool(re.search(r"(?:^|[\s\n])[2-6][\.\s]", body))
    return bool(re.search(r"(?:^|[\s\n])1[\.\s]", body))


def _split_at_verse_list_end(body: str) -> tuple[str, str]:
    """
    Split a chapter body into (scripture, commentary) at the point where
    the numbered-verse list ends and free prose begins.

    Used for editions that have no explicit "Commentary" header (Jasher).
    Walks the body paragraph-by-paragraph (paragraphs separated by blank
    lines). A "numbered paragraph" is one that begins with `<digit>+. `
    at column 0 — i.e., a numbered verse opening.

    Algorithm:
      - Find the indices of all numbered paragraphs.
      - Scripture = paragraphs[first_numbered : last_numbered + 1]
        (preserves any interleaved prose between verses — monotonic
        verse filtering in split_verses handles spurious numbers in
        such interjections).
      - Commentary = paragraphs[last_numbered + 1 :].
      - Anything before the first numbered paragraph is dropped — this
        is typically a wrapped continuation of a multi-line chapter
        title (e.g., Jasher's "the Ground" after "First Blood on").
        The single-line heading regex already captured the title's
        first line; the continuation is discarded.

    Returns ("", "") for an empty body. If no numbered paragraphs are
    found, returns (body, "") so a non-verse chapter falls back to the
    legacy behavior rather than disappearing.
    """
    if not body.strip():
        return "", ""

    paragraphs = re.split(r"\n\s*\n", body)
    verse_num_re = re.compile(r"^\s*(\d+)\.\s")

    # Walk paragraphs forward, following a strict monotonic +1 chain
    # starting at verse 1. A paragraph is part of the verse list only if
    # it starts with `N. ` where N is the next expected verse number.
    # This stops the chain at the boundary between scripture and prose,
    # and (crucially for Jasher) it ignores back-matter paragraphs like
    # "1. Forward Index" or "2. Reverse Index" that would otherwise look
    # like verses to a naive "starts-with-digit-period-space" matcher.
    first_verse_idx = -1
    last_verse_idx = -1
    expected = 1

    for i, p in enumerate(paragraphs):
        m = verse_num_re.match(p)
        if m and int(m.group(1)) == expected:
            if first_verse_idx == -1:
                first_verse_idx = i
            last_verse_idx = i
            expected += 1

    if first_verse_idx == -1:
        return body, ""

    scripture = "\n\n".join(paragraphs[first_verse_idx : last_verse_idx + 1])
    commentary = "\n\n".join(paragraphs[last_verse_idx + 1 :]).strip()
    return scripture, commentary


# ---------------------------------------------------------------------------
# Per-edition parsers
# ---------------------------------------------------------------------------

def _parse_single_book_edition(
    text: str,
    *,
    edition_id: str,
    edition_title: str,
    source_file: str,
    book_id: str,
    book_title: str,
    heading_pat: re.Pattern,
    commentary_pat: re.Pattern,
    allow_implicit_verse_1: bool = False,
    require_real_heading: bool = True,
    look_ahead_chars: int = 400,
    allow_verse_gaps: bool = False,
    commentary_strategy: str = "marker",
    commentary_required_marker: Optional[str] = None,
) -> Edition:
    """
    Common machinery for the three single-book editions
    (Enoch, Jubilees, Jasher). The two regexes differ per edition.
    look_ahead_chars and allow_verse_gaps default to the strict-monotonic
    behavior used by Enoch and Jasher; Jubilees overrides both because
    the published edition has long verse-1 prose runs and occasional
    missing verse markers at paragraph breaks.
    """
    edition = Edition(
        edition_id=edition_id,
        title=edition_title,
        source_file=source_file,
    )
    book = Book(book_id=book_id, book_title=book_title)

    raw_matches = list(heading_pat.finditer(text))
    if require_real_heading:
        chapter_matches = [
            m for m in raw_matches
            if is_real_chapter_heading(
                text, m,
                look_ahead_chars=look_ahead_chars,
                allow_implicit_verse_1=allow_implicit_verse_1,
            )
        ]
    else:
        chapter_matches = raw_matches

    if not chapter_matches:
        edition.front_matter = text.strip()
        edition.books.append(book)
        return edition

    edition.front_matter = text[: chapter_matches[0].start()].strip()

    seen_numbers: set[int] = set()
    for i, m in enumerate(chapter_matches):
        ch_num = int(m.group(1))
        if ch_num in seen_numbers:
            # Skip duplicates — the first occurrence is the real one.
            continue
        seen_numbers.add(ch_num)

        ch_title = (m.group(2) or "").strip() if m.lastindex and m.lastindex >= 2 else ""
        body_start = m.end()
        # Find next non-duplicate chapter heading for body end
        body_end = len(text)
        for j in range(i + 1, len(chapter_matches)):
            nxt = chapter_matches[j]
            nxt_num = int(nxt.group(1))
            if nxt_num not in seen_numbers and nxt_num != ch_num:
                body_end = nxt.start()
                break
        body = text[body_start:body_end]

        if commentary_strategy == "verse_end":
            # Used for editions without an explicit "Commentary" header
            # (Jasher). Split at the boundary between the numbered verse
            # list and the following prose.
            scripture, commentary = _split_at_verse_list_end(body)
            if (
                commentary
                and commentary_required_marker
                and commentary_required_marker not in commentary
            ):
                print(
                    f"WARN: {edition_id} chapter {ch_num} commentary "
                    f"missing expected marker "
                    f"'{commentary_required_marker}'",
                    file=sys.stderr,
                )
        else:  # "marker" — split at the first commentary_pat match
            com_match = commentary_pat.search(body)
            if com_match:
                scripture = body[: com_match.start()]
                commentary = body[com_match.end():].strip()
            else:
                scripture = body
                commentary = ""

        chapter = Chapter(
            number=ch_num,
            title=ch_title,
            verses=split_verses(
                scripture,
                allow_implicit_verse_1=allow_implicit_verse_1,
                allow_gaps=allow_verse_gaps,
            ),
            commentary=normalize_text(commentary),
        )
        book.chapters.append(chapter)

    edition.books.append(book)
    return edition


def parse_enoch(text: str) -> Edition:
    """
    Enoch headings:
        Chapter <N>: <Title>
        ...verses (line-start numbered: `<N> <text>`)...
        Commentary on Chapter <N>
        ...commentary prose...
    """
    return _parse_single_book_edition(
        text,
        edition_id="enoch",
        edition_title="Book of Enoch — Restored Names Edition",
        source_file="Enoch-Restored-Names-Edition.txt",
        book_id="1-enoch",
        book_title="Book of Enoch",
        heading_pat=re.compile(r"^Chapter\s+(\d+):\s*(.+)$", re.MULTILINE),
        commentary_pat=re.compile(r"^Commentary on Chapter\s+\d+\s*$", re.MULTILINE),
        allow_implicit_verse_1=False,
    )


def parse_jubilees(text: str) -> Edition:
    """
    Jubilees headings:
        Chapter <N> — <Title>     (em-dash separator)
        ...running prose with inline `<N>. ` verse markers, verse 1 implicit...
        (next Chapter heading — no separate Commentary marker; commentary
         is interleaved with scripture in this edition)
    Note: in the published Jubilees, scripture and commentary are mixed
    in the body — there's no clean "Commentary" separator like Enoch has.
    For the first pass, treat the whole body as scripture and let the
    restoration pipeline's reviewer pass mark commentary separately later.
    """
    return _parse_single_book_edition(
        text,
        edition_id="jubilees",
        edition_title="Book of Jubilees — Restored Names Edition",
        source_file="Jubilees-Restored-Names-Edition.txt",
        book_id="jubilees",
        book_title="Book of Jubilees",
        heading_pat=re.compile(r"^Chapter\s+(\d+)\s+—\s+(.+)$", re.MULTILINE),
        # Each chapter ends with a bare `Commentary` line on its own
        # (S56 D1.b: was `^Commentary on Chapter \d+\s*$`, which matched zero
        # markers in this edition — 50 markers fire under the corrected form).
        commentary_pat=re.compile(r"^Commentary\s*$", re.MULTILINE),
        allow_implicit_verse_1=True,
        # Jubilees verse-1 prose can run ~800-1500 chars before the first
        # explicit marker; look-ahead must be large to avoid dropping real
        # chapter headings.
        look_ahead_chars=2500,
        # Published Jubilees occasionally drops verse markers at paragraph
        # breaks (5 → 7, 16 → 18, etc.). Allow bounded forward gaps so
        # the monotonic chain doesn't terminate at the first missing marker
        # and lose all subsequent verses.
        allow_verse_gaps=True,
    )


def parse_jasher(text: str) -> Edition:
    """
    Jasher headings:
        Chapter <N>: <Title>      (must have title — a bare 'Chapter N'
                                   is an appendix/TOC stub and is filtered
                                   by is_real_chapter_heading)
        ...numbered list verses: `<N>.  <text>\\n    <continuation>`...
    """
    return _parse_single_book_edition(
        text,
        edition_id="jasher",
        edition_title="Book of Jasher — Restored Names Edition",
        source_file="Jasher-Restored-Names-Edition.txt",
        book_id="jasher",
        book_title="Book of Jasher",
        # Require ': <Title>' (forces colon + title — filters out bare 'Chapter N' lines)
        heading_pat=re.compile(r"^Chapter\s+(\d+):\s*(.+)$", re.MULTILINE),
        # Jasher has no explicit "Commentary" header in the body. Each
        # chapter goes: numbered verses → free prose → `Cross-references:`
        # closing line → next Chapter heading. The `verse_end` strategy
        # splits at the first non-numbered paragraph after the verse list.
        # commentary_pat below is unused under verse_end but kept for
        # interface uniformity with the other dispatchers.
        # (S56 D1.b: was `^Commentary on Chapter \d+\s*$`, which matched
        # zero markers — the entire commentary block was leaking into the
        # last verse's text. Cross-references count = chapter count = 91,
        # so the verse-end split has a 1:1 sanity check.)
        commentary_pat=re.compile(r"^Commentary on Chapter\s+\d+\s*$", re.MULTILINE),
        commentary_strategy="verse_end",
        commentary_required_marker="Cross-references:",
        allow_implicit_verse_1=False,
    )


APOCRYPHA_BOOKS_IN_ORDER = [
    "1 Esdras", "2 Esdras", "Tobit", "Judith", "The Rest of Esther",
    "The Wisdom of Solomon", "Ecclesiasticus",
    "Baruch with the Letter of Jeremiah",
    "The Song of the Three Holy Children", "The History of Susanna",
    "Bel and the Dragon", "The Prayer of Manasseh",
    "1 Maccabees", "2 Maccabees",
]


def parse_apocrypha(text: str) -> Edition:
    """
    Apocrypha headings:
        <Book Name> — Chapter <N>     (em-dash separator, on its own line)
        ...verses (indented)...
        Commentary
        ...commentary text...
        (next chapter heading)

    Multi-book: when the book name changes, start a new book.
    Per-book introductions appear as their own Heading 1 of the form
        <Book Name> — Introduction
    Treat those as front matter for that book (or as the book's intro).
    """
    edition = Edition(
        edition_id="apocrypha",
        title="The Apocrypha — Restored Names Edition",
        source_file="Apocrypha-Restored-Names-Edition.txt",
    )

    # Build the alternation of known book names — match longest first.
    book_names_sorted = sorted(APOCRYPHA_BOOKS_IN_ORDER, key=len, reverse=True)
    book_alt = "|".join(re.escape(b) for b in book_names_sorted)

    # Headings: "<Book> — Chapter N" or "<Book> — Introduction"
    heading_pat = re.compile(
        rf"^({book_alt})\s+—\s+(Chapter\s+(\d+)|Introduction)\s*$",
        re.MULTILINE,
    )
    commentary_pat = re.compile(r"^Commentary\s*$", re.MULTILINE)

    matches = list(heading_pat.finditer(text))
    if not matches:
        edition.front_matter = text.strip()
        return edition

    edition.front_matter = text[: matches[0].start()].strip()

    # Walk the headings, building books and chapters in order.
    current_book: Optional[Book] = None
    book_intros: dict[str, str] = {}

    for i, m in enumerate(matches):
        book_name = m.group(1)
        kind = m.group(2)
        body_start = m.end()
        body_end = matches[i + 1].start() if i + 1 < len(matches) else len(text)
        body = text[body_start:body_end]

        if current_book is None or current_book.book_title != book_name:
            current_book = Book(book_id=slugify(book_name), book_title=book_name)
            edition.books.append(current_book)

        if kind == "Introduction":
            book_intros[book_name] = body.strip()
            # Stash the intro into the book object via a synthetic chapter 0.
            # We'll separate this out at JSON serialization time.
            current_book.chapters.append(
                Chapter(number=0, title="Introduction", verses=[], commentary=normalize_text(body))
            )
            continue

        ch_num = int(m.group(3))

        com_match = commentary_pat.search(body)
        if com_match:
            scripture = body[: com_match.start()]
            commentary = body[com_match.end():].strip()
        else:
            scripture = body
            commentary = ""

        chapter = Chapter(
            number=ch_num,
            title=f"Chapter {ch_num}",
            verses=split_verses(scripture),
            commentary=normalize_text(commentary),
        )
        current_book.chapters.append(chapter)

    return edition


# ---------------------------------------------------------------------------
# Driver
# ---------------------------------------------------------------------------

PARSERS = {
    "Enoch-Restored-Names-Edition.txt": parse_enoch,
    "Jubilees-Restored-Names-Edition.txt": parse_jubilees,
    "Jasher-Restored-Names-Edition.txt": parse_jasher,
    "Apocrypha-Restored-Names-Edition.txt": parse_apocrypha,
}


def main():
    summary = []
    for fn, parser in PARSERS.items():
        in_path = os.path.join(SRC_DIR, fn)
        if not os.path.exists(in_path):
            print(f"  SKIP — not found: {in_path}", file=sys.stderr)
            continue
        with open(in_path, "r", encoding="utf-8") as f:
            text = f.read()
        edition = parser(text)
        out_path = os.path.join(OUT_DIR, f"{edition.edition_id}.json")
        with open(out_path, "w", encoding="utf-8") as f:
            json.dump(asdict(edition), f, ensure_ascii=False, indent=2)
        # Quick stats.
        total_chapters = sum(len(b.chapters) for b in edition.books)
        total_verses = sum(
            len(c.verses) for b in edition.books for c in b.chapters
        )
        summary.append({
            "edition": edition.edition_id,
            "books": len(edition.books),
            "chapters": total_chapters,
            "verses": total_verses,
            "out": out_path,
        })
        print(
            f"{edition.edition_id:12s}  "
            f"books={len(edition.books):2d}  "
            f"chapters={total_chapters:4d}  "
            f"verses={total_verses:6d}  "
            f"-> {out_path}"
        )
    print("\nSummary:")
    for s in summary:
        print(f"  {s}")


if __name__ == "__main__":
    main()
