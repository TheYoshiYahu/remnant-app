#!/usr/bin/env bash
# S449c — re-points 145 / retires 271 Enoch cards on removed verses, then deletes the freed rows (DATABASE ONLY).
# bash ~/Desktop/App/_session449c_xref_sort_deploy.sh
set -euo pipefail; cd "$(dirname "$0")"
python3 api/apply_migration.py data-schema/migrations/session449c_enoch_xref_sort.sql
python3 - <<'PY'
import asyncio,os,re,asyncpg
url=os.environ.get('DATABASE_URL') or re.search(r'DATABASE_URL=(.*)',open('api/.env').read()).group(1).strip().strip('"\'')
async def m():
    c=await asyncpg.connect(url)
    rows=await c.fetchval("""SELECT count(*) FROM verses v JOIN chapters ch ON ch.id=v.chapter_id JOIN books b ON b.id=ch.book_id AND b.slug='1-enoch' JOIN editions e ON e.id=b.edition_id AND e.slug='enoch'""")
    blank=await c.fetchval("""SELECT count(*) FROM verses v JOIN chapters ch ON ch.id=v.chapter_id JOIN books b ON b.id=ch.book_id AND b.slug='1-enoch' JOIN editions e ON e.id=b.edition_id AND e.slug='enoch' WHERE v.text LIKE '[Not in 1 Enoch.%'""")
    xr=await c.fetchval("""SELECT count(*) FROM cross_references x JOIN verses sv ON sv.id=x.source_verse_id JOIN chapters sc ON sc.id=sv.chapter_id JOIN books sb ON sb.id=sc.book_id JOIN verses tv ON tv.id=x.target_verse_id JOIN chapters tc ON tc.id=tv.chapter_id JOIN books tb ON tb.id=tc.book_id WHERE sb.slug='1-enoch' OR tb.slug='1-enoch'""")
    print(f"live Enoch verse rows: {rows} (1063 + kept blanked rows)   blanked rows left: {blank}   cross-references touching Enoch: {xr}"); await c.close()
asyncio.run(m())
PY
