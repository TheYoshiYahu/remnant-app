/**
 * TskSheet — Treasury of Scripture Knowledge standalone tool (S197).
 *
 * Opened from the Reference-tools section. A visibly-subordinate, opt-in foil:
 * the curated threads are the page; this is the inherited cross-reference grammar
 * shown as a labeled foil. The four distortion-class notes (gate passed S196)
 * ride above the chain list via ToolAnnotationBand tool="tsk", entry_key=
 * "sweep:<class>". The chain itself is vote-ranked from openbible.info's TSK.
 */

import { useEffect, useState } from "react";
import {
  fetchTskVerse,
  type ToolFetchResult,
  type TskVerseResponse,
} from "../lib/api";
import ToolAnnotationBand from "./ToolAnnotationBand";
import ToolSheet, {
  ToolEmpty,
  ToolError,
  ToolFoilNote,
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

const SWEEP_CLASSES = [
  "sweep:grace-vs-law",
  "sweep:jew-gentile",
  "sweep:church-as-israel",
  "sweep:torah-as-curse",
];

export default function TskSheet({
  bookSlug,
  chapter,
  verse,
  verseLabel,
  onClose,
}: Props) {
  const [state, setState] = useState<
    ToolFetchResult<TskVerseResponse> | { status: "loading" }
  >({ status: "loading" });

  useEffect(() => {
    let cancelled = false;
    setState({ status: "loading" });
    fetchTskVerse(bookSlug, chapter, verse).then((res) => {
      if (!cancelled) setState(res);
    });
    return () => {
      cancelled = true;
    };
  }, [bookSlug, chapter, verse]);

  return (
    <ToolSheet title={`Treasury (TSK) · ${verseLabel}`} onClose={onClose}>
      <ToolFoilNote>
        The Treasury of Scripture Knowledge (openbible.info, CC-BY) is an
        inherited cross-reference index, shown here as a labeled foil — not the
        page. The curated threads are the page. Its selections carry the four
        distortion patterns noted below; read every chain through them.
      </ToolFoilNote>

      {/* The four distortion-class framework notes ride above the chain. */}
      <div className="mb-4 space-y-2">
        {SWEEP_CLASSES.map((cls) => (
          <ToolAnnotationBand key={cls} tool="tsk" entryKey={cls} />
        ))}
      </div>

      {state.status === "loading" && <ToolLoading label="Loading TSK chains…" />}
      {state.status === "error" && <ToolError message={state.message} />}
      {state.status === "tier-locked" && (
        <ToolTierLockedCard tierRequired={state.tierRequired} />
      )}
      {(state.status === "not-found" ||
        (state.status === "ok" && state.data.pairs.length === 0)) && (
        <ToolEmpty message={`TSK has no cross-reference chain anchored on ${verseLabel}.`} />
      )}
      {state.status === "ok" && state.data.pairs.length > 0 && (
        <ul className="divide-y divide-[var(--reader-rule)]">
          {state.data.pairs.map((p, i) => (
            <li
              key={`${p.to_ref}-${i}`}
              className="flex items-center justify-between gap-3 py-1.5 text-sm"
            >
              <span className="text-[var(--reader-text)]">{p.to_ref}</span>
              <span className="shrink-0 text-[11px] tabular-nums text-[var(--reader-muted)]">
                {p.votes} votes
              </span>
            </li>
          ))}
        </ul>
      )}
    </ToolSheet>
  );
}
