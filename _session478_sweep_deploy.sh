#!/usr/bin/env bash
# S478 deploy — edition `pseudepigrapha`, books adam-eve (784) + 4 Maccabees (789): 73 cards (12 rebuilt Come-and-See, 12 moved,
# 15 phrase patches, 35 old-numbering citation fixes, 3 canon re-quotes), 71 member notes, 58 thread summaries.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 changed, 73 already landed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session478_sweep_deploy.sh      Log: _session478_sweep_deploy.log (gitignored)
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S478 adam-eve + 4 Maccabees sweep deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session478_adam_eve_4macc_sweep.sql
  python3 _s478_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session478_sweep_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof. Expected:"
echo "  'cards landed as written: 73/73 []', 'member notes as written: 71/71', 'summaries as written: 58/58',"
echo "  'own-book italic quotations: {STAND: 13, NOT_FOUND: 1}' (the 1 is 63499 quoting Deuteronomy — known false positive),"
echo "  'canon lead ... OFF/REWORDED 0', 'rebuilt notes carrying the whole live verse verbatim: 12/12',"
echo "  'degraded markers left: 0 | hyphen-chain prose left: 0 | slug citations left: 0 | Hebrew book names left: 0',"
echo "  'old-numbering citations left in prose: 0', 'duplicate same-direction pairs: 0'."
