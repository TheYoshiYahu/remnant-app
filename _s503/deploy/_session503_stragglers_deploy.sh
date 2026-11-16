#!/usr/bin/env bash
# S503 deploy — the STRAGGLERS: the last 27 orphan cross-reference cards outside the gospels (Joshua, Revelation, Romans, 1 Thessalonians, Genesis,
# Ezekiel, 2 Esdras, 2 Baruch) rewritten in place (Come-and-See, both verses; ids kept) and threaded (27 members). 0 new threads, 0 anchors.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 rewritten / 0 inserted).
# Needs, under ~/Desktop/App:  data-schema/migrations/session503_stragglers_rebuild.sql · _s503/tools/ · _s503/fix/stragglers503.json · _s496/tools/ · _s495/tools/
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session503_stragglers_deploy.sh        Log: _session503_stragglers_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S503 stragglers deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session503_stragglers_rebuild.sql
  echo "--- read-back from the live database (eight books)"
  for eb in canon/joshua canon/revelation canon/romans canon/1-thessalonians canon/genesis canon/ezekiel apocrypha/2-esdras pseudepigrapha/2-baruch; do python3 _s503/tools/dump503.py "${eb%/*}" "${eb#*/}"; done
  python3 _s503/tools/check503.py
  echo "--- Matthew re-dumped too (the re-point pass and the summaries sweep build on it)"
  python3 _s503/tools/dump503.py canon matthew
  echo "=== done $(date)"
} 2>&1 | tee -a _session503_stragglers_deploy.log
echo
echo "The read-back above is the proof. Expected: 'notes rewritten as written: 27/27', 'members landed as written: 27/27', every book 'orphans left' 0,"
echo "and 'check503 stragglers: PASS (0 problem(s))'. If the migration RAISED ('differs from the read-back' / 'already sits in a thread'), the live data moved"
echo "since the dump: nothing landed — re-dump and rebuild, do not force it."
