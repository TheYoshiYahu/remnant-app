#!/usr/bin/env bash
# S499c deploy — canon / Matthew 15:21–28 — the Canaanite-woman thread (id 30911) rewritten on Yoshi's reading (Nov 13):
# title + summary rewritten (slug kept), 7 cards rewritten in place with their member notes (124214 124215 124216 124217 2876 177460 3520).
# Live database only; nothing deleted, no card re-pointed. Safe to re-run (second run: 0 / 0 / 0).
# Needs, under ~/Desktop/App: data-schema/migrations/session499c_matthew_15_canaanite_thread.sql · _s496/c15/fix.json · _s496/tools/ · _s495/tools/
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session499c_canaanite_thread_deploy.sh      Log: _session499c_canaanite_thread_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S499c Canaanite-woman thread deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session499c_matthew_15_canaanite_thread.sql
  echo "--- read-back from the live database"
  mkdir -p _s496/scratch
  python3 _s496/tools/dump496.py matthew _s496/scratch/matthew_s499c_live_after.json
  python3 _s496/tools/check_s499c.py _s496/scratch/matthew_s499c_live_after.json
  echo "=== done $(date)"
} 2>&1 | tee -a _session499c_canaanite_thread_deploy.log
echo
echo "Expected: 'notes as written: 7/7 | member notes as written: 7/7 | thread 30911 title+summary as written: yes' and 'check_s499c: PASS (0 problem(s))'."
echo "If the migration RAISED, the live data moved since the 20:11 read-back: nothing landed — tell Claude, do not force it."
