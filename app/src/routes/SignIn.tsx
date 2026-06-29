/**
 * Session 126 — SignIn intermediate landing page (web).
 * S176 — Native shell got Custom Tab + App Link round-trip.
 * S177 — Native shell switched to in-app credential form. The Custom
 * Tab approach failed in production for the reasons documented in
 * lib/native-auth.ts's S177 header comment (LoginWP overriding
 * redirect_to, Custom Tab cookie-jar separation, unreliable App Link
 * autoVerify handoff across 302 chains). The V1 native sign-in is a
 * straight form: email/username + password → POST jwt-auth → store
 * JWT → navigate to /read. No browser hop, no redirect chain, no
 * deep-link handoff.
 *
 * The web branch (non-native) is unchanged from S126 — still surfaces
 * the Log In / Create Account cards that link to the WordPress
 * /goshen/ flow (web cookies don't have the cross-origin problem the
 * native shell did).
 *
 * Voice: marketing-surface register per the S118 lock — conventional
 * English (no restored sacred names on the surface itself), inherits
 * the PWA's Lora body register and bordered-chrome button family
 * per §1.
 */

import { useState } from "react";
import {
  loginWithCredentials,
  LoginCredentialsError,
} from "../lib/native-auth";

const WP_LOGIN_URL = "https://remnantofpromise.org/goshen/";
// S188 — append source=bible so the RoP Community Gate (wp-content/mu-plugins/
// rop-community-gate.php) stamps the new user as community-hidden by default.
// The user can opt in later via /wp-json/rop/v1/community/opt-in.
const WP_REGISTER_URL =
  "https://remnantofpromise.org/goshen/?action=register&source=bible";
const WP_FORGOT_PASSWORD_URL =
  "https://remnantofpromise.org/goshen/?action=lostpassword";
const DEFAULT_RETURN_TO = "/pricing";

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
 * S177 — Open the WP register / forgot-password form in the system
 * browser. Used only for the rare "I need to create an account" or
 * "I forgot my password" paths; the in-app form handles the common
 * Log In case directly without leaving the app.
 *
 * Falls back to window.location.assign (in-app webview) if
 * @capacitor/browser is unavailable.
 */
async function openSystemBrowser(url: string): Promise<void> {
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
 * compliance/account-gate build — carry the marketing email opt-in through to
 * the WordPress registration form as a query param. Account creation is
 * WP-hosted (/goshen/?action=register), so the in-app checkbox can't write
 * user-meta directly; it appends rop_email_updates_optin=1|0 to the register
 * URL, and the WP registration handler reads it and stores the user-meta. See
 * the deploy checklist for the (required) WP-side change.
 */
function withEmailOptin(url: string, optin: boolean): string {
  try {
    const u = new URL(url);
    u.searchParams.set("rop_email_updates_optin", optin ? "1" : "0");
    return u.toString();
  } catch {
    return url;
  }
}

/**
 * compliance/account-gate build — the warm, benefit-first disclaimer shown on
 * the gate screen. Explains WHY a free account is asked for: it saves the
 * partner's work and carries it across devices, platforms, and the web. Also
 * serves as the App Store justification for requiring an account. Voice:
 * ministry-appropriate, benefit-first, concise; conventional English per the
 * S118 marketing-surface register (no restored sacred names on this surface).
 */
function AccountBenefits() {
  return (
    <div className="mb-6 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3">
      <p className="text-base text-[var(--reader-text)]">
        A free account saves your work — your notes, highlights, bookmarks, and
        the place you left off — and carries it with you across your phone,
        tablet, and the web. Sign in on any device and everything is right where
        you left it. Your account is your place; nothing you mark gets lost.
      </p>
    </div>
  );
}

/**
 * compliance/account-gate build — the non-essential email consent checkbox,
 * shown at the create-account step. Unchecked by default (opt-in). Account and
 * transactional email (trial reminders, security, receipts) is ALWAYS sent and
 * is NOT governed by this checkbox — only marketing/newsletter sends are.
 */
function EmailOptInCheckbox({
  checked,
  onChange,
}: {
  checked: boolean;
  onChange: (v: boolean) => void;
}) {
  return (
    <label className="flex items-start gap-2 text-sm text-[var(--reader-muted)]">
      <input
        type="checkbox"
        checked={checked}
        onChange={(e) => onChange(e.target.checked)}
        className="mt-1"
      />
      <span>
        Send me occasional updates and encouragement from Remnant of Promise.
        <span className="block text-xs">
          Account and security emails are always sent regardless.
        </span>
      </span>
    </label>
  );
}

/**
 * S177 — Native-shell SignIn UI. In-app email/username + password
 * form that exchanges credentials for a JWT via the jwt-auth plugin's
 * /wp-json/jwt-auth/v1/token endpoint. Replaces the S176 Custom Tab
 * round-trip (see lib/native-auth.ts header comment for the
 * architectural decision and the production failure modes that drove
 * the switch).
 *
 * Flow:
 *   1. Partner types email/username + password.
 *   2. onSubmit calls loginWithCredentials() — POSTs to jwt-auth,
 *      stores the returned JWT via storeNativeToken (which seeds the
 *      in-memory cache for the very next API call).
 *   3. On success: window.location.assign('/read') — full nav so the
 *      Reader's mount effects fire with the new Bearer header active.
 *   4. On failure: surface the partner-friendly error message in-form,
 *      leave the form populated so the partner can correct + retry.
 *
 * Create Account + Forgot Password remain browser-hop paths (open the
 * WP form in the system browser). After creating an account or
 * resetting a password, the partner returns to this form to sign in.
 */
function NativeSignInBranch() {
  const [usernameOrEmail, setUsernameOrEmail] = useState("");
  const [password, setPassword] = useState("");
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  // Non-essential email consent (opt-in, unchecked by default). Consumed only
  // by the Create-account path below, carried to WP as a query param.
  const [emailOptin, setEmailOptin] = useState(false);

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    if (submitting) return;
    setError(null);
    setSubmitting(true);
    try {
      await loginWithCredentials(usernameOrEmail, password);
      // Full navigation (not history.push) so the Reader's mount
      // effects fire with the new Bearer header in place — same
      // pattern AuthCallback uses on the web round-trip path.
      if (typeof window !== "undefined") {
        window.location.assign("/read");
      }
    } catch (err) {
      const message =
        err instanceof LoginCredentialsError
          ? err.message
          : "Sign-in didn't complete. Try again.";
      setError(message);
      setSubmitting(false);
    }
  }

  return (
    <div className="mx-auto max-w-md px-6 py-8">
      <header className="mb-6">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Sign in
        </h1>
        <p className="mt-2 text-base text-[var(--reader-muted)]">
          Use your remnantofpromise.org account to load notes,
          bookmarks, and partner-tier content.
        </p>
      </header>

      <AccountBenefits />

      <form onSubmit={onSubmit} className="flex flex-col gap-4">
        <div>
          <label
            htmlFor="ropEmailField"
            className="block text-sm font-medium text-[var(--reader-text)]"
          >
            Username (or email)
          </label>
          <input
            id="ropEmailField"
            type="text"
            autoComplete="username"
            autoCapitalize="none"
            autoCorrect="off"
            spellCheck={false}
            value={usernameOrEmail}
            onChange={(e) => setUsernameOrEmail(e.target.value)}
            disabled={submitting}
            required
            className="mt-1 block w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-3 py-2 text-base text-[var(--reader-text)] focus:border-[var(--reader-text)] focus:outline-none disabled:opacity-60"
          />
        </div>

        <div>
          <label
            htmlFor="ropPasswordField"
            className="block text-sm font-medium text-[var(--reader-text)]"
          >
            Password
          </label>
          <input
            id="ropPasswordField"
            type="password"
            autoComplete="current-password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            disabled={submitting}
            required
            className="mt-1 block w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-3 py-2 text-base text-[var(--reader-text)] focus:border-[var(--reader-text)] focus:outline-none disabled:opacity-60"
          />
        </div>

        {error && (
          <div
            role="alert"
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 text-sm text-[var(--reader-text)]"
          >
            {error}
          </div>
        )}

        <button
          type="submit"
          disabled={
            submitting ||
            usernameOrEmail.length === 0 ||
            password.length === 0
          }
          className="mt-2 inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-base font-medium text-[var(--reader-bg)] hover:opacity-90 disabled:opacity-50"
        >
          {submitting ? "Signing in…" : "Log in"}
        </button>
      </form>

      <div className="mt-6 flex flex-col gap-3 text-sm">
        <button
          type="button"
          onClick={() => void openSystemBrowser(WP_FORGOT_PASSWORD_URL)}
          className="text-left text-[var(--reader-muted)] hover:underline"
        >
          Forgot password?
        </button>
        <div className="rounded border border-[var(--reader-rule)] p-3">
          <EmailOptInCheckbox checked={emailOptin} onChange={setEmailOptin} />
          <button
            type="button"
            onClick={() =>
              void openSystemBrowser(withEmailOptin(WP_REGISTER_URL, emailOptin))
            }
            className="mt-3 text-left font-medium text-[var(--reader-text)] hover:underline"
          >
            Don't have an account? Create one →
          </button>
        </div>
        <a
          href="/read"
          className="text-left text-[var(--reader-muted)] hover:underline"
        >
          ← Continue without signing in
        </a>
      </div>
    </div>
  );
}

export default function SignIn() {
  const native = isNativePlatform();
  const returnTo = parseReturnTo();
  const loginHref = buildWpUrl(WP_LOGIN_URL, returnTo);
  const [emailOptin, setEmailOptin] = useState(false);
  // Carry the opt-in to WordPress as a query param on the register URL.
  const registerHref = withEmailOptin(buildWpUrl(WP_REGISTER_URL, returnTo), emailOptin);

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

      <AccountBenefits />

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
          <div className="mt-3">
            <EmailOptInCheckbox checked={emailOptin} onChange={setEmailOptin} />
          </div>
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
