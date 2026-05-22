#!/usr/bin/env python3
"""
Session 112 — Matthew tiered commentary loader.

Reads ~/Desktop/App/commentaries/matthew-N-short.md and matthew-N.md for
N=1..28 and writes one commentary_entries row per (chapter, surface_kind)
into Postgres:

  - matthew-N-short.md  → surface_kind='inline',    tier_required='extras'
  - matthew-N.md        → surface_kind='deep_dive', tier_required='extras'

Per Yoshi's tier call (Session 112): both deeper commentary layers gate at
the $4.99 'extras' (Library) tier in v1 — the partner who pays for the
Library tier gets the framework's full reading on the canon as part of the
deal. Migrate the gate up to 'complete_study' later when that V2 tier
ships, if the framework-depth tier evolves into something distinct.

Why two surface_kind values: 'inline' renders directly under the chapter
verses (the Short layer); 'deep_dive' renders behind a 'Read deeper'
expander (the Deep layer). The free-tier chapter_intro (loaded at S110)
stays on chapters.chapter_intro and renders at the top of the commentary
stack — it is NOT a commentary_entries row.

Parsing rules (validated across all 28 of each file at S112 open):

  short.md:
    - Line 1 is '# Short-form commentary on Matthew {N}'
    - Strip the H1 + any immediately-following blank lines
    - Keep everything else as-is (chapters 23-28 have ## sub-sections;
      chapters 1-22 are continuous prose with no internal headings)

  matthew-N.md:
    - Line 1 is '# Commentary on Matthew {N}'
    - Strip the H1 + any immediately-following blank lines
    - Cut everything from the line matching
      '## §?<num>. Cross-[Rr]eference [Aa]pparatus' onward (the apparatus
      section + any '## Standing chapter-level position' trailer). The
      cross-reference data is already in the DB via cross_references +
      cross_reference_threads (Session 110/111 ship); duplicating it in
      the commentary body would render the same content twice.

Modes:

  --dry-run    Parse files + print summary; touch nothing.
  --no-confirm Skip the final apply-confirmation prompt.
  (default)    Apply with a confirmation prompt.

Run (paths are absolute — works from anywhere):

  # Dry-run, see what would change:
  python3 _session112_load_matthew_tiered_commentary.py --dry-run

  # Apply against local Postgres:
  DATABASE_URL=postgres://localhost/remnant_app \\
    python3 _session112_load_matthew_tiered_commentary.py

  # Apply against prod (after local verification):
  DATABASE_URL=<render-postgres-external-url> \\
    python3 _session112_load_matthew_tiered_commentary.py --no-confirm

Idempotent. Re-running has no effect once each (chapter, surface_kind)
row matches its source file body.
"""

from __future__ import annotations

import argparse
import asyncio
import os
import re
import sys
from pathlib import Path

# Paths are computed relative to this script's location (restoration-pipeline/
# lives at APP_ROOT/restoration-pipeline). Override with APP_ROOT in the env
# if the layout ever changes.
APP_ROOT = Path(os.environ.get("APP_ROOT") or Path(__file__).resolve().parent.parent)
COMMENTARIES_DIR = APP_ROOT / "commentaries"

MATTHEW_CHAPTERS = list(range(1, 29))  # 1..28 inclusive

# Per Yoshi (S112, S112 correction): tier-mapping uses a graduated reveal
# across the v1 ladder so each paid tier earns its keep on the chapter
# reading surface.
#   - free  → chapter_intro (already loaded at S110)
#   - $1.99 Notes  → Basic (this loader, surface_kind='inline')
#   - $4.99 Library → Deeper Dive (this loader, surface_kind='deep_dive')
# The Notes tier gets the chapter-length framework walk (substantial — 2k-
# 12k words per chapter) on top of its highlights + colors + notes
# capabilities. The Library tier adds the section-by-section Deeper Dive
# (also substantial) on top of the full ~50-book extras library + the
# BDB / Thayer's / Gesenius tools + Josephus. Library inherits Notes via
# the strict-chain lattice, so Library partners get both layers.
SHORT_TIER = "study_notes"
DEEP_TIER = "extras"

# Header / cut-point patterns.
SHORT_H1_RE = re.compile(r"^#\s+Short-form commentary on Matthew\s+\d+\s*$")
DEEP_H1_RE = re.compile(r"^#\s+Commentary on Matthew\s+\d+\s*$")
# Matches the Cross-Reference Apparatus section header in either capitalization
# and with or without the '§' marker (matt-17 onward uses lowercase 'cross-
# reference apparatus'; matt-1..16 uses capitalized 'Cross-Reference').
APPARATUS_CUT_RE = re.compile(
    r"^##\s+§?\d+\.?\s*Cross-[Rr]eference\s+[Aa]pparatus\s*$"
)


def _strip_h1_and_blank(lines: list[str], h1_re: re.Pattern, path: Path) -> list[str]:
    """Return lines after the H1 + any immediately-following blank lines."""
    if not lines:
        raise ValueError(f"empty file: {path}")
    if not h1_re.match(lines[0]):
        raise ValueError(
            f"{path}: line 1 did not match expected H1 pattern; got: {lines[0]!r}"
        )
    body_start = 1
    while body_start < len(lines) and lines[body_start].strip() == "":
        body_start += 1
    return lines[body_start:]


def read_short_body(chapter_number: int) -> str:
    """Read matthew-N-short.md, strip H1, return body string (trailing newline)."""
    path = COMMENTARIES_DIR / f"matthew-{chapter_number}-short.md"
    if not path.is_file():
        raise FileNotFoundError(f"missing short.md for chapter {chapter_number}: {path}")
    lines = path.read_text(encoding="utf-8").splitlines()
    body_lines = _strip_h1_and_blank(lines, SHORT_H1_RE, path)
    body = "\n".join(body_lines).rstrip() + "\n"
    if not body.strip():
        raise ValueError(f"{path}: body is empty after stripping header")
    return body


def read_deep_body(chapter_number: int) -> str:
    """Read matthew-N.md, strip H1, cut at apparatus section, return body."""
    path = COMMENTARIES_DIR / f"matthew-{chapter_number}.md"
    if not path.is_file():
        raise FileNotFoundError(f"missing deep .md for chapter {chapter_number}: {path}")
    lines = path.read_text(encoding="utf-8").splitlines()
    body_lines = _strip_h1_and_blank(lines, DEEP_H1_RE, path)

    # Cut at the apparatus section. Validate it exists (every chapter has one).
    cut_idx = None
    for i, line in enumerate(body_lines):
        if APPARATUS_CUT_RE.match(line):
            cut_idx = i
            break
    if cut_idx is None:
        raise ValueError(
            f"{path}: expected '## §N. Cross-[Rr]eference [Aa]pparatus' cut "
            f"point not found"
        )
    body_lines = body_lines[:cut_idx]
    # Trim trailing blank lines AND trailing markdown horizontal rules
    # ('---'). Most chapters carry a `---` separator immediately before the
    # apparatus header to visually divide the prose from the apparatus;
    # once the apparatus is cut, that separator becomes meaningless and
    # would render as a stray horizontal rule at the end of the body.
    while body_lines and (
        body_lines[-1].strip() == "" or body_lines[-1].strip() == "---"
    ):
        body_lines.pop()
    body = "\n".join(body_lines).rstrip() + "\n"
    if not body.strip():
        raise ValueError(f"{path}: body is empty after stripping header + apparatus cut")
    return body


def load_all_bodies() -> dict[int, dict[str, str]]:
    """Read all 28 short + deep bodies; return {N: {'short': body, 'deep': body}}."""
    out: dict[int, dict[str, str]] = {}
    for n in MATTHEW_CHAPTERS:
        out[n] = {
            "short": read_short_body(n),
            "deep": read_deep_body(n),
        }
    return out


async def plan_and_apply(
    bodies: dict[int, dict[str, str]],
    database_url: str,
    *,
    dry_run: bool,
) -> dict[int, dict[str, str]]:
    """
    Plan + optionally apply commentary_entries writes for all 28 chapters.

    Returns {N: {'short': status, 'deep': status}} where status is one of:
      'inserted'   - row did not exist; INSERT planned/run
      'updated'    - row existed with different body; UPDATE planned/run
      'unchanged'  - row exists with matching body; no-op
      'not_found'  - the (canon, matthew, N) chapter row doesn't exist;
                     run seed.py --bootstrap first.
    """
    import asyncpg
    import ssl as ssl_lib
    from urllib.parse import urlparse, unquote

    # Render's external Postgres requires SSL/TLS for connections from
    # outside Render's internal network. The simple ssl='require' string
    # AND the SSLContext path both sometimes negotiate an SSL handshake
    # the Render endpoint rejects mid-stream — and asyncpg's URL parser
    # can also choke on URL-encoded special characters in the password
    # field that Render generates on credential rotation. The reliable
    # path is to parse the URL ourselves and pass components individually
    # to asyncpg.connect(), bypassing the URL parser entirely. Plus a
    # longer connect timeout — Render's external endpoint sometimes
    # takes 5-10s on first connection from a new IP.
    ssl_ctx = ssl_lib.create_default_context()
    ssl_ctx.check_hostname = False
    ssl_ctx.verify_mode = ssl_lib.CERT_NONE

    parsed = urlparse(database_url)
    conn = await asyncpg.connect(
        host=parsed.hostname,
        port=parsed.port or 5432,
        user=unquote(parsed.username) if parsed.username else None,
        password=unquote(parsed.password) if parsed.password else None,
        database=parsed.path.lstrip('/') if parsed.path else None,
        ssl=ssl_ctx,
        timeout=30,
    )
    try:
        status: dict[int, dict[str, str]] = {n: {} for n in MATTHEW_CHAPTERS}
        for n in MATTHEW_CHAPTERS:
            chapter_row = await conn.fetchrow(
                """
                SELECT c.id AS chapter_id
                  FROM chapters c
                  JOIN books    b ON b.id = c.book_id
                  JOIN editions e ON e.id = b.edition_id
                 WHERE e.slug = 'canon'
                   AND b.slug = 'matthew'
                   AND c.chapter_number = $1
                """,
                n,
            )
            if chapter_row is None:
                status[n]["short"] = "not_found"
                status[n]["deep"] = "not_found"
                continue
            chapter_id = chapter_row["chapter_id"]

            for surface_kind, body_key, tier in (
                ("inline", "short", SHORT_TIER),
                ("deep_dive", "deep", DEEP_TIER),
            ):
                target_body = bodies[n][body_key]
                # The schema allows multiple commentary_entries per
                # (chapter_id, surface_kind) tuple, but THIS loader writes
                # a single chapter-scoped row per surface (verse_id IS NULL,
                # concept_id IS NULL). We identify the row by
                # (chapter_id, surface_kind, verse_id IS NULL, concept_id IS NULL).
                existing = await conn.fetchrow(
                    """
                    SELECT id, body, tier_required::text AS tier
                      FROM commentary_entries
                     WHERE chapter_id = $1
                       AND surface_kind = $2
                       AND verse_id IS NULL
                       AND concept_id IS NULL
                    """,
                    chapter_id, surface_kind,
                )
                # Labels locked S112: "Basic" / "Deeper Dive" — the partner-
                # facing headers under the chapter (sit below the free
                # "Commentary" intro, above the "Tanakh Sources for [chapter]"
                # cross-reference apparatus). Renames here update both the
                # title column and the partner-facing header in one place.
                title = "Basic" if surface_kind == "inline" else "Deeper Dive"

                if existing is None:
                    if not dry_run:
                        await conn.execute(
                            """
                            INSERT INTO commentary_entries
                                (chapter_id, verse_id, concept_id, title, body,
                                 surface_kind, tier_required)
                            VALUES ($1, NULL, NULL, $2, $3, $4, $5::content_tier)
                            """,
                            chapter_id, title, target_body, surface_kind, tier,
                        )
                    status[n][body_key] = "inserted"
                elif (
                    (existing["body"] or "") == target_body
                    and existing["tier"] == tier
                ):
                    status[n][body_key] = "unchanged"
                else:
                    if not dry_run:
                        await conn.execute(
                            """
                            UPDATE commentary_entries
                               SET title = $1,
                                   body = $2,
                                   tier_required = $3::content_tier,
                                   updated_at = now()
                             WHERE id = $4
                            """,
                            title, target_body, tier, existing["id"],
                        )
                    status[n][body_key] = "updated"
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
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument("--dry-run", action="store_true",
                    help="Parse files + print summary; touch nothing.")
    ap.add_argument("--no-confirm", action="store_true",
                    help="Skip the apply-confirmation prompt.")
    args = ap.parse_args()

    # Step 1 — parse all files.
    bodies = load_all_bodies()
    print(f"Loaded {len(bodies) * 2} commentary bodies "
          f"({len(bodies)} short + {len(bodies)} deep). Word counts:")
    print(f"  {'chapter':>10}  {'short':>8}  {'deep':>8}")
    short_total = 0
    deep_total = 0
    for n in MATTHEW_CHAPTERS:
        sw = len(bodies[n]["short"].split())
        dw = len(bodies[n]["deep"].split())
        short_total += sw
        deep_total += dw
        print(f"  matt-{n:02d}    {sw:>8}  {dw:>8}")
    print(f"  {'TOTAL':>10}  {short_total:>8}  {deep_total:>8}")
    print()

    # Step 2 — DB plan.
    database_url = os.environ.get("DATABASE_URL", "")
    if not database_url:
        print("error: DATABASE_URL is not set", file=sys.stderr)
        return 2

    status = asyncio.run(plan_and_apply(bodies, database_url, dry_run=True))

    def tally(key: str) -> dict[str, int]:
        out = {"inserted": 0, "updated": 0, "unchanged": 0, "not_found": 0}
        for n in MATTHEW_CHAPTERS:
            s = status[n].get(key, "not_found")
            out[s] = out.get(s, 0) + 1
        return out

    short_t = tally("short")
    deep_t = tally("deep")
    print("Plan against current DB:")
    print(f"  SHORT  (surface_kind='inline',    tier={SHORT_TIER!r}):  "
          f"insert={short_t['inserted']}  update={short_t['updated']}  "
          f"unchanged={short_t['unchanged']}  not_found={short_t['not_found']}")
    print(f"  DEEP   (surface_kind='deep_dive', tier={DEEP_TIER!r}):   "
          f"insert={deep_t['inserted']}  update={deep_t['updated']}  "
          f"unchanged={deep_t['unchanged']}  not_found={deep_t['not_found']}")
    if short_t["not_found"] or deep_t["not_found"]:
        print("  → 'not_found' means the Matthew chapter row doesn't exist in the "
              "target DB. If this is a fresh DB, run seed.py --bootstrap first.")
    print()

    total_writes = (
        short_t["inserted"] + short_t["updated"]
        + deep_t["inserted"] + deep_t["updated"]
    )

    if args.dry_run:
        print(f"--dry-run: not writing anything ({total_writes} writes planned).")
        return 0

    if total_writes == 0:
        print("Nothing to do — every row already matches its source file.")
        return 0

    if not args.no_confirm:
        if not confirm(f"Apply {total_writes} write(s) to Postgres? [y/N]"):
            print("aborted.")
            return 1

    # Step 3 — apply.
    status = asyncio.run(plan_and_apply(bodies, database_url, dry_run=False))
    short_t = tally("short")
    deep_t = tally("deep")
    print(f"done. SHORT inserts={short_t['inserted']} updates={short_t['updated']}; "
          f"DEEP inserts={deep_t['inserted']} updates={deep_t['updated']}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
