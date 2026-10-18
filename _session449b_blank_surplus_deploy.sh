#!/usr/bin/env bash
# S449b — blanks the 241 surplus 1 Enoch rows (DATABASE ONLY).  bash ~/Desktop/App/_session449b_blank_surplus_deploy.sh
set -euo pipefail; cd "$(dirname "$0")"
python3 api/apply_migration.py data-schema/migrations/session449b_enoch_blank_surplus.sql
python3 - <<'PY'
import asyncio,os,re,asyncpg
url=os.environ.get('DATABASE_URL') or re.search(r'DATABASE_URL=(.*)',open('api/.env').read()).group(1).strip().strip('"\'')
async def m():
    c=await asyncpg.connect(url)
    n=await c.fetchval("""SELECT count(*) FROM verses v JOIN chapters ch ON ch.id=v.chapter_id JOIN books b ON b.id=ch.book_id AND b.slug='1-enoch'
      JOIN editions e ON e.id=b.edition_id AND e.slug='enoch' WHERE v.text LIKE '[Not in 1 Enoch.%'""")
    print("blanked Enoch rows live:",n); await c.close()
asyncio.run(m())
PY
