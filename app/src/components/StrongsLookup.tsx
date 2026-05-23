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

import { useEffect, useState } from "react";
import { type StrongEntry, getStrongEntry } from "../lib/api";

interface StrongsLookupProps {
  strongNumber: string;
  /** The English surface word the partner tapped (for context in the header). */
  surface: string;
  onClose: () => void;
}

export default function StrongsLookup({
  strongNumber,
  surface,
  onClose,
}: StrongsLookupProps) {
  const [entry, setEntry] = useState<StrongEntry | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    setError(null);
    setEntry(null);
    getStrongEntry(strongNumber)
      .then((e) => {
        if (cancelled) return;
        setEntry(e);
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
        className="w-full max-w-md rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5 shadow-xl"
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
          <button
            type="button"
            onClick={onClose}
            aria-label="Close"
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 font-sans text-sm font-medium text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
          >
            ✕
          </button>
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
          </div>
        )}
      </div>
    </div>
  );
}
