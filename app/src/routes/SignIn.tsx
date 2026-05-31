/**
 * Session 126 — SignIn intermediate landing page.
 *
 * The anonymous-checkout funnel was bouncing partners straight from
 * /pricing to WordPress's /goshen/ login page, which has no visible
 * "Create Account" affordance. First-time visitors hit a dead end —
 * sign in or bail.
 *
 * This is a small PWA-side intermediate landing page that surfaces
 * BOTH paths up front: Log In for partners who already have a
 * WordPress account, Create Account for partners who don't.
 *
 * Honors a ?return_to= query param so the partner bounces back to
 * wherever they came from (typically /pricing, after they completed
 * auth). The query value is encoded into the WordPress redirect_to=
 * convention on both buttons.
 *
 * NOT the full S118 /account combined surface. That stays queued for
 * a later wheel — when WP email deliverability is fixed (current ~1hr
 * verification delay would kill the create-account UX), the full
 * combined Log-In / Create-Account form lives at /account in
 * WordPress. This page can either retire then OR stay as a
 * friendlier intro that links to the combined surface. That's a
 * future-wheel call.
 *
 * Voice: marketing-surface register per the S118 lock — conventional
 * English (no restored sacred names on the surface itself), inherits
 * the PWA's Lora body register and bordered-chrome button family
 * per §1.
 *
 * No tests this wheel — pure UI route + redirect; no non-trivial
 * pure logic surfaces. The route registers in App.tsx alongside
 * /pricing and /manage.
 */

import { useState } from "react";

const WP_LOGIN_URL = "https://remnantofpromise.org/goshen/";
const WP_REGISTER_URL = "https://remnantofpromise.org/goshen/?action=register";
const DEFAULT_RETURN_TO = "/pricing";

/**
 * S176 — The WordPress endpoint added in rop-sso-bridge v1.1.0. Hit
 * via @capacitor/browser's Browser.open() from the native shell's
 * SignIn route. The endpoint either (a) bounces through wp-login.php
 * if the partner isn't authenticated, then mints + redirects back to
 * /auth-callback?token=<JWT>; or (b) mints the JWT immediately for
 * an already-logged-in partner and redirects in one hop. The Android
 * AndroidManifest intent-filter for /auth-callback (autoVerify)
 * catches the redirect URL and launches the native app with it.
 */
const WP_NATIVE_AUTH_CALLBACK_URL =
  "https://remnantofpromise.org/wp-json/rop/v1/native-auth-callback";

/**
 * The WP register flow doesn't yet have a redirect-to-native equivalent.
 * For S176, native Create-Account taps open the WP register form in the
 * system browser; after the partner completes registration WP returns
 * them to the redirect_to= URL — same /wp-json/rop/v1/native-auth-callback
 * endpoint — and the flow continues as if they'd signed in.
 */
function buildNativeRegisterUrl(): string {
  const url = new URL(WP_REGISTER_URL);
  url.searchParams.set("redirect_to", WP_NATIVE_AUTH_CALLBACK_URL);
  return url.toString();
}

function parseReturnTo(): string {
  if (typeof window === "undefined") return DEFAULT_RETURN_TO;
  const params = new URLSearchParams(window.location.search);
  const raw = params.get("return_to");
  if (!raw) return DEFAULT_RETURN_TO;
  // Defensive: only honor return_to values that look like relative
  // paths or that point at known PWA hosts. Block javascript: / data:
  // / arbitrary external hosts so this can't be weaponized as an
  // open-redirect surface.
  try {
    const url = new URL(raw, window.location.origin);
    const allowedHosts = new Set([
      window.location.hostname,
      "bible.remnantofpromise.org",
      "remnantofpromise.org",
    ]);
    if (!allowedHosts.has(url.hostname)) return DEFAULT_RETURN_TO;
    if (url.protocol !== "https:" && url.protocol !== "http:") {
      return DEFAULT_RETURN_TO;
    }
    return url.toString();
  } catch {
    return DEFAULT_RETURN_TO;
  }
}

function buildWpUrl(base: string, returnTo: string): string {
  // base may already carry query params (e.g., action=register). Use
  // URLSearchParams to compose redirect_to= without breaking them.
  const url = new URL(base);
  url.searchParams.set(
    "redirect_to",
    typeof window === "undefined"
      ? returnTo
      : new URL(returnTo, window.location.origin).toString(),
  );
  return url.toString();
}

/**
 * Detect the native Capacitor shell. S176 — the native branch now
 * surfaces a real Sign In affordance (Browser.open into the WP
 * /wp-json/rop/v1/native-auth-callback endpoint; the response
 * eventually round-trips through the Android App Link intent-filter
 * on /auth-callback, persisting the JWT via Capacitor Preferences).
 * Replaces the S175 "anonymous-only native app" message.
 */
function isNativePlatform(): boolean {
  if (typeof window === "undefined") return false;
  const cap = (window as unknown as {
    Capacitor?: { isNativePlatform?: () => boolean };
  }).Capacitor;
  return cap?.isNativePlatform?.() === true;
}

/**
 * S176 — Open the WP native-auth-callback URL in the system browser
 * via @capacitor/browser. The Browser.open promise resolves as soon
 * as the system browser launches (not when the partner finishes
 * signing in) — the rest of the flow happens out-of-band: WP mints
 * the JWT, redirects to bible.remnantofpromise.org/auth-callback, and
 * Android's App Link autoVerify intent-filter intercepts the URL and
 * hands it to the native app via @capacitor/app's appUrlOpen event.
 * The deep-link router (lib/deep-link.ts) parses the URL, stores the
 * token via storeNativeToken, and dispatches the rop:auth-callback
 * event. The /auth-callback route renders the "signing you in..."
 * surface during the brief window the URL loads in the system
 * browser before the App Link handoff fires.
 *
 * If @capacitor/browser is unavailable for any reason (plugin not
 * installed, runtime error), fall back to window.location.assign so
 * the partner still has a working sign-in path — albeit one that
 * navigates the in-app webview instead of using the system browser.
 */
async function openWpNativeAuth(url: string): Promise<void> {
  try {
    const { Browser } = await import("@capacitor/browser");
    await Browser.open({ url });
  } catch {
    if (typeof window !== "undefined") {
      window.location.assign(url);
    }
  }
}

/**
 * S176 — Native-shell SignIn UI. Replaces the S175 "anonymous-only
 * native app" message with real Log-In / Create-Account buttons that
 * open the WordPress flow in the system browser via
 * @capacitor/browser. After the partner authenticates, WP's
 * /wp-json/rop/v1/native-auth-callback redirects to
 * bible.remnantofpromise.org/auth-callback?token=<JWT>, the Android
 * App Link intent-filter intercepts the URL and hands the token to
 * the native app, the deep-link router stores it via Capacitor
 * Preferences, and the app surfaces the partner's signed-in state.
 *
 * `awaitingCallback` is an interim UX flag: between Browser.open
 * resolving and the App Link firing (typically a few seconds — partner
 * logs in, WP processes the redirect, OS hands off), the SignIn page
 * shows a "Finishing sign-in…" surface so the partner doesn't see a
 * stale "Log in" page sitting underneath the Custom Tab. If the App
 * Link never fires (partner cancels, redirect fails), the surface
 * stays on this branch and the partner can tap Cancel to return to
 * the reader anonymously.
 */
function NativeSignInBranch() {
  const [awaitingCallback, setAwaitingCallback] = useState(false);

  function onLogIn() {
    setAwaitingCallback(true);
    void openWpNativeAuth(WP_NATIVE_AUTH_CALLBACK_URL);
  }
  function onCreateAccount() {
    setAwaitingCallback(true);
    void openWpNativeAuth(buildNativeRegisterUrl());
  }
  function onCancel() {
    setAwaitingCallback(false);
  }

  if (awaitingCallback) {
    return (
      <div className="mx-auto max-w-2xl px-6 py-12">
        <h1 className="text-xl font-semibold text-[var(--reader-text)]">
          Finishing sign-in…
        </h1>
        <p className="mt-3 text-base text-[var(--reader-muted)]">
          Complete the sign-in in your browser. We'll bring you back
          here automatically when you're done.
        </p>
        <div className="mt-6 flex gap-3">
          <button
            type="button"
            onClick={onCancel}
            className="inline-flex items-center justify-center rounded border border-[var(--reader-rule)] px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:bg-[var(--reader-surface)]"
          >
            Cancel
          </button>
          <a
            href="/read"
            className="inline-flex items-center justify-center rounded border border-[var(--reader-rule)] px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:bg-[var(--reader-surface)]"
          >
            Continue without signing in
          </a>
        </div>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-2xl px-6 py-8">
      <header className="mb-8 border-b border-[var(--reader-rule)] pb-4">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Sign in to your account
        </h1>
        <p className="mt-2 text-base text-[var(--reader-muted)]">
          Log in with your existing account, or create one. Sign-in
          opens in your phone's browser; you'll come back here once
          it's done.
        </p>
        <nav className="mt-3 text-sm">
          <a href="/read" className="text-[var(--reader-muted)] hover:underline">
            ← continue without signing in
          </a>
        </nav>
      </header>

      <div className="grid grid-cols-1 gap-5 md:grid-cols-2">
        <div className="flex flex-col rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5">
          <h2 className="text-lg font-semibold text-[var(--reader-text)]">
            Log in
          </h2>
          <p className="mt-2 flex-1 text-base text-[var(--reader-muted)]">
            Already have an account? Sign in to load your notes,
            bookmarks, and reading position.
          </p>
          <button
            type="button"
            onClick={onLogIn}
            className="mt-4 inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Log in
          </button>
        </div>

        <div className="flex flex-col rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5">
          <h2 className="text-lg font-semibold text-[var(--reader-text)]">
            Create an account
          </h2>
          <p className="mt-2 flex-1 text-base text-[var(--reader-muted)]">
            New here? Create a free account; you can stay on free or
            pick a partner tier later.
          </p>
          <button
            type="button"
            onClick={onCreateAccount}
            className="mt-4 inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Create account
          </button>
        </div>
      </div>

      <p className="mt-6 text-center text-sm text-[var(--reader-muted)]">
        Your account works across remnantofpromise.org, the web reader,
        and this native app.
      </p>
    </div>
  );
}

export default function SignIn() {
  const native = isNativePlatform();
  const returnTo = parseReturnTo();
  const loginHref = buildWpUrl(WP_LOGIN_URL, returnTo);
  const registerHref = buildWpUrl(WP_REGISTER_URL, returnTo);

  if (native) {
    return <NativeSignInBranch />;
  }

  return (
    <div className="mx-auto max-w-2xl px-6 py-8">
      <header className="mb-8 border-b border-[var(--reader-rule)] pb-4">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Sign in to continue
        </h1>
        <p className="mt-2 text-base text-[var(--reader-muted)]">
          Log in with your existing account, or create one to subscribe.
        </p>
        <nav className="mt-3 text-sm">
          <a
            href="/pricing"
            className="text-[var(--reader-muted)] hover:underline"
          >
            ← back to pricing
          </a>
        </nav>
      </header>

      <div className="grid grid-cols-1 gap-5 md:grid-cols-2">
        {/* Log In card */}
        <div className="flex flex-col rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5">
          <h2 className="text-lg font-semibold text-[var(--reader-text)]">
            Log in
          </h2>
          <p className="mt-2 flex-1 text-base text-[var(--reader-muted)]">
            Already have an account? Sign in to continue to checkout.
          </p>
          <a
            href={loginHref}
            className="mt-4 inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Log in
          </a>
        </div>

        {/* Create Account card */}
        <div className="flex flex-col rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5">
          <h2 className="text-lg font-semibold text-[var(--reader-text)]">
            Create an account
          </h2>
          <p className="mt-2 flex-1 text-base text-[var(--reader-muted)]">
            New here? Create a free account, then come back to pick a tier.
          </p>
          <a
            href={registerHref}
            className="mt-4 inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Create account
          </a>
        </div>
      </div>

      <p className="mt-6 text-center text-sm text-[var(--reader-muted)]">
        Your account works across remnantofpromise.org and the study Bible.
      </p>
    </div>
  );
}
