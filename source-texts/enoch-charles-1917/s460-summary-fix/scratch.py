"""S460 scratch test: seed a local Postgres from enoch-cards-live.json (live CHECK constraints, live schema_version shape),
apply session460_enoch_summary_fix.sql twice (second run must change 0), then dump the threads and regrade them."""
import json, asyncio, asyncpg, subprocess, sys, collections, re
from pathlib import Path as _P
HERE = str(_P(__file__).resolve().parent); HERE_UP = str(_P(HERE).parent)
from pathlib import Path
S = Path(HERE + ''); SRC = S / 'src/source-texts/enoch-charles-1917'
live = json.load(open(SRC / 'enoch-cards-live.json'))
SCHEMA = """
DROP TABLE IF EXISTS cross_reference_thread_members, cross_reference_threads, cross_references, verses, chapters, books, editions, schema_version CASCADE;
CREATE TABLE editions (id SERIAL PRIMARY KEY, slug TEXT UNIQUE);
CREATE TABLE books (id SERIAL PRIMARY KEY, edition_id INT REFERENCES editions(id), slug TEXT, canonical_order INT DEFAULT 0);
CREATE TABLE chapters (id SERIAL PRIMARY KEY, book_id INT REFERENCES books(id), chapter_number INT);
CREATE TABLE verses (id SERIAL PRIMARY KEY, chapter_id INT REFERENCES chapters(id), verse_number INT, text TEXT);
CREATE TABLE cross_references (id INT PRIMARY KEY, source_verse_id INT REFERENCES verses(id), target_verse_id INT REFERENCES verses(id),
   source TEXT DEFAULT 'manual', tier_required TEXT DEFAULT 'free', note TEXT, UNIQUE (source_verse_id, target_verse_id, source),
   CONSTRAINT cross_references_check CHECK (source_verse_id <> target_verse_id));
CREATE TABLE cross_reference_threads (id INT PRIMARY KEY, slug TEXT UNIQUE, title TEXT, summary_md TEXT, sort_order INT, tier_required TEXT,
   anchor_verse_id_start INT, anchor_verse_id_end INT);
CREATE TABLE cross_reference_thread_members (thread_id INT REFERENCES cross_reference_threads(id), cross_reference_id INT REFERENCES cross_references(id),
   sort_order INT, member_note TEXT, PRIMARY KEY (thread_id, cross_reference_id));
CREATE TABLE schema_version (id INT PRIMARY KEY DEFAULT 1 CHECK (id = 1), version TEXT NOT NULL, landed_at TIMESTAMPTZ NOT NULL DEFAULT now(), notes TEXT);
INSERT INTO schema_version (version, notes) VALUES ('1.0.0-phase4-session455b', 'scratch');
"""
sql = open(S / 'session460_enoch_summary_fix.sql').read()
sql = '\n'.join(l for l in sql.split('\n') if not l.lstrip().startswith('\\'))

async def main():
    con = await asyncpg.connect(host='/tmp', port=5499, user='postgres', database='postgres')
    await con.execute(SCHEMA)
    eds = {}; bks = {}; chs = {}; vs = {}
    async def verse(ed, book, ch, vn, text):
        if ed not in eds: eds[ed] = await con.fetchval("INSERT INTO editions(slug) VALUES($1) RETURNING id", ed)
        if (ed, book) not in bks: bks[(ed, book)] = await con.fetchval("INSERT INTO books(edition_id, slug) VALUES($1,$2) RETURNING id", eds[ed], book)
        if (ed, book, ch) not in chs: chs[(ed, book, ch)] = await con.fetchval("INSERT INTO chapters(book_id, chapter_number) VALUES($1,$2) RETURNING id", bks[(ed, book)], ch)
        k = (ed, book, ch, vn)
        if k not in vs: vs[k] = await con.fetchval("INSERT INTO verses(chapter_id, verse_number, text) VALUES($1,$2,$3) RETURNING id", chs[k[:3]], vn, text)
        return vs[k]
    for a, t in live['enoch_live'].items():
        ch, vn = map(int, a.split(':')); await verse('enoch', '1-enoch', ch, vn, t)
    for th in live['threads']:
        await con.execute("INSERT INTO cross_reference_threads(id, slug, title, summary_md, sort_order, tier_required) VALUES($1,$2,$3,$4,$5,$6)",
                          th['id'], th['slug'], th['title'], th['summary_md'], th['sort_order'], th['tier'])
    print('seeded: enoch verses', len(vs), 'threads', await con.fetchval("select count(*) from cross_reference_threads"))
    for run in (1, 2):
        notices = []
        con.add_log_listener(lambda c, m: notices.append(m.message))
        await con.execute(sql)
        print(f'run {run}:', [n for n in notices if 'summary' in n or 'SKIPPED' in n or 'absent' in n])
        print('  schema_version:', await con.fetchval("select version from schema_version"))
    rows = await con.fetch("select id, slug, title, summary_md, sort_order, tier_required from cross_reference_threads")
    by = {t['id']: t for t in live['threads']}
    dump = dict(live); dump['threads'] = [dict(by[r['id']], title=r['title'], summary_md=r['summary_md']) for r in rows if r['id'] in by]
    json.dump(dump, open(S / 'scratch-cards-live.json', 'w'), ensure_ascii=False)
    await con.close()
asyncio.run(main())
