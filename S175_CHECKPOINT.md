S175 — Android V1 launch (anonymous-only native) — close-out checkpoint

# What S175 actually delivered

V1 Android launched. The signed .apk is live at
`https://bible.remnantofpromise.org/download/remnant-bible-v1.0.0.apk`,
the Bible-app Landing page carries the Android affordance (`ANDROID_APK_LIVE = true`
in `app/src/routes/Landing.tsx`), and the marketing-site hero
(`remnantofpromise.org`) carries the matching "Native Android app available"
line. Three signed builds shipped during the session:

- **v1.0.0** (versionCode 1) — initial direct-distribution build. The
  cert SHA-256 `D2:E0:F7:17:73:09:6B:74:AB:62:86:C3:B9:75:28:D2:1E:D2:9A:7D:BD:48:7B:8C:19:26:2D:D8:3E:C9:7E:E9`
  matches the live `bible.remnantofpromise.org/.well-known/assetlinks.json`
  binding, so App Links autoVerify works for `/strongs/*` URLs from
  iMessage / WhatsApp / etc.
- **v1.0.1** (versionCode 2) — hot fix. Added `https://localhost` to
  `CORS_ORIGINS` in `hosting/render.yaml` (without this the API rejected
  every fetch from the native webview and the reader showed "Error
  loading books" for anonymous users). Suppressed the WP sign-in flow
  in the native shell (the WP login was opening in the in-app webview
  with no return path, and back-navigation leaked to the WP admin
  dashboard for admin users — see Security notes below).
- **v1.0.2** (versionCode 3) — UI fix. The Strong's lookup modal now
  scrolls internally (`max-h-[90vh] overflow-y-auto`) so the close
  button is reachable on narrow Android viewports. The Landing page
  redirects to `/read` in the native shell so the Android back button
  from the reader no longer leaks to a Landing surface (window.location.replace
  prevents a history entry, so back from /read exits the app — the
  expected native behavior).

# The 8 in-sandbox tracks that landed

  - **T1: cap add android** — `npx cap add android` ran in the
    /sessions/sharp-eager-dirac/work/App/app/ tree. Android scaffold at
    `app/android/` with namespace `com.remnantofpromise.bible`,
    targetSdk per Capacitor 8 defaults.
  - **T2: cap:assets via PIL substitute** — `@capacitor/assets` couldn't
    run in the sandbox because the libvips download is blocked at the
    egress proxy. A Python/PIL script (`outputs/gen_android_assets.py`)
    generated the exact same 27 launcher / adaptive / splash files from
    the v4 brand-mark sources. Adaptive-foreground uses the 66%
    safe-area convention; adaptive background flipped from white to
    `#0a0e1a` to match the locked dark-onyx reader surface.
  - **T3: signing config wired** — `app/android/app/build.gradle`
    `signingConfigs.release` block reads keystore path + password +
    alias + key-password from env vars (`RELEASE_KEYSTORE_PATH`,
    `RELEASE_KEYSTORE_PASSWORD`, `RELEASE_KEY_ALIAS`,
    `RELEASE_KEY_PASSWORD`). Defaults to the Mac-side
    `../../../_signing/remnant-bible.keystore` relative path so the
    file is portable between sandbox and Mac.
  - **T4: AndroidManifest App Links** — intent-filter for
    `https://bible.remnantofpromise.org/strongs/*` with
    `autoVerify="true"`.
  - **T5: dist build + cap sync** — restructured the work tree to
    `work/App/app/` with a `brand-assets` symlink so the
    `../../../brand-assets/*.png` imports resolve. `npm run build`
    produced fresh dist; `npx cap sync android` copied it into the
    Android assets directory. tsc clean.
  - **T6: source code — Bible app source edits** — multiple iterations
    during the launch arc. Final state:
    - `app/src/routes/Landing.tsx` — Android-app affordance (visible to
      Android UA only, hidden in native shell) gated by
      `ANDROID_APK_LIVE = true`. Native shell redirects to `/read`
      immediately, skipping Landing entirely.
    - `app/src/routes/SignIn.tsx` — detects native, replaces the WP
      login buttons with a "the native app reads anonymously" message
      that points to the PWA for account features. Honest about the
      sync gap (signing in on the web doesn't carry over to the native
      app).
    - `app/src/components/SacredNameWelcomeModal.tsx` — skips the
      sign-in ask step entirely in native (just dismisses after the
      sacred-name choice).
    - `app/src/components/StrongsLookup.tsx` — modal max-h-[90vh] +
      overflow-y-auto so the close button is reachable on phone.
  - **T7: source code — marketing-site hero affordance** —
    `static-site/index.html` `hero-app-note` paragraph + matching CSS
    rule (`.hero-app-note`) in `css/main.css`.
  - **T8: android/ rsync to cowork mount + gradle hand-off** — the
    sandbox-prepared android/ tree was rsync'd to
    `~/Desktop/App/app/android/`. Yoshi installed Android Studio
    (Standard setup, ~30 min), `export ANDROID_HOME` and `export
    JAVA_HOME` to the bundled JBR 21, deleted macOS Finder duplicates
    (`config 2.xml`, etc.), re-pasted the keystore password without
    the trailing space, and `./gradlew assembleRelease` produced the
    signed APK. Three iterations through this build cycle as fixes
    landed.

# Hosting changes (require Render auto-redeploy on next push)

  - **`hosting/render.yaml`** — three S175 additions:
    - `/download/*` self-rewrite, mirroring the `.well-known/*`
      pattern from S174, so the .apk binary serves from
      `app/public/download/` instead of being swallowed by the SPA
      fallback.
    - `https://localhost` added to `CORS_ORIGINS` so the native
      webview can call the API.
  - **`app/public/download/`** — folder + README + the signed v1.0.2
    .apk binary. Vite copies verbatim to dist/ at build time.

# Live verifications

  - assetlinks.json — `Content-Type: application/json`,
    SHA matches keystore, `package_name: com.remnantofpromise.bible`
    matches appId
  - .apk URL — `HTTP/2 200`, `Content-Type:
    application/vnd.android.package-archive`, `Content-Length:
    13001864`. Served correctly by Render. The earlier web_fetch
    diagnostic was misleading (Anthropic's fetcher can't render
    binaries inline; returned HTML-shaped fallback).
  - Sanity suite — 15 runners, 553 assertions, all green against
    the S175 source edits.

# V1 limitations (what's documented as deferred to S176+)

  - **Native auth is not implemented.** The Capacitor webview loads
    from `https://localhost` (Capacitor's internal scheme). The WP
    JWT cookie lives on `.remnantofpromise.org`. Cookies don't cross
    origins, so the native app can never see the user's signed-in
    state from the web. The SignIn route in native renders an honest
    "the native app reads anonymously" message pointing to the PWA
    for account-tied features. The native app is genuinely
    anonymous-only in V1.
  - **No bundled offline data.** The native app's scripture/extras
    reads still go to the live API. The earlier session plan was
    SQLite-bundled scripture (true offline-first) via
    `@capacitor-community/sqlite`. Not in V1.
  - **No over-the-air JS updates.** Every JS fix requires a rebuild
    + .apk re-download + reinstall on the phone. Capacitor's bundled
    webDir approach has no built-in update mechanism. Capacitor Live
    Updates (Appflow, paid service) is V1.1+ infrastructure work.
  - **Play button (audio) reportedly doesn't work in the native
    shell.** Yoshi flagged this during V1 testing. Capacitor's
    webview may be blocking the Web Speech API path. Diagnosis
    needed; specific behavior (which Play, what happens) wasn't
    captured before session wrap.

# Security notes (WordPress role permissions)

The WP login page that opened from the native app's webview was a
real UX leak — back-navigation could land on the WP admin dashboard
for admin users (like Yoshi). The S175.1 fix suppressed the WP
login flow entirely in the native shell, eliminating the leak.

For the underlying WP user-permissions question that came up: as
long as the WP "New User Default Role" (Settings → General) is set
to **Subscriber**, regular partners signing in only see their own
profile page — they cannot edit posts, settings, plugins, or other
users. The `bible-companion` plugin's HMAC partner_tier sync only
writes the `rop_partner_tier` user-meta field; it does not change
user roles. Verification: confirm Settings → General → "New User
Default Role" reads Subscriber.

# Files this session produced

  - `~/Desktop/App/app/android/` — full Capacitor Android project
    (3 builds shipped: v1.0.0, v1.0.1, v1.0.2)
  - `~/Desktop/App/app/public/download/remnant-bible-v1.0.0.apk` —
    signed v1.0.2 binary (13MB) at the stable URL
  - `~/Desktop/App/app/public/download/README.md`
  - `~/Desktop/App/hosting/render.yaml` — `/download/*` rewrite +
    CORS_ORIGINS update
  - `~/Desktop/App/app/src/routes/Landing.tsx` — native redirect
    + Android affordance
  - `~/Desktop/App/app/src/routes/SignIn.tsx` — native-detection
    + honest "anonymous app" message
  - `~/Desktop/App/app/src/components/SacredNameWelcomeModal.tsx`
    — skip sign-in step in native
  - `~/Desktop/App/app/src/components/StrongsLookup.tsx` — modal
    scroll fix
  - `~/Desktop/App/app/android/app/build.gradle` — versionCode 3,
    versionName "1.0.2"
  - `~/Desktop/App/app/android/app/src/main/AndroidManifest.xml` —
    App Links intent-filter
  - `~/Desktop/Website/static-site/index.html` — hero Android
    affordance (live, uncommented)
  - `~/Desktop/Website/static-site/css/main.css` — `.hero-app-note`
    style
  - `~/Desktop/App/.gitignore` — sandbox-probe leftovers
  - `~/Desktop/App/S175_GRADLE_BUILD_RUNBOOK.md` — operator runbook
    (full sequence)
  - `~/Desktop/App/S175_CHECKPOINT.md` — this file
  - `outputs/gen_android_assets.py` — PIL-based asset generator

# S176 wheel — proper offline-first native architecture

The V1 launch shipped under significant native limitations.
S176's job is to do the native architecture properly:

  1. **SQLite-bundled scripture** via `@capacitor-community/sqlite`.
     The .apk ships with the full canon + apocrypha + Jasher +
     1 Enoch + Jubilees + lexicons in a local SQLite database.
     Reader components migrate from `fetch('/api/...')` to local
     SQLite queries. True offline reading — no network round-trip
     for scripture or lexicons. Build script packages the DB into
     android/app/src/main/assets/ at gradle time.

  2. **Native auth via Capacitor Browser plugin + App Link JWT
     callback.** Replace the WP-in-webview pattern with:
     - SignIn route opens `Browser.open(wpLoginUrl)` to the system
       browser
     - WP redirects to `bible.remnantofpromise.org/auth-callback?token=<JWT>`
       after login
     - AndroidManifest intent-filter for `/auth-callback` with
       autoVerify intercepts that URL
     - Deep-link router extracts the JWT, stores it via Capacitor
       Preferences (or secure storage)
     - API client switches from cookie-based to `Authorization:
       Bearer <JWT>` header
     - User is signed in inside the native app

     WordPress-side requirement to investigate first: does the
     existing JWT auth plugin (`jwt-auth`) support a redirect-with-
     token flow, or does a custom WP endpoint need to be built?
     Without that endpoint, the App Link callback has no JWT to
     deliver.

  3. **Account features in native.** Once auth is in place, the
     reader's signed-in branches (notes, bookmarks, highlights,
     display-prefs sync) light up in native too. The PWA-vs-native
     split disappears.

  4. **Diagnose + fix Play button** (audio playback failing in
     native shell). Specific failure mode needs capture first.

  5. **Capacitor Live Updates (Appflow) evaluation.** Decide
     whether to pay for the OTA bundle update service or accept
     the rebuild-and-reinstall workflow for every JS fix. Affects
     V1.1+ iteration velocity significantly.

# Standing residuals unchanged

  - Tier revamp copy execution (S174_TIER_REVAMP_SPEC.md — Pricing.tsx
    Scribe removal, Companion revision, Library footnote, WIP-disclosure
    modal). Deferred from this session in favor of Android launch.
  - Family-plan build (Yoshi nix'd at S175 open — re-open when ready)
  - iOS PWA install affordance (Q48-candidate)
  - Apple Developer enrollment decision
  - S172.9 chapter-pill revision, NT morph fuzzy-join, apocrypha
    paragraph Yoshi-eye revision, 9 long-tail S161 singletons,
    Yahuah → Adonai vocatives, V1.2+ per-entry OG generator
