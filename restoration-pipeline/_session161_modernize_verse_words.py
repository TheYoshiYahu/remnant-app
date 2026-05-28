#!/usr/bin/env python3
"""
Session 161 — verse_words.surface modernization.

The story: S149 modernized 13,236 canon verses (42.6%) — saith→says,
wilt thou→will you, thy→your, hath→has, etc. — but verse_words.surface
kept the original KJV surface strings from the USFX source. The PWA's
verse-align.ts does case-insensitive exact-string match between
displayed verse text and verse_words.surface, so every modernized word
breaks. Matthew 20:21 shows the failure plainly: 28 Strong's-tagged
USFX tokens collapse to ~5 visible superscripts because the cursor
sticks on the first mismatch.

This script applies the same S149 modernization rules to the surface
column, with a per-row verify pass:

  1. candidate = modernize_one(surface)
  2. If candidate appears as a whole-word match in the verse's
     (already-modernized) text → update surface = candidate.
  3. If candidate is absent BUT the original surface IS present →
     keep the original (handles the parenthetical-protected case where
     S149 left the verse-text un-modernized inside protected sacred-
     name parentheticals like *Yahuah Rapha (the LORD that healeth
     thee)*).
  4. If neither appears → log as anomaly (sample-capped; small
     number expected — punctuation/spacing drift).

Imports the S149 modernize_one() directly so we apply the exact same
rules. Idempotent: re-running over already-modernized surfaces is a
no-op.

Run:
  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session161_modernize_verse_words.py --dry-run

  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session161_modernize_verse_words.py
"""

from __future__ import annotations

import argparse
import asyncio
import os
import re
import ssl as ssl_lib
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse

import asyncpg

# Import the locked S149 modernizer.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _session149_modernize_canon import modernize_one  # noqa: E402


def whole_word_present(needle: str, hay: str) -> bool:
    """True if `needle` appears as a whole-word match in `hay`.

    The regex anchors on \\b at both ends, escaping the needle so
    parentheticals and punctuation in the surface don't break the
    pattern compilation. Case-insensitive match — alignment is
    case-insensitive too. Whitespace inside multi-word needles is
    collapsed to a single \\s+ for resilience to display variants.
    """
    if not needle.strip():
        return False
    parts = needle.split()
    escaped = r"\s+".join(re.escape(p) for p in parts)
    pat = re.compile(r"\b" + escaped + r"\b", re.IGNORECASE)
    return bool(pat.search(hay))


async def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument(
        "--dry-run",
        action="store_true",
        help="Plan + report; no UPDATEs issued.",
    )
    ap.add_argument(
        "--no-confirm",
        action="store_true",
        help="Skip the apply-confirmation prompt.",
    )
    args = ap.parse_args()

    db_url = os.environ.get("DATABASE_URL")
    if not db_url:
        url_path = (
            Path(__file__).resolve().parent.parent
            / "_scratch"
            / "_db_url.txt"
        )
        if url_path.exists():
            db_url = url_path.read_text().strip()
        else:
            print(
                "ERROR: DATABASE_URL not set and _scratch/_db_url.txt absent.",
                file=sys.stderr,
            )
            return 2

    parsed = urlparse(db_url)
    print(f"==> connecting to {parsed.hostname}/{parsed.path.lstrip('/')}")

    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

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
        # Pull every canon verse_words row with the parent verse text.
        # Stream in a single query — ~348k rows; comfortably in memory.
        print("==> fetching verse_words + verse text for canon edition ...")
        rows = await conn.fetch(
            """
            SELECT vw.id          AS vw_id,
                   vw.surface     AS surface,
                   v.text         AS verse_text
              FROM verse_words vw
              JOIN verses   v ON v.id = vw.verse_id
              JOIN chapters c ON c.id = v.chapter_id
              JOIN books    b ON b.id = c.book_id
              JOIN editions e ON e.id = b.edition_id
             WHERE e.slug = 'canon'
            """
        )
        print(f"  fetched {len(rows):,} rows")

        # Plan pass.
        n_unchanged = 0       # candidate == surface (already modern or no archaic form)
        n_will_update = 0     # candidate != surface AND candidate present in verse_text
        n_kept_protected = 0  # candidate not in verse_text BUT original is (parenthetical-protected)
        n_anomalies = 0       # neither candidate nor original present (punctuation/spacing drift)
        updates: list[tuple[int, str]] = []
        anomalies: list[tuple[int, str, str, str]] = []  # (vw_id, original, candidate, verse_text_snippet)

        for r in rows:
            original = r["surface"] or ""
            verse_text = r["verse_text"] or ""
            candidate = modernize_one(original)

            if candidate == original:
                n_unchanged += 1
                continue

            if whole_word_present(candidate, verse_text):
                n_will_update += 1
                updates.append((r["vw_id"], candidate))
            elif whole_word_present(original, verse_text):
                n_kept_protected += 1
            else:
                n_anomalies += 1
                if len(anomalies) < 25:
                    anomalies.append(
                        (
                            r["vw_id"],
                            original,
                            candidate,
                            (verse_text[:120] + "…") if len(verse_text) > 120 else verse_text,
                        )
                    )

        print()
        print("==> plan")
        print(f"  rows scanned:                {len(rows):,}")
        print(f"  unchanged (no archaic form): {n_unchanged:,}")
        print(f"  will update to modernized:   {n_will_update:,}")
        print(f"  kept (paren-protected):      {n_kept_protected:,}")
        print(f"  anomalies (logged):          {n_anomalies:,}")

        if anomalies:
            print()
            print("  Anomaly samples (first 25):")
            for vw_id, orig, cand, snip in anomalies:
                print(f"    vw_id={vw_id} surface={orig!r} candidate={cand!r}")
                print(f"      verse: {snip}")

        if args.dry_run:
            print()
            print("Dry-run complete; no UPDATEs issued.")
            return 0

        if n_will_update == 0:
            print()
            print("No rows to update; nothing to apply.")
            return 0

        if not args.no_confirm:
            print()
            ans = input(
                f"Apply {n_will_update:,} UPDATE statements? [y/N] "
            ).strip().lower()
            if ans not in {"y", "yes"}:
                print("Aborted.")
                return 1

        # Apply: batch UPDATE in a single transaction.
        print()
        print("==> applying updates ...")
        BATCH = 2000
        applied = 0
        async with conn.transaction():
            for i in range(0, len(updates), BATCH):
                chunk = updates[i : i + BATCH]
                await conn.executemany(
                    "UPDATE verse_words SET surface = $2 WHERE id = $1",
                    chunk,
                )
                applied += len(chunk)
                if i % (BATCH * 10) == 0 and i > 0:
                    print(f"  applied {applied:,} / {len(updates):,} ...")
        print(f"Applied: {applied:,} surface updates.")
        return 0
    finally:
        await conn.close()


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
