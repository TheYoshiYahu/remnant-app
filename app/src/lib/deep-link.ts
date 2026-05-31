/**
 * S173 — Deep-link router for the Capacitor shells.
 *
 * The S171 watermark URL pattern is
 *   bible.remnantofpromise.org/strongs/{N}
 *
 * On the web the URL 302-redirects (per hosting/render.yaml) to the
 * api.bible.remnantofpromise.org server-rendered HTML page. On native
 * shells the same URL is captured as an iOS Universal Link / Android
 * App Link and dispatched to the app via @capacitor/app's
 * `appUrlOpen` event — bypassing the redirect entirely. This module
 * subscribes to that event and translates the URL into an in-app
 * action so the partner who taps a shared `/strongs/G3056` link in
 * iMessage lands directly on the StrongsLookup modal for G3056
 * inside the app.
 *
 * The action surface is a CustomEvent `rop:open-strongs` carrying
 * `{strongNumber: string}` in `detail`. The Reader component listens
 * for the event and opens its StrongsLookup modal with the matching
 * strong number — same surface as the in-reader tap-on-word path.
 *
 * Lifecycle:
 *   - `installDeepLinkRouter()` — fires once at App mount; subscribes
 *     to @capacitor/app's appUrlOpen and registers the listener.
 *     Returns a teardown function (for React useEffect's cleanup);
 *     the teardown calls `removeAllListeners` on the plugin.
 *   - On a web bundle (no Capacitor), `installDeepLinkRouter` is a
 *     no-op that returns a no-op teardown. Safe to call
 *     unconditionally from App.tsx.
 *
 * S176 — second URL family: bible.remnantofpromise.org/auth-callback.
 *   This is the App Link surface for the native sign-in flow. The
 *   WordPress rop-sso-bridge plugin v1.1.0 redirects to that URL with
 *   either ?token=<JWT> (success) or ?error=<code> (failure) after
 *   the partner authenticates in the system browser. The router
 *   below parses the URL via parseAuthCallbackDeepLink (in
 *   lib/native-auth.ts), persists the token through
 *   storeNativeToken(), and dispatches an in-app
 *   `rop:auth-callback` CustomEvent so any open UI (the SignIn page,
 *   the Reader) can react — typically by navigating the partner
 *   forward to /read, or by surfacing a sign-in-failed message.
 */

import {
  parseAuthCallbackDeepLink,
  storeNativeToken,
} from "./native-auth";

export const OPEN_STRONGS_EVENT = "rop:open-strongs";
export const AUTH_CALLBACK_EVENT = "rop:auth-callback";

export interface OpenStrongsDetail {
  strongNumber: string;
}

/**
 * Payload of the `rop:auth-callback` CustomEvent. `ok` distinguishes
 * the success path (token stored, partner is now signed in) from the
 * failure path (display the error code to the partner). The error
 * code is the WP-side string — currently one of `mint_failed`,
 * `missing_token` — surfaced as-is so the receiver can branch on it.
 */
export interface AuthCallbackDetail {
  ok: boolean;
  error?: string;
}

/**
 * Parse `bible.remnantofpromise.org/strongs/{N}` (and variants like
 * `https://bible.remnantofpromise.org/strongs/G3056?utm=...`) into a
 * canonical strong number. Mirrors the api/main.py
 * `_normalize_strong_number` shape: `H#` / `G#` prefix + 4-digit
 * zero-pad (e.g., `h1` → `H0001`, `G3056` → `G3056`). Returns null on
 * any URL that doesn't match the strongs route.
 *
 * Exported for the S173 deep-link sanity test.
 */
export function parseStrongsDeepLink(rawUrl: string): string | null {
  let url: URL;
  try {
    url = new URL(rawUrl);
  } catch {
    return null;
  }
  // Accept both apex (bible.remnantofpromise.org) and api subdomain
  // (api.bible.remnantofpromise.org) — the Render 302 redirect target
  // may land the URL on api. if the OS resolves the redirect before
  // dispatching to the app.
  const host = url.hostname.toLowerCase();
  if (
    host !== "bible.remnantofpromise.org" &&
    host !== "api.bible.remnantofpromise.org"
  ) {
    return null;
  }
  const match = url.pathname.match(/^\/strongs\/([A-Za-z]?[0-9]+)\/?$/);
  if (!match) return null;
  return normalizeStrongNumber(match[1]);
}

/**
 * Canonicalize a raw strong-number token into the `H#`/`G#` + 4-digit
 * zero-pad shape. Mirrors api/main.py `_normalize_strong_number` so a
 * link with a non-canonical form (`g3056`, `H1`, `0001`) still routes.
 * Returns null if the token doesn't parse as a strong number.
 */
function normalizeStrongNumber(raw: string): string | null {
  const trimmed = raw.trim();
  if (trimmed.length === 0) return null;
  const head = trimmed[0]!.toUpperCase();
  let prefix: string;
  let digits: string;
  if (head === "H" || head === "G") {
    prefix = head;
    digits = trimmed.slice(1);
  } else {
    // No prefix on the URL — can't disambiguate Hebrew vs Greek
    // server-side. The api/main.py route would 422 here; we mirror
    // by returning null so the deep-link silently no-ops.
    return null;
  }
  if (!/^[0-9]+$/.test(digits)) return null;
  const padded = digits.padStart(4, "0");
  return `${prefix}${padded}`;
}

/**
 * Dispatch the in-app open-strongs event. Reader component listens.
 * Exported for the sanity test to assert dispatch shape.
 */
export function dispatchOpenStrongs(strongNumber: string): void {
  if (typeof window === "undefined") return;
  try {
    window.dispatchEvent(
      new CustomEvent<OpenStrongsDetail>(OPEN_STRONGS_EVENT, {
        detail: { strongNumber },
      })
    );
  } catch {
    /* CustomEvent unavailable (rare) — fail silent. */
  }
}

/**
 * Dispatch the in-app auth-callback event. The AuthCallback route +
 * the SignIn page listen for this — typically navigating the partner
 * forward to /read on success or surfacing the error code on failure.
 * Exported for the S176 sanity test.
 */
export function dispatchAuthCallback(detail: AuthCallbackDetail): void {
  if (typeof window === "undefined") return;
  try {
    window.dispatchEvent(
      new CustomEvent<AuthCallbackDetail>(AUTH_CALLBACK_EVENT, {
        detail,
      })
    );
  } catch {
    /* CustomEvent unavailable (rare) — fail silent. */
  }
}

type Teardown = () => void;

/**
 * Subscribe to @capacitor/app's appUrlOpen and route incoming URLs
 * to the right in-app surface:
 *
 *   - bible.remnantofpromise.org/strongs/{N}    → StrongsLookup modal
 *   - bible.remnantofpromise.org/auth-callback  → store JWT + signal
 *
 * No-op on web (Capacitor.isNativePlatform() === false).
 *
 * Returns a teardown function that removes all listeners — for use in
 * React useEffect cleanup. Call as:
 *
 *   useEffect(() => {
 *     let teardown: () => void = () => {};
 *     void installDeepLinkRouter().then((td) => { teardown = td; });
 *     return () => teardown();
 *   }, []);
 */
export async function installDeepLinkRouter(): Promise<Teardown> {
  // native-auth is statically imported above — web-safe because the
  // @capacitor/preferences import inside its function bodies is itself
  // lazy. Capacitor core + app remain dynamic so the web bundle
  // doesn't pull them in eagerly.
  let Capacitor;
  let App;
  try {
    ({ Capacitor } = await import("@capacitor/core"));
    if (!Capacitor.isNativePlatform()) {
      return () => {};
    }
    ({ App } = await import("@capacitor/app"));
  } catch {
    return () => {};
  }

  const handle = await App.addListener(
    "appUrlOpen",
    (event: { url: string }) => {
      // S176 — try /auth-callback first; it's the URL the system
      // browser hands off on a fresh sign-in, so it's the most
      // time-sensitive route to resolve cleanly. /strongs/{N} is the
      // already-running-app path and tolerates the second branch's
      // millisecond delay.
      const auth = parseAuthCallbackDeepLink(event.url);
      if (auth !== null) {
        if (auth.kind === "token") {
          void storeNativeToken(auth.token).then(() => {
            dispatchAuthCallback({ ok: true });
          });
        } else {
          dispatchAuthCallback({ ok: false, error: auth.code });
        }
        return;
      }
      const strongNumber = parseStrongsDeepLink(event.url);
      if (strongNumber) dispatchOpenStrongs(strongNumber);
    }
  );

  return () => {
    // Capacitor's addListener returns a PluginListenerHandle with a
    // .remove() method (Capacitor 4+ shape).
    try {
      void handle.remove();
    } catch {
      /* harmless on early teardown */
    }
  };
}
