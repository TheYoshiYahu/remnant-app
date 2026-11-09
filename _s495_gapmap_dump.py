"""S495 — PHASE 2 GAP MAP, read from the LIVE database (read-only; one paste from Yoshi).
Model: Claude Fable 5.1 (script authored S495, Nov 8 2026).

Writes ~/Desktop/App/_s495_gap_map.md with plain numbers for every Phase-2 item, general to specific:
  A. library totals (schema, editions, books, chapters, verses, cards, threads, members)
  B. chapters with NO card at all (no cross-reference anchored on any verse) — full lists per book,
     apocrypha 'chapter 0' intro rows (0 verses) and Josephus / Barnabas (by rule) set aside
  C. chapters that HAVE cards but NO thread reaches them (Layer 1 renders, Layer 2 — the thread summary — is empty)
     + cards that sit in no thread (orphan cards), per book
  D. threads whose summary_md is missing or thin (null / empty / under 120 chars), with anchor
  E. the four never-applied files — S181 Romans / Galatians / Revelation canon-only baselines and S154 Matt 17 —
     slug by slug against the live threads, and the live state of what superseded them (S219 / S223 / S224, Matt 17 today)
  F. cards, member notes and summaries that still point the reader at a document he can't see
     (Red Line / voice skill / SUMMATION / contract / roadmap / framework-deep / session numbers)
Run:   python3 ~/Desktop/App/_s495_gapmap_dump.py | tee ~/Desktop/App/_s495_gapmap_dump.log
       (S463_SCRATCH=1 drops ssl for a local scratch)
"""
import asyncio, os, re, sys
from pathlib import Path
import asyncpg
HERE = Path(__file__).resolve().parent
MIG = HERE / "data-schema" / "migrations"
OUT = HERE / "_s495_gap_map.md"
url = os.environ.get("DATABASE_URL")
if not url:
    m = re.search(r"DATABASE_URL=(.*)", (HERE / "api" / ".env").read_text()); url = m.group(1).strip().strip("'\"")

BY_RULE_EDS = {"josephus"}                 # historical witness, one-way, no cards by rule
BY_RULE_BOOKS = {("lightfoot-apostolic-fathers", "barnabas")}
UNAPPLIED = ["session181_romans_xref_threads.sql", "session181_galatians_xref_threads.sql",
             "session181_revelation_xref_threads.sql", "session154_matt_17_extras_cross_references.sql"]
SUPERSEDERS = {"romans": "session219", "galatians": "session223", "revelation": "session224"}

INS_RE = re.compile(r"INSERT INTO cross_reference_threads", re.I)
LIT_RE = re.compile(r"E?'([A-Za-z0-9][A-Za-z0-9-]*-[A-Za-z0-9-]*(?:''[A-Za-z0-9-]*)*)'")
TUP_RE = re.compile(r"\(\s*E?'([A-Za-z0-9][A-Za-z0-9-]*-[A-Za-z0-9-]*(?:''[A-Za-z0-9-]*)*)'\s*,")
def thread_slugs(txt):
    out = []
    for m in INS_RE.finditer(txt):
        end = len(txt)
        for stop in ("ON CONFLICT (slug)", "INSERT INTO "):
            k = txt.find(stop, m.end())
            if k != -1: end = min(end, k)
        seg = txt[m.end():end]
        lit = LIT_RE.search(seg)
        if lit: out.append(lit.group(1))
        if re.search(r"FROM\s*\(\s*VALUES", seg, re.I): out += TUP_RE.findall(seg)
    return list(dict.fromkeys(x.replace("''", "'") for x in out))

DOCREF = ["red line", "voice skill", "summation", "card contract", "chapter-end card contract", "roadmap",
          "framework-deep", "framework deep", "per the framework", "as the framework names", "%session %", "s1__ ", "%yoshi%"]
def docref_clause(col):
    parts = []
    for n in DOCREF:
        if n == "%session %": parts.append(f"{col} ~* '\\msession \\d'")
        elif n == "s1__ ": parts.append(f"{col} ~ '\\mS[0-9]{{2,3}}[a-f]?\\M'")
        elif n == "%yoshi%": parts.append(f"{col} ilike '%yoshi%'")
        else: parts.append(f"{col} ilike '%{n}%'")
    return "(" + " or ".join(parts) + ")"

def fmt_list(nums, cap=60):
    nums = list(nums)
    return ", ".join(map(str, nums)) if len(nums) <= cap else ", ".join(map(str, nums[:cap])) + f" … (+{len(nums)-cap} more)"

async def main():
    con = await asyncpg.connect(url, ssl=None if os.environ.get("S463_SCRATCH") else "require")
    tot = dict(await con.fetchrow("""select (select count(*) from editions) eds, (select count(*) from books) books,
        (select count(*) from chapters) chapters, (select count(*) from verses) verses, (select count(*) from cross_references) cards,
        (select count(*) from cross_reference_threads) threads, (select count(*) from cross_reference_thread_members) members,
        (select count(*) from cross_references x where not exists (select 1 from cross_reference_thread_members m where m.cross_reference_id=x.id)) orphan_cards,
        (select version from schema_version limit 1) schema"""))
    # per-chapter facts, whole library
    ch = [dict(r) for r in await con.fetch("""
        select e.slug as ed, b.slug as book, b.title as book_title, b.canonical_order, c.chapter_number as ch, c.chapter_title,
               (select count(*) from verses v where v.chapter_id=c.id) as verses,
               (select count(*) from cross_references x join verses v on v.id=x.source_verse_id where v.chapter_id=c.id) as cards,
               (select count(*) from cross_references x join verses v on v.id=x.source_verse_id where v.chapter_id=c.id
                   and not exists (select 1 from cross_reference_thread_members m where m.cross_reference_id=x.id)) as orphan_cards,
               (select count(distinct m.thread_id) from cross_reference_thread_members m join cross_references x on x.id=m.cross_reference_id
                   join verses v on v.id=x.source_verse_id where v.chapter_id=c.id) as threads
        from chapters c join books b on b.id=c.book_id join editions e on e.id=b.edition_id
        order by e.id, b.canonical_order, c.chapter_number""")]
    thin = [dict(r) for r in await con.fetch("""
        select th.id, th.slug, th.title, coalesce(length(th.summary_md),0) as len, th.tier_required::text as tier,
               e.slug as a_ed, b.slug as a_book, c.chapter_number as a_ch, v.verse_number as a_vn,
               (select count(*) from cross_reference_thread_members m where m.thread_id=th.id) as members
        from cross_reference_threads th
        left join verses v on v.id=th.anchor_verse_id_start left join chapters c on c.id=v.chapter_id
        left join books b on b.id=c.book_id left join editions e on e.id=b.edition_id
        where th.summary_md is null or length(btrim(th.summary_md)) < 120
        order by len, th.id""")]
    noanchor = await con.fetchval("select count(*) from cross_reference_threads where anchor_verse_id_start is null")
    live_slugs = {r["slug"]: dict(r) for r in await con.fetch(
        "select t.slug, t.sort_order, count(m.cross_reference_id) as members from cross_reference_threads t "
        "left join cross_reference_thread_members m on m.thread_id=t.id group by t.id, t.slug, t.sort_order")}
    # E — superseders + Matt 17 live
    sup = {}
    for book, sess in SUPERSEDERS.items():
        files = sorted(MIG.glob(f"{sess}_*.sql"))
        slugs = []
        for f in files: slugs += thread_slugs(f.read_text(errors="replace"))
        slugs = list(dict.fromkeys(slugs))
        sup[book] = {"files": [f.name for f in files], "slugs": len(slugs), "live": sum(1 for s in slugs if s in live_slugs),
                     "live_threads_anchored": await con.fetchval("""select count(*) from cross_reference_threads th join verses v on v.id=th.anchor_verse_id_start
                        join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id
                        where e.slug='canon' and b.slug=$1""", book),
                     "live_cards_src": await con.fetchval("""select count(*) from cross_references x join verses v on v.id=x.source_verse_id
                        join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id
                        where e.slug='canon' and b.slug=$1""", book)}
    m17 = [dict(r) for r in await con.fetch("""
        with vv as (select v.id, e.slug as ed, b.slug as book, c.chapter_number as ch, v.verse_number as vn
                    from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id)
        select x.id, s.vn as s_vn, t.ed as t_ed, t.book as t_book, t.ch as t_ch, t.vn as t_vn, left(x.note, 160) as note
        from cross_references x join vv s on s.id=x.source_verse_id join vv t on t.id=x.target_verse_id
        where s.ed='canon' and s.book='matthew' and s.ch=17 and t.ed <> 'canon' order by s.vn, x.id""")]
    unapplied = {}
    for fn in UNAPPLIED:
        p = MIG / fn
        if not p.exists(): unapplied[fn] = None; continue
        slugs = thread_slugs(p.read_text(errors="replace"))
        unapplied[fn] = {"slugs": slugs, "live": [s for s in slugs if s in live_slugs]}
    # F — internal-document references the reader can't see
    f_cards = [dict(r) for r in await con.fetch(f"""
        with vv as (select v.id, e.slug as ed, b.slug as book, c.chapter_number as ch, v.verse_number as vn
                    from verses v join chapters c on c.id=v.chapter_id join books b on b.id=c.book_id join editions e on e.id=b.edition_id)
        select x.id, s.ed, s.book, s.ch, s.vn, left(x.note, 200) as note from cross_references x join vv s on s.id=x.source_verse_id
        where {docref_clause('x.note')} order by s.ed, s.book, s.ch, s.vn""")]
    f_members = [dict(r) for r in await con.fetch(f"""
        select m.thread_id, th.slug, m.cross_reference_id as xref_id, left(m.member_note, 200) as note
        from cross_reference_thread_members m join cross_reference_threads th on th.id=m.thread_id
        where {docref_clause('m.member_note')} order by m.thread_id, m.sort_order""")]
    f_threads = [dict(r) for r in await con.fetch(f"""
        select th.id, th.slug, th.title, left(th.summary_md, 200) as summ from cross_reference_threads th
        where {docref_clause('th.summary_md')} or {docref_clause('th.title')} order by th.id""")]
    await con.close()

    # ---- assemble ----
    L = ["# Phase 2 gap map — live read-back (S495 dump)", "", f"Model: Claude Fable 5.1 · script `_s495_gapmap_dump.py` · read-only", "",
         f"schema {tot['schema']} · {tot['eds']} editions · {tot['books']} books · {tot['chapters']} chapters · {tot['verses']} verses · "
         f"{tot['cards']} cards · {tot['threads']} threads · {tot['members']} member rows · {tot['orphan_cards']} cards in no thread · "
         f"{noanchor} threads with no anchor", ""]
    print("\n".join(L))

    # B
    intro = [c for c in ch if c["verses"] == 0]
    rule = [c for c in ch if c["verses"] > 0 and c["cards"] == 0 and (c["ed"] in BY_RULE_EDS or (c["ed"], c["book"]) in BY_RULE_BOOKS)]
    gaps = [c for c in ch if c["verses"] > 0 and c["cards"] == 0 and c not in rule]
    L += ["## B. Chapters with NO card (nothing anchored on any verse)", "",
          f"Set aside: {len(intro)} rows with 0 verses (the apocrypha 'chapter 0' Introduction rows — intro commentary, not chapters; "
          f"nothing to anchor a card on) and {len(rule)} chapters with no card BY RULE (Josephus {sum(1 for c in rule if c['ed']=='josephus')}, "
          f"Barnabas {sum(1 for c in rule if c['book']=='barnabas')}).", "",
          f"**Real gaps: {len(gaps)} chapters, {sum(c['verses'] for c in gaps)} verses.**", "",
          "| edition | book | gap chapters | of | verses in gaps | chapters |", "|---|---|---|---|---|---|"]
    per = {}
    for c in gaps: per.setdefault((c["ed"], c["book"]), []).append(c)
    for (ed, bk), cs in per.items():
        n_all = sum(1 for c in ch if c["ed"] == ed and c["book"] == bk and c["verses"] > 0)
        L.append(f"| {ed} | {bk} | {len(cs)} | {n_all} | {sum(c['verses'] for c in cs)} | {fmt_list(c['ch'] for c in cs)} |")
    L.append("")
    L.append("Gap chapters with their verse counts (so the fill can be sized):")
    for (ed, bk), cs in per.items():
        L.append(f"- {ed} / {bk}: " + "; ".join(f"ch {c['ch']} ({c['verses']} v{(' — ' + c['chapter_title']) if c.get('chapter_title') else ''})" for c in cs))
    L.append("")
    if intro:
        L += ["Intro rows set aside (0 verses): " + ", ".join(f"{c['ed']}/{c['book']} ch {c['ch']}" for c in intro), ""]

    # C
    l2 = [c for c in ch if c["cards"] > 0 and c["threads"] == 0]
    L += ["## C. Chapters that HAVE cards but NO thread reaches them (Layer 1 shows, Layer 2 — the thread summary — is empty)", "",
          f"**{len(l2)} chapters, carrying {sum(c['cards'] for c in l2)} cards that sit in no thread.**", "",
          "| edition | book | chapters w/ cards, no thread | of | cards there | chapters |", "|---|---|---|---|---|---|"]
    per2 = {}
    for c in l2: per2.setdefault((c["ed"], c["book"]), []).append(c)
    for (ed, bk), cs in per2.items():
        n_all = sum(1 for c in ch if c["ed"] == ed and c["book"] == bk and c["cards"] > 0)
        L.append(f"| {ed} | {bk} | {len(cs)} | {n_all} | {sum(c['cards'] for c in cs)} | {fmt_list(c['ch'] for c in cs)} |")
    L.append("")
    orph = {}
    for c in ch:
        if c["orphan_cards"]: k = (c["ed"], c["book"]); orph[k] = orph.get(k, 0) + c["orphan_cards"]
    L += [f"Orphan cards (in no thread) across the whole library: {tot['orphan_cards']}, by book:", ""]
    L += [f"- {ed} / {bk}: {n}" for (ed, bk), n in sorted(orph.items(), key=lambda kv: -kv[1])]
    L.append("")

    # D
    L += ["## D. Threads with a missing or thin summary (null / empty / under 120 chars)", "", f"**{len(thin)} threads.**", ""]
    if thin:
        L += ["| id | slug | title | summary len | members | anchor |", "|---|---|---|---|---|---|"]
        for t in thin:
            anc = f"{t['a_ed']}/{t['a_book']} {t['a_ch']}:{t['a_vn']}" if t["a_book"] else "(no anchor)"
            L.append(f"| {t['id']} | {t['slug']} | {t['title']} | {t['len']} | {t['members']} | {anc} |")
    L.append("")

    # E
    L += ["## E. The four never-applied files — slug by slug against the live threads", ""]
    for fn, d in unapplied.items():
        if d is None: L.append(f"- {fn}: FILE NOT ON DISK"); continue
        st = "APPLIED" if d["slugs"] and len(d["live"]) == len(d["slugs"]) else ("NOT APPLIED" if not d["live"] else "PARTIAL")
        L.append(f"- **{fn}** — {st}: {len(d['live'])}/{len(d['slugs'])} of its thread slugs live" +
                 (f" (live: {', '.join(d['live'])})" if d["live"] and st != "APPLIED" else ""))
    L += ["", "What supersedes them, live today (canon edition):", "",
          "| book | superseding files | slugs in files | live | live threads anchored in book | live cards from book |", "|---|---|---|---|---|---|"]
    for bk, d in sup.items():
        L.append(f"| {bk} | {', '.join(d['files']) or '(none found)'} | {d['slugs']} | {d['live']} | {d['live_threads_anchored']} | {d['live_cards_src']} |")
    L += ["", f"Matthew 17 extras cards live today (canon Matt 17 → non-canon target): {len(m17)}", ""]
    for r in m17: L.append(f"- xref {r['id']}: Matt 17:{r['s_vn']} → {r['t_ed']}/{r['t_book']} {r['t_ch']}:{r['t_vn']} — {r['note']}")
    L.append("")

    # F
    L += ["## F. Cards / member notes / summaries that still point the reader at a document he can't see", "",
          f"**cards {len(f_cards)} · member notes {len(f_members)} · threads {len(f_threads)}** (pattern scan — Red Line, voice skill, SUMMATION, "
          "card contract, roadmap, framework-deep, 'session N', 'S123', Yoshi — read each before acting; some hits may be innocent words).", ""]
    for r in f_cards[:400]: L.append(f"- card {r['id']} @ {r['ed']}/{r['book']} {r['ch']}:{r['vn']}: {r['note']}")
    if len(f_cards) > 400: L.append(f"- … +{len(f_cards)-400} more cards")
    for r in f_members[:200]: L.append(f"- member (thread {r['slug']}, xref {r['xref_id']}): {r['note']}")
    if len(f_members) > 200: L.append(f"- … +{len(f_members)-200} more member notes")
    for r in f_threads[:200]: L.append(f"- thread {r['id']} {r['slug']} — {r['title']}: {r['summ']}")
    L.append("")

    OUT.write_text("\n".join(L) + "\n")
    print(f"B. real gap chapters: {len(gaps)} ({sum(c['verses'] for c in gaps)} verses); intro rows set aside: {len(intro)}; by rule: {len(rule)}")
    for (ed, bk), cs in per.items(): print(f"     {ed:30s} {bk:25s} {len(cs):3d} chapters  {sum(c['verses'] for c in cs):5d} verses")
    print(f"C. chapters with cards but no thread: {len(l2)} ({sum(c['cards'] for c in l2)} cards); orphan cards library-wide: {tot['orphan_cards']}")
    for (ed, bk), cs in per2.items(): print(f"     {ed:30s} {bk:25s} {len(cs):3d} chapters  {sum(c['cards'] for c in cs):5d} cards")
    print(f"D. thin/missing summaries: {len(thin)}; threads with no anchor: {noanchor}")
    for fn, d in unapplied.items():
        print(f"E. {fn}: " + ("FILE MISSING" if d is None else f"{len(d['live'])}/{len(d['slugs'])} slugs live"))
    for bk, d in sup.items(): print(f"   superseder {bk}: {d['live']}/{d['slugs']} slugs live; {d['live_threads_anchored']} threads anchored, {d['live_cards_src']} cards")
    print(f"   Matt 17 extras cards live: {len(m17)}")
    print(f"F. doc-ref hits: cards {len(f_cards)}, member notes {len(f_members)}, threads {len(f_threads)}")
    print("written:", OUT)
asyncio.run(main())
