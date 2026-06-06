#!/usr/bin/env python3
"""
Session 202 — Matthew merged-commentary loader.

The S201/S202 layout pass removed the tiered Basic / Deeper-Dive commentary
stack from the reader and folded every point into ONE comprehensive
Commentary per chapter (Yoshi: "take away all the deeper dives and just have
the commentary... the commentary that is left should incorporate all points").
The merged bodies live in:

    ~/Desktop/App/commentaries/merged/matthew-N.md   for N = 1..28

(body only — each file starts at its first '## ' section heading; no H1).
Matthew 1 is the Yoshi-approved gold template; 2..28 were consolidated by the
S202 merge minions and verified by the checker pass.

This loader is the delivery half. It performs two idempotent writes, exactly
like the S110 free-tier loader it supersedes:

  1. UPDATE chapters.chapter_intro for the matching (canon, matthew, N) row
     in Postgres — this is what the reader's "Commentary" surface renders.

  2. Set chapters[].commentary on the Matthew book inside
     source-texts/parsed/canon.json so a fresh `seed.py --bootstrap`
     reproduces the same state.

The merged Markdown carries '## section headings' and '**bold lead-ins**';
the reader's renderMarkdownBody (app/src/lib/markdown.tsx, upgraded in S202)
renders both. The body is stored verbatim — no header stripping (there is no
H1 to strip).

Modes:

  --dry-run    Parse files + print a summary; touch nothing.
  --canon-only Only write canon.json. Skip Postgres.
  --db-only    Only run UPDATEs. Skip canon.json. Requires DATABASE_URL.
  --no-confirm Skip the final apply-confirmation prompt.
  (default)    Both writes, with a confirmation prompt before applying.

Run (from anywhere — paths are absolute):

  # Dry-run, see what would change:
  python3 _session202_load_matthew_merged_commentary.py --dry-run

  # Apply against local Postgres:
  DATABASE_URL=postgres://localhost/remnant_app \\
    python3 _session202_load_matthew_merged_commentary.py

  # Apply against prod (after local verification), from the Mac:
  DATABASE_URL=<render-postgres-external-url> \\
    python3 _session202_load_matthew_merged_commentary.py --no-confirm

Idempotent. Re-running has no effect once chapter_intro matches the file body
and the canon.json commentary matches.
"""

from __future__ import annotations

import argparse
import asyncio
import json
import os
import sys
from pathlib import Path

APP_ROOT = Path(os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent)
MERGED_DIR = APP_ROOT / "commentaries" / "merged"
CANON_JSON_PATH = APP_ROOT / "source-texts" / "parsed" / "canon.json"

MATTHEW_CHAPTERS = list(range(1, 29))  # 1..28 inclusive


def read_merged_body(chapter_number: int) -> str:
    """Read commentaries/merged/matthew-N.md, return the body verbatim
    (normalized to a single trailing newline). No header to strip."""
    path = MERGED_DIR / f"matthew-{chapter_number}.md"
    if not path.is_file():
        raise FileNotFoundError(
            f"missing merged commentary for chapter {chapter_number}: {path}"
        )
    body = path.read_text(encoding="utf-8").rstrip() + "\n"
    if not body.strip():
        raise ValueError(f"{path}: body is empty")
    if body.lstrip().startswith("# "):
        raise ValueError(
            f"{path}: body starts with an H1 ('# ...'); merged bodies must "
            f"start at the first '## ' section heading"
        )
    return body


def load_all_bodies() -> dict[int, str]:
    return {n: read_merged_body(n) for n in MATTHEW_CHAPTERS}


def update_canon_json(bodies: dict[int, str], *, dry_run: bool) -> dict:
    """Inject bodies into canon.json's Matthew book chapters[].commentary.
    Returns {N: 'inserted' | 'changed' | 'unchanged'}."""
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
        text = json.dumps(canon, indent=2, ensure_ascii=False)
        CANON_JSON_PATH.write_text(text + "\n", encoding="utf-8")
    return status


async def update_postgres(bodies: dict[int, str], database_url: str, *, dry_run: bool) -> dict:
    """UPDATE chapters.chapter_intro for canon/matthew/N where body differs.
    Returns {N: 'updated' | 'unchanged' | 'not_found'}.

    Uses the S112 robust-connect path: parse the URL ourselves and pass
    components to asyncpg.connect() with a permissive SSL context + longer
    timeout, which negotiates reliably against Render's external Postgres
    where the plain URL form sometimes fails."""
    import asyncpg
    import ssl as ssl_lib
    from urllib.parse import urlparse, unquote

    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

    parsed = urlparse(database_url)
    is_local = parsed.hostname in ("localhost", "127.0.0.1")
    conn = await asyncpg.connect(
        host=parsed.hostname,
        port=parsed.port or 5432,
        user=unquote(parsed.username) if parsed.username else None,
        password=unquote(parsed.password) if parsed.password else None,
        database=parsed.path.lstrip("/") if parsed.path else None,
        ssl=None if is_local else ssl_ctx,
        timeout=30,
    )
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
    print(f"Loaded {len(bodies)} merged commentary bodies. Word counts:")
    for n in MATTHEW_CHAPTERS:
        print(f"  matt-{n:02d}: {len(bodies[n].split()):>6} words")
    print()

    canon_status: dict = {}
    if not args.db_only:
        canon_status = update_canon_json(bodies, dry_run=True)
        print(f"canon.json plan: "
              f"inserted={sum(1 for s in canon_status.values() if s == 'inserted')}, "
              f"changed={sum(1 for s in canon_status.values() if s == 'changed')}, "
              f"unchanged={sum(1 for s in canon_status.values() if s == 'unchanged')}")
    else:
        print("canon.json plan: skipped (--db-only)")

    db_status: dict = {}
    database_url = os.environ.get("DATABASE_URL", "")
    if not args.canon_only:
        if not database_url:
            print("error: DATABASE_URL is not set (required unless --canon-only)", file=sys.stderr)
            return 2
        db_status = asyncio.run(update_postgres(bodies, database_url, dry_run=True))
        print(f"Postgres plan: updated={sum(1 for s in db_status.values() if s == 'updated')}, "
              f"unchanged={sum(1 for s in db_status.values() if s == 'unchanged')}, "
              f"not_found={sum(1 for s in db_status.values() if s == 'not_found')}")
        if any(s == "not_found" for s in db_status.values()):
            print("  → 'not_found' means the Matthew chapter row doesn't exist in the target DB.")
    else:
        print("Postgres plan: skipped (--canon-only)")

    print()
    if args.dry_run:
        print("--dry-run: not writing anything.")
        return 0

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
