"""S457 — read back the LIVE cross-reference apparatus. Evidence, not file listing.
For every migration file that inserts cross-reference threads, pull its thread slugs out of the SQL
and ask the live DB which exist -> APPLIED / PARTIAL / NOT APPLIED per file. Then the live totals:
cards (cross_references rows) and threads per source book and per edition, plus threads in the DB
that no file on disk claims. Run:  python3 ~/Desktop/App/_s457_xref_readback.py | tee ~/Desktop/App/_s457_xref_readback.log
"""
import asyncio, os, re
from pathlib import Path
from collections import defaultdict
import asyncpg

HERE = Path(__file__).resolve().parent
MIG = HERE / "data-schema" / "migrations"
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (HERE / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")

INS_RE = re.compile(r"INSERT INTO cross_reference_threads", re.I)
LIT_RE = re.compile(r"E?'([A-Za-z0-9][A-Za-z0-9-]*-[A-Za-z0-9-]*(?:''[A-Za-z0-9-]*)*)'")
TUP_RE = re.compile(r"\(\s*E?'([A-Za-z0-9][A-Za-z0-9-]*-[A-Za-z0-9-]*(?:''[A-Za-z0-9-]*)*)'\s*,")
def thread_slugs(txt):
    """Every thread slug a migration inserts: first literal after each INSERT INTO cross_reference_threads,
    plus every ('slug', tuple inside a FROM (VALUES ...) block of that INSERT (S243 shape)."""
    out = []
    for m in INS_RE.finditer(txt):
        end = len(txt)
        for stop in ("ON CONFLICT (slug)", "INSERT INTO "):
            k = txt.find(stop, m.end())
            if k != -1: end = min(end, k)
        seg = txt[m.end():end]
        lit = LIT_RE.search(seg)
        if lit: out.append(lit.group(1))
        if re.search(r"FROM\s*\(\s*VALUES", seg, re.I):
            out += TUP_RE.findall(seg)
    return [x.replace("''", "'") for x in out]
MEMBER_RE = re.compile(r"t\.slug\s*=\s*'([a-z0-9][a-z0-9-]*)'")

def session_key(name):
    m = re.match(r"session(\d+)", name); return int(m.group(1)) if m else 0

async def main():
    con = await asyncpg.connect(url, ssl="require")
    print("schema_version:", await con.fetchval("select version from schema_version"))
    live_slugs = {r["slug"]: r for r in await con.fetch(
        "select t.slug, t.sort_order, t.tier_required::text as tier, count(m.cross_reference_id) as members "
        "from cross_reference_threads t left join cross_reference_thread_members m on m.thread_id=t.id "
        "group by t.id, t.slug, t.sort_order, t.tier_required")}
    print(f"live threads: {len(live_slugs)}   live cards (cross_references rows): {await con.fetchval('select count(*) from cross_references')}   "
          f"live member rows: {await con.fetchval('select count(*) from cross_reference_thread_members')}")
    print()
    print("=== PER MIGRATION FILE (threads it inserts -> how many exist live) ===")
    claimed = {}
    files = sorted(MIG.glob("session*.sql"), key=lambda p: (session_key(p.name), p.name))
    no_thread_files = []
    for f in files:
        txt = f.read_text(errors="replace")
        slugs = list(dict.fromkeys(thread_slugs(txt)))
        if not slugs:
            if re.search(r"cross_reference", txt, re.I): no_thread_files.append(f.name)
            continue
        present = [s for s in slugs if s in live_slugs]
        members = sum(live_slugs[s]["members"] for s in present)
        for s in slugs: claimed.setdefault(s, []).append(f.name)
        status = "APPLIED" if len(present) == len(slugs) else ("NOT APPLIED" if not present else "PARTIAL")
        print(f"  {status:11s} {f.name:70s} threads {len(present)}/{len(slugs)}  live members {members}")
        if status == "PARTIAL":
            for s in slugs:
                if s not in live_slugs: print(f"               missing: {s}")
    print()
    print("=== files that touch cross_references but insert no threads (not provable by slug; read their header) ===")
    for n in no_thread_files: print("  ", n)
    print()
    orphans = [s for s in live_slugs if s not in claimed]
    print(f"=== live threads claimed by NO file on disk: {len(orphans)} ===")
    for s in sorted(orphans): print(f"   {s}  (sort {live_slugs[s]['sort_order']}, members {live_slugs[s]['members']})")
    dup = {s: fs for s, fs in claimed.items() if len(fs) > 1}
    print(f"=== slugs inserted by more than one file: {len(dup)} ===")
    for s, fs in sorted(dup.items())[:40]: print(f"   {s}: {', '.join(fs)}")
    print()
    print("=== LIVE CARDS BY SOURCE EDITION -> TARGET EDITION ===")
    for r in await con.fetch("""
        select se.slug as src_ed, te.slug as tgt_ed, count(*) as n from cross_references x
        join verses sv on sv.id=x.source_verse_id join chapters sc on sc.id=sv.chapter_id join books sb on sb.id=sc.book_id join editions se on se.id=sb.edition_id
        join verses tv on tv.id=x.target_verse_id join chapters tc on tc.id=tv.chapter_id join books tb on tb.id=tc.book_id join editions te on te.id=tb.edition_id
        group by 1,2 order by 1,2"""):
        print(f"  {r['src_ed']:22s} -> {r['tgt_ed']:22s} {r['n']}")
    print()
    print("=== LIVE CARDS + THREADS BY SOURCE BOOK (edition/book: cards as source | cards as target | threads anchored) ===")
    rows = await con.fetch("""
        with src as (select sb.edition_id, sb.id as book_id, count(*) n from cross_references x join verses v on v.id=x.source_verse_id join chapters c on c.id=v.chapter_id join books sb on sb.id=c.book_id group by 1,2),
             tgt as (select sb.edition_id, sb.id as book_id, count(*) n from cross_references x join verses v on v.id=x.target_verse_id join chapters c on c.id=v.chapter_id join books sb on sb.id=c.book_id group by 1,2),
             thr as (select sb.edition_id, sb.id as book_id, count(*) n from cross_reference_threads t join verses v on v.id=t.anchor_verse_id_start join chapters c on c.id=v.chapter_id join books sb on sb.id=c.book_id group by 1,2)
        select e.slug as ed, b.slug as book, b.canonical_order as bo, coalesce(src.n,0) as s, coalesce(tgt.n,0) as t, coalesce(thr.n,0) as th
        from books b join editions e on e.id=b.edition_id
        left join src on src.book_id=b.id left join tgt on tgt.book_id=b.id left join thr on thr.book_id=b.id
        order by e.slug, b.canonical_order""")
    cur = None
    for r in rows:
        if r["ed"] != cur:
            cur = r["ed"]; print(f"-- {cur}")
        flag = "   <-- no cards as source" if r["s"] == 0 else ""
        print(f"   {r['book']:28s} src {r['s']:5d}  tgt {r['t']:5d}  threads {r['th']:4d}{flag}")
    print()
    print("=== JOHN, by chapter (the June question: canon Tanakh/NT pairings vs extras) ===")
    for r in await con.fetch("""
        select c.chapter_number as ch, sum(case when te.slug='canon' then 1 else 0 end) as canon_tgts, sum(case when te.slug<>'canon' then 1 else 0 end) as extras_tgts
        from cross_references x join verses sv on sv.id=x.source_verse_id join chapters c on c.id=sv.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id
        join verses tv on tv.id=x.target_verse_id join chapters tc on tc.id=tv.chapter_id join books tb on tb.id=tc.book_id join editions te on te.id=tb.edition_id
        where e.slug='canon' and b.slug='john' group by 1 order by 1"""):
        print(f"   John {r['ch']:2d}: canon targets {r['canon_tgts']:3d}   extras targets {r['extras_tgts']:3d}")
    print()
    print("=== THREAD sort_order BANDS (min-max per thousand, count) ===")
    for r in await con.fetch("select (sort_order/1000)*1000 as band, count(*) n, min(sort_order) mn, max(sort_order) mx from cross_reference_threads group by 1 order by 1"):
        print(f"   {r['band']:6d}: {r['n']:4d} threads  ({r['mn']}–{r['mx']})")
    await con.close()
asyncio.run(main())
