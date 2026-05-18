#!/usr/bin/env python3
"""
S69 audit — scripture-quote classifier.

Re-classifies the 144 jasher commentary covenant-people-names real-gap
candidates into:
  (A) IN_SCRIPTURE_QUOTE  — bare name sits inside `"..."` or `'…'` quote
                            span AND a scripture citation appears within
                            ~120 chars (book name + chapter:verse).
  (B) IN_QUOTE_NO_CITE    — bare name sits inside a quote span but no
                            citation nearby. Rare but possible (Yoshi's
                            scare-quote MENTION cases).
  (C) PROSE               — bare name in Yoshi's own prose, no quote span.
  (D) PRESERVED_PHRASE    — Jew-and-Gentile binary or similar.
  (E) CROSS_REF_INDEX     — back_matter cross-ref index line (em-dash chain).

Yoshi's 2026-05-17 call: restore (A); preserve (B), (C), (D), (E).
"""

from __future__ import annotations
import json
import re
from pathlib import Path
from typing import Iterable

APP = Path("/sessions/brave-keen-dijkstra/mnt/App")
PARSED = APP / "source-texts" / "parsed"
LB = r"(?<![A-Za-z'’])"
RB = r"(?![A-Za-z'’])"
PAREN_RE = re.compile(r"\([^()]*\)")
JEW_GENTILE_BINARY_RE = re.compile(r"Jew[- ]?and[- ]?Gentile[- ]?binary", re.IGNORECASE)

# Scripture-citation patterns: book name + space + chapter[:verse[-verse]]
# Conservative: requires a recognized book name token (helps avoid false
# positives like `Yahuah 1:1`). Cover canonical books, common abbreviations,
# and the extras (Jasher, Enoch, Jubilees).
BOOK_NAMES = r"""(?:
    Genesis|Exodus|Leviticus|Numbers|Deuteronomy|Joshua|Judges|Ruth|
    1\ ?Samuel|2\ ?Samuel|1\ ?Kings|2\ ?Kings|1\ ?Chronicles|2\ ?Chronicles|
    Ezra|Nehemiah|Esther|Job|Psalm|Psalms|Proverbs|Ecclesiastes|
    Song\ of\ Songs|Song\ of\ Solomon|Isaiah|Jeremiah|Lamentations|Ezekiel|
    Daniel|Hosea|Joel|Amos|Obadiah|Jonah|Micah|Nahum|Habakkuk|Zephaniah|
    Haggai|Zechariah|Malachi|
    Matthew|Mark|Luke|John|Acts|Romans|1\ ?Corinthians|2\ ?Corinthians|
    Galatians|Ephesians|Philippians|Colossians|1\ ?Thessalonians|
    2\ ?Thessalonians|1\ ?Timothy|2\ ?Timothy|Titus|Philemon|Hebrews|
    James|1\ ?Peter|2\ ?Peter|1\ ?John|2\ ?John|3\ ?John|Jude|Revelation|
    Jasher|Enoch|Jubilees|
    1\ ?Maccabees|2\ ?Maccabees|Tobit|Judith|Wisdom|Ecclesiasticus|Sirach|
    Baruch|1\ ?Esdras|2\ ?Esdras|Prayer\ of\ Manasseh
)"""
CITATION_RE = re.compile(rf"\b{BOOK_NAMES}\s+\d+(?::\d+)?(?:[-–—]\d+(?::\d+)?)?", re.VERBOSE)

# Quote-span detection. We pair opening/closing quote marks per-line to
# detect quote regions. Three quote-mark conventions appear in jasher:
#   - ASCII double-quote: " ... " (U+0022)
#   - Curly double-quote: “ ... ” (U+201C / U+201D)
#   - Curly single-quote: ‘ ... ’ (U+2018 / U+2019)  -- used for inner quotes
#                                                       and for the "smart-
#                                                       quote single" pattern
#                                                       BUT the U+2019 also
#                                                       serves as an
#                                                       apostrophe. Don't
#                                                       use single-quote
#                                                       pairing for span
#                                                       detection — too
#                                                       noisy.
DOUBLE_QUOTE_SPAN_RE = re.compile(r'"[^"]+?"|“[^”]+?”', re.DOTALL)


def mask_parens(text: str) -> str:
    return PAREN_RE.sub(lambda m: "_" * len(m.group(0)), text)


def find_quote_spans(text: str) -> list[tuple[int, int]]:
    """Return list of (start, end) byte ranges that are inside a quote."""
    return [(m.start(), m.end()) for m in DOUBLE_QUOTE_SPAN_RE.finditer(text)]


def is_inside_quote(pos: int, spans: list[tuple[int, int]]) -> tuple[int, int] | None:
    for s, e in spans:
        if s <= pos < e:
            return (s, e)
    return None


def has_citation_near(text: str, span: tuple[int, int], lookahead: int = 120,
                      lookbehind: int = 120) -> bool:
    """Citation within `lookahead` chars after the close-quote, within the
    quote span itself, or within `lookbehind` chars before the open-quote.

    Yoshi's convention puts the citation either BEFORE the quote
    (`Numbers 11:4 names them out — "..."`, `Isaiah 56:8 drives the
    distinction: "..."`) or AFTER it (`"..." (Genesis 32:28)`). Both
    patterns are valid scripture-quote signals."""
    s, e = span
    lo = max(0, s - lookbehind)
    hi = min(len(text), e + lookahead)
    window = text[lo:hi]
    return bool(CITATION_RE.search(window))


def surfaces(j):
    if j.get("front_matter"): yield ("front_matter", j["front_matter"])
    if j.get("back_matter"): yield ("back_matter", j["back_matter"])
    if "books" in j:
        for bk in j["books"]:
            bn = bk.get("name") or "book"
            for ch in bk.get("chapters", []):
                cn = ch.get("number", "?")
                if ch.get("commentary"): yield (f"{bn} ch{cn} commentary", ch["commentary"])
                if ch.get("title"): yield (f"{bn} ch{cn} title", ch["title"])
    elif "chapters" in j:
        for ch in j["chapters"]:
            cn = ch.get("number", "?")
            if ch.get("commentary"): yield (f"ch{cn} commentary", ch["commentary"])
            if ch.get("title"): yield (f"ch{cn} title", ch["title"])


def ctx(text, s, e, span=140):
    lo = max(0, s - span)
    hi = min(len(text), e + span)
    return "…" + text[lo:hi].replace("\n", " ") + "…"


def classify(text: str, m: re.Match, surface: str, label: str) -> str:
    cf = ctx(text, m.start(), m.end(), span=140)

    # PRESERVED_PHRASE
    if label in ("Jew", "Jews", "Jewish") and JEW_GENTILE_BINARY_RE.search(cf):
        return "PRESERVED_PHRASE"

    # CROSS_REF_INDEX (back-matter em-dash chain)
    window = text[max(0, m.start() - 40): min(len(text), m.end() + 40)]
    if surface == "back_matter" and window.count("—") >= 2 \
            and CITATION_RE.search(window):
        return "CROSS_REF_INDEX"

    # Quote-span check
    spans = find_quote_spans(text)
    inside = is_inside_quote(m.start(), spans)
    if inside is not None:
        if has_citation_near(text, inside):
            return "IN_SCRIPTURE_QUOTE"
        return "IN_QUOTE_NO_CITE"

    return "PROSE"


def main():
    NAMES = [
        ("Israel", rf"{LB}Israel{RB}"),
        ("Judah", rf"{LB}Judah{RB}"),
        ("Jews", rf"{LB}Jews{RB}"),
        ("Jewish", rf"{LB}Jewish{RB}"),
        ("Jew", rf"{LB}Jew{RB}"),
    ]

    j = json.loads((PARSED / "jasher.json").read_text())

    print("=" * 88)
    print("S69 audit — scripture-quote classifier (jasher commentary covenant-people-names)")
    print("=" * 88)

    buckets = {
        "IN_SCRIPTURE_QUOTE": [],
        "IN_QUOTE_NO_CITE": [],
        "PROSE": [],
        "PRESERVED_PHRASE": [],
        "CROSS_REF_INDEX": [],
    }

    for label, pat in NAMES:
        rx = re.compile(pat)
        for surface_label, text in surfaces(j):
            masked = mask_parens(text)
            for m in rx.finditer(masked):
                # m.start()/end() refer to positions in `masked` which is
                # same-length as `text` — so positions transfer.
                bucket = classify(text, m, surface_label, label)
                cf = ctx(text, m.start(), m.end(), span=140)
                buckets[bucket].append((label, surface_label, cf))

    print()
    for bucket in ["IN_SCRIPTURE_QUOTE", "IN_QUOTE_NO_CITE", "PROSE",
                   "PRESERVED_PHRASE", "CROSS_REF_INDEX"]:
        items = buckets[bucket]
        print(f"### {bucket}: {len(items)}")
    print()

    # Per-name breakdown for the bucket Yoshi cares most about.
    print("=" * 88)
    print("IN_SCRIPTURE_QUOTE — per-name breakdown (these are the wheel's fire set)")
    print("=" * 88)
    per_name = {}
    for label, surf, c in buckets["IN_SCRIPTURE_QUOTE"]:
        per_name.setdefault(label, []).append((surf, c))
    for label in ["Israel", "Judah", "Jews", "Jewish", "Jew"]:
        items = per_name.get(label, [])
        print(f"\n### {label} — {len(items)} scripture-quote hits")
        for surf, c in items[:10]:
            print(f"  [{surf}] {c}")
        if len(items) > 10:
            print(f"  ...and {len(items) - 10} more.")

    # Surface a few PROSE samples to verify the classifier is excluding the
    # right things.
    print("\n" + "=" * 88)
    print("PROSE — sample 8 per name (should NOT fire)")
    print("=" * 88)
    per_name_prose = {}
    for label, surf, c in buckets["PROSE"]:
        per_name_prose.setdefault(label, []).append((surf, c))
    for label in ["Israel", "Judah", "Jews", "Jewish", "Jew"]:
        items = per_name_prose.get(label, [])
        print(f"\n### {label} PROSE — {len(items)} hits (skip)")
        for surf, c in items[:8]:
            print(f"  [{surf}] {c}")

    # IN_QUOTE_NO_CITE — surface all (rare bucket, check whether any look
    # like real scripture quotes that just don't have a nearby citation).
    print("\n" + "=" * 88)
    print(f"IN_QUOTE_NO_CITE — {len(buckets['IN_QUOTE_NO_CITE'])} hits (surface all)")
    print("=" * 88)
    for label, surf, c in buckets["IN_QUOTE_NO_CITE"]:
        print(f"\n  [{label}, {surf}] {c}")


if __name__ == "__main__":
    main()
