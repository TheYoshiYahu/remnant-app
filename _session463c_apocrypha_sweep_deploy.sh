#!/usr/bin/env bash
# S463c deploy — Apocrypha + 3 Maccabees card sweep: 485 notes rebuilt Come-and-See (1 re-pointed, 4507 → Ecclesiasticus 35:14),
# 22 quotations re-quoted from the live text, 3 citations widened to the verses spanned, 63 slug citations → English book names,
# 607 member notes, 55 thread summaries.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 changed, 573 already landed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session463c_apocrypha_sweep_deploy.sh
# Log: _session463c_apocrypha_sweep_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S463c Apocrypha + 3 Maccabees sweep deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session463c_apocrypha_sweep.sql
  python3 _s463c_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session463c_apocrypha_sweep_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof."
echo "Expect: 'cards landed as written: 573/573', 'member notes as written: 607/607', 'summaries as written: 55/55',"
echo "        'not verbatim at cited verse: 0', 'degraded markers left on anchored cards: 0', 'hyphen-chain prose left ... 0', 'slug citations left ... 0'."
