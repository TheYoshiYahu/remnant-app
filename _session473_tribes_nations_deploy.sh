#!/usr/bin/env bash
# S473 — Tribe & nation pages (Study Notes), on top of S472 people & places.
# 1) loads the rebuilt people & places data (now with tribe & nation pages) into the live database,
# 2) reads it back, 3) commits the API + app code. The push is yours.
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session473_tribes_nations_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S473 tribe & nation pages deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session473_people_places.sql
  python3 _s473_check.py
} 2>&1 | tee -a _session473_tribes_nations_deploy.log

# Only S473's own files. App.tsx and the S470 offline files stay uncommitted on purpose.
git add api/people_places.py \
  app/src/components/PeopleSheet.tsx app/src/lib/api.ts app/src/data/newFeatures.ts \
  data-schema/migrations/session473_people_places.sql \
  _s473_tribes_nations_build.py _s473_check.py _session473_tribes_nations_deploy.sh \
  people-places/S473_TRIBES_NATIONS_REPORT.md people-places/people_places.json \
  tts/splice_names.py tts/record_splice.sh tts/record_bible.sh \
  app/src/lib/recordedAudio.ts app/src/components/AudioPlayer.tsx \
  S451_APP_FEATURE_ROADMAP.md S474_SESSION_OPEN_PROMPT.md

git commit -m "S473: Tribe & nation pages in People & places (Study Notes), verified against our own text; Michael voice removed (Olivia default)

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_011sFZcwTP25K6JvFCPWgxjU"

echo
echo "Committed. Now push it yourself:   git push"
echo "Render rebuilds the API and the website on its own; give it a few minutes."
