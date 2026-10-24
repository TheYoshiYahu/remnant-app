#!/usr/bin/env bash
# S464 — (1) Suggestion box in Settings: partners/trial send ideas, saved to
# the database and emailed to info@remnantofpromise.org; free and signed-out
# readers see it locked with a note that partners have a say. (2) The free
# 5-verse natural-voice sample now says so up front and at the stop, on its
# own full-width line, so it never looks like the player broke. (3) The
# 'Support this ministry' giving button is bigger and now shows in the phone
# apps too (opens Tithely outside the app), plus a Give card in Settings.
# Web + API; the phone apps load the live site, so no store build.
# Run:  bash ~/Desktop/App/_session464_suggestions_sample_notice_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock

echo "=== 1/2 commit"
git add api/main.py api/suggestions.py \
  app/src/components/AudioPlayer.tsx app/src/components/SuggestionBox.tsx \
  app/src/lib/api.ts app/src/lib/recordedAudio.ts app/src/routes/Settings.tsx \
  app/src/routes/Today.tsx app/src/index.css app/src/App.tsx \
  _session464_suggestions_sample_notice_deploy.sh
git commit -m "S464: partner suggestion box; clear free-sample notice in the player

Settings gains 'Suggest an improvement': partners and trial readers pick
missing feature / make it better / something's not working and send; each
is stored (suggestions table, created on first use) and emailed to
info@remnantofpromise.org. Free and signed-out readers see it locked.
The 5-verse natural-voice sample now announces itself when it starts and
explains the stop, on a full-width wrapped line instead of a truncated
sliver in the bar.
Giving: the Today page button is larger and now shows on the native
shells (Tithely opens in the system browser); Settings gains a Give card.
General-fund wording only, no designated purpose.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_0187ALxL7tiPncTcZ5jAb4YT"

echo "=== 2/2 push"
git push origin main
echo "=== done. Render is rebuilding the site and the API (a few minutes)."
echo "    Test signed out: play any chapter — the sample line shows at the start and again at verse 5."
echo "    Test in Settings: signed out it's locked; signed in as a partner, send one test suggestion and check info@ email."
