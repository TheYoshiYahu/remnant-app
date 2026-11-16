"""S507 — dump507_thread.py <slug>... — for each thread, find EVERY (edition, book) that any member card's source or target verse sits in, print them,
then dump503 each of those books (read-only; one copy per book under _s495/live). A book dump carries only the cards touching that book, so a
thread whose members span books with no dump on disk (effort-over-accomplishment: 77 members, 21 on no dump at S507 open) can only be
merged by packet506 once every contributing book is dumped. Also prints the thread's live member count so packet506's "MISSING" can be checked.
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from dump495 import connect, dump_book
Q = """SELECT DISTINCT e.slug AS ed, b.slug AS book FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses v ON v.id IN (x.source_verse_id, x.target_verse_id) JOIN chapters c ON c.id = v.chapter_id JOIN books b ON b.id = c.book_id JOIN editions e ON e.id = b.edition_id
  WHERE t.slug = $1 ORDER BY 1, 2"""
async def main(slugs):
    con = await connect(); done = set()
    try:
        for slug in slugs:
            n = await con.fetchval("SELECT count(*) FROM cross_reference_thread_members m JOIN cross_reference_threads t ON t.id = m.thread_id WHERE t.slug = $1", slug)
            rows = await con.fetch(Q, slug); print(f"dump507_thread {slug}: {n} members across {len(rows)} books: " + ', '.join(f"{r['ed']}/{r['book']}" for r in rows), flush=True)
            for r in rows:
                if (r['ed'], r['book']) in done: continue
                done.add((r['ed'], r['book'])); d = await dump_book(con, r['ed'], r['book'], note='live read-back S507')
                threaded = {m['xref_id'] for m in d['members']}
                for c in d['cards']: c['orphan'] = c['id'] not in threaded
                out = live503(r['ed'], r['book']); out.parent.mkdir(parents=True, exist_ok=True); json.dump(d, open(out, 'w'), ensure_ascii=False, default=str)
                print(f"  dumped {r['ed']}/{r['book']}: verses {len(d['live'])} | cards {len(d['cards'])} | members {len(d['members'])} -> {out.name}", flush=True)
    finally: await con.close()
if __name__ == '__main__':
    if len(sys.argv) < 2: sys.exit(__doc__)
    asyncio.run(main(sys.argv[1:]))
