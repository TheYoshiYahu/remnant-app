#!/usr/bin/env bash
# S506 deploy — g3: 4 migration(s): session506_sanhedrin-trial-tehillim-110.sql, session506_last-supper-this-is.sql, session506_sheep-and-goats-judgment.sql, session506_great-commission-all-nations.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session506_g3_deploy.sh        Log: _session506_g3_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S506 g3 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session506_sanhedrin-trial-tehillim-110.sql
  python3 api/apply_migration.py data-schema/migrations/session506_last-supper-this-is.sql
  python3 api/apply_migration.py data-schema/migrations/session506_sheep-and-goats-judgment.sql
  python3 api/apply_migration.py data-schema/migrations/session506_great-commission-all-nations.sql
  echo "--- read-backs from the live database"
  python3 _s503/tools/dump503.py canon ezekiel
  python3 _s503/tools/dump503.py canon luke
  python3 _s503/tools/dump503.py canon mark
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/check506.py sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth _s495/live
  python3 _s503/tools/check506.py last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament _s495/live
  python3 _s503/tools/check506.py sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory _s495/live
  python3 _s503/tools/check506.py great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance _s495/live
  echo "=== done $(date)"
} 2>&1 | tee -a _session506_g3_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
