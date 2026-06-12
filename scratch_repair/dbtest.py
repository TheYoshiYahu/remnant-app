import asyncio, ssl, os, re, time
from pathlib import Path
v=[l for l in Path('api/.env').read_text().splitlines() if l.startswith('DATABASE_URL=')][0].split('=',1)[1].strip().strip('"').strip("'")
if 'sslmode' not in v: v += ('&' if '?' in v else '?')+'sslmode=require'
import asyncpg
async def main():
    c=ssl.create_default_context(); c.check_hostname=False; c.verify_mode=ssl.CERT_NONE
    for i in range(6):
        try:
            conn=await asyncpg.connect(v, ssl=c, timeout=30)
            n=await conn.fetchval("select count(*) from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=788")
            print("OK connected; 3-baruch verses =", n)
            await conn.close(); return
        except Exception as e:
            print(f"attempt {i+1} failed: {type(e).__name__}: {e}")
            await asyncio.sleep(8)
asyncio.run(main())
