#!/usr/bin/env bash
# S439 — tells every installed app to drop its cached content and reload.
# Run:  bash ~/Desktop/App/_session439_refresh_apps.sh
set -euo pipefail
cd "$(dirname "$0")"
python3 api/apply_migration.py data-schema/migrations/session439_content_version_bump.sql
