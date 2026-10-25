#!/bin/bash
# S467 — email opt-out page + win-back offer (24-hour reopen, two Companion coupons).
set -e
cd ~/Desktop/App

git add api/email_prefs.py api/lib/email_links.py api/lib/email.py api/auth.py \
  api/subscriptions.py api/main.py api/jobs/winback.py api/jobs/winback_template.py \
  data-schema/migrations/session467_email_prefs_winback.sql \
  app/src/lib/api.ts app/src/routes/Pricing.tsx \
  S467_SESSION_OPEN_PROMPT.md _session467_optout_winback_deploy.sh

git commit -m "S467: email opt-out page + win-back offer (24h reopen, Companion coupons)

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"

git push
echo "Pushed. Render builds the API and the site on its own; give it a few minutes."
