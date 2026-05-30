/**
 * LexiconSheet — Phase 9.3 §26 depth-lexicon display surface.
 *
 * Stacked modal above StrongsLookup. Opened from inside StrongsLookup
 * via the "Read full lexicon entry" link added at S163 (Companion-tier
 * gated). Renders:
 *
 *   - Breadcrumb header — Strong's H#### (lemma) › SOURCE
 *   - ✕ close + tap-outside-to-close (closes LexiconSheet only; the
 *     StrongsLookup modal underneath persists)
 *   - Standing disclaimer per §26 Gate #1 (muted-italic, names the
 *     source as 19th–20th-century scholarship)
 *   - Framework callout band (when present) — bordered-chrome card
 *     with the gloss-error summary + curated framework reading
 *   - Lexicon body — rendered via dangerouslySetInnerHTML; content is
 *     curated public-domain (BDB 1906, LSJ 1940, Abbott-Smith 1922)
 *     so XSS surface is zero. The body_html embeds:
 *       <a data-verse="genesis-1:1">Gen 1:1</a>      tap-navigate (S164+)
 *       <a data-strong="H0410">El</a>                cross-lemma push (S164+)
 *       <span class="lsj-classical-cite" title="…">  hover-tooltip
 *       <span class="lexicon-unresolved-cite">       graceful downgrade
 *
 * Tier gate: server-side at the API endpoint per S163 Q4 decision. The
 * 403 response surfaces here as the tier-locked card (route-to-pricing
 * on tap, matches the §20 stub pattern). 404 surfaces as the empty-
 * state per §26's coverage-fallback.
 *
 * Per the §22/§23/§24/§25 forward standard, the component itself has no
 * node sanity test — the helper logic (formatDisclaimer / buildBreadcrumb
 * / formatCalloutHeader / parseLexiconBodyLinks / selectDefaultSource) is
 * sanity-tested in _s163_lexicon_sanity.mjs; this component is verified
 * by live walk on the real PWA.
 */

import { useEffect, useRef, useState } from "react";
import {
  type LexiconCallout,
  type LexiconEntry,
  type LexiconFetchResult,
  type LexiconSource,
  fetchLexiconEntry,
} from "../lib/api";
import {
  buildBreadcrumb,
  formatCalloutHeader,
  formatDisclaimer,
  selectDefaultSource,
} from "../lib/lexicon-helpers";
import { renderItalicSpans } from "../lib/markdown";
import { executeStudyShare } from "../lib/study-share-render";

interface LexiconSheetProps {
  strongNumber: string;
  /** Hebrew / Greek / Aramaic — informs the default-source selection. */
  language: "hebrew" | "greek" | "aramaic";
  /** Closes the LexiconSheet; the StrongsLookup modal stack underneath persists. */
  onClose: () => void;
}

export default function LexiconSheet({
  strongNumber,
  language,
  onClose,
}: LexiconSheetProps) {
  const [state, setState] = useState<LexiconFetchResult | { status: "loading" }>(
    { status: "loading" },
  );
  const [activeSource, setActiveSource] = useState<LexiconSource | null>(null);

  // S170 §30 — Share button state. Ref points at the modal-content
  // container so the §30 helper can clone it for html2canvas capture.
  const modalContentRef = useRef<HTMLDivElement | null>(null);
  const [sharing, setSharing] = useState<boolean>(false);

  async function handleShare() {
    if (!modalContentRef.current || state.status !== "ok" || sharing) return;
    if (!activeSource) return;
    const activeEntry =
      state.data.entries.find((e) => e.source === activeSource) ?? null;
    if (!activeEntry) return;
    setSharing(true);
    try {
      await executeStudyShare(modalContentRef.current, {
        strongNumber,
        transliteration: activeEntry.transliteration ?? "",
        source:
          activeSource === "lsj"
            ? "lsj"
            : activeSource === "bdb"
            ? "bdb"
            : "strongs",
      });
    } finally {
      setSharing(false);
    }
  }

  // Escape-to-close + initial fetch
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  useEffect(() => {
    let cancelled = false;
    setState({ status: "loading" });
    fetchLexiconEntry(strongNumber).then((res) => {
      if (cancelled) return;
      setState(res);
      if (res.status === "ok") {
        const def = selectDefaultSource(
          language,
          new Set(res.data.available_sources),
        );
        setActiveSource(def);
      }
    });
    return () => {
      cancelled = true;
    };
  }, [strongNumber, language]);

  return (
    <div
      className="fixed inset-0 z-[60] flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={onClose}
      role="dialog"
      aria-label={`Lexicon entry for ${strongNumber}`}
    >
      <div
        ref={modalContentRef}
        className="w-full max-w-6xl max-h-[85vh] overflow-hidden rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <LexiconSheetBody
          state={state}
          activeSource={activeSource}
          strongNumber={strongNumber}
          onClose={onClose}
          onShare={handleShare}
          sharing={sharing}
        />
      </div>
    </div>
  );
}

// ─────────────────────────────────────────────────────────────────────
// Body — handles loading / tier-locked / not-found / ok states
// ─────────────────────────────────────────────────────────────────────

interface LexiconSheetBodyProps {
  state: LexiconFetchResult | { status: "loading" };
  activeSource: LexiconSource | null;
  strongNumber: string;
  onClose: () => void;
  onShare: () => void;
  sharing: boolean;
}

function LexiconSheetBody({
  state,
  activeSource,
  strongNumber,
  onClose,
  onShare,
  sharing,
}: LexiconSheetBodyProps) {
  // Compute the breadcrumb segments from whatever entry data we have.
  const activeEntry: LexiconEntry | null =
    state.status === "ok" && activeSource
      ? state.data.entries.find((e) => e.source === activeSource) ?? null
      : null;

  const breadcrumb =
    state.status === "ok" && activeEntry
      ? buildBreadcrumb([
          {
            strong_number: strongNumber,
            lemma: activeEntry.lemma,
            source: activeEntry.source,
          },
        ])
      : `Strong's ${strongNumber}`;

  return (
    <>
      {/* Header */}
      <div className="flex items-center justify-between border-b border-[var(--reader-rule)] px-4 py-3">
        <div className="text-xs uppercase tracking-wide text-[var(--reader-accent)]">
          {breadcrumb}
        </div>
        <div className="flex items-center gap-2">
          {/* S170 §30 — Share button. Disabled until an entry resolves
              and an active source is selected so html2canvas captures
              the rendered body, not a loading state. */}
          <button
            type="button"
            onClick={onShare}
            disabled={state.status !== "ok" || sharing}
            aria-label="Share this lexicon entry"
            className="rounded-md border border-[#FCECAF] bg-gradient-to-r from-[#645028] via-[#B4A078] to-[#645028] px-3 py-1 font-sans text-sm font-semibold uppercase tracking-wide text-[#FFF8E1] shadow-sm hover:opacity-90 disabled:opacity-40"
            data-export-suppress
          >
            {sharing ? "…" : "Share"}
          </button>
          <button
            type="button"
            onClick={onClose}
            aria-label="Close lexicon entry"
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-sm font-medium text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
            data-export-suppress
          >
            ✕
          </button>
        </div>
      </div>

      {/* Scrolling body */}
      <div className="max-h-[calc(85vh-3.5rem)] overflow-y-auto px-4 py-4">
        {state.status === "loading" && (
          <p className="text-sm text-[var(--reader-muted)]">Loading lexicon entry…</p>
        )}

        {state.status === "error" && (
          <p className="text-sm text-red-400">
            Could not load lexicon entry: {state.message}
          </p>
        )}

        {state.status === "tier-locked" && (
          <TierLockedCard tierRequired={state.tierRequired} />
        )}

        {state.status === "not-found" && <EmptyStateCard strongNumber={strongNumber} />}

        {state.status === "ok" && activeEntry && (
          <OkBody entry={activeEntry} callout={state.data.callout} />
        )}

        {state.status === "ok" && !activeEntry && (
          <EmptyStateCard strongNumber={strongNumber} />
        )}
      </div>
    </>
  );
}

// ─────────────────────────────────────────────────────────────────────
// State sub-renders
// ─────────────────────────────────────────────────────────────────────

function TierLockedCard({ tierRequired }: { tierRequired: string }) {
  const tierLabel =
    tierRequired === "complete_study"
      ? "Companion"
      : tierRequired === "everything"
      ? "Everything"
      : tierRequired;

  return (
    <div className="rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)] p-4">
      <p className="text-sm font-semibold text-[var(--reader-text)]">
        Tier-locked
      </p>
      <p className="mt-2 text-sm text-[var(--reader-muted)]">
        Full lexicon entries (BDB for Hebrew, LSJ for Greek) are part of the{" "}
        <span className="text-[var(--reader-text)]">{tierLabel}</span> tier. The
        Strong's lookup you came from stays free.
      </p>
      <a
        href="/pricing"
        className="mt-3 inline-block rounded border border-[var(--reader-accent)] px-3 py-1.5 text-sm font-medium text-[var(--reader-accent)] hover:opacity-90"
      >
        Unlock with {tierLabel}
      </a>
    </div>
  );
}

function EmptyStateCard({ strongNumber }: { strongNumber: string }) {
  return (
    <p className="text-sm italic text-[var(--reader-muted)]">
      No depth-lexicon entry available for {strongNumber} at V1. The Strong's
      body you came from is the canonical reference for this term.
    </p>
  );
}

function OkBody({
  entry,
  callout,
}: {
  entry: LexiconEntry;
  callout: LexiconCallout | null;
}) {
  return (
    <div className="space-y-4">
      {/* Standing disclaimer per §26 Gate #1 */}
      <p className="text-xs italic leading-relaxed text-[var(--reader-muted)]">
        {entry.disclaimer || formatDisclaimer(entry.source)}
      </p>

      {/* Framework callout band (when present) */}
      {callout && <FrameworkCalloutCard callout={callout} />}

      {/* Lemma block */}
      <div className="rounded border-l-2 border-[var(--reader-rule)] bg-white/[0.02] px-3 py-2">
        <span
          className="text-2xl font-semibold text-[var(--reader-text)]"
          style={{
            fontFamily:
              entry.source === "bdb" || entry.source === "gesenius"
                ? "'SBL Hebrew', 'Ezra SIL', 'Times New Roman', serif"
                : "'SBL Greek', 'GFS Didot', 'Times New Roman', serif",
            direction: entry.source === "bdb" || entry.source === "gesenius" ? "rtl" : "ltr",
            display: "inline-block",
          }}
        >
          {entry.lemma}
        </span>
        {entry.transliteration && (
          <span className="ml-3 italic text-[var(--reader-muted)]">
            {entry.transliteration}
          </span>
        )}
        {entry.part_of_speech && (
          <span className="ml-2 text-xs text-[var(--reader-muted)]">
            {entry.part_of_speech}
          </span>
        )}
        {entry.short_definition && (
          <div className="mt-1 text-sm text-[var(--reader-text)]">
            — {entry.short_definition}
          </div>
        )}
      </div>

      {/* Lexicon body — curated public-domain content; XSS-safe */}
      <div
        className="lexicon-body text-sm leading-relaxed text-[var(--reader-text)]"
        dangerouslySetInnerHTML={{ __html: entry.body_html }}
      />
    </div>
  );
}

function FrameworkCalloutCard({ callout }: { callout: LexiconCallout }) {
  return (
    <aside className="relative rounded-md border border-[var(--argaman,#8E4FB3)] bg-[var(--reader-surface-elev)] px-3.5 py-3">
      <div className="absolute -top-2 right-3 rounded border border-[var(--reader-accent)] bg-[var(--reader-bg)] px-2 text-[10px] font-semibold uppercase tracking-widest text-[var(--reader-accent)]">
        Framework reading
      </div>
      <h3 className="mb-2 text-sm font-medium leading-snug">
        <span className="italic font-semibold text-[var(--argaman-light,#D4B0E0)]">
          {callout.term_display}
        </span>
        {callout.gloss_error_summary && (
          <>
            <span className="mx-1.5 text-[var(--reader-muted)]">·</span>
            <span className="font-normal text-[var(--reader-text)]">
              {callout.gloss_error_summary}
            </span>
          </>
        )}
      </h3>
      <div className="text-sm leading-relaxed text-[var(--reader-text)]">
        {renderCalloutBody(callout.body_md)}
      </div>
      {callout.red_lines_cited.length > 0 && (
        <footer className="mt-2.5 text-[11px] tracking-wider text-[var(--reader-muted)]">
          Red Lines: {callout.red_lines_cited.map((n) => `#${n}`).join(", ")}
        </footer>
      )}
      {/* sr-only header for assistive tech (covers formatCalloutHeader composition) */}
      <span className="sr-only">{formatCalloutHeader(callout)}</span>
    </aside>
  );
}

// Minimal markdown rendering for the callout body: blockquote, paragraphs,
// *italic* inline spans. Mirrors the S160 LSJ sample-render markdown_to_html
// pipeline so the visual register stays consistent between the sample render
// and the PWA.
function renderCalloutBody(md: string) {
  const lines = md.split("\n");
  const blocks: Array<{ kind: "p" | "blockquote"; lines: string[] }> = [];
  let para: string[] = [];
  let bq: string[] = [];

  function flushPara() {
    if (para.length) {
      blocks.push({ kind: "p", lines: para });
      para = [];
    }
  }
  function flushBq() {
    if (bq.length) {
      blocks.push({ kind: "blockquote", lines: bq });
      bq = [];
    }
  }

  for (const line of lines) {
    if (line.startsWith(">")) {
      flushPara();
      bq.push(line.replace(/^>\s?/, ""));
    } else if (!line.trim()) {
      flushPara();
      flushBq();
    } else {
      flushBq();
      para.push(line);
    }
  }
  flushPara();
  flushBq();

  return blocks.map((b, i) => {
    const text = b.lines.join(" ");
    if (b.kind === "blockquote") {
      return (
        <blockquote
          key={i}
          className="my-2 border-l-2 border-[var(--techelet,#1A6FE5)] bg-white/[0.02] px-3 py-1 italic"
        >
          {renderItalicSpans(text)}
        </blockquote>
      );
    }
    return (
      <p key={i} className="mb-2 last:mb-0">
        {renderItalicSpans(text)}
      </p>
    );
  });
}
