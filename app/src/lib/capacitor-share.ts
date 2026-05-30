/**
 * S173 — Capacitor-native share path for the iOS + Android shells.
 *
 * On native (Capacitor.isNativePlatform() === true) the iOS Action
 * Extension share sheet and Android intent picker want a real file URI,
 * not a Blob or data URI. So the native path writes the canvas PNG to
 * the platform CACHE directory via @capacitor/filesystem first, then
 * hands the resulting file URI to @capacitor/share. The cache write is
 * disposable (the OS reaps cache files on pressure) so we don't bother
 * deleting after share.
 *
 * On web (PWA, dev preview) `isNativePlatform()` returns false and the
 * helper returns `{handled: false}` so the caller falls through to the
 * existing navigator.share / clipboard / a-download chain in
 * share-card-render.ts — that chain is the right primary on the web
 * (navigator.share with files is well-supported in modern browsers and
 * already covers the PWA install case).
 *
 * Failure semantics:
 *   - Plugin call rejects (partner cancels, filesystem write fails) →
 *     return `{handled: true, aborted: true}` so executeShare/executeCopy
 *     treat it as a clean exit (no fallback chain — partner already
 *     dismissed the share).
 *   - Capacitor not bootstrapped (the lazy import fails) → return
 *     `{handled: false}` so the web chain runs.
 */

export interface NativeShareResult {
  /** True iff the native share pipeline ran (whether success or
   *  aborted). False means the helper no-op'd and the caller should
   *  run the web chain. */
  handled: boolean;
  /** Only meaningful when `handled === true`. True when the partner
   *  dismissed the share sheet without sharing. */
  aborted?: boolean;
  /** Only meaningful when `handled === true` + `aborted === false`. */
  ok?: boolean;
  /** Diagnostic on failure. */
  error?: string;
}

interface NativeShareInput {
  /** Pre-rendered canvas to share as PNG. */
  canvas: HTMLCanvasElement;
  /** PNG filename written into the cache dir. Becomes the share-sheet
   *  document title on iOS / suggested-filename on Android. */
  filename: string;
  /** Plain-text fallback that appears in the share sheet's text slot
   *  (Messages / Mail body, etc.). Use the §24 textFallback shape so
   *  shares carry the verse text even when the receiving app strips
   *  the file attachment. */
  text: string;
  /** Anchor-permalink URL that travels alongside the file (the §17/§30
   *  watermark URL line). Appears in the share-sheet URL slot so
   *  recipient apps render link previews. */
  url: string;
  /** Optional dialog title (Android only — iOS always uses the system
   *  default activity title). */
  dialogTitle?: string;
}

/**
 * Try to fire the native share sheet via @capacitor/share. Returns
 * `{handled: false}` immediately when running outside a Capacitor
 * shell so the caller falls through to the web pipeline.
 */
export async function tryNativeShare(
  input: NativeShareInput
): Promise<NativeShareResult> {
  // Lazy dynamic import so the Capacitor plugin code doesn't ship in
  // the PWA bundle's critical path. The bundler (Vite) emits a
  // separate chunk that's only fetched when this branch fires.
  let Capacitor;
  let Filesystem;
  let Directory;
  let Encoding;
  let Share;
  try {
    ({ Capacitor } = await import("@capacitor/core"));
    if (!Capacitor.isNativePlatform()) {
      return { handled: false };
    }
    ({ Filesystem, Directory, Encoding } = await import("@capacitor/filesystem"));
    ({ Share } = await import("@capacitor/share"));
  } catch {
    // Capacitor packages not present (PWA build without native shells,
    // or dev environment with incomplete install) — let the web chain
    // take over.
    return { handled: false };
  }

  // canvas → base64 PNG (the data: URL prefix is stripped — Filesystem
  // wants the raw base64 payload when encoding is base64-less).
  const dataUrl = input.canvas.toDataURL("image/png");
  const base64 = dataUrl.replace(/^data:image\/png;base64,/, "");

  let fileUri: string;
  try {
    const written = await Filesystem.writeFile({
      path: input.filename,
      data: base64,
      directory: Directory.Cache,
      // No encoding parameter — Filesystem treats this as raw base64
      // because we passed a base64 string. Passing Encoding.UTF8 would
      // corrupt the PNG bytes.
    });
    fileUri = written.uri;
  } catch (err) {
    return {
      handled: true,
      ok: false,
      error: `filesystem write failed: ${(err as Error)?.message ?? String(err)}`,
    };
  }

  try {
    await Share.share({
      title: input.filename,
      text: input.text,
      url: input.url,
      files: [fileUri],
      dialogTitle: input.dialogTitle ?? "Share",
    });
    return { handled: true, ok: true };
  } catch (err) {
    // Capacitor surfaces partner-cancel as a thrown error with
    // message "Share canceled" (iOS) or similar; treat any throw as
    // aborted rather than fall through to the web chain (the partner
    // already saw the native sheet).
    const message = (err as Error)?.message ?? String(err);
    if (/cancel|aborted|dismiss/i.test(message)) {
      return { handled: true, aborted: true };
    }
    return { handled: true, ok: false, error: message };
  }
}

/**
 * Native-only "text + URL" share — used by the share path when there
 * is no canvas to serialize (e.g., a watermark-URL-only share from a
 * locked thread). Returns `{handled: false}` on web so the caller
 * falls through to the existing navigator.share text/url branch.
 */
export async function tryNativeShareText(input: {
  text: string;
  url: string;
  dialogTitle?: string;
}): Promise<NativeShareResult> {
  let Capacitor;
  let Share;
  try {
    ({ Capacitor } = await import("@capacitor/core"));
    if (!Capacitor.isNativePlatform()) {
      return { handled: false };
    }
    ({ Share } = await import("@capacitor/share"));
  } catch {
    return { handled: false };
  }

  try {
    await Share.share({
      text: input.text,
      url: input.url,
      dialogTitle: input.dialogTitle ?? "Share",
    });
    return { handled: true, ok: true };
  } catch (err) {
    const message = (err as Error)?.message ?? String(err);
    if (/cancel|aborted|dismiss/i.test(message)) {
      return { handled: true, aborted: true };
    }
    return { handled: true, ok: false, error: message };
  }
}
