#!/usr/bin/env bash
# S458a deploy — 1 Enoch 71:13-14: "You are the son of Adam" restored in the live text (two verse rows, ids kept).
# Live database only; no app rebuild, no Render push. Safe to re-run.
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session458a_enoch_71_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S458a deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session458a_enoch_71_address.sql
  python3 _s458a_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session458a_enoch_71_deploy.log
echo
echo "Read the last line: expect 'S458a read-back: 2/2 verses hold the restored text'."
