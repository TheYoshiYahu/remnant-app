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
 * Tier-locked rendering (S140 — Option C):
 *   - Baseline rows: target verse renders at 40% opacity with an
 *     "Unlock in [Name] tier" tooltip; click routes to /pricing.
 *   - Thread callouts: title + anchor + ~70-word teaser of summary_md
 *     with a fade-to-surface gradient over the bottom of the teaser,
 *     a locked-count line ("Full summary + N verse pairings in this
 *     chapter"), and a single "Unlock in [Name] tier" CTA. Members
 *     hidden. The free reader is pulled into the start of a framework-
 *     bearing reading and stopped at the gate. Replaces the prior
 *     greyed-out-but-readable policy locked at S73 in the contract.
 *
 * Markdown: summary_md is rendered through `renderSummaryMd` —
 * paragraph splitting on `\n\n`, single-line breaks on `\n`, and
 * `*italic*` for scripture quotations. Sacred names are already
 * fully restored with parentheticals in the seed data, so they
 * render as plain inline text.
 */

import { useEffect, useRef, useState, type ReactNode } from "react";
import {
  type ChapterEndCardResponse,
  type ContentTier,
  type ThreadMember,
  getChapterCrossReferences,
} from "../lib/api";
import { applyParentheticalsToggle } from "../lib/useParentheticalsToggle";
import {
  applySacredNameMask,
  type SacredNameMask,
} from "../lib/applySacredNameMask";
import { executeStudyShare } from "../lib/study-share-render";

// S172 — sacred-name mask + parens-toggle composition. Every render
// site that previously called applyParentheticalsToggle(text, hide)
// now calls applyTextPrefs(text, hide, mask) to layer the mask on
// before the parens strip. Pure helper; no React, no DOM.
function applyTextPrefs(
  text: string,
  hide: boolean,
  mask: SacredNameMask
): string {
  return applyParentheticalsToggle(applySacredNameMask(text, mask), hide);
}

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
  /**
   * S144 — parentheticals-hide toggle state, owned by App.tsx and
   * passed down. When `true`, every text surface in this card (baseline
   * target previews, thread summary_md paragraphs, thread member-row
   * previews and notes) has the English-form parentheticals after
   * restored Sacred Names stripped at render time. Default `false`.
   */
  hideParentheticals?: boolean;
  /**
   * S172 — sacred-name display mask. Independent of hideParentheticals
   * above; composes freely. When `"yhwh"`, every text surface in the
   * card has Yahuah substituted with YHWH before render. Default
   * `"yahuah"`.
   */
  sacredNameMask?: SacredNameMask;
}

export default function ChapterEndCard({
  bookSlug,
  chapterNumber,
  userTier = "free",
  onNavigate,
  hideParentheticals = false,
  sacredNameMask = "yahuah",
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
            bookSlug={bookSlug}
            chapterNumber={chapterNumber}
            userTier={userTier}
            onNavigate={onNavigate}
            hideParentheticals={hideParentheticals}
            sacredNameMask={sacredNameMask}
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
              hideParentheticals={hideParentheticals}
              sacredNameMask={sacredNameMask}
            />
          ))}
        </div>
      )}
    </section>
  );
}

// ---- S171 §17 — XrefShareButton (shared chrome) -------------------------
//
// Right-aligned Share pill matching the §30 V1 metallic-gold register
// (border #FCECAF + gold gradient + cream text per StrongsLookup S170
// walk-5). Carries `data-export-suppress` so the button itself never
// appears in the exported PNG (the cloned subtree drops every node with
// that attribute before html2canvas captures it). `disabled` is true while
// a share is in flight to prevent double-fire.
//
// The button is the SAME render across baseline blocks and thread
// callouts so partners learn one Share affordance across both layers.

function XrefShareButton({
  sharing,
  onClick,
  label,
}: {
  sharing: boolean;
  onClick: () => void;
  label: string;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={sharing}
      aria-label={label}
      title={label}
      className="rounded-md border border-[#FCECAF] bg-gradient-to-r from-[#645028] via-[#B4A078] to-[#645028] px-2.5 py-0.5 font-sans text-[10px] font-semibold uppercase tracking-wide text-[#FFF8E1] shadow-sm hover:opacity-90 disabled:opacity-40"
      data-export-suppress
    >
      {sharing ? "…" : "Share"}
    </button>
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

// S130 follow-up — every cross-reference target ref renders as a
// metallic mini-pill in its source-class register. Three parallel
// gradients, each with deep / midtone / deep linear sweep + a bright
// highlight border + pale near-white text in the register's color
// family. Same architectural treatment as the §3 expander buttons,
// scaled down for inline use. Yoshi's S130 call: "create the same
// type of metalic gold for the other ones and metalic purple for
// future tiers."
//
// Color sources per COLOR_PALETTE.md:
//   Tanakh  — §3 expansion-register bracket-emerald gradient
//             (#04321E → #15A86A → #04321E, border #2EFFA1)
//   NT      — §1 priestly-witness gold sampled from v4 brand-mark
//             menorahs (#645028 shadow → #B4A078 mid → #645028, border
//             #FCECAF highlight specular)
//   Extras  — §1 covenant-body argaman extended to a metallic gradient
//             (#3D1B5C deep → #8E4FB3 argaman mid → #3D1B5C, border
//             #D4B0E0 lilac from §6 highlight palette as the bright
//             companion tone)
//
function classNameForSourceClass(cls: SourceClass): string {
  const base =
    "inline-block rounded px-2 py-0.5 border shadow-sm hover:opacity-90 ";
  switch (cls) {
    case "tanakh":
      return (
        base +
        "border-[#2EFFA1] bg-gradient-to-r from-[#04321E] via-[#15A86A] to-[#04321E] text-[#E6FFF2]"
      );
    case "nt":
      return (
        base +
        "border-[#FCECAF] bg-gradient-to-r from-[#645028] via-[#B4A078] to-[#645028] text-[#FFF8E1]"
      );
    case "extras":
      return (
        base +
        "border-[#D4B0E0] bg-gradient-to-r from-[#3D1B5C] via-[#8E4FB3] to-[#3D1B5C] text-[#F5E6FA]"
      );
  }
}

// ---- Baseline ------------------------------------------------------------

function BaselineList({
  entries,
  bookSlug,
  chapterNumber,
  userTier,
  onNavigate,
  hideParentheticals,
  sacredNameMask,
}: {
  entries: ChapterEndCardResponse["baseline"];
  bookSlug: string;
  chapterNumber: number;
  userTier: ContentTier;
  onNavigate?: (b: string, c: number, v: number) => void;
  hideParentheticals: boolean;
  sacredNameMask: SacredNameMask;
}) {
  return (
    <ul className="space-y-3">
      {entries.map((entry) => (
        <BaselineEntryBlock
          key={entry.source_verse.verse_number}
          entry={entry}
          bookSlug={bookSlug}
          chapterNumber={chapterNumber}
          userTier={userTier}
          onNavigate={onNavigate}
          hideParentheticals={hideParentheticals}
          sacredNameMask={sacredNameMask}
        />
      ))}
    </ul>
  );
}

// S171 §17 — Per-source-verse block, lifted out of BaselineList so it
// can own its own ref + share state. The block is the natural shareable
// unit for Layer 1: the anchor verse heading + every curated target
// for that verse, rendered as one cohesive card. The Share button sits
// right of the "Verse N" heading.

function BaselineEntryBlock({
  entry,
  bookSlug,
  chapterNumber,
  userTier,
  onNavigate,
  hideParentheticals,
  sacredNameMask,
}: {
  entry: ChapterEndCardResponse["baseline"][number];
  bookSlug: string;
  chapterNumber: number;
  userTier: ContentTier;
  onNavigate?: (b: string, c: number, v: number) => void;
  hideParentheticals: boolean;
  sacredNameMask: SacredNameMask;
}) {
  const blockRef = useRef<HTMLLIElement | null>(null);
  const [sharing, setSharing] = useState(false);
  const sourceVerseNumber = entry.source_verse.verse_number;

  async function handleShare() {
    if (!blockRef.current || sharing) return;
    setSharing(true);
    try {
      await executeStudyShare(blockRef.current, {
        kind: "xref",
        xrefKind: "baseline",
        bookSlug,
        chapterNumber,
        verseNumber: sourceVerseNumber,
        subject: `verse-${sourceVerseNumber}`,
      });
    } finally {
      setSharing(false);
    }
  }

  return (
    <li ref={blockRef}>
      <div className="flex items-center justify-between gap-2 text-[var(--reader-text)]">
        {/*
          S130 — source-verse group label in spectral blue
          (--reader-accent, #0084FF), matching the in-body verse
          numbers per COLOR_PALETTE.md §2. Functional consistency:
          spectral blue = "verse-number pointer" everywhere it
          appears, body and chrome.
        */}
        <span className="font-sans text-xs font-semibold text-[var(--reader-accent)]">
          Verse {sourceVerseNumber}
        </span>
        <XrefShareButton
          sharing={sharing}
          onClick={handleShare}
          label={`Share cross-references for verse ${sourceVerseNumber}`}
        />
      </div>
          <ul className="mt-1 ml-3 space-y-1 text-[var(--reader-text)]">
            {entry.targets.map((tgt) => {
              const locked = !tierSatisfies(userTier, tgt.tier_required);
              const cls = classifyBookSlug(tgt.book_slug);
              const pillClasses = classNameForSourceClass(cls);
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
                      S130 — clickable ref as a metallic mini-pill. All
                      three source classes (Tanakh / NT / Extras) render
                      with their register's gradient + border + light
                      text per COLOR_PALETTE.md §9. Unlocked refs navigate
                      via onNavigate; locked refs route to /pricing.
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
                          ? `Unlock in ${prettyTier(tgt.tier_required)} tier`
                          : `Go to ${prettyRef(tgt.book_slug, tgt.chapter_number, tgt.verse_number)}`
                      }
                      className={
                        "font-sans text-xs font-semibold " + pillClasses
                      }
                    >
                      {prettyRef(
                        tgt.book_slug,
                        tgt.chapter_number,
                        tgt.verse_number
                      )}
                    </button>{" "}
                    {/*
                      S144 — apply parentheticals-strip to the target
                      verse preview. Tanakh / NT / extras-library
                      previews all carry restored Sacred Names with
                      parentheticals; the strip toggle removes them
                      uniformly when the reader has opted in.
                    */}
                    <span className="italic">
                      {applyTextPrefs(
                        tgt.preview,
                        hideParentheticals,
                        sacredNameMask
                      )}
                    </span>
                  </span>
                </li>
              );
            })}
          </ul>
    </li>
  );
}

// ---- Thread callout ------------------------------------------------------

function ThreadCallout({
  thread,
  userTier,
  onNavigate,
  hideParentheticals,
  sacredNameMask,
}: {
  thread: ChapterEndCardResponse["threads"][number];
  userTier: ContentTier;
  onNavigate?: (b: string, c: number, v: number) => void;
  hideParentheticals: boolean;
  sacredNameMask: SacredNameMask;
}) {
  const [expanded, setExpanded] = useState<boolean>(false);
  // S171 §17 — Share state + ref for the thread callout. Captures the
  // entire <article> (title + anchor + summary_md + member rows) as a
  // single shareable card. Anchor permalink for the watermark URL line
  // resolves from thread.anchor; if the thread has no explicit anchor
  // (rare — most curated threads carry one), we skip the share button
  // to keep the URL contract intact (every xref share carries an
  // anchor-verse permalink CTA — no "doorway-less" shares).
  const articleRef = useRef<HTMLElement | null>(null);
  const [sharing, setSharing] = useState(false);
  async function handleShare() {
    if (!articleRef.current || sharing || !thread.anchor) return;
    setSharing(true);
    try {
      await executeStudyShare(articleRef.current, {
        kind: "xref",
        xrefKind: "thread",
        bookSlug: thread.anchor.book_slug,
        chapterNumber: thread.anchor.chapter_number,
        verseNumber: thread.anchor.verse_start,
        subject: thread.slug,
      });
    } finally {
      setSharing(false);
    }
  }
  // S144 — apply the parentheticals-strip toggle to the summary_md
  // BEFORE splitting into paragraphs. Stripping at the whole-body level
  // is correct because every paragraph carries restored Sacred Names
  // that should toggle together; splitting on `\n{2,}` after the strip
  // preserves paragraph structure cleanly.
  const summaryMd = applyTextPrefs(
    thread.summary_md,
    hideParentheticals,
    sacredNameMask
  );
  const paragraphs = summaryMd.split(/\n{2,}/);
  const firstParagraph = paragraphs[0];
  const rest = paragraphs.slice(1);
  const locked = !tierSatisfies(userTier, thread.tier_required);

  // S140 — Option C rendering for tier-locked threads. The free reader
  // sees the thread title + anchor + a teaser (first ~70 words of the
  // summary) that fades into a paywall, a single "Unlock in [Name] tier"
  // CTA, and a count line summarizing what they're missing. No member
  // rows, no full summary, no per-row lock icons. The narrative motion
  // pulls the reader into a framework-bearing reading and stops them at
  // the gate. Replaces the prior render policy (greyed-out-but-readable)
  // locked in CHAPTER_END_CARD_CONTRACT.md line 198.
  if (locked) {
    return (
      <LockedThreadCallout
        thread={thread}
        teaser={teaserFromSummary(firstParagraph)}
      />
    );
  }

  return (
    <article ref={articleRef} className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
      <header className="mb-2 flex items-start justify-between gap-2">
        <div className="min-w-0">
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
        </div>
        {thread.anchor && (
          <XrefShareButton
            sharing={sharing}
            onClick={handleShare}
            label={`Share thread: ${thread.title}`}
          />
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
                hideParentheticals={hideParentheticals}
                sacredNameMask={sacredNameMask}
              />
            ))}
          </ul>
        </div>
      )}
    </article>
  );
}

// ---- S140: Option C locked-thread render ---------------------------------
//
// Title + anchor + ~70-word teaser of the summary + linear-gradient fade
// to surface + locked-count line + single tier-name CTA. Members hidden
// entirely. The locked thread reads as a deliberate tease — the free
// reader is pulled into the start of a framework-bearing reading, hits
// the fade exactly where the substance gets interesting, and the gate
// names the tier they cross to continue.

function LockedThreadCallout({
  thread,
  teaser,
}: {
  thread: ChapterEndCardResponse["threads"][number];
  teaser: string;
}) {
  const tierName = prettyTier(thread.tier_required);
  const memberCount = thread.members_in_chapter.length;
  const goToPricing = () => {
    if (typeof window !== "undefined") {
      window.location.href = "/pricing";
    }
  };
  // S171 Yoshi-decision (post-handoff): locked threads get a Share
  // button too — the paywall itself is a viral surface. The exported
  // PNG carries the title + anchor + teaser + fade + "Unlock in [Name]
  // tier" CTA — same content the locked partner sees in the reader.
  // A friend receiving the share sees the framework's reading + the
  // upgrade path in one image; the paywall doubles as a discovery
  // vector. Anchor permalink in the watermark URL line points back
  // at the thread's anchor verse exactly the way unlocked shares do.
  const articleRef = useRef<HTMLElement | null>(null);
  const [sharing, setSharing] = useState(false);
  async function handleShare() {
    if (!articleRef.current || sharing || !thread.anchor) return;
    setSharing(true);
    try {
      await executeStudyShare(articleRef.current, {
        kind: "xref",
        xrefKind: "thread",
        bookSlug: thread.anchor.book_slug,
        chapterNumber: thread.anchor.chapter_number,
        verseNumber: thread.anchor.verse_start,
        subject: thread.slug,
      });
    } finally {
      setSharing(false);
    }
  }
  return (
    <article ref={articleRef} className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
      <header className="mb-2 flex items-start justify-between gap-2">
        <div className="min-w-0">
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
        </div>
        {thread.anchor && (
          <XrefShareButton
            sharing={sharing}
            onClick={handleShare}
            label={`Share locked-thread teaser: ${thread.title}`}
          />
        )}
      </header>

      <div className="relative">
        <div className="prose-paragraphs leading-relaxed text-[var(--reader-text)]">
          {renderMarkdownParagraph(teaser)}
        </div>
        <div
          aria-hidden="true"
          className="pointer-events-none absolute inset-x-0 -bottom-1 h-14"
          style={{
            background:
              "linear-gradient(to bottom, transparent, var(--reader-surface))",
          }}
        />
      </div>

      <div className="mt-3 flex items-center gap-2 font-sans text-xs text-[var(--reader-muted)]">
        <svg
          aria-hidden="true"
          viewBox="0 0 20 20"
          className="h-3.5 w-3.5"
          fill="currentColor"
        >
          <path d="M10 2a4 4 0 00-4 4v2H5a1 1 0 00-1 1v8a1 1 0 001 1h10a1 1 0 001-1V9a1 1 0 00-1-1h-1V6a4 4 0 00-4-4zm-2 6V6a2 2 0 114 0v2H8z" />
        </svg>
        <span>
          Full summary + {memberCount}{" "}
          {memberCount === 1 ? "verse pairing" : "verse pairings"} in this
          chapter
        </span>
      </div>

      <button
        type="button"
        onClick={goToPricing}
        className="mt-3 w-full rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 font-sans text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
      >
        Unlock in {tierName} tier
      </button>
    </article>
  );
}

/**
 * Teaser truncation for locked-thread render. Pulls ~70 words from the
 * first paragraph of summary_md, ends on a word boundary, appends a
 * trailing ellipsis. The fade-to-surface gradient sits over the bottom
 * of the rendered teaser, so the visible cut-line is soft regardless of
 * where the word boundary lands. Preserves the `*italic*` markup so
 * scripture quotations in the teaser still render italicized.
 */
function teaserFromSummary(firstParagraph: string): string {
  const TEASER_WORD_TARGET = 70;
  const words = firstParagraph.split(/\s+/);
  if (words.length <= TEASER_WORD_TARGET) return firstParagraph;
  const head = words.slice(0, TEASER_WORD_TARGET).join(" ");
  // Don't cut inside a `*...*` italic span — extend to the next closing
  // asterisk if we're sitting inside one.
  const openCount = (head.match(/\*/g) || []).length;
  if (openCount % 2 === 1) {
    const remaining = words.slice(TEASER_WORD_TARGET).join(" ");
    const closeIdx = remaining.indexOf("*");
    if (closeIdx !== -1) {
      return head + " " + remaining.slice(0, closeIdx + 1) + "…";
    }
  }
  return head + "…";
}

function ThreadMemberRow({
  member,
  onNavigate,
  hideParentheticals,
  sacredNameMask,
}: {
  member: ThreadMember;
  onNavigate?: (b: string, c: number, v: number) => void;
  hideParentheticals: boolean;
  sacredNameMask: SacredNameMask;
}) {
  // S130 — color the target-verse ref by its source class per
  // COLOR_PALETTE.md §9. All three source classes render as metallic
  // mini-pills in their register (Tanakh emerald, NT gold, Extras
  // argaman). Members don't carry a separate tier_required in the
  // current API shape; thread-level gating already greys the parent
  // article when locked.
  const cls = classifyBookSlug(member.target.book_slug);
  const pillClasses = classNameForSourceClass(cls);
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
        className={"font-sans text-xs font-semibold " + pillClasses}
      >
        {prettyRef(
          member.target.book_slug,
          member.target.chapter_number,
          member.target.verse_number
        )}
      </button>
      {/*
        S144 — apply the parentheticals-strip toggle to BOTH the target
        verse preview and the member_note. The preview carries restored
        Sacred Names from the verse text; the member_note carries them
        in framework-prose. Both should toggle uniformly with the rest
        of the chapter-end card.
      */}
      <span className="basis-full italic ml-5 text-[var(--reader-text)]">
        {applyTextPrefs(
          member.target.preview,
          hideParentheticals,
          sacredNameMask
        )}
      </span>
      {member.member_note && (
        <span className="basis-full ml-5 font-sans text-xs text-[var(--reader-muted)]">
          {applyTextPrefs(
            member.member_note,
            hideParentheticals,
            sacredNameMask
          )}
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
  // Display names per S140 tier-name overhaul. Backend slugs unchanged;
  // every reader-facing surface uses these strings + the
  // "Unlock in [Name] tier" CTA pattern.
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
