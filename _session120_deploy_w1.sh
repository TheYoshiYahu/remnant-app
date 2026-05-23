#!/bin/bash
# Session 120 Wheel 1 deploy — Strong's tap-on-word data foundation + API
# + product-name drift fix. Self-contained (no chat paste fragility):
# downloads Strong's XML if not present, stages targeted files (per the
# REBUILD_STATE 'targeted git add not -A' discipline), shows git status
# for inspection, prompts before commit, commits + pushes.
#
# Usage: bash ~/Desktop/App/_session120_deploy_w1.sh
#
# Recovery script after the chat-paste dquote> trap at S120. Forward
# rule transcribed at session close: deploy sequences ship as .sh files
# you bash-invoke, never as multi-line chat blocks with quotes + continuations.

set -e
cd "$(dirname "$0")"

echo "==> Step 1/5: clear stale git lock files (no-op if absent)"
rm -f .git/index.lock .git/HEAD.lock
echo "    done"
echo ""

echo "==> Step 2/5: verify Strong's XML is on disk; download if missing"
if [ ! -s source-texts/strongs-hebrew/strongs-hebrew-dictionary.xml ] || \
   [ ! -s source-texts/strongs-greek/strongs-greek-dictionary.xml ]; then
  echo "    Strong's XML missing — running download script"
  bash source-texts/download-strongs.sh
else
  echo "    Hebrew: $(du -h source-texts/strongs-hebrew/strongs-hebrew-dictionary.xml | cut -f1)"
  echo "    Greek:  $(du -h source-texts/strongs-greek/strongs-greek-dictionary.xml | cut -f1)"
fi
echo ""

echo "==> Step 3/5: targeted git add (per REBUILD_STATE discipline)"
git add source-texts/download-strongs.sh
# Add whole strongs-hebrew/ + strongs-greek/ dirs — covers StrongHebrewG.xml
# plus the Greek zip + the per-entry XML files extracted from it. Cleaner
# than enumerating thousands of Greek XML files.
git add source-texts/strongs-hebrew/
git add source-texts/strongs-greek/
git add restoration-pipeline/_session120_load_strong_entries.py
git add restoration-pipeline/_session120_load_verse_words.py
git add api/Dockerfile
git add .dockerignore
git add api/models.py
git add api/main.py
git add DESIGN_LANGUAGE.md
git add S118_READ_THE_SCRIPTURES_PAGE_SPEC.md
git add REBUILD_STATE.md
git add _session120_deploy_w1.sh
echo "    done"
echo ""

echo "==> Step 4/5: git status (verify what's staged before commit)"
git status --short
echo ""

read -r -p "Commit and push? [y/N] " ANSWER
if [ "$ANSWER" != "y" ] && [ "$ANSWER" != "Y" ]; then
  echo "Aborted. Staging stays in place; re-run when ready."
  exit 0
fi

echo ""
echo "==> Step 5/5: commit + push"
git commit -m 'S120 W1 Strongs tap-on-word data foundation + API + name-drift fix'
git push
echo ""
echo "==> DONE. Watch Render for the redeploy (~3-5 min)."
echo ""
echo "When Render is green, run from Render Shell:"
echo "  python3 /restoration-pipeline/_session120_load_strong_entries.py --no-confirm"
echo "  python3 /restoration-pipeline/_session120_load_verse_words.py --no-confirm"
echo ""
echo "Verify live:"
echo "  curl https://api.bible.remnantofpromise.org/v1/strongs/H0001"
echo "  curl https://api.bible.remnantofpromise.org/v1/strongs/G3056"
echo "  curl https://api.bible.remnantofpromise.org/v1/verses/1/words"
