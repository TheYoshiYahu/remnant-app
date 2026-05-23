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

/**
 * One named group of menu items rendered together under a section
 * header. Yoshi's S121 categorization call: as Wheels 5-13 add per-
 * verse tools (Notes, Bookmarks, Share, Interlinear, Recommendations),
 * a flat menu becomes an unscannable wall of items. Sections turn it
 * into a scannable two-column-cognitively (header → items) menu while
 * keeping every action one tap away.
 *
 * Locked categories (DESIGN_LANGUAGE.md §20):
 *
 *   - "Word study"     — Strong's, BDB, Thayer's, Vine's, Hebrew/Greek
 *                        interlinear, nikkudot consonantal-form
 *                        siblings (word scope; some tier-gated)
 *   - "Marking"        — Highlight verse, Bookmark
 *   - "Notes"          — Add note, Open notes for this verse
 *   - "Cross-references" — Treasury (TSK), Nave's topical, related-
 *                        passages recommendations
 *   - "Share"          — Share with watermark, Copy verse (incl. ref)
 *
 * Future wheels append items to the appropriate section in App.tsx's
 * `buildMenuSections`; the component itself does not change.
 */
export interface MenuSection {
  title: string;
  items: MenuItem[];
}

interface VerseActionMenuProps {
  sections: MenuSection[];
  /** Short scope label rendered as the modal header. */
  scopeLabel: string;
  onClose: () => void;
}

export default function VerseActionMenu({
  sections,
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

  // Drop empty sections — caller may pass them when a section has no
  // items in the current scope (e.g., Word study is empty in
  // verse-scope when no tappable word was the long-press anchor).
  const visibleSections = sections.filter((s) => s.items.length > 0);

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
        <div className="mb-3 px-2 pt-1">
          <h3 className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            {scopeLabel}
          </h3>
        </div>
        {visibleSections.map((section, sIdx) => (
          <div
            key={section.title}
            className={
              sIdx > 0
                ? "mt-3 border-t border-[var(--reader-rule)] pt-3"
                : ""
            }
          >
            <h4 className="mb-1 px-3 font-sans text-xs font-semibold uppercase tracking-wider text-[var(--reader-accent)]">
              {section.title}
            </h4>
            <ul className="space-y-0.5">
              {section.items.map((item) => (
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
                      <span className="font-sans text-xs text-[var(--reader-muted)]">
                        {item.hint}
                      </span>
                    )}
                  </button>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </div>
  );
}
