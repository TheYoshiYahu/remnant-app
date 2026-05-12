#!/usr/bin/env python3
"""
parse_whiston_josephus.py
-------------------------
W-2 extractor for Whiston's Josephus PDF.

Source: ~/Downloads/whiston-josephus.pdf (1,159 pages, Whiston 1737 translation,
        public-domain "Complete Works of Flavius Josephus", Acrobat Web Capture
        producer — clean HTML→PDF text layer).

Output: ~/Desktop/App/source-texts/josephus/whiston-josephus.txt (the full
        edition; 30 labeled books across Wars, Antiquities, Life, and Apion;
        Hades held per session-18 decision in _WHISTON_BOUNDARIES.md).

The pilot run (--pilot) extracts only Antiquities Book I (pp 331-359 body,
ENDNOTES at p360 dropped per decision §5: drop Whiston's footnotes entirely)
and writes ~/Desktop/App/source-texts/josephus/whiston-josephus-pilot-antiq-1.txt
for Yoshi's review before the full batch runs.

What it strips at extraction time (per decision §5, locked session 18):
- All Whiston editorial footnotes — both the inline (N) markers in the verse
  prose and the ENDNOTES section that follows each book's body.
- The "Back To The Table Of Contents" HTML-capture artifact at book end.
- Running-header repeats of the book-title line that appear at the top of
  each PDF page (e.g., "Antiquities of the Jews - Book I" + chronology-range
  + "FROM THE CREATION..." block which IS metadata kept; but only ONCE at
  the book opener).

What it preserves:
- The book opener block (work title + chronology range + "FROM ... TO ..."
  range line) as part of the book heading.
- Every chapter's "CHAPTER N." line + the all-caps caption that follows.
- The verse prose itself, with verse markers "1.", "2.", "3." reformatted
  to the existing-edition convention "N.  " (number, period, two spaces).
"""

from __future__ import annotations
import argparse
import os
import re
import subprocess
import sys
import tempfile

# ---------------------------------------------------------------------------
# Paths (mirrors parse_published_editions.py)
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
PDF_PATH = os.environ.get("WHISTON_PDF", os.path.expanduser("~/Downloads/whiston-josephus.pdf"))
OUT_DIR  = os.path.join(ROOT, "source-texts", "josephus")
os.makedirs(OUT_DIR, exist_ok=True)

# ---------------------------------------------------------------------------
# Book boundary map (from _WHISTON_BOUNDARIES.md, built session 18)
# ---------------------------------------------------------------------------
# Each entry: (book_id, display_title, start_page, end_page_exclusive)
# end_page_exclusive = start page of the next book; the body for this book
# is pages[start .. end_page_exclusive-1] (1-indexed page numbers).
# Hades (pp 1102-1104) is held — see _WHISTON_BOUNDARIES.md §4.

BOOKS = [
    # Wars (7 books, pp 4-330)
    ("wars-1",       "The Wars of the Jews — Book I",        4,    84),
    ("wars-2",       "The Wars of the Jews — Book II",       84,  144),
    ("wars-3",       "The Wars of the Jews — Book III",     144,  179),
    ("wars-4",       "The Wars of the Jews — Book IV",      179,  223),
    ("wars-5",       "The Wars of the Jews — Book V",       223,  265),
    ("wars-6",       "The Wars of the Jews — Book VI",      265,  298),
    ("wars-7",       "The Wars of the Jews — Book VII",     298,  331),
    # Antiquities (20 books, pp 331-1066)
    ("antiq-1",      "Antiquities of the Jews — Book I",    331,  367),
    ("antiq-2",      "Antiquities of the Jews — Book II",   367,  404),
    ("antiq-3",      "Antiquities of the Jews — Book III",  404,  438),
    ("antiq-4",      "Antiquities of the Jews — Book IV",   438,  474),
    ("antiq-5",      "Antiquities of the Jews — Book V",    474,  510),
    ("antiq-6",      "Antiquities of the Jews — Book VI",   510,  552),
    ("antiq-7",      "Antiquities of the Jews — Book VII",  552,  594),
    ("antiq-8",      "Antiquities of the Jews — Book VIII", 594,  642),
    ("antiq-9",      "Antiquities of the Jews — Book IX",   642,  673),
    ("antiq-10",     "Antiquities of the Jews — Book X",    673,  703),
    ("antiq-11",     "Antiquities of the Jews — Book XI",   703,  735),
    ("antiq-12",     "Antiquities of the Jews — Book XII",  735,  773),
    ("antiq-13",     "Antiquities of the Jews — Book XIII", 773,  817),
    ("antiq-14",     "Antiquities of the Jews — Book XIV",  817,  863),
    ("antiq-15",     "Antiquities of the Jews — Book XV",   863,  903),
    ("antiq-16",     "Antiquities of the Jews — Book XVI",  903,  937),
    ("antiq-17",     "Antiquities of the Jews — Book XVII", 937,  972),
    ("antiq-18",     "Antiquities of the Jews — Book XVIII",972, 1009),
    ("antiq-19",     "Antiquities of the Jews — Book XIX", 1009, 1041),
    ("antiq-20",     "Antiquities of the Jews — Book XX",  1041, 1067),
    # Life (1 book, pp 1067-1101)
    ("life",         "The Life of Flavius Josephus",       1067, 1102),
    # Hades (HELD per session-18 decision §4; pp 1102-1104 SKIPPED)
    # Apion (2 books, pp 1105-1158)
    ("apion-1",      "Flavius Josephus Against Apion — Book I",  1105, 1133),
    ("apion-2",      "Flavius Josephus Against Apion — Book II", 1133, 1160),
]
assert len(BOOKS) == 30, f"Expected 30 labeled books per session-18 decision, got {len(BOOKS)}"

# ---------------------------------------------------------------------------
# pdftotext extraction
# ---------------------------------------------------------------------------

def pdftotext_layout(pdf_path: str) -> list[str]:
    """Run pdftotext -layout against the PDF and return per-page text list."""
    with tempfile.NamedTemporaryFile(suffix=".txt", delete=False) as tmp:
        out_path = tmp.name
    try:
        subprocess.run(["pdftotext", "-layout", pdf_path, out_path], check=True)
        with open(out_path, encoding="utf-8") as f:
            raw = f.read()
        # pdftotext emits a form-feed at each page boundary
        return raw.split("\x0c")
    finally:
        try:
            os.unlink(out_path)
        except OSError:
            pass

# ---------------------------------------------------------------------------
# Cleaning passes
# ---------------------------------------------------------------------------

# Inline footnote marker: "(N)" surrounded by text (not a paragraph starter).
# Note: we strip ALL (N) markers from body prose. Footnote BODIES at column 0
# never reach this regex because we pre-cut at the ENDNOTES heading per book.
INLINE_FOOTNOTE_RE = re.compile(r"\s*\(\d+\)\s*")

# HTML→PDF artifacts to drop
ARTIFACT_LINES = (
    re.compile(r"^\s*Back\s+To\s+The\s+Table\s+Of\s+Contents\s*$", re.I),
    re.compile(r"^\s*Bact\s+To\s+The\s+Table\s+Of\s+Contents\s*$", re.I),  # OCR typo seen on p1159
)

# ENDNOTES anchor — Whiston's PDF uses TWO heading styles for footnote
# sections:
#   - "ENDNOTES" (plural, 5 occurrences across the PDF, e.g. p7 Wars Preface,
#     p330 end of Wars VII, p360 end of Antiquities I, p398 end of Antiquities II,
#     p1098 end of Life)
#   - "ENDNOTE" (singular, 23 occurrences — one per book that has notes;
#     e.g., Wars Book I notes on p78, Wars Book II notes on p137, etc.)
# Both heading styles introduce the same footnote-body section (numbered
# (1), (2), (3), ... bodies followed by the "Back To The Table Of Contents"
# HTML-capture artifact and a page-feed before body resumption or next book).
# Match both spellings.
ENDNOTES_RE = re.compile(r"^\s*ENDNOTES?\s*$", re.M | re.I)
# Work-title running header — signals body resumption after a preface-level
# ENDNOTES section in Wars Book I (and similar). The Wars Preface has its
# own endnotes on p7-8; the Book I body proper restarts on p9 with the
# work-title repeated. Detecting that resumption lets us strip the preface
# endnotes section in-place without lopping off the rest of the book.
WORK_TITLE_RE = re.compile(
    r"^\s*(?:The|THE)\s+(?:Wars|Antiquities|WARS|ANTIQUITIES)\s+(?:Of|of|OF)\s+(?:the|The|THE)\s+Jews\b",
    re.I,
)

# Running-header lines for Wars/Antiquities format: "The Wars Of The Jews" / "Antiquities Of The Jews"
# These appear ONLY at the top of the first page of each book in this PDF (no per-page repeats),
# so we don't need to strip them — they're part of the body heading we keep.

# Chapter heading: "                                       CHAPTER N."
CHAPTER_RE = re.compile(r"^\s*CHAPTER\s+(\d+)\.\s*$", re.M)

# A verse-starter line: "N. " at column 0 (or with small indent) followed by capital letter
VERSE_START_RE = re.compile(r"^\s*(\d+)\.\s+([A-Z(\"“‘])")


def strip_endnotes_sections(book_text: str) -> str:
    """
    Remove every ENDNOTES section in the book text in place, preserving body
    prose on either side. This is the per-decision-§5 footnote-drop logic.

    Whiston's structure varies by book:
    - Most books have a single trailing ENDNOTES section at the very end
      (e.g., Antiquities Book I — body pp 331-360, then ENDNOTES + footnote
      bodies pp 360-366, then Book II at p367). The strip cuts to end-of-region.
    - Wars Book I additionally carries a Preface that has its OWN ENDNOTES
      section embedded inside the book region (preface body p4-7, preface
      ENDNOTES p7-8, then Book I body proper resuming on p9). The strip cuts
      only the preface endnotes section, then lets body parsing resume.

    A footnote section is bounded by:
      - opener: the ENDNOTES heading line
      - closer: the first chapter heading, verse-start, OR work-title running
        header line found after the opener — these signal body resumption.
        If none is found, the footnote section runs to end of book region.
    """
    lines = book_text.split("\n")
    out: list[str] = []
    i, n = 0, len(lines)
    while i < n:
        if ENDNOTES_RE.match(lines[i]):
            # Skip the ENDNOTES heading
            i += 1
            # Consume footnote bodies + back-to-toc + blanks until body resumes
            while i < n:
                ln = lines[i]
                if CHAPTER_RE.match(ln):
                    break
                if VERSE_START_RE.match(ln):
                    break
                if WORK_TITLE_RE.match(ln):
                    break
                i += 1
            continue
        out.append(lines[i])
        i += 1
    return "\n".join(out)


def drop_artifact_lines(book_text: str) -> str:
    out = []
    for ln in book_text.split("\n"):
        if any(p.match(ln) for p in ARTIFACT_LINES):
            continue
        out.append(ln)
    return "\n".join(out)


def strip_inline_footnotes(text: str) -> str:
    """
    Remove inline (N) markers from body prose.
    Replace with a single space, then collapse multiple spaces.
    Preserves real parenthetical content like (the Lord), (1 Chr 21), etc.
    by requiring the parenthetical to be a bare integer.
    """
    cleaned = INLINE_FOOTNOTE_RE.sub(" ", text)
    cleaned = re.sub(r" {2,}", " ", cleaned)
    return cleaned


def reflow_to_paragraphs(text: str) -> str:
    """
    pdftotext -layout preserves PDF line breaks within paragraphs. We want
    verse paragraphs joined back into single lines so the existing verse-
    splitter in parse_published_editions.py can process them.

    A paragraph break is signaled by:
    - A blank line (one or more consecutive lines of only whitespace), OR
    - A line that starts with a verse marker "N." (next verse begins).

    A CHAPTER heading line keeps its own newline.
    """
    lines = text.split("\n")
    out_lines: list[str] = []
    buf: list[str] = []

    def flush():
        nonlocal buf
        if buf:
            joined = " ".join(s.strip() for s in buf if s.strip())
            if joined:
                out_lines.append(joined)
            buf = []

    for ln in lines:
        stripped = ln.strip()
        if not stripped:
            flush()
            out_lines.append("")  # preserve blank
            continue
        if CHAPTER_RE.match(ln):
            flush()
            out_lines.append(stripped)
            continue
        if VERSE_START_RE.match(ln):
            # New verse paragraph — flush previous, then start new with this line
            flush()
            buf.append(stripped)
            continue
        buf.append(stripped)
    flush()
    # Collapse runs of blank lines to a single blank
    out = []
    prev_blank = False
    for ln in out_lines:
        if not ln:
            if prev_blank:
                continue
            prev_blank = True
        else:
            prev_blank = False
        out.append(ln)
    return "\n".join(out).strip() + "\n"


def normalize_verse_markers(text: str) -> str:
    """
    Reformat verse-starter lines from Whiston's "N. text" to the existing-
    edition convention "N.  text" (two spaces after period).
    """
    return re.sub(r"^(\d+)\.\s+", r"\1.  ", text, flags=re.M)


def _is_caption_line(s: str) -> bool:
    """
    A caption line in Whiston has no lowercase letters — all-caps text plus
    punctuation, digits, and brackets. The first line containing a lowercase
    letter is body prose, not caption. This is the signal that distinguishes
    a multi-paragraph chapter (caption -> "1. ...") from a single-paragraph
    chapter (caption -> body prose with no explicit verse marker, as in
    Antiquities Book I Chapter 22 "HOW ISAAC DIED, AND WAS BURIED IN HEBRON").
    """
    return s.strip() != "" and not re.search(r"[a-z]", s)


def extract_chapter_caption(book_text: str) -> str:
    """
    For each CHAPTER N. line, the immediately following block of all-caps
    lines forms the caption. The caption ends at:
      - the first verse-start line ("1. Capital..."), OR
      - the first line that contains a lowercase letter (body prose for a
        single-paragraph chapter that omits the verse-1 marker), OR
      - the next CHAPTER N. line, OR
      - end of book.

    Returns the text with each chapter heading consolidated to:
        Chapter N. CAPTION...
    When the body starts without an explicit "1." marker (single-paragraph
    chapter case), a "1.  " marker is inserted at the body-start so the
    downstream verse-splitter sees the chapter as one verse instead of
    silently dropping it.
    """
    out_lines = []
    lines = book_text.split("\n")
    i = 0
    while i < len(lines):
        ln = lines[i]
        m = CHAPTER_RE.match(ln)
        if not m:
            out_lines.append(ln)
            i += 1
            continue
        chapter_num = m.group(1)
        # Collect caption lines: contiguous all-caps-ish lines, blank lines OK.
        # Stop at: verse-start, next chapter, OR first line with lowercase letters.
        caption_parts = []
        i += 1
        implicit_verse_needed = False
        while i < len(lines):
            cur = lines[i]
            stripped = cur.strip()
            if not stripped:
                i += 1
                continue
            if VERSE_START_RE.match(cur):
                # Normal multi-paragraph chapter: explicit "1." follows the caption.
                implicit_verse_needed = False
                break
            if CHAPTER_RE.match(cur):
                # Empty-body chapter (defensive — should not happen in Whiston).
                implicit_verse_needed = False
                break
            if _is_caption_line(cur):
                caption_parts.append(stripped)
                i += 1
                continue
            # First non-caption, non-verse line is body prose for a
            # single-paragraph chapter that omits the verse-1 marker.
            implicit_verse_needed = True
            break
        caption = re.sub(r"\s+", " ", " ".join(caption_parts)).strip()
        out_lines.append(f"Chapter {chapter_num}. {caption}")
        out_lines.append("")  # blank between heading and first verse
        if implicit_verse_needed:
            # Prefix the body-start line with an explicit "1.  " so the
            # verse-splitter recognizes it as a verse instead of dropping it
            # or folding it into the caption.
            lines[i] = re.sub(r"^(\s*)", r"\g<1>1.  ", lines[i], count=1)
    return "\n".join(out_lines)


# ---------------------------------------------------------------------------
# Per-book extraction
# ---------------------------------------------------------------------------

def extract_book(pages: list[str], book_id: str, title: str, start: int, end_exclusive: int) -> str:
    """Extract one labeled book's body text, cleaned and reformatted."""
    # Concatenate the page range (1-indexed pages -> 0-indexed list)
    block = "\n".join(pages[start - 1 : end_exclusive - 1])
    # Strip footnotes sections (handles both end-of-book endnotes and
    # preface-level endnotes embedded mid-book)
    block = strip_endnotes_sections(block)
    # Drop "Back To The Table Of Contents" artifacts
    block = drop_artifact_lines(block)
    # Strip inline (N) footnote markers
    block = strip_inline_footnotes(block)
    # Reflow PDF-broken lines back to paragraphs
    block = reflow_to_paragraphs(block)
    # Consolidate CHAPTER N. + caption onto one line
    block = extract_chapter_caption(block)
    # Normalize verse markers
    block = normalize_verse_markers(block)
    # Top with the book title
    out = f"{title}\n\n{block.strip()}\n"
    return out


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main(argv=None) -> int:
    p = argparse.ArgumentParser(description="Extract Whiston Josephus from PDF.")
    p.add_argument("--pilot", action="store_true",
                   help="Extract only Antiquities Book I to a pilot file.")
    p.add_argument("--book", default=None,
                   help="Extract a single book by book_id (e.g., antiq-1).")
    args = p.parse_args(argv)

    print(f"PDF:  {PDF_PATH}", flush=True)
    print(f"Out:  {OUT_DIR}", flush=True)
    if not os.path.exists(PDF_PATH):
        print(f"ERROR: PDF not found at {PDF_PATH}", file=sys.stderr)
        return 2

    print("Running pdftotext -layout ...", flush=True)
    pages = pdftotext_layout(PDF_PATH)
    print(f"Got {len(pages)} pages.", flush=True)

    if args.pilot:
        # Pilot: Antiquities Book I only
        entry = next(b for b in BOOKS if b[0] == "antiq-1")
        bid, title, start, end = entry
        text = extract_book(pages, bid, title, start, end)
        out_path = os.path.join(OUT_DIR, "whiston-josephus-pilot-antiq-1.txt")
        with open(out_path, "w", encoding="utf-8") as f:
            f.write(text)
        print(f"Wrote pilot: {out_path}  ({len(text)} chars)", flush=True)
        return 0

    if args.book:
        entries = [b for b in BOOKS if b[0] == args.book]
        if not entries:
            print(f"ERROR: unknown book_id {args.book!r}", file=sys.stderr)
            return 2
        bid, title, start, end = entries[0]
        text = extract_book(pages, bid, title, start, end)
        out_path = os.path.join(OUT_DIR, f"whiston-josephus-{bid}.txt")
        with open(out_path, "w", encoding="utf-8") as f:
            f.write(text)
        print(f"Wrote: {out_path}  ({len(text)} chars)", flush=True)
        return 0

    # Full extraction: all 30 books in one edition file, separated by book titles.
    edition_chunks = []
    for bid, title, start, end in BOOKS:
        chunk = extract_book(pages, bid, title, start, end)
        edition_chunks.append(chunk)
        print(f"  {bid:10s}  {end-start:4d} pages -> {len(chunk):6d} chars", flush=True)
    full = "\n\n".join(edition_chunks)
    out_path = os.path.join(OUT_DIR, "whiston-josephus.txt")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(full)
    print(f"Wrote: {out_path}  ({len(full)} chars)", flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
