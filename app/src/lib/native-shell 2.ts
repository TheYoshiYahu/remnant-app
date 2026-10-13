/** True when running inside the Capacitor native shell (App Store / Play build). */
export function isNativeShell(): boolean {
  return (
    typeof window !== "undefined" &&
    (window as unknown as {
      Capacitor?: { isNativePlatform?: () => boolean };
    }).Capacitor?.isNativePlatform?.() === true
  );
}

/** The plain-text account-management line shown in native builds (non-clickable). */
export const NATIVE_MANAGE_LINE =
  "Visit bible.remnantofpromise.org to manage your account";
