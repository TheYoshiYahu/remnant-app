import { useEffect, useMemo, useRef, useState } from "react";
import {
  type BookChaptersResponse,
  type BookSummary,
  type ChapterDetail,
  type ContentTier,
  type Highlight,
  type SubscriptionMe,
  getChapter,
  getSubscriptionMe,
  listBooks,
  listChapters,
  listChapterHighlights,
} from "./lib/api";
import Pricing from "./routes/Pricing";
import Manage from "./routes/Manage";
import ChapterEndCard from "./components/ChapterEndCard";
import ChapterCommentary from "./components/ChapterCommentary";
import HighlightPicker, {
  markClassFor,
  markCssVarsFor,
} from "./components/HighlightPicker";
import { renderMarkdownBody } from "./lib/markdown";
import { useTheme } from "./lib/theme";
import {
  cancelPendingSave,
  loadInitialPosition,
  saveReadingPositionDebounced,
} from "./lib/reading-position";
import paragraphStartsData from "./data/paragraph_starts.json";

// S115 Wheel 3 — chrome theme toggle. Small button placed to the
// left of the subscription CTA. Sun glyph when dark (click to go light);
// moon glyph when light (click to go dark). The button itself uses the
// existing light/bordered chrome button styling so it reads as part of
// the chrome button family. Persistence + DOM-attribute flip lives in
// lib/theme.ts; this component is the surface.
//
// S117 — visible "Theme" text label added next to the glyph per Yoshi's
// feedback that the icon-only version was hard to find. Glyph stays as
// the visual hook; the word "Theme" makes the affordance discoverable.
function ThemeToggle() {
  const { theme, toggle } = useTheme();
  const isDark = theme === "dark";
  return (
    <button
      type="button"
      onClick={toggle}
      aria-label={isDark ? "Switch to light theme" : "Switch to dark theme"}
      title={isDark ? "Switch to light theme" : "Switch to dark theme"}
      className="flex items-center gap-1.5 self-start whitespace-nowrap rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2.5 py-1.5 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
    >
      <span aria-hidden="true">{isDark ? "☼" : "☾"}</span>
      <span>Theme</span>
    </button>
  );
}

// Map of {book_slug: {chapter_number_string: [verse numbers that start paragraphs]}}.
// Extracted from the KJV USFX XML at restoration-pipeline build time;
// see /tmp/extract_paragraphs.py in S110. Used to render the reader chapter
// with proper pericope-style paragraph breaks rather than verse-per-line or
// one giant run-on paragraph.
const paragraphStarts = paragraphStartsData as Record<string, Record<string, number[]>>;

/**
 * Session 13 minimum-useful checkpoint:
 *   reader-on-localhost-5173 against the live API at bible.remnantofpromise.org,
 *   showing Genesis 1 from the Protestant 66 canon (KJV-restored) by default
 *   and letting the reader pick any other canon book / chapter.
 *
 * Session 36 — JWT-aware: cookie + Authorization header attached on every
 *   API call via api.ts; the API filters book list by partner_tier.
 *
 * Session 38 — pathname-based view switch + me-aware chrome:
 *   "/" → Reader; "/pricing" → Pricing surface. GET /v1/subscriptions/me
 *   on mount; chrome shows "Manage subscription" if status=active else
 *   "Become a partner" linking to /pricing.
 *
 * Session 39 — cancellation flow:
 *   "/manage" → Manage surface (current subscription details + Cancel
 *   button with voice-gated confirm copy: no "are you sure", no "we'll
 *   miss you", no spiritual-consequences framing — the partner is told
 *   their access continues through period-end, they can resubscribe
 *   anytime, and the forever-locked price stays with them).
 *
 * Session 40 — PWA on production:
 *   The Vite-built bundle now ships as a Render Static Site at the bare
 *   bible.remnantofpromise.org subdomain (per hosting/render.yaml's new
 *   remnant-app-pwa service). The FastAPI API moved to
 *   api.bible.remnantofpromise.org (lib/api.ts's default API_BASE). The
 *   book-picker option key fix (b.id, not b.slug) clears the duplicate-
 *   key console warnings that landed when Session 35 widened books.slug
 *   UNIQUE to composite (edition_id, slug). The dev-only ?dev_jwt=
 *   handler stays — production builds strip it via import.meta.env.DEV.
 *
 * No router library — single pathname check at App-render time is enough
 * for three routes and keeps the dep list at React-only. Stripe checkout
 * navigates the browser away via window.location.href so we never need
 * client-side route swapping mid-flow.
 */
export default function App() {
  // Pathname-based view switch. Recomputed only at mount + on popstate;
  // navigation in the app is browser-native (window.location.href = ...).
  const [pathname, setPathname] = useState<string>(
    typeof window !== "undefined" ? window.location.pathname : "/"
  );
  useEffect(() => {
    const onPop = () => setPathname(window.location.pathname);
    window.addEventListener("popstate", onPop);
    return () => window.removeEventListener("popstate", onPop);
  }, []);

  // Dev-only: ?dev_jwt=<token> in the URL sets the rop_jwt cookie at
  // localhost and reloads the page. Used in development against the live
  // production API when no WordPress login redirect is wired locally —
  // Session 39 added this when Safari's DevTools console refused
  // document.cookie pastes. Stripped from production builds via
  // import.meta.env.DEV (Vite injects DEV=false when `npm run build`
  // runs, so this whole block becomes dead code under production).
  useEffect(() => {
    if (!import.meta.env.DEV) return;
    if (typeof window === "undefined") return;
    const params = new URLSearchParams(window.location.search);
    const devJwt = params.get("dev_jwt");
    if (!devJwt) return;
    document.cookie = `rop_jwt=${devJwt}; path=/; max-age=86400`;
    // Drop the query param so the JWT doesn't sit in the URL after
    // navigation. Then reload so the API client picks up the cookie.
    const cleanUrl = window.location.pathname + window.location.hash;
    window.history.replaceState({}, "", cleanUrl);
    window.location.reload();
  }, []);

  if (pathname === "/manage" || pathname.startsWith("/manage")) {
    return <Manage />;
  }
  if (pathname === "/pricing" || pathname.startsWith("/pricing")) {
    return <Pricing />;
  }
  return <Reader />;
}

function Reader() {
  const [books, setBooks] = useState<BookSummary[]>([]);
  const [booksError, setBooksError] = useState<string | null>(null);

  const [selectedBookSlug, setSelectedBookSlug] = useState<string>("genesis");
  const [selectedChapter, setSelectedChapter] = useState<number>(1);

  // S116 — reading-position persistence. `currentVerse` tracks the
  // topmost-visible verse via IntersectionObserver (initial 1, updated
  // as the partner scrolls). `hydrated` gates the save effect so the
  // initial paint at Genesis/1/1 doesn't overwrite the saved position
  // before the hydrate completes. `initialScrollVerse` is set during
  // hydrate when the saved position isn't verse 1; cleared after the
  // post-load scrollIntoView fires.
  const [currentVerse, setCurrentVerse] = useState<number>(1);
  const [hydrated, setHydrated] = useState<boolean>(false);
  const [initialScrollVerse, setInitialScrollVerse] = useState<number | null>(
    null
  );

  const [chaptersResp, setChaptersResp] =
    useState<BookChaptersResponse | null>(null);
  const [chapterDetail, setChapterDetail] = useState<ChapterDetail | null>(
    null
  );
  const [chapterLoading, setChapterLoading] = useState<boolean>(false);
  const [chapterError, setChapterError] = useState<string | null>(null);

  // Session 38: me-fetch for the chrome's Manage/Upgrade decision.
  // 401 (no JWT cookie) is non-fatal — we just don't show the partner
  // chrome at all in that case.
  const [me, setMe] = useState<SubscriptionMe | null>(null);

  // S113 → S117: per-chapter highlights map + picker state.
  // `highlightsByVerse` keys are verse_id and values are ARRAYS of
  // marks on that verse (S117 multi-mark: schema unique is
  // (user_id, verse_id, color, style), so a verse can carry up to 3
  // marks per the picker cap; different (color, style) tuples coexist
  // visually via nested spans). `pickerVerseId` opens the
  // HighlightPicker for a single verse on long-press / right-click;
  // null = picker closed.
  const [highlightsByVerse, setHighlightsByVerse] = useState<
    Record<number, Highlight[]>
  >({});
  const [pickerVerseId, setPickerVerseId] = useState<number | null>(null);

  // Long-press detection: pointerdown starts a 500ms timer; pointerup /
  // pointercancel / pointerleave clears it. If the timer fires, the
  // picker opens for that verse. Click + drag don't trigger.
  const longPressTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const longPressFiredRef = useRef<boolean>(false);

  // S116 — IntersectionObserver for verse-precise reading-position
  // tracking. Observes every verse span in the current chapter,
  // maintains a Map<verseNumber, boundingRectTop> of currently
  // intersecting verses, and emits the topmost (smallest top value)
  // as `currentVerse` whenever the set changes. The observer is
  // recreated each time chapterDetail changes (chapter-load fires
  // fresh DOM nodes).
  const verseObserverRef = useRef<IntersectionObserver | null>(null);
  const visibleVersesRef = useRef<Map<number, number>>(new Map());
  function handlePointerDown(verseId: number) {
    longPressFiredRef.current = false;
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
    }
    longPressTimerRef.current = setTimeout(() => {
      longPressFiredRef.current = true;
      setPickerVerseId(verseId);
    }, 500);
  }
  function handlePointerCancel() {
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
      longPressTimerRef.current = null;
    }
  }
  function handleContextMenu(verseId: number, e: React.MouseEvent) {
    e.preventDefault();
    setPickerVerseId(verseId);
  }

  // Books load once on mount.
  useEffect(() => {
    listBooks()
      .then((bs) => {
        setBooks(bs);
        setBooksError(null);
      })
      .catch((e) => setBooksError(String(e)));
  }, []);

  // /v1/subscriptions/me once on mount. Failure is silent — anonymous
  // reader still works as before; the chrome just hides the partner
  // link.
  useEffect(() => {
    getSubscriptionMe()
      .then(setMe)
      .catch(() => setMe(null));
  }, []);

  // S116 — hydrate saved reading position on mount. Resolution order
  // (handled inside loadInitialPosition): API row → localStorage row
  // → null (caller stays at the Genesis/1/1 defaults). When a saved
  // position resolves to a non-verse-1 anchor, `initialScrollVerse`
  // is set so the post-chapter-load effect can scrollIntoView. The
  // `hydrated` flag flips true once this completes regardless of
  // outcome — that gates the save effect so the initial paint at
  // Genesis/1/1 never overwrites the saved row before hydrate.
  useEffect(() => {
    let cancelled = false;
    loadInitialPosition()
      .then((pos) => {
        if (cancelled) return;
        if (pos !== null) {
          setSelectedBookSlug(pos.bookSlug);
          setSelectedChapter(pos.chapter);
          setCurrentVerse(pos.verseNumber);
          if (pos.verseNumber > 1) {
            setInitialScrollVerse(pos.verseNumber);
          }
        }
        setHydrated(true);
      })
      .catch(() => {
        if (cancelled) return;
        setHydrated(true);
      });
    return () => {
      cancelled = true;
      cancelPendingSave();
    };
  }, []);

  // Chapters list reloads when the selected book changes.
  useEffect(() => {
    if (!selectedBookSlug) return;
    setChaptersResp(null);
    listChapters(selectedBookSlug)
      .then((r) => setChaptersResp(r))
      .catch((e) => setChapterError(String(e)));
  }, [selectedBookSlug]);

  // Chapter detail reloads when book OR chapter changes.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setChapterLoading(true);
    setChapterError(null);
    getChapter(selectedBookSlug, selectedChapter)
      .then((d) => {
        setChapterDetail(d);
        setChapterLoading(false);
      })
      .catch((e) => {
        setChapterError(String(e));
        setChapterLoading(false);
      });
  }, [selectedBookSlug, selectedChapter]);

  // S113: highlights reload alongside the chapter. Fetch is best-effort —
  // a 401 (anonymous caller) just leaves the map empty; the reader still
  // displays verses, just without any mark visuals. The picker enforces
  // sign-in when an anonymous caller actually long-presses.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setHighlightsByVerse({});
    setPickerVerseId(null);
    listChapterHighlights(selectedBookSlug, selectedChapter)
      .then((r) => {
        // S117 multi-mark — bucket marks by verse_id into arrays.
        // Order preserved from the API response; the verse-render
        // layer iterates the array in order and computes per-underline
        // text-underline-offset so multiple underlines on the same
        // verse stack cleanly.
        const map: Record<number, Highlight[]> = {};
        for (const h of r.highlights) {
          (map[h.verse_id] ??= []).push(h);
        }
        setHighlightsByVerse(map);
      })
      .catch(() => {
        // Anonymous or transient failure — leave the map empty.
      });
  }, [selectedBookSlug, selectedChapter]);

  // S116 — IntersectionObserver attach. Recreates the observer each
  // time chapterDetail changes (chapter-load swaps the verse DOM
  // nodes). Maintains a Map<verseNumber, boundingRectTop> of
  // currently intersecting verses; on every callback batch, emits the
  // verse with the smallest top value (topmost on screen) as the
  // current reading position. rootMargin tightens the intersection
  // band to roughly the upper third of the viewport so a partner
  // who's reading toward the bottom of the visible area doesn't
  // accidentally save the verse just below their gaze.
  //
  // Gated on initialScrollVerse===null so that the first attach after
  // a hydrate-driven scroll waits until the scroll has landed. Without
  // the gate, the observer would fire once with verse 1 (browser
  // un-scrolled), trigger a localStorage write of verse 1, then fire
  // again with the saved verse after the scroll — causing a brief
  // window where a refresh would resume to verse 1 instead of the
  // saved verse.
  useEffect(() => {
    if (!chapterDetail) return;
    if (initialScrollVerse !== null) return;
    // Clean up any previous observer + reset the visible map.
    if (verseObserverRef.current) {
      verseObserverRef.current.disconnect();
      verseObserverRef.current = null;
    }
    visibleVersesRef.current.clear();

    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          const vnAttr = (entry.target as HTMLElement).dataset.verseNumber;
          if (!vnAttr) continue;
          const vn = Number(vnAttr);
          if (entry.isIntersecting) {
            visibleVersesRef.current.set(vn, entry.boundingClientRect.top);
          } else {
            visibleVersesRef.current.delete(vn);
          }
        }
        // Find topmost visible verse (smallest top value).
        let topVerse: number | null = null;
        let topVerseY = Infinity;
        for (const [vn, y] of visibleVersesRef.current) {
          if (y < topVerseY) {
            topVerseY = y;
            topVerse = vn;
          }
        }
        if (topVerse !== null) {
          setCurrentVerse(topVerse);
        }
      },
      {
        // Upper-third band — verses below the middle of the viewport
        // don't compete for the "topmost" slot until the partner
        // scrolls them up.
        rootMargin: "0px 0px -50% 0px",
        threshold: [0, 0.25, 0.5, 1],
      }
    );

    // Attach to every verse span rendered for this chapter.
    document
      .querySelectorAll<HTMLElement>("[data-verse-number]")
      .forEach((el) => observer.observe(el));
    verseObserverRef.current = observer;

    return () => {
      observer.disconnect();
      verseObserverRef.current = null;
      visibleVersesRef.current.clear();
    };
  }, [chapterDetail, initialScrollVerse]);

  // S116 — scroll to saved verse once the chapter renders. Fires when
  // hydrate determined an initialScrollVerse > 1 and the chapterDetail
  // has loaded (verse DOM is present). After scrolling, clears the
  // target so subsequent chapter-changes don't re-scroll.
  useEffect(() => {
    if (!chapterDetail) return;
    if (initialScrollVerse === null) return;
    // Small delay to let the IntersectionObserver attach + paint settle.
    const handle = setTimeout(() => {
      const el = document.querySelector<HTMLElement>(
        `[data-verse-number="${initialScrollVerse}"]`
      );
      if (el) {
        el.scrollIntoView({ behavior: "auto", block: "start" });
      }
      setInitialScrollVerse(null);
    }, 50);
    return () => clearTimeout(handle);
  }, [chapterDetail, initialScrollVerse]);

  // S116 — debounced save on position change. Gated on `hydrated` so
  // the Genesis/1/1 default never overwrites a real saved row before
  // hydrate completes. Anonymous callers still get a localStorage
  // write through saveReadingPositionDebounced (the API call inside
  // is best-effort and 401s silently). Debounce window lives in
  // lib/reading-position.ts (~1500ms); rapid scrolls collapse to one
  // API write at the end of the burst.
  useEffect(() => {
    if (!hydrated) return;
    if (!selectedBookSlug || !selectedChapter || !currentVerse) return;
    saveReadingPositionDebounced({
      bookSlug: selectedBookSlug,
      chapter: selectedChapter,
      verseNumber: currentVerse,
    });
  }, [hydrated, selectedBookSlug, selectedChapter, currentVerse]);

  // Books grouped by witness_category for the picker.
  const booksByCategory = useMemo(() => {
    const groups: Record<string, BookSummary[]> = {};
    for (const b of books) {
      (groups[b.witness_category] ??= []).push(b);
    }
    for (const k of Object.keys(groups)) {
      groups[k].sort((a, b) => a.canonical_order - b.canonical_order);
    }
    return groups;
  }, [books]);

  const chaptersForBook = chaptersResp?.chapters ?? [];

  return (
    <div className="mx-auto max-w-3xl px-6 py-8">
      <header className="mb-6 border-b border-[var(--reader-accent)] pb-4">
        <div className="flex items-start justify-between gap-4">
          <div>
            <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
              The Remnant of Promise Official Study Bible
            </h1>
            <p className="mt-1 text-sm text-[var(--reader-muted)]">
              Restored Names Edition
            </p>
          </div>
          <div className="flex items-start gap-2">
            <ThemeToggle />
            {me && (me.status === "active" || me.status === "trialing") ? (
              <a
                href="/manage"
                className="self-start whitespace-nowrap rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
              >
                Manage partnership
              </a>
            ) : me && me.status === "none" ? (
              <a
                href="/pricing"
                className="self-start whitespace-nowrap rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
              >
                Become a partner
              </a>
            ) : me &&
              (me.status === "canceled" ||
                me.status === "past_due" ||
                me.status === "unpaid" ||
                me.status === "incomplete" ||
                me.status === "incomplete_expired") ? (
              <a
                href="/pricing"
                className="self-start whitespace-nowrap rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
              >
                Resubscribe
              </a>
            ) : null}
          </div>
        </div>
      </header>

      {booksError && (
        <div className="mb-4 rounded border border-red-300 bg-red-50 p-3 text-sm text-red-800">
          Books failed to load: {booksError}
        </div>
      )}

      <div className="mb-6 flex flex-wrap gap-3 font-sans">
        <label className="flex items-center gap-2 text-sm text-[var(--reader-muted)]">
          <span>Book</span>
          <select
            value={selectedBookSlug}
            onChange={(e) => {
              setSelectedBookSlug(e.target.value);
              setSelectedChapter(1);
              // S116 — picker change resets verse to 1 so the save
              // effect doesn't briefly persist the previous chapter's
              // last-visible verse against the new book/chapter pair.
              setCurrentVerse(1);
            }}
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-[var(--reader-text)]"
          >
            {Object.entries(booksByCategory).map(([cat, list]) => (
              <optgroup key={cat} label={prettyCategory(cat)}>
                {list.map((b) => (
                  // Session 40 fix: Session 35 widened books.slug UNIQUE to
                  // composite (edition_id, slug); slugs like 'judith',
                  // '1-esdras', 'tobit', '1-maccabees', '2-maccabees' now
                  // appear in both apocrypha (KJV-1611) and
                  // apocrypha-charles-vol1. b.id (numeric primary key) is
                  // the unique React key. value={b.slug} stays for now —
                  // the picker's downstream consumers still use slug, and
                  // the duplicate value is a separate UX concern logged
                  // for a later wheel.
                  <option key={b.id} value={b.slug}>
                    {b.title}
                  </option>
                ))}
              </optgroup>
            ))}
          </select>
        </label>

        <label className="flex items-center gap-2 text-sm text-[var(--reader-muted)]">
          <span>Chapter</span>
          <select
            value={selectedChapter}
            onChange={(e) => {
              setSelectedChapter(Number(e.target.value));
              // S116 — chapter picker change resets verse to 1 for
              // the same reason as the book picker above.
              setCurrentVerse(1);
            }}
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-[var(--reader-text)]"
          >
            {chaptersForBook.map((c) => (
              <option key={c.chapter_number} value={c.chapter_number}>
                {c.chapter_number}
              </option>
            ))}
          </select>
        </label>
      </div>

      {chapterError && (
        <div className="mb-4 rounded border border-red-300 bg-red-50 p-3 text-sm text-red-800">
          {chapterError}
        </div>
      )}

      {chapterLoading && !chapterDetail && (
        <p className="text-sm text-[var(--reader-muted)]">Loading…</p>
      )}

      {chapterDetail && (
        <article>
          <h2 className="mb-1 text-xl font-semibold text-[var(--reader-text)]">
            {chapterDetail.book.title}{" "}
            <span className="font-normal text-[var(--reader-muted)]">
              {chapterDetail.chapter.chapter_number}
            </span>
          </h2>
          {chapterDetail.chapter.chapter_title &&
            chapterDetail.chapter.chapter_title !==
              `Chapter ${chapterDetail.chapter.chapter_number}` && (
              <p className="mb-3 text-base italic text-[var(--reader-muted)]">
                {chapterDetail.chapter.chapter_title}
              </p>
            )}
          {/*
            Session 110 round-1 follow-up: render the chapter with proper
            pericope-style paragraph breaks. The break points come from
            paragraphStarts (extracted from KJV USFX XML). For each chapter,
            we group consecutive verses into <p> elements, opening a new
            paragraph whenever a verse number appears in the paragraph_starts
            list for that book + chapter.
          */}
          <div className="mt-4 leading-relaxed text-[1.05rem] text-[var(--reader-text)]">
            {(() => {
              const bookStarts =
                paragraphStarts[chapterDetail.book.slug]?.[
                  String(chapterDetail.chapter.chapter_number)
                ] || [];
              const startsSet = new Set(bookStarts);
              const groups: Array<typeof chapterDetail.verses> = [];
              for (const v of chapterDetail.verses) {
                if (groups.length === 0 || startsSet.has(v.verse_number)) {
                  groups.push([v]);
                } else {
                  groups[groups.length - 1].push(v);
                }
              }
              return groups.map((verses, gIdx) => (
                <p key={`p-${gIdx}-${verses[0].id}`} className="mb-3 indent-0">
                  {verses.map((v) => {
                    // S113 → S117 multi-mark — layer 0..3 marks on the
                    // verse via nested spans. Each mark wraps the inner
                    // content with its own mark-{style} class + per-color
                    // CSS variables. Multi-underline stacking: for each
                    // underline mark, compute text-underline-offset based
                    // on its index among the underline marks (2px, 7px,
                    // 12px) so multiple colored underlines render as
                    // distinct stacked lines instead of overlapping.
                    const marks = highlightsByVerse[v.id] || [];
                    let content: React.ReactNode = (
                      <>
                        <sup className="verse-number mr-1">
                          {v.verse_number}
                        </sup>
                        {v.text}{" "}
                      </>
                    );
                    let underlineIdx = 0;
                    for (const mark of marks) {
                      const inlineStyle: React.CSSProperties = {
                        ...markCssVarsFor(mark.color),
                      };
                      if (mark.style === "underline") {
                        // 2, 7, 12 — readable stack to 3 levels per the
                        // S117 cap.
                        inlineStyle.textUnderlineOffset = `${
                          2 + underlineIdx * 5
                        }px`;
                        underlineIdx++;
                      }
                      content = (
                        <span
                          className={markClassFor(mark.style)}
                          style={inlineStyle}
                        >
                          {content}
                        </span>
                      );
                    }
                    return (
                      <span
                        key={v.id}
                        data-verse-number={v.verse_number}
                        className="verse-interactive"
                        onPointerDown={() => handlePointerDown(v.id)}
                        onPointerUp={handlePointerCancel}
                        onPointerCancel={handlePointerCancel}
                        onPointerLeave={handlePointerCancel}
                        onContextMenu={(e) => handleContextMenu(v.id, e)}
                        onClick={(e) => {
                          // Suppress click event if long-press already fired
                          // (so opening the picker doesn't also count as a
                          // verse-text tap if we wire that in later).
                          if (longPressFiredRef.current) {
                            e.preventDefault();
                            longPressFiredRef.current = false;
                          }
                        }}
                      >
                        {content}
                      </span>
                    );
                  })}
                </p>
              ));
            })()}
          </div>

          {chapterDetail.chapter_intro && (
            <aside className="mt-8 border-t border-[var(--reader-rule)] pt-4 text-[var(--reader-muted)]">
              <h3 className="mb-2 font-sans font-semibold uppercase tracking-wide text-xs">
                Commentary
              </h3>
              {/*
                Session 110 Round-1 italic-fix: render chapter_intro through
                the shared markdown helper so `*italic*` spans render as
                <em> and `\n\n` paragraph breaks produce real <p> elements.
                Sacred names are already restored with parentheticals at
                the seed-data layer and render as plain inline text.
              */}
              <div className="space-y-0">
                {renderMarkdownBody(chapterDetail.chapter_intro)}
              </div>
            </aside>
          )}

          {/*
            Session 112 — tiered commentary stack. Renders the Basic and
            Deeper Dive layers (matt-N-short.md + matt-N.md) gated at the
            extras ($4.99 Library) tier. Locked rows show an eye-catching
            upgrade affordance so free / Notes-tier partners see what the
            tier ladder unlocks. The component hides itself silently when
            the chapter has no commentary_entries rows yet (most non-
            Matthew chapters as of S112). A global "Hide commentary"
            toggle inside the component persists per-user via localStorage
            for partners who want to read straight verses without chrome.
          */}
          <ChapterCommentary
            bookSlug={chapterDetail.book.slug}
            chapterNumber={chapterDetail.chapter.chapter_number}
            userTier={me?.tier ?? "free"}
          />

          {/*
            Session 74 — chapter-end cross-reference card. Renders the
            per-verse curated cross-references plus the framework-
            diagnostic threads per api/CHAPTER_END_CARD_CONTRACT.md.
            Every row is curated and framework-bearing; the TSK
            comprehensive-baseline direction rolled back at S75. The
            card hides itself silently when both lists come back empty.
          */}
          <ChapterEndCard
            bookSlug={chapterDetail.book.slug}
            chapterNumber={chapterDetail.chapter.chapter_number}
            userTier={me?.tier ?? "free"}
          />
        </article>
      )}

      {/*
        Session 113 — highlight picker. Renders as a fixed-position
        modal overlay when a verse is long-pressed (touch) or right-
        clicked (desktop). One picker per render — opening for verse B
        while picker is on verse A replaces the picker; the close
        callback resets state to null.
      */}
      {pickerVerseId !== null && (
        <HighlightPicker
          verseId={pickerVerseId}
          current={highlightsByVerse[pickerVerseId] ?? []}
          userTier={(me?.tier ?? "free") as ContentTier}
          onSaved={(h) =>
            // S117 multi-mark — append the new mark, dedup'ing on the
            // (color, style) tuple in case the API returned an existing
            // row for an exact-duplicate insert (insert-or-no-op
            // semantics).
            setHighlightsByVerse((prev) => {
              const existing = prev[h.verse_id] ?? [];
              const filtered = existing.filter(
                (m) => !(m.color === h.color && m.style === h.style)
              );
              return { ...prev, [h.verse_id]: [...filtered, h] };
            })
          }
          onDeleted={(highlightId) =>
            // S117 multi-mark — delete by mark id (not by verse id).
            // Filter the mark out of every verse's array; drop the
            // verse key when the resulting array is empty so the map
            // stays clean.
            setHighlightsByVerse((prev) => {
              const next: Record<number, Highlight[]> = {};
              for (const [verseIdStr, marks] of Object.entries(prev)) {
                const filtered = marks.filter((m) => m.id !== highlightId);
                if (filtered.length > 0) {
                  next[Number(verseIdStr)] = filtered;
                }
              }
              return next;
            })
          }
          onClose={() => setPickerVerseId(null)}
        />
      )}

      <footer className="mt-12 border-t border-[var(--reader-rule)] pt-4 font-sans text-xs text-[var(--reader-muted)]">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <a
            href="https://remnantofpromise.org"
            className="font-medium text-[var(--reader-muted)] underline-offset-2 hover:underline hover:text-[var(--reader-text)]"
          >
            ← Back to Remnant of Promise
          </a>
          <span>
            Live from{" "}
            <code className="rounded bg-[var(--reader-surface)] px-1 py-0.5">
              api.bible.remnantofpromise.org/v1
            </code>
          </span>
        </div>
      </footer>
    </div>
  );
}

function prettyCategory(cat: string): string {
  switch (cat) {
    case "canon":
      return "Canon (Protestant 66)";
    case "apocrypha":
      return "Apocrypha";
    case "pseudepigrapha":
      return "Pseudepigrapha";
    case "apostolic_fathers":
      return "Apostolic Fathers";
    case "apocryphal_gospels":
      return "Apocryphal Gospels";
    case "historical_witness":
      return "Historical Witness";
    case "disputed_witness":
      return "Disputed";
    default:
      return cat;
  }
}
