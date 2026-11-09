"""S495 — PHASE 2 read-back for every book in play, one JSON per book, in the S463f read-back shape
(the shape seed463f.py seeds a scratch from). Read-only. Model: Claude Fable 5.1.

Books in play (from _s495_gap_map.md, Nov 8):
  gap lane   — chapters with no card:  enoch/1-enoch, pseudepigrapha/testaments-xii, pseudepigrapha/adam-eve,
               pseudepigrapha/2-enoch, pseudepigrapha/2-baruch, lightfoot-apostolic-fathers/hermas
  orphan lane — cards in no thread:    canon/matthew, canon/mark, canon/luke, canon/joshua, canon/revelation,
               canon/romans, canon/1-thessalonians, canon/genesis, canon/ezekiel, apocrypha/2-esdras (+2-baruch above)

Per book file  source-texts/_s495/live/<edition>__<book>.json :
  live     — every live verse of the book (ed|book|ch:vn -> text)
  cards    — every card whose SOURCE is in the book, plus (gap books) every card whose TARGET is in the book;
             both verse texts beside each card; orphan: true when the card sits in no thread
  members  — every member row of those cards
  threads  — every thread that has one of those cards as a member, or is anchored in the book
Also:  source-texts/_s495/live/_unanchored_threads.md — the threads with no anchor verse (whole library).
Run:   python3 ~/Desktop/App/_s495_dump.py | tee ~/Desktop/App/_s495_dump.log
"""
import asyncio, os, re, json
from pathlib import Path
import asyncpg
HERE = Path(__file__).resolve().parent
OUTD = HERE / "source-texts" / "_s495" / "live"
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (HERE / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")

GAP = [("enoch", "1-enoch"), ("pseudepigrapha", "testaments-xii"), ("pseudepigrapha", "adam-eve"), ("pseudepigrapha", "2-enoch"),
       ("pseudepigrapha", "2-baruch"), ("lightfoot-apostolic-fathers", "hermas")]
ORPH = [("canon", "matthew"), ("canon", "mark"), ("canon", "luke"), ("canon", "joshua"), ("canon", "revelation"), ("canon", "romans"),
        ("canon", "1-thessalonians"), ("canon", "genesis"), ("canon", "ezekiel"), ("apocrypha", "2-esdras")]

V = """select v.id, e.slug as ed, b.slug as book, c.chapter_number as ch, v.verse_number as vn, v.text
       from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id"""

async def main():
    con = await asyncpg.connect(url, ssl=None if os.environ.get("S463_SCRATCH") else "require")
    OUTD.mkdir(parents=True, exist_ok=True)
    eds = [dict(r) for r in await con.fetch("select id, slug, title, public_domain_base as base, restoration_pipeline_version::text as pipe from editions order by id")]
    books_all = [dict(r) for r in await con.fetch("""select b.id, e.slug as ed, b.slug, b.title, b.canonical_order, b.tier_required::text as tier
        from books b join editions e on e.id=b.edition_id order by e.id, b.canonical_order""")]
    schema = await con.fetchval("select version from schema_version limit 1")
    for ed, bk in GAP + ORPH:
        is_gap = (ed, bk) in GAP
        live = {f"{r['ed']}|{r['book']}|{r['ch']}:{r['vn']}": r["text"] for r in await con.fetch(V + " where e.slug=$1 and b.slug=$2 order by c.chapter_number, v.verse_number", ed, bk)}
        side = "(s.ed=$1 and s.book=$2) or (t.ed=$1 and t.book=$2)" if is_gap else "(s.ed=$1 and s.book=$2)"
        cards = [dict(r) for r in await con.fetch(f"""
            with vv as ({V})
            select x.id, x.note, x.tier_required::text as tier, x.source,
                   s.ed as s_ed, s.book as s_book, s.ch as s_ch, s.vn as s_vn, s.text as s_text,
                   t.ed as t_ed, t.book as t_book, t.ch as t_ch, t.vn as t_vn, t.text as t_text,
                   not exists (select 1 from cross_reference_thread_members m where m.cross_reference_id=x.id) as orphan
            from cross_references x join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id
            where {side} order by x.id""", ed, bk)]
        ids = [c["id"] for c in cards]
        members = [dict(r) for r in await con.fetch(f"""
            with vv as ({V})
            select m.thread_id, th.slug, m.cross_reference_id as xref_id, m.sort_order, m.member_note,
                   s.ed as s_ed, s.book as s_book, s.ch as s_ch, s.vn as s_vn, t.ed as t_ed, t.book as t_book, t.ch as t_ch, t.vn as t_vn
            from cross_reference_thread_members m join cross_reference_threads th on th.id=m.thread_id
            join cross_references x on x.id=m.cross_reference_id join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id
            where m.cross_reference_id = any($1::int[]) order by m.thread_id, m.sort_order""", ids)]
        threads = [dict(r) for r in await con.fetch(f"""
            with vv as ({V})
            select th.id, th.slug, th.title, th.summary_md, th.sort_order, th.tier_required::text as tier,
                   a.ed as a_ed, a.book as a_book, a.ch as a_ch, a.vn as a_vn, z.ch as z_ch, z.vn as z_vn,
                   (select count(*) from cross_reference_thread_members m where m.thread_id=th.id) as member_count
            from cross_reference_threads th left join vv a on a.id=th.anchor_verse_id_start left join vv z on z.id=th.anchor_verse_id_end
            where (a.ed=$2 and a.book=$3)
               or exists (select 1 from cross_reference_thread_members m where m.thread_id=th.id and m.cross_reference_id = any($1::int[]))
            order by th.id""", ids, ed, bk)]
        books = [b for b in books_all if b["ed"] == ed and b["slug"] == bk]
        out = OUTD / f"{ed}__{bk}.json"
        out.write_text(json.dumps({"schema_note": f"live read-back S495 ({ed}/{bk}, {'gap' if is_gap else 'orphan'} lane) · schema {schema}",
                                   "editions": eds, "books": books, "parse_match": {}, "live": live, "cards": cards, "members": members, "threads": threads},
                                  ensure_ascii=False, indent=0, default=str))
        orph = sum(1 for c in cards if c["orphan"])
        print(f"{ed:28s} {bk:18s} verses {len(live):5d}  cards {len(cards):5d} (orphan {orph:4d})  members {len(members):5d}  threads {len(threads):4d}  -> {out.name}")
    una = [dict(r) for r in await con.fetch("""select th.id, th.slug, th.title, th.sort_order, th.tier_required::text as tier, length(th.summary_md) as len,
        (select count(*) from cross_reference_thread_members m where m.thread_id=th.id) as members,
        (select string_agg(distinct e.slug || '/' || b.slug, ', ') from cross_reference_thread_members m join cross_references x on x.id=m.cross_reference_id
            join verses v on v.id=x.source_verse_id join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id
            where m.thread_id=th.id) as source_books
        from cross_reference_threads th where th.anchor_verse_id_start is null order by th.id""")]
    L = ["# Threads with no anchor verse — live (S495 dump)", "", f"{len(una)} threads.", "", "| id | slug | title | members | source books of its members | summary len |", "|---|---|---|---|---|---|"]
    for t in una: L.append(f"| {t['id']} | {t['slug']} | {t['title']} | {t['members']} | {t['source_books']} | {t['len']} |")
    (OUTD / "_unanchored_threads.md").write_text("\n".join(L) + "\n")
    print(f"threads with no anchor: {len(una)} -> _unanchored_threads.md")
    await con.close()
asyncio.run(main())
