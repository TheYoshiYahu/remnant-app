/**
 * SearchModal — Session 125 wheel (Wheel 6), rebuilt at S352.
 *
 * Pop-up search per DESIGN_LANGUAGE.md §23. The S352 rebuild lands the
 * major search upgrade on top of the original three gates:
 *
 *   (a) Pop-up modal entry surface (not expanding chrome bar, not a
 *       separate /search page) — reader stays mounted behind.
 *   (b) Results grouped by book, collapsible. Within each group hits
 *       stay in the server's relevance order; the client does NOT
 *       re-sort. (S352: the server now ranks by relevance tier — exact
 *       phrase → exact token → synonym → trigram → concept — instead of
 *       canonical order, so the strongest match leads.)
 *   (c) Tier-aware snippet. S352 REPLACES the old tier-ladder lock with
 *       the extra-canon click-gate: search is free for all and EVERY
 *       hit is shown (canon and extra-canon alike), but extra-canonical
 *       rows are only *clickable* for partners in trial or at the
 *       Companion tier. Canon rows are always clickable. Tapping a
 *       locked extra-canon row shows an inline no-link "start a trial or
 *       partner to open" prompt — NO checkout link (web-first commerce;
 *       native reader apps carry no purchase steering).
 *
 * S352 also adds: an Exact/Related mode toggle, a book-scope filter
 * (search within one book), and real pagination (page size 50 with a
 * "Load more" pager and a true "N of M" total from the server's
 * count(*) OVER()).
 *
 * Same modal register as HighlightPicker / BookmarkSheet / NotesPanel /
 * RangeActionPicker / VerseActionMenu / StrongsLookup — bg-black/40
 * backdrop, items-end on mobile (slide-up from bottom), centered on
 * desktop (sm:items-center). max-w-6xl matches NotesPanel.
 */

import { useEffect, useMemo, useRef, useState } from "react";
import {
  searchVerses,
  type BookSummary,
  type SearchMode,
  type VerseSearchHit,
} from "../lib/api";
import {
  formatHitCount,
  groupResultsByBook,
  highlightQueryMatches,
  isExtraCanonLocked,
  teaserOfVerse,
  tierBadgeLabel,
} from "../lib/search-helpers";
import { useSacredNameMask } from "../lib/useSacredNameMask";

const MIN_QUERY_LENGTH = 2;
const DEBOUNCE_MS = 250;
const PAGE_SIZE = 50;

interface SearchModalProps {
  /** Whether the partner may OPEN extra-canonical result rows — true
   *  when in trial or at the Companion tier. Canon rows ignore this and
   *  are always clickable. Resolved by the parent from the /me
   *  subscription status + tier. */
  canOpenExtraCanon: boolean;
  /** Book list for the search-within-a-book scope filter. The parent
   *  passes its already-visible-filtered book set. */
  books: BookSummary[];
  /** Invoked when partner taps a clickable (canon, or unlocked
   *  extra-canon) result row. Parent handles the W2 navigation
   *  state-reset contract and closes the modal. */
  onSelectResult: (hit: VerseSearchHit) => void;
  /** Modal close callback (✕ button, tap-outside, Escape). */
  onClose: () => void;
}

export default function SearchModal({
  canOpenExtraCanon,
  books,
  onSelectResult,
  onClose,
}: SearchModalProps) {
  const [query, setQuery] = useState<string>("");
  const [mode, setMode] = useState<SearchMode>("related");
  const [bookFilter, setBookFilter] = useState<string>(""); // "" = all books
  const [hits, setHits] = useState<VerseSearchHit[] | null>(null);
  const [total, setTotal] = useState<number>(0);
  const [offset, setOffset] = useState<number>(0);
  const [loading, setLoading] = useState(false);
  const [loadingMore, setLoadingMore] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [collapsedBooks, setCollapsedBooks] = useState<Set<string>>(new Set());
  // S352 — inline no-link prompt target. When the partner taps a locked
  // extra-canon row, its verse_id lands here and an inline prompt renders
  // beneath the row. No navigation, no checkout link.
  const [promptedVerseId, setPromptedVerseId] = useState<number | null>(null);
  // S172 — sacred-name mask flows through search results (they render
  // verse text). Mask alone — applied before highlightQueryMatches.
  const { applyToText: applySacredMask } = useSacredNameMask();

  const inputRef = useRef<HTMLInputElement | null>(null);
  const debounceRef = useRef<number | null>(null);
  const abortRef = useRef<AbortController | null>(null);

  // Book-filter dropdown options, canonical order.
  const bookOptions = useMemo(
    () =>
      [...books].sort((a, b) => a.canonical_order - b.canonical_order),
    [books],
  );

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

  // Core fetch. `append` = pagination "Load more" (keep prior hits and
  // append this page); otherwise a fresh query (replace). Aborts any
  // in-flight request first so a stale response can't overwrite the
  // current results.
  function runQuery(nextOffset: number, append: boolean) {
    abortRef.current?.abort();
    const controller = new AbortController();
    abortRef.current = controller;
    if (append) {
      setLoadingMore(true);
    } else {
      setLoading(true);
      setCollapsedBooks(new Set());
      setPromptedVerseId(null);
    }
    setError(null);
    searchVerses(query.trim(), {
      limit: PAGE_SIZE,
      offset: nextOffset,
      mode,
      books: bookFilter ? [bookFilter] : undefined,
      signal: controller.signal,
    })
      .then((res) => {
        if (controller.signal.aborted) return;
        setTotal(res.total);
        setOffset(nextOffset);
        setHits((prev) =>
          append && prev ? [...prev, ...res.hits] : res.hits,
        );
        setLoading(false);
        setLoadingMore(false);
      })
      .catch((err: unknown) => {
        if (err instanceof DOMException && err.name === "AbortError") {
          return; // superseded by a newer query
        }
        if (controller.signal.aborted) return;
        setError("Search is temporarily unavailable. Try again in a moment.");
        setLoading(false);
        setLoadingMore(false);
      });
  }

  // Debounced new-search effect. Re-fires DEBOUNCE_MS after the last
  // change to the query, mode, or book filter (each resets to page 0).
  useEffect(() => {
    if (debounceRef.current !== null) {
      window.clearTimeout(debounceRef.current);
      debounceRef.current = null;
    }
    if (query.trim().length < MIN_QUERY_LENGTH) {
      abortRef.current?.abort();
      abortRef.current = null;
      setLoading(false);
      setLoadingMore(false);
      setHits(null);
      setTotal(0);
      setOffset(0);
      setError(null);
      setCollapsedBooks(new Set());
      setPromptedVerseId(null);
      return;
    }
    debounceRef.current = window.setTimeout(() => {
      runQuery(0, false);
    }, DEBOUNCE_MS);
    return () => {
      if (debounceRef.current !== null) {
        window.clearTimeout(debounceRef.current);
        debounceRef.current = null;
      }
    };
    // runQuery reads query/mode/bookFilter from the same render's closure.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [query, mode, bookFilter]);

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
  const showShortQueryHint =
    trimmedQuery.length > 0 &&
    trimmedQuery.length < MIN_QUERY_LENGTH &&
    !loading;
  const showIdleHint =
    !showResults && !showShortQueryHint && !loading && !error;
  const showZero = showResults && groups.length === 0 && !error && !loading;
  const loadedCount = hits?.length ?? 0;
  const hasMore = loadedCount < total;

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
    if (isExtraCanonLocked(hit, canOpenExtraCanon)) {
      // Toggle the inline no-link prompt for this row. No navigation.
      setPromptedVerseId((cur) => (cur === hit.verse_id ? null : hit.verse_id));
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
        className="flex max-h-[85vh] w-full max-w-6xl flex-col overflow-hidden rounded-t-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl sm:rounded-lg"
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

          {/* S352 — controls row: Exact/Related mode toggle + book scope */}
          <div className="mt-3 flex flex-wrap items-center gap-3">
            <div
              className="inline-flex overflow-hidden rounded border border-[var(--reader-rule)] text-sm"
              role="group"
              aria-label="Search mode"
            >
              <button
                type="button"
                onClick={() => setMode("exact")}
                aria-pressed={mode === "exact"}
                className={
                  "px-3 py-1 " +
                  (mode === "exact"
                    ? "bg-[var(--reader-accent)] text-[var(--reader-surface)] font-semibold"
                    : "text-[var(--reader-muted)] hover:text-[var(--reader-text)]")
                }
              >
                Exact
              </button>
              <button
                type="button"
                onClick={() => setMode("related")}
                aria-pressed={mode === "related"}
                className={
                  "px-3 py-1 " +
                  (mode === "related"
                    ? "bg-[var(--reader-accent)] text-[var(--reader-surface)] font-semibold"
                    : "text-[var(--reader-muted)] hover:text-[var(--reader-text)]")
                }
              >
                Related
              </button>
            </div>

            <label className="flex items-center gap-2 text-sm text-[var(--reader-muted)]">
              <span className="sr-only sm:not-sr-only">in</span>
              <select
                value={bookFilter}
                onChange={(e) => setBookFilter(e.target.value)}
                aria-label="Limit search to a book"
                className="max-w-[16rem] rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-2 py-1 text-[var(--reader-text)] outline-none"
              >
                <option value="">All books</option>
                {bookOptions.map((b) => (
                  <option key={b.slug} value={b.slug}>
                    {b.title}
                  </option>
                ))}
              </select>
            </label>
          </div>

          <p className="mt-2 text-xs italic text-[var(--reader-muted)]">
            {mode === "exact"
              ? "Exact — phrases and the words you typed. Use \"quotes\" for an exact phrase, -word to exclude, OR between words."
              : "Related — also finds synonyms, restored names, and linked concepts."}
          </p>
        </div>

        {/* Results region */}
        <div className="flex-1 overflow-y-auto px-4 py-3">
          {showIdleHint && (
            <p className="py-8 text-center italic text-[var(--reader-muted)]">
              Type to search the canon and extras.
            </p>
          )}

          {showShortQueryHint && (
            <p className="py-8 text-center italic text-[var(--reader-muted)]">
              Type at least {MIN_QUERY_LENGTH} characters to search.
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
                          const locked = isExtraCanonLocked(
                            hit,
                            canOpenExtraCanon,
                          );
                          const badge = locked
                            ? tierBadgeLabel(hit.tier_required)
                            : null;
                          const ariaLabel = locked
                            ? `${group.bookTitle} ${hit.chapter_number}:${hit.verse_number} — start a trial or partner to open`
                            : `${group.bookTitle} ${hit.chapter_number}:${hit.verse_number}`;
                          // Locked extra-canon rows render a teaser of the
                          // verse (matched word highlighted) + a lock chip.
                          // The free reader who searches "Watchers" sees
                          // canon hits open AND teasers of every extra-canon
                          // hit, learning by reading that the framework
                          // reaches past the canon. Curiosity does the
                          // selling; there is no checkout link.
                          const maskedText = applySacredMask(hit.text);
                          const segments = highlightQueryMatches(
                            locked
                              ? teaserOfVerse(maskedText, trimmedQuery)
                              : maskedText,
                            trimmedQuery,
                          );
                          const prompted = promptedVerseId === hit.verse_id;
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
                                  {locked && (
                                    <span className="ml-2 inline-flex items-center gap-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)]/60 px-2 py-0.5 text-xs not-italic text-[var(--reader-muted)] align-baseline">
                                      <svg
                                        aria-hidden="true"
                                        viewBox="0 0 20 20"
                                        className="h-3 w-3"
                                        fill="currentColor"
                                      >
                                        <path d="M10 2a4 4 0 00-4 4v2H5a1 1 0 00-1 1v8a1 1 0 001 1h10a1 1 0 001-1V9a1 1 0 00-1-1h-1V6a4 4 0 00-4-4zm-2 6V6a2 2 0 114 0v2H8z" />
                                      </svg>
                                      {badge ? `${badge} · ` : ""}Trial or
                                      partner to open
                                    </span>
                                  )}
                                </span>
                              </button>
                              {/* Inline no-link prompt (S352) — shown when a
                                  locked row is tapped. No checkout link. */}
                              {locked && prompted && (
                                <p
                                  role="note"
                                  className="mt-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)]/60 px-3 py-2 text-sm not-italic text-[var(--reader-muted)]"
                                >
                                  This reading is in the extras. Start a free
                                  trial or become a partner to open it — search
                                  and result previews stay free for everyone.
                                </p>
                              )}
                            </li>
                          );
                        })}
                      </ul>
                    )}
                  </li>
                );
              })}

              {/* S352 — pagination pager */}
              {hasMore && (
                <li className="pt-2 text-center">
                  <button
                    type="button"
                    onClick={() => runQuery(offset + PAGE_SIZE, true)}
                    disabled={loadingMore}
                    className="rounded border border-[var(--reader-rule)] px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:bg-[var(--reader-bg)]/50 disabled:opacity-60"
                  >
                    {loadingMore ? "Loading…" : "Load more results"}
                  </button>
                </li>
              )}
            </ul>
          )}
        </div>

        {/* Footer — "N of M" total when results visible */}
        {showResults && groups.length > 0 && (
          <div className="border-t border-[var(--reader-rule)] px-4 py-2 text-right text-sm text-[var(--reader-muted)]">
            Showing {loadedCount} of {total}{" "}
            {total === 1 ? "result" : "results"}
          </div>
        )}
      </div>
    </div>
  );
}
