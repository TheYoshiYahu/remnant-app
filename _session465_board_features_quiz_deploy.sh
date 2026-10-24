#!/bin/bash
# S465 — Suggestion Board, New Features tab (red dot), Plan quiz on /pricing.
# Also fixes the S464 build break (unused import in Today.tsx).
set -e
cd ~/Desktop/App

git add api/board.py api/suggestions.py api/main.py \
  app/src/components/SuggestionBoard.tsx app/src/components/SuggestionBox.tsx \
  app/src/components/PlanQuiz.tsx app/src/routes/NewFeatures.tsx \
  app/src/data/newFeatures.ts app/src/routes/Settings.tsx app/src/routes/Pricing.tsx \
  app/src/routes/Today.tsx app/src/App.tsx app/src/lib/api.ts app/src/index.css \
  _session465_board_features_quiz_deploy.sh

git commit -m "S465: Suggestion Board (moderated, anonymous votes, creator marks), New features list with red dot, plan quiz on /pricing; fix S464 unused import

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_018vqo3xjxGgj8MaeDM9AAar"

git push
echo "Pushed. Render builds the API and the site on its own; give it a few minutes."
