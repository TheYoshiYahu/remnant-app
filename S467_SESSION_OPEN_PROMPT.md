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
- Coupons CREATED in Stripe (both). Dry run found 0: users table had 72 accounts, 43 at 90+ days,
  31 of those never subscribed, but 0 had an email stored (older sign-ins never carried one).
  Fix: api/jobs/backfill_emails.py copies missing emails from WordPress (admin REST).
  Run: python -m jobs.backfill_emails --dry-run, then without --dry-run, then winback --dry-run again.
- ACTIVITY LOG (Yoshi asked, S467): table user_activity_days, one row per person per Central-time
  day: first/last time, visits (new visit after 30 quiet min), approx active minutes, request count.
  No reading content stored. Starts counting from deploy (no history before). Report:
  python -m jobs.activity_report  (or --days 30).
- BLOCKED: backfill dry run failed=72 — every call to WordPress from Render got HTTP 429 "Just a
  moment..." (WP Engine's bot challenge in front of the site). Likely also blocks the API's
  tier sync to WordPress. Fix (Yoshi): get Render outbound IPs (remnant-app-api → Connect →
  Outbound), ask WP Engine support to let those IPs past the bot challenge for /wp-json.
  Then re-run python -m jobs.backfill_emails --dry-run in the Render Shell.
- EARMARK (Yoshi, S467): readers complain they have to log in too often — seems to happen after
  Render builds. Investigate next session: why a deploy signs people out (token expiry? token
  stored where a new build clears it? site cache/service worker?) and make sign-ins last.
- BUILT (S467): rop-sso-bridge 1.1.4 — sign-ins last a year (was 7 days): bridge cookie/token,
  phone JWT via jwt_auth_expire filter, WP remember-me via auth_cookie_expiration.
  Yoshi uploads wp-companion/rop-sso-bridge.zip in WordPress → Plugins → Add New → Upload
  (replace current). People's existing 7-day tokens still expire once; after the next sign-in
  they last a year.

## Reader feedback — Cheryl Emerson (email 2026-10-24), for a fresh session
1. Keeps having to sign in though she never signs out → BUILT S467 (sso-bridge 1.1.4, 1-year sign-ins).
2. Listening: the read-along highlight sometimes shows, sometimes doesn't — she can't find her place
   to highlight what she heard.
3. Listening: the page doesn't scroll to follow what's being read (highlighted or not).
4. Pronunciation: some words off; especially YHWH / Yahuah — TTS spells the letters or doesn't say
   it as expected ("Yahuah" or "Ya-wha"). Check against /topics name-pronunciation notes.
5. Reading keeps jumping back to Genesis 1 instead of where she left off; if behind a week, the
   week's reading no longer shows.
6. Weekly reading plan shifts if she reads more or less — not a steady 6 chapters; last week's /
   yesterday's reading can't be seen again (her daughter hit this too). The study group that bought
   the app has the same complaint.
7. Wants to highlight and copy a single word or sentence (agrees with an existing suggestion).
- Her group asks which translation the app uses (they guess KJV with the names restored) —
  Yoshi to answer her.
- RESOLVED (S467, 22:30): WP Engine support let Render's IPs (74.220.48.0/24, 74.220.56.0/24) past
  the bot challenge. Backfill ran: 70 emails filled, 2 accounts not in WordPress.
  Win-back dry run: 29 people would get it. Real send WAITS for Resend Verified:
  python -m jobs.winback   (then later, optional: python -m jobs.winback --nudge)
- RESEND FIX (22:50): DKIM verified. rsend/send had been entered in Wix as TXT rows; Yoshi deleted them
  and re-added as CNAME (rsend → rsend.forge.rmta.net, send → send.forge.rmta.net). Waiting for Verified.
- Win-back email now lists up to 6 features added after each reader's trial ended (from newFeatures.ts).
- RESEND VERIFIED (23:07). Next: run push 467b, Render Shell test email to info@, then python -m jobs.winback (real send).
