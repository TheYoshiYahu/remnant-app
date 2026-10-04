#!/usr/bin/env bash
# S441 deploy — "Unlock in Free tier" fix + 7-day trial banner on the tier page,
# plus committing the S435–S440 source corrections already applied/queued.
# PWA change: Render rebuilds the static site from the push (a few minutes).
# Run:  bash ~/Desktop/App/_session441_deploy.sh
set -euo pipefail
cd "$(dirname "$0")"
rm -f .git/index.lock   # stale lock left by Claude's read-only check
git add app/src/components/ChapterEndCard.tsx app/src/components/ChapterCommentary.tsx app/src/routes/Pricing.tsx
git commit -m "S441 unlock CTA names the cheapest paid tier, never Free; 7-day no-card trial banner on the tier page

Locked free-tier study content now reads 'Unlock in Study Notes tier'.
Signed-out visitors on /pricing see: Create your account — 7 days free,
all access. No credit card required.

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01Wabs5Bx5Su5vhm8CqRHTnJ"
git add data-schema/migrations/session43[5-9]*.sql data-schema/migrations/session440_*.sql
git add -u data-schema/migrations source-texts
git add source-texts/parsed/enoch.json source-texts/parsed/ascension-isaiah.json \
  source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt \
  source-texts/ascension-isaiah/ascension-isaiah-restored.txt \
  S438_SESSION_HANDOFF.md REVELATION_XREF_AUDIT_2026-10-03.md \
  _session438_order_of_end_and_enoch_deploy.sh _session439_refresh_apps.sh _session440_deploy.sh _session441_deploy.sh
git commit -m "S435–S440 order-of-the-end card corrections, new witnesses, Enoch 91–93 rebuild, Ascension of Isaiah Ethiopic readings

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01Wabs5Bx5Su5vhm8CqRHTnJ" || echo "(nothing more to commit)"
git push origin main
echo "=== pushed. Render will rebuild the site in a few minutes."
