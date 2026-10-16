#!/usr/bin/env bash
# S451 — free and signed-out readers no longer hear the phone's robot voice
# first. The natural voices (Michael, George, Ivan, Olivia) now sit in every
# reader's picker with Michael as the default, previews work for everyone,
# and a free reader hears verses 1–5 of any chapter in the natural voice,
# then the player stops with: "That was a taste of the natural voice. Free
# readers hear the first 5 verses of any chapter; partners and the 7-day
# free trial hear every chapter." Partners/trial: unchanged, every chapter.
# Web only; the shells load the live site.
# Run:  bash ~/Desktop/App/_session451_voice_taste_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock .git/stale-index-lock-s451

echo "=== 1/2 commit"
git add app/src/App.tsx app/src/components/AudioPlayer.tsx \
  app/src/lib/recordedAudio.ts app/src/lib/tts.ts _session451_voice_taste_deploy.sh
git commit -m "S451: free readers hear a 5-verse taste of the natural voice, not the robot voice

Natural voices are in every reader's picker (Michael default) and preview
for everyone. Without partnership or the trial a chapter plays verses 1-5
in the natural voice and stops with an invite; 'Play from here' past verse
5 shows the same invite. Partners and trial readers are unchanged.

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01PuVk5Go6QXeEXyoYfQmFTw"

echo "=== 2/2 push"
git push origin main
echo "=== done. Render is rebuilding the site (a few minutes)."
echo "    Then: open bible.remnantofpromise.org in a private window (signed out), press play on any chapter."
echo "    You should hear Michael for five verses, then the bar shows the invite and the button turns to Play."
