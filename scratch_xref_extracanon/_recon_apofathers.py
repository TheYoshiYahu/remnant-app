import asyncio, asyncpg
from pathlib import Path

def url():
    for raw in (Path('..')/'api'/'.env').read_text().splitlines():
        if raw.startswith('DATABASE_URL='):
            return raw.split('=', 1)[1].strip().strip('"').strip("'")

BOOKS = ['2-clement','ignatius-ephesians','ignatius-magnesians','ignatius-philadelphians',
         'ignatius-polycarp','ignatius-romans','ignatius-smyrnaeans','ignatius-trallians',
         'martyrdom-polycarp']

async def main():
    c = await asyncpg.connect(url(), ssl='require')
    edid = await c.fetchval("SELECT id FROM editions WHERE slug='lightfoot-apostolic-fathers'")
    tot_t = tot_m = tot_orph = 0
    for b in BOOKS:
        bid = await c.fetchval('SELECT id FROM books WHERE edition_id=$1 AND slug=$2', edid, b)
        rows = await c.fetch('''
            SELECT t.id,
                   (SELECT count(*) FROM cross_reference_thread_members m WHERE m.thread_id=t.id) AS mc
            FROM cross_reference_threads t
            JOIN verses v ON t.anchor_verse_id_start=v.id
            JOIN chapters ch ON v.chapter_id=ch.id
            WHERE ch.book_id=$1''', bid)
        tcnt = len(rows)
        mcnt = sum(r['mc'] for r in rows)
        orph = sum(1 for r in rows if r['mc'] == 0)
        print(f'  {b:<26} threads={tcnt:>2} members={mcnt:>3} orphan_threads={orph}')
        tot_t += tcnt; tot_m += mcnt; tot_orph += orph
    print(f'  {"TOTAL":<26} threads={tot_t} members={tot_m} orphan_threads={tot_orph}')
    await c.close()

asyncio.run(main())
