#!/usr/bin/env bash
# S440 — Order of the End open questions (Matthew 25, the saints, Ezekiel 37,
# Ascension of Isaiah 4:16) + Ascension of Isaiah 3:15 / 4:14 / 4:15 restored
# to the Ethiopic. Ends with a schema_version bump so apps refresh.
# Run:  bash ~/Desktop/App/_session440_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
python3 api/apply_migration.py data-schema/migrations/session440_order_of_end_open_questions_and_ascension_isaiah.sql
