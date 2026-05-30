S173 — Capacitor wrap setup (iOS + Android shells)

# What landed this session (sandbox-side, code-only)

  - `app/capacitor.config.ts` — appId `com.remnantofpromise.bible`,
    appName `Remnant of Promise`, webDir `dist`, splash + iOS/Android
    plugin posture.
  - `app/package.json` — `@capacitor/{core,cli,ios,android,share,app,
    filesystem,assets}` added; four new scripts (`cap:sync`,
    `cap:ios`, `cap:android`, `cap:assets`).
  - `app/src/lib/capacitor-share.ts` — `tryNativeShare` /
    `tryNativeShareText` helpers; dynamic-import gated on
    `Capacitor.isNativePlatform()` so the web bundle stays slim and
    falls through to the existing navigator.share chain on the PWA.
  - `app/src/lib/share-card-render.ts` — Path 0 (native share) added
    to both `executeShare` and `executeCopy`.
  - `app/src/lib/study-share-render.ts` — Path 0 added to
    `executeStudyShare`; native share URL is the anchor permalink for
    xref shares and the `/strongs/{N}` URL for strongs shares.
  - `app/src/lib/deep-link.ts` — `installDeepLinkRouter` +
    `parseStrongsDeepLink` + `dispatchOpenStrongs`.
  - `app/src/App.tsx` — `installDeepLinkRouter` fires on mount; new
    listener opens `StrongsLookup` from the deep-link CustomEvent.
  - `_s173_deep_link_sanity.mjs` — 36/36 (NEW).

All TS clean (`npx tsc --noEmit` exits 0). The Capacitor dynamic
imports compile to dynamic specifiers TypeScript doesn't try to
resolve at type-check time — they'll resolve at runtime after `npm
install` runs on your Mac.

# What you run on your Mac

Sandbox can't run `npm install`, `npx cap add`, Xcode, Android
Studio, or any signing-cert workflow. The commands below are the
exact handoff. Run from `~/Desktop/App/app` unless otherwise noted.

## 1. Install Capacitor + add native shells

```bash
cd ~/Desktop/App/app
npm install
npx cap add ios
npx cap add android
```

`cap add ios` creates `app/ios/` (an Xcode workspace + Pods). `cap
add android` creates `app/android/` (a Gradle project). Both
directories are intended to be committed — they're the native shells
you'll open in Xcode / Android Studio.

After both succeed:

```bash
npm run build                # produces app/dist/
npx cap sync                 # copies dist/ into both native shells
```

`cap sync` runs on every PWA change you want reflected on a native
build (or use the `cap:ios` / `cap:android` scripts which chain
build + sync + open).

## 2. Generate app icons + splash screens from the v4 brand-mark

Source assets exist (`brand-assets/app-icon-ios-1024x1024.png`,
`brand-assets/app-icon-android-play-store-512x512.png`). The
`@capacitor/assets` package generates the full per-density icon set +
splash screens from those sources.

First, copy the sources to where `@capacitor/assets` looks:

```bash
mkdir -p assets
cp ../brand-assets/app-icon-ios-1024x1024.png            assets/icon.png
cp ../brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png \
                                                          assets/splash.png
# Optional: separate dark-mode icon/splash if you want them differentiated
# cp <dark-source>                                         assets/icon-dark.png
# cp <dark-source>                                         assets/splash-dark.png
```

Then generate:

```bash
npm run cap:assets
```

This populates `app/ios/App/App/Assets.xcassets/AppIcon.appiconset/`
and `app/android/app/src/main/res/mipmap-*/` with the full set, plus
launch image variants. The background-color flags in the
`cap:assets` script (`#0a0e1a`) match the locked dark-onyx reader
surface so the splash holds the brand register through cold-launch.

Re-run `npm run cap:assets` any time the source brand-mark
changes; commit the generated assets.

## 3. Universal Links + App Links (deep-link routing)

The S171 watermark URL pattern `bible.remnantofpromise.org/strongs/{N}`
needs to route into the installed app instead of the browser when
tapped from iMessage / WhatsApp / Mail. Two host-side files publish
the association:

### iOS — `apple-app-site-association`

Lives at `https://bible.remnantofpromise.org/.well-known/apple-app-site-association`
(no extension; `Content-Type: application/json`).

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "TEAMID.com.remnantofpromise.bible",
        "paths": ["/strongs/*"]
      }
    ]
  }
}
```

Replace `TEAMID` with your Apple Developer Team ID (10-character
string visible in App Store Connect → Membership). Wire this file
into `hosting/render.yaml` as a static route — Render serves the
PWA's static site, and the `.well-known/` path needs to be
explicitly preserved against the SPA-fallback rewrite (same
ordering rule as the `/strongs/*` redirect added at S171).

Add to `app/ios/App/App/App.entitlements`:

```xml
<key>com.apple.developer.associated-domains</key>
<array>
  <string>applinks:bible.remnantofpromise.org</string>
</array>
```

Xcode → Signing & Capabilities → + Capability → Associated Domains
also accomplishes the same edit through the UI.

### Android — `assetlinks.json`

Lives at `https://bible.remnantofpromise.org/.well-known/assetlinks.json`.

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.remnantofpromise.bible",
      "sha256_cert_fingerprints": [
        "AA:BB:CC:..."
      ]
    }
  }
]
```

The SHA-256 fingerprint is the cert your signing key produces.
Get it after generating the keystore (step 5 below) via:

```bash
keytool -list -v -keystore _signing/remnant-bible.keystore \
        -alias remnant-bible
```

Look for `SHA256:` in the output. Paste with the colons as shown
(Google Play also requires fingerprints from any upload keys Play
adds via Play App Signing — pull those from Play Console → Setup →
App integrity after the first AAB upload).

Add to `app/android/app/src/main/AndroidManifest.xml` inside the
main `<activity>`:

```xml
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https"
          android:host="bible.remnantofpromise.org"
          android:pathPrefix="/strongs/" />
</intent-filter>
```

`autoVerify="true"` triggers Android to fetch `assetlinks.json` and
register the app as the default handler for matching URLs.

## 4. iOS — Apple Developer + TestFlight

  1. Apple Developer Program account active ($99/yr).
  2. App Store Connect → My Apps → + → New App.
     Bundle ID: `com.remnantofpromise.bible` (matches the
     `capacitor.config.ts` appId). Platform: iOS. Name: "Remnant of
     Promise" (or your final store-display name). SKU: any unique
     string.
  3. Open the Xcode project:
     ```bash
     cd ~/Desktop/App/app && npx cap open ios
     ```
  4. Xcode → Signing & Capabilities → set Team → check "Automatically
     manage signing" → confirm the bundle ID auto-resolves.
  5. Xcode → Product → Archive (set scheme to "App" + destination to
     "Any iOS Device").
  6. Organizer (auto-opens after archive) → Distribute App → App Store
     Connect → Upload. The build appears in App Store Connect →
     TestFlight after Apple's processing (5-15 min).
  7. TestFlight → Internal Testing → add yourself; install via the
     TestFlight app on your iPhone. Walk the live checklist below.
  8. When ready to submit to the public store, App Store Connect →
     App Store tab → set Build to the TestFlight build → fill listing
     copy + screenshots (Yoshi-voice authoring; flag for me when
     drafting) → Submit for Review.

External-link entitlement for Stripe subscriptions: Apple requires
explicit approval per BIBLE_APP_ROADMAP.md Phase 10.2. Apply at
App Store Connect → App Information → Distribution method.

## 5. Android — Play Console + signing keystore

  1. Generate the upload keystore (do this ONCE — losing it means no
     app updates ever again):
     ```bash
     mkdir -p ~/Desktop/App/_signing
     keytool -genkey -v \
       -keystore ~/Desktop/App/_signing/remnant-bible.keystore \
       -alias remnant-bible \
       -keyalg RSA -keysize 2048 -validity 10000
     ```
     Strong password. Back up the keystore + password offline
     (encrypted USB, password manager). Add `_signing/` to
     `.gitignore` (check first — it may already be).

  2. Configure signing in `app/android/app/build.gradle` — Android
     Studio's Build → Generate Signed App Bundle workflow walks
     through this UI-side.

  3. Play Console → All apps → Create app.
     App name: "Remnant of Promise". Package name (later set via
     manifest): `com.remnantofpromise.bible`. Default language: en-US.
     App or game: App. Free or paid: Free.

  4. Build the signed AAB + APK:
     ```bash
     cd ~/Desktop/App/app && npx cap sync android
     cd ~/Desktop/App/app/android
     ./gradlew bundleRelease assembleRelease
     ```
     Signed artifacts land at:
       - `app/android/app/build/outputs/bundle/release/app-release.aab`
         (upload to Play Console)
       - `app/android/app/build/outputs/apk/release/app-release.apk`
         (stage at `bible.remnantofpromise.org/download/...` for
         direct install per the roadmap)

  5. Play Console → Production → Create new release → upload the AAB.
     Organization account (`Remnant Of Promise`) exempts the
     12-tester / 14-day Closed Testing rule (per BIBLE_APP_ROADMAP
     Phase 10.1) so submitting directly to Production is allowed.

  6. Listing copy + screenshots (Yoshi-voice authoring; flag for me).

# Live-walk checklist on a real device

After TestFlight install (iOS) or Internal Test install (Android),
walk these in order:

  1. **First-launch modal** — fresh install fires the
     `SacredNameWelcomeModal` (S172). Pick "Yahuah (LORD)". Reader
     opens.
  2. **Deep link** — paste
     `https://bible.remnantofpromise.org/strongs/G3056` into iMessage
     on a SECOND phone, send to the test phone, tap from iMessage.
     Confirm: app opens → StrongsLookup modal appears with G3056
     (λόγος / logos) pre-loaded. If the URL opens Safari instead of
     the app, the apple-app-site-association file isn't being served
     (404 or wrong Content-Type) — verify with `curl -I
     https://bible.remnantofpromise.org/.well-known/apple-app-site-association`.
  3. **Native share — verse** — long-press a verse → Share → confirm
     iOS Action sheet (NOT a browser share) opens with the PNG
     attachment + the watermark URL in the text slot. Send to your
     other phone — confirm receiving phone shows the PNG inline.
  4. **Native share — §17 xref** — open Genesis 1 → scroll to
     ChapterEndCard → tap Share on a per-verse block → same flow as
     above, filename `xref-genesis-1.1-rop-study.png`, URL slot
     shows the anchor permalink.
  5. **Native share — §30 strongs** — tap any tagged word →
     StrongsLookup opens → Share → file/url confirms as above, URL
     slot shows `bible.remnantofpromise.org/strongs/{N}`.
  6. **Sacred-name mask toggle** — Settings → flip mask → reader
     re-renders. If signed in, install the app on the SECOND phone,
     sign in there — confirm the second phone picks up the flipped
     preference at sign-in (Track 3 server-wins reconciliation).
  7. **Cold launch** — kill the app → reopen. Splash holds 1.5s,
     reader resumes at the last verse position. No re-fire of the
     welcome modal (rop_sacred_name_mask_v1 persisted across native
     app lifecycle).

# Open items / future wheels

  - **`@capacitor-community/text-to-speech`** for the native TTS
    pipeline per BIBLE_APP_ROADMAP.md Phase 9.4 — separate wheel; not
    in S173 scope. Add when the §25 TTS audio wheel opens.
  - **External-link entitlement application** at App Store Connect
    for Stripe subscriptions — has a multi-day Apple review. Start
    the application as soon as the Developer account is active.
  - **OG image per-strongs-entry generator** for `/strongs/{N}/og-
    image.png` — flagged at S171 Track 3 as V1.2+ stretch. Reopen
    if partner feedback flags brand-mark-only previews as
    insufficient.
