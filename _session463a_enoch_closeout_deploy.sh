#!/usr/bin/env bash
# S463a deploy — 1 Enoch close-out: the 63 degraded cards rewritten + the glosses on rebuilt verses re-pointed/re-worded
# (live database only; no app rebuild, no Render push needed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session463a_enoch_closeout_deploy.sh
#
# What it does, in order (each step is safe to re-run):
#  1. Applies data-schema/migrations/session463a_enoch_closeout.sql to the live DB:
#       141 notes rewritten in place, 349 cards re-pointed to the live verse their old text came from (ids kept),
#       410 thread member notes updated, 61 duplicate cards retired (listed in the report).
#       Skips (with a NOTICE) any card edited since the Oct 19 read-back; RAISES (and rolls back whole) if the live
#       1 Enoch text differs from that read-back.
#  2. Reads the live DB back (_s463a_check.py): re-dumps enoch-cards-live.json, re-grades every Enoch quote, and checks
#       every S463a card landed as written. Expect "flagged (should be 0): 0" and "landed as written: 490/490".
# Log: _session463a_enoch_closeout_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S463a Enoch close-out deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session463a_enoch_closeout.sql
  python3 _s463a_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session463a_enoch_closeout_deploy.log
echo
echo "Read the S463a summary line: expect 'notes rewritten in place 141, moved + rewritten 349, ... skipped 0, absent 0; member notes updated 410; cards retired 61'."
echo "Then the read-back: 'flagged (should be 0): 0', 'landed as written: 490/490', 'degraded markers left on Enoch cards: 0'."
