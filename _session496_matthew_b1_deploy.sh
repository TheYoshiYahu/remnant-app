#!/usr/bin/env bash
# S496 deploy — canon / Matthew 1–7 — Phase 2 REBUILD batch b1:
# 200 orphan cards rewritten in place (Come-and-See, both verses; ids kept), 3 new threads, 10 unanchored threads anchored, 200 thread members added.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 rewritten / 0 inserted / 0 anchored).
# Needs, under ~/Desktop/App:  data-schema/migrations/session496_matthew_b1_rebuild.sql · _s496/tools/ · _s496/fix/matthew_b1.json · _s495/tools/ (common495, dump495)
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session496_matthew_b1_deploy.sh        Log: _session496_matthew_b1_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S496 Matthew 1–7 rebuild deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session496_matthew_b1_rebuild.sql
  echo "--- read-back from the live database"
  mkdir -p _s496/scratch
  python3 _s496/tools/dump496.py matthew _s496/scratch/matthew_b1_live_after.json
  python3 _s496/tools/check496.py b1 _s496/scratch/matthew_b1_live_after.json
  echo "=== done $(date)"
} 2>&1 | tee -a _session496_matthew_b1_deploy.log
echo
echo "The read-back above is the proof. Expected:"
echo "  'notes rewritten as written: 200/200', 'members landed as written: 200/200', 'new threads landed as written: 3/3', 'anchors set as written: 10/10',"
echo "  'duplicate (src,tgt,source) pairs in matthew: 0', chapters 1–7 each with 'orphans left' 0, and 'check496 matthew b1: PASS (0 problem(s))'."
echo "If the migration RAISED ('differs from the read-back' / 'already sits in a thread' / 'different anchor'), the live data moved since the Nov 9 dump: nothing landed — re-dump and rebuild, do not force it."
