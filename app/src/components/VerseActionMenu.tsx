/**
 * VerseActionMenu — Session 121, Wheel 3 architecture; S122 stub catalog.
 *
 * Contextual action menu opened on long-press or right-click. Replaces
 * the S113 direct "long-press → HighlightPicker" with a menu that
 * scales as Wheels 5-13 add more tools (Notes, Bookmarks, Share-verse,
 * Interlinear, Recommendations, etc.).
 *
 * Two scopes:
 *
 *   - WORD scope. Long-pressed on a Strong's-tappable word. Menu
 *     shows word-scoped actions at the top (Strong's lookup + the
 *     full word-study stub catalog), a divider, then verse-scoped
 *     actions (Highlight, Bookmark stub, Notes stubs, Copy, etc.).
 *
 *   - VERSE scope. Long-pressed on plain text between words (or on a
 *     word without a Strong's tag). Menu shows verse-scoped actions
 *     only (Word study section drops entirely).
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
 *
 * S122 — Disabled-state stubs and tier-locked surfaces.
 * Per DESIGN_LANGUAGE.md §20, every future-wheel item renders as a
 * dimmed stub today so partners see the full tool catalog up front.
 * Three render states:
 *
 *   - LIVE — full opacity, item-specific hint, invokes onSelect.
 *   - TIER-LOCKED — 40% opacity, tier-name chip badge ("Notes" /
 *     "Library"), invokes onSelect (parent has wired this to route
 *     to /pricing). Cursor: pointer.
 *   - COMING-SOON — 40% opacity, "Coming soon" italic hint, no-op
 *     tap (just closes the menu). Cursor: not-allowed.
 *
 * The parent (App.tsx's buildMenuSections) computes state per partner
 * tier BEFORE passing items in: a partner already at or above the
 * required tier sees a tier-locked stub as Coming soon instead, so
 * /pricing routes only fire for partners who genuinely need to
 * upgrade to use the eventual feature.
 */

import { useEffect } from "react";

export interface MenuItem {
  key: string;
  label: string;
  /** Glyph or short prefix — optional. */
  icon?: string;
  /** Short trailing copy (e.g., book ref, Strong's number). Item-specific; only
   * rendered when state is "live". For tier-locked + coming-soon items the
   * right-side hint is computed from lockedTier / comingSoon below. */
  hint?: string;
  onSelect: () => void;
  /** Catchall no-op flag. Lockable/coming-soon are the named S122 states; this
   * stays available for any future use that doesn't fit either. */
  disabled?: boolean;
  /**
   * S122 — when set, item is tier-locked. Renders dimmed + tier-name chip
   * badge ("Study Notes" or "Library"); tap invokes onSelect (parent has wired
   * this to route to /pricing). The parent already filtered: a partner
   * at-or-above the required tier sees this item as comingSoon instead.
   */
  lockedTier?: "notes" | "library";
  /**
   * S122 — when true, item is not-yet-shipped. Renders dimmed + "Coming
   * soon" italic hint; tap is no-op (just closes the menu).
   */
  comingSoon?: boolean;
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

/** Tier-name chip badge for tier-locked stubs. Display names per S140
 *  tier-name overhaul (Study Notes / Library). The local `tier` prop
 *  key stays short ("notes" / "library") since it's a local categorical;
 *  the rendered label uses the official tier display name. */
function TierBadge({ tier }: { tier: "notes" | "library" }) {
  const label = tier === "notes" ? "Study Notes" : "Library";
  return (
    <span
      className="rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-1.5 py-0.5 font-sans text-[11px] font-medium text-[var(--reader-muted)]"
      aria-label={`${label} tier feature`}
    >
      {label}
    </span>
  );
}

/** "Coming soon" italic hint for not-yet-shipped stubs. */
function ComingSoonHint() {
  return (
    <span
      className="font-sans text-[11px] italic text-[var(--reader-muted)]"
      aria-label="Coming soon"
    >
      Coming soon
    </span>
  );
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
        className="flex max-h-[85vh] w-full max-w-2xl flex-col rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl"
        onClick={(e) => e.stopPropagation()}
        role="menu"
        aria-label="Verse actions"
      >
        <div className="px-5 pb-2 pt-4">
          <h3 className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            {scopeLabel}
          </h3>
        </div>
        <div className="flex-1 overflow-y-auto px-3 pb-3">
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
                {section.items.map((item) => {
                  // S122 — resolve render state. Coming-soon and disabled
                  // are no-op (no /pricing route, no onSelect call).
                  // Tier-locked + Live both call onSelect; parent has
                  // wired tier-locked to navigate to /pricing.
                  const isComingSoon = !!item.comingSoon;
                  const isTierLocked = !!item.lockedTier && !isComingSoon;
                  const isInert = isComingSoon || !!item.disabled;
                  const dimmed = isComingSoon || isTierLocked || !!item.disabled;

                  const handleClick = () => {
                    if (isInert) {
                      // Coming-soon and disabled: close menu, no further action.
                      onClose();
                      return;
                    }
                    // Live or tier-locked: invoke onSelect (which routes to
                    // /pricing for tier-locked items per buildMenuSections).
                    item.onSelect();
                    onClose();
                  };

                  return (
                    <li key={item.key} role="none">
                      <button
                        type="button"
                        role="menuitem"
                        aria-disabled={isInert ? "true" : undefined}
                        onClick={handleClick}
                        className={`flex w-full items-center justify-between gap-3 rounded px-3 py-2.5 text-left font-sans text-base text-[var(--reader-text)] hover:bg-[var(--reader-bg)] ${
                          dimmed ? "opacity-40" : ""
                        } ${isInert ? "cursor-not-allowed" : "cursor-pointer"}`}
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
                        {isTierLocked && item.lockedTier ? (
                          <TierBadge tier={item.lockedTier} />
                        ) : isComingSoon ? (
                          <ComingSoonHint />
                        ) : item.hint ? (
                          <span className="font-sans text-xs text-[var(--reader-muted)]">
                            {item.hint}
                          </span>
                        ) : null}
                      </button>
                    </li>
                  );
                })}
              </ul>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
