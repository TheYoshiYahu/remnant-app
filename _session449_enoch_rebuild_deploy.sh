#!/usr/bin/env bash
# S449 deploy — 1 Enoch, all 108 chapters rebuilt to Charles 1917 (DATABASE ONLY; no app rebuild).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session449_enoch_rebuild_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
python3 api/apply_migration.py data-schema/migrations/session449_enoch_full_rebuild.sql 2>&1 | tee _session449_enoch_rebuild.log
echo "=== applied. Log saved to _session449_enoch_rebuild.log"
