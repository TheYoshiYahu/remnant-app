#!/usr/bin/env bash
# S456 deploy — canon (KJV) presentation fix after the S455 content audit (migration session455b_canon_fix.sql).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session456_deploy.sh
#
# The FILE side already landed in the session (source-texts/kjv-canon-audit/fix_canon.py, re-runnable):
#   parsed/canon.json updated in place (backup canon.json.pre-s455b): 116 Psalm superscriptions + the Psalm 119 acrostic
#   note as chapter titles; Psalm 119's 21 stanza letters stripped; 14 Pauline subscriptions moved to the JSON footnote;
#   Amos 3:7 / 1 John 3:4-8 / Psalm 81:3 flagged yoshi-rendering (registered in restoration-pipeline/YOSHI_RENDERED_PASSAGES.md);
#   Romans 15:30 echo. Verified by content: 31,077 word-identical to the KJV, 0 differ, 25 registered renderings, 0 missing, 0 extra.
# This script does the one thing that needs YOUR machine's login:
#   applies session455b_canon_fix.sql to the live DB — 117 chapter_title UPDATEs, 36 surgical verse UPDATEs, ids unchanged,
#   no verse numbers change, no card moves. Tested twice (both text registers) on a scratch Postgres, idempotent.
# Logs: _session456_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S456 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session455b_canon_fix.sql
  echo "=== done $(date)"
} 2>&1 | tee -a _session456_deploy.log
echo
echo "Read the NOTICE lines: BEFORE 31102 rows, titled 0; 'stanza letters stripped from 21 verses'; 'subscriptions cut: 14';"
echo "'Romans 15:30 echo fixed: 1'; AFTER '117 Psalm titles in place'. If the migration raised an EXCEPTION, nothing changed —"
echo "copy the message to Claude next session (it names the verse whose live text did not match what the audit expected)."
echo "Then read back:  python3 ~/Desktop/App/_s456_check.py"
echo
echo "No recording now — Psalm 119 + the 14 epistle chapters are QUEUED for the voices lane (_s456_canon_audio_redo.mjs)."
echo "The file side (canon.json, the registry, the migration, the handoff) goes into git with this; the push is yours:"
echo "  cd ~/Desktop/App && git add -A && git commit -m 'S456: canon KJV fix — Psalm titles, Psalm 119 acrostic, epistle subscriptions, Rom 15:30; 7 Yoshi renderings registered' && git push"
