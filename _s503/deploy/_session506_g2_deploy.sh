#!/usr/bin/env bash
# S506 deploy — g2: 4 migration(s): session506_eli-eli-lama-sabachthani.sql, session506_the-resurrection-substance-tehillim.sql, session506_trinitarian-baptism-formula-and.sql, session506_women-as-the-first.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session506_g2_deploy.sh        Log: _session506_g2_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S506 g2 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session506_eli-eli-lama-sabachthani.sql
  python3 api/apply_migration.py data-schema/migrations/session506_the-resurrection-substance-tehillim.sql
  python3 api/apply_migration.py data-schema/migrations/session506_trinitarian-baptism-formula-and.sql
  python3 api/apply_migration.py data-schema/migrations/session506_women-as-the-first.sql
  echo "--- read-backs from the live database"
  python3 _s503/tools/dump503.py canon luke
  python3 _s503/tools/dump503.py canon mark
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/check506.py eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance _s495/live
  python3 _s503/tools/check506.py the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance _s495/live
  python3 _s503/tools/check506.py trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid _s495/live
  python3 _s503/tools/check506.py women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance _s495/live
  echo "=== done $(date)"
} 2>&1 | tee -a _session506_g2_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
