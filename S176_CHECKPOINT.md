S176 — proper native architecture, in-sandbox landings + deploy/test queue

# What S176 actually delivered

Five of the six S176 wheel items landed in-sandbox. The sixth (D, SQLite-
bundled scripture) is deferred to S177 — it's its own session-sized piece
of work. Item F (OTA decision) landed as research-done with a clear
recommendation but the decision is queued for Yoshi.

No new .apk shipped this session — the changes are in the source tree
but require Yoshi to (1) deploy the updated WP plugin and (2) rebuild +
reinstall the .apk to test the full flow on his phone. Section *Deploy
+ test queue for next sit-down* at the bottom captures the exact steps.

# Items A–F status

## A. WP-side auth investigation + plugin extension — DONE

Investigation finding: the WP-side JWT machinery is already fully built
for the PWA. Three plugins live in `~/Desktop/App/wp-companion/`:

  - `jwt-auth` (Enrique Chavez's third-party plugin) — issues JWTs via
    POST /wp-json/jwt-auth/v1/token with a username+password body. JSON
    response, NOT a redirect. Wrong shape for the native flow (would
    require credentials inside the native app surface).
  - `rop-sso-bridge` v1.0.0 — mints HS256 JWTs on the `wp_login` action
    via `rop_sso_generate_jwt()`. Same payload `api/auth.py` expects.
    Writes to the `rop_jwt` cookie at `.remnantofpromise.org`. The
    Capacitor native shell can't see this cookie (its origin is
    `https://localhost`).
  - `bible-companion` v1.1.0 — HMAC partner-tier sync from Stripe. Not
    auth-related.

The API (`api/auth.py::get_current_user_optional`) already supports
BOTH the cookie path AND `Authorization: Bearer <token>`. No API
changes needed for the native path.

S176 closed the gap by extending `rop-sso-bridge` from v1.0.0 to
v1.1.0 with a new endpoint:

    GET /wp-json/rop/v1/native-auth-callback

  - Permission: public route (registered with `__return_true`); the
    handler checks `is_user_logged_in()` and bounces to wp-login.php
    via `wp_safe_redirect(wp_login_url(rest_url(...)))` when the
    partner isn't authenticated.
  - On success: mints the JWT using the existing
    `rop_sso_generate_jwt()` (same shape, same signing, same
    partner_tier resolution), 302-redirects to
    `https://bible.remnantofpromise.org/auth-callback?token=<JWT>`.
  - On mint failure: 302-redirects to `/auth-callback?error=mint_failed`.
  - Destination is HARD-CODED. Never reads a destination from query
    params — no open-redirect surface.
  - Edit: `~/Desktop/App/wp-companion/rop-sso-bridge/rop-sso-bridge.php`
    (header version bump, four new constants, two new functions, one
    `rest_api_init` hook).

Sandbox can't `php -l` (no PHP installed; no sudo). Syntax was
hand-verified — all braces balanced, only stock WP APIs (`register_rest_route`,
`wp_safe_redirect`, `wp_login_url`, `wp_redirect`, `wp_get_current_user`,
`rest_url`, `is_user_logged_in`) and PHP stdlib (`http_build_query`,
`error_log`, `sprintf`). The mint helper is the same one the cookie
path has been using in production since S37.

## B. Native side wired (Capacitor Browser + deep-link auth callback) — DONE

Two npm packages added to `app/package.json`:

  - `@capacitor/browser` ^8.0.3 (system-browser open for the WP login)
  - `@capacitor/preferences` ^8.0.1 (durable JWT storage)

Five source files changed, one new file created:

  - **NEW** `app/src/lib/native-auth.ts` — token storage + sync read
    module. Exports `loadStoredNativeToken()` (async; called once at
    app mount; seeds the in-memory cache from Preferences),
    `getCachedNativeToken()` (sync; called from api.ts on every fetch),
    `storeNativeToken(token)` (async; called by the deep-link router
    on /auth-callback receipt; persists to Preferences AND seeds the
    cache so the next fetch picks it up without waiting), and
    `clearNativeToken()` (logout symmetric counterpart, no UI surface
    invokes it yet — reserved for V1.1+ in-app Sign Out). Also exports
    `parseAuthCallbackDeepLink(url)` discriminator used by the
    deep-link router. Web-safe — every public function is a no-op on
    web (Capacitor Preferences import is lazy inside function bodies;
    web bundle doesn't pull it in eagerly).

  - **EDIT** `app/src/lib/deep-link.ts` — extended router to handle
    two URL families: existing `/strongs/{N}` (S171) AND new
    `/auth-callback` (S176). The auth-callback branch parses via
    `parseAuthCallbackDeepLink`, persists via `storeNativeToken`,
    and dispatches a `rop:auth-callback` CustomEvent.

  - **NEW** `app/src/routes/AuthCallback.tsx` — the SPA landing route
    for `/auth-callback`. Renders "Signing you in…" while
    `storeNativeToken` resolves, then `window.location.assign('/read')`
    so the Reader's mount effects fire with the new Bearer header in
    place. Error branch shows the error code + Try Again / Continue
    Without Signing In buttons.

  - **EDIT** `app/src/App.tsx` — three changes: (1) added
    `import AuthCallback from "./routes/AuthCallback"` and
    `import { loadStoredNativeToken } from "./lib/native-auth"`;
    (2) suppressed the SacredNameWelcomeModal on `/auth-callback`
    (parallel to the existing `/sign-in` suppression); (3) gated
    the `pullAndReconcile()` call on `loadStoredNativeToken().then(...)`
    so signed-in native partners' display prefs sync server→local
    correctly; (4) added `/auth-callback` to the pathname route table.

  - **EDIT** `app/src/routes/SignIn.tsx` — replaced the S175
    "anonymous app reads anonymously" native branch with a real
    `NativeSignInBranch` component carrying Log In + Create Account
    buttons. Each button calls `openWpNativeAuth(url)` which lazy-
    imports `@capacitor/browser`'s `Browser.open({ url })`. The
    component renders a "Finishing sign-in…" interim surface
    between Browser.open and the App Link handoff so the partner has
    a clear UX signal during the round-trip.

  - **EDIT** `app/android/app/src/main/AndroidManifest.xml` — added
    a second `intent-filter android:autoVerify="true"` for
    `https://bible.remnantofpromise.org/auth-callback` (exact-path
    match, NOT pathPrefix — the callback only carries the bare path
    with query params; pathPrefix `/auth-callback/` would miss it).
    Reuses the existing `.well-known/assetlinks.json` binding (same
    host, same appId, same cert SHA) — no separate verification
    needed.

## C. API client: Bearer token path for native — DONE

The API already accepts Bearer headers in production (the PWA uses
them as a belt-path next to the cookie). S176 wired the native side
to attach them.

Two file edits:

  - **EDIT** `app/src/lib/api.ts` — added `import { getCachedNativeToken }
    from "./native-auth"`. New private function `readAccessToken()`:
    checks the native cache FIRST (sync, in-memory), falls back to
    `readJwtCookie()`. The 5 callsites in get/post/put/del/fetchLexiconEntry
    that previously called `readJwtCookie()` now call `readAccessToken()`.
    `readJwtCookie` is preserved as the internal cookie-only helper.

  - **EDIT** `app/src/lib/display-prefs-sync.ts` — `hasJwtCookie()`
    now consults the native cache first via `getCachedNativeToken()`,
    falls back to the cookie check. Function name kept for callsite
    stability; semantic is now "partner is signed in via either
    path." Without this change, signed-in native partners would still
    see the welcome modal's sign-in ask AND their display prefs
    wouldn't sync server↔local.

Verification: `npx tsc -b` clean. `npx vite build` (into `/tmp/dist-s176-fresh`)
clean — 614 KB main chunk, same pre-existing chunk-size warning as
S175.

## D. SQLite-bundled scripture — DEFERRED TO S177

Not started. The work is substantial:

  - install `@capacitor-community/sqlite` + the Cordova-SQLite-storage peer
  - write a build script that compiles canon + Apocrypha + Jasher +
    1 Enoch + Jubilees + lexicons from the existing source-texts/parsed
    JSON into a SQLite database
  - copy the DB into `android/app/src/main/assets/` at gradle assemble time
  - write a Capacitor-SQLite-aware data layer in `app/src/lib/local-scripture.ts`
  - migrate every reader fetch in App.tsx (listBooks, listChapters,
    getChapter, getChapterWords, lexicon fetches, search) to consult
    local SQLite first, falling back to the API only for tier-gated
    content the local DB doesn't carry
  - keep the API path live for account features (notes, bookmarks,
    highlights, sync, subscription-me) — those stay network-only
  - .gitignore the bundled DB binary
  - decide on DB versioning + the upgrade path when scripture data
    changes

That's its own session. The native auth work in S176 already lights up
account features for signed-in native partners, so D is no longer the
gating user-value piece — it's now a performance + offline-resilience
upgrade rather than a feature-parity unblock. Worth doing, but no
longer urgent.

## E. Play button fix — DONE

Root cause found in 3 minutes:

  - `app/src/lib/tts.ts` line 376 (pre-S176):
    `_engine = isCapacitorNative() ? createNativeTTS() : createWebTTS();`
  - `createNativeTTS()` was a Phase 10 stub that returned
    `isAvailable: () => false` and `speak: () => {}` (no-ops).
  - App.tsx's Play handlers (`queueChapterFromVerse`, etc.) all start
    with `if (!engine.isAvailable()) return;` — so every Play tap in
    the native shell silently bailed at the gate. No audio, no error,
    no diagnostic. That's the "Play reportedly doesn't work in native"
    that S175 flagged.

Fix: use `createWebTTS()` on both web AND native. Android Capacitor's
Chromium WebView exposes `window.speechSynthesis` on API 33+ (Android
13+). On older Android the web engine's `isAvailable()` returns false
and the Play UI hides itself — same graceful degradation the web
build already has.

`createNativeTTS()` is preserved (with `void createNativeTTS;` so the
import doesn't lint-error) as a one-selector-flip away from the V1.1+
upgrade path: `npm i @capacitor-community/text-to-speech`, fill in the
native-plugin implementation, flip the selector back. Gets us native
voices (better quality / more locales) but isn't needed for V1.

  - **EDIT** `app/src/lib/tts.ts` — file-header note added; native
    stub block re-comment-headed as V1.1+ reserved; selector
    simplified to `_engine = createWebTTS()`.

`npx tsc -b` clean post-edit.

## F. Capacitor Live Updates (OTA) — research done, decision queued

The S175 framing was "Capacitor Live Updates (Appflow, paid OTA
service)." Critical update from current research: **Appflow is being
shut down.** Ionic has announced apps will continue to work through
December 31, 2027, but no new features, no new customers, no updates.
Appflow as the V1.1 OTA path is a dead end — anyone signing up now
gets a 1.5-year runway to a forced migration.

Three real options:

  1. **Capgo** (recommended) — community-led OTA service for Capacitor.
     Free tier exists; paid tier from ~$12/mo. 1B+ updates/mo at scale,
     battle-tested for 4+ years (since 2020). Optional self-host
     (open-source server) if costs become an issue or sovereignty is
     wanted. https://capgo.app/

  2. **Capawesome Cloud** — newer (launched 2024), $9-49/mo. Full
     mobile-CI/CD stack including builds + App Store publishing +
     live updates. Less battle-tested than Capgo but bundles more
     under one tool. https://capawesome.io/

  3. **No OTA** — accept the rebuild-reinstall cycle. Every JS fix
     means `npm run build`, `cap sync android`, `./gradlew assembleRelease`,
     re-upload .apk, Yoshi reinstalls on his phone. The S175 cycle
     time was ~5 minutes per iteration once Android Studio was set
     up. Painful for frequent fixes, fine for occasional ones.

**Decision at S176 close: not pursuing OTA.** Yoshi's call: the value
mostly evaporates once the app launches on Play Store / App Store —
those stores' auto-update mechanisms handle JS+native distribution to
users natively. The only thin remaining use case post-store-launch is
hot-fix speed (skip Apple review wait), which is marginal for a
Bible reader. We accept the rebuild+reinstall cost during the
current direct-.apk-distribution phase as a transitional cost; Play
Store launch resolves it cleanly.

(See Questions section at the bottom — question closed; do not
re-raise unless Yoshi specifically asks.)

# Files this session produced

  - `~/Desktop/App/wp-companion/rop-sso-bridge/rop-sso-bridge.php` —
    bumped to v1.1.0; new native-auth-callback endpoint
  - `~/Desktop/App/app/src/lib/native-auth.ts` — NEW (~210 lines)
  - `~/Desktop/App/app/src/routes/AuthCallback.tsx` — NEW (~150 lines)
  - `~/Desktop/App/app/src/lib/api.ts` — readAccessToken indirection
  - `~/Desktop/App/app/src/lib/display-prefs-sync.ts` — hasJwtCookie
    now checks native cache too
  - `~/Desktop/App/app/src/lib/deep-link.ts` — extended router for
    /auth-callback
  - `~/Desktop/App/app/src/App.tsx` — AuthCallback route, native-token
    load gating pullAndReconcile, welcome-modal suppression on
    /auth-callback
  - `~/Desktop/App/app/src/routes/SignIn.tsx` — NativeSignInBranch
    replaces the anonymous-only message
  - `~/Desktop/App/app/android/app/src/main/AndroidManifest.xml` —
    /auth-callback intent-filter
  - `~/Desktop/App/app/src/lib/tts.ts` — Play button fix (web engine
    on native too)
  - `~/Desktop/App/app/package.json` — @capacitor/browser ^8.0.3,
    @capacitor/preferences ^8.0.1 added
  - `~/Desktop/App/app/package-lock.json` — locked
  - `~/Desktop/App/S176_CHECKPOINT.md` — this file

Verification: `npx tsc -b` clean; `npx vite build` (to a fresh outDir)
clean. The sandbox `dist/` couldn't be overwritten (EPERM — files
owned by Yoshi's uid from the S175 build), so the production dist
rebuild needs to happen on the Mac.

# Deploy + test queue for next sit-down

Three sequential steps to get S176 live on Yoshi's phone.

**Step 1 — Deploy the updated WP plugin.**

  - In Finder, navigate to `~/Desktop/App/wp-companion/`
  - Right-click `rop-sso-bridge` folder → Compress → produces
    `rop-sso-bridge.zip`
  - WP admin → Plugins → Deactivate "Remnant of Promise — SSO Cookie
    Bridge" → Delete (don't worry — the new zip replaces it)
  - Plugins → Add New → Upload Plugin → choose `rop-sso-bridge.zip` →
    Install Now → Activate
  - Verify: hit
    `https://remnantofpromise.org/wp-json/rop/v1/native-auth-callback`
    in any browser while logged out. Should redirect to wp-login.php
    with redirect_to back to that endpoint. Logged-in: should
    302-redirect to bible.remnantofpromise.org/auth-callback?token=...
    (URL will visibly flash before bible. loads, since the .apk for
    the new App Link intent-filter isn't installed yet).

**Step 2 — Rebuild + reinstall the .apk.**

In the Mac terminal:

```
cd ~/Desktop/App/app
npm run build && npx cap sync android
cd android
./gradlew assembleRelease
```

(Same sequence as S175 — the runbook at `S175_GRADLE_BUILD_RUNBOOK.md`
still applies; environment variables haven't changed.)

The unsigned-then-signed .apk lands at
`android/app/build/outputs/apk/release/app-release.apk`. Copy to
`app/public/download/remnant-bible-v1.0.0.apk` (the stable URL),
commit + push so Render auto-redeploys, then `adb install -r` it on
Yoshi's phone (or sideload via the .apk URL on the phone). Bump
versionName to "1.0.3" + versionCode to 4 in
`android/app/build.gradle` before assembleRelease.

**Step 3 — Test the full flow.**

  - Open the native app on the phone. Should land on /read anonymously
    (S175 behavior preserved).
  - Tap the chrome → Sign In. Should land on the new
    NativeSignInBranch with Log In + Create Account buttons.
  - Tap Log In. System browser (Chrome Custom Tab) should open
    showing the WordPress login form. The app should show
    "Finishing sign-in…" in the background.
  - Enter credentials → submit. Browser should redirect through
    WP-side → /auth-callback?token=... → Android catches it and
    launches the app → app shows "Signing you in…" briefly →
    redirects to /read.
  - In /read, the chrome should now show "Manage subscription" (if
    paid tier) or partner-name. Bookmarks / notes / highlights from
    other devices should load.
  - Tap a verse → Play. Audio should speak (Web Speech API via
    Chromium WebView on Android 13+; gracefully hides on older).

  Failure modes to watch for:
  - Chrome Custom Tab opens but App Link doesn't auto-handoff →
    autoVerify probably hasn't completed yet (Android fetches
    assetlinks.json on app install and verifies async). Wait
    ~30 seconds after install; retry.
  - "Sign-in didn't complete (mint_failed)" → JWT_AUTH_SECRET_KEY
    not defined in wp-config.php (check WP install).
  - Browser opens but never redirects → WP plugin not activated
    correctly; verify step 1.

# Standing residuals unchanged from S175

  - **D. SQLite-bundled scripture** — see Item D above; deferred to S177
  - **F. OTA decision** — Yoshi to choose Capgo vs Capawesome vs no-OTA
  - Tier revamp copy execution (S174_TIER_REVAMP_SPEC.md — Pricing.tsx
    Scribe removal, Companion revision, Library footnote, WIP-disclosure
    modal). Deferred since S175.
  - Family-plan build (Yoshi nix'd at S175 open — re-open when ready)
  - iOS PWA install affordance (Q48-candidate)
  - Apple Developer enrollment decision
  - S172.9 chapter-pill revision, NT morph fuzzy-join, apocrypha
    paragraph Yoshi-eye revision, 9 long-tail S161 singletons,
    Yahuah → Adonai vocatives, V1.2+ per-entry OG generator
  - **NEW: V1.1+ TTS upgrade path** — flip the engine selector back to
    a platform branch + implement createNativeTTS() with
    @capacitor-community/text-to-speech. Gets native voices on
    Android. Not blocking V1; the web engine works.
  - **NEW: Native in-app Sign Out affordance** — `clearNativeToken()`
    is wired and ready; no UI surface invokes it yet. Add a Sign Out
    button to the native shell's chrome (or to the SignIn route when
    `getCachedNativeToken()` is non-null).

# Questions queued for the next session — Yoshi's answers at S176 close

  1. **OTA decision** — CLOSED, will not pursue. Yoshi's call at S176
     close: "unnecessary especially when we launch off play and apple
     store." He's right. Once the app is on Play Store / App Store,
     those stores' native auto-update mechanisms handle JS+native
     update distribution to users without any custom OTA wiring. The
     only thin remaining use case post-store-launch is hot-fix speed
     (skip Apple's review wait for emergency fixes), and that's
     marginal for a Bible reader where no JS bug is so urgent a
     ~2-day review delay matters. The current direct-.apk-distribution
     phase is the only window where OTA would have paid off, and
     that window closes the moment Play Store goes live. Question
     closed; do not re-raise unless Yoshi specifically asks.

     Standing implication: any JS fix during the direct-.apk phase
     requires the full rebuild + reinstall cycle. We accept the cost
     because the phase is transitional and Play Store distribution
     is the destination.

  2. **S177 focus** — DECIDED: "Test S176 first, then decide." Next
     session opens with the deploy+test queue at the bottom of this
     file. Walk Yoshi through (1) zipping rop-sso-bridge + uploading
     to WP admin, (2) the gradle rebuild sequence (versionCode 4 /
     "1.0.3"), (3) end-to-end Sign In flow test on his phone. Based
     on what works / what breaks, decide whether S177 wheels into
     SQLite bundling, residuals, or fixing whatever surfaced in
     testing.

  3. **Native Sign Out UI** — not asked; rolling into the post-test
     decision. `clearNativeToken()` is wired and ready; only the UI
     surface is missing. Trivial to add inline once we know S176
     is working.
