"""Seed a scratch Postgres (local, port 5499) with the S457 read-back so session459_enoch_card_fix.sql can be
tested end-to-end before Yoshi pastes it against the live DB. Mirrors the tables the migration touches."""
import json, asyncio, asyncpg
live = json.load(open('enoch-cards-live.json'))
SCHEMA = """
DROP TABLE IF EXISTS cross_reference_thread_members, cross_reference_threads, cross_references, verses, chapters, books, editions, schema_version CASCADE;
CREATE TABLE editions (id SERIAL PRIMARY KEY, slug TEXT UNIQUE);
CREATE TABLE books (id SERIAL PRIMARY KEY, edition_id INT REFERENCES editions(id), slug TEXT, canonical_order INT DEFAULT 0);
CREATE TABLE chapters (id SERIAL PRIMARY KEY, book_id INT REFERENCES books(id), chapter_number INT);
CREATE TABLE verses (id SERIAL PRIMARY KEY, chapter_id INT REFERENCES chapters(id), verse_number INT, text TEXT);
CREATE TABLE cross_references (id INT PRIMARY KEY, source_verse_id INT REFERENCES verses(id), target_verse_id INT REFERENCES verses(id),
   source TEXT DEFAULT 'manual', tier_required TEXT DEFAULT 'free', note TEXT, UNIQUE (source_verse_id, target_verse_id, source));
CREATE TABLE cross_reference_threads (id INT PRIMARY KEY, slug TEXT, title TEXT, summary_md TEXT, sort_order INT, tier_required TEXT,
   anchor_verse_id_start INT, anchor_verse_id_end INT);
CREATE TABLE cross_reference_thread_members (thread_id INT REFERENCES cross_reference_threads(id), cross_reference_id INT REFERENCES cross_references(id),
   sort_order INT, member_note TEXT, PRIMARY KEY (thread_id, cross_reference_id));
CREATE TABLE schema_version (id INT PRIMARY KEY, version TEXT, landed_at TIMESTAMPTZ DEFAULT now());
INSERT INTO schema_version VALUES (1, 'scratch-S457-readback');
"""
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
    # every live 1 Enoch verse first (so moves can land on verses no card touches yet)
    for a, t in live['enoch_live'].items():
        ch, vn = map(int, a.split(':')); await verse('enoch', '1-enoch', ch, vn, t)
    for c in live['cards']:
        s = await verse(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text'])
        t = await verse(c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
        await con.execute("INSERT INTO cross_references(id, source_verse_id, target_verse_id, source, tier_required, note) VALUES($1,$2,$3,$4,$5,$6) ON CONFLICT DO NOTHING",
                          c['id'], s, t, c['source'], c['tier'], c['note'])
    for th in live['threads']:
        await con.execute("INSERT INTO cross_reference_threads(id, slug, title, summary_md, sort_order, tier_required) VALUES($1,$2,$3,$4,$5,$6) ON CONFLICT DO NOTHING",
                          th['id'], th['slug'], th['title'], th['summary_md'], th['sort_order'], th['tier'])
    missing_threads = set()
    for m in live['members']:
        if not await con.fetchval("SELECT 1 FROM cross_reference_threads WHERE id=$1", m['thread_id']):
            await con.execute("INSERT INTO cross_reference_threads(id, slug) VALUES($1,$2)", m['thread_id'], m['slug']); missing_threads.add(m['thread_id'])
        if await con.fetchval("SELECT 1 FROM cross_references WHERE id=$1", m['xref_id']):
            await con.execute("INSERT INTO cross_reference_thread_members VALUES($1,$2,$3,$4) ON CONFLICT DO NOTHING", m['thread_id'], m['xref_id'], m['sort_order'], m['member_note'])
    print('verses', len(vs), 'cards', await con.fetchval("select count(*) from cross_references"),
          'threads', await con.fetchval("select count(*) from cross_reference_threads"), '(stubs for members whose thread is not in the dump:', len(missing_threads), ')',
          'members', await con.fetchval("select count(*) from cross_reference_thread_members"))
    await con.close()
asyncio.run(main())
