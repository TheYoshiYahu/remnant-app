"""S496 — dump496.py <canon-book> [out.json]  — read-back of one CANON book from the live database, in the read-back shape
(live / cards with s_/t_ ends / members / every thread). Read-only. Uses the S495 chain's connect + dump_book (dump495.py).
`orphan` is set true on a card that sits in no thread. Default output: source-texts/_s495/live/canon__<book>.json is NOT touched;
default is ./_s496_<book>_live.json. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import asyncio, json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
from dump495 import connect, dump_book

async def dump_canon(con, book, note='live read-back S496'):
    d = await dump_book(con, 'canon', book, note=note)
    threaded = {m['xref_id'] for m in d['members']}
    for c in d['cards']: c['orphan'] = c['id'] not in threaded
    return d

async def main():
    book = sys.argv[1]; out = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(f'_s496_{book}_live.json')
    con = await connect()
    try: d = await dump_canon(con, book)
    finally: await con.close()
    json.dump(d, open(out, 'w'), ensure_ascii=False, default=str)
    src = [c for c in d['cards'] if c['s_ed'] == 'canon' and c['s_book'] == book]
    print(f"dump496 canon/{book}: verses {len(d['live'])} | cards with source in {book} {len(src)} (orphan {sum(c['orphan'] for c in src)}) | members {len(d['members'])} | threads {len(d['threads'])} -> {out}")

if __name__ == '__main__':
    if len(sys.argv) < 2: sys.exit(__doc__)
    asyncio.run(main())
