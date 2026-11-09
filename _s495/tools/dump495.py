"""S495 — dump495.py <book> [out.json]  — per-book read-back of the LIVE database in the same shape as live/<edition>__<book>.json
(keys: schema_note, editions, books, parse_match, live {edition|book|ch:vn: text} for the whole book, cards touching the book
(source or target in the book) with s_/t_ ends + text, members of those cards, every thread (anchor + member_count)).
DATABASE_URL from the environment or api/.env next to the App (ssl required, no-verify, the same connect path apply_migration.py uses).
Default output: ./_s495_<book>_live.json. `dump495.py --edition canon live/canon__ALL.json` dumps a whole edition's live text so
assemble495.py can check canon target quotations against the live canon. Also imported by seed495.py for the scratch dumps. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, json, os, sys, ssl
from pathlib import Path
from urllib.parse import urlparse, unquote
import asyncpg
BOOKS = {'1-enoch': 'enoch', 'testaments-xii': 'pseudepigrapha', 'adam-eve': 'pseudepigrapha', '2-enoch': 'pseudepigrapha',
         '2-baruch': 'pseudepigrapha', 'hermas': 'lightfoot-apostolic-fathers'}

def database_url():
    url = os.environ.get('DATABASE_URL')
    if not url:
        for env in (Path.cwd() / 'api' / '.env', Path(__file__).resolve().parent / 'api' / '.env', Path.home() / 'Desktop' / 'App' / 'api' / '.env'):
            if env.exists():
                for raw in env.read_text().splitlines():
                    if raw.strip().startswith('DATABASE_URL='): url = raw.strip().split('=', 1)[1].strip().strip('"').strip("'"); break
            if url: break
    if not url: sys.exit('DATABASE_URL not set and no api/.env found')
    return url.replace('postgres://', 'postgresql://', 1)

async def connect(url=None):
    url = url or database_url(); p = urlparse(url)
    ctx = ssl.create_default_context(); ctx.check_hostname = False; ctx.verify_mode = ssl.CERT_NONE
    return await asyncpg.connect(host=p.hostname, port=p.port or 5432, user=unquote(p.username) if p.username else None,
                                 password=unquote(p.password) if p.password else None, database=p.path.lstrip('/') or None, ssl=ctx, timeout=30)

async def dump_book(con, ed, book, note='live read-back S495'):
    V = "SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id"
    book_rows = await con.fetch(V + " WHERE e.slug=$1 AND b.slug=$2", ed, book)
    live = {f"{r['es']}|{r['bs']}|{r['ch']}:{r['vn']}": r['text'] for r in book_rows}
    ids = [r['id'] for r in book_rows]
    xr = await con.fetch("SELECT id, source_verse_id s, target_verse_id t, source, note, tier_required::text tier FROM cross_references WHERE source_verse_id = ANY($1) OR target_verse_id = ANY($1) ORDER BY id", ids)
    need = {x['s'] for x in xr} | {x['t'] for x in xr}
    by = {r['id']: r for r in book_rows}
    if need - set(by):
        for r in await con.fetch(V + " WHERE v.id = ANY($1)", list(need - set(by))): by[r['id']] = r
    def end(p, r): return {f'{p}_ed': r['es'], f'{p}_book': r['bs'], f'{p}_ch': r['ch'], f'{p}_vn': r['vn'], f'{p}_text': r['text']}
    cards = [dict(id=x['id'], note=x['note'], tier=x['tier'], source=x['source'], **end('s', by[x['s']]), **end('t', by[x['t']]), orphan=False) for x in xr]
    cm = {c['id']: c for c in cards}
    mrows = await con.fetch("SELECT m.thread_id, m.cross_reference_id xref_id, m.sort_order, m.member_note, t.slug FROM cross_reference_thread_members m JOIN cross_reference_threads t ON t.id=m.thread_id WHERE m.cross_reference_id = ANY($1) ORDER BY 1,3,2", list(cm))
    members = [dict(thread_id=m['thread_id'], slug=m['slug'], xref_id=m['xref_id'], sort_order=m['sort_order'], member_note=m['member_note'],
                    **{k: cm[m['xref_id']][k] for k in ('s_ed', 's_book', 's_ch', 's_vn', 't_ed', 't_book', 't_ch', 't_vn')}) for m in mrows]
    trows = await con.fetch("SELECT t.id, t.slug, t.title, t.summary_md, t.sort_order, t.tier_required::text tier, t.anchor_verse_id_start a, t.anchor_verse_id_end z, (SELECT count(*) FROM cross_reference_thread_members m WHERE m.thread_id=t.id) member_count FROM cross_reference_threads t ORDER BY t.id")
    anc = {t['a'] for t in trows if t['a']} | {t['z'] for t in trows if t['z']}
    if anc - set(by):
        for r in await con.fetch(V + " WHERE v.id = ANY($1)", list(anc - set(by))): by[r['id']] = r
    threads = []
    for t in trows:
        a = by.get(t['a']); z = by.get(t['z'])
        threads.append(dict(id=t['id'], slug=t['slug'], title=t['title'], summary_md=t['summary_md'], sort_order=t['sort_order'], tier=t['tier'],
                            a_ed=a['es'] if a else None, a_book=a['bs'] if a else None, a_ch=a['ch'] if a else None, a_vn=a['vn'] if a else None,
                            z_ch=z['ch'] if z else None, z_vn=z['vn'] if z else None, member_count=t['member_count']))
    editions = [dict(id=e['id'], slug=e['slug'], title=e['title'], base=e['public_domain_base'], pipe=str(e['restoration_pipeline_version'])) for e in await con.fetch("SELECT id, slug, title, public_domain_base, restoration_pipeline_version FROM editions ORDER BY id")]
    books = [dict(id=b['id'], ed=ed, slug=b['slug'], title=b['title'], canonical_order=b['canonical_order'], tier=b['tier']) for b in await con.fetch("SELECT b.id, b.slug, b.title, b.canonical_order, b.tier_required::text tier FROM books b JOIN editions e ON e.id=b.edition_id WHERE e.slug=$1 AND b.slug=$2", ed, book)]
    ver = await con.fetchval("SELECT version FROM schema_version WHERE id = 1")
    return dict(schema_note=f"{note} ({ed}/{book}) · schema {ver}", editions=editions, books=books, parse_match=[], live=live, cards=cards, members=members, threads=threads)

async def dump_edition_text(con, ed):
    """{'live': {edition|book|ch:vn: text}} for a whole edition — drop the file into live/ (e.g. live/canon__ALL.json) and assemble495.py
    picks it up as live authority for target quotations (the live canon has drifted from parsed/canon.json)."""
    rows = await con.fetch("SELECT e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id WHERE e.slug=$1", ed)
    return dict(schema_note=f'live edition text S495 ({ed})', editions=[], books=[], parse_match=[], live={f"{r['es']}|{r['bs']}|{r['ch']}:{r['vn']}": r['text'] for r in rows}, cards=[], members=[], threads=[])

async def main():
    if sys.argv[1] == '--edition':
        ed = sys.argv[2]; out = Path(sys.argv[3]) if len(sys.argv) > 3 else Path(f'{ed}__ALL.json')
        con = await connect()
        try: d = await dump_edition_text(con, ed)
        finally: await con.close()
        json.dump(d, open(out, 'w'), ensure_ascii=False); print(f"dump495 edition {ed}: verses {len(d['live'])} -> {out}"); return
    book = sys.argv[1]; ed = BOOKS[book]
    out = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(f'_s495_{book}_live.json')
    con = await connect()
    try: d = await dump_book(con, ed, book)
    finally: await con.close()
    json.dump(d, open(out, 'w'), ensure_ascii=False, default=str)
    print(f"dump495 {ed}/{book}: verses {len(d['live'])} | cards {len(d['cards'])} | members {len(d['members'])} | threads {len(d['threads'])} -> {out}")

if __name__ == '__main__':
    if len(sys.argv) < 2 or (sys.argv[1] not in BOOKS and sys.argv[1] != '--edition'): sys.exit(__doc__ + "\n  dump495.py --edition canon live/canon__ALL.json   (whole-edition live text for assemble495's target checks)")
    asyncio.run(main())
