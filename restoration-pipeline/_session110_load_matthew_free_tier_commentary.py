#!/usr/bin/env python3
"""
Session 110 — Matthew free-tier commentary loader (Round 1 ship).

Reads ~/Desktop/App/commentaries/matthew-N-free.md for N=1..28, strips the
H1 header line ("# Free-tier commentary on Matthew N"), keeps everything
after as the chapter_intro body, and performs two idempotent writes:

  1. UPDATE chapters.chapter_intro for the matching (canon, matthew, N)
     row in Postgres.

  2. Set chapters[].commentary on the Matthew book inside
     ~/Desktop/App/source-texts/parsed/canon.json so future seed.py runs
     reproduce the same state from scratch.

Both writes are kept in sync so a `seed.py --bootstrap` against a fresh
DB ends up byte-identical (on the chapter_intro plane) to a running prod
DB that took the in-place UPDATE path.

Modes:

  --dry-run    Parse files + print a summary; touch nothing.
  --canon-only Only write canon.json. Skip Postgres.
  --db-only    Only run UPDATEs. Skip canon.json. Requires DATABASE_URL.
  --no-confirm Skip the final apply-confirmation prompt.
  (default)    Both writes, with a confirmation prompt before applying.

Run (from anywhere — paths are absolute):

  # Dry-run, see what would change:
  python3 _session110_load_matthew_free_tier_commentary.py --dry-run

  # Apply against local Postgres:
  DATABASE_URL=postgres://localhost/remnant_app \\
    python3 _session110_load_matthew_free_tier_commentary.py

  # Apply against prod (after local verification):
  DATABASE_URL=<render-postgres-external-url> \\
    python3 _session110_load_matthew_free_tier_commentary.py --no-confirm

Idempotent. Re-running has no effect once the chapter_intro matches the
file body and the canon.json commentary matches.
"""

from __future__ import annotations

import argparse
import asyncio
import json
import os
import re
import sys
from pathlib import Path

# Paths are computed relative to this script's location (restoration-pipeline/
# lives at APP_ROOT/restoration-pipeline). Lets the same script run from the
# user's laptop, from a sandboxed Linux mount, or from CI without env-var
# sprawl. Override with APP_ROOT in the env if the layout ever changes.
APP_ROOT = Path(os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent)
COMMENTARIES_DIR = APP_ROOT / "commentaries"
CANON_JSON_PATH = APP_ROOT / "source-texts" / "parsed" / "canon.json"

MATTHEW_CHAPTERS = list(range(1, 29))  # 1..28 inclusive

H1_HEADER_RE = re.compile(r"^#\s+Free-tier commentary on Matthew\s+\d+\s*$")


def read_free_md_body(chapter_number: int) -> str:
    """
    Read commentaries/matthew-N-free.md, validate the H1 header, return
    everything after the header as a single string (header line + the one
    blank line that follows it both stripped).
    """
    path = COMMENTARIES_DIR / f"matthew-{chapter_number}-free.md"
    if not path.is_file():
        raise FileNotFoundError(f"missing free.md for chapter {chapter_number}: {path}")
    raw = path.read_text(encoding="utf-8")
    lines = raw.splitlines()
    if not lines:
        raise ValueError(f"empty file: {path}")
    if not H1_HEADER_RE.match(lines[0]):
        raise ValueError(
            f"{path}: expected H1 like '# Free-tier commentary on Matthew {chapter_number}' "
            f"on line 1, got: {lines[0]!r}"
        )
    # Drop the H1 line + any blank lines immediately following it.
    body_start = 1
    while body_start < len(lines) and lines[body_start].strip() == "":
        body_start += 1
    body = "\n".join(lines[body_start:]).rstrip() + "\n"
    if not body.strip():
        raise ValueError(f"{path}: body is empty after stripping header")
    return body


def load_all_bodies() -> dict[int, str]:
    """Read all 28 matthew-N-free.md files; return {chapter_number: body}."""
    return {n: read_free_md_body(n) for n in MATTHEW_CHAPTERS}


def update_canon_json(bodies: dict[int, str], *, dry_run: bool) -> dict:
    """
    Inject bodies into source-texts/parsed/canon.json's Matthew book.
    Returns a per-chapter status dict {N: 'inserted' | 'changed' | 'unchanged'}.
    Writes the file back (unless dry_run) preserving 2-space indent and
    a trailing newline to match the existing format.
    """
    if not CANON_JSON_PATH.is_file():
        raise FileNotFoundError(f"canon.json missing: {CANON_JSON_PATH}")

    with CANON_JSON_PATH.open(encoding="utf-8") as f:
        canon = json.load(f)

    matthew = None
    for b in canon.get("books", []):
        if b.get("book_id") == "matthew" or b.get("book_title") == "Matthew":
            matthew = b
            break
    if matthew is None:
        raise RuntimeError("canon.json: Matthew book not found")

    by_num = {int(c["number"]): c for c in matthew.get("chapters", [])}
    status: dict[int, str] = {}
    for n in MATTHEW_CHAPTERS:
        if n not in by_num:
            raise RuntimeError(f"canon.json: Matthew chapter {n} missing")
        ch = by_num[n]
        existing = ch.get("commentary") or ""
        target = bodies[n]
        if existing == target:
            status[n] = "unchanged"
        elif existing == "":
            ch["commentary"] = target
            status[n] = "inserted"
        else:
            ch["commentary"] = target
            status[n] = "changed"

    if not dry_run and any(s != "unchanged" for s in status.values()):
        # Match the existing canon.json format: 2-space indent, ensure_ascii=False,
        # trailing newline. Stable on re-run because we only mutate the body fields
        # being targeted.
        text = json.dumps(canon, indent=2, ensure_ascii=False)
        CANON_JSON_PATH.write_text(text + "\n", encoding="utf-8")
    return status


async def update_postgres(bodies: dict[int, str], database_url: str, *, dry_run: bool) -> dict:
    """
    UPDATE chapters.chapter_intro for canon/matthew/N where body differs.
    Returns {N: 'updated' | 'unchanged' | 'not_found'}.
    """
    import asyncpg  # local import — only required when --db touch is needed

    conn = await asyncpg.connect(database_url)
    try:
        status: dict[int, str] = {}
        for n in MATTHEW_CHAPTERS:
            row = await conn.fetchrow(
                """
                SELECT c.id AS chapter_id, c.chapter_intro
                  FROM chapters c
                  JOIN books    b ON b.id = c.book_id
                  JOIN editions e ON e.id = b.edition_id
                 WHERE e.slug = 'canon'
                   AND b.slug = 'matthew'
                   AND c.chapter_number = $1
                """,
                n,
            )
            if row is None:
                status[n] = "not_found"
                continue
            target = bodies[n]
            if (row["chapter_intro"] or "") == target:
                status[n] = "unchanged"
                continue
            if not dry_run:
                await conn.execute(
                    "UPDATE chapters SET chapter_intro = $1 WHERE id = $2",
                    target,
                    row["chapter_id"],
                )
            status[n] = "updated"
        return status
    finally:
        await conn.close()


def confirm(prompt: str) -> bool:
    print(prompt, end=" ", flush=True)
    try:
        return input().strip().lower() in {"y", "yes"}
    except EOFError:
        return False


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--dry-run", action="store_true", help="Parse files + print summary; touch nothing.")
    ap.add_argument("--canon-only", action="store_true", help="Only write canon.json; skip Postgres.")
    ap.add_argument("--db-only", action="store_true", help="Only run UPDATEs; skip canon.json.")
    ap.add_argument("--no-confirm", action="store_true", help="Skip the confirmation prompt.")
    args = ap.parse_args()

    if args.canon_only and args.db_only:
        print("error: --canon-only and --db-only are mutually exclusive", file=sys.stderr)
        return 2

    bodies = load_all_bodies()
    print(f"Loaded {len(bodies)} free.md bodies. Word counts:")
    for n in MATTHEW_CHAPTERS:
        wc = len(bodies[n].split())
        print(f"  matt-{n:02d}: {wc:>5} words")
    print()

    # canon.json plan
    canon_status: dict = {}
    if not args.db_only:
        canon_status = update_canon_json(bodies, dry_run=True)
        canon_changes = sum(1 for s in canon_status.values() if s != "unchanged")
        print(f"canon.json plan: {canon_changes} chapters would change "
              f"(inserted={sum(1 for s in canon_status.values() if s == 'inserted')}, "
              f"changed={sum(1 for s in canon_status.values() if s == 'changed')}, "
              f"unchanged={sum(1 for s in canon_status.values() if s == 'unchanged')})")
    else:
        print("canon.json plan: skipped (--db-only)")

    # Postgres plan
    db_status: dict = {}
    database_url = os.environ.get("DATABASE_URL", "")
    if not args.canon_only:
        if not database_url:
            print("error: DATABASE_URL is not set (required unless --canon-only)", file=sys.stderr)
            return 2
        db_status = asyncio.run(update_postgres(bodies, database_url, dry_run=True))
        db_changes = sum(1 for s in db_status.values() if s == "updated")
        not_found = sum(1 for s in db_status.values() if s == "not_found")
        print(f"Postgres plan: {db_changes} chapters would UPDATE; {not_found} not found")
        if not_found:
            print("  → 'not_found' means the Matthew chapter row doesn't exist in the target DB. "
                  "If this is a fresh DB, run seed.py --bootstrap first.")
    else:
        print("Postgres plan: skipped (--canon-only)")

    print()
    if args.dry_run:
        print("--dry-run: not writing anything.")
        return 0

    # Apply
    if not args.no_confirm:
        target = "canon.json + Postgres" if not args.canon_only and not args.db_only else \
                 ("canon.json" if args.canon_only else "Postgres")
        if not confirm(f"Apply to {target}? [y/N]"):
            print("aborted.")
            return 1

    if not args.db_only:
        canon_status = update_canon_json(bodies, dry_run=False)
        print(f"canon.json written: {sum(1 for s in canon_status.values() if s != 'unchanged')} chapters changed.")

    if not args.canon_only:
        db_status = asyncio.run(update_postgres(bodies, database_url, dry_run=False))
        print(f"Postgres UPDATEs: {sum(1 for s in db_status.values() if s == 'updated')} chapters updated.")

    print("done.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
