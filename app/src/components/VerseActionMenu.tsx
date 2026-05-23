/**
 * VerseActionMenu — Session 121, Wheel 3 architecture.
 *
 * Contextual action menu opened on long-press or right-click. Replaces
 * the S113 direct "long-press → HighlightPicker" with a menu that
 * scales as Wheels 5-13 add more tools (Notes, Bookmarks, Share-verse,
 * Interlinear, Recommendations, etc.).
 *
 * Two scopes:
 *
 *   - WORD scope. Long-pressed on a Strong's-tappable word. Menu
 *     shows word-scoped actions at the top (Strong's lookup), a
 *     divider, then verse-scoped actions (Highlight verse).
 *
 *   - VERSE scope. Long-pressed on plain text between words (or on a
 *     word without a Strong's tag). Menu shows verse-scoped actions
 *     only.
 *
 * The quick-tap fast path on a tappable word goes directly to the
 * Strong's modal — the menu is for the "I want to pick a tool"
 * intent, not the "I want to see the Strong's" intent.
 *
 * Modal layout pattern mirrors HighlightPicker + StrongsLookup so
 * partners learn one modal shape across the app.
 *
 * Architecture: menu items are passed in via the `items` prop so the
 * caller decides which actions are available in the current scope. As
 * future wheels add tools, they append to the items array in App.tsx.
 */

import { useEffect } from "react";

export interface MenuItem {
  key: string;
  label: string;
  /** Glyph or short prefix — optional. */
  icon?: string;
  /** Short trailing copy (e.g., "$1.99 — paid") — optional. */
  hint?: string;
  onSelect: () => void;
  disabled?: boolean;
}

interface VerseActionMenuProps {
  items: MenuItem[];
  /** Short scope label rendered as the modal header. */
  scopeLabel: string;
  onClose: () => void;
}

export default function VerseActionMenu({
  items,
  scopeLabel,
  onClose,
}: VerseActionMenuProps) {
  // Escape-to-close.
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  return (
    <div
      className="fixed inset-0 z-50 flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={onClose}
    >
      <div
        className="w-full max-w-sm rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-3 shadow-xl"
        onClick={(e) => e.stopPropagation()}
        role="menu"
        aria-label="Verse actions"
      >
        <div className="mb-2 px-2 pt-1">
          <h3 className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            {scopeLabel}
          </h3>
        </div>
        <ul className="space-y-1">
          {items.map((item, idx) => {
            // Insert a visual divider before the first verse-scoped
            // item when both word and verse items are present. Caller
            // can also pass an item with key="divider" + label="" to
            // force a divider; here we just render visually.
            const isDivider =
              item.key === "divider" || item.label === "";
            if (isDivider) {
              return (
                <li
                  key={`div-${idx}`}
                  className="my-1 border-t border-[var(--reader-rule)]"
                  role="separator"
                  aria-hidden="true"
                />
              );
            }
            return (
              <li key={item.key} role="none">
                <button
                  type="button"
                  role="menuitem"
                  disabled={item.disabled}
                  onClick={() => {
                    if (!item.disabled) {
                      item.onSelect();
                      onClose();
                    }
                  }}
                  className="flex w-full items-center justify-between gap-3 rounded px-3 py-2.5 text-left font-sans text-base text-[var(--reader-text)] hover:bg-[var(--reader-bg)] disabled:cursor-not-allowed disabled:opacity-40"
                  style={{ minHeight: "2.75rem" }}
                >
                  <span className="flex items-center gap-2">
                    {item.icon && (
                      <span
                        aria-hidden="true"
                        className="text-[var(--reader-accent)]"
                      >
                        {item.icon}
                      </span>
                    )}
                    <span>{item.label}</span>
                  </span>
                  {item.hint && (
                    <span className="text-xs text-[var(--reader-muted)]">
                      {item.hint}
                    </span>
                  )}
                </button>
              </li>
            );
          })}
        </ul>
      </div>
    </div>
  );
}
