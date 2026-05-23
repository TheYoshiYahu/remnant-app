#!/usr/bin/env python3
"""
Session 120 — verse_words loader (Strong's-tagged token alignment).

Parses the existing source-texts/kjv/eng-kjv_usfx.xml file (which already
carries <w s="H####"> and <w s="G####"> Strong's tags on every word) and
populates the verse_words table: one row per Strong's-tagged English word
in every canon verse, with verse_id + 1-based position + surface form +
strong_number.

Public domain — KJV 1769 Blayney revision distributed as USFX by
eBible.org / CrossWire. Already on disk per source-texts/SOURCE_TEXT_INVENTORY.md.

This is the second half of Wheel 1 (Strong's data foundation). The first
half — strong_entries lexicon — is loaded by
_session120_load_strong_entries.py. Together they enable the §9 free-tier
tap-on-word UX: tap any word in any verse → modal with Strong's number +
brief lexicon entry.

Schema columns (data-schema/schema.sql lines 249-257):
  id              BIGSERIAL PRIMARY KEY (auto)
  verse_id        BIGINT NOT NULL REFERENCES verses(id)
  position        INT NOT NULL          1-based word position in the verse
  surface         TEXT NOT NULL         the English surface form
  strong_number   TEXT REFERENCES strong_entries(strong_number)
  morphology      TEXT NULL             Robinson's morph for Greek (V2)
  UNIQUE (verse_id, position)

Parsing approach:
  1. Scan eng-kjv_usfx.xml for <book id="XXX"> ... </book> blocks
  2. Within each book, scan for <c id="N" /> chapter markers
  3. Within each chapter, scan for <v id="N" bcv="BOOK.C.V" /> ... <ve />
     verse boundaries
  4. Within each verse boundary, find all <w s="X">surface</w> tags in order
  5. Emit (book_slug, chapter_number, verse_number, position, surface,
     strong_number) tuples — position is 1-based by source order

Mapping rules:
  USFX book code → DB slug via PROTESTANT_66 (imported from parse_canon.py).
  Strong's number normalized to 4-digit zero-padded form: 'H553' → 'H0553'.
  Surface text: stripped of leading/trailing whitespace; multi-word <w>
    elements (rare; e.g., 'firmament') stay as a single surface row.

Modes:
  --dry-run     Parse XML + print summary; touch nothing.
  --no-confirm  Skip the apply-confirmation prompt.
  (default)     Apply with a confirmation prompt.

Run:
  # Dry-run locally:
  DATABASE_URL=postgres://localhost/remnant_app \\
    python3 _session120_load_verse_words.py --dry-run

  # Apply against prod from Render Shell (per S112 future-loader pattern):
  python3 /restoration-pipeline/_session120_load_verse_words.py --no-confirm

Idempotent. Deletes all existing verse_words for the canon edition before
re-inserting (single-source-of-truth pattern — the USFX file IS the truth
for verse-word alignment). This means re-runs are equivalent to a fresh
load, no drift risk from partial-update strategies. The DELETE + INSERT
runs in a single transaction so the read endpoint never sees an empty
verse_words state mid-load.

Expected load: ~31,000 verses × ~15-25 tagged words each ≈ 700k-800k rows.
"""

from __future__ import annotations

import argparse
import asyncio
import os
import re
import sys
from pathlib import Path
from typing import Iterator

APP_ROOT = Path(os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent)
USFX_PATH = APP_ROOT / "source-texts" / "kjv" / "eng-kjv_usfx.xml"

# USFX code → DB slug for the Protestant 66 (canon edition). Mirrored from
# parse_canon.py's PROTESTANT_66 constant; inlined here so this loader has
# no cross-file dependency in restoration-pipeline/ (only session-prefixed
# files ship in the API Docker image per the S112 pattern). If the slug
# convention changes, update both this map and parse_canon.py.
USFX_TO_SLUG: dict[str, str] = {
    # OT (39)
    "GEN": "genesis", "EXO": "exodus", "LEV": "leviticus", "NUM": "numbers",
    "DEU": "deuteronomy", "JOS": "joshua", "JDG": "judges", "RUT": "ruth",
    "1SA": "1-samuel", "2SA": "2-samuel", "1KI": "1-kings", "2KI": "2-kings",
    "1CH": "1-chronicles", "2CH": "2-chronicles", "EZR": "ezra",
    "NEH": "nehemiah", "EST": "esther", "JOB": "job", "PSA": "psalms",
    "PRO": "proverbs", "ECC": "ecclesiastes", "SNG": "song-of-solomon",
    "ISA": "isaiah", "JER": "jeremiah", "LAM": "lamentations",
    "EZK": "ezekiel", "DAN": "daniel", "HOS": "hosea", "JOL": "joel",
    "AMO": "amos", "OBA": "obadiah", "JON": "jonah", "MIC": "micah",
    "NAM": "nahum", "HAB": "habakkuk", "ZEP": "zephaniah", "HAG": "haggai",
    "ZEC": "zechariah", "MAL": "malachi",
    # NT (27)
    "MAT": "matthew", "MRK": "mark", "LUK": "luke", "JHN": "john",
    "ACT": "acts", "ROM": "romans", "1CO": "1-corinthians",
    "2CO": "2-corinthians", "GAL": "galatians", "EPH": "ephesians",
    "PHP": "philippians", "COL": "colossians", "1TH": "1-thessalonians",
    "2TH": "2-thessalonians", "1TI": "1-timothy", "2TI": "2-timothy",
    "TIT": "titus", "PHM": "philemon", "HEB": "hebrews", "JAS": "james",
    "1PE": "1-peter", "2PE": "2-peter", "1JN": "1-john", "2JN": "2-john",
    "3JN": "3-john", "JUD": "jude", "REV": "revelation",
}
assert len(USFX_TO_SLUG) == 66, f"expected 66 books, have {len(USFX_TO_SLUG)}"


# Regexes for the USFX walk. parse_canon.py establishes the same patterns;
# we re-derive them here because we need different extraction (we keep <w>
# tags as data rather than stripping them like parse_canon does).
_BOOK_OPEN_RE = re.compile(r'<book\s+id="([A-Z0-9]+)"[^>]*>')
_BOOK_CLOSE_RE = re.compile(r'</book>')
_CHAPTER_RE = re.compile(r'<c\s+id="(\d+)"\s*/>')
_VERSE_OPEN_RE = re.compile(r'<v\s+id="([0-9A-Za-z\-]+)"\s+bcv="[^"]*"\s*/>')
_VERSE_CLOSE_RE = re.compile(r'<ve\s*/>')
# Match <w s="H####" ...>surface</w> — surface is anything up to closing tag.
# OpenScriptures-derived USFX uses s="H0001" or s="G3056". Some entries have
# multiple Strong's numbers separated by space (e.g., s="H0001 H0002") —
# we take the first one only for the verse_words tagging (the lexicon
# lookup uses the first listed number as the primary).
_W_TAG_RE = re.compile(r'<w\s+s="([HG][0-9]+(?:\s+[HG][0-9]+)*)"[^>]*>([^<]*)</w>')


def _normalize_strong_number(raw: str) -> str:
    """'H553' or 'H0553' -> 'H0553'. Take first if multi-tag space-separated."""
    first = raw.split()[0]
    prefix = first[0]
    digits = first[1:]
    if not digits.isdigit():
        raise ValueError(f"malformed strong_number: {raw!r}")
    return f"{prefix}{int(digits):04d}"


def parse_usfx_verse_words() -> Iterator[tuple[str, int, int, int, str, str]]:
    """
    Walk eng-kjv_usfx.xml; yield
      (book_slug, chapter_number, verse_number, position, surface,
       strong_number)
    tuples for every Strong's-tagged word in every verse, position is
    1-based by source order.

    Verse numbers in USFX can be like '1', '17', '17a', '17-18'. For
    multi-verse spans we use the first integer (e.g., '17-18' -> 17).
    For lettered verses ('17a') we strip the letter (-> 17). The
    canon parse uses the same convention.
    """
    if not USFX_PATH.is_file():
        raise FileNotFoundError(
            f"missing KJV USFX at {USFX_PATH} — check "
            f"source-texts/kjv/ exists with eng-kjv_usfx.xml"
        )
    text = USFX_PATH.read_text(encoding="utf-8")

    # Walk book by book. The file has 66 <book id="XXX">...</book> sections.
    pos = 0
    book_count = 0
    while True:
        m = _BOOK_OPEN_RE.search(text, pos)
        if m is None:
            break
        usfx_code = m.group(1)
        book_close = _BOOK_CLOSE_RE.search(text, m.end())
        if book_close is None:
            raise ValueError(
                f"book {usfx_code} at offset {m.start()}: no closing </book>"
            )
        book_text = text[m.end() : book_close.start()]
        pos = book_close.end()

        slug = USFX_TO_SLUG.get(usfx_code)
        if slug is None:
            # Apocrypha / non-canon books in the USFX file get skipped —
            # canon-only verse_words for v1 per DESIGN_LANGUAGE.md §9.
            continue
        book_count += 1

        # Walk chapters inside the book.
        chap_matches = list(_CHAPTER_RE.finditer(book_text))
        for ci, chap_m in enumerate(chap_matches):
            chap_num = int(chap_m.group(1))
            chap_start = chap_m.end()
            chap_end = (
                chap_matches[ci + 1].start() if ci + 1 < len(chap_matches)
                else len(book_text)
            )
            chap_text = book_text[chap_start:chap_end]

            # Walk verses inside the chapter.
            verse_open_matches = list(_VERSE_OPEN_RE.finditer(chap_text))
            for vi, vopen in enumerate(verse_open_matches):
                vid_raw = vopen.group(1)
                # Normalize: '17a' -> 17, '17-18' -> 17.
                vid_digits = re.match(r'^(\d+)', vid_raw)
                if vid_digits is None:
                    continue
                vnum = int(vid_digits.group(1))

                verse_start = vopen.end()
                # The verse ends at the next <v> opener OR a <ve /> closer
                # OR the end of the chapter, whichever comes first.
                next_v_start = (
                    verse_open_matches[vi + 1].start() if vi + 1 < len(verse_open_matches)
                    else len(chap_text)
                )
                ve_match = _VERSE_CLOSE_RE.search(chap_text, verse_start, next_v_start)
                verse_end = ve_match.start() if ve_match else next_v_start
                verse_text = chap_text[verse_start:verse_end]

                # Extract every <w s="X">surface</w> in source order.
                position = 0
                for wm in _W_TAG_RE.finditer(verse_text):
                    raw_strong = wm.group(1)
                    surface = wm.group(2).strip()
                    if not surface:
                        continue
                    try:
                        strong_number = _normalize_strong_number(raw_strong)
                    except ValueError:
                        continue
                    position += 1
                    yield (slug, chap_num, vnum, position, surface, strong_number)

    if book_count == 0:
        raise ValueError(
            "no canon books matched in USFX — check PROTESTANT_66 USFX codes "
            "vs the file's actual book id values"
        )


async def plan_and_apply(
    rows: list[tuple[str, int, int, int, str, str]],
    database_url: str,
    *,
    dry_run: bool,
) -> dict[str, int]:
    """
    Plan + optionally apply verse_words load.

    Strategy: build verse_id lookup map from books + chapters + verses tables,
    map each parsed row to its verse_id, batch-insert.

    For apply: DELETE all existing verse_words for the canon edition first,
    then INSERT every row in a single transaction. Equivalent to a fresh
    load; eliminates drift risk from partial updates.

    Returns: {'rows_parsed': N, 'rows_with_verse_id': N,
              'rows_missing_verse_id': N, 'rows_unknown_strong': N,
              'rows_inserted': N (apply only) | 0 (dry-run)}
    """
    import asyncpg
    import ssl as ssl_lib
    from urllib.parse import urlparse, unquote

    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

    parsed = urlparse(database_url)
    conn = await asyncpg.connect(
        host=parsed.hostname,
        port=parsed.port or 5432,
        user=unquote(parsed.username) if parsed.username else None,
        password=unquote(parsed.password) if parsed.password else None,
        database=parsed.path.lstrip("/") if parsed.path else None,
        ssl=ssl_ctx,
        timeout=30,
    )
    try:
        # Build (book_slug, chapter_number, verse_number) -> verse_id lookup
        # for the canon edition.
        print("  building verse_id lookup from DB ...")
        verse_lookup_rows = await conn.fetch(
            """
            SELECT b.slug AS book_slug,
                   c.chapter_number,
                   v.verse_number,
                   v.id AS verse_id
              FROM verses v
              JOIN chapters c ON c.id = v.chapter_id
              JOIN books    b ON b.id = c.book_id
              JOIN editions e ON e.id = b.edition_id
             WHERE e.slug = 'canon'
            """
        )
        verse_lookup: dict[tuple[str, int, int], int] = {
            (r["book_slug"], r["chapter_number"], r["verse_number"]): r["verse_id"]
            for r in verse_lookup_rows
        }
        print(f"  loaded {len(verse_lookup):,} verse_id keys")

        # Build set of known strong_numbers (to count unknown-strong references).
        strong_keys = {
            r["strong_number"]
            for r in await conn.fetch(
                "SELECT strong_number FROM strong_entries"
            )
        }
        print(f"  loaded {len(strong_keys):,} strong_entries keys")

        # Map rows to (verse_id, position, surface, strong_or_null).
        # Track counts for the summary.
        mapped: list[tuple[int, int, str, str | None]] = []
        missing_verse_count = 0
        unknown_strong_count = 0
        for slug, chap, vs, pos, surf, sn in rows:
            vid = verse_lookup.get((slug, chap, vs))
            if vid is None:
                missing_verse_count += 1
                continue
            if sn not in strong_keys:
                unknown_strong_count += 1
                # Still insert the row with strong_number=NULL — the schema
                # allows it (FK with no value), and the partner still gets
                # to tap the word even if Strong's coverage is incomplete.
                mapped.append((vid, pos, surf, None))
            else:
                mapped.append((vid, pos, surf, sn))

        result = {
            "rows_parsed": len(rows),
            "rows_with_verse_id": len(mapped),
            "rows_missing_verse_id": missing_verse_count,
            "rows_unknown_strong": unknown_strong_count,
            "rows_inserted": 0,
        }

        if dry_run:
            return result

        # Apply: single transaction; DELETE existing + INSERT new.
        async with conn.transaction():
            # DELETE everything currently in verse_words for canon verses.
            del_count = await conn.fetchval(
                """
                WITH d AS (
                    DELETE FROM verse_words vw
                     USING verses v
                       JOIN chapters c ON c.id = v.chapter_id
                       JOIN books    b ON b.id = c.book_id
                       JOIN editions e ON e.id = b.edition_id
                     WHERE vw.verse_id = v.id AND e.slug = 'canon'
                    RETURNING vw.id
                )
                SELECT count(*) FROM d
                """
            )
            print(f"  deleted {del_count:,} existing canon verse_words rows")

            # Batch INSERT in chunks of 2000.
            BATCH = 2000
            inserted = 0
            for i in range(0, len(mapped), BATCH):
                chunk = mapped[i : i + BATCH]
                await conn.executemany(
                    """
                    INSERT INTO verse_words
                        (verse_id, position, surface, strong_number)
                    VALUES ($1, $2, $3, $4)
                    """,
                    chunk,
                )
                inserted += len(chunk)
                if i % (BATCH * 25) == 0 and i > 0:
                    print(f"  inserted {inserted:,} / {len(mapped):,} ...")
            result["rows_inserted"] = inserted

        return result
    finally:
        await conn.close()


def confirm(prompt: str) -> bool:
    print(prompt, end=" ", flush=True)
    try:
        return input().strip().lower() in {"y", "yes"}
    except EOFError:
        return False


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--no-confirm", action="store_true")
    args = ap.parse_args()

    # Step 1 — parse USFX.
    print(f"==> parsing {USFX_PATH}")
    rows = list(parse_usfx_verse_words())
    by_book: dict[str, int] = {}
    for slug, _c, _v, _p, _s, _sn in rows:
        by_book[slug] = by_book.get(slug, 0) + 1
    print(f"Parsed {len(rows):,} Strong's-tagged tokens "
          f"across {len(by_book)} books")
    print(f"  range: {min(by_book.values()):,} - {max(by_book.values()):,} "
          f"tokens per book")
    print()

    # Step 2 — DB plan.
    database_url = os.environ.get("DATABASE_URL", "")
    if not database_url:
        print("error: DATABASE_URL is not set", file=sys.stderr)
        return 2

    print("==> dry-run plan against current DB")
    plan = asyncio.run(plan_and_apply(rows, database_url, dry_run=True))
    print(f"Plan: parsed={plan['rows_parsed']:,}  "
          f"with_verse_id={plan['rows_with_verse_id']:,}  "
          f"missing_verse_id={plan['rows_missing_verse_id']:,}  "
          f"unknown_strong={plan['rows_unknown_strong']:,}")
    print()

    if args.dry_run:
        print("Dry-run complete; no changes applied.")
        return 0

    if plan["rows_with_verse_id"] == 0:
        print("No rows would be inserted; nothing to apply.")
        return 0

    if plan["rows_missing_verse_id"] > 0:
        print(
            f"WARNING: {plan['rows_missing_verse_id']:,} rows have no matching "
            f"verse_id (book.slug + chapter + verse not in DB). These will "
            f"be silently dropped at INSERT time."
        )

    if not args.no_confirm:
        if not confirm("Apply (DELETE existing canon verse_words + INSERT new)? [y/N]"):
            print("Aborted.")
            return 1

    print("==> applying")
    result = asyncio.run(plan_and_apply(rows, database_url, dry_run=False))
    print(f"Applied: inserted={result['rows_inserted']:,} rows")
    return 0


if __name__ == "__main__":
    sys.exit(main())
