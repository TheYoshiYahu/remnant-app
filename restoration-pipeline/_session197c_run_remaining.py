#!/usr/bin/env python3
"""S197c — finish the catch-up: load the lexicon (BDB/LSJ) + the S183/184/194
cross-reference threads into the database.

Ships in the API image so it can be run from the Render Web Shell with a single
short command (no long paste needed):

    python3 /restoration-pipeline/_session197c_run_remaining.py

Self-probing + idempotent:
  - creates the lexicon tables only if absent (session162 DDL has no IF NOT EXISTS),
  - loads session163 (32 MB) via a string/dollar-quote-aware splitter so the huge
    HTML-body INSERTs run in safe chunks (whole-file execute drops the connection),
  - loads the callouts + the three xref-thread files (all ON CONFLICT, re-runnable),
  - restamps schema_version to the latest applied migration.
Validated against a local pgserver in restoration-pipeline/_session197b_*.py.
"""
from __future__ import annotations
import asyncio, os, re, sys

BASE = "/data-schema/migrations/"


def split_sql(sql: str) -> list[str]:
    out: list[str] = []
    buf: list[str] = []
    i, N = 0, len(sql)
    in_str = False
    dollar = None
    while i < N:
        ch = sql[i]
        if in_str:
            buf.append(ch)
            if ch == "'":
                if i + 1 < N and sql[i + 1] == "'":
                    buf.append("'"); i += 2; continue
                in_str = False
            i += 1; continue
        if dollar:
            if sql.startswith(dollar, i):
                buf.append(dollar); i += len(dollar); dollar = None; continue
            buf.append(ch); i += 1; continue
        if ch == "-" and i + 1 < N and sql[i + 1] == "-":
            j = sql.find("\n", i); i = (N if j == -1 else j); continue
        if ch == "'":
            in_str = True; buf.append(ch); i += 1; continue
        if ch == "$":
            m = re.match(r"\$[A-Za-z0-9_]*\$", sql[i:])
            if m:
                dollar = m.group(0); buf.append(dollar); i += len(dollar); continue
        if ch == ";":
            s = "".join(buf).strip()
            if s and s.upper() not in ("BEGIN", "COMMIT"):
                out.append(s)
            buf = []; i += 1; continue
        buf.append(ch); i += 1
    s = "".join(buf).strip()
    if s and s.upper() not in ("BEGIN", "COMMIT"):
        out.append(s)
    return out


async def run_split(conn, f):
    stmts = split_sql(open(BASE + f).read())
    n = len(stmts)
    print(f"=== {f}  ({n} chunks) ===")
    for i, s in enumerate(stmts, 1):
        await conn.execute(s)
        if i % 10 == 0 or i == n:
            print(f"   {i}/{n}")


async def main():
    import asyncpg
    url = os.environ.get("DATABASE_URL")
    if not url:
        sys.path.insert(0, "/app")
        from config import settings
        url = settings.database_url
    conn = await asyncpg.connect(url, command_timeout=1800)
    conn.add_log_listener(lambda c, m: print("   ", getattr(m, "message", m)))

    # ---- Lexicon (BDB / LSJ) ----
    if await conn.fetchval("SELECT to_regclass('public.lexicon_entries')") is None:
        print(">> lexicon tables absent — creating")
        await run_split(conn, "session162_lexicon_tables.sql")
    else:
        print(">> lexicon tables already present — skipping create")
    await run_split(conn, "session163_lexicon_entries_load.sql")
    await run_split(conn, "session162_lexicon_callouts_v1.sql")

    # ---- Cross-reference threads (idempotent; atomic per file) ----
    for f in [
        "session183_mark_xref_members_and_threads.sql",
        "session184_right_hand_face_east_xref_threads.sql",
        "session194_john_2_7_9_16_xref_threads.sql",
    ]:
        try:
            await conn.execute(open(BASE + f).read())
            print(f"=== {f}: OK")
        except Exception as e:
            print(f"!! {f} FAILED: {type(e).__name__}: {str(e)[:200]}")

    # ---- keep the version stamp at the latest applied migration ----
    await conn.execute(
        "UPDATE schema_version SET version='1.0.0-phase-sessionB-session196', "
        "landed_at=now() WHERE id=1"
    )

    for label, q in [
        ("lexicon_entries", "SELECT count(*) FROM lexicon_entries"),
        ("lexicon_callouts", "SELECT count(*) FROM lexicon_callouts"),
        ("cross_reference_threads", "SELECT count(*) FROM cross_reference_threads"),
        ("cross_reference_thread_members", "SELECT count(*) FROM cross_reference_thread_members"),
    ]:
        try:
            print(f"   {label} =", await conn.fetchval(q))
        except Exception as e:
            print(f"   {label}: {e}")
    await conn.close()
    print("DONE")


if __name__ == "__main__":
    asyncio.get_event_loop().run_until_complete(main())
