# S467 — Email: verify, test, then win-back + opt-out

Read the S466 notes at the bottom of S465_SESSION_OPEN_PROMPT.md first (what's done, Wix DNS, Render settings).

## Roadmap (one step at a time, Yoshi does every push and dashboard click)
1. VERIFY — Yoshi checks Resend → Domains. If not Verified, check the 4 Wix records (TXT resend._domainkey,
   CNAME rsend, CNAME send, TXT _dmarc) against Resend's values.
2. TEST — from remnant-app-api Shell send one test email to info@remnantofpromise.org; then run the
   trial-reminder job path per DEPLOY_TEST_CHECKLIST_trial_email.md and confirm it lands.
3. MATCH — compare the trial email's feature list with the store listings and pricing page; fix any gap.
4. OPT-OUT PAGE — email_prefs per user: promotions on/off, updates on/off. Signed unsubscribe link in every
   promo/update email opens a page: "Promotions only" or "Promotions and updates". Account mail (trial,
   password, receipts) always sends.
5. WIN-BACK — for users whose trial ended long ago and never paid: 24-hour full-access reopen flag, plus a
   choice of Stripe coupon: 25% off monthly for 6 months, or 35% off the 1-year one-time purchase. Web
   checkout only. Sent once (maybe a second nudge later), respects opt-out.
6. Then, a later session: Prayer Wall (plan at the bottom of S465_SESSION_OPEN_PROMPT.md).

## S467 progress (2026-10-24, Saturday night)
- Steps 1–2 SKIPPED for now: Resend still not Verified. Come back to them when it flips.
- Step 4 BUILT (opt-out): users.email_promotions / email_updates; page at
  /v1/email/unsubscribe (signed link) with "Promotions only" / "Promotions and updates".
  Account mail always sends. Promo mail also carries a List-Unsubscribe header.
- Step 5 BUILT (win-back), Yoshi's decisions:
  - Only accounts at least 90 days old, never had ANY subscription row (so lifetime-free
    gift-code people never get it), promotions not turned off.
  - Top tier only = Companion (complete_study). Two coupons:
    ROP_WINBACK_MONTHLY_25_6MO (25% off monthly, 6 months) and
    ROP_WINBACK_ANNUAL_35_YEAR1 (35% off the first year only; yearly renews at full price —
    there is no one-time purchase, yearly is a renewing subscription).
  - 24 hours of full access start when the email link is tapped (once).
  - Coupon applied by the server at web checkout, valid 14 days after the email.
  - Optional second nudge 7+ days later to those who never tapped.
- Files: api/email_prefs.py, api/lib/email_links.py, api/jobs/winback.py,
  api/jobs/winback_template.py; edits to auth.py, subscriptions.py, main.py, lib/email.py,
  app Pricing.tsx + api.ts. Columns are added automatically at API startup.
- Push: ~/Desktop/App/_session467_optout_winback_deploy.sh (Yoshi runs it).
- After deploy, in remnant-app-api Shell: python -m jobs.winback --setup-coupons
  then python -m jobs.winback --dry-run. Real send WAITS for Resend Verified.
- Step 3 (MATCH feature list) still open.
