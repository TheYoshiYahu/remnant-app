/**
 * NikkudotSheet — §20 Nikkudot (pointed Hebrew) interlinear sibling view (S197).
 *
 * Opened from the Word-study section (Hebrew words only). Renders the pointed
 * Hebrew text for the verse from STEPBible TAHOT — the trustworthy base — and,
 * whenever the verse carries the Tetragrammaton, attaches the one framework note
 * on the deliberate Masoretic masking of the Name (ToolAnnotationBand
 * tool="nikkudot", entry_key="tetragrammaton").
 */

import { useEffect, useState } from "react";
import {
  fetchNikkudotVerse,
  type NikkudotVerseResponse,
  type ToolFetchResult,
} from "../lib/api";
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

export default function NikkudotSheet({
  bookSlug,
  chapter,
  verse,
  verseLabel,
  onClose,
}: Props) {
  const [state, setState] = useState<
    ToolFetchResult<NikkudotVerseResponse> | { status: "loading" }
  >({ status: "loading" });

  useEffect(() => {
    let cancelled = false;
    setState({ status: "loading" });
    fetchNikkudotVerse(bookSlug, chapter, verse).then((res) => {
      if (!cancelled) setState(res);
    });
    return () => {
      cancelled = true;
    };
  }, [bookSlug, chapter, verse]);

  return (
    <ToolSheet title={`Nikkudot · ${verseLabel}`} onClose={onClose}>
      {state.status === "loading" && <ToolLoading label="Loading pointed Hebrew…" />}
      {state.status === "error" && <ToolError message={state.message} />}
      {state.status === "tier-locked" && (
        <ToolTierLockedCard tierRequired={state.tierRequired} />
      )}
      {state.status === "not-found" && (
        <ToolEmpty message={`No pointed Hebrew for ${verseLabel} (Old Testament only).`} />
      )}
      {state.status === "ok" && (
        <div className="space-y-4">
          {state.data.has_tetragrammaton && (
            <ToolAnnotationBand tool="nikkudot" entryKey="tetragrammaton" />
          )}
          <p className="text-xs italic leading-relaxed text-[var(--reader-muted)]">
            Pointed Hebrew from the STEPBible Tyndale Amalgamated Hebrew Old
            Testament (CC-BY). The vowel-pointing is trustworthy throughout — with
            the single exception of the Name, noted above where it appears.
          </p>
          <div
            dir="rtl"
            lang="he"
            className="rounded border-l-2 border-[var(--reader-rule)] bg-white/[0.02] px-3 py-3 text-2xl leading-loose text-[var(--reader-text)]"
            style={{
              fontFamily:
                "'SBL Hebrew', 'Ezra SIL', 'Times New Roman', serif",
            }}
          >
            {state.data.pointed_text}
          </div>
        </div>
      )}
    </ToolSheet>
  );
}
