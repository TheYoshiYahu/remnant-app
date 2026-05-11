"""
Seed the parsed editions (Protestant 66 canon + four Restored Names extras)
into the schema.

Reads:
  ~/Desktop/App/source-texts/parsed/canon.json       (free tier — 66/1189/31102)
  ~/Desktop/App/source-texts/parsed/apocrypha.json   (extras — 14/187/5711)
  ~/Desktop/App/source-texts/parsed/enoch.json       (extras — 1/108/1367)
  ~/Desktop/App/source-texts/parsed/jasher.json      (extras — 1/91/3903)
  ~/Desktop/App/source-texts/parsed/jubilees.json    (extras — 1/50/1038)

JSON shape (per the parser, validated 2026-05-10):
    edition := { edition_id, title, source_file, front_matter, books[] }
    book    := { book_id, book_title, chapters[] }
    chapter := { number, title, verses[], commentary }
    verse   := { number, text }

Default behavior is idempotent on the editions/books/chapters/verses
plane: an edition with the same slug gets its books cascade-deleted and
re-loaded fresh. Subscriptions, users, and study-notes are NEVER
touched by this script — those are user data.

Modes:

  --bootstrap     Apply schema.sql to a fresh DB before seeding. Drops
                  and recreates the public schema. NEVER run against
                  prod.
  --seed-only     Skip --bootstrap, just (re)seed the four editions.
  --dry-run       Parse the JSON and print the counts that *would* be
                  written; touches no DB.

Run:
  # First-time bring-up against a local Postgres:
  createdb remnant_app
  python seed.py --bootstrap

  # Reload the four extras editions after a JSON change:
  python seed.py --seed-only
"""

from __future__ import annotations

import argparse
import asyncio
import json
import re
import sys
from pathlib import Path
from typing import Any

import asyncpg

from config import settings


# Edition slug → profile (witness_category, base, tier, sort_offset, pipeline_version).
# canonical_order is sort_offset + book_index so editions sort predictably:
# canon (0) → apocrypha (200) → enoch (300) → jubilees (310) → jasher (320).
#
# pipeline_version reflects the restoration pipeline that produced the verse
# text in the JSON. The four extras were already restored when published, so
# their JSONs are parses of Yoshi's published Restored Names Editions and
# carry the phase3-v1 stamp (the parser's version, by convention). The
# canon goes through restore.py at ingest time, so it carries the pipeline
# version that ran against it (phase4-v1 in session 13: phase3-v1 + the
# Melchisedec NT-spelling variant added when canon ingest surfaced 9 misses
# in Hebrews 5-7).
EDITION_PROFILES: dict[str, dict[str, Any]] = {
    "canon": {
        "title": "The Holy Bible — King James Version (Restored Names)",
        "public_domain_base": "KJV 1769 Blayney (eBible USFX)",
        "witness_category": "canon",
        "tier_required": "free",
        "sort_offset": 0,
        "pipeline_version": "phase4-v1",
    },
    "apocrypha": {
        "title": "The Apocrypha — Restored Names Edition",
        "public_domain_base": "KJV 1611 Apocrypha",
        "witness_category": "apocrypha",
        "tier_required": "extras",
        "sort_offset": 200,
        "pipeline_version": "phase3-v1",
    },
    "enoch": {
        "title": "The Book of Enoch — Restored Names Edition",
        "public_domain_base": "Charles 1912",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 300,
        "pipeline_version": "phase3-v1",
    },
    "jubilees": {
        "title": "The Book of Jubilees — Restored Names Edition",
        "public_domain_base": "Charles 1902",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 310,
        "pipeline_version": "phase3-v1",
    },
    "jasher": {
        "title": "The Book of Jasher — Restored Names Edition",
        "public_domain_base": "Noah 1840",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 320,
        "pipeline_version": "phase3-v1",
    },
}

# Map the JSON's edition_id → seed profile key. Canon listed first so it
# loads first; the order matches the sort_offset progression above.
JSON_FILE_FOR_EDITION = {
    "canon": "canon.json",
    "apocrypha": "apocrypha.json",
    "enoch": "enoch.json",
    "jubilees": "jubilees.json",
    "jasher": "jasher.json",
}


def slugify(value: str) -> str:
    """Lowercased, dash-separated. Used when a book_id slug isn't already clean."""
    s = value.strip().lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    s = re.sub(r"-+", "-", s).strip("-")
    return s or "book"


# ---------- Bootstrap (apply schema.sql) ----------------------------------


async def bootstrap_schema(conn: asyncpg.Connection, schema_sql_path: Path) -> None:
    """Drop and recreate the public schema, then apply schema.sql."""
    print(f"[bootstrap] dropping & recreating schema 'public' on {conn._addr}")
    await conn.execute("DROP SCHEMA IF EXISTS public CASCADE; CREATE SCHEMA public;")
    sql = schema_sql_path.read_text(encoding="utf-8")
    print(f"[bootstrap] applying {schema_sql_path} ({len(sql):,} chars)")
    await conn.execute(sql)
    print("[bootstrap] schema applied")


# ---------- Seed (insert one parsed edition) ------------------------------


async def upsert_edition(
    conn: asyncpg.Connection,
    edition_slug: str,
    edition_doc: dict[str, Any],
    profile: dict[str, Any],
) -> int:
    """
    Insert (or replace) the editions row for this Restored Names edition,
    cascade-deleting any prior books that referenced it.

    Returns the editions.id.
    """
    # If an edition with this slug already exists, drop its books (which
    # cascades to chapters and verses) and update the row in place. The
    # editions row itself is preserved so any subscriptions, etc., that
    # might one day reference editions stay intact.
    existing = await conn.fetchrow(
        "SELECT id FROM editions WHERE slug = $1", edition_slug
    )
    if existing is not None:
        edition_id = existing["id"]
        await conn.execute(
            "DELETE FROM books WHERE edition_id = $1", edition_id
        )
        await conn.execute(
            "UPDATE editions SET title = $1, public_domain_base = $2, "
            "                    front_matter = $3, "
            "                    restoration_pipeline_version = $4::restoration_pipeline_version "
            " WHERE id = $5",
            profile["title"],
            profile["public_domain_base"],
            edition_doc.get("front_matter") or None,
            profile["pipeline_version"],
            edition_id,
        )
        print(f"  [edition] replaced existing '{edition_slug}' (id={edition_id})")
        return edition_id

    edition_id = await conn.fetchval(
        "INSERT INTO editions "
        "  (slug, title, public_domain_base, restoration_pipeline_version, front_matter) "
        "VALUES ($1, $2, $3, $4::restoration_pipeline_version, $5) "
        "RETURNING id",
        edition_slug,
        profile["title"],
        profile["public_domain_base"],
        profile["pipeline_version"],
        edition_doc.get("front_matter") or None,
    )
    print(f"  [edition] inserted '{edition_slug}' (id={edition_id})")
    return edition_id


async def insert_book(
    conn: asyncpg.Connection,
    edition_id: int,
    book: dict[str, Any],
    profile: dict[str, Any],
    book_index: int,
) -> int:
    """Insert one book row and return its id."""
    book_slug = (book.get("book_id") or slugify(book["book_title"])).strip().lower()
    canonical_order = profile["sort_offset"] + book_index
    book_id = await conn.fetchval(
        "INSERT INTO books "
        "  (edition_id, slug, title, short_title, canonical_order, "
        "   witness_category, tier_required, abstract) "
        "VALUES ($1, $2, $3, $4, $5, $6::witness_category, $7::content_tier, $8) "
        "RETURNING id",
        edition_id,
        book_slug,
        book["book_title"],
        None,
        canonical_order,
        profile["witness_category"],
        profile["tier_required"],
        None,
    )
    return book_id


async def insert_chapter(
    conn: asyncpg.Connection,
    book_db_id: int,
    chapter: dict[str, Any],
) -> int:
    """Insert one chapter row, returning its id."""
    chapter_id = await conn.fetchval(
        "INSERT INTO chapters (book_id, chapter_number, chapter_title, chapter_intro) "
        "VALUES ($1, $2, $3, $4) "
        "RETURNING id",
        book_db_id,
        int(chapter["number"]),
        chapter.get("title") or None,
        chapter.get("commentary") or None,
    )
    return chapter_id


async def insert_verses(
    conn: asyncpg.Connection,
    chapter_db_id: int,
    verses: list[dict[str, Any]],
) -> int:
    """Bulk-insert verses for one chapter; returns the row count."""
    if not verses:
        return 0
    rows = [
        (chapter_db_id, int(v["number"]), v["text"])
        for v in verses
        if v.get("text") is not None
    ]
    await conn.executemany(
        "INSERT INTO verses (chapter_id, verse_number, text) VALUES ($1, $2, $3)",
        rows,
    )
    return len(rows)


async def seed_edition(
    conn: asyncpg.Connection,
    parsed_dir: Path,
    edition_slug: str,
) -> dict[str, int]:
    """Load one parsed JSON file end-to-end into the schema."""
    profile = EDITION_PROFILES[edition_slug]
    json_path = parsed_dir / JSON_FILE_FOR_EDITION[edition_slug]
    print(f"[seed] {edition_slug}  <-  {json_path}")
    with json_path.open("r", encoding="utf-8") as fh:
        edition_doc = json.load(fh)

    counts = {"books": 0, "chapters": 0, "verses": 0}
    async with conn.transaction():
        edition_id = await upsert_edition(conn, edition_slug, edition_doc, profile)
        for book_index, book in enumerate(edition_doc.get("books", []), start=1):
            book_db_id = await insert_book(
                conn, edition_id, book, profile, book_index
            )
            counts["books"] += 1
            for chapter in book.get("chapters", []):
                chapter_db_id = await insert_chapter(conn, book_db_id, chapter)
                counts["chapters"] += 1
                counts["verses"] += await insert_verses(
                    conn, chapter_db_id, chapter.get("verses", [])
                )
    print(
        f"  [seed] {edition_slug}: "
        f"{counts['books']} books, {counts['chapters']} chapters, {counts['verses']} verses"
    )
    return counts


# ---------- Dry-run (parse only, no DB) -----------------------------------


def dry_run(parsed_dir: Path) -> int:
    """Parse the JSON and print expected counts. Returns 0 / nonzero."""
    grand = {"editions": 0, "books": 0, "chapters": 0, "verses": 0}
    for edition_slug, json_name in JSON_FILE_FOR_EDITION.items():
        path = parsed_dir / json_name
        if not path.exists():
            print(f"[dry-run] MISSING: {path}", file=sys.stderr)
            return 2
        with path.open("r", encoding="utf-8") as fh:
            doc = json.load(fh)
        n_books = len(doc.get("books", []))
        n_ch = sum(len(b.get("chapters", [])) for b in doc.get("books", []))
        n_v = sum(
            len(c.get("verses", []))
            for b in doc.get("books", [])
            for c in b.get("chapters", [])
        )
        grand["editions"] += 1
        grand["books"] += n_books
        grand["chapters"] += n_ch
        grand["verses"] += n_v
        print(
            f"[dry-run] {edition_slug:12s}  books={n_books:3d}  chapters={n_ch:5d}  verses={n_v:6d}"
        )
    print(
        "[dry-run] TOTAL: "
        f"{grand['editions']} editions, "
        f"{grand['books']} books, "
        f"{grand['chapters']} chapters, "
        f"{grand['verses']} verses"
    )
    return 0


# ---------- Entrypoint ----------------------------------------------------


async def amain(args: argparse.Namespace) -> int:
    parsed_dir: Path = args.parsed_dir
    if args.dry_run:
        return dry_run(parsed_dir)

    conn = await asyncpg.connect(dsn=settings.database_url)
    try:
        if args.bootstrap:
            await bootstrap_schema(conn, args.schema_sql_path)
        if args.seed_only or args.bootstrap:
            for edition_slug in JSON_FILE_FOR_EDITION:
                await seed_edition(conn, parsed_dir, edition_slug)
        # Always print the schema_version stamp so operators can see they
        # connected to the right DB.
        version = await conn.fetchval(
            "SELECT version FROM schema_version WHERE id = 1"
        )
        print(f"[done] schema_version = {version}")
    finally:
        await conn.close()
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--bootstrap",
        action="store_true",
        help="Drop & recreate public schema, apply schema.sql, then seed.",
    )
    parser.add_argument(
        "--seed-only",
        action="store_true",
        help="Skip --bootstrap; just (re)seed the four extras editions.",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Parse JSON only; print counts. Touches no DB.",
    )
    parser.add_argument(
        "--parsed-dir",
        type=Path,
        default=settings.parsed_json_dir,
        help=f"Directory containing the four parsed JSONs (default: {settings.parsed_json_dir})",
    )
    parser.add_argument(
        "--schema-sql-path",
        type=Path,
        default=settings.schema_sql_path,
        help=f"Path to schema.sql for --bootstrap (default: {settings.schema_sql_path})",
    )
    args = parser.parse_args()

    if not (args.bootstrap or args.seed_only or args.dry_run):
        # Default behavior: seed-only.
        args.seed_only = True

    return asyncio.run(amain(args))


if __name__ == "__main__":
    sys.exit(main())
