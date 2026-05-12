#!/usr/bin/env python3
"""
_session32_convert_ascension.py
-------------------------------
Convert the Charles 1900 Ascension of Isaiah raw scrape (markdown-styled
prose from earlychristianwritings.com) into parser convention text:

  # The Ascension of Isaiah
  # Chapter 1
  1.  verse text...
  2.  verse text...
  # Chapter 2
  1.  verse text...
  ...

Input rules:
  - Lines starting with `#` (comment header) are skipped.
  - Lines `CHAPTER N` open a chapter.
  - First content of a chapter (before any `N.` marker) is verse 1.
  - Lines starting with `\\d+\\. ` are subsequent verses.
  - Blank lines separate paragraphs; verse continuations within a verse
    are joined with a single space.
"""
from __future__ import annotations
import os
import re

def _resolve_desktop() -> str:
    import glob as _g
    candidates = ["/Users/mtm/Desktop", os.path.expanduser("~/Desktop")]
    for p in _g.glob("/sessions/*/mnt/Desktop"):
        candidates.append(p)
    for p in candidates:
        if os.path.exists(os.path.join(p, "App", "source-texts")):
            return p
    return candidates[0]

DESKTOP = _resolve_desktop()
SRC = os.path.join(DESKTOP, "App", "source-texts", "ascension-isaiah",
                   "_charles1900_raw.md")
OUT = os.path.join(DESKTOP, "App", "source-texts", "ascension-isaiah",
                   "ascension-isaiah.txt")

CHAPTER_RE = re.compile(r"^CHAPTER\s+(\d+)\s*$")
VERSE_RE = re.compile(r"^(\d+)\.\s+(.*)$")


def convert(src_text: str) -> str:
    lines = src_text.splitlines()
    out_blocks: list[str] = ["# The Ascension of Isaiah"]
    chapter_num: int | None = None
    verses: list[tuple[int, list[str]]] = []  # [(verse_num, [lines])]
    cur_verse: tuple[int, list[str]] | None = None

    def flush_chapter():
        if chapter_num is None:
            return
        out_blocks.append(f"# Chapter {chapter_num}")
        # Add verse 1 if it didn't get its number explicit
        # (the first content before any "N." was captured as verse 1)
        for vn, vlines in verses:
            text = " ".join(line.strip() for line in vlines if line.strip())
            # Normalize whitespace
            text = re.sub(r"\s+", " ", text).strip()
            if text:
                # Parser convention: "N.  text" (two spaces after period)
                out_blocks.append(f"{vn}.  {text}")

    for raw in lines:
        line = raw.rstrip()
        if line.startswith("#"):
            # Header comments at top — skip
            continue
        cm = CHAPTER_RE.match(line)
        if cm:
            # Close previous chapter
            if cur_verse is not None:
                verses.append(cur_verse)
                cur_verse = None
            flush_chapter()
            verses = []
            chapter_num = int(cm.group(1))
            # New chapter: verse 1 will be the first content before any "N."
            cur_verse = (1, [])
            continue
        if chapter_num is None:
            # Pre-chapter material — skip
            continue
        vm = VERSE_RE.match(line)
        if vm:
            # Numbered verse begins
            if cur_verse is not None:
                verses.append(cur_verse)
            vn = int(vm.group(1))
            cur_verse = (vn, [vm.group(2)])
            continue
        if cur_verse is None:
            # Should not happen, but tolerate
            cur_verse = (1, [line])
        else:
            if line.strip():
                cur_verse[1].append(line)
            # blank lines: ignore for continuation purposes — verse continues

    # Final chapter
    if cur_verse is not None:
        verses.append(cur_verse)
    flush_chapter()

    return "\n".join(out_blocks) + "\n"


def main() -> int:
    with open(SRC, "r", encoding="utf-8") as f:
        text = f.read()
    out = convert(text)
    with open(OUT, "w", encoding="utf-8") as f:
        f.write(out)
    chapters = out.count("\n# Chapter ")
    verses = sum(1 for line in out.splitlines()
                 if re.match(r"^\d+\.\s+", line))
    print(f"ascension-isaiah.txt written ({len(out)} bytes, "
          f"{chapters} chapters, {verses} verses)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
