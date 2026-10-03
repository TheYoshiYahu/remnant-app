/**
 * S229 — collapsed/expanded state for the pinned study-options bar.
 *
 * Yoshi "Option 2": the after-scripture display-toggle pills (English
 * helpers, Strong's, Interlinear, Study Aids, the Prophesied Kingdom
 * Gospel, the Red-Pill Witness, and their quote-style chips) were moved
 * into a slim bar pinned at the TOP of the reading column — always one
 * tap away without scrolling. The bar collapses to a thin labelled
 * handle (chevron ▲/▼) so it never permanently eats screen space.
 *
 * This hook owns only the collapsed flag; the toggles themselves keep
 * their own existing hooks/state untouched. Storage key follows the
 * established `rop_X_v1` convention (cf. `rop_strongs_superscripts_v1`,
 * `rop_hide_parentheticals_v1`).
 *
 * Default EXPANDED (`false`) as of S432 — Yoshi's call: the display
 * options should be visible on arrival so readers discover the toggles
 * (the control reads "Hide" / "Show", not a chevron). A reader who
 * collapses it has that choice remembered; only an explicit stored
 * "true" keeps it collapsed on the next visit.
 *
 * SSR-safe: every `window`/`localStorage` access is guarded by
 * `typeof window !== "undefined"`. If `localStorage` is unavailable,
 * reads and writes silently fall back to in-memory state for the
 * current session.
 */

import { useEffect, useState } from "react";

const STORAGE_KEY = "rop_study_bar_collapsed_v1";

function readStoredPreference(): boolean {
  // S432 — default EXPANDED (collapsed=false): the display options are visible
  // on arrival so a first-time reader sees the toggles. Only an explicit stored
  // "true" keeps the bar collapsed for returning readers who chose that.
  if (typeof window === "undefined") return false;
  try {
    return window.localStorage.getItem(STORAGE_KEY) === "true";
  } catch {
    return false;
  }
}

function persistPreference(collapsed: boolean): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, String(collapsed));
  } catch {
    /* localStorage unavailable — preference will not persist this session */
  }
}

export interface StudyBarCollapsed {
  /** `true` when the bar is collapsed to its thin handle (default). */
  collapsed: boolean;
  /** Flip the state and persist it. */
  toggle: () => void;
  /** Explicit set. */
  set: (next: boolean) => void;
}

export function useStudyBarCollapsed(): StudyBarCollapsed {
  // Initialize from localStorage synchronously so the first render
  // already reflects the persisted preference (no flash of the wrong
  // state). Mirrors the useStrongsSuperscriptsToggle pattern.
  const [collapsed, setCollapsedState] = useState<boolean>(
    readStoredPreference
  );

  // Reconcile after mount in case server-rendered initial state and
  // client state diverge (SSR guardrail; the app is CSR-only today).
  useEffect(() => {
    setCollapsedState(readStoredPreference());
  }, []);

  const set = (next: boolean): void => {
    persistPreference(next);
    setCollapsedState(next);
  };

  const toggle = (): void => {
    set(!collapsed);
  };

  return { collapsed, toggle, set };
}
