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
 * over the wire and an "Unlock in [Tier] tier" CTA shows instead (S140
 * tier-name overhaul — Study Notes / Library / Companion / Scribe).
 *
 * Hide-commentary toggle: a global "Hide commentary" toggle persists
 * per-user via localStorage so a partner who wants to read straight
 * verses without commentary chrome can switch it off and have that
 * preference remembered. Off by default — the study Bible looks naked
 * without commentary, and free users need to see the value lattice.
 *
 * S129 — additive-expand fix. The bug: expanding a paid-tier block
 * re-renders the same opening paragraphs the partner just read in the
 * free chapter_intro (and again from Basic when Deeper Dive expands).
 * The fix matches the website's SoF `.sof-deeper` / `.sof-long` pattern
 * where expand reveals the next paragraphs below what's already on
 * screen, additive only — no re-render of the prior layer:
 *
 *   1. Switch the expander chrome from button+state to a native
 *      <details>/<summary> element, mirroring the SoF semantic pattern
 *      one-for-one. The DOM is genuinely additive — collapsed = only
 *      the <summary> exists, expanded = <summary> + body unfold below.
 *
 *   2. The renderer always strips a leading H1 (`# File Title` line at
 *      the top of matt-N-short.md / matt-N.md) — that's a file-level
 *      header, not reader content. Already-shipped sources carry an H1;
 *      stripping it at render time leaves the source unchanged.
 *
 *   3. Source markdown may opt into truly-additive expand by including
 *      a marker line `<!-- additive-from-here -->` somewhere in the
 *      body. The renderer splits on the marker and renders only the
 *      portion AFTER it. Bodies without the marker render unchanged
 *      (backward-compatible) — the content team adds markers chapter
 *      by chapter as bodies get re-shaped to "what's NEW beyond the
 *      prior layer." Marker is on its own line; trimmed both sides.
 */

import { useEffect, useState, type ReactNode } from "react";
import {
  type ChapterCommentaryEntry,
  type ChapterCommentaryResponse,
  type ContentTier,
  getChapterCommentary,
} from "../lib/api";
import { readThrough } from "../lib/contentCache";
import { renderMarkdownBody } from "../lib/markdown";
import { applyParentheticalsToggle } from "../lib/useParentheticalsToggle";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "../lib/applySacredNameMask";

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
  /**
   * S144 — parentheticals-hide toggle state, owned by App.tsx and
   * passed down so a single click in the chrome flips the strip for
   * every reader surface in one render. When `true`, the strip applies
   * to every commentary entry body (Basic / Deeper Dive / Featured)
   * before it reaches the markdown renderer; when `false` (default),
   * bodies render with the parentheticals intact.
   */
  hideParentheticals?: boolean;
  /**
   * S172 — sacred-name display mask. Independent of hideParentheticals
   * above. When `"yhwh"`, every commentary entry body has its
   * "Yahuah" substituted with "YHWH" before reaching the markdown
   * renderer; when `"yahuah"` (default), bodies render with the
   * restored name. Composes with hideParentheticals — the four valid
   * combinations are documented in S172_SACRED_NAME_MASK_SPEC.md.
   */
  sacredNameMask?: SacredNameMask;
}

// S130 — the hide-commentary toggle moved up to App.tsx and now gates
// chapter_intro + this stack + the chapter-end cross-reference card
// together (one button, two states). This component no longer owns the
// toggle state or button — App.tsx omits the component entirely when
// the toggle is off.

export default function ChapterCommentary({
  bookSlug,
  chapterNumber,
  hideParentheticals = false,
  sacredNameMask = "yahuah",
}: ChapterCommentaryProps) {
  const [data, setData] = useState<ChapterCommentaryResponse | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  // Errors are silent — a missing commentary surface isn't load-bearing
  // for the verse read. We just hide the component on failure.
  const [, setError] = useState<string | null>(null);

  useEffect(() => {
    setData(null);
    setLoading(true);
    setError(null);
    // Read-through cache (stale-while-revalidate): a revisited chapter's
    // commentary stack paints from IndexedDB instantly, then revalidates.
    const handle = readThrough(
      { layer: "commentary", book: bookSlug, chapter: chapterNumber },
      () => getChapterCommentary(bookSlug, chapterNumber),
      {
        onData: (r) => {
          setData(r);
          setLoading(false);
        },
        onError: (e) => {
          setError(String(e));
          setLoading(false);
        },
      },
    );
    return () => handle.cancel();
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
      {/*
        S201 — section header recolored from techelet #1A6FE5 to spectral
        blue (var(--reader-accent)). Techelet is divine-names-only (S127 §3
        lock); chrome headers carry the spectral-blue apparatus register,
        matching the "Cross-References in X" header in ChapterEndCard.
      */}
      <h3
        id="chapter-commentary-title"
        className="mb-4 font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-accent)]"
      >
        More on {data.book.title} {data.chapter.number}
      </h3>
      <div className="space-y-4">
        {data.entries.map((entry) => (
          <CommentaryBlock
            key={entry.id}
            entry={entry}
            hideParentheticals={hideParentheticals}
            sacredNameMask={sacredNameMask}
          />
        ))}
      </div>
    </section>
  );
}

// ---- One commentary block (Basic / Deeper Dive / Featured) --------------

function CommentaryBlock({
  entry,
  hideParentheticals,
  sacredNameMask,
}: {
  entry: ChapterCommentaryEntry;
  hideParentheticals: boolean;
  sacredNameMask: SacredNameMask;
}) {
  const headerLabel = entry.title || labelForSurface(entry.surface_kind);
  const expanderLabel = expanderLabelForSurface(entry.surface_kind);
  const collapseLabel = collapseLabelForSurface(entry.surface_kind);

  // Locked state — eye-catching upgrade affordance (Yoshi's pattern A,
  // Session 112). Header visible with the tier badge, body is a styled
  // CTA card with a clear "Unlock in [Tier] tier" call to action (S140).
  if (entry.locked) {
    return (
      <article className="rounded-lg border border-dashed border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
        <header className="mb-2 flex flex-wrap items-baseline justify-between gap-2">
          <h4 className="text-lg font-semibold text-[var(--reader-text)]">
            {headerLabel}
          </h4>
          <TierBadge tier={entry.tier_required} locked />
        </header>
        <div className="mt-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-bg,#fafafa)] p-4 text-center">
          <p className="mb-3 text-base text-[var(--reader-text)]">
            {ctaCopyForSurface(entry.surface_kind)}
          </p>
          <a
            href="/pricing"
            className="inline-block rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Unlock in {prettyTier(entry.tier_required)} tier
          </a>
        </div>
      </article>
    );
  }

  // S129 — additive-expand. Pre-process the body before render:
  //   (1) strip leading `# File Title` H1 — file-level header, not
  //       reader content
  //   (2) if a `<!-- additive-from-here -->` marker exists, slice the
  //       body to keep only what's after the marker — the "additive
  //       extension" the partner hasn't already read above
  //
  // Bodies without the marker render unchanged (current behavior), so
  // existing chapters keep working until their sources are re-shaped.
  // Returns null when the post-processing leaves nothing to render
  // (e.g., a body that's just a stripped H1) so we hide the surface
  // gracefully instead of showing an empty expander.
  const renderableBody = entry.body ? prepareAdditiveBody(entry.body) : null;
  if (!renderableBody) {
    // Body absent or post-processing left nothing meaningful — hide
    // the whole block rather than render an empty expander.
    return null;
  }

  // Unlocked state — collapsible body inside a native <details>/<summary>
  // element. This mirrors the website's SoF `.sof-deeper` / `.sof-long`
  // chrome one-for-one: collapsed = only the <summary> is in the DOM;
  // expanded = the body unfolds BELOW the <summary>, additive (no React
  // state, no re-render of any prior layer above). Default-collapsed for
  // paid surfaces so a partner who just wants to read verses isn't
  // immediately scrolled into 12k-word commentary.
  return (
    <article className="rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
      <header className="mb-2 flex flex-wrap items-baseline justify-between gap-2">
        <h4 className="text-base font-semibold text-[var(--reader-text)]">
          {headerLabel}
        </h4>
        <TierBadge tier={entry.tier_required} locked={false} />
      </header>
      <details className="commentary-deeper group">
        {/*
          S130 — metallic-emerald button styling per Yoshi's call. The
          bright-emerald gradient documented in DESIGN_LANGUAGE.md §6
          (divine-speech bracket palette: #04321E → #15A86A → #2EFFA1)
          carries the "this is the next layer" affordance with the
          eye-catching weight Yoshi asked for. Dark base, lighter mid,
          dark return — reads as a metallic sweep against the pure-black
          reader pane. Reduces opacity slightly on hover for the press
          feel; flips to a quieter muted-text "Close" affordance when
          open so the open state doesn't compete with the body it just
          revealed.
        */}
        <summary className="cursor-pointer list-none marker:hidden">
          <span
            className="group-open:hidden inline-block rounded-md border border-[#2EFFA1] bg-gradient-to-r from-[#04321E] via-[#15A86A] to-[#04321E] px-4 py-2 font-sans text-sm font-semibold text-[#E6FFF2] shadow-md hover:opacity-90"
          >
            {expanderLabel}
          </span>
          <span className="hidden group-open:inline font-sans text-sm font-medium text-[#15A86A] underline-offset-2 hover:underline">
            {collapseLabel}
          </span>
        </summary>
        <div className="prose-paragraphs mt-2 leading-relaxed text-[var(--reader-text)] space-y-0">
          {/*
            S144 — apply the parentheticals-strip toggle to the body
            before passing to renderCommentaryBody. The body still gets
            split on H2 sub-headings (`## §N. Title`) by renderCommentary-
            Body; stripping at this layer (whole body) is correct because
            sub-heading text and section text both carry restored Sacred
            Names that should toggle together.
          */}
          {renderCommentaryBody(
            applyParentheticalsToggle(
              applySacredNameMask(renderableBody, sacredNameMask),
              hideParentheticals
            )
          )}
        </div>
      </details>
    </article>
  );
}

// ---- S129 additive-expand pre-processor ---------------------------------

/**
 * Marker that opts a commentary body into truly-additive expand. When
 * present on its own line in the source markdown, the renderer drops
 * everything above the marker and renders only what follows — the
 * "additive extension" the partner hasn't already read in the layer
 * immediately above (chapter_intro for Basic; chapter_intro + Basic for
 * Deeper Dive). Bodies without the marker render unchanged.
 *
 * Convention: the marker goes on a line by itself, after the recap
 * paragraphs the source author would otherwise repeat from the prior
 * layer. The marker line is consumed by the splitter; surrounding blank
 * lines collapse cleanly. Example:
 *
 *     # Short-form commentary on Matthew 1
 *
 *     Matthew opens the canon with seventeen verses of names...
 *     [recap paragraphs that overlap with chapter_intro]
 *
 *     <!-- additive-from-here -->
 *
 *     [new paragraphs the partner hasn't read above]
 */
const ADDITIVE_MARKER = "<!-- additive-from-here -->";

/**
 * Pre-process a commentary body for additive render:
 *   1. Drop a leading `# File Title` H1 (and the blank line following).
 *      File-level headers — not reader content.
 *   2. If ADDITIVE_MARKER is present, slice off everything above it
 *      (inclusive) and return the additive tail.
 *
 * Returns null when post-processing leaves the body empty or
 * whitespace-only, so the caller can skip rendering an empty surface.
 */
function prepareAdditiveBody(body: string): string | null {
  if (!body) return null;
  let work = body;

  // (1) Strip leading H1. Tolerate optional leading whitespace / BOM.
  // Only the very first non-blank line is considered — a `# foo` later
  // in the body is a real H1 the author placed inline and we leave
  // alone (the matt-N.md sections use ## for §-headings, never #).
  const leadingH1 = /^\s*#\s+[^\n]*\n+/;
  work = work.replace(leadingH1, "");

  // (2) If the additive marker is present, slice to its right.
  const markerIdx = work.indexOf(ADDITIVE_MARKER);
  if (markerIdx >= 0) {
    work = work.slice(markerIdx + ADDITIVE_MARKER.length);
  }

  work = work.trim();
  return work.length > 0 ? work : null;
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
        <h5 className="mb-2 font-sans text-sm font-semibold uppercase tracking-wide text-[var(--reader-accent)]">
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

// S129 — paired collapse-state label for the SoF-style <summary>. The
// SoF chrome shows two strings, one when closed and one when open,
// switched via group-open: visibility classes. Same shape here.
function collapseLabelForSurface(
  kind: ChapterCommentaryEntry["surface_kind"]
): string {
  switch (kind) {
    case "inline":
      return "Close the basic walk";
    case "deep_dive":
      return "Close the deeper dive";
    case "featured":
      return "Close";
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
  // Display names per S140 tier-name overhaul. Backend slugs unchanged;
  // every reader-facing surface uses these strings + the
  // "Unlock in [Name] tier" CTA pattern (no prices outside Pricing.tsx).
  switch (tier) {
    case "free":
      return "Free";
    case "study_notes":
      return "Study Notes";
    case "extras":
      return "Library";
    case "complete_study":
      return "Companion";
    case "everything":
      return "Scribe";
  }
}

// priceForTier removed at S140 — every reader-facing CTA now uses
// "Unlock in [Name] tier" without the price. The Pricing page is the
// one surface that lists prices.
