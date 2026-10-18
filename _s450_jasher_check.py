#!/usr/bin/env python3
"""S450 — READ-ONLY check of the live DB after _session450_jasher_deploy.sh.
Run:  python3 ~/Desktop/App/_s450_jasher_check.py
Prints: Jasher verse rows (expect 3910), chapters 7/9/20 counts (51/39/30),
a title that was truncated, the 12:35 text, every card still on 7:18 / 9:7 / 20:13
(expect one: Joshua 24:2 on 9:7), and the 7 thread anchors."""
import asyncio, os, re, sys
from pathlib import Path
try:
    import asyncpg
except ImportError:
    sys.exit("pip3 install asyncpg --break-system-packages")
APP = Path(__file__).resolve().parent
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (APP / "api/.env").read_text())
    url = m.group(1).strip().strip("'\"")
J = """FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id AND b.slug='jasher'
       JOIN editions e ON e.id=b.edition_id AND e.slug='jasher'"""
async def main():
    con = await asyncpg.connect(url)
    n = await con.fetchval(f"SELECT count(*) {J}")
    print(f"Jasher verse rows: {n}   (expect 3910)")
    rows = await con.fetch(f"SELECT c.chapter_number ch, count(*) n, max(v.verse_number) hi {J} WHERE c.chapter_number IN (7,9,20) GROUP BY 1 ORDER BY 1")
    print("chapters 7/9/20:", "  ".join(f"{r['ch']}: {r['n']} rows, last verse {r['hi']}" for r in rows), "  (expect 51 / 39 / 30)")
    t = await con.fetchval("SELECT c.chapter_title FROM chapters c JOIN books b ON b.id=c.book_id AND b.slug='jasher' JOIN editions e ON e.id=b.edition_id AND e.slug='jasher' WHERE c.chapter_number=1")
    print("ch 1 title:", t)
    v = await con.fetchval(f"SELECT v.text {J} WHERE c.chapter_number=12 AND v.verse_number=35")
    print("12:35:", v[:90])
    v = await con.fetchval(f"SELECT left(v.text,80) {J} WHERE c.chapter_number=7 AND v.verse_number=19")
    print("7:19:", v)
    print("\ncards still sourced on the former blob verses (expect 1 — Joshua 24:2 on 9:7):")
    rows = await con.fetch("""
        SELECT x.id, sc.chapter_number sch, sv.verse_number svn, te.slug tes, tb.slug tbs, tc.chapter_number tch, tv.verse_number tvn, left(coalesce(x.note,''),80) note
          FROM cross_references x
          JOIN verses sv ON sv.id=x.source_verse_id JOIN chapters sc ON sc.id=sv.chapter_id JOIN books sb ON sb.id=sc.book_id AND sb.slug='jasher'
          JOIN editions se ON se.id=sb.edition_id AND se.slug='jasher'
          JOIN verses tv ON tv.id=x.target_verse_id JOIN chapters tc ON tc.id=tv.chapter_id JOIN books tb ON tb.id=tc.book_id JOIN editions te ON te.id=tb.edition_id
         WHERE (sc.chapter_number, sv.verse_number) IN ((7,18),(9,7),(20,13)) ORDER BY 2,3,1""")
    for r in rows: print(f"  card {r['id']}  Jasher {r['sch']}:{r['svn']} -> {r['tes']}/{r['tbs']} {r['tch']}:{r['tvn']} | {r['note']}")
    print(f"  total: {len(rows)}")
    print("\ncards now on the destination verses (expect 20 moved):")
    rows = await con.fetch("""
        SELECT sc.chapter_number sch, sv.verse_number svn, count(*) n
          FROM cross_references x JOIN verses sv ON sv.id=x.source_verse_id JOIN chapters sc ON sc.id=sv.chapter_id
          JOIN books sb ON sb.id=sc.book_id AND sb.slug='jasher' JOIN editions se ON se.id=sb.edition_id AND se.slug='jasher'
         WHERE (sc.chapter_number, sv.verse_number) IN ((7,19),(7,25),(7,30),(7,42),(7,43),(7,44),(7,46),(7,51),(9,19),(20,14),(20,21),(20,24),(20,30))
         GROUP BY 1,2 ORDER BY 1,2""")
    print("  " + "  ".join(f"{r['sch']}:{r['svn']}={r['n']}" for r in rows), f"  total {sum(r['n'] for r in rows)}")
    print("\nthread anchors:")
    rows = await con.fetch("""
        SELECT t.slug, sc.chapter_number sch, sv.verse_number svn, ec.chapter_number ech, ev.verse_number evn
          FROM cross_reference_threads t
          JOIN verses sv ON sv.id=t.anchor_verse_id_start JOIN chapters sc ON sc.id=sv.chapter_id
          JOIN verses ev ON ev.id=t.anchor_verse_id_end JOIN chapters ec ON ec.id=ev.chapter_id
         WHERE t.slug LIKE 'jasher-7-%' OR t.slug LIKE 'jasher-9-%' OR t.slug LIKE 'jasher-20-%' ORDER BY 2,3""")
    for r in rows: print(f"  {r['slug']}: {r['sch']}:{r['svn']} -> {r['ech']}:{r['evn']}")
    await con.close()
asyncio.run(main())
