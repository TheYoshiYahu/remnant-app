/**
 * external-link.ts — open an external URL the right way per platform.
 *
 * Mirrors lib/giving.ts's routing: on the native Capacitor shell it opens
 * through @capacitor/browser (a real system-browser context, so the reader
 * leaves the app cleanly and can return), and on the web bundle it opens a
 * normal new tab. Used for outbound links to PHYSICAL-GOODS product pages
 * (e.g. a printed book on Amazon), which Apple/Google permit and take no
 * commission on — so unlike the digital-subscription lines (which stay
 * non-clickable per the reader-app compliance posture), these are real
 * clickable external links.
 */

function isNative(): boolean {
  return (
    typeof window !== "undefined" &&
    (window as unknown as {
      Capacitor?: { isNativePlatform?: () => boolean };
    }).Capacitor?.isNativePlatform?.() === true
  );
}

/** Open `url` — system browser on native, new tab on web. */
export async function openExternal(url: string): Promise<void> {
  if (isNative()) {
    try {
      const { Browser } = await import("@capacitor/browser");
      await Browser.open({ url });
      return;
    } catch {
      /* plugin unavailable — fall through to the web path */
    }
  }
  if (typeof window !== "undefined") {
    window.open(url, "_blank", "noopener,noreferrer");
  }
}
