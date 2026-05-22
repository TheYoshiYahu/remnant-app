/**
 * S115 Wheel 3 — Theme management.
 *
 * The PWA ships dark-default per DESIGN_LANGUAGE.md §1 (black bg + white
 * serif body = the signature aesthetic, brand-defining, not equally
 * weighted with the alternate). Parchment / sepia light mode is the
 * opt-in off-ramp, activated by setting data-theme="light" on
 * <html>. The CSS variable sets live in index.css; this module owns the
 * read-and-flip logic + the localStorage persistence.
 *
 * A boot script in index.html applies the stored preference
 * synchronously before paint so the partner never sees a flash of the
 * wrong theme. This hook keeps React in sync after mount and exposes
 * a toggle for the chrome button.
 *
 * The persistence pattern mirrors the hide-commentary toggle in
 * ChapterCommentary.tsx — same localStorage key shape, same
 * SSR-safe `typeof window` guards.
 */

import { useEffect, useState } from "react";

export type Theme = "dark" | "light";

const STORAGE_KEY = "reader-theme";

function readTheme(): Theme {
  if (typeof document === "undefined") return "dark";
  return document.documentElement.dataset.theme === "light" ? "light" : "dark";
}

function applyTheme(theme: Theme): void {
  if (typeof document === "undefined") return;
  if (theme === "light") {
    document.documentElement.setAttribute("data-theme", "light");
  } else {
    document.documentElement.removeAttribute("data-theme");
  }
}

function persistTheme(theme: Theme): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, theme);
  } catch {
    /* localStorage unavailable — preference will not persist this session */
  }
}

export function useTheme(): {
  theme: Theme;
  toggle: () => void;
  set: (next: Theme) => void;
} {
  const [theme, setThemeState] = useState<Theme>(readTheme);

  // Reconcile with the document attribute after mount, in case the
  // boot script set "light" but React's initial render assumed "dark"
  // (or vice versa). Cheap idempotent.
  useEffect(() => {
    setThemeState(readTheme());
  }, []);

  const set = (next: Theme) => {
    applyTheme(next);
    persistTheme(next);
    setThemeState(next);
  };

  const toggle = () => {
    set(theme === "dark" ? "light" : "dark");
  };

  return { theme, toggle, set };
}
