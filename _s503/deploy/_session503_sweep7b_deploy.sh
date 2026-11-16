#!/usr/bin/env bash
# S503 deploy — sweep7b: 4 migration(s): session503c_nazareth-scroll-the-acceptable.sql, session503c_luke-4-the-individual.sql, session503c_mark-7-the-corban.sql, session503c_rich-man-and-lazaros.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session503_sweep7b_deploy.sh        Log: _session503_sweep7b_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S503 sweep7b deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session503c_nazareth-scroll-the-acceptable.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_luke-4-the-individual.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_mark-7-the-corban.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_rich-man-and-lazaros.sql
  echo "--- luke read-back from the live database"
  python3 _s503/tools/dump503.py canon luke
  echo "--- mark read-back from the live database"
  python3 _s503/tools/dump503.py canon mark
  python3 _s503/tools/check503c.py nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases
  python3 _s503/tools/check503c.py luke-4-the-individual-mercy-contrast-cases-elijah-elisha-and-the-famine-in-sirach-48
  python3 _s503/tools/check503c.py mark-7-the-corban-tradition-voids-the-fifth-commandment-in-sirach
  python3 _s503/tools/check503c.py rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test
  echo "=== done $(date)"
} 2>&1 | tee -a _session503_sweep7b_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
