#!/usr/bin/env bash
# S460 deploy — 1 Enoch thread-summary fix (live database only; no app rebuild, no Render push needed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session460_enoch_summary_fix_deploy.sh
#
# What it does, in order (each step is safe to re-run):
#  1. Applies data-schema/migrations/session460_enoch_summary_fix.sql to the live DB:
#       531 thread summaries replaced (306 rewritten, 59 adjusted, 166 re-quoted from the live verse), 168 titles changed; ids/slugs kept.
#       Skips (with a NOTICE) any thread whose summary was edited since the Oct 20 00:01 read-back; RAISES and rolls back whole
#       if any quoted 1 Enoch verse is no longer the live text.
#  2. Reads the live DB back (_s460_check.py) and re-grades every Enoch quote in every summary: expect "REWRITE 0, RE_QUOTE 0, bad quotes 0".
# Log: _session460_enoch_summary_fix_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S460 Enoch summary fix deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session460_enoch_summary_fix.sql
  python3 _s460_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session460_enoch_summary_fix_deploy.log
echo
echo "The migration's own NOTICE lines are not printed by apply_migration.py — the schema_version row and the read-back are the proof."
echo "Expect the read-back line: 'REWRITE 0, RE_QUOTE 0, bad quotes 0' and 'fixed summaries now live as written: 532/532'."
