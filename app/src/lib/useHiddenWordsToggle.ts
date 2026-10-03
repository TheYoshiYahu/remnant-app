/**
 * S431 — Hidden Words reader toggle.
 *
 * When ON (the default), every KJV English word that stands for 2+ Hebrew/
 * Greek originals is colored in one of three violet tones with a small
 * superscript count; tapping the count opens the Hidden Words table. When
 * OFF, the verse text reads plain (no color, no count). Restored names are
 * never marked regardless of this toggle.
 *
 * Mirrors `useStrongsSuperscriptsToggle` (S160) exactly, with two differences
 * Yoshi set at S431: the default is ON (not off), and the key is
 * `rop_hidden_words_v1` (the `rop_X_v1` convention, same as
 * `rop_witness_v1` / `rop_kingdom_v1`). Free tier — no entitlement gate; the
 * Strong's data it rides on is already free.
 *
 * SSR-safe; falls back to in-memory state if localStorage is unavailable.
 */
import { useEffect, useState } from "react";

const STORAGE_KEY = "rop_hidden_words_v1";

// Default ON: absence of a stored value means ON. Only an explicit "false"
// turns it off (so first-run partners get the feature per S431).
function readStoredPreference(): boolean {
  if (typeof window === "undefined") return true;
  try {
    return window.localStorage.getItem(STORAGE_KEY) !== "false";
  } catch {
    return true;
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

export interface HiddenWordsToggle {
  show: boolean;
  toggle: () => void;
  set: (next: boolean) => void;
}

export function useHiddenWordsToggle(): HiddenWordsToggle {
  const [show, setShowState] = useState<boolean>(readStoredPreference);

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
