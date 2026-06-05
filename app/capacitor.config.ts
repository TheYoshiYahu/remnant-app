/**
 * S173 — Capacitor wrap config for the iOS + Android shells.
 *
 * App identity:
 *   - appId:    com.remnantofpromise.bible  (matches the bundle ID
 *               spec'd in BIBLE_APP_ROADMAP.md Phase 10.2;
 *               .bible suffix disambiguates from any future RoP-
 *               companion shells)
 *   - appName:  Remnant of Promise          (homescreen label;
 *               matches the brand register, not the long-form
 *               "Remnant of Promise Official Study Bible" which would
 *               truncate on every device)
 *   - webDir:   dist                        (Vite build output;
 *               `cap sync` copies this into the native shells)
 *
 * Server / live-reload posture:
 *   - On a release build, Capacitor serves the bundled webDir from the
 *     native shell (no `server` block — content ships in the IPA/APK).
 *   - During local dev you can uncomment the server.url override to
 *     point the shell at the Vite dev server (`http://<your-lan-ip>:5173`)
 *     for hot reload across the iOS simulator / Android emulator;
 *     remove before building for store submission. The pattern is
 *     documented at https://capacitorjs.com/docs/guides/live-reload.
 *
 * Deep links (the S171 /strongs/{N} share URLs):
 *   - iOS  Universal Links — declared in the .entitlements file under
 *     `com.apple.developer.associated-domains` with value
 *     `applinks:bible.remnantofpromise.org`. The `apple-app-site-
 *     association` JSON ships at hosting/render.yaml's /apple-app-
 *     site-association route (see /api/hosting docs note in the close).
 *   - Android App Links — declared in AndroidManifest.xml via an
 *     intent-filter with autoVerify=true on the
 *     bible.remnantofpromise.org host. The matching Digital Asset
 *     Links assetlinks.json ships at the same hosting root.
 *   - In-app routing: lib/deep-link.ts subscribes to @capacitor/app's
 *     `appUrlOpen` and forwards bible.remnantofpromise.org/strongs/{N}
 *     URLs to the existing /strongs route handler.
 *
 * Reverse-DNS appId is the locked Apple/Google identity for the app;
 * changing it after store submission requires re-listing.
 */

import type { CapacitorConfig } from "@capacitor/cli";

const config: CapacitorConfig = {
  appId: "com.remnantofpromise.bible",
  appName: "Remnant of Promise",

  // webDir stays as the build output for `cap sync` (and as the
  // offline fallback bundle when the offline-download feature lands).
  // It is NOT what the shell serves at runtime while `server.url` is
  // set below — the live URL wins.
  webDir: "dist",

  // S201 — load the LIVE web app, not the baked-in bundle.
  //
  // This is the by-URL posture set in the early sessions: the native
  // shell is a thin wrapper that loads the live PWA, so every Render
  // web deploy reaches the installed app with no app rebuild. (The
  // "download everything for offline" capability is a SEPARATE, future
  // feature — it does not require the bundled-webDir posture and is not
  // wired here.)
  //
  // Why the phone was broken: the shell shipped with NO server block, so
  // it served the frozen `dist/` baked into the IPA/APK at build time.
  // Render web deploys (the S178 / S199 / S200 / S201 fixes) never
  // reached the installed app — it ran stale code, which is why the book
  // picker showed only the 66-book canon and TSK was gone on the phone
  // while the live web at bible.remnantofpromise.org worked fine.
  //
  // Origin note (DEVICE-TEST THIS after the first rebuild): with
  // server.url set, the webview's origin becomes
  // https://bible.remnantofpromise.org instead of https://localhost.
  // The native sign-in path is unaffected — the in-app credential form
  // (lib/native-auth.ts loginWithCredentials) stores the JWT in
  // Capacitor Preferences and api.ts attaches it as a Bearer header
  // regardless of origin, and Capacitor.isNativePlatform() still returns
  // true so that path stays active. The change is that the
  // .remnantofpromise.org SSO cookie may now also be visible to the
  // webview. Verify sign-in on a real device after the first rebuild.
  server: {
    url: "https://bible.remnantofpromise.org",
  },

  plugins: {
    // SplashScreen — short hold while the WebView paints the first
    // route. The brand-mark is the locked v4 watermark per
    // brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png;
    // `@capacitor/assets` (cap:assets script) generates the
    // per-density splash variants from that source.
    SplashScreen: {
      launchShowDuration: 1500,
      launchAutoHide: true,
      backgroundColor: "#0a0e1a", // matches the locked dark-onyx reader surface
      androidScaleType: "CENTER_CROP",
      splashImmersive: false,
      splashFullScreen: false,
    },
  },

  ios: {
    contentInset: "always",
    // Allows ahash:// + custom URL fallbacks without HTTPS in the
    // WKWebView's evaluateJavaScript context. We don't ship any
    // HTTP-only resources; this is a sandbox-tooling convenience flag.
    limitsNavigationsToAppBoundDomains: false,
  },

  android: {
    allowMixedContent: false, // production HTTPS-only
    // S178 — captureInput must stay FALSE. When true, the Android
    // WebView captures keyboard input in a way that interferes with
    // soft-keyboard IME composition on text/password fields —
    // specifically blocking backspace/delete after a character is
    // entered. Reported live in S178 phone-test of the in-app sign-in
    // form. The Capacitor docs themselves call out this flag as a
    // common cause of "users cannot type / delete in text inputs."
    captureInput: false,
    webContentsDebuggingEnabled: false,
  },
};

export default config;
