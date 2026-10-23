"""S463b — dump every LIVE cross-reference card, thread member note and thread summary that touches Jubilees,
with the live Jubilees verse text beside each, so the quoted words can be read against the live text.
Read-only. Output: source-texts/jubilees-charles-1917/jubilees-cards-live.json
Run:  python3 ~/Desktop/App/_s463b_jub_dump.py
"""
import asyncio, os, re, json
from pathlib import Path
import asyncpg
HERE = Path(__file__).resolve().parent
OUT = HERE / "source-texts" / "jubilees-charles-1917" / "jubilees-cards-live.json"
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (HERE / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")

V = """select v.id, e.slug as ed, b.slug as book, c.chapter_number as ch, v.verse_number as vn, v.text
       from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id"""

async def main():
    con = await asyncpg.connect(url, ssl="require")
    jub = {f"{r['ch']}:{r['vn']}": r["text"] for r in await con.fetch(V + " where e.slug='jubilees' order by c.chapter_number, v.verse_number")}
    cards = [dict(r) for r in await con.fetch(f"""
        with vv as ({V})
        select x.id, x.note, x.tier_required::text as tier, x.source,
               s.ed as s_ed, s.book as s_book, s.ch as s_ch, s.vn as s_vn, s.text as s_text,
               t.ed as t_ed, t.book as t_book, t.ch as t_ch, t.vn as t_vn, t.text as t_text
        from cross_references x join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id
        where s.ed='jubilees' or t.ed='jubilees' or x.note ilike '%jubilees%'
        order by x.id""")]
    members = [dict(r) for r in await con.fetch(f"""
        with vv as ({V})
        select m.thread_id, th.slug, m.cross_reference_id as xref_id, m.sort_order, m.member_note,
               s.ed as s_ed, s.book as s_book, s.ch as s_ch, s.vn as s_vn, t.ed as t_ed, t.book as t_book, t.ch as t_ch, t.vn as t_vn
        from cross_reference_thread_members m join cross_reference_threads th on th.id=m.thread_id
        join cross_references x on x.id=m.cross_reference_id join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id
        where s.ed='jubilees' or t.ed='jubilees' or m.member_note ilike '%jubilees%'
        order by m.thread_id, m.sort_order""")]
    threads = [dict(r) for r in await con.fetch(f"""
        with vv as ({V})
        select th.id, th.slug, th.title, th.summary_md, th.sort_order, th.tier_required::text as tier,
               a.ed as a_ed, a.book as a_book, a.ch as a_ch, a.vn as a_vn, z.ch as z_ch, z.vn as z_vn
        from cross_reference_threads th left join vv a on a.id=th.anchor_verse_id_start left join vv z on z.id=th.anchor_verse_id_end
        where a.ed='jubilees' or th.summary_md ilike '%jubilees%' or th.title ilike '%jubilees%'
        order by th.id""")]
    await con.close()
    OUT.write_text(json.dumps({"schema_note": "live read-back S463b", "jubilees_live": jub, "cards": cards, "members": members, "threads": threads}, ensure_ascii=False, indent=0))
    print(f"live Jubilees verses: {len(jub)}")
    print(f"cards touching Jubilees (as source, target, or named in the note): {len(cards)}")
    print(f"thread member notes touching Jubilees: {len(members)}")
    print(f"threads anchored in or naming Jubilees: {len(threads)}")
    print("written:", OUT)
asyncio.run(main())
