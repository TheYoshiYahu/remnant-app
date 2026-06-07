# S206 — Play Store internal testing (sandbox side)

## Decisions settled this session (transcribed)
- Billing: **consumption-only store build** — confirmed by Yoshi at
  session open. Zero program enrollment, zero store fees, one posture
  for both stores.
- Native Pricing surface hides prices AND buttons (Kindle posture —
  Claude's conservative read; reversible one-line if Yoshi wants
  prices shown without buttons).
- versionCode 11 / versionName 1.1.0.
- Store title default "Remnant of Promise"; 30-char alternative
  "Remnant of Promise Study Bible" offered in the runbook — Yoshi's
  call at console time.
- Account deletion mechanism: email info@remnantofpromise.org,
  30-day completion, subscription cancelled with deletion (privacy
  page section is the Play-facing deletion resource).

## What shipped (code/files)
- `app/src/routes/Pricing.tsx` — S206 consumption-only gate: runtime
  window.Capacitor bridge check (no import, SignIn.tsx pattern);
  native hides cadence toggle, price labels, Subscribe button,
  founder box, promo-code footer; shows account-on-web note; keeps
  tier cards' names/blurbs/bullets and the active-partner banner so
  the in-shell subscription-tier read stays verifiable. Web/PWA
  rendering byte-identical to before when the bridge is absent.
- `app/android/app/build.gradle` — versionCode 11, versionName 1.1.0.
- `Website/static-site/privacy.html` — NEW. Covers site + app:
  what's collected (email, hashed password, synced study content,
  subscription tier via Stripe), what isn't (no ads, no analytics,
  no selling), encryption in transit, deletion procedure, children,
  service providers, contact.
- **S206 correction (Yoshi: "don't remember what same way as before
  was"):** the live remnantofpromise.org is WORDPRESS — confirmed by
  fetching the live homepage (wp-content paths; legal pages exist at
  /terms-of-service/, /privacy-policy/, /community-guidelines/,
  /acceptable-use-policy/; nav still shows Community → /activity/).
  The static-site folder is the design-time mirror, NOT the deploy
  path. Paste-ready replacement content written to
  `Desktop/Remnant of Promise (community site)/
  UPDATED_2026-06-06_Terms_of_Service.md` and
  `UPDATED_2026-06-06_Privacy_Policy.md`; runbook Step 2 rewritten as
  WP-admin edits (replace both pages, unpublish Guidelines + AUP,
  remove footer links + Community nav item). Play privacy URL is
  https://remnantofpromise.org/privacy-policy/ — runbook + data-
  safety references updated.
- **WP legal-page updates EXECUTED LIVE in-session** (Claude in
  Chrome; Yoshi signed in and approved each batch): ToS (237) and
  Privacy (238) replaced with the updated content; Guidelines (239)
  + AUP (240) trashed; Footer Links menu cleaned; functions.php
  Community nav entry + community-subnav wp_footer hook removed;
  footer.php hardcoded Guidelines/AUP links removed. All verified
  live (nav clean, footer shows Terms + Privacy only, both pages
  render the June 6 content, site healthy). Runbook Step 2 is DONE —
  the Play privacy URL https://remnantofpromise.org/privacy-policy/
  is live and correct. Trashed pages + the orphaned
  rop_render_community_subnav function in functions.php can be
  permanently deleted at leisure.
- `Website/static-site/terms.html` — NEW (Yoshi's call mid-session:
  "we removed the community app"). Replaces the May 7 community-site
  Terms of Service (Desktop/Remnant of Promise (community site)/
  02_Terms_of_Service.md — now retired along with the Community
  Guidelines and Acceptable Use Policy docs). Covers current surfaces
  only: site + study Bible web/app + accounts + Stripe partner tiers.
  Removed: member profiles, forums, private messaging, content
  moderation/reporting apparatus, 18+ eligibility. Changed:
  eligibility 13+ for accounts (aligns with the Play target-audience
  answer; FLAG — Yoshi confirms this age call), subscriptions section
  added (Stripe billing, price-lock forever commitment, cancel
  anytime through period end, mobile apps sell nothing —
  tiers-managed-on-web), study content private-to-account license,
  retirement note at the foot of the page pointing back to the old
  community provisions. Effective date kept May 7, 2026; last
  updated June 6, 2026. Privacy page cross-links it.
  CLEANUP QUEUED: SignIn.tsx still appends source=bible for the WP
  community-gate mu-plugin (rop-community-gate.php) — harmless no-op
  if the plugin is gone; remove the param + comment in a future
  session.
- `S206_PLAY_SUBMISSION_RUNBOOK.md` — NEW. The complete operator
  sequence: keystore backup first, privacy publish, web build + push,
  signed AAB build, console app creation, every App-content form
  answer (data safety, content rating, target audience, app access),
  store listing copy (voice-gated full description + 78-char short),
  internal-testing release + tester opt-in, the Play-App-Signing
  second-fingerprint → assetlinks.json follow-up, and the on-device
  walk checklist.
- `NEXT_SESSION_PLAY_STORE_SPEC.md` — S206 STATUS section appended.

## Founder pricing rework (Yoshi's calls, S206 mid-session — transcribed)
Trigger: Yoshi's tier-honesty question before the console ("do we have
something available in all tiers?"), then "i think we have too many
tiers," then the corrected ladder. Decisions, verbatim-shaped:
- **All tiers become founder pricing while the app is built and
  updated daily.** Struck-through "later" prices are deliberate
  placeholders for the post-founder raise ("we will raise prices of
  all the tiers... show some arbitrary number").
- **Ladder: Study Notes $1.99 (later $2.99) · Library $4.99 (later
  $7.77) · Companion $7.49 (later $12.99).** Annual = 10x monthly,
  two-months-free pattern (Companion founder annual $74.90).
- **SCRIBE IS HIDDEN until the future** ("its scribe that needs
  deleted until the future, that 7.49 is companion"). Catalog rows +
  existing everything subscribers untouched; the card just doesn't
  render. Verified: no content rows gate at 'everything', so no
  unpurchasable "Unlock in Scribe" walls exist.
- **Founder cap LIFTED** (cap → 1,000,000; closed_at cleared) —
  founder pricing stays open while the app is being built.
- **Companion bills founder rows** (is_founder=true): NEW —
  `data-schema/migrations/session206_founder_pricing.sql` carries the
  cap lift + two complete_study founder rows with REPLACE_ME Stripe
  price IDs. YOSHI: create $7.49/mo + $74.90/yr prices on the
  Companion product in Stripe, hand the price_... IDs over, then
  apply the migration BEFORE the web push (else the Companion button
  404s).
- **Overclaim fixes (honesty check)**: Study Notes "commentary on
  every chapter of the 66 books" → "growing chapter by chapter...
  updated as it's written" (coverage is partial, built book by book);
  Scribe's "Full Teaching Corpus access" claim left the page with the
  Scribe card (no in-app corpus surface exists yet).
- Pricing.tsx: 3-card grid (md:grid-cols-3), strikethrough later
  price + "founder pricing — locked forever" line, founder banner
  sentence in the header price-lock paragraph, old First-100 amber
  founder box removed, highlight moved to Companion. tsc -b exit 0.
- Native shell unaffected (prices/buttons already hidden in-shell).

## Verification
- `tsc -b` exit 0 after the Pricing gate.
- targetSdk 36 checked against current Play policy (35 required now,
  36 from 2026-08-31) — compliant as-is.
- Keystore present at `_signing/remnant-bible.keystore`; backup is
  runbook Step 1 before any build.

## What's on the Mac/Console side (Yoshi, runbook order)
1. Keystore backup + checksum match + off-Mac copy.
2. Publish privacy.html; verify URL.
3. `npm run build` + git push (deploys the gate to the live shell).
4. Signed AAB (`./gradlew bundleRelease` with `read -s` password).
5. Console: create app → App content forms → listing → internal
   testing rollout → opt-in link → install on phone.
6. Copy app-signing SHA-256 → second assetlinks fingerprint (next
   session or by hand).
7. On-device walk (runbook Step 10); report results.

## Play Console state (S206 close of console-driving, via Claude in Chrome)
DONE: app created (Remnant of Promise Study Bible /
com.remnantofpromise.bible / App / Free / 3 declarations accepted
with Yoshi's approval); open-testing track targeted to ALL 177
countries; release draft holds AAB versionCode 11 (1.1.0) + release
notes; privacy policy URL set (remnantofpromise.org/privacy-policy/);
Ads No; Government No; Financial none; Health none; content rating
COMPLETE (Everyone / PEGI 3 / USK 0); data safety FULLY ANSWERED
(4 types: email, user IDs, purchase history, other UGC — all
collected/not shared/optional; encrypted in transit; account-deletion
+ data-deletion URLs set) saved as DRAFT — final submit gated on
Target audience; app category Books & Reference + contact details
(info@ + website); main store listing copy (30/30 name, 77/80 short,
full description) + 512 icon + 1024x500 feature graphic, saved as
DRAFT. AAB upload note: gradle hangs were (a) macOS quarantine on
AAPT2 → xattr -dr fix, and (b) iCloud-sync " 2" conflict-copies in
build dirs + node_modules plugin builds → rm -rf + rebuild. iCloud
remains a standing build hazard — consider excluding build dirs from
sync or building with Desktop sync paused.

BLOCKED ON YOSHI (the last three):
1. Demo reviewer account (register at /goshen, comp with promo code)
   → email+password into Sign in details → unlocks Target audience
   (answer 13+) → unlocks Data safety final submit.
2. Phone screenshots (min 2) → into main store listing.
3. Publishing overview → send everything for review → review clears
   → ANNOUNCE the open beta.

## Open items
- assetlinks.json second fingerprint (gated on first AAB upload).
- Screenshots for the listing (can land after internal testing).
- Demo reviewer account (promo-code Scribe, throwaway email) for the
  App-access form — needed before PRODUCTION review, not for
  internal testing.
- Production promotion + the minimum-functionality/webview review
  risk on the by-URL shell posture: the shell carries native share,
  deep links, native auth — defensible, but if review pushes back,
  the fallback is the bundled-webDir posture. Cross when reached.
- App Store: same consumption-only posture ships unchanged once the
  Apple org account exists.

## Backlog behind this (unchanged)
Mark extras xref pass · Luke · John · Kingdom wave 4 concordance
scans · Witness wave 2 · Maps · Timeline.
