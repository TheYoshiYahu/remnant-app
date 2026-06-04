#!/usr/bin/env python3
"""S197b — validate the string/dollar-quote-aware SQL splitter by actually
executing the 32 MB session163 lexicon load against a local pgserver.

The lexicon_entries FK targets strong_entries(strong_number); we stub a minimal
strong_entries populated with every strong_number the lexicon files reference,
plus a stub schema_version (the S162 DDL UPDATEs it). Then we run S162 tables
(whole) → S163 entries (split) → S162 callouts (split) and assert row counts.
This proves the exact splitter we hand to the Render Shell is correct on the
real files.
"""
from __future__ import annotations
import re, sys, tempfile, pathlib
import pgserver, asyncio, asyncpg

REPO = pathlib.Path(__file__).resolve().parent.parent
MIG = REPO / "data-schema" / "migrations"


def split_sql(sql: str) -> list[str]:
    """Split into statements, respecting single-quote strings (with '' escapes),
    $tag$ dollar-quoting, and -- line comments. Strips BEGIN/COMMIT."""
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
        # not in string / dollar
        if ch == "-" and i + 1 < N and sql[i + 1] == "-":
            j = sql.find("\n", i)
            if j == -1:
                break
            i = j; continue  # skip the comment (leave the newline)
        if ch == "'":
            in_str = True; buf.append(ch); i += 1; continue
        if ch == "$":
            m = re.match(r"\$[A-Za-z0-9_]*\$", sql[i:])
            if m:
                dollar = m.group(0); buf.append(dollar); i += len(dollar); continue
        if ch == ";":
            stmt = "".join(buf).strip()
            if stmt and stmt.upper() not in ("BEGIN", "COMMIT"):
                out.append(stmt)
            buf = []; i += 1; continue
        buf.append(ch); i += 1
    tail = "".join(buf).strip()
    if tail and tail.upper() not in ("BEGIN", "COMMIT"):
        out.append(tail)
    return out


def referenced_strongs() -> set[str]:
    """Pull every strong_number the lexicon files reference (2nd VALUES col)."""
    nums: set[str] = set()
    for f in ("session163_lexicon_entries_load.sql", "session162_lexicon_callouts_v1.sql"):
        txt = (MIG / f).read_text()
        # rows look like: ('bdb', 'H5034', ...  OR ('H0430', ... for callouts
        for m in re.finditer(r"\(\s*'(?:bdb|lsj|gesenius)'\s*,\s*'([HG]\d+[A-Za-z]?)'", txt):
            nums.add(m.group(1))
        for m in re.finditer(r"^\s*\(\s*'([HG]\d+[A-Za-z]?)'\s*,", txt, flags=re.M):
            nums.add(m.group(1))
    return nums


async def run():
    tmp = tempfile.mkdtemp(prefix="pglex_")
    db = pgserver.get_server(tmp)
    uri = db.get_uri()
    try:
        c = await asyncpg.connect(uri)
        # stub prerequisites
        await c.execute("CREATE TABLE strong_entries (strong_number TEXT PRIMARY KEY);")
        nums = referenced_strongs()
        await c.executemany("INSERT INTO strong_entries(strong_number) VALUES($1) ON CONFLICT DO NOTHING",
                            [(n,) for n in nums])
        await c.execute("CREATE TABLE schema_version (id INT PRIMARY KEY DEFAULT 1 CHECK(id=1), version TEXT, landed_at TIMESTAMPTZ DEFAULT now(), notes TEXT);")
        await c.execute("INSERT INTO schema_version(id,version) VALUES(1,'stub');")
        print(f"stub strong_entries rows: {len(nums)}")

        for f in ["session162_lexicon_tables.sql",
                  "session163_lexicon_entries_load.sql",
                  "session162_lexicon_callouts_v1.sql"]:
            stmts = split_sql((MIG / f).read_text())
            for s in stmts:
                await c.execute(s)
            print(f"{f}: {len(stmts)} statements OK")

        ne = await c.fetchval("SELECT count(*) FROM lexicon_entries")
        nc = await c.fetchval("SELECT count(*) FROM lexicon_callouts")
        print(f"lexicon_entries = {ne}  | lexicon_callouts = {nc}")
        assert ne > 1000, f"too few lexicon_entries: {ne}"
        assert nc >= 30, f"too few callouts: {nc}"
        await c.close()
        print("LEXICON RUNNER VALIDATED")
    finally:
        db.cleanup()


if __name__ == "__main__":
    asyncio.get_event_loop().run_until_complete(run())
