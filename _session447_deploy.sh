#!/usr/bin/env bash
# S447 — Android: chapter break while the phone is locked switched to the
# phone's robot voice. The next chapter is now fully warmed while the current
# one plays (chapter text, timing file, and the MP3 held in memory), and a
# dropped connection never swaps narrators — the bar says "Couldn't reach the
# recording. Tap play to try again." Web only; the shells load the live site.
# Run:  bash ~/Desktop/App/_session447_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock

echo "=== 1/2 commit (second push: little play button + auto-start on unlock)"
git add app/src/App.tsx app/src/lib/recordedAudio.ts app/src/lib/tts.ts \
  tts/names_ipa.py S446_SESSION_HANDOFF.md _session447_deploy.sh
git commit -m "S447b: recover when Android refuses to start the next chapter while locked

While a chapter plays, the next chapter's text, timing file and MP3 (as an
in-memory blob) are warmed, so auto-advance works with the phone locked.
A 404 (chapter truly unrecorded) still falls to the device voice with the
S446 notice; a network failure now shows 'Couldn't reach the recording.
Tap play to try again.' and play retries the same chapter.

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01UP5zJuf4D5Um2Ga9AdPBEw"

echo "=== 2/2 push"
git push origin main
echo "=== done. Render is rebuilding the site (a few minutes)."
echo "    Then on the Android phone: close the app fully and reopen it, play Jasher, lock the phone, let the chapter end."
