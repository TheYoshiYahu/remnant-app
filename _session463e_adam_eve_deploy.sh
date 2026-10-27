#!/usr/bin/env bash
# S463e deploy — edition `adam-eve-conflict`: 1 and 2 Adam and Eve — 273 cards (16 rebuilt, 2 moved, 50 canon re-quotes, 10 phrase patches, 195 slug citations), 273 member notes, 119 summaries.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 changed, 273 already landed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session463e_adam_eve_deploy.sh
# Log: _session463e_adam_eve_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S463e adam-eve-conflict sweep deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session463e_adam_eve_sweep.sql
  python3 _s463e_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session463e_adam_eve_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof."
echo "The read-back counts ALL FOUR editions' rows, so before the other editions deploy it reports partial 'landed' counts;"
echo "after all four: 'cards landed as written: 468/468', 'member notes as written: 467/467', 'summaries as written: 154/154',"
echo "'not verbatim at cited verse: 0', 'canon lead ... OFF/REWORDED 0', 'rebuilt notes carrying the whole live verse verbatim: 74/74',"
echo "'degraded markers left on anchored cards: 0 | hyphen-chain prose left: 0 | slug citations left: 0 | ... stale Testaments cites left: 0', 'duplicate same-direction pairs: 0'."
