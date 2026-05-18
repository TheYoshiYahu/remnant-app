import { useEffect, useMemo, useState } from "react";
import {
  type BookChaptersResponse,
  type BookSummary,
  type ChapterDetail,
  type SubscriptionMe,
  getChapter,
  getSubscriptionMe,
  listBooks,
  listChapters,
} from "./lib/api";
import Pricing from "./routes/Pricing";
import Manage from "./routes/Manage";
import ChapterEndCard from "./components/ChapterEndCard";

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
      <header className="mb-6 border-b border-[var(--reader-rule)] pb-4">
        <div className="flex items-start justify-between gap-4">
          <div>
            <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
              The Remnant of Promise Official Study Bible
            </h1>
            <p className="mt-1 text-sm text-[var(--reader-muted)]">
              Restored Names Edition
            </p>
          </div>
          {me && me.status === "active" ? (
            <a
              href="/manage"
              className="self-start whitespace-nowrap rounded border border-[var(--reader-rule)] bg-white px-3 py-1.5 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
            >
              Manage partnership
            </a>
          ) : me && me.status === "none" ? (
            <a
              href="/pricing"
              className="self-start whitespace-nowrap rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-white hover:opacity-90"
            >
              Become a partner
            </a>
          ) : null}
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
            }}
            className="rounded border border-[var(--reader-rule)] bg-white px-2 py-1 text-[var(--reader-text)]"
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
            onChange={(e) => setSelectedChapter(Number(e.target.value))}
            className="rounded border border-[var(--reader-rule)] bg-white px-2 py-1 text-[var(--reader-text)]"
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
              <p className="mb-3 text-sm italic text-[var(--reader-muted)]">
                {chapterDetail.chapter.chapter_title}
              </p>
            )}
          <div className="mt-4 leading-relaxed text-[1.05rem] text-[var(--reader-text)]">
            {chapterDetail.verses.map((v) => (
              <span key={v.id}>
                <sup className="verse-number">{v.verse_number}</sup>
                {v.text}{" "}
              </span>
            ))}
          </div>

          {chapterDetail.chapter_intro && (
            <aside className="mt-8 border-t border-[var(--reader-rule)] pt-4 text-sm text-[var(--reader-muted)]">
              <h3 className="mb-1 font-sans font-semibold uppercase tracking-wide text-xs">
                Commentary
              </h3>
              <p>{chapterDetail.chapter_intro}</p>
            </aside>
          )}

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

      <footer className="mt-12 border-t border-[var(--reader-rule)] pt-4 font-sans text-xs text-[var(--reader-muted)]">
        Live from{" "}
        <code className="rounded bg-white px-1 py-0.5">
          api.bible.remnantofpromise.org/v1
        </code>
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
