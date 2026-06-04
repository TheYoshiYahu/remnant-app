/**
 * ToolAnnotationBand — the framework annotation-layer overlay, rendered beside
 * any public-domain reference tool at point of use (APP_BUILDOUT_ROADMAP
 * "annotation layer", locked S194; Session 196).
 *
 * The PD tool (Vincent's, Nave's, Maps, TSK, Nikkudot, interlinear gloss cell)
 * renders its untouched base; this band fetches the keyed framework correction
 * for (tool, entryKey) from GET /v1/tool-annotations/{tool}/{entry_key} and, when
 * a LIVE author-reviewed correction is on file, renders the "Framework reading"
 * card above/beside it — the same purple-ruled band the §26 LexiconSheet uses for
 * its strong-number callouts, so the visual register is identical across every
 * study tool.
 *
 * Behavior:
 *   - 200 + annotation  → render the band (sacred-name mask applied to body).
 *   - 200 + null         → render nothing (the PD base stands alone, no overlay).
 *   - 403 tier-locked    → render nothing (the host surface owns the tier-lock UI).
 *   - 404 / error        → render nothing (fail open: never block the base tool).
 *
 * BDB/LSJ Strong's-number word-callouts are NOT served here — they come from the
 * lexicon endpoint (lexicon_callouts) and render inside LexiconSheet directly.
 */

import { useEffect, useState } from "react";
import {
  fetchToolAnnotation,
  type AnnotationTool,
  type ToolAnnotation,
} from "../lib/api";
import { renderMarkdownBody } from "../lib/markdown";
import { useSacredNameMask } from "../lib/useSacredNameMask";

interface Props {
  tool: AnnotationTool;
  entryKey: string;
  /** Optional override of the band's eyebrow label. Defaults to "Framework reading". */
  label?: string;
}

export function ToolAnnotationBand({ tool, entryKey, label }: Props) {
  const [annotation, setAnnotation] = useState<ToolAnnotation | null>(null);
  const { applyToText: applySacredMask } = useSacredNameMask();

  useEffect(() => {
    let cancelled = false;
    setAnnotation(null);
    fetchToolAnnotation(tool, entryKey).then((res) => {
      if (cancelled) return;
      if (res.status === "ok" && res.data.annotation) {
        setAnnotation(res.data.annotation);
      }
      // tier-locked / not-found / error → leave null (fail open).
    });
    return () => {
      cancelled = true;
    };
  }, [tool, entryKey]);

  if (!annotation) return null;

  return (
    <aside className="relative rounded-md border border-[var(--argaman,#8E4FB3)] bg-[var(--reader-surface-elev)] px-3.5 py-3">
      <div className="absolute -top-2 right-3 rounded border border-[var(--reader-accent)] bg-[var(--reader-bg)] px-2 text-[10px] font-semibold uppercase tracking-widest text-[var(--reader-accent)]">
        {label ?? "Framework reading"}
      </div>
      <h3 className="mb-2 text-sm font-medium leading-snug">
        {annotation.term_display && (
          <span className="italic font-semibold text-[var(--argaman-light,#D4B0E0)]">
            {annotation.term_display}
          </span>
        )}
        {annotation.term_display && annotation.conflict_summary && (
          <span className="mx-1.5 text-[var(--reader-muted)]">·</span>
        )}
        {annotation.conflict_summary && (
          <span className="font-normal text-[var(--reader-text)]">
            {annotation.conflict_summary}
          </span>
        )}
      </h3>
      <div className="text-sm leading-relaxed text-[var(--reader-text)]">
        {renderMarkdownBody(applySacredMask(annotation.annotation_md))}
      </div>
      {annotation.red_lines_cited.length > 0 && (
        <footer className="mt-2.5 text-[11px] tracking-wider text-[var(--reader-muted)]">
          Red Lines: {annotation.red_lines_cited.map((n) => `#${n}`).join(", ")}
        </footer>
      )}
    </aside>
  );
}

export default ToolAnnotationBand;
