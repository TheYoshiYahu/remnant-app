#!/usr/bin/env bash
# S122 wrap — REBUILD_STATE.md final updates from the post-deploy
# scope conversation. The DESIGN_LANGUAGE.md + code changes already
# shipped at commit 29d5250; this commit lands the verbal-answers-
# transcribe pass for the S123 + S124 scope locks and the sweep
# re-sequence to 14 wheels.
#
# Run from anywhere: `bash ~/Desktop/App/_session122_wrap.sh`

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S122 wrap — REBUILD_STATE.md final transcription"
echo

# Stray empty 'main' file from earlier session — clean up.
if [ -f "$APP_DIR/main" ] && [ ! -s "$APP_DIR/main" ]; then
    rm -f "$APP_DIR/main"
    echo "==> cleaned up stray empty 'main' file"
fi

echo "==> staging REBUILD_STATE.md and this script:"
git add REBUILD_STATE.md "$0"

echo
echo "==> diff summary:"
git diff --cached --stat
echo

read -rp "Commit + push? [y/N] " ans
if [[ "${ans:-N}" != "y" && "${ans:-N}" != "Y" ]]; then
    echo "Aborted — staged changes left in place."
    exit 1
fi

git commit -m "S122 wrap REBUILD_STATE final transcription plus sweep re-sequence to 14 wheels" \
           -m "Post-deploy scope conversation: multi-verse highlight scope-added to the sweep; Bookmarks plus Notes V1 (was W5) pulled forward; shared range-selection architecture inserted as new W4 ahead of Search V1. Total sweep grows from 13 to 14 wheels. S123 scope locked as range-selection architecture plus multi-verse highlight (first consumer of the shared mechanic). S124 scope locked as Bookmarks (with short_description field) plus Notes V1 (single global notepad per section 9). Architecture-now-beats-retrofit-later forward standard re-confirmed (third instance after S121 W3 menu and S122 partner-tier resolution)." \
           -m "Next-wheels Notes/Bookmarks section updated with the bookmark-vs-notes-distinct-surfaces lock plus the multi-verse highlight scope-add plus the bookmark short_description spec. Section 9 single-global-notepad-Free split holds; Notes tier (\$1.99) still gates separate-per-verse notes plus hub."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> S122 wrap done. Session closed."
