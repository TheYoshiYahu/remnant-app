/**
 * S144 — Reader-surface toggle for hiding the English-form parentheticals
 * after restored Sacred Names. Pairs with `lib/stripParentheticals.ts`
 * (the strip-list and pure utility function).
 *
 * Storage and pattern: mirror the `useTheme` hook in `lib/theme.ts` and
 * the `hideCommentary` localStorage pattern in `App.tsx`. The
 * preference key is `rop_hide_parentheticals_v1` (suffix `_v1` follows
 * the conventions established by S112's `rop_hide_commentary_v1`).
 *
 * Default OFF — `hide=false` on first load. This preserves the voice
 * skill's "Why the Parenthetical Is Non-Negotiable" section: a Christian
 * reader arriving at the app sees `Yahuah (LORD)` and `Yashar'el
 * (Israel)` with the retention parentheticals intact, and bounces off
 * neither name. The reader who has internalized the restored names
 * opts INTO the strip via this toggle, removing the now-redundant
 * parentheticals from every reading surface.
 *
 * SSR-safe: every `window`/`document`/`localStorage` access is guarded
 * by `typeof window !== "undefined"`.
 *
 * Failure-mode: if `localStorage` is unavailable (private window,
 * Safari Lockdown, partner has disabled site data), reads and writes
 * silently fall back to in-memory state for the current session. The
 * toggle still works for the session; the preference just doesn't
 * survive a reload. This matches the `useTheme` and `hideCommentary`
 * conventions.
 */

import { useEffect, useState } from "react";
import {
  applyParentheticalsToggle,
  stripParentheticals,
} from "./stripParentheticals";

const STORAGE_KEY = "rop_hide_parentheticals_v1";

function readStoredPreference(): boolean {
  if (typeof window === "undefined") return false;
  try {
    return window.localStorage.getItem(STORAGE_KEY) === "true";
  } catch {
    return false;
  }
}

function persistPreference(hide: boolean): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, String(hide));
  } catch {
    /* localStorage unavailable — preference will not persist this session */
  }
}

export interface ParentheticalsToggle {
  /** Current state: `true` when the user has chosen to hide the
   *  parentheticals; `false` when they remain visible. Default `false`. */
  hide: boolean;
  /** Flip the state and persist it. */
  toggle: () => void;
  /** Explicit set. */
  set: (next: boolean) => void;
  /**
   * Convenience: apply the strip to a text string based on the
   * current toggle state. Returns the original text untouched when
   * `hide=false`. Use this at each render site so callers write
   *   `const text = applyToText(rawText);`
   * instead of importing `stripParentheticals` and the toggle state
   * separately.
   */
  applyToText: (text: string) => string;
}

export function useParentheticalsToggle(): ParentheticalsToggle {
  // Initialize from localStorage synchronously so the first render
  // already reflects the persisted preference (no flash of-the-wrong-
  // mode). The boot script in index.html could hoist this to a
  // pre-paint attribute later, mirroring the theme pattern, if a flash
  // turns out to be visible — for now, React's initial state read
  // matches the persisted value before paint in the common case.
  const [hide, setHideState] = useState<boolean>(readStoredPreference);

  // Reconcile after mount in case server-rendered initial state and
  // client state diverge (SSR safety; the app is currently CSR-only so
  // this is a guardrail not a load-bearing reconciler).
  useEffect(() => {
    setHideState(readStoredPreference());
  }, []);

  const set = (next: boolean): void => {
    persistPreference(next);
    setHideState(next);
  };

  const toggle = (): void => {
    set(!hide);
  };

  const applyToText = (text: string): string =>
    applyParentheticalsToggle(text, hide);

  return { hide, toggle, set, applyToText };
}

// Re-export the pure helpers for callers that want to apply the strip
// without subscribing to the React state (e.g., in non-component code).
export { stripParentheticals, applyParentheticalsToggle };
