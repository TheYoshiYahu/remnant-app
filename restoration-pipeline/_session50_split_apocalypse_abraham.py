#!/usr/bin/env python3
"""Session 50: sentence-split the cleaned Box 1918 Apocalypse of Abraham.

Input : box_chapters_clean.txt  (hand-cleaned continuous prose, 32 chapters)
Output: <App>/source-texts/apocalypse-of-abraham/apocalypse-of-abraham.txt
        (the pre-restore source file, in the # / ## Chapter N / N<TAB>verse format)

Versification decision (Session 50, Yoshi-delegated): no standard public-domain
AoA versification exists (the standard line belongs to the copyrighted Cepher /
OTP editions, which the manifest bars republishing). Box 1918 has 32 chapters
and NO verse numbers. Adopted: sentence-split -- each sentence becomes one
verse. Honest, granular, reproducible, and consistent with the verse-numbered
corpus. This split is purely mechanical so it is fully reproducible.
"""
import os
import re

APP = "/sessions/beautiful-friendly-knuth/mnt/Desktop/App"
OUT_DIR = os.path.join(APP, "source-texts", "apocalypse-of-abraham")
OUT = os.path.join(OUT_DIR, "apocalypse-of-abraham.txt")
SRC = "box_chapters_clean.txt"

TITLE = "The Apocalypse of Abraham"

# sentence boundary: a sentence-ending mark (optionally + closing quote),
# then whitespace, then a capital letter or an opening quote. Both lookbehinds
# are fixed-width. Abbreviations (i.e. / viz. / lit.) are always followed by a
# lowercase word here, so they never match.
SENT_SPLIT = re.compile(r'(?<=[.!?])\s+(?=[A-Z"])|(?<=[.!?]")\s+(?=[A-Z"])')


def main():
    raw = open(SRC, encoding="utf-8").read()
    # split on the markers
    blocks = re.split(r'^(## Chapter \d+|# FRONT MATTER)\s*$', raw, flags=re.M)
    # blocks[0] is preamble (empty); then alternating header, body
    front = ""
    chapters = {}      # num -> prose
    i = 1
    while i < len(blocks):
        header = blocks[i].strip()
        body = blocks[i + 1].strip() if i + 1 < len(blocks) else ""
        if header == "# FRONT MATTER":
            front = " ".join(body.split())
        else:
            n = int(header.split()[-1])
            chapters[n] = " ".join(body.split())
        i += 2

    missing = [n for n in range(1, 33) if n not in chapters]
    if missing:
        raise SystemExit(f"[error] missing chapters: {missing}")

    os.makedirs(OUT_DIR, exist_ok=True)
    lines = [f"# {TITLE}", front, ""]
    total_verses = 0
    per_ch = []
    for n in range(1, 33):
        prose = chapters[n]
        sentences = [s.strip() for s in SENT_SPLIT.split(prose) if s.strip()]
        lines.append(f"## Chapter {n}")
        for vi, sent in enumerate(sentences, start=1):
            lines.append(f"{vi}\t{sent}")
        lines.append("")
        per_ch.append((n, len(sentences)))
        total_verses += len(sentences)

    with open(OUT, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines).rstrip() + "\n")

    print(f"wrote {OUT}")
    print(f"chapters=32  verses={total_verses}")
    print("per-chapter verse counts:")
    for n, c in per_ch:
        print(f"  ch{n:2d}: {c}")


if __name__ == "__main__":
    main()
