#!/usr/bin/env bash
# S452b — the API deploy failed: .dockerignore excludes app/, so the new
# Dockerfile COPY of app/src/data/paragraph_starts.json found nothing.
# Un-exclude that one file. Run: bash ~/Desktop/App/_session452b_dockerignore_fix.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock
git add .dockerignore _session452b_dockerignore_fix.sh
git commit -m "S452b: let the API image copy paragraph_starts.json (.dockerignore excluded app/)

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_011H4DwysvxPumRK8UvuLACK"
git push origin main
echo "=== pushed. Render rebuilds the API; the site build from the first push is"
echo "    still waiting on the API (up to ~12 min) and should complete on its own."
