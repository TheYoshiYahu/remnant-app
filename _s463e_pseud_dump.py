"""S463e — dump every LIVE cross-reference card, thread member note and thread summary that touches
the pseudepigrapha editions, with the live verse text beside each, so the quoted words can be read
against the live text. Also settles WHICH PARSE IS LIVE: every live verse is compared to the parsed
JSON on the Desktop (source-texts/parsed/*.json) and the per-book match is printed.

Editions covered (all columns checked against data-schema/schema.sql Oct 26):
  pseudepigrapha        books adam-eve, testaments-xii, 2-enoch, 2-baruch, 3-baruch, 4-maccabees
                        (3-maccabees is in the same edition but was CLOSED in S463c — reported, not in scope)
  adam-eve-conflict     books 1-adam-eve, 2-adam-eve
  apocalypse-of-abraham book apocalypse-of-abraham
  ascension-isaiah      book ascension-isaiah
Read-only. Output: source-texts/pseudepigrapha-charles-vol2/pseud-cards-live.json
Run:  python3 ~/Desktop/App/_s463e_pseud_dump.py
      (S463_SCRATCH=1 drops ssl for a local scratch; an output path may be given as argv[1])
"""
import asyncio, os, re, json, sys
from pathlib import Path
import asyncpg
HERE = Path(__file__).resolve().parent
OUT = Path(sys.argv[1]) if len(sys.argv) > 1 else HERE / "source-texts" / "pseudepigrapha-charles-vol2" / "pseud-cards-live.json"
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (HERE / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")

EDS = ["pseudepigrapha", "adam-eve-conflict", "apocalypse-of-abraham", "ascension-isaiah"]
CLOSED = {("pseudepigrapha", "3-maccabees")}          # S463c
PARSED = {"pseudepigrapha": "pseudepigrapha-charles-vol2.json", "adam-eve-conflict": "adam-eve-conflict.json",
          "apocalypse-of-abraham": "apocalypse-of-abraham.json", "ascension-isaiah": "ascension-isaiah.json"}
ED_LIST = "(" + ",".join(f"'{e}'" for e in EDS) + ")"

V = """select v.id, e.slug as ed, b.slug as book, b.title as book_title, c.chapter_number as ch, v.verse_number as vn, v.text
       from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id"""
IN_SCOPE = "({a}.ed in " + ED_LIST + ")"
# notes that merely NAME one of the books (English names only — never a stem that matches a sacred name; S463d lesson)
NAMES = ["2 enoch", "secrets of enoch", "testament of ", "testaments of the", "apocalypse of abraham",
         "adam and eve", "ascension of isaiah", "2 baruch", "3 baruch", "4 maccabees"]
def name_clause(col):
    return "(" + " or ".join(f"{col} ilike '%{n}%'" for n in NAMES) + ")"

async def main():
    con = await asyncpg.connect(url, ssl=None if os.environ.get("S463_SCRATCH") else "require")
    eds = [dict(r) for r in await con.fetch(
        "select id, slug, title, public_domain_base as base, restoration_pipeline_version::text as pipe from editions where slug = any($1) order by id", EDS)]
    print("editions:")
    for e in eds: print("  ", e)
    books = [dict(r) for r in await con.fetch(f"""select b.id, e.slug as ed, b.slug, b.title, b.canonical_order, b.tier_required::text as tier,
        (select count(*) from chapters c where c.book_id=b.id) as chapters,
        (select count(*) from verses v join chapters c on c.id=v.chapter_id where c.book_id=b.id) as verses
        from books b join editions e on e.id=b.edition_id where e.slug = any($1) order by e.id, b.canonical_order""", EDS)]
    print("books:")
    for b in books: print("  ", b)
    live = {}
    for r in await con.fetch(V + f" where e.slug = any($1) order by e.id, b.canonical_order, c.chapter_number, v.verse_number", EDS):
        live[f"{r['ed']}|{r['book']}|{r['ch']}:{r['vn']}"] = r["text"]
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

    # ---- which parse is live: compare every live verse to the Desktop parsed JSON ----
    parse_match = {}
    for ed, fn in PARSED.items():
        p = HERE / "source-texts" / "parsed" / fn
        if not p.exists():
            print(f"  (no local parse for {ed}: {p})"); continue
        d = json.loads(p.read_text())
        for b in d["books"]:
            bs = (b.get("book_id") or b["book_title"]).strip().lower()
            loc = {}
            for c in b["chapters"]:
                for v in c["verses"]:
                    loc[f"{c['number']}:{v['number']}"] = v["text"]
            lv = {k.split("|", 2)[2]: t for k, t in live.items() if k.startswith(f"{ed}|{bs}|")}
            same = sum(1 for k, t in lv.items() if loc.get(k) == t)
            diff = sum(1 for k, t in lv.items() if k in loc and loc[k] != t)
            parse_match[f"{ed}|{bs}"] = {"live": len(lv), "local": len(loc), "same": same, "differ": diff,
                                         "live_only": len(set(lv) - set(loc)), "local_only": len(set(loc) - set(lv))}
    print("live text vs Desktop parsed JSON (same = identical verse text at the same address):")
    for k, v in parse_match.items(): print(f"  {k:45s} {v}")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps({"schema_note": "live read-back S463e (pseudepigrapha editions)", "editions": eds, "books": books,
                               "parse_match": parse_match, "live": live, "cards": cards, "members": members, "threads": threads},
                              ensure_ascii=False, indent=0, default=str))
    print(f"live verses: {len(live)}")
    per = {}
    for c in cards:
        for side in ("s", "t"):
            if c[f"{side}_ed"] in EDS:
                k = f"{c[f'{side}_ed']}|{c[f'{side}_book']}"; per[k] = per.get(k, 0) + 1
    anch = sum(1 for c in cards if c["s_ed"] in EDS or c["t_ed"] in EDS)
    print(f"cards touching these editions: {len(cards)}   (anchored at either end: {anch}; named in the note only: {len(cards)-anch})")
    print("anchored per book (a card anchored at both ends counts twice):")
    for k in sorted(per): print(f"  {k:45s} {per[k]}" + ("   [CLOSED S463c — not in scope]" if tuple(k.split('|')) in CLOSED else ""))
    print(f"thread member notes: {len(members)}")
    print(f"threads anchored in or naming these books: {len(threads)}")
    print("written:", OUT)
asyncio.run(main())
