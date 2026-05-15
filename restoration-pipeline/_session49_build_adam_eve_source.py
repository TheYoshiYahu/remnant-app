#!/usr/bin/env python3
"""
_session49_build_adam_eve_source.py
-----------------------------------
Session 49 (2026-05-14) one-off source builder for the Conflict of Adam
and Eve with Satan — the First and Second Books of Adam and Eve.

Inputs (Chrome-sourced Session 49, see DOWNLOAD_MANIFEST.md):
  ~/Downloads/pg398_first_book_adam_eve.txt
      Project Gutenberg #398 — Rutherford H. Platt, Jr., *The Forgotten
      Books of Eden* (1926/1927), First Book of Adam and Eve. The Platt
      text in its 1995 modernized form (Dennis Hawkins: thou->you,
      art->are). Public domain.
  ~/Downloads/eden_2_raw.html
      reluctant-messenger.com mirror of the same Platt text, Second Book
      of Adam and Eve, modernized register, single-page HTML.

Source-base decision (Yoshi, Session 49): the corpus restores language and
sacred names regardless, so the modernized Platt register is acceptable
and is the chosen base. The ultimate translation lineage is Malan 1882
(Ethiopic) -> Platt 1926 (Forgotten Books of Eden) -> 1995 modernization.
The Malan 1882 scan (~/Downloads/malan-1882-adam-and-eve.pdf) is on disk
but its OCR text layer is unusable; kept as a reference scan only.

Output (normalized raw source, pre-restoration):
  source-texts/adam-eve/1-adam-eve.txt
  source-texts/adam-eve/2-adam-eve.txt

Format written (consumed by restore.py then parse_adam_eve_edition.py):
  # <Book Title>
  ## Chapter <n> — <chapter title>
  <verse-no><TAB><verse text, single line>
"""
from __future__ import annotations
import html as _html
import os
import re
import sys

def _resolve_downloads() -> str:
    candidates = [
        os.path.expanduser("~/Downloads"),
        "/sessions/focused-upbeat-galileo/mnt/Downloads",
    ]
    for c in candidates:
        if os.path.isdir(c) and os.path.exists(
            os.path.join(c, "pg398_first_book_adam_eve.txt")
        ):
            return c
    return candidates[0]


DOWNLOADS = _resolve_downloads()


def _resolve_app_root() -> str:
    here = os.path.dirname(os.path.abspath(__file__))
    for _ in range(4):
        if os.path.basename(here) == "App":
            return here
        here = os.path.dirname(here)
    return os.path.expanduser("~/Desktop/App")


APP_ROOT = _resolve_app_root()
OUT_DIR = os.path.join(APP_ROOT, "source-texts", "adam-eve")

ROMAN = {
    "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000,
}


def roman_to_int(s: str) -> int:
    s = s.strip().upper()
    total, prev = 0, 0
    for ch in reversed(s):
        if ch not in ROMAN:
            raise ValueError(f"bad roman numeral: {s!r}")
        val = ROMAN[ch]
        if val < prev:
            total -= val
        else:
            total += val
            prev = val
    return total


def collapse_ws(s: str) -> str:
    return re.sub(r"\s+", " ", s).strip()


# ---------------------------------------------------------------------------
# Book I — from the Project Gutenberg #398 plain text
# ---------------------------------------------------------------------------

GUT_START = "*** START OF THE PROJECT GUTENBERG"
GUT_END = "*** END OF THE PROJECT GUTENBERG"
# Chapter heading in the body: "Chapter I - <title>" possibly wrapped onto
# a 2nd line. Verse: a line beginning "<digits> <text>".
CH_RE = re.compile(r"^Chapter\s+([IVXLC]+)\s*[-–—]\s*(.*)$")
VS_RE = re.compile(r"^(\d+)\s+(.*)$")


def build_book_one(raw: str) -> str:
    # isolate the Gutenberg body
    s = raw.index(GUT_START)
    s = raw.index("\n", s) + 1
    e = raw.index(GUT_END)
    body = raw[s:e]
    # Platt-era Gutenberg texts carry an inline sign-off line that sits
    # before the standardized *** END *** marker — cut it so it does not
    # bleed into the final verse.
    m_signoff = re.search(r"End of (the )?Project Gutenberg", body, re.IGNORECASE)
    if m_signoff:
        body = body[: m_signoff.start()]

    # The body opens with a TOC (chapter-title list) then repeats the real
    # content starting at the second "Prologue". Find the real content: the
    # second occurrence of a line that is exactly "Prologue".
    lines = body.split("\n")
    prologue_idxs = [i for i, ln in enumerate(lines) if ln.strip() == "Prologue"]
    if len(prologue_idxs) < 2:
        raise SystemExit("[book1] could not locate real content start")
    content = lines[prologue_idxs[1]:]

    out: list[str] = ["# The First Book of Adam and Eve"]
    # We treat "Prologue" as Chapter 0; FBE Book I prologue is short prose.
    cur_chapter: int | None = None
    cur_title: str = ""
    pending_ch_title: list[str] = []
    in_ch_title = False
    verse_no: int | None = None
    verse_buf: list[str] = []
    prologue_buf: list[str] = []
    in_prologue = False

    def flush_verse():
        nonlocal verse_no, verse_buf
        if verse_no is not None and verse_buf:
            out.append(f"{verse_no}\t{collapse_ws(' '.join(verse_buf))}")
        verse_no, verse_buf = None, []

    def flush_chapter_title():
        nonlocal in_ch_title, pending_ch_title, cur_title
        if in_ch_title:
            cur_title = collapse_ws(" ".join(pending_ch_title))
            out.append(f"## Chapter {cur_chapter} — {cur_title}")
            pending_ch_title = []
            in_ch_title = False

    i = 0
    while i < len(content):
        ln = content[i]
        stripped = ln.strip()
        i += 1

        if stripped == "Prologue":
            flush_verse()
            in_prologue = True
            prologue_buf = []
            continue

        m_ch = CH_RE.match(stripped)
        if m_ch:
            # The Gutenberg #398 "Prologue" is Dennis Hawkins' 1995
            # editorial note (it describes the 1995 electronic conversion
            # itself) — NOT the ancient text. Per the project's standing
            # practice for modern editorial front matter (cf. the Sonnini
            # parser dropping the 2011 Covenant Publishing introduction),
            # it is not republished. The book opens at Chapter I.
            if in_prologue:
                in_prologue = False
                prologue_buf = []
            flush_verse()
            flush_chapter_title()
            cur_chapter = roman_to_int(m_ch.group(1))
            pending_ch_title = [m_ch.group(2)] if m_ch.group(2).strip() else []
            in_ch_title = True
            continue

        if in_ch_title:
            # chapter title may wrap to following non-empty lines until a
            # blank line or a verse marker appears
            if stripped == "":
                flush_chapter_title()
            elif VS_RE.match(stripped):
                flush_chapter_title()
                # fall through to verse handling below
            else:
                pending_ch_title.append(stripped)
                continue

        if in_prologue:
            if stripped:
                prologue_buf.append(stripped)
            continue

        m_vs = VS_RE.match(stripped)
        if m_vs:
            n = int(m_vs.group(1))
            last = verse_no if verse_no is not None else 0
            # Windowed monotonic guard — same rationale as Book II: only a
            # small forward step is a real verse marker; a larger number
            # starting a wrapped line is mid-sentence text.
            if last < n <= last + 10:
                flush_verse()
                verse_no = n
                verse_buf = [m_vs.group(2)]
                continue
            # else: fall through, treat as continuation

        if stripped == "":
            continue

        # continuation line of the current verse
        if verse_no is not None:
            verse_buf.append(stripped)

    flush_verse()
    flush_chapter_title()
    return "\n".join(out) + "\n"


# ---------------------------------------------------------------------------
# Book II — from the reluctant-messenger.com single-page HTML mirror
# ---------------------------------------------------------------------------

def build_book_two(raw_html: str) -> str:
    # strip tags, unescape entities
    txt = re.sub(r"<[^>]+>", "", raw_html)
    txt = _html.unescape(txt)
    # isolate from the second "Second Book of Adam and Eve" header
    marker = "Second Book of Adam and Eve"
    first = txt.find(marker)
    second = txt.find(marker, first + len(marker))
    start = second if second != -1 else first
    # advance past the header line itself so it is not read as a verse
    start = txt.index("\n", start) + 1
    end = txt.find("This completes The Second Book of Adam and Eve")
    body = txt[start:end]

    lines = [ln.strip() for ln in body.split("\n")]

    out: list[str] = ["# The Second Book of Adam and Eve"]
    # Format in the mirror:
    #   Chapter I.
    #   <chapter title>
    #   WHEN ... (verse 1, unnumbered)
    #   2 ...  3 ...  (numbered)
    ch_head_re = re.compile(r"^Chapter\s+([IVXLC]+)\.?\s*$")
    vs_re = re.compile(r"^(\d+)\s+(.*)$")

    cur_chapter: int | None = None
    expect_title = False
    title_buf: list[str] = []
    verse_no: int | None = None
    verse_buf: list[str] = []
    seen_first_verse = False

    def flush_verse():
        nonlocal verse_no, verse_buf
        if verse_no is not None and verse_buf:
            out.append(f"{verse_no}\t{collapse_ws(' '.join(verse_buf))}")
        verse_no, verse_buf = None, []

    i = 0
    while i < len(lines):
        ln = lines[i]
        i += 1
        if not ln:
            continue

        m_ch = ch_head_re.match(ln)
        if m_ch:
            flush_verse()
            cur_chapter = roman_to_int(m_ch.group(1))
            expect_title = True
            title_buf = []
            seen_first_verse = False
            continue

        if expect_title:
            # title is the next non-empty line(s) until the first verse.
            # FBE Book II verse 1 always begins with an all-caps opening
            # word; the title is plain sentence case. Heuristic: the title
            # is the first non-empty line after the chapter header.
            title_buf.append(ln)
            # peek: if next non-empty line looks like prose start, emit title
            # We take exactly one line as the title (matches the mirror).
            out.append(f"## Chapter {cur_chapter} — {collapse_ws(' '.join(title_buf))}")
            expect_title = False
            continue

        m_vs = vs_re.match(ln)
        if m_vs:
            n = int(m_vs.group(1))
            last = verse_no if verse_no is not None else 0
            # Windowed monotonic guard: a real verse marker is a small
            # forward step from the previous verse. A line that merely
            # *starts* with a number mid-sentence (e.g. "5500 years")
            # is a wrapped continuation, not a verse — reject it.
            if last < n <= last + 10:
                flush_verse()
                verse_no = n
                verse_buf = [m_vs.group(2)]
                seen_first_verse = True
                continue
            # else: fall through and treat the whole line as continuation

        # unnumbered verse 1 (begins each chapter) or continuation
        if not seen_first_verse and verse_no is None:
            verse_no = 1
            verse_buf = [ln]
            seen_first_verse = True
        elif verse_no is not None:
            verse_buf.append(ln)

    flush_verse()
    return "\n".join(out) + "\n"


def renumber_sequential(text: str, label: str) -> str:
    """Renumber verses 1..N within each chapter. Source mirrors carry the
    occasional verse-number typo (e.g. the reluctant-messenger Second Book
    Chapter 13 labels its final verse "18" where sacred-texts' FBE shows
    "13" for the same verse text — cross-checked Session 49). The verse
    *text* is faithful; only the marker is renumbered. Logs every chapter
    it touches so the correction is visible, not silent."""
    out: list[str] = []
    chapter_title = ""
    expected = 0
    corrected: list[str] = []
    for ln in text.split("\n"):
        if ln.startswith("## "):
            chapter_title = ln[3:]
            expected = 0
            out.append(ln)
            continue
        m = re.match(r"^(\d+)\t(.*)$", ln)
        if m:
            expected += 1
            orig = int(m.group(1))
            if orig != expected:
                corrected.append(f"{chapter_title[:48]} : {orig}->{expected}")
            out.append(f"{expected}\t{m.group(2)}")
            continue
        out.append(ln)
    if corrected:
        print(f"  [{label}] verse-marker corrections: " + "; ".join(corrected))
    return "\n".join(out)


def main() -> int:
    os.makedirs(OUT_DIR, exist_ok=True)

    b1_in = os.path.join(DOWNLOADS, "pg398_first_book_adam_eve.txt")
    b2_in = os.path.join(DOWNLOADS, "eden_2_raw.html")
    if not os.path.exists(b1_in):
        print(f"[error] missing {b1_in}", file=sys.stderr)
        return 2
    if not os.path.exists(b2_in):
        print(f"[error] missing {b2_in}", file=sys.stderr)
        return 2

    with open(b1_in, "r", encoding="utf-8", errors="replace") as f:
        b1 = renumber_sequential(build_book_one(f.read()), "1-adam-eve")
    with open(b2_in, "r", encoding="utf-8", errors="replace") as f:
        b2 = renumber_sequential(build_book_two(f.read()), "2-adam-eve")
    if not b1.endswith("\n"):
        b1 += "\n"
    if not b2.endswith("\n"):
        b2 += "\n"

    b1_out = os.path.join(OUT_DIR, "1-adam-eve.txt")
    b2_out = os.path.join(OUT_DIR, "2-adam-eve.txt")
    with open(b1_out, "w", encoding="utf-8") as f:
        f.write(b1)
    with open(b2_out, "w", encoding="utf-8") as f:
        f.write(b2)

    def stats(text: str) -> tuple[int, int]:
        chs = len(re.findall(r"^## Chapter ", text, re.MULTILINE))
        vss = len(re.findall(r"^\d+\t", text, re.MULTILINE))
        return chs, vss

    c1, v1 = stats(b1)
    c2, v2 = stats(b2)
    print(f"1-adam-eve.txt  chapters={c1}  verses={v1}  -> {b1_out}")
    print(f"2-adam-eve.txt  chapters={c2}  verses={v2}  -> {b2_out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
