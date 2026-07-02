/**
 * Native-shell detection + the plain-text account-management line.
 *
 * DURABILITY FIX (native sign-in doorway): the Capacitor bridge
 * (window.Capacitor) is injected on the INITIAL shell load, but on iOS
 * it is NOT reliably re-present after a full-page <a href> navigation to
 * another route on the remote server.url origin
 * (https://bible.remnantofpromise.org). That made isNativeShell() flip
 * to false on /sign-in, so the in-app NativeSignInBranch never rendered
 * and the web branch showed instead ("tapping Sign in brings up
 * nothing").
 *
 * Fix: the first time we see the live bridge (guaranteed on the initial
 * shell load — that's why the reader chrome's native "Sign in" doorway
 * appears at all), we persist a durable per-origin marker in
 * localStorage. On later full-page loads where the bridge is momentarily
 * absent, we fall back to that marker. A web browser NEVER sees a native
 * bridge (window.Capacitor.isNativePlatform() is never true there) and
 * so NEVER sets the marker; the native WKWebView has its own isolated
 * localStorage sandbox, so the marker cannot leak into mobile Safari or
 * the desktop PWA. Web behavior is therefore unchanged, and the change
 * only ever makes MORE surfaces resolve as native (compliance-safe:
 * pricing/donate stay suppressed, never re-exposed).
 */

const NATIVE_SHELL_FLAG = "rop_native_shell_v1";

/** True only when the live Capacitor bridge reports a native platform. */
function liveBridgeIsNative(): boolean {
  return (
    typeof window !== "undefined" &&
    (window as unknown as {
      Capacitor?: { isNativePlatform?: () => boolean };
    }).Capacitor?.isNativePlatform?.() === true
  );
}

function rememberNativeShell(): void {
  try {
    if (typeof window !== "undefined" && window.localStorage) {
      window.localStorage.setItem(NATIVE_SHELL_FLAG, "1");
    }
  } catch {
    // storage blocked (private mode / policy) — live detection still
    // works on this load; we just can't persist for later navigations.
  }
}

function rememberedNativeShell(): boolean {
  try {
    if (typeof window !== "undefined" && window.localStorage) {
      return window.localStorage.getItem(NATIVE_SHELL_FLAG) === "1";
    }
  } catch {
    // ignore
  }
  return false;
}

/** True when running inside the Capacitor native shell (App Store / Play build). */
export function isNativeShell(): boolean {
  if (liveBridgeIsNative()) {
    // Seen the live bridge — persist so later full-page navigations on
    // this origin (e.g. /sign-in) still resolve as native even if the
    // bridge isn't re-injected on that load.
    rememberNativeShell();
    return true;
  }
  // Bridge not present on THIS load. If we've previously seen it on this
  // origin's storage sandbox, we're still the native shell. Web browsers
  // never set the flag, so they correctly stay non-native.
  return rememberedNativeShell();
}

/** The plain-text account-management line shown in native builds (non-clickable). */
export const NATIVE_MANAGE_LINE =
  "Visit bible.remnantofpromise.org to manage your account";
