#!/usr/bin/env bash
# S506 deploy — g6: 4 migration(s): session506_effort-over-accomplishment.sql, session506_son-of-adam-as.sql, session506_my-sheep-hear-my.sql, session506_the-seventy-sent-out.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session506_g6_deploy.sh        Log: _session506_g6_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S506 g6 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session506_effort-over-accomplishment.sql
  python3 api/apply_migration.py data-schema/migrations/session506_son-of-adam-as.sql
  python3 api/apply_migration.py data-schema/migrations/session506_my-sheep-hear-my.sql
  python3 api/apply_migration.py data-schema/migrations/session506_the-seventy-sent-out.sql
  echo "--- read-backs from the live database"
  python3 _s503/tools/dump503.py apocrypha 2-esdras
  python3 _s503/tools/dump503.py apocrypha baruch-with-the-letter-of-jeremiah
  python3 _s503/tools/dump503.py apocrypha ecclesiasticus
  python3 _s503/tools/dump503.py apocrypha the-prayer-of-manasseh
  python3 _s503/tools/dump503.py apocrypha the-wisdom-of-solomon
  python3 _s503/tools/dump503.py canon 1-john
  python3 _s503/tools/dump503.py canon 1-kings
  python3 _s503/tools/dump503.py canon 1-peter
  python3 _s503/tools/dump503.py canon 1-samuel
  python3 _s503/tools/dump503.py canon 2-timothy
  python3 _s503/tools/dump503.py canon acts
  python3 _s503/tools/dump503.py canon daniel
  python3 _s503/tools/dump503.py canon deuteronomy
  python3 _s503/tools/dump503.py canon ecclesiastes
  python3 _s503/tools/dump503.py canon exodus
  python3 _s503/tools/dump503.py canon ezekiel
  python3 _s503/tools/dump503.py canon galatians
  python3 _s503/tools/dump503.py canon genesis
  python3 _s503/tools/dump503.py canon hosea
  python3 _s503/tools/dump503.py canon isaiah
  python3 _s503/tools/dump503.py canon james
  python3 _s503/tools/dump503.py canon jeremiah
  python3 _s503/tools/dump503.py canon john
  python3 _s503/tools/dump503.py canon luke
  python3 _s503/tools/dump503.py canon mark
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/dump503.py canon micah
  python3 _s503/tools/dump503.py canon proverbs
  python3 _s503/tools/dump503.py canon psalms
  python3 _s503/tools/check506.py effort-over-accomplishment _s495/live
  python3 _s503/tools/check506.py son-of-adam-as-judge-and-ladder _s495/live
  python3 _s503/tools/check506.py my-sheep-hear-my-voice-hearing-reveals-not-creates _s495/live
  python3 _s503/tools/check506.py the-seventy-sent-out-as-yasharel-numbered-against-the-seventy-nations _s495/live
  echo "=== done $(date)"
} 2>&1 | tee -a _session506_g6_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
