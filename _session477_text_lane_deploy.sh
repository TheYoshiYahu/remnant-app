#!/usr/bin/env bash
# S477 deploy — text lane for Charles's Books of Adam and Eve (book 784, 312 -> 141 verses) and 4 Maccabees (book 789, 467 -> 247 verses):
# the line-end verse breaks merged back into whole clauses, chapters kept, verses renumbered, the 533 cards and 112 thread anchors
# re-pointed by content (ids kept). Live database only; the app's paragraph_starts.json for these books changes in the same git push.
# Safe to re-run (second run: both books already landed, 0 changed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session477_text_lane_deploy.sh
# Log: _session477_text_lane_deploy.log (gitignored like every *.log — never in a git add)
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S477 text lane deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session477_adam_eve_4macc_text_lane.sql
  python3 _s477_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session477_text_lane_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof. Expected:"
echo "  'adam-eve: live verses 141 (expected 141); verses landed with the merged text 141/141; extra live verses 0'"
echo "  '4-maccabees: live verses 247 (expected 247); verses landed with the merged text 247/247; extra live verses 0'"
echo "  'cards at their new address: 533/533', 'thread anchors at their new range: 112/112', 'duplicate same-direction pairs: 0', 'member notes on the 533 cards: 533/533'."
