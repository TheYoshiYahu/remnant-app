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
  /**
   * S130 — navigation callback fired when the reader clicks a
   * cross-reference target. Receives the target book/chapter/verse.
   * Locked refs (target tier > user tier) instead route to /pricing
   * inside this component so the upgrade prompt fires uniformly.
   */
  onNavigate?: (
    bookSlug: string,
    chapterNumber: number,
    verseNumber: number
  ) => void;
}

export default function ChapterEndCard({
  bookSlug,
  chapterNumber,
  userTier = "free",
  onNavigate,
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
      {/*
        S130 — section header recolored to techelet (#1A6FE5) per
        COLOR_PALETTE.md §9 cross-reference color scheme. Header carries
        the divine-name register because it marks scriptural-citation
        territory; per-ref labels below carry source-type registers
        (OT emerald / NT gold / extras argaman).
      */}
      <h3
        id="chapter-end-card-title"
        className="mb-4 font-sans text-xs font-semibold uppercase tracking-wide text-[#1A6FE5]"
      >
        Cross-References in {data.book.title} {data.chapter.number}
      </h3>

      {data.baseline.length > 0 && (
        <div className="mb-6">
          <BaselineList
            entries={data.baseline}
            userTier={userTier}
            onNavigate={onNavigate}
          />
        </div>
      )}

      {data.threads.length > 0 && (
        <div className="space-y-6">
          {data.threads.map((t) => (
            <ThreadCallout
              key={t.slug}
              thread={t}
              userTier={userTier}
              onNavigate={onNavigate}
            />
          ))}
        </div>
      )}
    </section>
  );
}

// ---- S130: source-type classifier for color routing ---------------------
//
// Per COLOR_PALETTE.md §9, cross-reference labels render in a color tied
// to the target book's source class. The reader scans the card and learns
// the framework's source-architecture at a glance: green = Tanakh, gold =
// NT, argaman = extra-canonical. Header is techelet (separate register).
//
// NT_BOOK_SLUGS + OT_BOOK_SLUGS are explicit allowlists; anything else
// is treated as extras (1 Enoch, Jubilees, Jasher, Apocrypha individual
// books, Adam & Eve Conflict, Apocalypse of Abraham, Sonnini Acts 29,
// plus any future extras-tier corpus addition).

const NT_BOOK_SLUGS = new Set<string>([
  "matthew", "mark", "luke", "john", "acts",
  "romans", "1-corinthians", "2-corinthians", "galatians", "ephesians",
  "philippians", "colossians", "1-thessalonians", "2-thessalonians",
  "1-timothy", "2-timothy", "titus", "philemon", "hebrews", "james",
  "1-peter", "2-peter", "1-john", "2-john", "3-john", "jude", "revelation",
]);

const OT_BOOK_SLUGS = new Set<string>([
  "genesis", "exodus", "leviticus", "numbers", "deuteronomy",
  "joshua", "judges", "ruth", "1-samuel", "2-samuel",
  "1-kings", "2-kings", "1-chronicles", "2-chronicles",
  "ezra", "nehemiah", "esther", "job", "psalms", "proverbs",
  "ecclesiastes", "song-of-solomon", "isaiah", "jeremiah",
  "lamentations", "ezekiel", "daniel", "hosea", "joel", "amos",
  "obadiah", "jonah", "micah", "nahum", "habakkuk", "zephaniah",
  "haggai", "zechariah", "malachi",
]);

type SourceClass = "tanakh" | "nt" | "extras";

function classifyBookSlug(slug: string): SourceClass {
  if (OT_BOOK_SLUGS.has(slug)) return "tanakh";
  if (NT_BOOK_SLUGS.has(slug)) return "nt";
  return "extras";
}

function colorForSourceClass(cls: SourceClass): string {
  // Hex values mirror COLOR_PALETTE.md §9. Keep in sync if either side
  // moves. The midtones (#15A86A, #B4A078) are picked so the labels read
  // cleanly at body-text scale on the dark reader pane.
  switch (cls) {
    case "tanakh": return "#15A86A";  // bracket-emerald midtone
    case "nt":     return "#B4A078";  // brand-mark gold midtone
    case "extras": return "#8E4FB3";  // argaman
  }
}

// ---- Baseline ------------------------------------------------------------

function BaselineList({
  entries,
  userTier,
  onNavigate,
}: {
  entries: ChapterEndCardResponse["baseline"];
  userTier: ContentTier;
  onNavigate?: (b: string, c: number, v: number) => void;
}) {
  return (
    <ul className="space-y-3">
      {entries.map((entry) => (
        <li key={entry.source_verse.verse_number}>
          <div className="text-[var(--reader-text)]">
            {/*
              S130 — source-verse group label in spectral blue
              (--reader-accent, #0084FF), matching the in-body verse
              numbers per COLOR_PALETTE.md §2. Functional consistency:
              spectral blue = "verse-number pointer" everywhere it
              appears, body and chrome.
            */}
            <span className="font-sans text-xs font-semibold text-[var(--reader-accent)]">
              Verse {entry.source_verse.verse_number}
            </span>
          </div>
          <ul className="mt-1 ml-3 space-y-1 text-[var(--reader-text)]">
            {entry.targets.map((tgt) => {
              const locked = !tierSatisfies(userTier, tgt.tier_required);
              const cls = classifyBookSlug(tgt.book_slug);
              const labelColor = colorForSourceClass(cls);
              return (
                <li
                  key={`${tgt.verse_id}-${tgt.source}`}
                  className={"flex gap-2 " + (locked ? "opacity-40" : "")}
                >
                  <span className="font-sans text-xs text-[var(--reader-muted)]">
                    →
                  </span>
                  <span>
                    {/*
                      S130 — clickable ref. Unlocked refs navigate via the
                      onNavigate callback; locked refs route to /pricing
                      so the upgrade prompt fires uniformly. The ref label
                      color carries the source-type register per
                      COLOR_PALETTE.md §9.
                    */}
                    <button
                      type="button"
                      onClick={() => {
                        if (locked) {
                          if (typeof window !== "undefined") {
                            window.location.href = "/pricing";
                          }
                          return;
                        }
                        onNavigate?.(
                          tgt.book_slug,
                          tgt.chapter_number,
                          tgt.verse_number
                        );
                      }}
                      title={
                        locked
                          ? `Unlock with ${prettyTier(tgt.tier_required)}`
                          : `Go to ${prettyRef(tgt.book_slug, tgt.chapter_number, tgt.verse_number)}`
                      }
                      className="font-sans text-xs font-semibold underline-offset-2 hover:underline"
                      style={{ color: labelColor }}
                    >
                      {prettyRef(
                        tgt.book_slug,
                        tgt.chapter_number,
                        tgt.verse_number
                      )}
                    </button>{" "}
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
  onNavigate,
}: {
  thread: ChapterEndCardResponse["threads"][number];
  userTier: ContentTier;
  onNavigate?: (b: string, c: number, v: number) => void;
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
        <h4 className="text-lg font-semibold text-[var(--reader-text)]">
          {thread.title}
        </h4>
        {thread.anchor && (
          <p className="mt-0.5 font-sans text-xs text-[var(--reader-accent)]">
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

      <div className="prose-paragraphs leading-relaxed text-[var(--reader-text)]">
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
            className="mt-2 font-sans text-xs font-medium text-[#15A86A] underline-offset-2 hover:underline"
          >
            {expanded ? "Show less" : "Show more"}
          </button>
        )}
      </div>

      {thread.members_in_chapter.length > 0 && (
        <div className="mt-4 border-t border-[var(--reader-rule)] pt-3">
          <p className="mb-2 font-sans text-xs font-semibold uppercase tracking-wide text-[#1A6FE5]">
            Cross-references in this chapter
          </p>
          <ul className="space-y-1 text-[var(--reader-text)]">
            {thread.members_in_chapter.map((m) => (
              <ThreadMemberRow
                key={`${m.sort_order}-${m.source_verse_number}`}
                member={m}
                onNavigate={onNavigate}
              />
            ))}
          </ul>
        </div>
      )}
    </article>
  );
}

function ThreadMemberRow({
  member,
  onNavigate,
}: {
  member: ThreadMember;
  onNavigate?: (b: string, c: number, v: number) => void;
}) {
  // S130 — color the target-verse ref by its source class per
  // COLOR_PALETTE.md §9, and make it clickable. Members don't carry a
  // separate tier_required in the current API shape; thread-level
  // gating already greys the parent article when locked, so clicking
  // a member ref inside a visible (unlocked) thread navigates straight.
  const cls = classifyBookSlug(member.target.book_slug);
  const labelColor = colorForSourceClass(cls);
  return (
    <li className="flex flex-wrap gap-x-2">
      <span className="font-sans text-xs text-[var(--reader-muted)]">→</span>
      <span className="font-sans text-xs font-semibold text-[var(--reader-accent)]">
        Verse {member.source_verse_number}
      </span>
      <span className="font-sans text-xs text-[var(--reader-muted)]">→</span>
      <button
        type="button"
        onClick={() => {
          onNavigate?.(
            member.target.book_slug,
            member.target.chapter_number,
            member.target.verse_number
          );
        }}
        title={`Go to ${prettyRef(member.target.book_slug, member.target.chapter_number, member.target.verse_number)}`}
        className="font-sans text-xs font-semibold underline-offset-2 hover:underline"
        style={{ color: labelColor }}
      >
        {prettyRef(
          member.target.book_slug,
          member.target.chapter_number,
          member.target.verse_number
        )}
      </button>
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
