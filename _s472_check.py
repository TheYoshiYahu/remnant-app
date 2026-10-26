#!/usr/bin/env python3
"""S472 read-back: confirm the people & places tables landed as built."""
import asyncio, json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent / "api"))
from apply_migration import load_database_url
import asyncpg

async def main():
    url = load_database_url()
    c = await asyncpg.connect(url, ssl=None if "sslmode" in url else "require")
    d = json.load(open(Path(__file__).parent / "people-places/people_places.json"))
    want_e = len(d["people"]) + len(d["places"])
    want_l = len(d["links"])
    want_r = sum(len(x["refs"]) for x in d["people"] + d["places"])
    e = await c.fetchval("SELECT count(*) FROM pp_entities")
    l = await c.fetchval("SELECT count(*) FROM pp_links")
    r = await c.fetchval("SELECT count(*) FROM pp_refs")
    print(f"entries {e}/{want_e}, family links {l}/{want_l}, verse rows {r}/{want_r}")
    rows = await c.fetch("SELECT e.name FROM pp_refs r JOIN pp_entities e USING (slug) "
                         "WHERE book_slug='genesis' AND chapter=5 AND verse=3 ORDER BY e.name")
    print("Genesis 5:3 names:", ", ".join(x["name"] for x in rows), "(expect Adam, Seth)")
    j = await c.fetchval("SELECT count(*) FROM pp_links WHERE slug='jesus-isa-7-14-rev' AND other='joseph-mat-1-16-jhn'")
    print("Joseph drawn as father of Yahusha:", j, "(expect 0)")
    b = await c.fetchval("SELECT count(*) FROM pp_entities WHERE blurb IS NOT NULL")
    print("blurbs loaded:", b, "(expect 0 until Yoshi approves some)")
    await c.close()
    ok = (e, l, r) == (want_e, want_l, want_r) and j == 0
    print("ALL GOOD" if ok else "MISMATCH — tell Claude")

asyncio.run(main())
