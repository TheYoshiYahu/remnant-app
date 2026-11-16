#!/usr/bin/env bash
# S506 deploy — g5: 2 migration(s): session506_gethsemane-cup-of-suffering.sql, session506_parable-of-the-talents.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session506_g5_deploy.sh        Log: _session506_g5_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S506 g5 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session506_gethsemane-cup-of-suffering.sql
  python3 api/apply_migration.py data-schema/migrations/session506_parable-of-the-talents.sql
  echo "--- read-backs from the live database"
  python3 _s503/tools/dump503.py canon genesis
  python3 _s503/tools/dump503.py canon luke
  python3 _s503/tools/dump503.py canon mark
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/check506.py gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father _s495/live
  python3 _s503/tools/check506.py parable-of-the-talents-stewardship-and-the-unprofitable-servant-cast-into-outer-darkness _s495/live
  echo "=== done $(date)"
} 2>&1 | tee -a _session506_g5_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
