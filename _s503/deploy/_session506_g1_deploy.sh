#!/usr/bin/env bash
# S506 deploy — g1: 4 migration(s): session506_thirty-pieces-of-silver.sql, session506_veil-of-the-temple.sql, session506_parable-of-the-ten.sql, session506_his-blood-be-on.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session506_g1_deploy.sh        Log: _session506_g1_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S506 g1 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session506_thirty-pieces-of-silver.sql
  python3 api/apply_migration.py data-schema/migrations/session506_veil-of-the-temple.sql
  python3 api/apply_migration.py data-schema/migrations/session506_parable-of-the-ten.sql
  python3 api/apply_migration.py data-schema/migrations/session506_his-blood-be-on.sql
  echo "--- read-backs from the live database"
  python3 _s503/tools/dump503.py canon ezekiel
  python3 _s503/tools/dump503.py canon genesis
  python3 _s503/tools/dump503.py canon luke
  python3 _s503/tools/dump503.py canon mark
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/check506.py thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment _s495/live
  python3 _s503/tools/check506.py veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross _s495/live
  python3 _s503/tools/check506.py parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life _s495/live
  python3 _s503/tools/check506.py his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance _s495/live
  echo "=== done $(date)"
} 2>&1 | tee -a _session506_g1_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
