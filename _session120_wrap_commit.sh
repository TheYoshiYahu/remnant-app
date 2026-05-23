#!/bin/bash
# Session 120 wrap-commit — REBUILD_STATE.md updated with the S120 wheel
# summary, the locked 13-wheel pre-launch sweep sequence, the naming
# confirmation, the 6 discipline learnings, and the trimmed S118 entry
# (older than keep-last-1-2 window). Separate from the Wheel 1 commit
# that already shipped.
#
# Usage: bash ~/Desktop/App/_session120_wrap_commit.sh

set -e
cd "$(dirname "$0")"

echo "==> Step 1/3: clear stale git lock files (no-op if absent)"
rm -f .git/index.lock .git/HEAD.lock
echo "    done"
echo ""

echo "==> Step 2/3: targeted git add for the wrap-commit"
git add REBUILD_STATE.md
git add _session120_wrap_commit.sh
echo "    done"
echo ""

echo "==> Step 3/3: git status (verify what's staged before commit)"
git status --short
echo ""

read -r -p "Commit and push? [y/N] " ANSWER
if [ "$ANSWER" != "y" ] && [ "$ANSWER" != "Y" ]; then
  echo "Aborted. Staging stays in place; re-run when ready."
  exit 0
fi

echo ""
echo "==> commit + push"
git commit -m 'S120 wrap REBUILD_STATE updated with Wheel 1 ship plus sweep sequence plus disciplines'
git push
echo ""
echo "==> DONE. S120 session closed."
