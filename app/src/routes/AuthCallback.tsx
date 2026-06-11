/**
 * S176 — Auth callback landing route.
 *
 * Mounted at /auth-callback. The route is hit one of two ways:
 *
 *   (1) NATIVE shell, App Link intercepted the URL.
 *
 *       Android's autoVerify intent-filter for /auth-callback launches
 *       the native app with the URL attached. The deep-link router
 *       (lib/deep-link.ts → installDeepLinkRouter → appUrlOpen) parses
 *       the URL via parseAuthCallbackDeepLink, persists the token via
 *       storeNativeToken, and dispatches the `rop:auth-callback`
 *       CustomEvent. The native shell, however, may STILL navigate the
 *       webview to /auth-callback as part of the App Link handoff
 *       (depending on Android version + Custom Tab behavior) — so this
 *       route renders even on the success path. The render does
 *       belt-and-suspenders work: re-extracts the token from the
 *       URL, hands it to storeNativeToken (idempotent), and
 *       navigates the partner forward to /read.
 *
 *   (2) WEB / PWA, user landed here directly.
 *
 *       Unusual but possible: a partner copies the auth-callback URL
 *       from one device to another, or hits it through some link path
 *       we didn't anticipate. The same code runs: extract the token
 *       from the URL, hand it to storeNativeToken (which writes the
 *       rop_jwt cookie on web — falling through to the existing PWA
 *       cookie path), and navigate forward to /read.
 *
 * Either way: short-lived UI surface. Show a "signing you in…" line
 * while the storeNativeToken promise resolves (typically <100ms on
 * native, instant on web), then redirect.
 *
 * On the error path (URL carries `error=<code>` instead of `token=`),
 * surface the code and a "Try again" link back to /sign-in. The error
 * codes the WP-side currently emits: `mint_failed` (JWT_AUTH_SECRET_KEY
 * misconfigured, JSON encode failed), `missing_token` (synthetic — the
 * deep-link parser hit the route with neither token nor error param).
 *
 * Voice: same marketing-surface register as SignIn.tsx (S118 lock) —
 * conventional English, plain prose, no restored sacred names on the
 * surface itself. The route is a 1-2 second flash for most partners;
 * the error fallback is the only surface they read at all.
 */

import { useEffect, useState } from "react";
import {
  parseAuthCallbackDeepLink,
  storeNativeToken,
  type AuthCallbackResult,
} from "../lib/native-auth";

type Phase =
  | { kind: "resolving" }
  | { kind: "success" }
  | { kind: "error"; code: string };

function readCurrentUrl(): string | null {
  if (typeof window === "undefined") return null;
  return window.location.href;
}

export default function AuthCallback() {
  const [phase, setPhase] = useState<Phase>({ kind: "resolving" });

  useEffect(() => {
    const url = readCurrentUrl();
    if (!url) {
      setPhase({ kind: "error", code: "no_url" });
      return;
    }

    // parseAuthCallbackDeepLink expects a full URL and validates the
    // host + path internally — we pass the location.href as-is.
    const parsed: AuthCallbackResult | null = parseAuthCallbackDeepLink(url);

    if (parsed === null) {
      // URL didn't match /auth-callback on the expected host —
      // shouldn't be reachable because this route only mounts on that
      // pathname, but defensive.
      setPhase({ kind: "error", code: "bad_callback_url" });
      return;
    }

    if (parsed.kind === "error") {
      setPhase({ kind: "error", code: parsed.code });
      return;
    }

    // Success path: persist the token and navigate forward.
    void storeNativeToken(parsed.token)
      .then(() => {
        setPhase({ kind: "success" });
        // Drop the token from the URL bar before navigating, in case
        // anything (Capacitor history, browser back stack) holds onto
        // location.href. window.history.replaceState swaps the URL
        // without firing popstate; then window.location.assign forces
        // a full navigation so mount effects fire fresh with the new
        // auth header in place.
        // S228 — land the signed-in partner on /today (the home hub),
        // not /read. The hub is the post-auth front door; its mount
        // computes the day locally, and the Reader is one tap away.
        if (typeof window !== "undefined") {
          window.history.replaceState({}, "", "/today");
          window.location.assign("/today");
        }
      })
      .catch(() => {
        setPhase({ kind: "error", code: "store_failed" });
      });
  }, []);

  return (
    <div className="mx-auto max-w-xl px-6 py-12">
      {phase.kind === "resolving" && (
        <div className="text-center">
          <h1 className="text-xl font-semibold text-[var(--reader-text)]">
            Signing you in…
          </h1>
          <p className="mt-3 text-base text-[var(--reader-muted)]">
            Hold on — finalizing your session.
          </p>
        </div>
      )}
      {phase.kind === "success" && (
        <div className="text-center">
          <h1 className="text-xl font-semibold text-[var(--reader-text)]">
            Signed in
          </h1>
          <p className="mt-3 text-base text-[var(--reader-muted)]">
            Taking you home…
          </p>
        </div>
      )}
      {phase.kind === "error" && (
        <div className="rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-6">
          <h1 className="text-xl font-semibold text-[var(--reader-text)]">
            Sign-in didn't complete
          </h1>
          <p className="mt-3 text-base text-[var(--reader-muted)]">
            We weren't able to finish signing you in
            {phase.code ? ` (${phase.code})` : ""}. Try once more — if
            it still doesn't work, sign in to the website at{" "}
            <strong>remnantofpromise.org</strong> in your phone's
            browser and confirm the account works there first.
          </p>
          <div className="mt-5 flex gap-3">
            <a
              href="/sign-in"
              className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
            >
              Try again
            </a>
            <a
              href="/read"
              className="inline-flex items-center justify-center rounded border border-[var(--reader-rule)] px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:bg-[var(--reader-surface)]"
            >
              Continue without signing in
            </a>
          </div>
        </div>
      )}
    </div>
  );
}
