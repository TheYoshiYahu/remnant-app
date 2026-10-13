/**
 * signin-reminder.ts — cadence logic for the SOFT, recurring sign-in reminder.
 *
 * compliance/account-gate build (revised to SOFT). Unlike the once-ever S174
 * sign-in ask (lib/signinAsk.ts, shown a single time then suppressed forever),
 * this reminder re-appears on EVERY app open while the partner is signed out —
 * a dismissible nudge, never a wall. Anonymous users keep full reader access.
 *
 * Cadence:
 *   - Default: show once per app-open (per browser/webview SESSION). A
 *     sessionStorage flag prevents it re-firing on SPA route changes within the
 *     same launch, and resets when the app/tab is closed → shows again next
 *     launch. This is the "fires per launch, not nagging within a session"
 *     behavior.
 *   - Tunable: REMINDER_COOLDOWN_HOURS softens it further. 0 = every app-open
 *     (default). Set e.g. 24 to show at most once per 24h even across launches
 *     (uses a localStorage timestamp). One constant — change it here only.
 *
 * Auth is intentionally NOT checked here: on native the session signal
 * (loadStoredNativeToken) is async, so the modal component awaits that and
 * checks hasJwtCookie() itself before calling shouldShowSigninReminder().
 *
 * SSR-safe and storage-failure-safe: if storage is unavailable, we DON'T show
 * (better to under-prompt than to loop a modal every paint in a locked-down tab).
 */

/**
 * How long to wait between reminders, in hours.
 *   0  → show once per app-open (per session). [default]
 *   N  → show at most once per N hours, even across app launches.
 * Yoshi: change this single value to soften the cadence.
 */
export const REMINDER_COOLDOWN_HOURS = 0;

// Per-launch guard (cleared when the tab/app/webview session ends).
const SESSION_FLAG = "rop_signin_reminder_shown_session";
// Cross-launch throttle timestamp (epoch ms), used only when cooldown > 0.
const LAST_SHOWN_KEY = "rop_signin_reminder_last_shown_at";

function safeSessionGet(key: string): string | null {
  try {
    return typeof window !== "undefined" ? window.sessionStorage.getItem(key) : null;
  } catch {
    return null;
  }
}

function safeLocalGet(key: string): string | null {
  try {
    return typeof window !== "undefined" ? window.localStorage.getItem(key) : null;
  } catch {
    return null;
  }
}

/**
 * Should the reminder be shown right now? Call only AFTER confirming the
 * partner is signed OUT. Returns false if already shown this launch, or (when
 * a cooldown is configured) if shown within the cooldown window.
 */
export function shouldShowSigninReminder(): boolean {
  if (typeof window === "undefined") return false; // SSR
  // Already shown this launch → don't re-fire within the session.
  if (safeSessionGet(SESSION_FLAG) === "1") return false;

  if (REMINDER_COOLDOWN_HOURS > 0) {
    const raw = safeLocalGet(LAST_SHOWN_KEY);
    const last = raw ? Number(raw) : 0;
    if (Number.isFinite(last) && last > 0) {
      const elapsedMs = Date.now() - last;
      if (elapsedMs < REMINDER_COOLDOWN_HOURS * 60 * 60 * 1000) return false;
    }
  }
  return true;
}

/** Record that the reminder was shown (this launch, and timestamp for cooldown). */
export function markSigninReminderShown(): void {
  if (typeof window === "undefined") return;
  try {
    window.sessionStorage.setItem(SESSION_FLAG, "1");
  } catch {
    /* sessionStorage unavailable — accepted; may re-show next route change */
  }
  try {
    window.localStorage.setItem(LAST_SHOWN_KEY, String(Date.now()));
  } catch {
    /* localStorage unavailable — cooldown throttle simply won't apply */
  }
}
