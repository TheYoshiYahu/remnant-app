/**
 * SearchModal — Session 125 wheel, Wheel 6 of the pre-launch sweep.
 *
 * Pop-up search per DESIGN_LANGUAGE.md §23 (locked S125). Three gates
 * settled at wheel-open:
 *
 *   (a) Pop-up modal entry surface (not expanding chrome bar, not a
 *       separate /search page) — reader stays mounted behind.
 *   (b) Results grouped by book, collapsible. Within each group hits
 *       stay in the server's similarity-first order; the client does
 *       NOT re-sort.
 *   (c) Tier-aware snippet — locked-book hits swap the snippet half
 *       for a small "Read this book — {Tier} tier" upgrade card that
 *       routes to /pricing. At V1 ship verses.text rows are all 'free'
 *       so this card is dormant; lights up when the W10 reference
 *       library lands BDB/Thayer's/Vine's at tier_required = 'extras'.
 *       Inline divergence justification per the S124 forward standard.
 *
 * Same modal register as HighlightPicker / BookmarkSheet / NotesPanel /
 * RangeActionPicker / VerseActionMenu / StrongsLookup — bg-black/40
 * backdrop, items-end on mobile (slide-up from bottom), centered on
 * desktop (sm:items-center). max-w-2xl matches NotesPanel since the
 * results region needs room. max-h-85vh + overflow-y-auto handles the
 * common-word search that returns 100+ hits.
 *
 * Search is chrome-scope, not verse-scope — opens from the App.tsx
 * chrome cluster (new Search button + Cmd-K/Ctrl-K shortcut), not from
 * the §20 VerseActionMenu. The catalog at §20 is deliberately
 * untouched by W6.
 */

import { useEffect, useMemo, useRef, useState } from "react";
import {
  searchVerses,
  type PartnerTier,
  type VerseSearchHit,
} from "../lib/api";
import {
  formatHitCount,
  formatTotalSummary,
  groupResultsByBook,
  highlightQueryMatches,
  isResultLocked,
  tierBadgeLabel,
} from "../lib/search-helpers";

const MIN_QUERY_LENGTH = 2;
const DEBOUNCE_MS = 250;

interface SearchModalProps {
  partnerTier: PartnerTier | null;
  /** Invoked when partner taps a Live (non-locked) result row. Parent
   *  handles the W2 navigation handlers' state-reset contract — sets
   *  selectedBookSlug + selectedChapter + currentVerse and closes the
   *  modal. */
  onSelectResult: (hit: VerseSearchHit) => void;
  /** Invoked when the partner taps a tier-locked result's upgrade
   *  card — parent routes to /pricing via window.location.href (same
   *  pattern as §20 stubs) and closes the modal. */
  onUpgradeFromLockedRow: () => void;
  /** Modal close callback (✕ button, tap-outside, Escape). */
  onClose: () => void;
}

export default function SearchModal({
  partnerTier,
  onSelectResult,
  onUpgradeFromLockedRow,
  onClose,
}: SearchModalProps) {
  const [query, setQuery] = useState<string>("");
  const [hits, setHits] = useState<VerseSearchHit[] | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [collapsedBooks, setCollapsedBooks] = useState<Set<string>>(new Set());

  const inputRef = useRef<HTMLInputElement | null>(null);
  const debounceRef = useRef<number | null>(null);
  const abortRef = useRef<AbortController | null>(null);

  // Auto-focus the input on mount.
  useEffect(() => {
    inputRef.current?.focus();
  }, []);

  // Escape-to-close.
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        e.preventDefault();
        onClose();
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  // Debounced search effect — fires DEBOUNCE_MS after the last keystroke
  // when query is at least MIN_QUERY_LENGTH chars. Aborts any in-flight
  // request before issuing the next one so a late-arriving response
  // from a stale query can't overwrite the current results.
  useEffect(() => {
    if (debounceRef.current !== null) {
      window.clearTimeout(debounceRef.current);
      debounceRef.current = null;
    }
    if (query.trim().length < MIN_QUERY_LENGTH) {
      // Cancel anything in-flight + reset to idle state.
      abortRef.current?.abort();
      abortRef.current = null;
      setLoading(false);
      setHits(null);
      setError(null);
      // Each new query re-expands every group (per §23 — collapsed state
      // does NOT persist across new queries).
      setCollapsedBooks(new Set());
      return;
    }
    debounceRef.current = window.setTimeout(() => {
      // Cancel any prior in-flight request.
      abortRef.current?.abort();
      const controller = new AbortController();
      abortRef.current = controller;
      setLoading(true);
      setError(null);
      // Re-expand groups on each new fetch (see comment above).
      setCollapsedBooks(new Set());
      searchVerses(query.trim(), 25, controller.signal)
        .then((res) => {
          if (controller.signal.aborted) return;
          setHits(res.hits);
          setLoading(false);
        })
        .catch((err: unknown) => {
          if (err instanceof DOMException && err.name === "AbortError") {
            // Silent — a newer query already fired.
            return;
          }
          if (controller.signal.aborted) return;
          setError("Search is temporarily unavailable. Try again in a moment.");
          setLoading(false);
        });
    }, DEBOUNCE_MS);
    return () => {
      if (debounceRef.current !== null) {
        window.clearTimeout(debounceRef.current);
        debounceRef.current = null;
      }
    };
  }, [query]);

  // Cleanup any in-flight fetch on unmount.
  useEffect(() => {
    return () => {
      abortRef.current?.abort();
    };
  }, []);

  const groups = useMemo(() => {
    if (!hits) return [];
    return groupResultsByBook(hits);
  }, [hits]);

  const trimmedQuery = query.trim();
  const showResults = hits !== null && trimmedQuery.length >= MIN_QUERY_LENGTH;
  const showIdleHint = !showResults && !loading && !error;
  const showZero = showResults && groups.length === 0 && !error;

  function toggleBookCollapse(slug: string) {
    setCollapsedBooks((prev) => {
      const next = new Set(prev);
      if (next.has(slug)) {
        next.delete(slug);
      } else {
        next.add(slug);
      }
      return next;
    });
  }

  function handleRowTap(hit: VerseSearchHit) {
    if (isResultLocked(hit, partnerTier)) {
      onUpgradeFromLockedRow();
      return;
    }
    onSelectResult(hit);
  }

  function handleClearInput() {
    setQuery("");
    inputRef.current?.focus();
  }

  return (
    <div
      className="fixed inset-0 z-40 flex items-end justify-center bg-black/40 p-0 sm:items-center sm:p-4"
      onClick={onClose}
      role="dialog"
      aria-modal="true"
      aria-label="Search the canon and extras"
    >
      <div
        className="flex max-h-[85vh] w-full max-w-2xl flex-col overflow-hidden rounded-t-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl sm:rounded-lg"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header — title + ✕ close */}
        <div className="flex items-baseline justify-between border-b border-[var(--reader-rule)] px-4 py-3">
          <h2 className="text-lg font-semibold">Search</h2>
          <button
            type="button"
            className="ml-2 text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
            onClick={onClose}
            aria-label="Close"
          >
            ✕
          </button>
        </div>

        {/* Query input row */}
        <div className="border-b border-[var(--reader-rule)] px-4 py-3">
          <div className="flex items-center gap-2 rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-3 py-2">
            <span
              aria-hidden="true"
              className="text-[var(--reader-muted)]"
              style={{ fontSize: "1.1rem" }}
            >
              ⌕
            </span>
            <input
              ref={inputRef}
              type="search"
              className="flex-1 bg-transparent text-base leading-relaxed outline-none"
              placeholder="Search the canon and extras…"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              autoComplete="off"
              spellCheck={false}
              aria-label="Search query"
              aria-keyshortcuts="Meta+K Control+K"
            />
            {loading ? (
              <span
                role="status"
                aria-live="polite"
                aria-label="Loading results"
                className="text-[var(--reader-muted)]"
              >
                …
              </span>
            ) : query.length > 0 ? (
              <button
                type="button"
                className="text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
                onClick={handleClearInput}
                aria-label="Clear search"
              >
                ✕
              </button>
            ) : null}
          </div>
        </div>

        {/* Results region */}
        <div className="flex-1 overflow-y-auto px-4 py-3">
          {showIdleHint && (
            <p className="py-8 text-center italic text-[var(--reader-muted)]">
              Type to search the canon and extras.
            </p>
          )}

          {error && (
            <p className="py-8 text-center italic text-[var(--reader-muted)]">
              {error}
            </p>
          )}

          {showZero && (
            <p className="py-8 text-center italic text-[var(--reader-muted)]">
              No verses match &ldquo;{trimmedQuery}&rdquo;.
            </p>
          )}

          {showResults && groups.length > 0 && (
            <ul role="list" className="space-y-4">
              {groups.map((group, gIdx) => {
                const collapsed = collapsedBooks.has(group.bookSlug);
                return (
                  <li
                    key={group.bookSlug}
                    role="listitem"
                    className={
                      gIdx < groups.length - 1
                        ? "border-b border-[var(--reader-rule)] pb-4"
                        : ""
                    }
                  >
                    {/* Group header — collapsible book title + hit count */}
                    <button
                      type="button"
                      className="flex w-full items-baseline justify-between text-left"
                      onClick={() => toggleBookCollapse(group.bookSlug)}
                      aria-expanded={!collapsed}
                    >
                      <span className="text-base font-semibold">
                        <span
                          aria-hidden="true"
                          className="mr-2 inline-block"
                          style={{
                            color: "var(--reader-accent)",
                            opacity: 0.85,
                          }}
                        >
                          {collapsed ? "▶" : "▼"}
                        </span>
                        {group.bookTitle}
                      </span>
                      <span className="text-sm text-[var(--reader-muted)]">
                        {formatHitCount(group)}
                      </span>
                    </button>

                    {/* Hits within the group */}
                    {!collapsed && (
                      <ul className="mt-2 space-y-2">
                        {group.hits.map((hit) => {
                          const locked = isResultLocked(hit, partnerTier);
                          const badge = locked
                            ? tierBadgeLabel(hit.tier_required)
                            : null;
                          const ariaLabel = locked
                            ? `${group.bookTitle} ${hit.chapter_number}:${hit.verse_number} — upgrade to ${badge ?? "paid"} tier to read`
                            : `${group.bookTitle} ${hit.chapter_number}:${hit.verse_number}`;
                          const segments = locked
                            ? null
                            : highlightQueryMatches(hit.text, trimmedQuery);
                          return (
                            <li key={hit.verse_id}>
                              <button
                                type="button"
                                className="block w-full rounded p-2 text-left hover:bg-[var(--reader-bg)]/50"
                                onClick={() => handleRowTap(hit)}
                                aria-label={ariaLabel}
                              >
                                <span
                                  className="mr-2 font-semibold"
                                  style={{ color: "var(--reader-accent)" }}
                                >
                                  {group.bookTitle} {hit.chapter_number}:
                                  {hit.verse_number}
                                </span>
                                {locked ? (
                                  <span className="inline-flex items-center gap-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)]/60 px-3 py-1 text-base italic text-[var(--reader-muted)]">
                                    Read this book — {badge ?? "paid"} tier
                                    <span
                                      aria-hidden="true"
                                      style={{ color: "var(--reader-accent)" }}
                                    >
                                      ›
                                    </span>
                                  </span>
                                ) : (
                                  <span className="italic text-[var(--reader-muted)]">
                                    {segments?.map((seg, sIdx) =>
                                      seg.type === "match" ? (
                                        <mark
                                          key={sIdx}
                                          style={{
                                            backgroundColor:
                                              "color-mix(in srgb, var(--reader-accent) 25%, transparent)",
                                            color: "inherit",
                                          }}
                                        >
                                          {seg.text}
                                        </mark>
                                      ) : (
                                        <span key={sIdx}>{seg.text}</span>
                                      ),
                                    )}
                                  </span>
                                )}
                              </button>
                            </li>
                          );
                        })}
                      </ul>
                    )}
                  </li>
                );
              })}
            </ul>
          )}
        </div>

        {/* Footer hint — only when results visible */}
        {showResults && groups.length > 0 && (
          <div className="border-t border-[var(--reader-rule)] px-4 py-2 text-right text-sm text-[var(--reader-muted)]">
            {formatTotalSummary(groups)}
          </div>
        )}
      </div>
    </div>
  );
}
