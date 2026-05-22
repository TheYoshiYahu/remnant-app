/**
 * ChapterCommentary — Session 112 wheel.
 *
 * Renders the tiered commentary stack between the chapter's free
 * `chapter_intro` (rendered by App.tsx as the "COMMENTARY" aside) and
 * the chapter-end cross-reference card. Stack order:
 *
 *   [Free chapter_intro — rendered by App.tsx, always-expanded]
 *   [This component:]
 *     - Basic (surface_kind='inline')      — collapsible, paid-tier
 *     - Deeper Dive (surface_kind='deep_dive') — collapsible, paid-tier
 *   [ChapterEndCard — cross-references, free + paid]
 *
 * Tier-gating: every commentary_entries row comes back from the API
 * with `locked: boolean`. Unlocked rows render with their body inside
 * a collapsible "Read deeper" expander. Locked rows render with an
 * eye-catching upgrade affordance in place of the body — header is
 * still visible (so the partner sees what's there) but body is null
 * over the wire and an "Unlock with [Tier]" CTA shows instead.
 *
 * Hide-commentary toggle: a global "Hide commentary" toggle persists
 * per-user via localStorage so a partner who wants to read straight
 * verses without commentary chrome can switch it off and have that
 * preference remembered. Off by default — the study Bible looks naked
 * without commentary, and free users need to see the value lattice.
 */

import { useEffect, useState, type ReactNode } from "react";
import {
  type ChapterCommentaryEntry,
  type ChapterCommentaryResponse,
  type ContentTier,
  getChapterCommentary,
} from "../lib/api";
import { renderMarkdownBody } from "../lib/markdown";

interface ChapterCommentaryProps {
  bookSlug: string;
  chapterNumber: number;
  /**
   * Caller's effective tier. Reserved — currently the API computes
   * locked-state per row and the PWA renders based on the row's
   * `locked` flag, so this prop is not used at render time. Kept in
   * the interface for forward-compatibility: when the renderer wants
   * to vary CTA copy by tier (e.g., "Upgrade from Notes to Library"),
   * the prop is already plumbed through from App.tsx.
   */
  userTier?: ContentTier;
}

const HIDE_COMMENTARY_KEY = "rop_hide_commentary_v1";

export default function ChapterCommentary({
  bookSlug,
  chapterNumber,
}: ChapterCommentaryProps) {
  const [data, setData] = useState<ChapterCommentaryResponse | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  // Errors are silent — a missing commentary surface isn't load-bearing
  // for the verse read. We just hide the component on failure.
  const [, setError] = useState<string | null>(null);

  // Global hide-commentary preference, persisted per-user in localStorage.
  const [hideCommentary, setHideCommentary] = useState<boolean>(false);
  useEffect(() => {
    if (typeof window === "undefined") return;
    const stored = window.localStorage.getItem(HIDE_COMMENTARY_KEY);
    setHideCommentary(stored === "true");
  }, []);
  const toggleHide = () => {
    const next = !hideCommentary;
    setHideCommentary(next);
    if (typeof window !== "undefined") {
      window.localStorage.setItem(HIDE_COMMENTARY_KEY, String(next));
    }
  };

  useEffect(() => {
    let cancelled = false;
    setData(null);
    setLoading(true);
    setError(null);
    getChapterCommentary(bookSlug, chapterNumber)
      .then((r) => {
        if (cancelled) return;
        setData(r);
        setLoading(false);
      })
      .catch((e) => {
        if (cancelled) return;
        setError(String(e));
        setLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, [bookSlug, chapterNumber]);

  // Silent on loading / error / no-data — chapter still renders fine
  // without this surface. Most chapters return empty entries until the
  // commentary apparatus reaches them.
  if (loading || !data) return null;
  if (data.entries.length === 0) return null;

  return (
    <section
      className="mt-8 border-t border-[var(--reader-rule)] pt-6"
      aria-labelledby="chapter-commentary-title"
    >
      <div className="mb-4 flex items-center justify-between gap-3">
        <h3
          id="chapter-commentary-title"
          className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]"
        >
          More on {data.book.title} {data.chapter.number}
        </h3>
        <button
          type="button"
          onClick={toggleHide}
          className="font-sans text-xs font-medium text-[var(--reader-muted)] underline-offset-2 hover:underline"
          aria-pressed={hideCommentary}
          title="Persists across chapters and reloads"
        >
          {hideCommentary ? "Show commentary" : "Hide commentary"}
        </button>
      </div>

      {!hideCommentary && (
        <div className="space-y-4">
          {data.entries.map((entry) => (
            <CommentaryBlock key={entry.id} entry={entry} />
          ))}
        </div>
      )}
    </section>
  );
}

// ---- One commentary block (Basic / Deeper Dive / Featured) --------------

function CommentaryBlock({
  entry,
}: {
  entry: ChapterCommentaryEntry;
}) {
  const [expanded, setExpanded] = useState<boolean>(false);

  const headerLabel = entry.title || labelForSurface(entry.surface_kind);
  const expanderLabel = expanderLabelForSurface(entry.surface_kind);

  // Locked state — eye-catching upgrade affordance (Yoshi's pattern A,
  // Session 112). Header visible with the tier badge, body is a styled
  // CTA card with a clear "Unlock with [Tier]" call to action.
  if (entry.locked) {
    return (
      <article className="rounded-lg border border-dashed border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
        <header className="mb-2 flex flex-wrap items-baseline justify-between gap-2">
          <h4 className="text-base font-semibold text-[var(--reader-text)]">
            {headerLabel}
          </h4>
          <TierBadge tier={entry.tier_required} locked />
        </header>
        <div className="mt-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-bg,#fafafa)] p-4 text-center">
          <p className="mb-3 text-sm text-[var(--reader-text)]">
            {ctaCopyForSurface(entry.surface_kind)}
          </p>
          <a
            href="/pricing"
            className="inline-block rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Unlock with {prettyTier(entry.tier_required)} (
            {priceForTier(entry.tier_required)})
          </a>
        </div>
      </article>
    );
  }

  // Unlocked state — collapsible body with a "Read [Basic / Deeper Dive]"
  // expander. Default-collapsed for paid surfaces so a partner who just
  // wants to read verses isn't immediately scrolled into 12k-word
  // commentary; one click expands when they want it.
  return (
    <article className="rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
      <header className="mb-2 flex flex-wrap items-baseline justify-between gap-2">
        <h4 className="text-base font-semibold text-[var(--reader-text)]">
          {headerLabel}
        </h4>
        <TierBadge tier={entry.tier_required} locked={false} />
      </header>
      {!expanded && (
        <button
          type="button"
          onClick={() => setExpanded(true)}
          className="font-sans text-sm font-medium text-[var(--reader-text)] underline-offset-2 hover:underline"
        >
          {expanderLabel}
        </button>
      )}
      {expanded && entry.body && (
        <>
          <div className="prose-paragraphs mt-2 text-[1.025rem] leading-relaxed text-[var(--reader-text)] space-y-0">
            {renderCommentaryBody(entry.body)}
          </div>
          <button
            type="button"
            onClick={() => setExpanded(false)}
            className="mt-4 font-sans text-xs font-medium text-[var(--reader-muted)] underline-offset-2 hover:underline"
          >
            Collapse
          </button>
        </>
      )}
    </article>
  );
}

// ---- Markdown renderer that also handles `## §N. Title` sub-headings ----

/**
 * Render a commentary body. Falls back on the shared `renderMarkdownBody`
 * for paragraph + italic handling, but additionally splits the body on
 * H2 markdown lines (`## Title`) and renders those as sub-headings.
 *
 * Used for the Deeper Dive body which carries `## §N. Title` sections
 * (matt-N.md structure). Also handles the late-chapter Basic bodies
 * (matt-23..28 short.md) which similarly have H2 sub-sections.
 */
function renderCommentaryBody(body: string): ReactNode {
  // Split on H2 lines, keeping the heading text with each section.
  // Pattern: lines that match /^## /m mark new sections.
  const lines = body.split("\n");
  const sections: { heading: string | null; body: string }[] = [];
  let current: { heading: string | null; lines: string[] } = {
    heading: null,
    lines: [],
  };
  for (const line of lines) {
    if (line.startsWith("## ")) {
      if (current.lines.length > 0 || current.heading !== null) {
        sections.push({
          heading: current.heading,
          body: current.lines.join("\n").trim(),
        });
      }
      current = { heading: line.slice(3).trim(), lines: [] };
    } else {
      current.lines.push(line);
    }
  }
  if (current.lines.length > 0 || current.heading !== null) {
    sections.push({
      heading: current.heading,
      body: current.lines.join("\n").trim(),
    });
  }

  return sections.map((section, idx) => (
    <div key={idx} className={idx > 0 ? "mt-6" : ""}>
      {section.heading && (
        <h5 className="mb-2 font-sans text-sm font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
          {section.heading}
        </h5>
      )}
      {section.body && (
        <div className="space-y-0">{renderMarkdownBody(section.body)}</div>
      )}
    </div>
  ));
}

// ---- Tier badge ---------------------------------------------------------

function TierBadge({
  tier,
  locked,
}: {
  tier: ContentTier;
  locked: boolean;
}) {
  const label = prettyTier(tier);
  // Locked rows get a "Locked" badge; unlocked but paid rows get the
  // tier name as a quiet badge so partners know what tier the content
  // sits at (and what they'd lose by downgrading).
  return (
    <span
      className={
        "font-sans text-xs font-medium px-2 py-0.5 rounded " +
        (locked
          ? "bg-[var(--reader-text)] text-[var(--reader-bg)]"
          : "bg-[var(--reader-rule)] text-[var(--reader-muted)]")
      }
    >
      {locked ? `Locked · ${label}` : label}
    </span>
  );
}

// ---- Label helpers ------------------------------------------------------

function labelForSurface(kind: ChapterCommentaryEntry["surface_kind"]): string {
  switch (kind) {
    case "inline":
      return "Basic";
    case "deep_dive":
      return "Deeper Dive";
    case "featured":
      return "Featured";
  }
}

function expanderLabelForSurface(
  kind: ChapterCommentaryEntry["surface_kind"]
): string {
  switch (kind) {
    case "inline":
      return "Read the basic walk →";
    case "deep_dive":
      return "Read the deeper dive →";
    case "featured":
      return "Read →";
  }
}

function ctaCopyForSurface(
  kind: ChapterCommentaryEntry["surface_kind"]
): string {
  switch (kind) {
    case "inline":
      return "A chapter-length framework walk through this chapter — what the inherited reading misses, what the canon actually says, with every scripture quoted in full.";
    case "deep_dive":
      return "A section-by-section deep treatment of this chapter — the framework's deepest reading, with the Tanakh thread sources laid side by side.";
    case "featured":
      return "Featured teaching unit on this chapter.";
  }
}

function prettyTier(tier: ContentTier): string {
  switch (tier) {
    case "free":
      return "Free";
    case "study_notes":
      return "Notes";
    case "extras":
      return "Library";
    case "complete_study":
      return "Complete Study";
    case "everything":
      return "Everything";
  }
}

function priceForTier(tier: ContentTier): string {
  switch (tier) {
    case "free":
      return "free";
    case "study_notes":
      return "$1.99/mo";
    case "extras":
      return "$4.99/mo";
    case "complete_study":
      return "$9.99/mo";
    case "everything":
      return "$14.99/mo";
  }
}
