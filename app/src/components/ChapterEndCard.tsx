/**
 * ChapterEndCard — Session 74 wheel deliverable.
 *
 * Renders the chapter-end cross-reference card per
 * api/CHAPTER_END_CARD_CONTRACT.md. Mounted by the Reader after the
 * last verse and before the next-chapter navigation. Hides itself
 * entirely when both baseline and threads come back empty (the
 * expected state for any chapter the curated apparatus hasn't
 * reached yet). Every cross_references row is a curated framework-
 * bearing call; the TSK comprehensive-baseline direction rolled back
 * at Session 75.
 *
 * Layer 1 — per-verse cross-references. One block per verse in the
 * rendered chapter that has at least one curated cross-reference
 * target, with the source verse preview, followed by an indented
 * list of target verses (book chapter:verse — preview).
 *
 * Layer 2 — framework threads. One callout per thread surfacing in
 * this chapter, with the thread title, the summary_md rendered as
 * prose (first paragraph by default, "show more" reveals the rest),
 * and the in-chapter members listed as source-verse / target-verse
 * pairs with per-member notes.
 *
 * Tier-locked rendering: any row whose tier_required exceeds the
 * caller's tier renders greyed-out with an "Unlock with [tier]"
 * tooltip. Dormant at v1 (every curated row is free-tier).
 *
 * Markdown: summary_md is rendered through `renderSummaryMd` —
 * paragraph splitting on `\n\n`, single-line breaks on `\n`, and
 * `*italic*` for scripture quotations. Sacred names are already
 * fully restored with parentheticals in the seed data, so they
 * render as plain inline text.
 */

import { useEffect, useState, type ReactNode } from "react";
import {
  type ChapterEndCardResponse,
  type ContentTier,
  type ThreadMember,
  getChapterCrossReferences,
} from "../lib/api";

interface ChapterEndCardProps {
  bookSlug: string;
  chapterNumber: number;
  /** The caller's tier — used to grey out locked rows. */
  userTier?: ContentTier;
}

export default function ChapterEndCard({
  bookSlug,
  chapterNumber,
  userTier = "free",
}: ChapterEndCardProps) {
  const [data, setData] = useState<ChapterEndCardResponse | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  // Errors are silent — the card is a non-essential overlay. A failure
  // to load just leaves the chapter rendering without the card.
  const [, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    setData(null);
    setLoading(true);
    setError(null);
    getChapterCrossReferences(bookSlug, chapterNumber)
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

  // Silent on loading / error / no-data — the card is a quiet overlay,
  // not load-bearing chrome. The reader gets the chapter regardless.
  if (loading || !data) return null;
  if (data.baseline.length === 0 && data.threads.length === 0) return null;

  return (
    <section
      className="mt-10 border-t border-[var(--reader-rule)] pt-6"
      aria-labelledby="chapter-end-card-title"
    >
      <h3
        id="chapter-end-card-title"
        className="mb-4 font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]"
      >
        Tanakh Sources for {data.book.title} {data.chapter.number}
      </h3>

      {data.baseline.length > 0 && (
        <div className="mb-6">
          <BaselineList entries={data.baseline} userTier={userTier} />
        </div>
      )}

      {data.threads.length > 0 && (
        <div className="space-y-6">
          {data.threads.map((t) => (
            <ThreadCallout key={t.slug} thread={t} userTier={userTier} />
          ))}
        </div>
      )}
    </section>
  );
}

// ---- Baseline ------------------------------------------------------------

function BaselineList({
  entries,
  userTier,
}: {
  entries: ChapterEndCardResponse["baseline"];
  userTier: ContentTier;
}) {
  return (
    <ul className="space-y-3 text-sm">
      {entries.map((entry) => (
        <li key={entry.source_verse.verse_number}>
          <div className="text-[var(--reader-text)]">
            <span className="font-sans text-xs font-semibold text-[var(--reader-muted)]">
              Verse {entry.source_verse.verse_number}
            </span>
          </div>
          <ul className="mt-1 ml-3 space-y-1 text-[var(--reader-text)]">
            {entry.targets.map((tgt) => {
              const locked = !tierSatisfies(userTier, tgt.tier_required);
              return (
                <li
                  key={`${tgt.verse_id}-${tgt.source}`}
                  className={
                    "flex gap-2 " +
                    (locked ? "opacity-40" : "")
                  }
                  title={
                    locked
                      ? `Unlock with ${prettyTier(tgt.tier_required)}`
                      : undefined
                  }
                >
                  <span className="font-sans text-xs text-[var(--reader-muted)]">
                    →
                  </span>
                  <span>
                    <span className="font-sans text-xs font-semibold text-[var(--reader-muted)]">
                      {prettyRef(
                        tgt.book_slug,
                        tgt.chapter_number,
                        tgt.verse_number
                      )}
                    </span>{" "}
                    <span className="italic">{tgt.preview}</span>
                  </span>
                </li>
              );
            })}
          </ul>
        </li>
      ))}
    </ul>
  );
}

// ---- Thread callout ------------------------------------------------------

function ThreadCallout({
  thread,
  userTier,
}: {
  thread: ChapterEndCardResponse["threads"][number];
  userTier: ContentTier;
}) {
  const [expanded, setExpanded] = useState<boolean>(false);
  const paragraphs = thread.summary_md.split(/\n{2,}/);
  const firstParagraph = paragraphs[0];
  const rest = paragraphs.slice(1);
  const locked = !tierSatisfies(userTier, thread.tier_required);

  return (
    <article
      className={
        "rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4 " +
        (locked ? "opacity-50" : "")
      }
      title={locked ? `Unlock with ${prettyTier(thread.tier_required)}` : undefined}
    >
      <header className="mb-2">
        <h4 className="text-base font-semibold text-[var(--reader-text)]">
          {thread.title}
        </h4>
        {thread.anchor && (
          <p className="mt-0.5 font-sans text-xs text-[var(--reader-muted)]">
            Anchor:{" "}
            {prettyRef(
              thread.anchor.book_slug,
              thread.anchor.chapter_number,
              thread.anchor.verse_start
            )}
            {thread.anchor.verse_end !== thread.anchor.verse_start &&
              `–${thread.anchor.verse_end}`}
          </p>
        )}
      </header>

      <div className="prose-paragraphs text-sm leading-relaxed text-[var(--reader-text)]">
        {renderMarkdownParagraph(firstParagraph)}
        {rest.length > 0 && expanded && (
          <>
            {rest.map((p, i) => (
              <div key={i} className="mt-2">
                {renderMarkdownParagraph(p)}
              </div>
            ))}
          </>
        )}
        {rest.length > 0 && (
          <button
            type="button"
            onClick={() => setExpanded((v) => !v)}
            className="mt-2 font-sans text-xs font-medium text-[var(--reader-muted)] underline-offset-2 hover:underline"
          >
            {expanded ? "Show less" : "Show more"}
          </button>
        )}
      </div>

      {thread.members_in_chapter.length > 0 && (
        <div className="mt-4 border-t border-[var(--reader-rule)] pt-3">
          <p className="mb-2 font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            Cross-references in this chapter
          </p>
          <ul className="space-y-1 text-sm text-[var(--reader-text)]">
            {thread.members_in_chapter.map((m) => (
              <ThreadMemberRow key={`${m.sort_order}-${m.source_verse_number}`} member={m} />
            ))}
          </ul>
        </div>
      )}
    </article>
  );
}

function ThreadMemberRow({ member }: { member: ThreadMember }) {
  return (
    <li className="flex flex-wrap gap-x-2">
      <span className="font-sans text-xs text-[var(--reader-muted)]">→</span>
      <span className="font-sans text-xs font-semibold text-[var(--reader-muted)]">
        Verse {member.source_verse_number}
      </span>
      <span className="font-sans text-xs text-[var(--reader-muted)]">→</span>
      <span className="font-sans text-xs font-semibold text-[var(--reader-muted)]">
        {prettyRef(
          member.target.book_slug,
          member.target.chapter_number,
          member.target.verse_number
        )}
      </span>
      <span className="basis-full italic ml-5 text-[var(--reader-text)]">
        {member.target.preview}
      </span>
      {member.member_note && (
        <span className="basis-full ml-5 font-sans text-xs text-[var(--reader-muted)]">
          {member.member_note}
        </span>
      )}
    </li>
  );
}

// ---- Helpers -------------------------------------------------------------

/**
 * Render one summary_md paragraph: `*italic*` spans + `\n` single-line
 * breaks. Sacred names already carry parentheticals — they render as
 * inline text with no special treatment, which is exactly what the
 * contract calls for.
 */
function renderMarkdownParagraph(paragraph: string): ReactNode {
  // Split by lines first to honor single `\n` as a soft line break.
  const lines = paragraph.split("\n");
  return lines.map((line, lineIdx) => (
    <span key={lineIdx}>
      {renderItalicSpans(line)}
      {lineIdx < lines.length - 1 && <br />}
    </span>
  ));
}

function renderItalicSpans(line: string): ReactNode[] {
  // Simple `*...*` italic. No nested markdown.
  const parts: ReactNode[] = [];
  const re = /\*([^*]+)\*/g;
  let lastIdx = 0;
  let key = 0;
  let m: RegExpExecArray | null;
  while ((m = re.exec(line)) !== null) {
    if (m.index > lastIdx) {
      parts.push(<span key={key++}>{line.slice(lastIdx, m.index)}</span>);
    }
    parts.push(<em key={key++}>{m[1]}</em>);
    lastIdx = m.index + m[0].length;
  }
  if (lastIdx < line.length) {
    parts.push(<span key={key++}>{line.slice(lastIdx)}</span>);
  }
  return parts;
}

function prettyRef(
  bookSlug: string,
  chapter: number,
  verse: number
): string {
  return `${prettyBookSlug(bookSlug)} ${chapter}:${verse}`;
}

function prettyBookSlug(slug: string): string {
  // Title-case a slug for display. "2-corinthians" -> "2 Corinthians".
  return slug
    .split("-")
    .map((part) =>
      /^\d+$/.test(part) ? part : part.charAt(0).toUpperCase() + part.slice(1)
    )
    .join(" ");
}

function prettyTier(tier: ContentTier): string {
  switch (tier) {
    case "free":
      return "Free";
    case "study_notes":
      return "Notes";
    case "extras":
      return "Extras";
    case "complete_study":
      return "Complete Study";
    case "everything":
      return "Everything";
  }
}

/**
 * Mirror the SQL `tier_satisfies(user_tier, required_tier)` lattice
 * on the client side so we can grey-out locked rows without a
 * round-trip. Strict chain — every paid tier inherits everything below
 * it. Anonymous callers map to `free` upstream.
 */
function tierSatisfies(userTier: ContentTier, required: ContentTier): boolean {
  const rank: Record<ContentTier, number> = {
    free: 0,
    study_notes: 1,
    extras: 2,
    complete_study: 3,
    everything: 4,
  };
  return rank[userTier] >= rank[required];
}
