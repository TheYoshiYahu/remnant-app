#!/usr/bin/env bash
# S452 — the library on Google. Every chapter of every book is now a real
# web page at bible.remnantofpromise.org/library/<book>/<n>/ with its own
# title, description, prev/next links, and the text in the HTML. Canon
# chapters are complete (the 66 books are free). Partner-library chapters
# (Enoch, Jasher, Jubilees, the Apocrypha, the rest) show the FIRST
# PARAGRAPH only — the reader's own paragraph breaks, capped at 8 verses —
# then the invite. Every page ends with the 5-verse Michael taste and the
# 7-day-trial link (web only). /sitemap.xml lists every page.
# In the app: a free reader can now open a locked book and read that same
# first paragraph of each chapter, then the partner card (no more greyed-out
# books). The API feeds both: a locked chapter returns its first paragraph
# with teaser=true instead of 404; /v1/public/library/{edition}/{book} is
# the anonymous export the page build reads.
# Also: Barnabas dropped from tts/chapters_all.json (excluded book).
# Run:  bash ~/Desktop/App/_session452_library_pages_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock

echo "=== 1/2 commit"
git add api/main.py api/models.py api/Dockerfile \
  app/package.json app/public/robots.txt app/scripts/prerender-library.mjs \
  app/src/App.tsx app/src/lib/api.ts hosting/render.yaml \
  tts/chapters_all.json \
  S451_APP_FEATURE_ROADMAP.md S452_SESSION_HANDOFF.md S453_SESSION_OPEN_PROMPT.md \
  _session452_library_pages_deploy.sh
git commit -m "S452: every chapter is a real web page Google can read; extras show their first paragraph

Static pages at /library/<book>/<n>/ for every book (canon in full, partner
library as first paragraph + invite), pre-rendered at build time from the
new anonymous /v1/public/library export, with titles, descriptions, prev/next,
the 5-verse Michael taste, the trial link, and /sitemap.xml (robots.txt
points to it). The API no longer 404s a locked chapter for a free reader:
it returns the first paragraph (reader's paragraph breaks, max 8 verses)
with teaser=true, and the app lets a free reader open a locked book, read
that paragraph, and see the partner card. Barnabas removed from the TTS
chapter list.

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_011H4DwysvxPumRK8UvuLACK"

echo "=== 2/2 push"
git push origin main
echo "=== done. Render rebuilds the API (Docker, ~5 min) and the site together."
echo "    The site build fetches every book from the API and waits up to ~12 min"
echo "    for the new API to come live. If it still fails it keeps the old site —"
echo "    then press 'Manual Deploy' on remnant-app-pwa in Render once the API shows live."
echo "    Check (signed out): https://bible.remnantofpromise.org/library/1-enoch/7/"
echo "                        https://bible.remnantofpromise.org/library/genesis/1/"
echo "                        https://bible.remnantofpromise.org/sitemap.xml"
