#!/bin/bash
# S467b — copy missing account emails from WordPress.
set -e
cd ~/Desktop/App
git add api/jobs/backfill_emails.py api/db.py api/email_prefs.py api/jobs/activity_report.py wp-companion/rop-sso-bridge/rop-sso-bridge.php wp-companion/rop-sso-bridge.zip S467_SESSION_OPEN_PROMPT.md _session467b_email_backfill_deploy.sh
git commit -m "S467b: backfill missing emails from WordPress; daily activity log + report

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
git push
echo "Pushed. Give Render a few minutes."
