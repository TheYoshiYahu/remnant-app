"""S503 — dump503.py <edition> <book> [out.json] — read-back of ONE book of ANY edition from the live database, in the read-back shape
(live / cards with s_/t_ ends / members / every thread), `orphan` set on cards in no thread. Read-only. Default output overwrites the chain's
live file _s495/live/<edition>__<book>.json (→ source-texts/_s495/live) (one copy per book — no v2 files). Uses dump495.connect + dump_book.
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from dump495 import connect, dump_book
async def main():
    ed, book = sys.argv[1], sys.argv[2]; out = Path(sys.argv[3]) if len(sys.argv) > 3 else live503(ed, book)
    con = await connect()
    try: d = await dump_book(con, ed, book, note='live read-back S503')
    finally: await con.close()
    threaded = {m['xref_id'] for m in d['members']}
    for c in d['cards']: c['orphan'] = c['id'] not in threaded
    out.parent.mkdir(parents=True, exist_ok=True); json.dump(d, open(out, 'w'), ensure_ascii=False, default=str)
    src = [c for c in d['cards'] if c['s_ed'] == ed and c['s_book'] == book]
    print(f"dump503 {ed}/{book}: verses {len(d['live'])} | cards with source in {book} {len(src)} (orphan {sum(c['orphan'] for c in src)}) | members {len(d['members'])} | threads {len(d['threads'])} -> {out}")
if __name__ == '__main__':
    if len(sys.argv) < 3: sys.exit(__doc__)
    asyncio.run(main())
