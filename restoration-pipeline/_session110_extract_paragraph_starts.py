"""Extract paragraph-start verses from USFX XML for the entire canon.

USFX represents paragraph starts with `<p style="p">` immediately preceding
a `<v>` verse marker. We walk the XML stream and for each `<p style="p">`
note which verse follows.

Output: {book_slug: {chapter_number_str: [list of verse numbers that START a paragraph]}}
"""
from __future__ import annotations
import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path

USFX = Path("/sessions/clever-gracious-albattani/mnt/Desktop/App/source-texts/kjv/eng-kjv_usfx.xml")
OUT  = Path("/sessions/clever-gracious-albattani/mnt/Desktop/App/source-texts/parsed/paragraph_starts.json")

# USFX book ID → canon slug
USFX_TO_SLUG = {
    "GEN": "genesis", "EXO": "exodus", "LEV": "leviticus", "NUM": "numbers",
    "DEU": "deuteronomy", "JOS": "joshua", "JDG": "judges", "RUT": "ruth",
    "1SA": "1-samuel", "2SA": "2-samuel", "1KI": "1-kings", "2KI": "2-kings",
    "1CH": "1-chronicles", "2CH": "2-chronicles", "EZR": "ezra", "NEH": "nehemiah",
    "EST": "esther", "JOB": "job", "PSA": "psalms", "PRO": "proverbs",
    "ECC": "ecclesiastes", "SNG": "song-of-solomon", "ISA": "isaiah",
    "JER": "jeremiah", "LAM": "lamentations", "EZK": "ezekiel", "DAN": "daniel",
    "HOS": "hosea", "JOL": "joel", "AMO": "amos", "OBA": "obadiah",
    "JON": "jonah", "MIC": "micah", "NAM": "nahum", "HAB": "habakkuk",
    "ZEP": "zephaniah", "HAG": "haggai", "ZEC": "zechariah", "MAL": "malachi",
    "MAT": "matthew", "MRK": "mark", "LUK": "luke", "JHN": "john",
    "ACT": "acts", "ROM": "romans", "1CO": "1-corinthians", "2CO": "2-corinthians",
    "GAL": "galatians", "EPH": "ephesians", "PHP": "philippians", "COL": "colossians",
    "1TH": "1-thessalonians", "2TH": "2-thessalonians", "1TI": "1-timothy",
    "2TI": "2-timothy", "TIT": "titus", "PHM": "philemon", "HEB": "hebrews",
    "JAS": "james", "1PE": "1-peter", "2PE": "2-peter", "1JN": "1-john",
    "2JN": "2-john", "3JN": "3-john", "JUD": "jude", "REV": "revelation",
}

# Parse the XML
print(f"Parsing {USFX} ...")
tree = ET.parse(USFX)
root = tree.getroot()

# Walk all <book> elements
result: dict = {}
for book in root.findall("book"):
    book_id = book.get("id")
    slug = USFX_TO_SLUG.get(book_id)
    if not slug:
        continue
    chapters: dict = {}
    current_chapter = None
    pending_paragraph = False
    # Walk every direct + descendant element in document order
    for elem in book.iter():
        tag = elem.tag
        if tag == "c":  # chapter marker
            try:
                current_chapter = int(elem.get("id"))
            except (ValueError, TypeError):
                current_chapter = None
            pending_paragraph = False
        elif tag == "p":
            # Paragraph element — the next verse start should be flagged
            style = elem.get("style") or ""
            sfm = elem.get("sfm") or ""
            # Only main-text paragraph styles, not intros / titles / etc.
            if style in ("p", "q1", "q2", "q", "m", "pi", "pi1", "pi2"):
                pending_paragraph = True
        elif tag == "v":
            if current_chapter is not None and pending_paragraph:
                try:
                    v_num = int(elem.get("id"))
                    chapters.setdefault(str(current_chapter), []).append(v_num)
                except (ValueError, TypeError):
                    pass
                pending_paragraph = False
    if chapters:
        result[slug] = chapters

OUT.parent.mkdir(parents=True, exist_ok=True)
OUT.write_text(json.dumps(result, indent=2, ensure_ascii=False), encoding="utf-8")

# Stats
total_books = len(result)
total_chapters = sum(len(c) for c in result.values())
total_paragraphs = sum(len(v) for c in result.values() for v in c.values())
print(f"Wrote {OUT}")
print(f"  {total_books} books, {total_chapters} chapters, {total_paragraphs} paragraph-start markers")
print()
print("Sample — Matthew:")
matt = result.get("matthew", {})
for ch_str in sorted(matt.keys(), key=int)[:5]:
    print(f"  Matthew {ch_str}: paragraph starts at v{matt[ch_str]}")
print(f"  ... (Matthew has {len(matt)} chapters with paragraph data)")
