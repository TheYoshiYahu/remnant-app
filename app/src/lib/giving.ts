/**
 * giving.ts — the one place the Tithely giving link lives.
 *
 * `GIVING_URL` is Yoshi's Tithely Giving Link (the public giving-page URL — not
 * the embed snippet, not the kiosk link). A plain link is the most robust choice
 * across surfaces: it opens reliably everywhere and adds no third-party script
 * to the bundle. `openGiving()` routes it the right way per platform — through
 * @capacitor/browser on the native shell (a real system browser context so card
 * autofill and the payment flow behave, and the partner can return to the app),
 * and a normal new tab on the web bundle.
 *
 * To change where "Support this work" points, change this one constant.
 */

export const GIVING_URL =
  "https://give.tithe.ly/?formId=fb610e2e-5341-4ba6-8670-9a46085a4448";

function isNative(): boolean {
  return (
    typeof window !== "undefined" &&
    (window as unknown as {
      Capacitor?: { isNativePlatform?: () => boolean };
    }).Capacitor?.isNativePlatform?.() === true
  );
}

/** Open the giving page — system browser on native, new tab on web. */
export async function openGiving(): Promise<void> {
  if (isNative()) {
    try {
      const { Browser } = await import("@capacitor/browser");
      await Browser.open({ url: GIVING_URL });
      return;
    } catch {
      /* plugin unavailable — fall through to the web path */
    }
  }
  if (typeof window !== "undefined") {
    window.open(GIVING_URL, "_blank", "noopener,noreferrer");
  }
}
