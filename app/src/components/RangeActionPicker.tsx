/**
 * RangeActionPicker — S123 Wheel 4 architecture; S127 Wheel 7 promotions.
 *
 * Small modal that opens after the range-selection mechanic captures
 * a range. Branches to the three known consumers of the shared
 * mechanic: Highlight range (Live since W4), Copy range with watermark
 * (Live since W7), Share range with watermark (Live since W7).
 *
 * Visual register mirrors the S121/S122 VerseActionMenu so partners
 * learn one modal shape across the app — fixed-position overlay with
 * `bg-black/40` backdrop, bottom-sheet on mobile (items-end), centered
 * on desktop (sm:items-center), bordered-chrome panel using
 * `bg-[var(--reader-surface)]`.
 *
 * S127 W7 — Copy + Share-with-watermark items promoted from S123's
 * Coming-soon stubs to Live. The picker shape did NOT change; only the
 * two onClick handlers wired up + the dimmed/Coming-soon visual
 * treatment dropped on the upgraded items, per the §22 stub-catalog
 * promotion mechanic.
 *
 * Locked at DESIGN_LANGUAGE.md §21 + §24.
 */

import { useEffect } from "react";

interface RangeActionPickerProps {
  /** Display reference for the captured range (e.g., "Genesis 1:3–1:5"). */
  rangeRef: string;
  /** Total verse count in the captured range. */
  rangeSize: number;
  /** Fires when the partner taps "Highlight range" — opens HighlightPicker
   *  in multi-target mode against the resolved verse_id list. */
  onHighlight: () => void;
  /** S127 W7 — fires when the partner taps "Copy range with watermark".
   *  The handler is expected to render the share card via
   *  share-card-render.executeCopy and exit range mode. */
  onCopyRange: () => void;
  /** S127 W7 — fires when the partner taps "Share range with watermark".
   *  The handler is expected to render the share card via
   *  share-card-render.executeShare and exit range mode. */
  onShareRange: () => void;
  /** Cancel — closes the picker. The range stays captured so the partner
   *  can re-open this picker by re-engaging with the range. */
  onClose: () => void;
}

export default function RangeActionPicker({
  rangeRef,
  rangeSize,
  onHighlight,
  onCopyRange,
  onShareRange,
  onClose,
}: RangeActionPickerProps) {
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
        className="flex max-h-[85vh] w-full max-w-2xl flex-col rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl"
        onClick={(e) => e.stopPropagation()}
        role="dialog"
        aria-label="Range action picker"
      >
        {/* Header — range reference in spectral-blue accent + verse count.
            Different register from VerseActionMenu's uppercase scope label;
            the reference is body content, not a chrome label. */}
        <div className="border-b border-[var(--reader-rule)] px-5 pb-3 pt-4">
          <p className="font-sans text-xs uppercase tracking-wide text-[var(--reader-muted)]">
            Range captured — {rangeSize} {rangeSize === 1 ? "verse" : "verses"}
          </p>
          <p className="mt-1 text-base text-[var(--reader-accent)]">{rangeRef}</p>
        </div>

        {/* Action list — three items, one section. Highlight is Live this
            wheel; Copy + Share with watermark are Coming-soon stubs for W7. */}
        <div className="flex-1 overflow-y-auto px-3 py-3">
          <ul className="space-y-0.5" role="menu">
            {/* Highlight range — Live, Free tier */}
            <li role="none">
              <button
                type="button"
                role="menuitem"
                onClick={() => {
                  onHighlight();
                  onClose();
                }}
                className="flex w-full items-center justify-between gap-3 rounded px-3 py-2.5 text-left font-sans text-base text-[var(--reader-text)] hover:bg-[var(--reader-bg)]"
                style={{ minHeight: "2.75rem" }}
              >
                <span className="flex items-center gap-2">
                  <span aria-hidden="true" className="text-[var(--reader-accent)]">
                    ✎
                  </span>
                  <span>Highlight range</span>
                </span>
              </button>
            </li>

            {/* Copy range with watermark — S127 W7 Live (Free). */}
            <li role="none">
              <button
                type="button"
                role="menuitem"
                aria-label={`Copy ${rangeSize} ${
                  rangeSize === 1 ? "verse" : "verses"
                } with watermark`}
                onClick={() => {
                  onCopyRange();
                  onClose();
                }}
                className="flex w-full items-center justify-between gap-3 rounded px-3 py-2.5 text-left font-sans text-base text-[var(--reader-text)] hover:bg-[var(--reader-bg)]"
                style={{ minHeight: "2.75rem" }}
              >
                <span className="flex items-center gap-2">
                  <span aria-hidden="true" className="text-[var(--reader-accent)]">
                    ⧉
                  </span>
                  <span>Copy range with watermark</span>
                </span>
              </button>
            </li>

            {/* Share range with watermark — S127 W7 Live (Free). */}
            <li role="none">
              <button
                type="button"
                role="menuitem"
                aria-label={`Share ${rangeSize} ${
                  rangeSize === 1 ? "verse" : "verses"
                } with watermark`}
                onClick={() => {
                  onShareRange();
                  onClose();
                }}
                className="flex w-full items-center justify-between gap-3 rounded px-3 py-2.5 text-left font-sans text-base text-[var(--reader-text)] hover:bg-[var(--reader-bg)]"
                style={{ minHeight: "2.75rem" }}
              >
                <span className="flex items-center gap-2">
                  <span aria-hidden="true" className="text-[var(--reader-accent)]">
                    ↗
                  </span>
                  <span>Share range with watermark</span>
                </span>
              </button>
            </li>
          </ul>
        </div>

        {/* Footer — explicit Cancel (the backdrop tap and Escape also close). */}
        <div className="border-t border-[var(--reader-rule)] px-3 py-2">
          <button
            type="button"
            onClick={onClose}
            className="w-full rounded px-3 py-2 text-center font-sans text-sm text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
          >
            Cancel
          </button>
        </div>
      </div>
    </div>
  );
}
