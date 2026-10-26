#!/usr/bin/env python3
"""S473 read-back: confirm people & places + tribe & nation pages landed as built."""
import asyncio, json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent / "api"))
from apply_migration import load_database_url
import asyncpg

async def main():
    url = load_database_url()
    c = await asyncpg.connect(url, ssl=None if "sslmode" in url else "require")
    d = json.load(open(Path(__file__).parent / "people-places/people_places.json"))
    allr = d["people"] + d["places"] + d["groups"]
    want = (len(allr), len(d["links"]), sum(len(x["refs"]) for x in allr))
    got = (await c.fetchval("SELECT count(*) FROM pp_entities"),
           await c.fetchval("SELECT count(*) FROM pp_links"),
           await c.fetchval("SELECT count(*) FROM pp_refs"))
    print(f"entries {got[0]}/{want[0]}, links {got[1]}/{want[1]}, verse rows {got[2]}/{want[2]}")
    rows = await c.fetch("SELECT e.name FROM pp_refs r JOIN pp_entities e USING (slug) "
                         "WHERE book_slug='exodus' AND chapter=3 AND verse=10 ORDER BY e.name")
    print("Exodus 3:10 names:", ", ".join(x["name"] for x in rows), "(expect Yashar'el (Israel) among them)")
    t = await c.fetchval("SELECT count(*) FROM pp_entities WHERE kind='tribe'")
    print("tribe pages:", t, "(expect 14)")
    j = await c.fetchval("SELECT count(*) FROM pp_links WHERE slug='jesus-isa-7-14-rev' AND other='joseph-mat-1-16-jhn'")
    print("Joseph drawn as father of Yahusha:", j, "(expect 0)")
    g = await c.fetchval("SELECT count(*) FROM pp_refs WHERE slug='javan-gen-10-2-col' AND book_slug='romans'")
    print("Javan's page in Romans:", g, "(expect 0)")
    b = await c.fetchval("SELECT count(*) FROM pp_entities WHERE blurb IS NOT NULL")
    print("blurbs loaded:", b, "(expect 0 until Yoshi approves some)")
    await c.close()
    ok = got == want and t == 14 and j == 0 and g == 0
    print("ALL GOOD" if ok else "MISMATCH — tell Claude")

asyncio.run(main())
