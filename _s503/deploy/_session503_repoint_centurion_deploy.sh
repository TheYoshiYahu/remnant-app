#!/usr/bin/env bash
# S503 deploy — repoint_centurion: 2 Matthew migration(s): session503b_matthew_repoint.sql, session503c_matthew-8-many-from.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session503_repoint_centurion_deploy.sh        Log: _session503_repoint_centurion_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S503 repoint_centurion deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session503b_matthew_repoint.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_matthew-8-many-from.sql
  echo "--- Matthew read-back from the live database"
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/check503b.py
  python3 _s503/tools/check503c.py matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1
  echo "=== done $(date)"
} 2>&1 | tee -a _session503_repoint_centurion_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
