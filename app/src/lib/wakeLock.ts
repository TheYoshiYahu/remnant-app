/**
 * S446 — keep the screen awake while the audio player is open.
 *
 * When the phone locks, the WebView is suspended: the chapter already
 * playing may finish, but nothing is awake to start the next one, so
 * continuous play silently stopped at the chapter break (reported on the
 * long Jasher chapters). The Screen Wake Lock API is built into Android
 * WebView and iOS 16.4+, so no native plugin is needed. Best-effort:
 * browsers that lack it just behave as before.
 */

let sentinel: WakeLockSentinel | null = null;
let wanted = false;

async function acquire(): Promise<void> {
  if (!wanted || sentinel) return;
  const wl = (navigator as Navigator & { wakeLock?: WakeLock }).wakeLock;
  if (!wl) return;
  try {
    sentinel = await wl.request("screen");
    sentinel.addEventListener("release", () => { sentinel = null; });
  } catch {
    sentinel = null; // low battery, hidden page, or not permitted — fine
  }
}

function onVisible(): void {
  if (document.visibilityState === "visible") void acquire();
}

/** Call when audio playback starts (player opens). */
export function keepScreenAwake(): void {
  if (wanted) return;
  wanted = true;
  document.addEventListener("visibilitychange", onVisible);
  void acquire();
}

/** Call when the player closes. */
export function allowScreenSleep(): void {
  wanted = false;
  document.removeEventListener("visibilitychange", onVisible);
  const s = sentinel;
  sentinel = null;
  if (s) void s.release().catch(() => {});
}
