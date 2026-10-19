#!/usr/bin/env bash
# S459 deploy — 1 Enoch cross-reference card fix (live database only; no app rebuild, no Render push needed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session459_enoch_card_fix_deploy.sh
#
# What it does, in order (each step is safe to re-run):
#  1. Applies data-schema/migrations/session459_enoch_card_fix.sql to the live DB:
#       362 cards re-quoted from the live Charles 1917 text (201 of them re-pointed to the verse the words live on; ids kept),
#       329 thread member notes updated, 2 duplicate cards retired. Skips (with a NOTICE) any card edited since the S457 read-back.
#  2. Reads the live DB back (_s459_check.py) and re-grades every Enoch quote: expect "flagged (should be 0): 0".
# Log: _session459_enoch_card_fix_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S459 Enoch card fix deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session459_enoch_card_fix.sql
  python3 _s459_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session459_enoch_card_fix_deploy.log
echo
echo "Read the S459 summary line: expect 'cards re-quoted in place 161, moved + re-quoted 201, ... skipped 0, absent 0; member notes updated 329; cards retired 2'."
echo "Then the read-back: 'flagged (should be 0): 0' and 'moved cards now at their new address: 201/201'."
