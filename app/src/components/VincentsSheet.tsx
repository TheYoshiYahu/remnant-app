/**
 * VincentsSheet — §26 Vincent's Word Studies verse panel (S197).
 *
 * Opened from the Word-study section of the VerseActionMenu. Renders every
 * head-phrase exposition Vincent's carries for the verse as the untouched
 * annotated-foil base, with the verse-level framework correction band on top
 * (ToolAnnotationBand tool="vincents", entry_key="<book>.<ch>.<v>" — the S197
 * verse-level key decision per the S196 checkpoint). The sacred-name mask is
 * applied to Vincent's prose so the restored Names carry through the foil.
 */

import { useEffect, useState } from "react";
import {
  fetchVincentsVerse,
  type ToolFetchResult,
  type VincentVerseResponse,
} from "../lib/api";
import { useSacredNameMask } from "../lib/useSacredNameMask";
import ToolAnnotationBand from "./ToolAnnotationBand";
import ToolSheet, {
  ToolEmpty,
  ToolError,
  ToolLoading,
  ToolTierLockedCard,
} from "./ToolSheet";

interface Props {
  bookSlug: string;
  chapter: number;
  verse: number;
  verseLabel: string;
  onClose: () => void;
}

export default function VincentsSheet({
  bookSlug,
  chapter,
  verse,
  verseLabel,
  onClose,
}: Props) {
  const [state, setState] = useState<
    ToolFetchResult<VincentVerseResponse> | { status: "loading" }
  >({ status: "loading" });
  const { applyToText: applySacredMask } = useSacredNameMask();

  useEffect(() => {
    let cancelled = false;
    setState({ status: "loading" });
    fetchVincentsVerse(bookSlug, chapter, verse).then((res) => {
      if (!cancelled) setState(res);
    });
    return () => {
      cancelled = true;
    };
  }, [bookSlug, chapter, verse]);

  const entryKey = `${bookSlug}.${chapter}.${verse}`;

  return (
    <ToolSheet title={`Vincent's Word Studies · ${verseLabel}`} onClose={onClose}>
      {/* Framework correction band rides above the foil, keyed per verse. */}
      <div className="mb-4">
        <ToolAnnotationBand tool="vincents" entryKey={entryKey} />
      </div>

      {state.status === "loading" && <ToolLoading label="Loading Vincent's…" />}
      {state.status === "error" && <ToolError message={state.message} />}
      {state.status === "tier-locked" && (
        <ToolTierLockedCard tierRequired={state.tierRequired} />
      )}
      {state.status === "not-found" && (
        <ToolEmpty message={`No Vincent's entry for ${verseLabel}.`} />
      )}
      {state.status === "ok" && state.data.entries.length === 0 && (
        <ToolEmpty
          message={`Vincent's Word Studies (New Testament) has no note on ${verseLabel}.`}
        />
      )}
      {state.status === "ok" && state.data.entries.length > 0 && (
        <div className="space-y-5">
          <p className="text-xs italic leading-relaxed text-[var(--reader-muted)]">
            Vincent's Word Studies in the New Testament (Marvin R. Vincent,
            1886–1900) is preserved as data so you can see how the inherited
            tradition handled the word. Where it diverges from the framework, the
            framework reading above is the standard.
          </p>
          {state.data.entries.map((e) => (
            <div
              key={e.entry_key}
              className="rounded border-l-2 border-[var(--reader-rule)] bg-white/[0.02] px-3 py-2"
            >
              {e.headword && (
                <h3 className="mb-1 text-sm font-semibold text-[var(--reader-text)]">
                  {e.headword}
                </h3>
              )}
              <p className="text-sm leading-relaxed text-[var(--reader-text)] whitespace-pre-line">
                {applySacredMask(e.body)}
              </p>
            </div>
          ))}
        </div>
      )}
    </ToolSheet>
  );
}
