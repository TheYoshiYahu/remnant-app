/**
 * S172 — React hook for the sacred-name display mask (Yahuah / YHWH).
 *
 * Mirrors the `useParentheticalsToggle` pattern exactly so the two
 * display preferences feel identical in the chrome/Settings surface.
 * Storage key: `rop_sacred_name_mask_v1`, value `"yahuah"` or `"yhwh"`.
 * Default `"yahuah"` on first load — the framework's reading per the
 * voice skill.
 *
 * SSR-safe: every `window`/`document`/`localStorage` access is guarded
 * by `typeof window !== "undefined"`.
 *
 * Failure-mode: if `localStorage` is unavailable (private window,
 * Safari Lockdown, partner has disabled site data), reads and writes
 * silently fall back to in-memory state for the current session. The
 * toggle still works for the session; the preference just doesn't
 * survive a reload. Matches `useTheme` + `useParentheticalsToggle`
 * conventions.
 *
 * First-launch detection: the `hasStoredPreference()` export lets the
 * App.tsx welcome-modal gate know whether to fire (no stored value =
 * first launch = show the modal). After the modal sets a preference,
 * the key exists and the modal stays dismissed for future loads.
 */

import { useEffect, useState } from "react";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "./applySacredNameMask";

const STORAGE_KEY = "rop_sacred_name_mask_v1";
const DEFAULT_MASK: SacredNameMask = "yahuah";

function readStoredPreference(): SacredNameMask {
  if (typeof window === "undefined") return DEFAULT_MASK;
  try {
    const v = window.localStorage.getItem(STORAGE_KEY);
    if (v === "yhwh" || v === "yahuah") return v;
    return DEFAULT_MASK;
  } catch {
    return DEFAULT_MASK;
  }
}

/**
 * Whether the partner has ever set the sacred-name mask preference.
 * `false` on first launch (no stored value); the first-launch modal
 * fires when this returns `false`. Becomes `true` as soon as the
 * partner picks an option in the modal OR flips the Settings toggle.
 */
export function hasStoredSacredNamePreference(): boolean {
  if (typeof window === "undefined") return true; // SSR — don't fire modal
  try {
    const v = window.localStorage.getItem(STORAGE_KEY);
    return v === "yhwh" || v === "yahuah";
  } catch {
    return true; // localStorage unavailable — don't fire modal
  }
}

function persistPreference(mask: SacredNameMask): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, mask);
  } catch {
    /* localStorage unavailable — preference will not persist this session */
  }
}

export interface SacredNameMaskToggle {
  /** Current state: `"yahuah"` or `"yhwh"`. Default `"yahuah"`. */
  mask: SacredNameMask;
  /** Flip between yahuah ↔ yhwh and persist. */
  toggle: () => void;
  /** Explicit set. Used by the first-launch modal and the Settings
   *  segmented control. */
  set: (next: SacredNameMask) => void;
  /**
   * Convenience: apply the mask to a text string based on the
   * current state. Returns the original text untouched when
   * mask is "yahuah". Use this at each render site so callers write
   *   `const text = applyToText(rawText);`
   * instead of importing `applySacredNameMask` and the state
   * separately.
   */
  applyToText: (text: string) => string;
}

export function useSacredNameMask(): SacredNameMaskToggle {
  // Initialize from localStorage synchronously so the first render
  // already reflects the persisted preference (no flash of the wrong
  // mask). The boot script in index.html could hoist this to a
  // pre-paint attribute later, mirroring the theme pattern, if a flash
  // turns out to be visible — for now, React's initial state read
  // matches the persisted value before paint in the common case.
  const [mask, setMaskState] = useState<SacredNameMask>(readStoredPreference);

  // Reconcile after mount in case server-rendered initial state and
  // client state diverge (SSR safety; the app is currently CSR-only so
  // this is a guardrail not a load-bearing reconciler).
  useEffect(() => {
    setMaskState(readStoredPreference());
  }, []);

  const set = (next: SacredNameMask): void => {
    persistPreference(next);
    setMaskState(next);
  };

  const toggle = (): void => {
    set(mask === "yahuah" ? "yhwh" : "yahuah");
  };

  const applyToText = (text: string): string =>
    applySacredNameMask(text, mask);

  return { mask, toggle, set, applyToText };
}

// Re-export the pure helpers for callers that want to apply the mask
// without subscribing to the React state (e.g., share-card render code
// that runs outside the render tree).
export { applySacredNameMask, type SacredNameMask };
