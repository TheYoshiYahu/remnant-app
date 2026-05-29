#!/usr/bin/env python3
"""
Session 162 — Assemble lexicon_callouts V1 migration.

Reads the 34 author-approved callout drafts from
`_scratch/lexicon-callouts-DRAFTS/*.md`, parses each one's YAML
frontmatter + markdown body, and emits the bulk INSERT migration at
`data-schema/migrations/session162_lexicon_callouts_v1.sql`.

The migration FKs to `strong_entries(strong_number)` and is gated on
the `lexicon_callouts` table existing — i.e., it must run AFTER
`session162_lexicon_tables.sql`.

Each draft file is named `{STRONG}_{term}.md` (e.g. H8451_torah.md).
Frontmatter shape (verified across all 34 drafts at S162):

    ---
    strong_number: H8451
    term_display: torah
    gloss_error_summary: Lexicons gloss law / burden / system of statutes
    red_lines_cited: ["4", "5"]
    authored_by: claude-under-voice-skill-load[-framework-deep]
    session: S160|S162
    status: draft-awaiting-yoshi-review
    ---

Body is the markdown after the frontmatter (no further parsing — we
store the markdown verbatim in `lexicon_callouts.body_md` per the
DESIGN_LANGUAGE.md §26 schema).

Run:
  cd ~/Desktop/App
  python3 restoration-pipeline/_session162_assemble_lexicon_callouts_v1.py

  # then, after schema migration applies, from your terminal:
  psql "$DATABASE_URL" -f data-schema/migrations/session162_lexicon_callouts_v1.sql
"""

from __future__ import annotations

import re
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DRAFTS_DIR = ROOT / "_scratch" / "lexicon-callouts-DRAFTS"
OUT_PATH = ROOT / "data-schema" / "migrations" / "session162_lexicon_callouts_v1.sql"


FRONTMATTER_RE = re.compile(r"^---\s*\n(.*?)\n---\s*\n(.*)$", re.DOTALL)


def parse_frontmatter(text: str) -> tuple[dict, str]:
    """Lightweight YAML parser tuned to the callout frontmatter shape.
    Returns (frontmatter_dict, body_markdown). Body is the prose after
    the closing --- with leading/trailing whitespace stripped."""
    m = FRONTMATTER_RE.match(text)
    if not m:
        raise ValueError("missing or malformed frontmatter")
    fm_text, body = m.group(1), m.group(2)

    fm: dict = {}
    for line in fm_text.splitlines():
        line = line.rstrip()
        if not line or line.lstrip().startswith("#"):
            continue
        if ":" not in line:
            continue
        key, _, val = line.partition(":")
        key = key.strip()
        val = val.strip()
        if val.startswith("[") and val.endswith("]"):
            # red_lines_cited: ["4", "5"]
            inside = val[1:-1].strip()
            if not inside:
                fm[key] = []
            else:
                parts = [p.strip().strip('"').strip("'") for p in inside.split(",")]
                fm[key] = [p for p in parts if p]
        elif val.startswith('"') and val.endswith('"'):
            fm[key] = val[1:-1]
        elif val.startswith("'") and val.endswith("'"):
            fm[key] = val[1:-1]
        else:
            fm[key] = val
    return fm, body.strip()


def sql_escape(s: str) -> str:
    """PostgreSQL string-literal escape. Single quotes doubled; the
    rest of UTF-8 is fine as-is."""
    return s.replace("'", "''")


def sql_text_array(items: list[str]) -> str:
    """Render a Python list[str] as a Postgres TEXT[] literal:
        ARRAY['4','5']::TEXT[]"""
    if not items:
        return "ARRAY[]::TEXT[]"
    quoted = ",".join("'" + sql_escape(x) + "'" for x in items)
    return f"ARRAY[{quoted}]::TEXT[]"


def main() -> int:
    if not DRAFTS_DIR.is_dir():
        print(f"ERROR: drafts directory missing: {DRAFTS_DIR}", file=sys.stderr)
        return 2

    md_files = sorted(p for p in DRAFTS_DIR.iterdir() if p.suffix == ".md")
    if not md_files:
        print(f"ERROR: no .md drafts under {DRAFTS_DIR}", file=sys.stderr)
        return 3

    redraft_residual = [p.name for p in md_files if ".REDRAFT" in p.name]
    if redraft_residual:
        print(
            f"ERROR: residual .REDRAFT.md files present (expected to have been"
            f" mv'd over their canonical names): {redraft_residual}",
            file=sys.stderr,
        )
        return 4

    rows: list[dict] = []
    errors: list[str] = []
    for path in md_files:
        try:
            raw = path.read_text(encoding="utf-8")
            fm, body = parse_frontmatter(raw)
        except Exception as exc:
            errors.append(f"{path.name}: parse failed — {exc}")
            continue

        required = ("strong_number", "term_display", "gloss_error_summary", "red_lines_cited")
        missing = [k for k in required if not fm.get(k)]
        if missing:
            errors.append(f"{path.name}: missing required frontmatter keys: {missing}")
            continue
        if not body:
            errors.append(f"{path.name}: empty body")
            continue

        rows.append(
            {
                "strong_number": fm["strong_number"],
                "term_display": fm["term_display"],
                "gloss_error_summary": fm["gloss_error_summary"],
                "body_md": body,
                "red_lines_cited": fm["red_lines_cited"],
                "source_file": path.name,
                "authored_by": fm.get("authored_by", ""),
                "session": fm.get("session", ""),
            }
        )

    if errors:
        print("PARSE ERRORS:", file=sys.stderr)
        for err in errors:
            print(f"  • {err}", file=sys.stderr)
        return 5

    # Sort canonically: by strong_number (so the migration is
    # deterministic regardless of filesystem ordering).
    rows.sort(key=lambda r: r["strong_number"])

    # Sanity: every strong_number should be unique within the migration.
    seen: set[str] = set()
    dupes: list[str] = []
    for r in rows:
        if r["strong_number"] in seen:
            dupes.append(r["strong_number"])
        seen.add(r["strong_number"])
    if dupes:
        print(f"ERROR: duplicate strong_numbers in drafts: {dupes}", file=sys.stderr)
        return 6

    expected_count = len(rows)
    hebrew_count = sum(1 for r in rows if r["strong_number"].startswith("H"))
    greek_count = sum(1 for r in rows if r["strong_number"].startswith("G"))

    # ---------- emit migration ----------
    now_utc = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S+00")
    lines: list[str] = []
    lines.append(
        "-- session-162 — lexicon_callouts V1 (34 author-reviewed framework callouts)"
    )
    lines.append(
        "-- Phase 9.3. Spec: DESIGN_LANGUAGE.md §26. Voice-gate: outputs/S162_CALLOUT_REVIEW.md."
    )
    lines.append(
        "-- 0 Red Line violations in the set per the S162 voice-gate pass."
    )
    lines.append(
        f"-- {hebrew_count} Hebrew + {greek_count} Greek = {expected_count} rows."
    )
    lines.append(
        "-- DEPENDS ON: session162_lexicon_tables.sql (creates lexicon_callouts table)."
    )
    lines.append("--")
    lines.append("-- Re-runnable: each row uses ON CONFLICT (strong_number) DO UPDATE so the")
    lines.append("-- migration can be re-applied to update existing callouts without dropping.")
    lines.append("")
    lines.append("BEGIN;")
    lines.append("")

    for r in rows:
        lines.append(
            f"-- {r['source_file']}  ({r['authored_by']}, {r['session']})"
        )
        lines.append("INSERT INTO lexicon_callouts (")
        lines.append("    strong_number, term_display, gloss_error_summary,")
        lines.append("    body_md, red_lines_cited, last_reviewed_at")
        lines.append(") VALUES (")
        lines.append(f"    '{sql_escape(r['strong_number'])}',")
        lines.append(f"    '{sql_escape(r['term_display'])}',")
        lines.append(f"    '{sql_escape(r['gloss_error_summary'])}',")
        # Multi-line body — use dollar-quoting to avoid escape hell.
        # Tag-guard against any author body containing the literal
        # delimiter (vanishingly unlikely in markdown prose).
        delim = "$callout$"
        if delim in r["body_md"]:
            delim = "$callout162$"
            if delim in r["body_md"]:
                raise RuntimeError(
                    f"body of {r['source_file']} contains both standard dollar-quote"
                    f" delimiters; widen the delim or escape inline"
                )
        lines.append(f"    {delim}{r['body_md']}{delim},")
        lines.append(f"    {sql_text_array(r['red_lines_cited'])},")
        lines.append(f"    TIMESTAMP WITH TIME ZONE '{now_utc}'")
        lines.append(")")
        lines.append("ON CONFLICT (strong_number) DO UPDATE SET")
        lines.append("    term_display        = EXCLUDED.term_display,")
        lines.append("    gloss_error_summary = EXCLUDED.gloss_error_summary,")
        lines.append("    body_md             = EXCLUDED.body_md,")
        lines.append("    red_lines_cited     = EXCLUDED.red_lines_cited,")
        lines.append("    last_reviewed_at    = EXCLUDED.last_reviewed_at,")
        lines.append("    updated_at          = NOW();")
        lines.append("")

    # Verify block.
    lines.append("DO $verify$")
    lines.append("DECLARE")
    lines.append("    actual_count INTEGER;")
    lines.append("    hebrew_count INTEGER;")
    lines.append("    greek_count INTEGER;")
    lines.append("BEGIN")
    lines.append("    SELECT COUNT(*) INTO actual_count FROM lexicon_callouts;")
    lines.append(
        "    SELECT COUNT(*) INTO hebrew_count FROM lexicon_callouts WHERE strong_number LIKE 'H%';"
    )
    lines.append(
        "    SELECT COUNT(*) INTO greek_count  FROM lexicon_callouts WHERE strong_number LIKE 'G%';"
    )
    lines.append(f"    IF actual_count < {expected_count} THEN")
    lines.append(
        "        RAISE EXCEPTION 'S162 callout migration verify failed: % rows present, % expected',"
    )
    lines.append(f"                        actual_count, {expected_count};")
    lines.append("    END IF;")
    lines.append(f"    IF hebrew_count <> {hebrew_count} OR greek_count <> {greek_count} THEN")
    lines.append(
        f"        RAISE EXCEPTION 'S162 callout migration verify failed on hebrew/greek split: actual H=% G=%, expected H={hebrew_count} G={greek_count}',"
    )
    lines.append("                        hebrew_count, greek_count;")
    lines.append("    END IF;")
    lines.append(
        "    RAISE NOTICE 'S162 callout migration verified: % rows (% H + % G).',"
    )
    lines.append("                 actual_count, hebrew_count, greek_count;")
    lines.append("END")
    lines.append("$verify$;")
    lines.append("")
    lines.append("COMMIT;")
    lines.append("")

    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUT_PATH.write_text("\n".join(lines), encoding="utf-8")

    print(f"==> wrote {OUT_PATH.relative_to(ROOT)}")
    print(f"    {expected_count} rows ({hebrew_count} Hebrew + {greek_count} Greek)")
    print(f"    Re-runnable via ON CONFLICT (strong_number) DO UPDATE.")
    print()
    print("Apply (from your terminal, AFTER session162_lexicon_tables.sql applies):")
    print(f"  psql \"$DATABASE_URL\" -f {OUT_PATH.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
