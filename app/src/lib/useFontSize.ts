/**
 * S356 — React hook for the reader font-size preference
 * (small / medium / large / x-large).
 *
 * Mirrors the `useTheme` + `useSacredNameMask` patterns: a localStorage-
 * backed preference that drives a `data-*` attribute on <html>. The
 * attribute (`data-reader-font`) selects a `--reader-font-scale`
 * multiplier in index.css; every reader-prose root (verse text, chapter
 * heading, the pill-card cross-reference apparatus, and the commentary
 * prose that inherits the reader column's base size) multiplies its
 * size by that variable, so all reading text scales together from one
 * lever. `medium` == scale 1.0 == the shipped S116 register, so the
 * default is a visual no-op.
 *
 * No-flash boot: the boot script in index.html applies the stored
 * attribute synchronously before paint (same as the theme boot), so a
 * partner who picked "large" never sees a flash of the default size.
 * This hook keeps React in sync after mount and re-applies on the
 * cross-device sync events.
 *
 * Storage key: `rop_font_size_v1`. Default `"medium"`.
 *
 * SSR-safe: every `window`/`document`/`localStorage` access is guarded.
 * If localStorage is unavailable (private window), reads/writes fall
 * back to in-memory state for the session — the control still works,
 * the choice just doesn't survive a reload.
 *
 * Cross-device: on `set()` the hook fires `pushSnapshot()` (S173
 * display-prefs sync) so the choice fans out to the server when signed
 * in. On the in-tab `rop:display-prefs-changed` event (dispatched after
 * `pullAndReconcile` writes a server-canonical value into localStorage)
 * and on the cross-tab `storage` event, the hook re-reads and re-applies
 * the attribute.
 */

import { useEffect, useState } from "react";
import {
  DISPLAY_PREFS_CHANGED_EVENT,
  pushSnapshot,
} from "./display-prefs-sync";
import type { ReaderFontSizeValue } from "./api";

const STORAGE_KEY = "rop_font_size_v1";
const DEFAULT_SIZE: ReaderFontSizeValue = "medium";

function isFontSize(v: string | null): v is ReaderFontSizeValue {
  return (
    v === "small" || v === "medium" || v === "large" || v === "xlarge"
  );
}

function readStoredFontSize(): ReaderFontSizeValue {
  if (typeof window === "undefined") return DEFAULT_SIZE;
  try {
    const v = window.localStorage.getItem(STORAGE_KEY);
    return isFontSize(v) ? v : DEFAULT_SIZE;
  } catch {
    return DEFAULT_SIZE;
  }
}

/**
 * Apply the size to the document by setting `data-reader-font` on the
 * <html> element. index.css maps each value to a `--reader-font-scale`
 * multiplier; `medium` resolves to 1.0 (no change), but we still set the
 * attribute explicitly so the boot script, the hook, and the DOM all
 * agree on the current state.
 */
export function applyFontSize(size: ReaderFontSizeValue): void {
  if (typeof document === "undefined") return;
  document.documentElement.setAttribute("data-reader-font", size);
}

function persistFontSize(size: ReaderFontSizeValue): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, size);
  } catch {
    /* localStorage unavailable — preference will not persist this session */
  }
}

export interface FontSizeControl {
  /** Current size. Default `"medium"`. */
  fontSize: ReaderFontSizeValue;
  /** Explicit set — used by the Settings segmented control. Persists,
   *  applies to the document, and fans out to the server when signed in. */
  set: (next: ReaderFontSizeValue) => void;
}

export function useFontSize(): FontSizeControl {
  const [fontSize, setFontSizeState] =
    useState<ReaderFontSizeValue>(readStoredFontSize);

  // Reconcile after mount (the boot script may have applied a value the
  // initial render didn't see) and subscribe to the sync events so a
  // server→local reconciliation or a cross-tab change re-applies here.
  useEffect(() => {
    const current = readStoredFontSize();
    setFontSizeState(current);
    applyFontSize(current);
    if (typeof window === "undefined") return;
    const reread = (): void => {
      const next = readStoredFontSize();
      setFontSizeState(next);
      applyFontSize(next);
    };
    const onStorage = (e: StorageEvent): void => {
      if (e.key === null || e.key === STORAGE_KEY) reread();
    };
    window.addEventListener("storage", onStorage);
    window.addEventListener(DISPLAY_PREFS_CHANGED_EVENT, reread);
    return () => {
      window.removeEventListener("storage", onStorage);
      window.removeEventListener(DISPLAY_PREFS_CHANGED_EVENT, reread);
    };
  }, []);

  const set = (next: ReaderFontSizeValue): void => {
    persistFontSize(next);
    applyFontSize(next);
    setFontSizeState(next);
    // S173 — fan the new value out to the server when signed in. Fire-
    // and-forget; the sync helper no-ops for anonymous callers and
    // swallows network errors so the local change always survives.
    void pushSnapshot();
  };

  return { fontSize, set };
}
