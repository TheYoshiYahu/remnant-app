import { useEffect, useMemo, useState } from "react";
import {
  type BookChaptersResponse,
  type BookSummary,
  type ChapterDetail,
  getChapter,
  listBooks,
  listChapters,
} from "./lib/api";

/**
 * Session 13 minimum-useful checkpoint:
 *   reader-on-localhost-5173 against the live API at bible.remnantofpromise.org,
 *   showing Genesis 1 from the Protestant 66 canon (KJV-restored) by default
 *   and letting the reader pick any other canon book / chapter.
 *
 * No auth, no persisted state, no installable manifest yet — those land in
 * session 14 (PWA installable + production deploy). The voice gate runs
 * server-side at ingest, so the reader just renders verse.text as the
 * already-restored prose ("Yahuah (God)", "Yashar'el (Israel)", "Melek
 * Tsadiq (Melchizedek)", etc.).
 */
export default function App() {
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

  // Books load once on mount.
  useEffect(() => {
    listBooks()
      .then((bs) => {
        setBooks(bs);
        setBooksError(null);
      })
      .catch((e) => setBooksError(String(e)));
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
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          The Remnant of Promise Official Study Bible
        </h1>
        <p className="mt-1 text-sm text-[var(--reader-muted)]">
          Restored Names Edition · Session 13 dev preview
        </p>
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
                  <option key={b.slug} value={b.slug}>
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
        </article>
      )}

      <footer className="mt-12 border-t border-[var(--reader-rule)] pt-4 font-sans text-xs text-[var(--reader-muted)]">
        Live from{" "}
        <code className="rounded bg-white px-1 py-0.5">
          bible.remnantofpromise.org/v1
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
