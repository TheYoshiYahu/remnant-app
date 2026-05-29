#!/usr/bin/env python3
"""
Session 161c — Sacred Names Convention surface remap.

The S161 alignment scan (98.9% alignment across 2,133 sample verses)
surfaced specific patterns where USFX surfaces don't match what the
framework's Sacred Names Convention puts on the display side:

  G0444 'of man'   → 'of Adam'   (Red Line #12 — Son of Adam)
  G2316 'of God'   → 'God'       (paren cluster mismatch: USFX multi-
                                  word 'of God' vs paren content
                                  ['god']; remap drops the 'of' so the
                                  cluster aligns with 'Elohim (God)'.
                                  Loses the 'of' tappable per verse —
                                  acceptable trade.)
  G6635 'of hosts' → 'hosts'     (same multi-word-with-preposition
                                  case for Yahuah Tseva'ot (LORD of
                                  hosts))
  G1410 'can'      → 'cannot'    (John 3:3 / 3:5 — display compounds
                                  'can not' into 'cannot')
  G1410 'he can'   → 'he cannot' (same case, multi-word surface)

NOT handled here (deferred):
  G4151 'Ghost'    + G0040 'the Holy' → 'Spirit' + 'Holy'
  The 'Ruach HaKodesh (Holy Spirit)' cluster has a Hebrew-vs-English
  word-order reversal that the positional pairing in the cluster code
  can't honor without either (a) accepting reversed Strong's
  attribution to Ruach and HaKodesh, or (b) deeper algorithm work.
  Eleven verses in the sample — left as v1.1+ work.

Same verify-against-display pattern as Part 1: only update if the
expected new surface appears as a whole-word match in the verse text.
Idempotent.

Run:
  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session161c_sacred_name_surface_remap.py --dry-run

  cd ~/Desktop/App
  DATABASE_URL="$(cat _scratch/_db_url.txt)" \\
    python3 restoration-pipeline/_session161c_sacred_name_surface_remap.py
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


# (strong_number, original surface, target surface) tuples to apply.
# Each row in verse_words matching (strong_number, original surface)
# is a candidate; the row updates only if `target` appears as a
# whole-word match in the parent verse text AND the original does not.
#
# Revised after the S161 row-dump diagnostic surfaced that production
# already has the Sacred Names transformations applied for most of the
# patterns this script originally targeted:
#   - G0444 'of man'   → already 'of Adam' in DB
#   - G2316 'of God'   → already 'God'    in DB (single word — cluster
#                         handles '(God)' paren directly)
#   - G1410 'can'      → already 'cannot' in DB for John 3:3 / 3:5
#   - G1410 'he can'   → already 'he cannot' in DB
# Only the Tseva'ot 'of hosts' case remains unfixed — and the original
# rule had a typo (G6635 → H6635; Hebrew, not Greek). Fixing that here.
# (strong, source, target, force_update). force_update=True bypasses
# the "kept if source still in display" verify gate — needed for the
# paren-cluster cases where the source string IS still present in the
# verse text (inside the parenthetical we want the alignment to parse
# word-by-word), but we still need the surface to be the bare cluster
# word so the alignment can fire.
REMAP_RULES: list[tuple[str, str, str, bool]] = [
    # Yahuah Tseva'ot (LORD of hosts) — Hebrew Strong's H6635. The
    # cluster's parenContents-vs-surface match needs surface 'hosts'
    # to match paren content 'hosts'; the leading 'of ' in the USFX
    # multi-word surface breaks the comparison. After update both
    # Hebrew tokens (Yahuah → LORD H3068, Tseva'ot → hosts H6635)
    # align correctly with their semantic Strong's numbers. force=True
    # because 'of hosts' IS still in the display (inside the paren)
    # but we still want to update.
    ("H6635", "of hosts", "hosts", True),

    # S161 Part 1.7 — Ruach HaKodesh (Holy Spirit) cluster.
    # Display has 'Ruach HaKodesh (Holy Spirit)' per Sacred Names
    # Convention; USFX has 'Ghost' (G4151) and 'the Holy' (G0040) /
    # 'Holy' (G0040). Updating surfaces so:
    #   - 'Ghost' (G4151) → 'Spirit' — matches paren content 'spirit'
    #   - 'the Holy' (G0040) → 'Holy' — matches paren content 'holy'
    # Combined with Part 2.2's Hebrew-aware reorder, both Hebrew
    # tokens get correctly-attributed superscripts: Ruach → G4151
    # (Spirit), HaKodesh → G0040 (Holy).
    ("G4151", "Ghost",    "Spirit", True),
    ("G0040", "the Holy", "Holy",   True),
]


def whole_word_present(needle: str, hay: str) -> bool:
    """Whole-word case-insensitive match. Multi-word needles collapse
    interior whitespace to \\s+ for resilience to display variants."""
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
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--no-confirm", action="store_true")
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
        rule_summaries: list[tuple[str, str, str, int, int, int]] = []
        # (strong, source_surface, target_surface, candidates, will_update, kept)

        all_updates: list[tuple[int, str]] = []

        for strong, src_surface, tgt_surface, force_update in REMAP_RULES:
            rows = await conn.fetch(
                """
                SELECT vw.id     AS vw_id,
                       vw.surface AS surface,
                       v.text    AS verse_text,
                       b.slug    AS book_slug,
                       c.chapter_number AS chapter,
                       v.verse_number AS verse_n
                  FROM verse_words vw
                  JOIN verses   v ON v.id = vw.verse_id
                  JOIN chapters c ON c.id = v.chapter_id
                  JOIN books    b ON b.id = c.book_id
                  JOIN editions e ON e.id = b.edition_id
                 WHERE e.slug = 'canon'
                   AND vw.strong_number = $1
                   AND vw.surface = $2
                """,
                strong,
                src_surface,
            )
            will_update = 0
            kept = 0
            for r in rows:
                verse_text = r["verse_text"] or ""
                if not force_update and whole_word_present(src_surface, verse_text):
                    # The original surface is still in the display
                    # (the Sacred Names override didn't fire here) —
                    # leave it alone.
                    kept += 1
                    continue
                if whole_word_present(tgt_surface, verse_text):
                    will_update += 1
                    all_updates.append((r["vw_id"], tgt_surface))
            rule_summaries.append((
                strong, src_surface, tgt_surface,
                len(rows), will_update, kept
            ))

        print()
        print("==> plan")
        print(f"  {'STRONG':<7} {'SOURCE':<14} → {'TARGET':<10}  "
              f"{'CANDIDATES':>10} {'WILL UPDATE':>11} {'KEPT':>6}")
        for strong, src, tgt, total, upd, kept in rule_summaries:
            print(f"  {strong:<7} {src!r:<14} → {tgt!r:<10}  "
                  f"{total:>10} {upd:>11} {kept:>6}")
        total_updates = sum(s[4] for s in rule_summaries)
        print()
        print(f"  TOTAL UPDATES PLANNED: {total_updates:,}")

        if args.dry_run:
            print()
            print("Dry-run complete; no UPDATEs issued.")
            return 0

        if total_updates == 0:
            print()
            print("No updates to apply.")
            return 0

        if not args.no_confirm:
            print()
            ans = input(
                f"Apply {total_updates:,} UPDATE statements? [y/N] "
            ).strip().lower()
            if ans not in {"y", "yes"}:
                print("Aborted.")
                return 1

        print()
        print("==> applying updates ...")
        BATCH = 1000
        applied = 0
        async with conn.transaction():
            for i in range(0, len(all_updates), BATCH):
                chunk = all_updates[i : i + BATCH]
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
