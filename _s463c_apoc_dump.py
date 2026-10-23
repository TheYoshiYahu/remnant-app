"""S463c — dump every LIVE cross-reference card, thread member note and thread summary that touches the
Apocrypha (edition `apocrypha`, KJV 1611) or 3 Maccabees (book `3-maccabees`, now inside the `pseudepigrapha`
edition since S455; `apocrypha-charles-vol1` is retired and not queried), with the live verse text beside each,
so the quoted words can be read against the live text.
Read-only. Output: source-texts/apocrypha-kjv-ebible/apocrypha-cards-live.json
Run:  python3 ~/Desktop/App/_s463c_apoc_dump.py
"""
import asyncio, os, re, json
from pathlib import Path
import asyncpg
HERE = Path(__file__).resolve().parent
import sys
OUT = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE / "source-texts" / "apocrypha-kjv-ebible" / "apocrypha-cards-live.json"
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (HERE / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")

V = """select v.id, e.slug as ed, b.slug as book, b.title as book_title, c.chapter_number as ch, v.verse_number as vn, v.text
       from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id"""
IN_SCOPE = "(({a}.ed='apocrypha') or ({a}.ed='pseudepigrapha' and {a}.book='3-maccabees'))"
# notes that merely NAME one of these books (the S463a read-back found 4556/4614/4618 this way)
NAMES = ["apocrypha", "esdras", "tobit", "judith", "rest of esther", "wisdom of solomon", "wisdom 2:", "sirach", "ecclesiasticus",
         "baruch", "epistle of jerem", "song of the three", "susanna", "bel and the dragon", "prayer of manasse", "maccabees"]
def name_clause(col):
    return "(" + " or ".join(f"{col} ilike '%{n}%'" for n in NAMES) + ")"

async def main():
    con = await asyncpg.connect(url, ssl=None if os.environ.get("S463_SCRATCH") else "require")
    live = {}
    for r in await con.fetch(V + " where " + IN_SCOPE.format(a="e") .replace("e.book", "b.slug").replace("e.ed", "e.slug") + " order by e.slug, b.canonical_order, c.chapter_number, v.verse_number"):
        live[f"{r['book']}|{r['ch']}:{r['vn']}"] = r["text"]
    books = [dict(r) for r in await con.fetch("""select e.slug as ed, b.slug, b.title, b.canonical_order from books b join editions e on e.id=b.edition_id
        where e.slug='apocrypha' or (e.slug='pseudepigrapha' and b.slug='3-maccabees') order by e.slug, b.canonical_order""")]
    cards = [dict(r) for r in await con.fetch(f"""
        with vv as ({V})
        select x.id, x.note, x.tier_required::text as tier, x.source,
               s.ed as s_ed, s.book as s_book, s.ch as s_ch, s.vn as s_vn, s.text as s_text,
               t.ed as t_ed, t.book as t_book, t.ch as t_ch, t.vn as t_vn, t.text as t_text
        from cross_references x join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id
        where {IN_SCOPE.format(a='s')} or {IN_SCOPE.format(a='t')} or {name_clause('x.note')}
        order by x.id""")]
    members = [dict(r) for r in await con.fetch(f"""
        with vv as ({V})
        select m.thread_id, th.slug, m.cross_reference_id as xref_id, m.sort_order, m.member_note,
               s.ed as s_ed, s.book as s_book, s.ch as s_ch, s.vn as s_vn, t.ed as t_ed, t.book as t_book, t.ch as t_ch, t.vn as t_vn
        from cross_reference_thread_members m join cross_reference_threads th on th.id=m.thread_id
        join cross_references x on x.id=m.cross_reference_id join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id
        where {IN_SCOPE.format(a='s')} or {IN_SCOPE.format(a='t')} or {name_clause('m.member_note')}
        order by m.thread_id, m.sort_order""")]
    threads = [dict(r) for r in await con.fetch(f"""
        with vv as ({V})
        select th.id, th.slug, th.title, th.summary_md, th.sort_order, th.tier_required::text as tier,
               a.ed as a_ed, a.book as a_book, a.ch as a_ch, a.vn as a_vn, z.ch as z_ch, z.vn as z_vn
        from cross_reference_threads th left join vv a on a.id=th.anchor_verse_id_start left join vv z on z.id=th.anchor_verse_id_end
        where {IN_SCOPE.format(a='a')} or {name_clause('th.summary_md')} or {name_clause('th.title')}
        order by th.id""")]
    await con.close()
    OUT.write_text(json.dumps({"schema_note": "live read-back S463c (apocrypha + 3-maccabees)", "books": books, "live": live,
                               "cards": cards, "members": members, "threads": threads}, ensure_ascii=False, indent=0))
    n_ap = sum(1 for k in live if not k.startswith("3-maccabees|")); n_3m = len(live) - n_ap
    print(f"live Apocrypha verses: {n_ap}   live 3 Maccabees verses: {n_3m}   books: {len(books)}")
    anch = sum(1 for c in cards if c['s_ed']=='apocrypha' or c['t_ed']=='apocrypha' or c['s_book']=='3-maccabees' or c['t_book']=='3-maccabees')
    print(f"cards touching Apocrypha/3 Macc: {len(cards)}   (anchored at either end: {anch}; named in the note only: {len(cards)-anch})")
    print(f"thread member notes: {len(members)}")
    print(f"threads anchored in or naming these books: {len(threads)}")
    print("written:", OUT)
asyncio.run(main())
