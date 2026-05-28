/**
 * S160 — Reader-surface toggle for showing always-visible Strong's
 * H- and G-numbers as superscripts after every word in the verse text.
 * BLB-pattern. Pairs with the existing §20 tap-on-word StrongsLookup
 * modal — when this toggle is OFF (default), partners still tap a word
 * to open the modal; when ON, the Strong's number is also visible
 * inline as a small superscript that itself opens the same modal when
 * tapped.
 *
 * Storage and pattern: mirrors `useParentheticalsToggle` in
 * `lib/useParentheticalsToggle.ts` (the §144 Hide-English-helpers
 * toggle). Preference key is `rop_strongs_superscripts_v1`, matching
 * the `rop_X_v1` convention established by S112's
 * `rop_hide_commentary_v1` and S144's `rop_hide_parentheticals_v1`.
 *
 * Default OFF — `show=false` on first load. The clean reading surface
 * is the default; the awakening partner opts INTO the superscripts when
 * they want the always-visible Hebrew/Greek pointer register. Matches
 * the §27 spec at DESIGN_LANGUAGE.md.
 *
 * Free tier — no entitlement gate. The Strong's data is already free
 * at §20 (tap-on-word opens the StrongsLookup modal regardless of
 * tier); §27's always-visible toggle is a visibility layer over the
 * same data, also free.
 *
 * SSR-safe: every `window`/`document`/`localStorage` access is guarded
 * by `typeof window !== "undefined"`.
 *
 * Failure-mode: if `localStorage` is unavailable, reads and writes
 * silently fall back to in-memory state for the current session.
 */

import { useEffect, useState } from "react";

const STORAGE_KEY = "rop_strongs_superscripts_v1";

function readStoredPreference(): boolean {
  if (typeof window === "undefined") return false;
  try {
    return window.localStorage.getItem(STORAGE_KEY) === "true";
  } catch {
    return false;
  }
}

function persistPreference(show: boolean): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, String(show));
  } catch {
    /* localStorage unavailable — preference will not persist this session */
  }
}

export interface StrongsSuperscriptsToggle {
  /** Current state: `true` when the user has opted INTO the always-
   *  visible Strong's superscripts; `false` when the verse text reads
   *  clean (default). */
  show: boolean;
  /** Flip the state and persist it. */
  toggle: () => void;
  /** Explicit set. */
  set: (next: boolean) => void;
}

export function useStrongsSuperscriptsToggle(): StrongsSuperscriptsToggle {
  // Initialize from localStorage synchronously so the first render
  // already reflects the persisted preference (no flash of-the-wrong-
  // mode). Matches the useParentheticalsToggle pattern.
  const [show, setShowState] = useState<boolean>(readStoredPreference);

  // Reconcile after mount in case server-rendered initial state and
  // client state diverge (SSR safety; the app is currently CSR-only
  // so this is a guardrail not a load-bearing reconciler).
  useEffect(() => {
    setShowState(readStoredPreference());
  }, []);

  const set = (next: boolean): void => {
    persistPreference(next);
    setShowState(next);
  };

  const toggle = (): void => {
    set(!show);
  };

  return { show, toggle, set };
}
