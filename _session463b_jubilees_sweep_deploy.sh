#!/usr/bin/env bash
# S463b deploy — Jubilees card sweep: 126 notes rebuilt Come-and-See, 140 cards re-pointed to the verse their words sit in,
# 92 citations widened to the verses their quotation spans, 256 member notes, 5 thread summaries.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 changed, 347 already landed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session463b_jubilees_sweep_deploy.sh
# Log: _session463b_jubilees_sweep_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S463b Jubilees sweep deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session463b_jubilees_sweep.sql
  python3 _s463b_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session463b_jubilees_sweep_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof."
echo "Expect: 'cards landed as written: 347/347', 'member notes as written: 256/256', 'summaries as written: 5/5',"
echo "        'not verbatim at cited verse: 0', 'degraded markers left on Jubilees-anchored cards: 0'."
