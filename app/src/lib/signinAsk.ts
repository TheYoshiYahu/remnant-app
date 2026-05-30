/**
 * S174 — Sign-in ask localStorage gate.
 *
 * The S174 mid-session UX discovery (Yoshi voice-call): the
 * anonymous-state "Sign in" chrome button added at S174 T2 tells the
 * partner HOW to sign in but never WHY. A partner reading the canon
 * anonymously has no surface signal that signing in saves their
 * notes / bookmarks / highlights / reading position across devices,
 * so the chrome entry sits unused.
 *
 * The fix landed at S174 T8: extend the first-launch
 * SacredNameWelcomeModal (S172) to a 2-step flow. Step 1 = sacred-
 * name choice (existing). Step 2 = sign-in / create-account ask with
 * voice-checked copy explaining what sign-in carries. Skippable —
 * "Not now — continue reading" exits cleanly to the anonymous
 * reader. The framework's posture is "text always free; account is
 * the doorway to YOUR work persisting," so the ask sells the
 * persistence value rather than gating the text.
 *
 * This module manages the second localStorage flag the modal needs:
 * `rop_signin_ask_seen_v1`. Set the first time the partner closes
 * step 2 (any path — sign-in, create-account, or continue-anonymous);
 * the modal never re-fires the sign-in ask after that. Independent of
 * the sacred-name preference key, so:
 *
 *   - **New partner (no flags set, not signed in)** — sees step 1
 *     (mask) then step 2 (sign-in ask). Both flags get set as the
 *     partner moves through.
 *   - **Existing anonymous partner with mask set from S172**
 *     (rop_sacred_name_mask_v1 set, rop_signin_ask_seen_v1 NOT set,
 *     no JWT) — sees step 2 only on next visit. One-time catch-up
 *     for the existing-tester population.
 *   - **Signed-in partner (JWT cookie present)** — never sees the
 *     modal regardless of flag state. The mount-time check in
 *     App.tsx short-circuits on hasJwtCookie() so signing in always
 *     suppresses the ask.
 *   - **Partner who already saw + dismissed step 2** — modal never
 *     fires the sign-in ask again on this device. The chrome
 *     anonymous "Sign in" button is the recurring entry for partners
 *     who later change their mind.
 *
 * SSR-safe: every window/localStorage access guarded. Failure-mode:
 * if localStorage is unavailable (private window, Safari Lockdown),
 * the helpers default to "treat as seen" so the modal doesn't
 * re-fire endlessly across page reloads in those edge environments.
 */

const STORAGE_KEY = "rop_signin_ask_seen_v1";

/**
 * Whether the partner has been shown the sign-in ask (step 2 of the
 * S174-extended welcome modal). `false` triggers the modal's step-2
 * surface on next mount; `true` suppresses it forever on this device.
 *
 * Returns `true` defensively in environments where localStorage is
 * unavailable — better to skip the ask than to loop it on every
 * paint in a Lockdown-mode Safari tab.
 */
export function hasSeenSigninAsk(): boolean {
  if (typeof window === "undefined") return true; // SSR — don't fire
  try {
    return window.localStorage.getItem(STORAGE_KEY) === "1";
  } catch {
    return true; // localStorage unavailable — don't fire
  }
}

/**
 * Mark the sign-in ask as seen. Called by the welcome modal when the
 * partner closes step 2 via any path (sign-in, create-account, or
 * continue-anonymous). Idempotent — re-calling is safe.
 */
export function markSigninAskSeen(): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, "1");
  } catch {
    /* localStorage unavailable — ask will re-fire next reload, accepted */
  }
}
