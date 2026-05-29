/**
 * S168 — §28 Hebrew & Greek interlinear toggle.
 *
 * React hook owning the chapter-chrome-strip + Settings interlinear
 * toggle state per DESIGN_LANGUAGE.md §28 *Toggle architecture*. Default
 * OFF (clean reading surface; partner opts INTO the interlinear layer).
 * Persists to `localStorage` so the preference travels across chapter
 * loads + reloads.
 *
 * Storage key: `rop_interlinear_v1` — follows the `rop_X_v1` convention
 * established by S112 `rop_hide_commentary_v1`, S144 `rop_hide_parentheticals_v1`,
 * S160 `rop_strongs_superscripts_v1`. The §28 spec at line 1528 mentioned
 * `reader-prefs.interlinear` as a draft naming sketch; we use the
 * ship-canonical `rop_X_v1` form since that's what every other reader
 * preference already lives under and the boot script + DevTools recipes
 * already index against the `rop_*_v1` prefix.
 *
 * Tier gate intentionally lives OUTSIDE this hook — the hook just owns
 * the user-preference boolean. The render-site decides whether to:
 *   1. render the §28 toggle button as live (Companion+) or as a
 *      Companion-badge-chipped pill that routes to /pricing (below-tier),
 *   2. actually mount the InterlinearLayer (Companion+ AND show=true).
 * Keeping the hook tier-agnostic means a partner whose subscription
 * lapses doesn't lose their preference — they just don't see the layer
 * until they re-subscribe.
 *
 * SSR-safe: every `window`/`document`/`localStorage` access is guarded
 * by `typeof window !== "undefined"`.
 *
 * Failure-mode: if `localStorage` is unavailable (private window, Safari
 * Lockdown), reads + writes silently fall back to in-memory state for
 * the current session. The toggle still works for the session; the
 * preference just doesn't survive a reload. Matches every other
 * `rop_*_v1` toggle in the app.
 */

import { useEffect, useState } from "react";

const STORAGE_KEY = "rop_interlinear_v1";

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

export interface InterlinearToggle {
  /** Current state: `true` when the user has opted INTO the §28 inter-
   *  linear layer; `false` when the verse text reads clean (default). */
  show: boolean;
  /** Flip the state and persist it. */
  toggle: () => void;
  /** Explicit set. */
  set: (next: boolean) => void;
}

export function useInterlinearToggle(): InterlinearToggle {
  // Initialize from localStorage synchronously so the first render
  // already reflects the persisted preference (no flash of-the-wrong-
  // mode). Mirrors useStrongsSuperscriptsToggle.
  const [show, setShowState] = useState<boolean>(readStoredPreference);

  // Reconcile after mount in case server-rendered initial state and
  // client state diverge (SSR safety guardrail; app is CSR-only as of
  // S168 but the pattern stays consistent across every reader-pref hook).
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

/**
 * S168 — §28 Companion-gate check. Returns true iff the partner's
 * subscription tier is `complete_study` or `everything` (Companion+).
 *
 * Pulled out as a top-level helper rather than a hook because the App-
 * level chrome-strip render is the single consumer; making this a hook
 * would add useless ceremony. Mirrors the `isAtCompanion` inline check
 * at App.tsx:2945-2946 (S164 BDB/LSJ menu-direct path) — keeping a
 * single source of truth here means future Companion-gate sites import
 * one helper instead of duplicating the literal-string comparison.
 */
export function isAtCompanionTier(
  partnerTier: string | null | undefined,
): boolean {
  return partnerTier === "complete_study" || partnerTier === "everything";
}
