S175 — Gradle hand-off runbook (Android signed-APK build on Mac)

# Why this runbook exists

S175 prepared the entire Android shell in the sandbox:

  - `cap add android` ran (scaffold at `app/android/`)
  - 27 launcher / adaptive / splash assets generated from the v4
    brand-mark sources at `brand-assets/` (sharp / @capacitor/assets
    can't run in-sandbox because the libvips download is blocked at
    the egress proxy; PIL was used as a drop-in to produce the
    exact same files at the exact same sizes — see
    `outputs/gen_android_assets.py` for the generator)
  - Adaptive-icon background flipped from `#FFFFFF` to `#0a0e1a`
    (matches the locked dark-onyx reader surface per
    `capacitor.config.ts` `SplashScreen.backgroundColor`)
  - `app/android/app/build.gradle` wired with a `signingConfigs.release`
    block — keystore path + password come from env vars, defaults to
    the Mac-side `~/Desktop/App/_signing/remnant-bible.keystore` path
    via `../../../_signing/remnant-bible.keystore` (resolves correctly
    from `app/android/app/build.gradle`)
  - `app/android/app/src/main/AndroidManifest.xml` wired with the
    App Links intent-filter for `bible.remnantofpromise.org/strongs/*`
    with `autoVerify="true"` (matches the SHA-256
    `D2:E0:F7:17:73:09:6B:74:AB:62:86:C3:B9:75:28:D2:1E:D2:9A:7D:BD:48:7B:8C:19:26:2D:D8:3E:C9:7E:E9`
    already wired in `app/public/.well-known/assetlinks.json`)
  - `npm run build` produced `app/dist/`
  - `npx cap sync android` copied `dist/` into
    `app/android/app/src/main/assets/public/`

What's left is the actual gradle build — and the sandbox can't run
it because the egress allowlist blocks `dl.google.com` (Android
SDK), `repo1.maven.org` (Maven Central), `services.gradle.org`
(Gradle distributions), and `api.adoptium.net` (JDK 17). Your Mac
has Android Studio installed already, so the build runs there in
one command. This file is the runbook for that command.

# Prerequisites on your Mac

You probably already have all of these from the original S173
sandbox-can't-run-Xcode handoff. If not:

  - **JDK 17** — required by Capacitor 8 / AGP 8.7+. Check with
    `java -version` (Android Studio bundles its own; if you have
    AS open at least once, you're fine. Otherwise install via
    Homebrew: `brew install --cask temurin@17`).
  - **Android SDK** — installed via Android Studio's SDK Manager,
    or standalone via cmdline-tools. You need `platforms;android-34`
    + `build-tools;34.0.0` + `platform-tools`. If you've opened the
    project in Android Studio once, you have these.
  - **`ANDROID_HOME` set** — typically `~/Library/Android/sdk` on
    macOS. Check with `echo $ANDROID_HOME`. If unset:
    `export ANDROID_HOME=~/Library/Android/sdk`.

# The build

Open Terminal. Then:

```bash
# 0. Refresh node_modules + dist + cap sync. The sandbox-prepared
#    android/ tree includes an orphan stale bundle (the mount
#    couldn't delete the previous index-*.js file when I rsync'd
#    the new build in). cap sync on your Mac wipes
#    android/app/src/main/assets/public/ and rewrites it from a
#    fresh dist/ — that's the cleanup step.
cd ~/Desktop/App/app
npm install                        # ensures @capacitor/cli + android installed
npm run build                      # regenerates dist/ with the new Settings card
npx cap sync android               # clean rewrite of android assets/public/

# 1. Set the keystore password from Apple Passwords.
#    (Copy from Apple Passwords → paste between the quotes;
#    leave no trailing whitespace.)
export RELEASE_KEYSTORE_PASSWORD="<paste-from-apple-passwords>"

# 2. Run gradle from app/android/.
cd ~/Desktop/App/app/android
./gradlew assembleRelease

# 3. The signed APK lands here:
#    app/build/outputs/apk/release/app-release.apk
```

First gradle run downloads Gradle + AGP + AndroidX deps (~500MB-1GB)
and will take a few minutes. Subsequent runs are quick because
Gradle caches everything in `~/.gradle/caches/`.

If the build fails with "SDK location not found," set
`ANDROID_HOME` per the prerequisite note above and re-run.

If it fails with "Failed to read key remnant-bible from store" or
similar, the password env var didn't get read — check the export
above is in the same shell where you ran `./gradlew`.

# Verify the signing cert matches assetlinks.json

After the APK is produced, confirm the cert SHA-256 matches what's
wired in `app/public/.well-known/assetlinks.json` — this is the
binding contract that lets Android open
`bible.remnantofpromise.org/strongs/{N}` directly in the app
instead of bouncing to Chrome.

```bash
keytool -printcert -jarfile app/build/outputs/apk/release/app-release.apk \
  | grep SHA256
```

Expected output (matching `assetlinks.json`):

```
         SHA256: D2:E0:F7:17:73:09:6B:74:AB:62:86:C3:B9:75:28:D2:1E:D2:9A:7D:BD:48:7B:8C:19:26:2D:D8:3E:C9:7E:E9
```

If the SHA doesn't match, the keystore in `_signing/` is a different
key than the one that produced the SHA wired live. That would mean
either the assetlinks.json SHA was wrong from the start, or the
keystore got regenerated since S174-close. Stop and ping me — don't
ship until the SHAs match or App Links autoVerify will silently
fail and `/strongs/*` URLs will bounce to Chrome instead of opening
the app.

# Hosting rewrite — required before the .apk URL works

S175 added a `/download/*` self-rewrite to `hosting/render.yaml`
(mirroring the `.well-known/*` self-rewrite from S174). Without it,
Render's SPA fallback (`/* -> /index.html`) eats unmatched paths,
so tapping the Download CTA would return the SPA HTML instead of
the .apk binary. The rewrite is a no-op when the file exists, but
needs to ship to production BEFORE (or with) the first .apk
deploy. Commit + push:

```bash
cd ~/Desktop/App
git add hosting/render.yaml
git commit -m "S175 — /download/* self-rewrite (hold path against SPA fallback)"
git push
```

Render auto-deploys the blueprint change. After it propagates,
`curl -I https://bible.remnantofpromise.org/download/anything.test`
should return `404` (file not found) instead of the SPA index.

# Rename + place for download

The Download buttons are already wired and shipping — the Bible app's
/settings page renders an Android-only "Download .apk" card, and the
marketing-site hero (remnantofpromise.org) carries a "Native Android
app available" affordance. Both point at
`https://bible.remnantofpromise.org/download/remnant-bible-v1.0.0.apk`.
They go live the moment the file lands at that URL.

The .apk is served by the Bible app's Vite bundle from
`~/Desktop/App/app/public/download/` (already created with a README).
Drop the signed binary in:

```bash
# from app/android/
cp app/build/outputs/apk/release/app-release.apk \
   ~/Desktop/App/app/public/download/remnant-bible-v1.0.0.apk

# verify it's in place
ls -lh ~/Desktop/App/app/public/download/
```

Then rebuild + deploy the Bible app — Vite includes public/download/
verbatim in dist/, your existing Render deploy ships the file to
bible.remnantofpromise.org.

```bash
cd ~/Desktop/App/app
npm run build
# then your normal deploy command (git push to the render-deployed branch)
```

# Flipping the CTAs live

The Download CTAs are drafted in source but hidden by a feature flag —
anti-false-promise — until the .apk is actually live at the URL above.
TWO flips, both one-line:

**1. Bible-app Landing page** (`app/src/routes/Landing.tsx`):

```diff
- const ANDROID_APK_LIVE = false;
+ const ANDROID_APK_LIVE = true;
```

**2. Marketing-site hero** (`~/Desktop/Website/static-site/index.html`):

Find the `<!-- ... -->` comment block around the `<p class="hero-app-note">`
line and delete the wrapper comment-open and comment-close so the
paragraph renders. The block is marked with `S175 — Native Android app
affordance` and includes its own delete instructions.

Then redeploy:

```bash
# Bible app — rebuild + push
cd ~/Desktop/App/app
npm run build
# then your normal deploy command

# Marketing site
cd ~/Desktop/Website/static-site
git add index.html css/main.css
git commit -m "S175 — Native Android app hero affordance live"
git push
```

After both deploys land, the Landing-page card appears for Android
visitors at bible.remnantofpromise.org, and the marketing-site hero
note appears for all visitors at remnantofpromise.org.

# Live-walk on a real Android device

Final verification:

  1. Open `https://bible.remnantofpromise.org/download/remnant-bible-v1.0.0.apk`
     on an Android device. Browser warns "this file may be harmful"
     because it's not from Play; tap "Download anyway".
  2. Open the .apk file. Android prompts "install unknown apps from
     this source?" → "Settings" → toggle on. Back. Install.
  3. App launches → confirm splash (dark-onyx, 1.5s hold) → confirm
     `SacredNameWelcomeModal` fires on first launch.
  4. Send a `bible.remnantofpromise.org/strongs/G3056` link to the
     device (iMessage / Signal / email). Tap it. **Should open in
     the app directly, NOT in Chrome.** This is the App Links
     autoVerify check — if it bounces to Chrome, either the SHA
     mismatch flagged above, or assetlinks.json isn't being served
     with the right Content-Type.
  5. Inside the app: tap any tagged word → StrongsLookup opens.
     Tap Share → confirm Android native share sheet (not browser
     share) opens with the PNG attachment + the watermark URL.

If all five pass, V1 Android is live.

# Files this runbook references

  - `~/Desktop/App/app/android/` — the prepared shell (just rsync'd
    in from sandbox)
  - `~/Desktop/App/_signing/remnant-bible.keystore` — your signing
    key (gitignored; password in Apple Passwords)
  - `~/Desktop/App/app/public/.well-known/assetlinks.json` — the
    SHA-256 binding (already live at
    `https://bible.remnantofpromise.org/.well-known/assetlinks.json`)
  - `~/Desktop/Website/static-site/download/` — where the renamed
    APK lands for direct distribution
