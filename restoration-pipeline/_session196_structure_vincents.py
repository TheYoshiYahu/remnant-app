#!/usr/bin/env python3
"""session-196 — structure Vincent's Word Studies raw OCR into verse-keyed entries.

Input : source-texts/vincents-word-studies/vol{1,2,3,4}_*_djvu.txt  (archive.org OCR)
Output: source-texts/vincents-word-studies/vincents-structured.json
        (+ vincents-structured.stats.txt for the verification gate)

Vincent's structure, per volume:
  - `CHAPTER  <roman>.`            → chapter break (we count sequentially per book —
                                      robust against roman-numeral OCR mangling).
  - recto running header `Ch. <r>.]  <BOOK>.`  → carries the BOOK name on each page.
  - verse entries begin `Ver.  N.` / `Yer.  N.` (OCR) or a bare `N.` at line start,
    followed by the English head-phrase and the (garbled-OCR) Greek + exposition.

The Greek is lossy OCR; the load-bearing fields are (book, chapter, verse, headword,
body) — the verse-keyed English exposition that becomes the annotated foil. Ship-v1:
some OCR noise is acceptable; the annotation layer corrects the reading, not the OCR.
"""
import json
import re
import sys
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent / "source-texts" / "vincents-word-studies"
VOLS = [
    "vol1-synoptics-acts-peter-james-jude_cu31924092322522_djvu.txt",
    "vol2-writings-of-john_wordstudiesinne01vincgoog_djvu.txt",
    "vol3-epistles-of-paul_wordstudiesinne03vincgoog_djvu.txt",
    "vol4-thess-gal-pastorals-hebrews_wordstudiesinne02vincgoog_djvu.txt",
]

# Canonical NT book-name → slug. OCR head-word matching is fuzzy (uppercased,
# spaces/punct stripped, common OCR letter-swaps folded).
BOOK_CANON = [
    ("matthew", ["MATTHEW"]),
    ("mark", ["MARK"]),
    ("luke", ["LUKE"]),
    ("john", ["JOHN", "STJOHN", "GOSPELOFJOHN"]),
    ("acts", ["ACTS", "THEACTS", "ACTSOFTHEAPOSTLES"]),
    ("romans", ["ROMANS"]),
    ("1-corinthians", ["FIRSTCORINTHIANS", "ICORINTHIANS", "ICOR"]),
    ("2-corinthians", ["SECONDCORINTHIANS", "IICORINTHIANS", "IICOR"]),
    ("galatians", ["GALATIANS"]),
    ("ephesians", ["EPHESIANS"]),
    ("philippians", ["PHILIPPIANS"]),
    ("colossians", ["COLOSSIANS"]),
    ("1-thessalonians", ["FIRSTTHESSALONIANS", "ITHESSALONIANS", "ITHESS"]),
    ("2-thessalonians", ["SECONDTHESSALONIANS", "IITHESSALONIANS", "IITHESS"]),
    ("1-timothy", ["FIRSTTIMOTHY", "ITIMOTHY", "ITIM"]),
    ("2-timothy", ["SECONDTIMOTHY", "IITIMOTHY", "IITIM"]),
    ("titus", ["TITUS"]),
    ("philemon", ["PHILEMON"]),
    ("hebrews", ["HEBREWS"]),
    ("james", ["JAMES", "STJAMES", "EPISTLEOFJAMES"]),
    ("1-peter", ["FIRSTPETER", "IPETER"]),
    ("2-peter", ["SECONDPETER", "IIPETER"]),
    ("1-john", ["FIRSTJOHN", "IJOHN"]),
    ("2-john", ["SECONDJOHN", "IIJOHN"]),
    ("3-john", ["THIRDJOHN", "IIIJOHN"]),
    ("jude", ["JUDE"]),
    ("revelation", ["REVELATION", "APOCALYPSE", "REVELATIONOFJOHN"]),
]

# Numbered families: the base name appears in the header, the ordinal (FIRST/SECOND/
# THIRD or I/II/III) appears separately ("THE FIRST EPISTLE TO THE CORINTHIANS"), so
# fold-substring matching can't catch them — detect base + ordinal independently.
NUMBERED = {
    "CORINTHIANS": "corinthians",
    "THESSALONIANS": "thessalonians",
    "TIMOTHY": "timothy",
    "PETER": "peter",
    "JOHN": "john",  # special: Gospel of John has no ordinal
}
# Single (un-numbered) books, folded name → slug, longest first for precedence.
SINGLES = sorted(
    [
        ("MATTHEW", "matthew"), ("MARK", "mark"), ("LUKE", "luke"),
        ("ACTS", "acts"), ("ROMANS", "romans"), ("GALATIANS", "galatians"),
        ("EPHESIANS", "ephesians"), ("PHILIPPIANS", "philippians"),
        ("COLOSSIANS", "colossians"), ("PHILEMON", "philemon"),
        ("TITUS", "titus"), ("HEBREWS", "hebrews"), ("JAMES", "james"),
        ("JUDE", "jude"), ("REVELATION", "revelation"), ("APOCALYPSE", "revelation"),
    ],
    key=lambda t: -len(t[0]),
)
RE_ORD_WORD = re.compile(r"\b(FIRST|SECOND|THIRD)\b", re.I)
RE_ORD_ROMAN = re.compile(r"(?:^|[^A-Z])(III|II|I)\.")


def fold(s: str) -> str:
    s = s.upper()
    s = s.replace("0", "O").replace("1", "I")
    s = re.sub(r"[^A-Z]", "", s)
    return s


def _ordinal(raw: str):
    m = RE_ORD_WORD.search(raw)
    if m:
        return {"FIRST": 1, "SECOND": 2, "THIRD": 3}[m.group(1).upper()]
    m = RE_ORD_ROMAN.search(raw.upper())
    if m:
        return {"I": 1, "II": 2, "III": 3}[m.group(1)]
    m = re.search(r"\b([123])\b", raw)
    if m:
        return int(m.group(1))
    return None


def match_book(raw: str):
    f = fold(raw)
    # Pick the longest base name present (numbered family OR single), so a header
    # like "...EPISTLE TO THE CORINTHIANS" resolves to corinthians not a stray single.
    best = None  # (length, kind, key)
    for base, fam in NUMBERED.items():
        if base in f and (best is None or len(base) > best[0]):
            best = (len(base), "num", fam)
    for name, slug in SINGLES:
        if name in f and (best is None or len(name) > best[0]):
            best = (len(name), "single", slug)
    if best is None:
        return None
    if best[1] == "single":
        return best[2]
    fam = best[2]
    if fam == "john":
        o = _ordinal(raw)
        return f"{o}-john" if o else "john"   # no ordinal → the Gospel
    # corinthians/thessalonians/timothy/peter are always numbered; default 1
    o = _ordinal(raw) or 1
    return f"{o}-{fam}"


# recto header carrying the book, e.g. "Ch.  I.]  MATTHEW.  H"
RE_HEADER_BOOK = re.compile(r"\b(?:Ch|Cli)\.?\s*[IVXLCYric0-9]+\.?\]\s*([A-Z][A-Z .']{2,})")
# running-header / page-furniture lines to drop
RE_FURNITURE = re.compile(
    r"(WORD\s+STUDIES\s+IN\s+THE\s+NEW\s+TESTAMENT|LIST\s+OF\s+AUTHORS|"
    r"^\s*\d{1,4}\s*$|INTRODUCTION|PREFACE)"
)
RE_CHAPTER = re.compile(r"^\s*CHAPTER\b", re.I)
# verse start: "Ver. 12." / "Yer. 12." / bare "12." at line head
RE_VERSE = re.compile(r"^\s*(?:Y?er\.|Ver\.)\s*(\d{1,3})\.\s*(.*)$")
RE_VERSE_BARE = re.compile(r"^\s*(\d{1,3})\.\s+([A-Z(].*)$")


def headword_of(text: str) -> str:
    """First clause of the entry — the English head-phrase before the Greek paren."""
    t = text.strip()
    # cut at first '(' (the Greek), em-dash, or after ~9 words
    cut = re.split(r"[({]", t, maxsplit=1)[0]
    cut = cut.strip(" .,:;—-")
    words = cut.split()
    if len(words) > 9:
        cut = " ".join(words[:9])
    return cut[:90].strip()


def dehyphenate(body: str) -> str:
    body = re.sub(r"(\w)-\s+(\w)", r"\1\2", body)   # line-break hyphenation
    body = re.sub(r"\s+", " ", body)
    return body.strip()


def parse_volume(path: Path, entries: list):
    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    cur_book = None
    cur_chapter = 0
    last_verse = 0   # within current chapter; Vincent's verse entries ascend
    started = False  # only parse after the first CHAPTER marker (skip front matter)

    pending = None  # the entry being accumulated: dict + body-line list

    seen_keys: dict = {}

    def flush():
        nonlocal pending
        if pending and cur_book:
            body = dehyphenate(" ".join(pending["_body"]))
            if len(body) >= 25:  # drop OCR fragments
                hwslug = re.sub(r"[^a-z0-9]+", "-", pending["headword"].lower()).strip("-")
                hwslug = hwslug[:32] or "entry"
                base = f"{pending['book']}.{pending['chapter']}.{pending['verse']}:{hwslug}"
                # de-collide repeated head-slugs on the same verse
                n = seen_keys.get(base, 0) + 1
                seen_keys[base] = n
                entry_key = base if n == 1 else f"{base}~{n}"
                entries.append({
                    "tool": "vincents",
                    "book": pending["book"],
                    "chapter": pending["chapter"],
                    "verse": pending["verse"],
                    "headword": pending["headword"],
                    "body": body,
                    "entry_key": entry_key,
                    "source_vol": path.name.split("_")[0],
                })
        pending = None

    for ln in lines:
        # book from running header (each page)
        m = RE_HEADER_BOOK.search(ln)
        if m:
            b = match_book(m.group(1))
            if b and b != cur_book:
                flush()
                cur_book = b
                cur_chapter = 0
                last_verse = 0
                started = True
            # header line is furniture; don't accumulate it
            continue
        # standalone book-title line (e.g., a page that is just "THE ACTS.")
        stripped = ln.strip()
        if stripped and stripped == stripped.upper() and 4 <= len(stripped) <= 60:
            b = match_book(stripped)
            if b and b != cur_book and len(fold(stripped)) >= 4:
                flush()
                cur_book = b
                cur_chapter = 0
                last_verse = 0
                started = True
                continue
        # chapter break — sequential count (robust vs roman OCR noise)
        if RE_CHAPTER.match(ln):
            flush()
            cur_chapter += 1
            last_verse = 0
            started = True
            continue
        if not started or cur_book is None:
            continue
        if RE_FURNITURE.search(ln):
            continue
        # verse start?
        mv = RE_VERSE.match(ln)
        is_bare = False
        if not mv:
            mv = RE_VERSE_BARE.match(ln)
            is_bare = bool(mv)
        if mv and cur_chapter >= 1:
            verse = int(mv.group(1))
            rest = mv.group(2)
            # Vincent's verse entries ascend within a chapter. Bare "N." lines that
            # don't ascend (or jump far) are citations / list items, not verse starts
            # — fold them into the current body. Explicit "Ver. N." is trusted.
            if is_bare and not (last_verse < verse <= last_verse + 40):
                if pending:
                    pending["_body"].append(ln.strip())
                continue
            last_verse = verse
            flush()
            pending = {
                "book": cur_book,
                "chapter": cur_chapter,
                "verse": verse,
                "headword": headword_of(rest),
                "_body": [rest.strip()],
            }
            continue
        # otherwise, body continuation
        if pending and stripped:
            pending["_body"].append(stripped)
    flush()


def main():
    entries: list = []
    for v in VOLS:
        p = BASE / v
        if not p.exists():
            print(f"MISSING: {p}", file=sys.stderr)
            continue
        before = len(entries)
        parse_volume(p, entries)
        print(f"{v}: +{len(entries) - before} entries")

    out = BASE / "vincents-structured.json"
    out.write_text(json.dumps(entries, ensure_ascii=False, indent=0), encoding="utf-8")

    # stats / verification gate
    from collections import Counter
    by_book = Counter(e["book"] for e in entries)
    dupes = len(entries) - len({e["entry_key"] for e in entries})
    stats = [
        f"Vincent's structured entries: {len(entries)}",
        f"distinct verse keys: {len({e['entry_key'] for e in entries})}  (collisions: {dupes})",
        f"books covered: {len(by_book)}",
        "",
        "per-book entry counts:",
    ]
    for slug, _ in BOOK_CANON:
        if by_book.get(slug):
            stats.append(f"  {slug:18s} {by_book[slug]}")
    unknown = sum(1 for e in entries if e["book"] not in dict(BOOK_CANON))
    stats.append(f"\nentries with unmapped book: {unknown}")
    (BASE / "vincents-structured.stats.txt").write_text("\n".join(stats) + "\n", encoding="utf-8")
    print("\n".join(stats))
    print(f"\nwrote {out}")


if __name__ == "__main__":
    main()
