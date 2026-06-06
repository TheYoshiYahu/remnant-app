# Next session — PLAY STORE SUBMISSION (Yoshi's call, S205 close — JUMPS THE QUEUE)

## The mandate (Yoshi, verbatim — transcribed)
"I've wasted too much time, everything else can update automatically
or via the store if it's a shell update or whatever, let's get it
going... Play Store first" (Apple developer account not yet created;
App Store follows once it exists and is paid).

## Billing verdict (researched 2026-06-06 — re-verify at submission)
Yoshi's concern: the in-app "click to pay" goes to Stripe checkout
(app/src/routes/Pricing.tsx → window.location.href = checkout_url).
He remembered the old rule (no steering; "update your account on the
web" euphemism). Current state:
- Google Play US: external payment links ARE legal since the Epic
  injunction (effective 2025-10-29), BUT Google's 2025-12-09 policy
  requires enrollment in the **external content links program**
  (Play Console), the program's disclosure-screen API, and
  refund/support processes (compliance deadline was 2026-01-28).
  Announced fees (10% subs / 20% other within 24h of link-out) are
  NOT currently assessed; an Epic-Google settlement with a revised
  injunction is pending court approval — terms may shift.
- Apple US: contempt upheld (Ninth Circuit 2025-12), stay lifted
  (2026-04), external links currently commission-free; Apple is
  seeking Supreme Court review and may regain a "reasonable
  commission." In flux.

**DECISION (lean, Yoshi confirms at session open): consumption-only
store builds.** The native shells hide in-app checkout; the Pricing
surface in the shell says the tiers are managed from the partner's
account on the web (naming the site is now legal in the US — no
euphemism needed, but keep wording calm). Web/PWA keeps full Stripe
checkout untouched. Zero program enrollment, zero store fees, immune
to the pending settlement/SCOTUS shifts, fastest review, one posture
for both stores. Implementation: platform detection in the shell
(Capacitor flag) gates the checkout buttons; everything else
identical.

## What exists
- CAPACITOR_SETUP.md in the repo root (read FIRST — the wrapper
  approach was already mapped; "iOS and desktop app wrappers" session
  exists in history).
- The PWA is live and auto-updates (Yoshi: shell thin; content
  updates ride the web).
- Remnant of Promise is the legal nonprofit that owns Google/Apple
  developer accounts per the imprint architecture.

## Session shape
1. Yoshi confirms: consumption-only build (lean) vs. external-links
   program enrollment. Then mainline.
2. Play Console: DONE — already registered as an ORGANIZATION
   (Yoshi, S205 close). No 12-tester requirement. Go straight to app
   creation in the console.
3. Capacitor Android build: app id, signing keystore (GENERATE ON THE
   MAC, BACK IT UP — losing it loses the listing), target API level
   per current Play requirement, splash/icon from the app's existing
   identity assets.
4. Shell gating: hide checkout in native builds; Pricing page shows
   the account-on-web wording; deep links / auth flow verified inside
   the shell (Stripe-managed subscriptions still readable via the
   API; sign-in flow must work in the webview/custom tabs).
5. Store listing: title, short + full description (voice-skill
   register, reader-facing — More Than Milk cross-pollination rules:
   the app is Remnant of Promise), screenshots (dark reader, the
   Witness ON, the Kingdom ON, cross-references, study tools),
   feature graphic, privacy policy URL (remnantofpromise.org),
   data-safety form (auth + subscriptions data via Stripe = data
   collected; declare honestly), content rating questionnaire.
6. Internal testing track FIRST (instant, up to 100 testers) → Yoshi
   tests on-device → promote to production review when satisfied.
7. Transcribe every decision back into this file + build notes.

## Hard constraints (unchanged)
- Build/sign/upload from the Mac ONLY. Terminal blocks: COMMANDS
  ONLY — no comments, no parentheses.
- tsc -b / npm run build in ~/Desktop/App/app before any bundle.
- Keystore + Play credentials are Yoshi's; Claude never stores them.

## App Store (after Apple developer account exists)
Same consumption-only posture ships unchanged. Apple D-U-N-S /
organization enrollment for Remnant of Promise ($99/yr). Watch the
SCOTUS/commission status at submission; the consumption-only build
is unaffected either way.

## Backlog behind this
Mark extras xref pass (NEXT_SESSION_MARK_EXTRAS_XREF_SPEC.md — was
next, now follows the store work) · Luke extras · John extras ·
Kingdom wave 4 (concordance scans: gather, remnant, outcasts,
covenant) · Witness wave 2 · Maps rebuild · Timeline · Mark
commentary consolidation.
