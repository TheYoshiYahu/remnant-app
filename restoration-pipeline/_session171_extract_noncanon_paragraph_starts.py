"""S171 Track 2 — extract paragraph-start verse numbers for the
restoration-pipeline non-canon corpus.

The Protestant canon paragraph_starts.json (S110) was extracted from
KJV USFX XML by walking <p style="p"> markers. Non-canon books (1
Enoch, Jubilees, Jasher, Adam & Eve, Apocalypse of Abraham, Ascension
of Isaiah, Apocrypha vol1, MR James apocryphal NT, Sonnini Acts 29,
Lightfoot apostolic fathers, pseudepigrapha vol2) have no USFX source
and their parsed JSON carries (number, text, source_type, footnote)
per verse with no structural paragraph markers. Renderer falls back to
a single paragraph per chapter — Yoshi's "one-long-paragraph-per-
chapter" redline.

This script applies a conservative English-language heuristic to the
verse text of every non-canon chapter and emits a paragraph_starts
delta that gets merged into app/src/data/paragraph_starts.json.

─── Heuristic (passage-marker rules) ───────────────────────────────

Verse N starts a new paragraph if ANY of:

  R1. N == 1                              — chapter open.
  R2. Verse text begins with one of the
      Hebraic narrative transition
      phrases (case-insensitive, after
      stripping leading non-letter chars):
        "And it came to pass"
        "And it happened"
        "And in the [Nth] year"
        "Now in"
        "Now after"
        "Now there was"
        "Now when"
        "Now therefore"
        "In those days"
        "In the [Nth] year"
        "After these things"
        "Thus saith"
        "Thus says"
        "And after"
        "Wherefore"
        "Howbeit"
        "Behold, I"
        "Behold, the"
        "Concerning"
        "Touching"
        "But when"
  R3. Verse text begins with `"` or `'`
      (a new quoted speech turn).
  R4. Verse text starts with an
      identified speaker turn:
        "And [Name] said"
        "Then [Name] said"
        "Then [Name] spoke"
        "And [Name] answered"
        "Then answered [Name]"
      with [Name] being a capitalized
      proper noun. Restricted to verse
      start to avoid mid-text noise.
  R5. Verse text begins with a vocative
      `O <Capitalized>`.

Rule fires once per verse — duplicates collapse. No upper cap on
density (some narrative-heavy chapters legitimately switch paragraph
every 2-3 verses; capping would suppress real structure). No lower
floor either — a long discourse chapter may legitimately stay one
paragraph beyond verse 1.

─── Output ─────────────────────────────────────────────────────────

  source-texts/parsed/paragraph_starts_noncanon.json  (NEW)
    same shape as paragraph_starts.json:
      {book_slug: {chapter_str: [verse_numbers]}}

  merged into app/src/data/paragraph_starts.json so the renderer
  picks it up at next bundle.

Stats printed: total non-canon books, chapters, paragraph markers
emitted, average paragraphs per chapter.

─── Caveats ────────────────────────────────────────────────────────

This heuristic is English-text-pattern based. It will miss paragraph
boundaries that the source translation didn't lexically mark (a
beautiful pericope shift signaled only by topic change, no transition
phrase, no quote-mark, no named speaker turn) and it will sometimes
fire on a verse mid-paragraph where the translator happened to start
with one of the listed phrases. Both error modes are non-catastrophic
— the worst case is fewer-or-misplaced paragraph breaks, not wrong
text. Yoshi-eye revision per book on a future restoration-pipeline
pass would refine this; for V1 the heuristic is the right floor: any
paragraph-structure is better than one-long-paragraph-per-chapter.

Run:
  python3 _session171_extract_noncanon_paragraph_starts.py
"""
from __future__ import annotations

import json
import re
from pathlib import Path

REPO = Path("/sessions/vibrant-brave-galileo/mnt/Desktop/App")
PARSED = REPO / "source-texts/parsed"
CLIENT_DATA = REPO / "app/src/data/paragraph_starts.json"
OUT = PARSED / "paragraph_starts_noncanon.json"

# Edition JSON files to walk. Each carries `books[{book_id, chapters[{number, verses[{number, text}]}]}]`
# shape. (apocalypse-of-abraham, ascension-isaiah have `slug` rather than `book_id` — handled below.)
EDITIONS = [
    "enoch.json",
    "jubilees.json",
    "jasher.json",
    "apocrypha.json",
    "adam-eve-conflict.json",
    "apocalypse-of-abraham.json",
    "ascension-isaiah.json",
    "mrjames-apocryphal-nt.json",
    "sonnini-acts-29.json",
    "lightfoot-apostolic-fathers.json",
    "pseudepigrapha-charles-vol2.json",
]

# ─────────────────────────────────────────────────────────────────────
# Heuristic predicates
# ─────────────────────────────────────────────────────────────────────

# R2 — Hebraic narrative transitions. Compiled with leading-whitespace
# tolerance + an optional opening quote mark.
TRANSITION_PHRASES = [
    r"And it came to pass",
    r"And it happened",
    r"And in the (?:\w+ )?year",
    r"Now in",
    r"Now after",
    r"Now there was",
    r"Now when",
    r"Now therefore",
    r"In those days",
    r"In the (?:\w+ )?year",
    r"After these things",
    r"Thus saith",
    r"Thus says",
    r"And after",
    r"Wherefore",
    r"Howbeit",
    r"Behold, I",
    r"Behold, the",
    r"Concerning",
    r"Touching",
    r"But when",
]
TRANSITION_RE = re.compile(
    r"^\s*[\"“‘']?\s*(?:" + "|".join(TRANSITION_PHRASES) + r")\b",
    re.IGNORECASE,
)

# R3 — opens with a quote mark (English double, English single,
# typographic double, typographic single).
QUOTE_OPEN_RE = re.compile(r"^\s*[\"“‘']")

# R4 — speaker turn ("And/Then [Name] said/spoke/answered" or
# "Then answered [Name]").
SPEAKER_RE = re.compile(
    r"^\s*(?:And|Then)\s+(?:[A-Z][\w'-]+\s+){1,3}(?:said|spoke|spake|answered)\b"
    r"|^\s*Then answered\s+[A-Z][\w'-]+",
)

# R5 — vocative "O Capitalized".
VOCATIVE_RE = re.compile(r"^\s*O\s+[A-Z][\w'-]+")


def is_paragraph_start(verse_number: int, text: str) -> bool:
    if verse_number == 1:
        return True  # R1
    if TRANSITION_RE.search(text):
        return True
    if QUOTE_OPEN_RE.match(text):
        return True
    if SPEAKER_RE.match(text):
        return True
    if VOCATIVE_RE.match(text):
        return True
    return False


# ─────────────────────────────────────────────────────────────────────
# Walk the editions
# ─────────────────────────────────────────────────────────────────────

def book_slug(book: dict) -> str | None:
    return book.get("book_id") or book.get("slug")


def main() -> int:
    delta: dict[str, dict[str, list[int]]] = {}
    stats_books = 0
    stats_chapters = 0
    stats_paragraphs = 0

    for edition_file in EDITIONS:
        path = PARSED / edition_file
        if not path.exists():
            print(f"  ! skipping (missing): {edition_file}")
            continue
        data = json.loads(path.read_text(encoding="utf-8"))
        for book in data.get("books", []):
            slug = book_slug(book)
            if not slug:
                continue
            chapters_out: dict[str, list[int]] = {}
            for chapter in book.get("chapters", []):
                cnum = chapter.get("number")
                if cnum is None:
                    continue
                starts: list[int] = []
                for v in chapter.get("verses", []):
                    vnum = v.get("number")
                    text = v.get("text") or ""
                    if vnum is None:
                        continue
                    if is_paragraph_start(int(vnum), text):
                        starts.append(int(vnum))
                if starts:
                    chapters_out[str(cnum)] = starts
                    stats_chapters += 1
                    stats_paragraphs += len(starts)
            if chapters_out:
                delta[slug] = chapters_out
                stats_books += 1

    # Emit the non-canon delta as its own file (audit trail) AND merge
    # into the client paragraph_starts.json.
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(
        json.dumps(delta, indent=2, ensure_ascii=False),
        encoding="utf-8",
    )
    print(f"Wrote {OUT}")

    # Merge into client JSON. Non-canon slugs do not overlap canon
    # slugs (different books), so the merge is union — canon keys
    # untouched. Sort top-level by slug for deterministic diffs.
    client_data = json.loads(CLIENT_DATA.read_text(encoding="utf-8"))
    overlap = set(client_data.keys()) & set(delta.keys())
    if overlap:
        print(f"  ! WARNING: canon/non-canon slug overlap, preserving canon: {overlap}")
        for k in overlap:
            del delta[k]
    merged = {**client_data, **delta}
    merged = dict(sorted(merged.items()))
    CLIENT_DATA.write_text(
        json.dumps(merged, indent=2, ensure_ascii=False),
        encoding="utf-8",
    )
    print(f"Merged into {CLIENT_DATA}")

    avg = (stats_paragraphs / stats_chapters) if stats_chapters else 0.0
    print()
    print(f"Stats: {stats_books} non-canon books, {stats_chapters} chapters, "
          f"{stats_paragraphs} paragraph markers")
    print(f"  avg {avg:.2f} paragraphs per chapter")

    # Spot-check: print 1 Enoch chapter 1.
    sample = delta.get("1-enoch", {}).get("1", [])
    if sample:
        print(f"\nSample — 1 Enoch 1: paragraph starts at {sample}")
    sample2 = delta.get("ecclesiasticus", {}).get("1", [])
    if sample2:
        print(f"Sample — Sirach 1:   paragraph starts at {sample2}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
