#!/usr/bin/env python3
"""
Session 161b — context-dependent surface modernization follow-up.

Part 1 (_session161_modernize_verse_words.py) ran modernize_one() per
surface in isolation. That caught every standalone S149 rule but missed
three context-dependent cases:

  1. surface "art"  — modernized to "are" only when preceded by "thou"
                      (PRONOUN_VERB_PAIRS "thou art" → "you are").
                      Standalone "art" is deliberately preserved by
                      S149 (the *Our Father which art in heaven* case).
  2. surface "mine" — modernized to "my" only when followed by a letter
                      (MINE_ATTRIBUTIVE "mine X" → "my X").
                      Standalone "mine" (predicate) preserved.
  3. surface "Mine" — same.

For each verse_words row whose surface is one of these three AND whose
surface does NOT appear as a whole-word match in the parent verse's
modernized text, look for the expected modernized form ("are" / "my" /
"My") in the verse text. If present, update the surface. If not, leave
it alone and log as anomaly (very rare — predicate cases where the
modernization correctly did not fire).

Matthew 20:23 is the canonical failing case: USFX has
<w s="G1699">mine</w> followed by <w s="G1325">to give</w>; S149
turned "mine to give" into "my to give" in the verse text, but Part 1
left the surface as "mine" because modernize_one("mine") returns
"mine" unchanged. Result: alignment cascade from that position to the
end of the verse.

Run:
  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session161b_modernize_context_dependent.py --dry-run

  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session161b_modernize_context_dependent.py
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


# Context-dependent S149 substitutions that don't fire on isolated
# surfaces. Keys are the verse_words.surface values seen in the DB;
# values are the expected modernized forms to test for in the verse
# text. Case-sensitive — KJV preserves capitalization at sentence
# starts.
CONTEXT_MAP: dict[str, str] = {
    "art": "are",
    "mine": "my",
    "Mine": "My",
}


def whole_word_present(needle: str, hay: str) -> bool:
    """True if needle appears as a whole-word match in hay.

    Case-insensitive (same convention as the runtime alignment).
    Bounded by \\b at both ends with the needle escaped so any
    punctuation in the surface doesn't break the pattern.
    """
    if not needle.strip():
        return False
    pat = re.compile(r"\b" + re.escape(needle) + r"\b", re.IGNORECASE)
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
        print(
            "==> fetching canon verse_words rows whose surface is "
            f"{sorted(CONTEXT_MAP)} ..."
        )
        rows = await conn.fetch(
            """
            SELECT vw.id          AS vw_id,
                   vw.surface     AS surface,
                   v.text         AS verse_text,
                   b.slug         AS book_slug,
                   c.chapter_number AS chapter,
                   v.verse_number AS verse_n
              FROM verse_words vw
              JOIN verses   v ON v.id = vw.verse_id
              JOIN chapters c ON c.id = v.chapter_id
              JOIN books    b ON b.id = c.book_id
              JOIN editions e ON e.id = b.edition_id
             WHERE e.slug = 'canon'
               AND vw.surface = ANY($1::text[])
            """,
            list(CONTEXT_MAP),
        )
        print(f"  fetched {len(rows):,} candidate rows")

        n_will_update = 0
        n_kept_present = 0      # surface still in verse text (preserved predicate case)
        n_anomalies = 0
        updates: list[tuple[int, str]] = []
        anomalies: list[tuple[int, str, str, str, str]] = []  # (vw_id, ref, surface, expected, verse_snippet)

        for r in rows:
            surface = r["surface"]
            verse_text = r["verse_text"] or ""
            expected = CONTEXT_MAP[surface]

            if whole_word_present(surface, verse_text):
                # The surface is still in the displayed verse text —
                # the modernization correctly did not fire here
                # (predicate use of "mine" / "Mine" / the preserved
                # "art" cases). Leave it alone.
                n_kept_present += 1
                continue

            if whole_word_present(expected, verse_text):
                n_will_update += 1
                updates.append((r["vw_id"], expected))
            else:
                n_anomalies += 1
                if len(anomalies) < 25:
                    snip = (
                        verse_text[:140] + "…"
                        if len(verse_text) > 140
                        else verse_text
                    )
                    anomalies.append(
                        (
                            r["vw_id"],
                            f"{r['book_slug']} {r['chapter']}:{r['verse_n']}",
                            surface,
                            expected,
                            snip,
                        )
                    )

        print()
        print("==> plan")
        print(f"  candidate rows (surface in {sorted(CONTEXT_MAP)}): {len(rows):,}")
        print(f"  kept (surface still present — predicate case):     {n_kept_present:,}")
        print(f"  will update to expected modernized form:           {n_will_update:,}")
        print(f"  anomalies (neither surface nor expected present):  {n_anomalies:,}")

        if anomalies:
            print()
            print("  Anomaly samples (first 25):")
            for vw_id, ref, surface, expected, snip in anomalies:
                print(
                    f"    vw_id={vw_id} {ref} surface={surface!r} expected={expected!r}"
                )
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

        print()
        print("==> applying updates ...")
        BATCH = 1000
        applied = 0
        async with conn.transaction():
            for i in range(0, len(updates), BATCH):
                chunk = updates[i : i + BATCH]
                await conn.executemany(
                    "UPDATE verse_words SET surface = $2 WHERE id = $1",
                    chunk,
                )
                applied += len(chunk)
        print(f"Applied: {applied:,} surface updates.")
        return 0
    finally:
        await conn.close()


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
