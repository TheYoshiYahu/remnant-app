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
  webDir: "dist",

  // Server block — leave commented for release builds. To run the
  // native shell against your local Vite dev server during a phone-
  // walk session, uncomment + set `url` to your LAN IP:
  //
  // server: {
  //   url: "http://192.168.1.10:5173",
  //   cleartext: true,
  // },

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
    captureInput: true,
    webContentsDebuggingEnabled: false,
  },
};

export default config;
