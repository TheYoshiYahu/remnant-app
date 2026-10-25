#!/bin/bash
# S467b — copy missing account emails from WordPress.
set -e
cd ~/Desktop/App
git add api/jobs/backfill_emails.py S467_SESSION_OPEN_PROMPT.md _session467b_email_backfill_deploy.sh
git commit -m "S467b: backfill missing account emails from WordPress

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
git push
echo "Pushed. Give Render a few minutes."
