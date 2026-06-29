/**
 * SigninReminderModal — the SOFT, recurring, dismissible sign-in nudge.
 *
 * compliance/account-gate build (SOFT version). Shows on every app open while
 * the partner is signed OUT, encouraging (never forcing) them to sign in or
 * create a free account. Anonymous users keep full reader access — this is a
 * dismissible sheet with a prominent "Maybe later," not a wall.
 *
 * Why this exists / relationship to the old once-ever ask: the S174
 * SacredNameWelcomeModal step-2 sign-in ask fired exactly once per device
 * (lib/signinAsk.ts flag) and never repeated. This component is the recurring
 * replacement — cadence lives in lib/signin-reminder.ts (one tunable constant).
 *
 * Visibility rules (all must hold to show):
 *   - not on the auth surfaces themselves (/sign-in, /auth-callback)
 *   - the welcome modal isn't currently up (one ask at a time)
 *   - the partner is signed OUT (hasJwtCookie(), after the native token load)
 *   - the cadence allows it (shouldShowSigninReminder(): once per launch by default)
 *
 * Self-contained: it owns its async auth check and its own open state, so App
 * can mount it unconditionally next to the welcome modal.
 */

import { useEffect, useState } from "react";
import { hasJwtCookie } from "../lib/display-prefs-sync";
import { loadStoredNativeToken } from "../lib/native-auth";
import {
  shouldShowSigninReminder,
  markSigninReminderShown,
} from "../lib/signin-reminder";

function isAuthSurface(pathname: string): boolean {
  return (
    pathname === "/sign-in" ||
    pathname.startsWith("/sign-in") ||
    pathname === "/auth-callback" ||
    pathname.startsWith("/auth-callback")
  );
}

export default function SigninReminderModal({
  pathname,
  welcomeOpen,
}: {
  pathname: string;
  welcomeOpen: boolean;
}) {
  const [open, setOpen] = useState(false);

  useEffect(() => {
    // Don't compete with the first-run welcome modal, and don't nag on the
    // auth screens themselves.
    if (welcomeOpen || isAuthSurface(pathname)) return;

    let cancelled = false;
    // Resolve the session signal first. On native the token lives in
    // Capacitor Preferences (async); on web this is an immediate no-op and
    // hasJwtCookie() reads the cookie synchronously.
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      if (hasJwtCookie()) return; // signed in → never show
      if (!shouldShowSigninReminder()) return; // cadence says not now
      markSigninReminderShown();
      setOpen(true);
    });
    return () => {
      cancelled = true;
    };
    // Evaluate once per mount; mount happens per launch / full navigation.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  if (!open) return null;

  const goSignIn = () => {
    if (typeof window !== "undefined") window.location.assign("/sign-in");
  };
  const goCreate = () => {
    // The /sign-in screen surfaces both Log In and Create Account; intent hint
    // lets it foreground the create path.
    if (typeof window !== "undefined")
      window.location.assign("/sign-in?intent=create");
  };

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="signinReminderTitle"
      className="fixed inset-0 z-[70] flex items-end justify-center bg-black/50 p-0 sm:items-center sm:p-4"
    >
      <div className="w-full max-w-md rounded-t-2xl border border-[var(--reader-rule)] bg-[var(--reader-bg)] p-6 shadow-xl sm:rounded-2xl">
        <h2
          id="signinReminderTitle"
          className="text-xl font-semibold tracking-tight text-[var(--reader-text)]"
        >
          Keep your place — for free
        </h2>

        {/* Warm, benefit-first disclaimer (kept from the gate copy). */}
        <p className="mt-3 text-base leading-relaxed text-[var(--reader-text)]">
          A free account saves your work — your notes, highlights, bookmarks, and
          the place you left off — and carries it with you across your phone,
          tablet, and the web. Sign in on any device and everything is right
          where you left it. Reading stays free either way.
        </p>

        <div className="mt-6 flex flex-col gap-3">
          <button
            type="button"
            onClick={goCreate}
            className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2.5 text-base font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Create free account
          </button>
          <button
            type="button"
            onClick={goSignIn}
            className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-transparent px-4 py-2.5 text-base font-medium text-[var(--reader-text)] hover:opacity-90"
          >
            Sign in
          </button>
          <button
            type="button"
            onClick={() => setOpen(false)}
            className="mt-1 inline-flex items-center justify-center px-4 py-2 text-sm text-[var(--reader-muted)] hover:underline"
          >
            Maybe later
          </button>
        </div>
      </div>
    </div>
  );
}
