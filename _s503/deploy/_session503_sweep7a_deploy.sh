#!/usr/bin/env bash
# S503 deploy — sweep7a: 3 migration(s): session503c_matthew-3-fruits-meet.sql, session503c_matthew-13-the-mustard.sql, session503c_gathering-of-the-scattered.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session503_sweep7a_deploy.sh        Log: _session503_sweep7a_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S503 sweep7a deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session503c_matthew-3-fruits-meet.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_matthew-13-the-mustard.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_gathering-of-the-scattered.sql
  echo "--- matthew read-back from the live database"
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/check503c.py matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11
  python3 _s503/tools/check503c.py matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4
  python3 _s503/tools/check503c.py gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit
  echo "=== done $(date)"
} 2>&1 | tee -a _session503_sweep7a_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
