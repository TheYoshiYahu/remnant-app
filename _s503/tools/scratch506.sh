#!/usr/bin/env bash
# S506 sandbox scratch: scratch506.sh <kit.tgz> <slug>... — unpack the Mac kit fresh, seed from each thread's merged read-back, run its
# session506 migration twice (seed503x), re-dump the real books, check506 on them; then one tamper per thread (guard must RAISE).
set -uo pipefail
KIT="$1"; shift
rm -rf /home/claude/s506/App && mkdir -p /home/claude/s506/App && cd /home/claude/s506/App && tar xzf "$KIT" && mkdir -p _s495/live
ok=1
for s in "$@"; do
  short=$(echo "$s" | cut -d- -f1-4)
  cp "_s503/out/packet506/${s}_readback.json" "_s495/live/canon__fx-${short}.json"
  books=$(python3 -c "import json,re;D=json.load(open('_s503/out/packet506/${s}_readback.json'));print(','.join(n.replace('__','/') for n in re.findall(r'(\w+__[\w-]+) \(\d+\)', D['schema_note'])))")
  echo "=========== $s [redump $books]"
  S503_FIX=sweep506 python3 _s503/tools/seed503x.py --mig "_s503/sql/session506_${short}.sql" --books "canon/fx-${short}" --redump "$books" --fix "_s503/fix/sweep506/${s}.json" --check "python3 _s503/tools/check506.py $s" 2>&1 | grep "^seed503x\|FAIL\|PROBLEM" || true
  cid=$(python3 -c "import json;print(json.load(open('_s503/fix/sweep506/${s}.json'))['cards'][0]['id'])")
  PGPASSWORD=s496 psql -h localhost -U s496 -d s503x -qc "UPDATE cross_references SET note='tampered' WHERE id=${cid};"
  r=$(DATABASE_URL=postgresql://s496:s496@localhost/s503x python3 api/apply_migration.py "data-schema/migrations/session506_${short}.sql" 2>&1 | grep -o "S503c: the live note of card ${cid} differs")
  if [ -n "$r" ]; then echo "tamper card ${cid}: guard RAISED — PASS"; else echo "tamper card ${cid}: guard did NOT raise — FAIL"; ok=0; fi
done
md5sum data-schema/migrations/session506_*.sql | awk '{print $1, substr($2, 24)}'
