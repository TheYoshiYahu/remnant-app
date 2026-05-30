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
 */

export const OPEN_STRONGS_EVENT = "rop:open-strongs";

export interface OpenStrongsDetail {
  strongNumber: string;
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

type Teardown = () => void;

/**
 * Subscribe to @capacitor/app's appUrlOpen and route
 * bible.remnantofpromise.org/strongs/{N} URLs to the in-app strongs
 * surface. No-op on web (Capacitor.isNativePlatform() === false).
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
