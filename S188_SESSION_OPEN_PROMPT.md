# S188 Session Open Prompt — P0: Stripe checkout broken + Bible app / community account separation

**Status: PRODUCTION ISSUE.** Two partner-blocking problems surfaced after S187 close. Both must be diagnosed and fixed before any other work this session. Luke EXTRAS migration (originally queued for S188) bumps to S189; the 73 unlinked bulk-attach slugs from S187 also defer to S189.

---

## Non-negotiable session-open gates

1. **Request `~/Desktop` access.**

2. **Load `anthropic-skills:yoshi-voice` in full** — Skill tool → SKILL.md + `references/framework-deep.md` end-to-end. This session is software-architecture, not theology, but the skill's Operating Disciplines apply to every session (Local Files First, Ask Directly When Permission Walls Block the Work, Verbal-Answers-Transcribe, Self-Sufficient Application of Skill + Source, Session-Length Hard Stop).

3. **Confirm load in chat** before any debugging: "voice skill loaded; operating disciplines active." Then proceed to the diagnostics below.

---

## P0 Issue 1 — Stripe checkout not connecting

**Symptom:** Customers attempting to subscribe via the Bible app's pricing/checkout flow can't complete checkout. Stripe is not connecting.

**Last Stripe-touching work:**
- S37–S39 (initial Stripe setup; price IDs created)
- S38 stripe pricing expansion (`_scratch/_session38_stripe_pricing_expansion.md`)
- S114 reconcile partner tiers (`restoration-pipeline/_session114_reconcile_partner_tiers.py`)
- S174 tier revamp — Scribe tier deletion, founder concept retired (`PRICING_TIER_MODEL.xlsx`, `S174_*.md`)
- S178 in-app email+password sign-in shipped (likely changed how auth tokens flow into checkout)

**Diagnostic path — work in this order:**

1. **Reproduce.** Open the Bible app on web (https://app.remnantofpromise.org or wherever V1 hosts) and the native APK. Walk through: pricing screen → select tier → click Subscribe / Checkout. Capture: (a) the exact failure surface — does the checkout panel open and error, fail to open, redirect somewhere wrong, or silently hang? (b) browser DevTools network tab on web — which request fails and with what status? (c) Render service logs for the hosted API server during the attempt.

2. **Check Stripe env-var state on Render.** The hosted service needs `STRIPE_SECRET_KEY`, `STRIPE_PUBLISHABLE_KEY` (or `VITE_STRIPE_PUBLISHABLE_KEY` for the client), `STRIPE_WEBHOOK_SECRET`, and `STRIPE_PRICE_*` env vars for the tier price IDs. Verify in Render dashboard → service → Environment. Common failure modes: key rotated in Stripe dashboard but not updated on Render; webhook secret out of date after Stripe webhook endpoint edit.

3. **Check Stripe dashboard.** Confirm: (a) account is in `live` mode (not test, unless we're testing); (b) the price IDs in env vars match active prices in the Stripe products list; (c) the webhook endpoint URL (likely `https://<api-host>/api/stripe/webhook`) is set up and is sending events; (d) recent failed webhook deliveries — Stripe dashboard → Webhooks → endpoint → "Recent attempts" tab shows error responses if our endpoint is returning non-200.

4. **Walk the checkout-initiation code path.** The Pricing.tsx → API route → Stripe checkout-session creation flow:
   - `app/src/routes/Pricing.tsx` (~373 lines) — checkout button click handler
   - Server-side checkout-session creation endpoint — likely under `wp-companion/` or a Render-hosted Node service. Grep for `stripe.checkout.sessions.create` across the repo to find it.
   - `app/src/routes/Manage.tsx` (~454 lines) — manage-subscription flow; uses Stripe customer portal session.

5. **Walk the webhook-handler code path.** Subscription created / updated / cancelled events from Stripe land via webhook. If the webhook handler is broken, subscriptions never get attributed to a user in our DB:
   - Grep for `stripe.webhooks.constructEvent` to find the handler
   - Check that the handler upserts into `subscriptions` (or whatever table the schema uses) with `user_id`, `tier`, `status`, `current_period_end`.

6. **Check whether the issue is auth-token-side.** S178 changed how the app's auth token flows. The checkout endpoint needs to identify which user is checking out. If the JWT shape changed but the checkout endpoint hasn't been updated, checkout-session creation might fail at the auth gate before ever reaching Stripe.

**Files to read first:**

- `app/src/routes/Pricing.tsx`
- `app/src/routes/Manage.tsx`
- `hosting/render.yaml` (env-var declarations)
- `_scratch/_session37_stripe_setup.md`, `_session38_stripe_pricing_expansion.md`, `_session37_tier_pricing_seed.py`
- Whichever server-side directory holds the checkout-session-create endpoint (grep first)

**Expected outcome of S188 work on this:** Stripe checkout works end-to-end on both web and native APK. Yoshi can self-test by creating a test subscription.

---

## P0 Issue 2 — Bible app account creation routes to community site (should be separate)

**Symptom:** When a user creates an account from the Bible app and logs in, they are routed to the community site (remnantofpromise.org) instead of staying in the Bible app. Yoshi's intent: **Bible app accounts are separate from community accounts.** The two product surfaces are intentionally distinct — the Bible app is the product; the community site (remnantofpromise.org) is the legal nonprofit church organization's site.

**Current state (best understanding before diagnosis):**

The `wp-companion/rop-sso-bridge` directory is the SSO bridge between the Bible app and the WordPress community site. This bridge was built when the assumption was that one account would serve both surfaces. Yoshi has now decided that's wrong — the surfaces should have separate accounts.

**Recent auth-touching work:**
- S126 sign-in landing surface
- S157 TTS
- S171–S173 sanity tests for xref-share, sacred-name-mask, deep-link, display-prefs
- S175.1 native auth/CORS hot fixes
- S175.2 native UI fixes (Sign-in suppressed in native, CORS_ORIGINS adds localhost)
- S177 native auth: drop Custom Tab round-trip; v1.0.3 APK with native auth; rop-sso-bridge v1.1.1 prod-deployed
- S178 in-app email+password sign-in shipped; v1.0.4-v1.0.6 APKs

**Diagnostic path:**

1. **Read CAPACITOR_SETUP.md** (~373 lines) — currently documents the distribution architecture pivot at S174 and likely names the SSO bridge architecture too.

2. **Read the four auth-flow files:**
   - `app/src/routes/SignIn.tsx` (~333 lines) — sign-in route
   - `app/src/routes/AuthCallback.tsx` (~163 lines) — auth callback handler (this is likely where post-login routing decides where to send the user)
   - `app/src/lib/native-auth.ts` (~391 lines) — native auth library; handles the in-app email+password flow added at S178
   - `wp-companion/rop-sso-bridge/` directory — the SSO bridge currently coupling Bible app to community

3. **Identify the routing point.** AuthCallback.tsx is most likely where the issue is. Find:
   - Where the post-login redirect URL is computed
   - Whether the redirect target is hardcoded to community, or driven by a `redirect_to` / `return_to` URL param
   - Whether native vs. web detection happens correctly (native should stay in-app)

4. **Decide the separation architecture with Yoshi.** Yoshi needs to confirm the target architecture before code changes. Likely options:

   - **Option A — full separation, no bridge.** Bible app has its own users table (already exists at `users` in remnant_app DB?). Community site has its own WordPress users. No SSO between them. Each user creates a separate account for each surface they want to use. Simpler; but a partner who wants both surfaces has to register twice.

   - **Option B — separate accounts with optional cross-link.** Bible app users live in remnant_app DB. Community users live in WordPress. Each surface uses its own accounts only. A user can OPTIONALLY link their Bible app account to a community account if they have both (single button in Settings → "Link community account"). Keeps the surfaces separate by default; allows linkage where the user wants it.

   - **Option C — shared identity provider, distinct sessions.** Both surfaces use the same email/password (one identity), but a session at one surface does NOT grant access to the other. User has to log in separately on each. Same credentials, distinct sessions. Less surface area than A but requires identity-provider clarity.

   **Recommended (subject to Yoshi's call):** Option A or B. Option C is messy and confusing for users. Default to A unless Yoshi wants the cross-link affordance.

5. **Plan the migration.** Existing users created via the SSO bridge may have records in both surfaces or only one. Inventory:
   - How many users have the SSO bridge linked them across surfaces?
   - Do existing Bible app subscribers need to keep their Stripe subscriptions intact through the separation? (Yes — Stripe customer IDs are on the Bible app user row.)
   - What happens to anyone mid-flow (mid-OAuth) when the bridge is removed?

6. **Code changes.** Once architecture is locked:
   - Remove the post-login redirect-to-community behavior in `AuthCallback.tsx`
   - Update the create-account flow in `SignIn.tsx` to NOT call the SSO bridge for new Bible app accounts
   - If Option A: deprecate `rop-sso-bridge` (leave the code path but unused; mark for deletion in a follow-on session)
   - If Option B: replace the auto-bridge call with an opt-in "Link community account" affordance in `Settings.tsx`
   - Ship a new APK (S178 was v1.0.6; this would be v1.0.7 or v1.1.0 depending on the scope of changes)

**Files to read first:**

- `CAPACITOR_SETUP.md`
- `app/src/routes/AuthCallback.tsx`
- `app/src/routes/SignIn.tsx`
- `app/src/lib/native-auth.ts`
- `app/src/routes/Settings.tsx` (where the opt-in link would live if Option B)
- `wp-companion/rop-sso-bridge/` (whatever directory structure it has)

**Expected outcome of S188 work on this:** Bible app account creation does NOT route to community after login. Yoshi confirms by creating a new test account in the Bible app and landing on the Bible app's home / read view, not community.

---

## Operating disciplines for this session

- **Local Files First.** Both diagnoses start with reading source files on the Desktop mirror, not web-fetching the live site.
- **Ask Directly When Permission Walls Block the Work.** Render dashboard access, Stripe dashboard access, and AppStoreConnect access may be needed for diagnosis. If any of those need credentials Yoshi hasn't shared with this session, ASK — don't list options, don't stop and wait. Ask for the specific permission and trust Yoshi to grant or refuse.
- **Verbal-Answers-Transcribe.** Architecture decisions Yoshi makes verbally (Option A / B / C, whether to keep rop-sso-bridge, APK version bump, etc.) get written back into a session checkpoint or this prompt's open-questions section before the session is presented as closed.
- **Self-Sufficient Application of Skill + Source.** Voice skill is loaded. App architecture docs are on disk. Once Yoshi confirms the target architecture, draft the changes and present them — don't ask permission per file.
- **Session-Length Hard Stop.** Both issues together may exceed 25-30 substantive turns. If a clean wrap is approaching and one issue is fixed while the other is half-done, ship the half (commit + push) and queue the rest for S189 with a sharp checkpoint.
- **Publish-Then-Edit.** If the Stripe checkout can be made to work with a minimal fix (e.g., one rotated env var) ship that today. The full architectural-cleanup of the auth separation may take a follow-on session.

---

## Suggested session-open question to Yoshi

> "S188 plan locked: P0 Stripe checkout fix + Bible-app/community account separation. Reading the auth-flow + Stripe-checkout files now. Before I propose code changes — Yoshi, which separation architecture for Bible app vs. community accounts: **Option A (full separation, no SSO bridge)** or **Option B (separate by default, opt-in 'Link community account' in Settings)**? Default if you don't answer: A. Also — do you want Stripe diagnosed first or auth separation first, or can I parallel-track?"

---

## What S188 does NOT touch (queued for S189)

- **Luke EXTRAS cross-references migration** (1 Enoch, Jubilees, Apocrypha, Pseudepigrapha targets — mirrors the 26-file Matthew session131-156 architecture). Lights up the metallic argaman pill per `COLOR_PALETTE.md §9`. Documented in `S187_CHECKPOINT.md` §"What deferred to S188" — re-labeled as S189 work.
- **73 unlinked Luke bulk-attach rows reconciliation** — full worklist at `_scratch/_session187_unlinked_queued_for_s188.md`. 39 drafter-invented slugs need either rename-to-canonical or NEW-thread-creation. Bundle this with the S189 EXTRAS drafter pass.
- **Broader synoptic vocative-Lord sweep** — Matthew side queued at S187 close (Mark + Luke done).
- **Acts cross-reference sweep, OT priority list, Bible-app commentary tier for Luke.**

---

## Files this prompt expects to exist at session open

- `~/Desktop/App/S187_CHECKPOINT.md` ✓ (S187 close)
- `~/Desktop/App/CAPACITOR_SETUP.md` ✓ (distribution architecture)
- `~/Desktop/App/app/src/routes/AuthCallback.tsx` ✓ (post-login routing — primary suspect for Issue 2)
- `~/Desktop/App/app/src/routes/SignIn.tsx` ✓
- `~/Desktop/App/app/src/lib/native-auth.ts` ✓ (S178 native auth)
- `~/Desktop/App/app/src/routes/Pricing.tsx` ✓ (Stripe checkout entry point)
- `~/Desktop/App/app/src/routes/Manage.tsx` ✓ (Stripe customer portal entry)
- `~/Desktop/App/wp-companion/rop-sso-bridge/` ✓ (SSO bridge to community)
- `~/Desktop/App/hosting/render.yaml` ✓ (env-var declarations)
- `~/Desktop/App/_scratch/_session37_stripe_setup.md` ✓
- `~/Desktop/App/_scratch/_session38_stripe_pricing_expansion.md` ✓
- Cowork-installed `yoshi-voice` skill ✓ (operating disciplines)
- Render dashboard access for the API service ✓ (env vars)
- Stripe dashboard access ✓ (price IDs, webhook config, recent attempts)
