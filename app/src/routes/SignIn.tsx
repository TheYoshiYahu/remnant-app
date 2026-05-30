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

const WP_LOGIN_URL = "https://remnantofpromise.org/goshen/";
const WP_REGISTER_URL = "https://remnantofpromise.org/goshen/?action=register";
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
 * S175 — Detect the native Capacitor shell. Sign-in is web-only for
 * V1 native because the WP cookie auth flow can't bridge from
 * remnantofpromise.org to the localhost-origin Capacitor webview
 * (cookies and JWT don't cross that boundary). The native app
 * renders a "sign in via web" message instead of the WP login
 * buttons; partners who want account features use the PWA at
 * bible.remnantofpromise.org in their phone's browser. Proper
 * native auth (JWT-via-App-Link callback or custom URL scheme)
 * is V1.1+ engineering.
 */
function isNativePlatform(): boolean {
  if (typeof window === "undefined") return false;
  const cap = (window as unknown as {
    Capacitor?: { isNativePlatform?: () => boolean };
  }).Capacitor;
  return cap?.isNativePlatform?.() === true;
}

export default function SignIn() {
  const native = isNativePlatform();
  const returnTo = parseReturnTo();
  const loginHref = buildWpUrl(WP_LOGIN_URL, returnTo);
  const registerHref = buildWpUrl(WP_REGISTER_URL, returnTo);

  if (native) {
    return (
      <div className="mx-auto max-w-2xl px-6 py-8">
        <header className="mb-8 border-b border-[var(--reader-rule)] pb-4">
          <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
            Sign in on the web
          </h1>
          <p className="mt-2 text-base text-[var(--reader-muted)]">
            Account sign-in lives on the web for now. The native Android
            app supports reading anonymously — every chapter, every
            extra book, every reader preference works without an account.
            Notes, bookmarks, highlights, and cross-device sync are
            account-gated and live in the web version.
          </p>
          <nav className="mt-3 text-sm">
            <a href="/" className="text-[var(--reader-muted)] hover:underline">
              ← back to the reader
            </a>
          </nav>
        </header>

        <div className="rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5">
          <h2 className="text-lg font-semibold text-[var(--reader-text)]">
            Sign in via the web
          </h2>
          <p className="mt-2 text-base text-[var(--reader-muted)]">
            Open <strong>bible.remnantofpromise.org</strong> in your phone's
            browser (Chrome, Samsung Internet, Firefox). Sign in there;
            your account, notes, bookmarks, and highlights live with you
            across devices in the web reader. Future Android updates will
            bring account sign-in into the app itself.
          </p>
        </div>
      </div>
    );
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
