"""S463a2 — live read-back after retiring the 4 S463a question cards.
Prints, for each of the 4: gone or still present; and for each twin: live on its expected pair.
Run:  python3 ~/Desktop/App/_s463a2_check.py
"""
import asyncio, os, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent / "api"))
from apply_migration import load_database_url
import asyncpg
Q = [(25364, 25467, 96, 5, 'amos', 6, 6), (25399, 25467, 96, 5, 'amos', 6, 6),
     (25466, 25362, 97, 9, 'james', 5, 4), (25486, 25504, 97, 8, 'isaiah', 5, 8)]
SQL = """SELECT x.id, se.slug ses, sc.chapter_number sch, sv.verse_number svn, tb.slug tbs, tc.chapter_number tch, tv.verse_number tvn
  FROM cross_references x
  JOIN verses sv ON sv.id=x.source_verse_id JOIN chapters sc ON sc.id=sv.chapter_id JOIN books sb ON sb.id=sc.book_id JOIN editions se ON se.id=sb.edition_id
  JOIN verses tv ON tv.id=x.target_verse_id JOIN chapters tc ON tc.id=tv.chapter_id JOIN books tb ON tb.id=tc.book_id
  WHERE x.id = $1"""
async def main():
    con = await asyncpg.connect(load_database_url())
    gone = 0; twins_ok = 0
    for xid, twin, ech, evn, cb, cc, cv in Q:
        r = await con.fetchrow(SQL, xid)
        m = await con.fetchval("SELECT count(*) FROM cross_reference_thread_members WHERE cross_reference_id=$1", xid)
        if r is None and m == 0: gone += 1; print(f"  {xid}: retired (card gone, member rows 0)")
        else: print(f"  {xid}: STILL PRESENT -> {r and (r['ses'], r['sch'], r['svn'], r['tbs'], r['tch'], r['tvn'])}, member rows {m}")
        t = await con.fetchrow(SQL, twin)
        ok = t and t['ses']=='enoch' and (t['sch'],t['svn'])==(ech,evn) and (t['tbs'],t['tch'],t['tvn'])==(cb,cc,cv)
        twins_ok += bool(ok); print(f"      twin {twin}: {'live on 1 Enoch %d:%d -> %s %d:%d' % (ech,evn,cb,cc,cv) if ok else 'NOT where expected: ' + str(t)}")
    n = await con.fetchval("SELECT count(*) FROM cross_references x JOIN verses v ON v.id IN (x.source_verse_id, x.target_verse_id) JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id WHERE b.slug='1-enoch'")
    print(f"S463a2 read-back: retired {gone}/4, twins live {twins_ok}/4, live cards anchored in 1 Enoch: {n}")
    await con.close()
asyncio.run(main())
