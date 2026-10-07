#!/usr/bin/env bash
# S442 — Year Plan study, all five steps in one paste (YEAR_PLAN_STUDY_SPEC.md):
#   1. /plan — the whole plan laid out ahead of time
#   2. your own pace (finish by a date / chapters a day / week by week), synced
#   3. notes on any day or chapter
#   4. My Teachings builder + print / download
#   5. For Teachers (top tier) — assignments, answer keys, student/teacher copies
# Creates 4 new tables first (no content change, no cache purge), then pushes;
# Render rebuilds the API and the site from the push (a few minutes).
# Run:  bash ~/Desktop/App/_session442_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock

echo "=== 1/3 database: creating the new tables"
python3 api/apply_migration.py data-schema/migrations/session442_year_plan_study.sql

echo "=== 2/3 commit on a branch, merge into main"
BR=s442-year-plan-study
git switch -c "$BR"
git add api/main.py api/year_plan_study.py \
  data-schema/migrations/session442_year_plan_study.sql \
  app/src/App.tsx app/src/lib/api.ts app/src/lib/study-export.ts app/src/lib/study-blocks.ts \
  app/src/lib/book-source-class.ts app/src/lib/reading-plan \
  app/src/components/YearPlanHeader.tsx app/src/components/PlanLock.tsx \
  app/src/components/PlanNotes.tsx app/src/components/PassagePicker.tsx app/src/components/BlockEditor.tsx \
  app/src/routes/YearPlan.tsx app/src/routes/MyTeachings.tsx app/src/routes/Teach.tsx \
  app/_s442_paced_sanity.mjs \
  YEAR_PLAN_STUDY_SPEC.md S442_SESSION_OPEN_PROMPT.md _session442_deploy.sh
git commit -m "S442 Year Plan study — whole plan, own pace, notes, My Teachings, For Teachers

/plan lays out every day of the Read-in-a-Year plan (partner). Pace by finish
date, chapters a day, or weekly goals; today anchored, read-ahead re-spreads,
plan state synced to the account. Notes on any day or chapter. My Teachings
gathers notes, passages and writing into a teaching to print or download.
For Teachers (Everything tier): assignments from any stretch of the plan or
any passage, questions with answer keys, memory verses, student and teacher
copies with or without the chapter text. Server enforces both tiers.

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01TVGe3qrRNfcWaG5YWGkn1z"
git switch main
git merge --ff-only "$BR"
git branch -d "$BR"

echo "=== 3/3 push"
git push origin main
rm -f _scratch/s442_*.tgz
echo "=== done. Render is rebuilding the API and the site (a few minutes)."
echo "    Then open: https://bible.remnantofpromise.org/plan"
