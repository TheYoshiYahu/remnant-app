/**
 * StrongsLookup — Session 121, Wheel 3 (tap-on-word UI).
 *
 * Fixed-position modal that opens when the partner taps a tappable
 * word in verse text (quick-tap fast path) OR selects "Strong's
 * lookup" from the VerseActionMenu (long-press / right-click path).
 *
 * Shows the entry returned by GET /v1/strongs/{strong_number}:
 *
 *   - Badge: number (H#### or G####) + language tag (Hebrew/Greek)
 *   - Lemma (original-script Hebrew or Greek, large display)
 *   - Transliteration (romanized form)
 *   - Pronunciation (when present)
 *   - Short definition (gloss)
 *   - Full definition (Strong's body)
 *   - Derivation / etymology (when present)
 *
 * Loading state shows a spinner while the fetch is in flight; error
 * state shows a clean message with retry. Tap outside to close
 * (consistent with the HighlightPicker modal pattern at S113).
 *
 * Public per §9 — no auth, no tier gate. Anonymous and paid partners
 * see the same lookup.
 *
 * Bottom-sheet on mobile (slides up from bottom), centered on desktop.
 * Same modal layout pattern as HighlightPicker so partners learn one
 * modal shape across the app.
 */

import { useEffect, useRef, useState } from "react";
import {
  type StrongEntry,
  type StrongOccurrence,
  getStrongEntry,
  getStrongOccurrences,
} from "../lib/api";
import { executeStudyShare } from "../lib/study-share-render";
import { useSacredNameMask } from "../lib/useSacredNameMask";
import LexiconSheet from "./LexiconSheet";

const OCCURRENCES_PAGE_SIZE = 25;

interface StrongsLookupProps {
  strongNumber: string;
  /** The English surface word the partner tapped (for context in the header). */
  surface: string;
  /**
   * Tap-to-navigate from the concordance — when set, occurrence rows
   * become tappable buttons that fire this callback with the target
   * verse coordinates. App.tsx sets book/chapter/verseNumber state
   * and the S116 reading-position save fires automatically.
   */
  onNavigate?: (
    bookSlug: string,
    chapterNumber: number,
    verseNumber: number
  ) => void;
  onClose: () => void;
}

export default function StrongsLookup({
  strongNumber,
  surface,
  onNavigate,
  onClose,
}: StrongsLookupProps) {
  const [entry, setEntry] = useState<StrongEntry | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  // S121 W3 iteration — concordance state. Per Yoshi's call,
  // "Strong's needs to be able to link other places the word is
  // used." Lexicon-card-only is "kinda weak"; the real study tool
  // surfaces every verse where the word appears, with tap-to-
  // navigate so the partner can walk the canon's usage pattern.
  const [occurrences, setOccurrences] = useState<StrongOccurrence[]>([]);
  const [totalCount, setTotalCount] = useState<number>(0);
  const [loadingMore, setLoadingMore] = useState<boolean>(false);

  // S163 — §26 LexiconSheet stack. Opens via the "Read full lexicon entry"
  // link below the Strong's body. The LexiconSheet renders at z-60 so it
  // stacks above this modal (z-50); closing the LexiconSheet returns the
  // partner here without losing scroll position.
  const [lexiconOpen, setLexiconOpen] = useState<boolean>(false);

  // S170 §30 — Share button state. Ref points at the modal-content
  // container so the §30 helper can clone it for html2canvas capture.
  const modalContentRef = useRef<HTMLDivElement | null>(null);
  const [sharing, setSharing] = useState<boolean>(false);

  // S172 — sacred-name mask. Concordance row verse-text previews
  // honor the partner's preference. The lemma + transliteration in
  // the modal header are Hebrew / Greek source-language fields, NOT
  // affected by the mask (mask only swaps the English-restored
  // "Yahuah" string).
  const { applyToText: applySacredMask } = useSacredNameMask();

  async function handleShare() {
    if (!modalContentRef.current || !entry || sharing) return;
    setSharing(true);
    try {
      await executeStudyShare(modalContentRef.current, {
        kind: "strongs",
        strongNumber: entry.strong_number,
        transliteration: entry.transliteration ?? "",
        source: "strongs",
      });
    } finally {
      setSharing(false);
    }
  }

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    setError(null);
    setEntry(null);
    setOccurrences([]);
    setTotalCount(0);
    // Two parallel fetches — entry + first page of occurrences.
    // The entry is the lexicon card; occurrences power the
    // concordance section. Either can fail independently.
    Promise.all([
      getStrongEntry(strongNumber).then((e) => {
        if (cancelled) return;
        setEntry(e);
      }),
      getStrongOccurrences(strongNumber, {
        limit: OCCURRENCES_PAGE_SIZE,
        offset: 0,
      })
        .then((r) => {
          if (cancelled) return;
          setOccurrences(r.occurrences);
          setTotalCount(r.total_count);
        })
        .catch(() => {
          // Concordance failure is non-fatal — the entry alone is
          // still useful. Leave the concordance section empty.
        }),
    ])
      .then(() => {
        if (cancelled) return;
        setLoading(false);
      })
      .catch((err) => {
        if (cancelled) return;
        setError(String(err));
        setLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, [strongNumber]);

  function loadMoreOccurrences() {
    if (loadingMore) return;
    setLoadingMore(true);
    getStrongOccurrences(strongNumber, {
      limit: OCCURRENCES_PAGE_SIZE,
      offset: occurrences.length,
    })
      .then((r) => {
        setOccurrences((prev) => [...prev, ...r.occurrences]);
        setLoadingMore(false);
      })
      .catch(() => {
        setLoadingMore(false);
      });
  }

  // Escape-to-close — consistent with the menu (and a universal modal
  // expectation on desktop).
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") {
        onClose();
      }
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  const languageLabel =
    entry?.language === "hebrew"
      ? "Hebrew"
      : entry?.language === "greek"
      ? "Greek"
      : entry?.language === "aramaic"
      ? "Aramaic"
      : "";

  return (
    <div
      className="fixed inset-0 z-50 flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={onClose}
    >
      <div
        ref={modalContentRef}
        className="w-full max-w-6xl rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5 shadow-xl"
        onClick={(e) => e.stopPropagation()}
        role="dialog"
        aria-label="Strong's lexicon entry"
      >
        {/* Header — surface word + Strong's badge + close */}
        <div className="mb-4 flex items-start justify-between gap-3">
          <div>
            <h3 className="text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
              {surface}
            </h3>
            <div className="mt-1 flex items-center gap-2">
              <span
                className="rounded border border-[var(--reader-rule)] px-2 py-0.5 font-sans text-sm font-semibold text-[var(--reader-accent)]"
                title={`${languageLabel || "Strong's"} lexicon entry`}
              >
                {strongNumber}
              </span>
              {languageLabel && (
                <span className="font-sans text-xs uppercase tracking-wide text-[var(--reader-muted)]">
                  {languageLabel}
                </span>
              )}
            </div>
          </div>
          <div className="flex items-center gap-2">
            {/* S170 §30 — Share button. Right of close ✕ per spec;
                placed adjacent to the close affordance with the same
                chrome register. Disabled until the entry has loaded
                so html2canvas doesn't capture a loading-spinner state. */}
            <button
              type="button"
              onClick={handleShare}
              disabled={!entry || sharing}
              aria-label="Share this Strong's entry"
              className="rounded-md border border-[#FCECAF] bg-gradient-to-r from-[#645028] via-[#B4A078] to-[#645028] px-3 py-1 font-sans text-sm font-semibold uppercase tracking-wide text-[#FFF8E1] shadow-sm hover:opacity-90 disabled:opacity-40"
              data-export-suppress
            >
              {sharing ? "…" : "Share"}
            </button>
            <button
              type="button"
              onClick={onClose}
              aria-label="Close"
              className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 font-sans text-sm font-medium text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
              data-export-suppress
            >
              ✕
            </button>
          </div>
        </div>

        {loading && (
          <p className="font-sans text-sm text-[var(--reader-muted)]">
            Loading…
          </p>
        )}

        {error && !loading && (
          <p className="font-sans text-sm text-red-400">
            Could not load lexicon entry: {error}
          </p>
        )}

        {entry && !loading && !error && (
          <div className="space-y-3">
            {/* Lemma — original script, large, the headline of the entry */}
            <div>
              <span
                className="text-2xl font-semibold text-[var(--reader-text)]"
                style={{
                  fontFamily:
                    entry.language === "hebrew"
                      ? "'SBL Hebrew', 'Ezra SIL', 'Times New Roman', serif"
                      : "'SBL Greek', 'GFS Didot', 'Times New Roman', serif",
                  direction: entry.language === "hebrew" ? "rtl" : "ltr",
                  display: "inline-block",
                }}
              >
                {entry.lemma}
              </span>
              <span className="ml-3 italic text-[var(--reader-muted)]">
                {entry.transliteration}
              </span>
              {entry.pronunciation && (
                <span className="ml-2 font-sans text-sm text-[var(--reader-muted)]">
                  /{entry.pronunciation}/
                </span>
              )}
            </div>

            {entry.short_definition && (
              <p className="text-[var(--reader-text)]">
                <span className="font-semibold">Gloss:</span>{" "}
                {entry.short_definition}
              </p>
            )}

            <p className="text-[var(--reader-text)]">{entry.definition}</p>

            {entry.derivation && (
              <p className="font-sans text-sm text-[var(--reader-muted)]">
                <span className="font-semibold">Derivation:</span>{" "}
                {entry.derivation}
              </p>
            )}

            {/* S163 §26 — Read full lexicon entry. Sits below the Strong's
                body, above the concordance, per §26 "Entry points — two paths"
                spec. The LexiconSheet's API call handles the tier gate
                server-side: below-Companion partners see the tier-locked
                card inside the LexiconSheet; Companion+ partners see the
                body + framework callout. Hebrew gets (BDB); Greek gets
                (LSJ); Aramaic also gets (BDB) since BDB carries the
                Aramaic block. */}
            {entry.language && (
              <button
                type="button"
                onClick={() => setLexiconOpen(true)}
                className="block w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)] px-3 py-2 text-left font-sans text-sm font-medium text-[var(--reader-accent)] hover:opacity-90"
                data-export-replace="lexicon-deeplink"
              >
                → Read full lexicon entry{" "}
                <span className="text-[var(--reader-muted)]">
                  (
                  {entry.language === "greek" ? "LSJ" : "BDB"}
                  )
                </span>
              </button>
            )}
          </div>
        )}

        {/* S121 W3 iteration — concordance. Other verses using this
            Strong's number, paginated, with tap-to-navigate. */}
        {!loading && !error && totalCount > 0 && (
          <div className="mt-5 border-t border-[var(--reader-rule)] pt-4">
            <h4 className="mb-2 font-sans text-xs font-semibold uppercase tracking-wider text-[var(--reader-accent)]">
              Other verses using this word
            </h4>
            <p className="mb-3 font-sans text-xs text-[var(--reader-muted)]">
              Showing {occurrences.length.toLocaleString()} of{" "}
              {totalCount.toLocaleString()}
            </p>
            <ul className="space-y-2 max-h-72 overflow-y-auto pr-1">
              {occurrences.map((occ) => {
                const ref = `${occ.book_title} ${occ.chapter_number}:${occ.verse_number}`;
                const navigable = typeof onNavigate === "function";
                const inner = (
                  <>
                    <span className="font-sans text-xs font-semibold text-[var(--reader-accent)]">
                      {ref}
                    </span>
                    <span className="ml-2 text-[var(--reader-text)]">
                      {applySacredMask(occ.verse_text)}
                    </span>
                  </>
                );
                return (
                  <li key={`${occ.verse_id}-${occ.position}`}>
                    {navigable ? (
                      <button
                        type="button"
                        onClick={() => {
                          onNavigate!(
                            occ.book_slug,
                            occ.chapter_number,
                            occ.verse_number
                          );
                          onClose();
                        }}
                        className="block w-full rounded px-2 py-2 text-left hover:bg-[var(--reader-bg)]"
                      >
                        {inner}
                      </button>
                    ) : (
                      <div className="px-2 py-2">{inner}</div>
                    )}
                  </li>
                );
              })}
            </ul>
            {occurrences.length < totalCount && (
              <button
                type="button"
                onClick={loadMoreOccurrences}
                disabled={loadingMore}
                className="mt-3 w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 font-sans text-sm font-medium text-[var(--reader-text)] hover:opacity-90 disabled:opacity-40"
                data-export-suppress
              >
                {loadingMore
                  ? "Loading…"
                  : `Show ${Math.min(
                      OCCURRENCES_PAGE_SIZE,
                      totalCount - occurrences.length
                    )} more`}
              </button>
            )}
          </div>
        )}
      </div>

      {/* S163 — §26 LexiconSheet stacked above this modal (z-60 > z-50).
          Mount only when open so the fetch fires on partner intent
          rather than on every StrongsLookup mount. */}
      {lexiconOpen && entry && (
        <LexiconSheet
          strongNumber={entry.strong_number}
          language={
            entry.language === "hebrew" || entry.language === "aramaic"
              ? entry.language
              : "greek"
          }
          onClose={() => setLexiconOpen(false)}
        />
      )}
    </div>
  );
}
