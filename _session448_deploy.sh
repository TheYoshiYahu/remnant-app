#!/usr/bin/env bash
# S448 — voice display names: Heart → Olivia, Onyx → Ivan (ids unchanged, so
# the recordings and R2 paths are untouched). A reader who had already picked
# Heart or Onyx keeps that voice under its new name. Web only; the shells
# load the live site.
# Run:  bash ~/Desktop/App/_session448_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock

echo "=== 1/2 commit"
git add app/src/lib/recordedAudio.ts app/src/components/AudioPlayer.tsx _s448_add_extras_text.mjs \
  S446_SESSION_HANDOFF.md _session448_deploy.sh
git commit -m "S448: rename natural voices Heart → Olivia and Onyx → Ivan

Display names only; voice ids (af_heart, am_onyx) and the audio paths are
unchanged. Saved preferences carrying the old names still resolve.

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01QYJpUN9SvaGqRBG96koqZU"

echo "=== 2/2 push"
git push origin main
echo "=== done. Render is rebuilding the site (a few minutes)."
