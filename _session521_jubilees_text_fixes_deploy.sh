#!/usr/bin/env bash
# S521 deploy — Jubilees text corrections (margin years, scan misreadings, three "Lord" renderings, Gentiles restored).
# Live database only; no app rebuild. Safe to re-run (second run changes 0 rows).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session521_jubilees_text_fixes_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S521 Jubilees text fixes deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session521_jubilees_text_fixes.sql
  echo "=== done $(date)"
} 2>&1 | tee -a _session521_jubilees_text_fixes_deploy.log
echo
echo "Expected: a NOTICE line with the counts and 'Jubilees verses still carrying a defect: 0', then 'Migration committed'."
echo "If it RAISED, nothing landed — paste the output to Claude."
