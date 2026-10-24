#!/usr/bin/env bash
# S463d deploy — Book of Jasher card sweep: 53 notes rebuilt Come-and-See, 3 quotations re-quoted from the live text (4265, 30027, 20237 cited 13:22–23),
# 2 quotation patches on S450-changed verses (49945, 54994), 1 card re-pointed (31322 Jasher 34:60 → 34:55), 58 member notes, 65 thread summaries.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 changed, 59 already landed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session463d_jasher_sweep_deploy.sh
# Log: _session463d_jasher_sweep_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S463d Jasher sweep deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session463d_jasher_sweep.sql
  python3 _s463d_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session463d_jasher_sweep_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof."
echo "Expect: 'cards landed as written: 59/59', 'member notes as written: 58/58', 'summaries as written: 65/65',"
echo "        'not verbatim at cited verse: 0', 'rebuilt notes carrying the whole live Jasher verse verbatim: 53/53',"
echo "        'degraded markers left on anchored cards: 0', 'hyphen-chain prose left ... 0', 'slug citations left ... 0', 'duplicate same-direction pairs: 0'."
