#!/usr/bin/env bash
# S505 deploy — abbrev: 1 migration: session505_abbrev_book_names.sql (264 cards in 2 Baruch + Testaments XII: opening book-name abbreviations expanded; no redraft).
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session505_abbrev_deploy.sh        Log: _session505_abbrev_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S505 abbrev deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session505_abbrev_book_names.sql
  echo "--- 2 Baruch and Testaments XII read-back from the live database"
  python3 _s503/tools/dump503.py pseudepigrapha 2-baruch
  python3 _s503/tools/dump503.py pseudepigrapha testaments-xii
  python3 _s503/tools/check505_abbrev.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session505_abbrev_deploy.log
echo
echo "The read-back above is the proof: the check line must end PASS (0 problem(s)). If the migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
