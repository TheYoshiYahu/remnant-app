import { useEffect, useMemo, useRef, useState } from "react";
import {
  type BookChaptersResponse,
  type BookSummary,
  type ChapterDetail,
  type ChapterWordsResponse,
  type ContentTier,
  type Highlight,
  type PartnerTier,
  type SubscriptionMe,
  type VerseWord,
  getChapter,
  getChapterWords,
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
import StrongsLookup from "./components/StrongsLookup";
import VerseActionMenu, {
  type MenuItem,
  type MenuSection,
} from "./components/VerseActionMenu";
import RangeActionPicker from "./components/RangeActionPicker";
import { alignVerse, type Segment } from "./lib/verse-align";
import {
  IDLE_STATE as RANGE_IDLE,
  type RangeSelectionState,
  type RangeVerseRef,
  cancel as rangeCancel,
  commitEnd as rangeCommitEnd,
  isSameChapter as rangeIsSameChapter,
  resolveSameChapterRange,
  sameChapterRangeSize,
  startSelecting as rangeStartSelecting,
} from "./lib/range-selection";
import { renderMarkdownBody } from "./lib/markdown";
import { useTheme } from "./lib/theme";
import {
  cancelPendingSave,
  loadInitialPosition,
  saveReadingPositionDebounced,
} from "./lib/reading-position";
import {
  lastChapterNumber,
  nextChapterTarget,
  prevChapterTarget,
  targetLabel,
} from "./lib/chapter-nav";
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

  // S113 → S117: per-chapter highlights map.
  // `highlightsByVerse` keys are verse_id and values are ARRAYS of
  // marks on that verse (S117 multi-mark: schema unique is
  // (user_id, verse_id, color, style), so a verse can carry up to 3
  // marks per the picker cap; different (color, style) tuples coexist
  // visually via nested spans).
  const [highlightsByVerse, setHighlightsByVerse] = useState<
    Record<number, Highlight[]>
  >({});

  // S121 W3 — modal stack state. Replaces the direct
  // pickerVerseId-driven path. Long-press / right-click fires the
  // VerseActionMenu first, which routes to either HighlightPicker or
  // StrongsLookup. Quick-tap on a tappable word bypasses the menu
  // and opens StrongsLookup directly.
  //
  // menuState carries the verse + (optional) word context for the
  // long-press menu. pickerVerseId opens the HighlightPicker (now
  // routed through the menu). strongsState opens StrongsLookup
  // (routed either via menu OR quick-tap fast path).
  const [pickerVerseId, setPickerVerseId] = useState<number | null>(null);
  const [menuState, setMenuState] = useState<
    | {
        verseId: number;
        word: { strong: string; surface: string } | null;
      }
    | null
  >(null);
  const [strongsState, setStrongsState] = useState<
    { strong: string; surface: string } | null
  >(null);

  // S123 W4 — range-selection state + post-capture action picker target.
  // rangeState holds the shared mechanic per DESIGN_LANGUAGE.md §21:
  //   - idle: no range active; verses render normally
  //   - selecting: anchor verse pinned (start); waiting for end-verse tap
  //   - captured: both endpoints in; rangePickerOpen drives the
  //     post-capture action picker; on commit, pickerRangeVerseIds
  //     drives the HighlightPicker in multi-target mode
  //
  // pickerRangeVerseIds is set when "Highlight range" is chosen from the
  // RangeActionPicker — it triggers HighlightPicker's multi-target render.
  const [rangeState, setRangeState] =
    useState<RangeSelectionState>(RANGE_IDLE);
  const [rangePickerOpen, setRangePickerOpen] = useState<boolean>(false);
  const [pickerRangeVerseIds, setPickerRangeVerseIds] = useState<
    number[] | null
  >(null);

  // S121 W3 — per-chapter Strong's-tagged-words map. Keys are
  // verse_id; values are the position-ordered VerseWord list for
  // that verse. Fetched alongside the chapter detail via the
  // batched /v1/books/{slug}/chapters/{n}/words endpoint so
  // tap-on-word becomes available without firing N parallel
  // per-verse requests. Empty until the batched fetch returns; the
  // verse-align helper degrades gracefully to all-plain rendering
  // until words arrive (progressive enrichment — verse text renders
  // instantly; tap-ability lights up a moment later).
  const [wordsByVerse, setWordsByVerse] = useState<
    Record<number, VerseWord[]>
  >({});

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
  // S121 W3 — long-press / right-click now opens the VerseActionMenu
  // instead of going straight to HighlightPicker. The menu routes to
  // the right modal based on the user's choice. Word context is set
  // by the per-word handlers below when a tappable word is the
  // long-press anchor; verse context (no word) is the default.
  function handlePointerDown(
    verseId: number,
    word: { strong: string; surface: string } | null = null
  ) {
    longPressFiredRef.current = false;
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
    }
    longPressTimerRef.current = setTimeout(() => {
      longPressFiredRef.current = true;
      setMenuState({ verseId, word });
    }, 500);
  }
  function handlePointerCancel() {
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
      longPressTimerRef.current = null;
    }
  }
  function handleContextMenu(
    verseId: number,
    e: React.MouseEvent,
    word: { strong: string; surface: string } | null = null
  ) {
    e.preventDefault();
    setMenuState({ verseId, word });
  }

  // S121 W3 — quick-tap on a tappable word opens StrongsLookup
  // directly (fast path for the highest-frequency action). Only
  // fires if the long-press timer did NOT fire; the swipe-handler's
  // 10px movement check also kills this if the user dragged.
  //
  // S123 W4 — when range mode is active (selecting), word-level quick-
  // taps are reinterpreted as end-verse commits. Partners can pick
  // either plain-text or a tappable word as the end verse without
  // accidentally opening the lexicon mid-selection per DESIGN_LANGUAGE.md
  // §21 interaction-conflict resolution.
  function handleWordQuickTap(
    word: { strong: string; surface: string },
    verseId: number
  ) {
    if (longPressFiredRef.current) {
      longPressFiredRef.current = false;
      return;
    }
    if (rangeState.status === "selecting") {
      commitEndVerse(verseId);
      return;
    }
    setStrongsState(word);
  }

  // S123 W4 — build a RangeVerseRef from a verse_id in the currently
  // loaded chapter. Returns null if the verse isn't found in chapterDetail
  // (defensive — shouldn't happen because the handlers are only attached
  // to rendered verses).
  function buildVerseRef(verseId: number): RangeVerseRef | null {
    if (!chapterDetail) return null;
    const v = chapterDetail.verses.find((vv) => vv.id === verseId);
    if (!v) return null;
    return {
      verseId: v.id,
      verseNumber: v.verse_number,
      bookSlug: chapterDetail.book.slug,
      chapterNumber: chapterDetail.chapter.chapter_number,
    };
  }

  // S123 W4 — enter range mode with the long-pressed verse as the
  // anchor. Called from buildMenuSections's "Start range here" item.
  function startRangeFromVerse(verseId: number) {
    const ref = buildVerseRef(verseId);
    if (ref === null) return;
    setRangeState(rangeStartSelecting(ref));
  }

  // S123 W4 — commit an end verse to the in-progress range. Same-chapter
  // scope (per the §21 lock); cross-chapter taps are silently ignored
  // because chapterDetail's verses only carry the loaded chapter's ids.
  // After commit, open the post-capture action picker (RangeActionPicker)
  // which routes to HighlightPicker in multi-target mode for the Live
  // consumer.
  function commitEndVerse(verseId: number) {
    if (rangeState.status !== "selecting") return;
    const endRef = buildVerseRef(verseId);
    if (endRef === null) return;
    const next = rangeCommitEnd(rangeState, endRef);
    if (next.status !== "captured") return;
    if (!rangeIsSameChapter(next)) {
      // Defense in depth — same-chapter UX scope per §21 should prevent
      // this branch from firing in practice (end verses outside the
      // loaded chapter aren't in chapterDetail.verses), but if a
      // cross-chapter ref ever slips through, we cancel rather than
      // commit a state the W4 resolver can't handle.
      setRangeState(RANGE_IDLE);
      return;
    }
    setRangeState(next);
    setRangePickerOpen(true);
  }

  // S123 W4 — cancel range mode back to idle. Used by:
  //   - explicit Cancel button in the range-mode banner
  //   - Escape key (registered in a useEffect below)
  //   - chapter navigation (W2 surfaces silently cancel via the
  //     navigation-cancels-range useEffect below)
  //   - RangeActionPicker's Cancel / backdrop / Escape — any close path
  //     exits range mode entirely per the §21 "close = cancel" model.
  //     Partners who mis-tap the end verse start over via long-press →
  //     "Start range here."
  function cancelRange() {
    setRangeState(rangeCancel());
    setRangePickerOpen(false);
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
    setMenuState(null);
    setStrongsState(null);
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

  // S121 W3 — chapter Strong's-words reload alongside the chapter.
  // Single batched fetch (replaces N parallel per-verse calls). Public
  // endpoint, no auth, no tier gate — all partners get tap-on-word.
  // Failure leaves the map empty and verses render plain text (no
  // tappability) — graceful degradation per the publish-then-edit
  // posture.
  useEffect(() => {
    if (!selectedBookSlug || !selectedChapter) return;
    setWordsByVerse({});
    getChapterWords(selectedBookSlug, selectedChapter)
      .then((r: ChapterWordsResponse) => {
        const map: Record<number, VerseWord[]> = {};
        for (const v of r.verses) {
          map[v.verse_id] = v.words;
        }
        setWordsByVerse(map);
      })
      .catch(() => {
        // Network / 404 / transient — leave the map empty; verses
        // render plain text until the next chapter load.
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

  // S121 — chapter navigation (W2). Three input surfaces (touch swipe,
  // arrow keys, visible chrome buttons) converge on one navigation
  // handler. The handler resets currentVerse to 1 alongside the
  // book/chapter setters so the S116 reading-position save effect
  // doesn't briefly persist the previous chapter's last-visible verse
  // against the new chapter. Per DESIGN_LANGUAGE.md §19.
  //
  // Bounce affordance: when nav lands at a witness_category edge
  // (Genesis 1 prev / Revelation 22 next in canon; equivalent edges
  // in other categories), the disabled-direction arrow shakes briefly
  // to confirm the input was registered without changing the chapter.
  const [bouncePrev, setBouncePrev] = useState<boolean>(false);
  const [bounceNext, setBounceNext] = useState<boolean>(false);

  // Pre-compute targets so the chrome buttons can render disabled
  // when at a category edge. Recomputes on books/selection change.
  const prevTarget = useMemo(
    () => prevChapterTarget(books, selectedBookSlug, selectedChapter),
    [books, selectedBookSlug, selectedChapter]
  );
  const nextTarget = useMemo(
    () => nextChapterTarget(books, selectedBookSlug, selectedChapter, chaptersResp),
    [books, selectedBookSlug, selectedChapter, chaptersResp]
  );

  function triggerBouncePrev() {
    setBouncePrev(true);
    setTimeout(() => setBouncePrev(false), 300);
  }
  function triggerBounceNext() {
    setBounceNext(true);
    setTimeout(() => setBounceNext(false), 300);
  }

  // Core navigator. Both arrow buttons, the keyboard listener, the
  // swipe handler, and the bottom-of-chapter continuation row all
  // funnel here. Async because the prev-across-book-boundary case
  // needs to fetch the previous book's chapter count to learn its
  // last chapter number; forward navigation across a book boundary
  // is always chapter 1 so no fetch is needed there.
  async function navigatePrev() {
    if (prevTarget === null) {
      triggerBouncePrev();
      return;
    }
    if (prevTarget.chapter === "last") {
      // Cross-book backward — fetch the destination book's chapter
      // list to learn its last chapter number, then set state.
      try {
        const resp = await listChapters(prevTarget.bookSlug);
        const lastCh = lastChapterNumber(resp);
        setSelectedBookSlug(prevTarget.bookSlug);
        setSelectedChapter(lastCh);
        setCurrentVerse(1);
      } catch {
        // If the chapters fetch fails (network), fall back to
        // chapter 1 of the destination book rather than leaving the
        // nav in limbo.
        setSelectedBookSlug(prevTarget.bookSlug);
        setSelectedChapter(1);
        setCurrentVerse(1);
      }
    } else {
      setSelectedBookSlug(prevTarget.bookSlug);
      setSelectedChapter(prevTarget.chapter);
      setCurrentVerse(1);
    }
  }

  function navigateNext() {
    if (nextTarget === null) {
      triggerBounceNext();
      return;
    }
    // nextTarget.chapter is always a number (1 across book boundary;
    // currentChapter+1 within a book) per the helper contract.
    const ch =
      nextTarget.chapter === "last" ? 1 : nextTarget.chapter;
    setSelectedBookSlug(nextTarget.bookSlug);
    setSelectedChapter(ch);
    setCurrentVerse(1);
  }

  // S121 — global keyboard listener (left/right arrow keys). Skips
  // when focus is in an input/select/textarea/contenteditable so
  // typing in the picker doesn't pull the chapter sideways. Skips
  // when any modifier key is held so browser back/forward shortcuts
  // (Cmd+←, Alt+←) are unaffected.
  useEffect(() => {
    function onKeyDown(e: KeyboardEvent) {
      if (e.key !== "ArrowLeft" && e.key !== "ArrowRight") return;
      if (e.metaKey || e.ctrlKey || e.altKey) return;
      const target = e.target as HTMLElement | null;
      if (target) {
        const tag = target.tagName;
        if (
          tag === "INPUT" ||
          tag === "SELECT" ||
          tag === "TEXTAREA" ||
          target.isContentEditable
        ) {
          return;
        }
      }
      e.preventDefault();
      if (e.key === "ArrowLeft") {
        navigatePrev();
      } else {
        navigateNext();
      }
    }
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
    // navigatePrev / navigateNext close over prevTarget + nextTarget;
    // re-bind whenever those change so the listener always sees the
    // freshest selection state.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [prevTarget, nextTarget]);

  // S123 W4 — chapter navigation silently cancels range mode. Per
  // DESIGN_LANGUAGE.md §21, W4's range-selection UX is same-chapter
  // scope; a chapter-change implies the partner abandoned the range
  // (or arrived here from a navigation surface that fired during range
  // mode for an unrelated reason). Fires for every change to
  // selectedBookSlug or selectedChapter, including the S116 initial
  // hydrate (harmless because rangeState is already IDLE at mount).
  useEffect(() => {
    if (rangeState.status !== "idle") {
      setRangeState(RANGE_IDLE);
      setRangePickerOpen(false);
      setPickerRangeVerseIds(null);
    }
    // Intentionally only fires on chapter-change, not on rangeState
    // change (that would cause re-entry into the effect's own cancel).
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedBookSlug, selectedChapter]);

  // S123 W4 — Escape key cancels range mode at the App level. The
  // RangeActionPicker has its own Escape-to-close that closes the
  // picker (which calls cancelRange via onClose), so this only fires
  // for the SELECTING state (after "Start range here" but before the
  // end verse is tapped) where no modal owns Escape. The window-level
  // listener is registered for all rangeState states but no-ops outside
  // selecting to avoid stealing Escape from other surfaces.
  useEffect(() => {
    if (rangeState.status !== "selecting") return;
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") {
        cancelRange();
      }
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [rangeState.status]);

  // S121 — touch-swipe state. pointerdown records the start position
  // and pointer type; pointermove cancels the long-press timer if the
  // user is swiping (so a swipe over a verse doesn't open the picker
  // mid-swipe); pointerup checks the threshold + angle constraint and
  // navigates. Per DESIGN_LANGUAGE.md §19: 60px horizontal threshold,
  // |dx| > |dy| * 1.5 angle constraint, single-touch only, touch
  // pointerType only (mouse drag / stylus drag don't trigger nav).
  const swipeStartRef = useRef<{
    x: number;
    y: number;
    pointerType: string;
  } | null>(null);

  function onArticlePointerDown(e: React.PointerEvent) {
    if (e.pointerType !== "touch") {
      swipeStartRef.current = null;
      return;
    }
    swipeStartRef.current = {
      x: e.clientX,
      y: e.clientY,
      pointerType: e.pointerType,
    };
  }
  function onArticlePointerMove(e: React.PointerEvent) {
    const start = swipeStartRef.current;
    if (!start) return;
    const dx = e.clientX - start.x;
    if (Math.abs(dx) > 10) {
      // The user is swiping — cancel the verse-level long-press timer
      // so the swipe doesn't accidentally open the picker.
      handlePointerCancel();
    }
  }
  function onArticlePointerUp(e: React.PointerEvent) {
    const start = swipeStartRef.current;
    swipeStartRef.current = null;
    if (!start) return;
    const dx = e.clientX - start.x;
    const dy = e.clientY - start.y;
    if (Math.abs(dx) < 60) return;
    if (Math.abs(dx) <= Math.abs(dy) * 1.5) return;
    // Swipe LEFT (dx < 0) = next chapter; swipe RIGHT (dx > 0) = prev.
    if (dx < 0) {
      navigateNext();
    } else {
      navigatePrev();
    }
  }
  function onArticlePointerCancel() {
    swipeStartRef.current = null;
  }

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

      <div className="mb-6 flex flex-wrap items-center gap-3 font-sans">
        {/*
          S121 — chrome chapter-nav arrows (W2). Bordered-chrome button
          family per DESIGN_LANGUAGE.md §1 + §19; chevron glyph carries
          the §5 spectral-blue accent. Disabled state at category edges
          with 200ms shake on click for bounce affordance. 44px+ hit
          target per §13 accessibility floor.
        */}
        <button
          type="button"
          onClick={navigatePrev}
          aria-label="Previous chapter"
          aria-disabled={prevTarget === null}
          title="Previous chapter (← arrow key)"
          className={`flex items-center justify-center rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-base font-semibold text-[var(--reader-accent)] hover:opacity-90 ${
            prevTarget === null ? "opacity-30" : ""
          } ${bouncePrev ? "nav-bounce" : ""}`}
          style={{ minHeight: "2.5rem", minWidth: "2.5rem" }}
        >
          <span aria-hidden="true">←</span>
        </button>
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
        {/* S121 — chrome next arrow (W2). Mirrors the prev arrow above. */}
        <button
          type="button"
          onClick={navigateNext}
          aria-label="Next chapter"
          aria-disabled={nextTarget === null}
          title="Next chapter (→ arrow key)"
          className={`flex items-center justify-center rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-base font-semibold text-[var(--reader-accent)] hover:opacity-90 ${
            nextTarget === null ? "opacity-30" : ""
          } ${bounceNext ? "nav-bounce" : ""}`}
          style={{ minHeight: "2.5rem", minWidth: "2.5rem" }}
        >
          <span aria-hidden="true">→</span>
        </button>
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
        <article
          onPointerDown={onArticlePointerDown}
          onPointerMove={onArticlePointerMove}
          onPointerUp={onArticlePointerUp}
          onPointerCancel={onArticlePointerCancel}
          style={{ touchAction: "pan-y" }}
        >
          {/* S123 W4 — range-mode banner. Renders whenever the partner
              is in selecting mode (anchor pinned, waiting for end-verse
              tap). The captured state doesn't render this banner — the
              RangeActionPicker takes over the UI focus once a range is
              captured. Locked at DESIGN_LANGUAGE.md §21. */}
          {rangeState.status === "selecting" && (
            <div
              role="status"
              aria-live="polite"
              className="mb-3 flex items-center justify-between gap-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2"
            >
              <span className="text-base text-[var(--reader-text)]">
                <span className="text-[var(--reader-accent)]">Range mode</span>
                <span className="text-[var(--reader-muted)]">
                  {" "}— tap an end verse
                </span>
              </span>
              <button
                type="button"
                onClick={cancelRange}
                className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1 font-sans text-xs text-[var(--reader-text)] hover:bg-[var(--reader-bg)]"
                aria-label="Cancel range selection"
              >
                Cancel
              </button>
            </div>
          )}
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
                    // S121 W3 — align verse text against the chapter
                    // verse_words so individual Strong's-tagged words
                    // render as tappable spans. Falls back to a single
                    // plain segment if the words for this verse
                    // haven't arrived yet (progressive enrichment).
                    const verseWords = wordsByVerse[v.id] || [];
                    const segments: Segment[] =
                      verseWords.length > 0
                        ? alignVerse(v.text, verseWords, String(v.id))
                        : [{ kind: "plain", text: v.text }];
                    let content: React.ReactNode = (
                      <>
                        <sup className="verse-number mr-1">
                          {v.verse_number}
                        </sup>
                        {segments.map((seg, segIdx) => {
                          // S121 W3 — every segment ends with a trailing
                          // space so adjacent-segment renders preserve
                          // the original verse text's word spacing. The
                          // tokenizer dropped whitespace; the renderer
                          // rebuilds it. Without this, two tappable
                          // segments side-by-side (compound clusters
                          // like "Yahuah Elohim") render as "YahuahElohim",
                          // and tappable-then-plain ("Elohim" + "(God)")
                          // renders as "Elohim(God)". The trailing-space
                          // pattern matches the existing pattern for
                          // plain segments and reconstructs the source
                          // spacing accurately.
                          if (seg.kind === "plain") {
                            return (
                              <span key={`p-${segIdx}`}>{seg.text} </span>
                            );
                          }
                          // tappable
                          const word = {
                            strong: seg.strong,
                            surface: seg.surface,
                          };
                          return (
                            <span key={seg.key}>
                              <span
                                className="word-tappable"
                                onPointerDown={(e) => {
                                  e.stopPropagation();
                                  handlePointerDown(v.id, word);
                                }}
                                onPointerUp={(e) => {
                                  e.stopPropagation();
                                  handlePointerCancel();
                                }}
                                onPointerCancel={(e) => {
                                  e.stopPropagation();
                                  handlePointerCancel();
                                }}
                                onPointerLeave={handlePointerCancel}
                                onContextMenu={(e) => {
                                  e.stopPropagation();
                                  handleContextMenu(v.id, e, word);
                                }}
                                onClick={(e) => {
                                  e.stopPropagation();
                                  handleWordQuickTap(word, v.id);
                                }}
                              >
                                {seg.text}
                              </span>
                              {" "}
                            </span>
                          );
                        })}
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
                    // S123 W4 — range-mode visual + interaction state for
                    // this verse. Anchor = the start verse of an
                    // in-progress or captured range. inCapturedRange =
                    // any verse in [start, end] of a captured range
                    // (rendered with the tint until the action picker
                    // commits or cancels).
                    const isRangeAnchor =
                      (rangeState.status === "selecting" ||
                        rangeState.status === "captured") &&
                      rangeState.start?.verseId === v.id;
                    const inCapturedRange =
                      rangeState.status === "captured" &&
                      rangeState.start !== null &&
                      rangeState.end !== null &&
                      rangeIsSameChapter(rangeState) &&
                      v.verse_number >= rangeState.start.verseNumber &&
                      v.verse_number <= rangeState.end.verseNumber;
                    const rangeClass =
                      isRangeAnchor && rangeState.status === "selecting"
                        ? " range-anchor"
                        : inCapturedRange
                          ? " range-captured"
                          : "";
                    return (
                      <span
                        key={v.id}
                        data-verse-number={v.verse_number}
                        className={`verse-interactive${rangeClass}`}
                        onPointerDown={() => handlePointerDown(v.id)}
                        onPointerUp={handlePointerCancel}
                        onPointerCancel={handlePointerCancel}
                        onPointerLeave={handlePointerCancel}
                        onContextMenu={(e) => handleContextMenu(v.id, e)}
                        onClick={(e) => {
                          // Suppress click event if long-press already fired
                          // (so opening the menu doesn't also count as a
                          // verse-text tap if we wire that in later).
                          if (longPressFiredRef.current) {
                            e.preventDefault();
                            longPressFiredRef.current = false;
                            return;
                          }
                          // S123 W4 — in range-selecting mode, any verse
                          // click is the end-verse commit. The
                          // word-tappable spans' own onClick handles the
                          // word-level case via handleWordQuickTap's
                          // selecting-mode branch; this is the
                          // plain-text-between-words case (and the
                          // fallback when verse_words haven't arrived).
                          if (rangeState.status === "selecting") {
                            commitEndVerse(v.id);
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

          {/*
            S121 — bottom-of-chapter continuation row (W2). Duplicate
            prev/next pair after the cross-reference card, before the
            footer, as the natural reading-flow continuation. Larger
            affordance than the chrome arrows; shows the destination
            chapter's label as a preview when known. The reader who
            finishes a chapter does not have to scroll back up to the
            picker. Per DESIGN_LANGUAGE.md §19.
          */}
          <nav
            aria-label="Chapter navigation"
            className="mt-10 flex items-stretch justify-between gap-3 border-t border-[var(--reader-rule)] pt-6 font-sans"
          >
            <button
              type="button"
              onClick={navigatePrev}
              aria-label="Previous chapter"
              aria-disabled={prevTarget === null}
              disabled={prevTarget === null}
              className={`flex flex-1 items-center justify-start gap-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 text-left text-base text-[var(--reader-text)] hover:opacity-90 disabled:opacity-30 disabled:cursor-not-allowed ${
                bouncePrev ? "nav-bounce" : ""
              }`}
            >
              <span
                aria-hidden="true"
                className="text-lg font-semibold text-[var(--reader-accent)]"
              >
                ←
              </span>
              <span className="flex flex-col">
                <span className="text-xs uppercase tracking-wide text-[var(--reader-muted)]">
                  Previous
                </span>
                <span className="font-medium">
                  {prevTarget
                    ? targetLabel(books, prevTarget)
                    : "—"}
                </span>
              </span>
            </button>
            <button
              type="button"
              onClick={navigateNext}
              aria-label="Next chapter"
              aria-disabled={nextTarget === null}
              disabled={nextTarget === null}
              className={`flex flex-1 items-center justify-end gap-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 text-right text-base text-[var(--reader-text)] hover:opacity-90 disabled:opacity-30 disabled:cursor-not-allowed ${
                bounceNext ? "nav-bounce" : ""
              }`}
            >
              <span className="flex flex-col">
                <span className="text-xs uppercase tracking-wide text-[var(--reader-muted)]">
                  Next
                </span>
                <span className="font-medium">
                  {nextTarget
                    ? targetLabel(books, nextTarget)
                    : "—"}
                </span>
              </span>
              <span
                aria-hidden="true"
                className="text-lg font-semibold text-[var(--reader-accent)]"
              >
                →
              </span>
            </button>
          </nav>
        </article>
      )}

      {/*
        S121 W3 — modal stack. Long-press / right-click opens the
        VerseActionMenu first; menu items route to HighlightPicker
        (S113) or StrongsLookup (S121). Quick-tap on a tappable word
        bypasses the menu and opens StrongsLookup directly.
      */}
      {menuState !== null && chapterDetail && (
        <VerseActionMenu
          scopeLabel={menuState.word ? menuState.word.surface : "Verse actions"}
          sections={buildMenuSections(
            menuState,
            chapterDetail.verses.find(
              (v) => v.id === menuState.verseId
            ) ?? null,
            chapterDetail.book.title,
            chapterDetail.chapter.chapter_number,
            // S122 — partner tier drives stub state. Tier-locked stubs
            // render as Coming soon (not locked) for partners already at
            // or above the required tier; /pricing routes only fire for
            // partners who genuinely need to upgrade.
            me?.tier ?? null,
            {
              onStrongs: (w) => setStrongsState(w),
              onHighlight: (vid) => setPickerVerseId(vid),
              onStartRange: (vid) => startRangeFromVerse(vid),
            }
          )}
          onClose={() => setMenuState(null)}
        />
      )}

      {strongsState !== null && (
        <StrongsLookup
          strongNumber={strongsState.strong}
          surface={strongsState.surface}
          onNavigate={(bookSlug, chapterNumber, verseNumber) => {
            // S121 W3 iteration — concordance tap-to-navigate.
            // Mirrors the S121 W2 nav handlers' state-reset
            // contract: set book/chapter together and reset
            // currentVerse so the S116 save effect doesn't briefly
            // persist the previous chapter's last-visible verse
            // against the new (book, chapter) pair. The target
            // verseNumber is set as currentVerse so a refresh
            // resumes at the right place; the post-load scroll
            // effect lands the partner on the verse via the
            // initialScrollVerse path (set when target > 1).
            setSelectedBookSlug(bookSlug);
            setSelectedChapter(chapterNumber);
            setCurrentVerse(verseNumber);
            if (verseNumber > 1) {
              setInitialScrollVerse(verseNumber);
            }
          }}
          onClose={() => setStrongsState(null)}
        />
      )}

      {/*
        S123 W4 — RangeActionPicker opens automatically when the
        range-selection mechanic captures a range (rangeState transitions
        to "captured" via commitEndVerse). Three actions in the picker:
        Highlight range (Live this wheel) + Copy/Share with watermark
        (Coming-soon, W7). Any close path (Cancel, ✕, backdrop, Escape)
        exits range mode entirely per §21 "close = cancel" model.
      */}
      {rangePickerOpen &&
        rangeState.status === "captured" &&
        chapterDetail &&
        rangeIsSameChapter(rangeState) && (
          <RangeActionPicker
            rangeRef={`${chapterDetail.book.title} ${chapterDetail.chapter.chapter_number}:${rangeState.start!.verseNumber}${
              rangeState.start!.verseNumber !== rangeState.end!.verseNumber
                ? `–${rangeState.end!.verseNumber}`
                : ""
            }`}
            rangeSize={sameChapterRangeSize(rangeState)}
            onHighlight={() => {
              const ids = resolveSameChapterRange(
                rangeState,
                chapterDetail.verses
              );
              if (ids.length === 0) return;
              setPickerRangeVerseIds(ids);
              setRangePickerOpen(false);
              // Leave rangeState as captured for the duration of the
              // multi-target HighlightPicker session; cleared when the
              // picker closes (see HighlightPicker invocation below).
            }}
            onClose={cancelRange}
          />
        )}

      {/*
        S123 W4 — multi-target HighlightPicker invocation. Distinct from
        the single-verse pickerVerseId branch below so the two modes
        stay cleanly separable (single-verse keeps the S117 chips +
        cap UX unchanged; multi-target uses the new mode HighlightPicker
        rendering). targetVerseIds is what flips the picker into
        multi-target mode.
      */}
      {pickerRangeVerseIds !== null && pickerRangeVerseIds.length > 0 && (
        <HighlightPicker
          verseId={pickerRangeVerseIds[0]}
          current={[]}
          userTier={(me?.tier ?? "free") as ContentTier}
          targetVerseIds={pickerRangeVerseIds}
          onSaved={(h) =>
            // Each successful per-verse commit calls back here once.
            // Reuse the S117 multi-mark reducer: append + dedup-on-tuple.
            setHighlightsByVerse((prev) => {
              const existing = prev[h.verse_id] ?? [];
              const filtered = existing.filter(
                (m) => !(m.color === h.color && m.style === h.style)
              );
              return { ...prev, [h.verse_id]: [...filtered, h] };
            })
          }
          // onDeleted is unused in multi-target mode (chips row hidden)
          // but the prop is required by the component.
          onDeleted={() => {}}
          onClose={() => {
            setPickerRangeVerseIds(null);
            // Exit range mode fully on picker close (success or cancel).
            cancelRange();
          }}
        />
      )}

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

/**
 * S121 W3 — build the section-grouped menu for VerseActionMenu.
 * S122 — full stub catalog. Every future-wheel item renders today as
 * a dimmed stub (tier-locked or coming-soon) so partners see the full
 * tool catalog up front. See DESIGN_LANGUAGE.md §20 for the locked
 * stub catalog + the three render states.
 *
 * Five locked categories per DESIGN_LANGUAGE.md §20:
 *
 *   - Word study (word scope) — Strong's (live); BDB / Thayer's /
 *     Vine's / interlinear / nikkudot stubs (Wheels 9-11; Library)
 *   - Marking (verse scope) — Highlight (live); Bookmark stub (W5)
 *   - Notes (verse scope) — Add note stub (W5, Free); Open notes
 *     for this verse stub (W5, Notes)
 *   - Cross-references (verse scope) — Treasury / Nave's / Related
 *     passages stubs (Wheels 9, 12; Library)
 *   - Share (verse scope) — Copy verse (live); Share-with-watermark
 *     + Multi-verse range stubs (W6, Free)
 *
 * Word-study stubs are language-conditional: BDB + Nikkudot fire on
 * H#### words only, Thayer's fires on G#### words only. The other
 * stubs are scope-conditional only.
 *
 * Partner-tier-aware: a tier-locked stub renders as Coming soon (not
 * locked) when the partner is already at or above the required tier.
 * The /pricing route is reserved for partners who genuinely need to
 * upgrade to use the eventual feature.
 *
 * Copy uses navigator.clipboard.writeText directly with the verse
 * text + reference, bypassing DOM selection entirely. This avoids the
 * fight with the S113 long-press picker AND the whitespace-artifact
 * problem of selecting-across-spans inside the W3 word-tappable
 * structure.
 */
function partnerAtOrAboveTier(
  partnerTier: PartnerTier | null,
  required: "notes" | "library"
): boolean {
  if (!partnerTier || partnerTier === "free") return false;
  if (required === "notes") {
    // Any paid tier qualifies for Notes-tier features.
    return (
      partnerTier === "study_notes" ||
      partnerTier === "extras" ||
      partnerTier === "complete_study" ||
      partnerTier === "everything"
    );
  }
  // Library tier — study_notes is below.
  return (
    partnerTier === "extras" ||
    partnerTier === "complete_study" ||
    partnerTier === "everything"
  );
}

function makeTierStub(
  key: string,
  label: string,
  tier: "notes" | "library",
  partnerTier: PartnerTier | null
): MenuItem {
  if (partnerAtOrAboveTier(partnerTier, tier)) {
    // Partner already qualifies; render as Coming soon (no /pricing route).
    return { key, label, comingSoon: true, onSelect: () => {} };
  }
  return {
    key,
    label,
    lockedTier: tier,
    onSelect: () => {
      // Browser-native navigation per App.tsx routing model (see line
      // 119 comment) — no react-router import needed.
      if (typeof window !== "undefined") {
        window.location.href = "/pricing";
      }
    },
  };
}

function makeFreeComingSoonStub(key: string, label: string): MenuItem {
  return { key, label, comingSoon: true, onSelect: () => {} };
}

function buildMenuSections(
  state: {
    verseId: number;
    word: { strong: string; surface: string } | null;
  },
  verse: { id: number; verse_number: number; text: string } | null,
  bookTitle: string,
  chapterNumber: number,
  partnerTier: PartnerTier | null,
  handlers: {
    onStrongs: (w: { strong: string; surface: string }) => void;
    onHighlight: (verseId: number) => void;
    /** S123 W4 — "Start range here" in the new Range section. Anchors the
     *  long-pressed verse as the range start and enters selecting mode. */
    onStartRange: (verseId: number) => void;
  }
): MenuSection[] {
  // ── Word study (word scope only) ─────────────────────────────────
  const wordStudy: MenuItem[] = [];
  if (state.word) {
    const isHebrew = state.word.strong.startsWith("H");
    const isGreek = state.word.strong.startsWith("G");

    wordStudy.push({
      key: "strongs",
      label: "Strong's lookup",
      icon: isGreek ? "G" : "H",
      hint: state.word.strong,
      onSelect: () => handlers.onStrongs(state.word!),
    });
    if (isHebrew) {
      wordStudy.push(makeTierStub("bdb", "BDB", "library", partnerTier));
    }
    if (isGreek) {
      wordStudy.push(makeTierStub("thayers", "Thayer's", "library", partnerTier));
    }
    wordStudy.push(
      makeTierStub("vines", "Vine's expository", "library", partnerTier)
    );
    wordStudy.push(
      makeTierStub(
        "interlinear",
        isGreek ? "Greek interlinear" : "Hebrew interlinear",
        "library",
        partnerTier
      )
    );
    if (isHebrew) {
      wordStudy.push(
        makeTierStub("nikkudot", "Nikkudot siblings", "library", partnerTier)
      );
    }
  }

  // ── Marking (verse scope) ────────────────────────────────────────
  const marking: MenuItem[] = [];
  marking.push({
    key: "highlight",
    label: state.word ? "Highlight verse" : "Highlight",
    icon: "✎",
    onSelect: () => handlers.onHighlight(state.verseId),
  });
  marking.push({
    ...makeFreeComingSoonStub("bookmark", "Bookmark"),
    icon: "⚑",
  });

  // ── Notes (verse scope) ──────────────────────────────────────────
  const notes: MenuItem[] = [];
  notes.push({
    ...makeFreeComingSoonStub("add-note", "Add note"),
    icon: "✏",
  });
  notes.push({
    ...makeTierStub(
      "open-notes-for-verse",
      "Open notes for this verse",
      "notes",
      partnerTier
    ),
    icon: "☰",
  });

  // ── Cross-references (verse scope) ───────────────────────────────
  const crossRefs: MenuItem[] = [];
  crossRefs.push(makeTierStub("treasury", "Treasury (TSK)", "library", partnerTier));
  crossRefs.push(makeTierStub("naves", "Nave's topical", "library", partnerTier));
  crossRefs.push(
    makeTierStub("related-passages", "Related passages", "library", partnerTier)
  );

  // ── Share (verse scope) ──────────────────────────────────────────
  const share: MenuItem[] = [];
  if (verse) {
    share.push({
      key: "copy",
      label: "Copy verse",
      icon: "⧉",
      hint: `${bookTitle} ${chapterNumber}:${verse.verse_number}`,
      onSelect: () => {
        // Format: "Genesis 1:1 — In the beginning..."
        //          "  — Remnant of Promise Official Study Bible"
        // Bypasses DOM selection entirely; uses the in-memory v.text
        // which has the correct spacing regardless of how the
        // tappable-span render produces visible output.
        const text =
          `${bookTitle} ${chapterNumber}:${verse.verse_number} — ` +
          `${verse.text}\n\n— Remnant of Promise Official Study Bible`;
        if (
          typeof navigator !== "undefined" &&
          navigator.clipboard &&
          typeof navigator.clipboard.writeText === "function"
        ) {
          navigator.clipboard.writeText(text).catch(() => {
            // Clipboard API can fail in some contexts (insecure
            // origin, permissions denied). Silent fallback — partner
            // can use the Share item when W6 ships.
          });
        }
      },
    });
  }
  share.push({
    ...makeFreeComingSoonStub("share-watermark", "Share with watermark"),
    icon: "↗",
  });

  // ── Range (verse scope, added S123 — Wheel 4 of the pre-launch sweep) ─
  // One shared menu entry for the range-selection mechanic per
  // DESIGN_LANGUAGE.md §21. Replaces the S122-locked Share-section
  // "Multi-verse range" Coming-soon stub — its placeholder role is
  // fulfilled by the actual Range section + post-capture action picker.
  // Live + Free tier this wheel because multi-verse highlight is free
  // per §9; future W7 Copy + Share-with-watermark land as additional
  // Live items in the RangeActionPicker, not as new top-level menu items.
  const range: MenuItem[] = [];
  range.push({
    key: "start-range",
    label: "Start range here",
    icon: "↔",
    onSelect: () => handlers.onStartRange(state.verseId),
  });

  return [
    { title: "Word study", items: wordStudy },
    { title: "Marking", items: marking },
    { title: "Notes", items: notes },
    { title: "Cross-references", items: crossRefs },
    { title: "Share", items: share },
    { title: "Range", items: range },
  ];
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
