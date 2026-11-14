#!/usr/bin/env bash
# S496 deploy — canon / Luke 1–24 — Phase 2 REBUILD batch l1:
# 61 orphan cards rewritten in place (Come-and-See, both verses; ids kept), 1 new threads, 1 unanchored threads anchored, 61 thread members added.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 rewritten / 0 inserted / 0 anchored).
# Needs, under ~/Desktop/App:  data-schema/migrations/session496_luke_l1_rebuild.sql · _s496/tools/ · _s496/fix/luke_l1.json · _s495/tools/ (common495, dump495)
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session496_luke_l1_deploy.sh        Log: _session496_luke_l1_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S496 Luke 1–24 rebuild deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session496_luke_l1_rebuild.sql
  echo "--- read-back from the live database"
  mkdir -p _s496/scratch
  python3 _s496/tools/dump496.py luke _s496/scratch/luke_l1_live_after.json
  python3 _s496/tools/check496.py l1 _s496/scratch/luke_l1_live_after.json
  echo "=== done $(date)"
} 2>&1 | tee -a _session496_luke_l1_deploy.log
echo
echo "The read-back above is the proof. Expected:"
echo "  'notes rewritten as written: 61/61', 'members landed as written: 61/61', 'new threads landed as written: 1/1', 'anchors set as written: 1/1',"
echo "  'duplicate (src,tgt,source) pairs in luke: 0', chapters 1–24 each with 'orphans left' 0, and 'check496 luke l1: PASS (0 problem(s))'."
echo "If the migration RAISED ('differs from the read-back' / 'already sits in a thread' / 'different anchor'), the live data moved since the dump: nothing landed — re-dump and rebuild, do not force it."
