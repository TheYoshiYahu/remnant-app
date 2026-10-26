#!/usr/bin/env bash
# S472 — People & places pages + family-line trees (Study Notes).
# 1) loads the verified people/places data into the live database,
# 2) reads it back, 3) commits the API + app code. The push is yours.
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session472_people_places_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S472 people & places deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session472_people_places.sql
  python3 _s472_check.py
} 2>&1 | tee -a _session472_people_places_deploy.log

git add api/people_places.py api/main.py \
  app/src/components/PeopleSheet.tsx app/src/components/ToolSheet.tsx \
  app/src/lib/api.ts app/src/routes/Attributions.tsx app/src/data/newFeatures.ts \
  data-schema/migrations/session472_people_places.sql \
  _s472_people_places_build.py _s472_check.py _session472_people_places_deploy.sh \
  people-places/S472_VERIFY_REPORT.md people-places/people_places.json \
  people-places/s472_app_tsx_only.patch \
  "source-texts/stepbible-data/Proper Nouns" S451_APP_FEATURE_ROADMAP.md S473_SESSION_OPEN_PROMPT.md

# App.tsx also holds the S470 offline changes, which stay uncommitted on purpose.
# Stage ONLY the S472 lines of App.tsx:
git apply --cached people-places/s472_app_tsx_only.patch

git commit -m "S472: People & places pages + family-line trees (Study Notes), verified against our own text

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01SqeojqDHzGyFUiJvmRjNxm"

echo
echo "Committed. Now push it yourself:   git push"
echo "Render rebuilds the API and the website on its own; give it a few minutes."
