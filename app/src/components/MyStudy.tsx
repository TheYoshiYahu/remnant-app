/**
 * MyStudy — Session 203 (Session C): the personal apparatus as a
 * flagship surface, per the S203 signed-off proof.
 *
 * One full-screen surface holding ALL of a partner's notes, bookmarks,
 * and highlights: searchable (text + highlight-color filter), grouped
 * (book / date / collection on All-Notes-Bookmarks; color sections
 * with fill/underline/outline sub-groups on the Highlights tab),
 * collected (flat tags presented folder-style), exportable (Markdown +
 * PDF via lib/study-export), and fast to jump back into the text from.
 *
 * Opens from the chrome-header "My Study" button as a full-screen
 * overlay over the Reader (same modal family as BookmarksIndex /
 * NotesPanel, sized up) so onNavigate can ride App.tsx's existing
 * jumpToVerseRef without a router.
 *
 * Tier shape (Yoshi's S203 calls): free partners see the same home
 * with their basic marks + the 10-note cap meter; Search, Collections,
 * and Export carry the metallic Study Notes chip at FULL OPACITY
 * (no greyed text — S127/S201 lock) and route to /pricing on tap.
 * Paid (study_notes+, signalled by note_cap === null from the index
 * payload) gets the whole apparatus, plus per-note edit of collections
 * and delete (soft-archive server-side).
 *
 * Data: one fetch of GET /v1/study/index on open. Search, the color
 * filter, grouping, and export run client-side over the payload — a
 * partner's apparatus is hundreds of rows at most, and
 * instant-as-you-type beats a round trip.
 */

import { useEffect, useMemo, useState, type CSSProperties } from "react";
import {
  getStudyIndex,
  updateNote,
  deleteNote,
  HIGHLIGHT_HEX,
  HIGHLIGHT_PALETTE_ORDER,
  type BookmarkIndexEntry,
  type BookSummary,
  type HighlightColor,
  type MarkStyle,
  type StudyHighlightEntry,
  type StudyIndexResponse,
  type StudyNoteEntry,
} from "../lib/api";
import {
  buildStudyMarkdown,
  downloadMarkdown,
  openStudyPrintView,
} from "../lib/study-export";
import { loadStoredNativeToken } from "../lib/native-auth";

interface MyStudyProps {
  /** Books list from App state — drives canonical book ordering in
   *  groups + export. */
  books: BookSummary[];
  /** Jump into the reader at a verse; wired to App's jumpToVerseRef. */
  onNavigate: (
    bookSlug: string,
    chapterNumber: number,
    verseNumber: number,
  ) => void;
  onClose: () => void;
}

type StudyTab = "all" | "notes" | "bookmarks" | "highlights";
type GroupMode = "book" | "date" | "collection";

// S201 metallic-blue control register (mirrors ChapterEndCard's
// MORE_PILL_CLASSES) — the tier chip + unlock pill family.
const TIER_CHIP_CLASSES =
  "inline-flex items-center rounded px-2 py-0.5 border shadow-sm " +
  "font-sans text-[10px] font-semibold uppercase tracking-wider " +
  "border-[#9FD0FF] bg-gradient-to-r from-[#0E2C50] via-[#2E7BD6] to-[#0E2C50] text-[#EAF4FF]";
const UNLOCK_PILL_CLASSES =
  "inline-flex items-center rounded-full px-4 py-1.5 border shadow-sm hover:opacity-90 " +
  "font-sans text-xs font-semibold " +
  "border-[#9FD0FF] bg-gradient-to-r from-[#0E2C50] via-[#2E7BD6] to-[#0E2C50] text-[#EAF4FF]";

const COLOR_DISPLAY: Record<HighlightColor, string> = {
  neon_yellow: "Neon yellow",
  crimson: "Crimson",
  tangerine: "Tangerine",
  honey: "Honey",
  sage: "Sage",
  emerald: "Emerald",
  teal: "Teal",
  sky_blue: "Sky blue",
  periwinkle: "Periwinkle",
  lilac: "Lilac",
  magenta: "Magenta",
  rose: "Rose",
  parchment: "Parchment",
};

const STYLE_ORDER: readonly MarkStyle[] = ["fill", "underline", "outline"];
const STYLE_DISPLAY: Record<MarkStyle, string> = {
  fill: "Fill",
  underline: "Underline",
  outline: "Outline",
};

// ----- unified row model ----------------------------------------------------

type StudyItem =
  | { kind: "note"; id: string; entry: StudyNoteEntry }
  | { kind: "bookmark"; id: string; entry: BookmarkIndexEntry }
  | { kind: "highlight"; id: string; entry: StudyHighlightEntry };

function itemCreatedAt(it: StudyItem): string {
  return it.entry.created_at;
}

function itemTags(it: StudyItem): string[] {
  if (it.kind === "highlight") return [];
  return it.entry.tags ?? [];
}

function itemBookSlug(it: StudyItem): string | null {
  return it.entry.book_slug ?? null;
}

function itemRef(it: StudyItem): string | null {
  if (it.kind === "note") return it.entry.verse_ref;
  return `${it.entry.book_title} ${it.entry.chapter_number}:${it.entry.verse_number}`;
}

function itemVerseText(it: StudyItem): string | null {
  return it.entry.verse_text ?? null;
}

function itemColor(it: StudyItem): HighlightColor | null {
  if (it.kind === "highlight") return it.entry.color;
  if (it.kind === "bookmark") {
    return (it.entry.color_tint as HighlightColor | null) ?? null;
  }
  return null;
}

function fmtShortDate(iso: string): string {
  try {
    return new Date(iso).toLocaleDateString(undefined, {
      month: "short",
      day: "numeric",
    });
  } catch {
    return iso.slice(0, 10);
  }
}

function fmtMonthGroup(iso: string): string {
  try {
    return new Date(iso).toLocaleDateString(undefined, {
      year: "numeric",
      month: "long",
    });
  } catch {
    return iso.slice(0, 7);
  }
}

export default function MyStudy({ books, onNavigate, onClose }: MyStudyProps) {
  const [data, setData] = useState<StudyIndexResponse | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [tab, setTab] = useState<StudyTab>("all");
  const [groupMode, setGroupMode] = useState<GroupMode>("book");
  const [query, setQuery] = useState<string>("");
  const [colorFilter, setColorFilter] = useState<HighlightColor | null>(null);
  const [activeCollection, setActiveCollection] = useState<string | null>(null);
  const [exportOpen, setExportOpen] = useState<boolean>(false);
  // Per-note inline collections editor (paid): note id → draft text.
  const [editingTagsFor, setEditingTagsFor] = useState<string | null>(null);
  const [tagsDraft, setTagsDraft] = useState<string>("");
  const [busyNoteId, setBusyNoteId] = useState<string | null>(null);

  const isPaid = data !== null && data.note_cap === null;

  useEffect(() => {
    let cancelled = false;
    // S233 — hydrate the native JWT from Capacitor Preferences BEFORE the
    // first study-index fetch. Opening My Study via the Today-hub deep link
    // (/read?study=1) mounts this component before the token cache is warm on
    // native shells, so getStudyIndex() would fire unauthenticated, come back
    // free-tier (note_cap !== null), and falsely render the "purchase this
    // feature" paywall to a paying partner. Awaiting the token load first
    // mirrors the /me and notes fetches in App.tsx (S178/S200/S201 pattern).
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      getStudyIndex()
        .then((res) => {
          if (!cancelled) setData(res);
        })
        .catch((e) => {
          if (!cancelled) {
            setError(
              e instanceof Error
                ? e.message
                : "Couldn't load your study — try again.",
            );
          }
        });
    });
    return () => {
      cancelled = true;
    };
  }, []);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  const bookOrder = useMemo(() => {
    const m: Record<string, number> = {};
    for (const b of books) m[b.slug] = b.canonical_order;
    return m;
  }, [books]);

  const colorLabels = useMemo(() => {
    const m: Record<string, string> = {};
    for (const l of data?.labels ?? []) {
      if (l.label) m[l.color] = l.label;
    }
    return m;
  }, [data]);

  // Collections = union of tags across notes + bookmarks, with counts.
  const collections = useMemo(() => {
    const counts = new Map<string, number>();
    for (const n of data?.notes ?? []) {
      for (const t of n.tags ?? []) counts.set(t, (counts.get(t) ?? 0) + 1);
    }
    for (const b of data?.bookmarks ?? []) {
      for (const t of b.tags ?? []) counts.set(t, (counts.get(t) ?? 0) + 1);
    }
    return [...counts.entries()].sort((a, b) => a[0].localeCompare(b[0]));
  }, [data]);

  const allItems = useMemo<StudyItem[]>(() => {
    if (!data) return [];
    return [
      ...data.notes.map(
        (n): StudyItem => ({ kind: "note", id: `n-${n.id}`, entry: n }),
      ),
      ...data.bookmarks.map(
        (b): StudyItem => ({ kind: "bookmark", id: `b-${b.id}`, entry: b }),
      ),
      ...data.highlights.map(
        (h): StudyItem => ({ kind: "highlight", id: `h-${h.id}`, entry: h }),
      ),
    ];
  }, [data]);

  // ----- search + filters (client-side over the payload) -----

  const visibleItems = useMemo<StudyItem[]>(() => {
    let items = allItems;
    if (tab === "notes") items = items.filter((i) => i.kind === "note");
    if (tab === "bookmarks") items = items.filter((i) => i.kind === "bookmark");
    if (tab === "highlights") {
      items = items.filter((i) => i.kind === "highlight");
    }
    if (activeCollection) {
      items = items.filter((i) => itemTags(i).includes(activeCollection));
    }
    if (colorFilter) {
      items = items.filter((i) => itemColor(i) === colorFilter);
    }
    const q = query.trim().toLowerCase();
    if (q) {
      items = items.filter((i) => {
        const hay: string[] = [];
        const ref = itemRef(i);
        if (ref) hay.push(ref);
        const vt = itemVerseText(i);
        if (vt) hay.push(vt);
        hay.push(...itemTags(i));
        if (i.kind === "note") {
          hay.push(i.entry.body);
          if (i.entry.title) hay.push(i.entry.title);
        }
        if (i.kind === "bookmark" && i.entry.short_description) {
          hay.push(i.entry.short_description);
        }
        if (i.kind === "highlight") {
          hay.push(COLOR_DISPLAY[i.entry.color], i.entry.style);
          const label = colorLabels[i.entry.color];
          if (label) hay.push(label);
        }
        return hay.some((s) => s.toLowerCase().includes(q));
      });
    }
    return items;
  }, [allItems, tab, activeCollection, colorFilter, query, colorLabels]);

  // ----- grouping -----

  interface Group {
    key: string;
    heading: string;
    headingMeta?: string;
    items: StudyItem[];
  }

  const groups = useMemo<Group[]>(() => {
    // Highlights tab: color sections → style sub-grouping happens at
    // render. Group by color in palette order.
    if (tab === "highlights") {
      const byColor = new Map<HighlightColor, StudyItem[]>();
      for (const it of visibleItems) {
        if (it.kind !== "highlight") continue;
        const list = byColor.get(it.entry.color) ?? [];
        list.push(it);
        byColor.set(it.entry.color, list);
      }
      return HIGHLIGHT_PALETTE_ORDER.filter((c) => byColor.has(c)).map(
        (c) => ({
          key: `color-${c}`,
          heading: COLOR_DISPLAY[c],
          headingMeta: colorLabels[c] ? `“${colorLabels[c]}”` : undefined,
          items: byColor.get(c) as StudyItem[],
        }),
      );
    }
    if (groupMode === "date") {
      const byMonth = new Map<string, StudyItem[]>();
      const sorted = [...visibleItems].sort((a, b) =>
        itemCreatedAt(b).localeCompare(itemCreatedAt(a)),
      );
      for (const it of sorted) {
        const k = fmtMonthGroup(itemCreatedAt(it));
        const list = byMonth.get(k) ?? [];
        list.push(it);
        byMonth.set(k, list);
      }
      return [...byMonth.entries()].map(([k, items]) => ({
        key: `month-${k}`,
        heading: k,
        items,
      }));
    }
    if (groupMode === "collection") {
      const byColl = new Map<string, StudyItem[]>();
      const loose: StudyItem[] = [];
      for (const it of visibleItems) {
        const tags = itemTags(it);
        if (tags.length === 0) {
          loose.push(it);
          continue;
        }
        for (const t of tags) {
          const list = byColl.get(t) ?? [];
          list.push(it);
          byColl.set(t, list);
        }
      }
      const out: Group[] = [...byColl.entries()]
        .sort((a, b) => a[0].localeCompare(b[0]))
        .map(([k, items]) => ({
          key: `coll-${k}`,
          heading: k,
          items,
        }));
      if (loose.length > 0) {
        out.push({ key: "coll--none", heading: "No collection", items: loose });
      }
      return out;
    }
    // Default: by book in canonical order; unanchored notes trail.
    const byBook = new Map<string, { title: string; items: StudyItem[] }>();
    const unanchored: StudyItem[] = [];
    for (const it of visibleItems) {
      const slug = itemBookSlug(it);
      if (!slug) {
        unanchored.push(it);
        continue;
      }
      const title =
        it.kind === "note"
          ? (it.entry.verse_ref ?? "").replace(/\s+\d+:\d+$/, "") || slug
          : it.entry.book_title;
      const g = byBook.get(slug) ?? { title, items: [] };
      g.items.push(it);
      byBook.set(slug, g);
    }
    const out: Group[] = [...byBook.entries()]
      .sort((a, b) => {
        const ao = bookOrder[a[0]];
        const bo = bookOrder[b[0]];
        if (ao !== undefined && bo !== undefined) return ao - bo;
        if (ao !== undefined) return -1;
        if (bo !== undefined) return 1;
        return a[1].title.localeCompare(b[1].title);
      })
      .map(([slug, g]) => ({
        key: `book-${slug}`,
        heading: g.title,
        items: g.items,
      }));
    if (unanchored.length > 0) {
      out.push({
        key: "book--none",
        heading: "Notes without an anchor",
        items: unanchored,
      });
    }
    return out;
  }, [visibleItems, tab, groupMode, colorLabels, bookOrder]);

  // ----- actions -----

  function goUpgrade() {
    window.location.href = "/pricing";
  }

  function handleNavigate(it: StudyItem) {
    if (it.kind === "note") {
      const n = it.entry;
      if (n.book_slug && n.chapter_number && n.verse_number) {
        onNavigate(n.book_slug, n.chapter_number, n.verse_number);
        onClose();
      }
      return;
    }
    onNavigate(
      it.entry.book_slug,
      it.entry.chapter_number,
      it.entry.verse_number,
    );
    onClose();
  }

  function beginEditTags(n: StudyNoteEntry) {
    setEditingTagsFor(n.id);
    setTagsDraft((n.tags ?? []).join(", "));
  }

  async function commitEditTags(n: StudyNoteEntry) {
    const tags = tagsDraft
      .split(",")
      .map((t) => t.trim())
      .filter((t) => t.length > 0);
    setBusyNoteId(n.id);
    try {
      await updateNote(n.id, { tags });
      setData((prev) =>
        prev
          ? {
              ...prev,
              notes: prev.notes.map((x) =>
                x.id === n.id ? { ...x, tags } : x,
              ),
            }
          : prev,
      );
      setEditingTagsFor(null);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Couldn't save collections.");
    } finally {
      setBusyNoteId(null);
    }
  }

  async function handleDeleteNote(n: StudyNoteEntry) {
    if (!window.confirm("Delete this note?")) return;
    setBusyNoteId(n.id);
    try {
      await deleteNote(n.id);
      setData((prev) =>
        prev
          ? {
              ...prev,
              notes: prev.notes.filter((x) => x.id !== n.id),
              note_count: Math.max(0, prev.note_count - 1),
            }
          : prev,
      );
    } catch (e) {
      setError(e instanceof Error ? e.message : "Couldn't delete the note.");
    } finally {
      setBusyNoteId(null);
    }
  }

  function handleExportMarkdown() {
    if (!data) return;
    const md = buildStudyMarkdown(data, {
      collection: activeCollection,
      bookOrder,
      colorLabels,
    });
    const stamp = new Date().toISOString().slice(0, 10);
    downloadMarkdown(md, `my-study-${stamp}.md`);
    setExportOpen(false);
  }

  function handleExportPdf() {
    if (!data) return;
    openStudyPrintView(data, {
      collection: activeCollection,
      bookOrder,
      colorLabels,
    });
    setExportOpen(false);
  }

  // ----- counts for the tab chips -----
  const counts = useMemo(() => {
    if (!data) return { all: 0, notes: 0, bookmarks: 0, highlights: 0 };
    return {
      all: data.notes.length + data.bookmarks.length + data.highlights.length,
      notes: data.notes.length,
      bookmarks: data.bookmarks.length,
      highlights: data.highlights.length,
    };
  }, [data]);

  // ----- render helpers -----

  function renderVerseQuote(it: StudyItem) {
    const text = itemVerseText(it);
    const ref = itemRef(it);
    if (!text) return null;
    if (it.kind === "highlight") {
      const h = it.entry;
      const hex = HIGHLIGHT_HEX[h.color];
      const markStyle: CSSProperties =
        h.style === "fill"
          ? { backgroundColor: `${hex}4D`, borderRadius: "3px", padding: "0 2px" }
          : h.style === "underline"
            ? { borderBottom: `2px solid ${hex}` }
            : { border: `1.5px solid ${hex}`, borderRadius: "3px", padding: "0 3px" };
      return (
        <blockquote className="mb-2 border-l-2 border-[var(--reader-accent)] py-0.5 pl-3 font-serif text-[15px] italic leading-relaxed">
          <span style={markStyle}>{text}</span>{" "}
          <span className="not-italic text-xs text-[var(--reader-muted)]">
            ({ref})
          </span>
        </blockquote>
      );
    }
    return (
      <blockquote className="mb-2 border-l-2 border-[var(--reader-accent)] py-0.5 pl-3 font-serif text-[15px] italic leading-relaxed">
        {text}{" "}
        <span className="not-italic text-xs text-[var(--reader-muted)]">
          ({ref})
        </span>
      </blockquote>
    );
  }

  function renderChips(it: StudyItem) {
    const tags = itemTags(it);
    if (tags.length === 0) return null;
    return (
      <div className="mb-1 flex flex-wrap gap-1.5">
        {tags.map((t) => (
          <button
            key={t}
            type="button"
            onClick={() =>
              setActiveCollection((cur) => (cur === t ? null : t))
            }
            className={
              "rounded-full border px-2.5 py-0.5 font-sans text-[11px] " +
              (activeCollection === t
                ? "border-[var(--reader-accent)] text-[var(--reader-accent)]"
                : "border-[var(--reader-rule)] text-[var(--reader-muted)]")
            }
          >
            <span className="mr-1 text-[var(--reader-accent)]">▸</span>
            {t}
          </button>
        ))}
      </div>
    );
  }

  function renderCard(it: StudyItem) {
    const typeLabel =
      it.kind === "note"
        ? "Note"
        : it.kind === "bookmark"
          ? "Bookmark"
          : "Highlight";
    const ref = itemRef(it);
    const canJump =
      it.kind !== "note" ||
      (it.entry.book_slug !== null && it.entry.verse_id !== null);
    const note = it.kind === "note" ? it.entry : null;
    return (
      <div
        key={it.id}
        className="mb-2.5 rounded-xl border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3.5 py-3"
      >
        <div className="mb-1.5 flex items-center gap-2">
          <span className="rounded border border-[var(--reader-rule)] px-2 py-0.5 font-sans text-[10px] font-bold uppercase tracking-wider text-[var(--reader-muted)]">
            {typeLabel}
          </span>
          {ref && (
            <span className="flex-1 font-sans text-[13px] font-bold text-[var(--reader-accent)]">
              {ref}
            </span>
          )}
          {!ref && <span className="flex-1" />}
          <span className="font-sans text-[11px] text-[var(--reader-muted)]">
            {fmtShortDate(itemCreatedAt(it))}
          </span>
        </div>

        {renderVerseQuote(it)}

        {note && (
          <p className="mb-2 whitespace-pre-wrap font-serif text-[15px] leading-relaxed">
            {note.body}
          </p>
        )}
        {it.kind === "bookmark" && it.entry.short_description && (
          <p className="mb-2 whitespace-pre-wrap font-serif text-[15px] leading-relaxed">
            {it.entry.short_description}
          </p>
        )}
        {it.kind === "highlight" && (
          <div className="mb-1 flex items-center gap-2 font-sans text-[12px] text-[var(--reader-muted)]">
            <span
              aria-hidden="true"
              className="inline-block h-3.5 w-3.5 rounded"
              style={{ backgroundColor: HIGHLIGHT_HEX[it.entry.color] }}
            />
            <span>
              {COLOR_DISPLAY[it.entry.color].toLowerCase()} ·{" "}
              {it.entry.style}
              {colorLabels[it.entry.color]
                ? ` — “${colorLabels[it.entry.color]}”`
                : ""}
            </span>
          </div>
        )}

        {renderChips(it)}

        {/* Inline collections editor — paid, notes only. */}
        {note && isPaid && editingTagsFor === note.id && (
          <div className="mb-2 flex items-center gap-2">
            <input
              type="text"
              value={tagsDraft}
              onChange={(e) => setTagsDraft(e.target.value)}
              placeholder="Collections, comma-separated"
              className="flex-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-2 py-1 font-sans text-xs text-[var(--reader-text)]"
            />
            <button
              type="button"
              disabled={busyNoteId === note.id}
              onClick={() => commitEditTags(note)}
              className="font-sans text-xs font-semibold text-[var(--reader-accent)]"
            >
              Save
            </button>
            <button
              type="button"
              onClick={() => setEditingTagsFor(null)}
              className="font-sans text-xs text-[var(--reader-muted)]"
            >
              Cancel
            </button>
          </div>
        )}

        <div className="flex items-center gap-3">
          {note && isPaid && editingTagsFor !== note.id && (
            <>
              <button
                type="button"
                onClick={() => beginEditTags(note)}
                className="font-sans text-[11px] font-semibold text-[var(--reader-muted)] hover:text-[var(--reader-accent)]"
              >
                ✎ Collections
              </button>
              <button
                type="button"
                disabled={busyNoteId === note.id}
                onClick={() => handleDeleteNote(note)}
                className="font-sans text-[11px] font-semibold text-[var(--reader-muted)] hover:text-[var(--reader-accent)]"
              >
                Delete
              </button>
            </>
          )}
          <span className="flex-1" />
          {canJump && (
            <button
              type="button"
              onClick={() => handleNavigate(it)}
              className="font-sans text-[12px] font-semibold text-[var(--reader-accent)] hover:opacity-80"
            >
              Open in reader ›
            </button>
          )}
        </div>
      </div>
    );
  }

  function renderHighlightGroup(g: Group) {
    // Color section → fill/underline/outline sub-groups, per the
    // signed-off proof: the marking vocabulary as the table of contents.
    const color = (g.items[0] as { entry: StudyHighlightEntry }).entry.color;
    const hex = HIGHLIGHT_HEX[color];
    const byStyle = new Map<MarkStyle, StudyItem[]>();
    for (const it of g.items) {
      if (it.kind !== "highlight") continue;
      const list = byStyle.get(it.entry.style) ?? [];
      list.push(it);
      byStyle.set(it.entry.style, list);
    }
    return (
      <section key={g.key} className="mb-4">
        <div className="mb-1 mt-4 flex items-baseline gap-2.5">
          <span
            aria-hidden="true"
            className="inline-block h-3.5 w-3.5 self-center rounded-full border border-[var(--reader-rule)]"
            style={{ backgroundColor: hex }}
          />
          <h3 className="font-serif text-[15px] font-semibold">{g.heading}</h3>
          {g.headingMeta && (
            <span className="font-sans text-[12px] font-semibold text-[var(--reader-accent)]">
              {g.headingMeta}
            </span>
          )}
          <div className="h-px flex-1 self-center bg-[var(--reader-accent)] opacity-35" />
          <span className="font-sans text-[11px] text-[var(--reader-muted)]">
            {g.items.length} {g.items.length === 1 ? "mark" : "marks"}
          </span>
        </div>
        {STYLE_ORDER.filter((s) => byStyle.has(s)).map((s) => (
          <div key={s}>
            <div
              className="mb-1.5 ml-1 mt-2.5 flex items-center gap-2"
              style={{ color: hex }}
            >
              <span
                aria-hidden="true"
                className="inline-block h-3 w-4"
                style={
                  s === "fill"
                    ? { backgroundColor: `${hex}59`, borderRadius: "3px" }
                    : s === "underline"
                      ? { borderBottom: `2.5px solid ${hex}` }
                      : { border: `1.5px solid ${hex}`, borderRadius: "3px" }
                }
              />
              <span className="font-sans text-[10px] font-bold uppercase tracking-wider text-[var(--reader-muted)]">
                {STYLE_DISPLAY[s]}
              </span>
              <span className="font-sans text-[10px] text-[var(--reader-muted)]">
                {(byStyle.get(s) as StudyItem[]).length}
              </span>
            </div>
            {(byStyle.get(s) as StudyItem[]).map((it) => renderCard(it))}
          </div>
        ))}
      </section>
    );
  }

  const lockedChip = (
    <span className={TIER_CHIP_CLASSES} aria-label="Study Notes feature">
      Study Notes
    </span>
  );

  return (
    <div
      className="fixed inset-0 z-40 flex items-stretch justify-center bg-black/40 p-0 sm:p-4"
      onClick={onClose}
      role="dialog"
      aria-label="My Study"
    >
      <div
        className="flex h-full w-full max-w-6xl flex-col overflow-hidden border border-[var(--reader-rule)] bg-[var(--reader-bg)] shadow-xl sm:h-auto sm:max-h-[92vh] sm:rounded-lg"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header — serif title, export control, ✕. */}
        <div className="flex items-center gap-3 border-b border-[var(--reader-rule)] px-4 py-3">
          <h2 className="flex-1 font-serif text-xl font-semibold">My Study</h2>
          <div className="relative">
            <button
              type="button"
              onClick={() => (isPaid ? setExportOpen((o) => !o) : goUpgrade())}
              className="flex items-center gap-1.5 rounded-full border border-[var(--reader-accent)]/60 px-3 py-1 font-sans text-xs font-semibold text-[var(--reader-accent)]"
              aria-label="Export your study"
            >
              Export ⤓{!isPaid && data !== null && lockedChip}
            </button>
            {exportOpen && isPaid && (
              <div className="absolute right-0 top-9 z-50 w-44 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] py-1 shadow-xl">
                <button
                  type="button"
                  onClick={handleExportMarkdown}
                  className="block w-full px-3 py-2 text-left font-sans text-sm hover:bg-black/10"
                >
                  Markdown (.md)
                </button>
                <button
                  type="button"
                  onClick={handleExportPdf}
                  className="block w-full px-3 py-2 text-left font-sans text-sm hover:bg-black/10"
                >
                  PDF (print dialog)
                </button>
                {activeCollection && (
                  <p className="border-t border-[var(--reader-rule)] px-3 py-1.5 font-sans text-[10px] text-[var(--reader-muted)]">
                    Exporting “{activeCollection}” only
                  </p>
                )}
              </div>
            )}
          </div>
          <button
            type="button"
            className="text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
            onClick={onClose}
            aria-label="Close My Study"
          >
            ✕
          </button>
        </div>

        {/* Controls: search, color row, tabs, collections, group-by. */}
        <div className="border-b border-[var(--reader-rule)] px-4 pb-2.5 pt-3">
          <div className="mb-2.5 flex items-center gap-2 rounded-xl border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2">
            <span aria-hidden="true" className="text-[var(--reader-muted)]">
              ⌕
            </span>
            <input
              type="text"
              value={query}
              onChange={(e) =>
                isPaid ? setQuery(e.target.value) : goUpgrade()
              }
              onFocus={() => {
                if (!isPaid && data !== null) goUpgrade();
              }}
              placeholder="Search your notes, bookmarks & highlighted verses"
              className="flex-1 bg-transparent font-sans text-sm text-[var(--reader-text)] outline-none placeholder:text-[var(--reader-muted)]"
              aria-label="Search your study"
            />
            {!isPaid && data !== null && lockedChip}
          </div>

          {/* Color filter row — search by highlight color (+ bookmark
              tint). Paid apparatus; free taps route to /pricing. */}
          <div className="mb-2.5 flex items-center gap-2 overflow-x-auto">
            <span className="font-sans text-[10px] font-semibold uppercase tracking-wider text-[var(--reader-muted)]">
              Color
            </span>
            {HIGHLIGHT_PALETTE_ORDER.map((c) => (
              <button
                key={c}
                type="button"
                onClick={() =>
                  isPaid
                    ? setColorFilter((cur) => (cur === c ? null : c))
                    : goUpgrade()
                }
                aria-label={`Filter by ${COLOR_DISPLAY[c]}`}
                className={
                  "h-[17px] w-[17px] shrink-0 rounded-full border border-[var(--reader-rule)] " +
                  (colorFilter === c
                    ? "outline outline-2 outline-offset-2 outline-[var(--reader-accent)]"
                    : "")
                }
                style={{ backgroundColor: HIGHLIGHT_HEX[c] }}
              />
            ))}
            {colorFilter && (
              <button
                type="button"
                onClick={() => setColorFilter(null)}
                className="shrink-0 font-sans text-[11px] font-semibold text-[var(--reader-accent)]"
              >
                {COLOR_DISPLAY[colorFilter].toLowerCase()}
                {colorLabels[colorFilter]
                  ? ` — “${colorLabels[colorFilter]}”`
                  : ""}{" "}
                ✕
              </button>
            )}
          </div>

          <div className="mb-2.5 flex gap-1.5">
            {(
              [
                ["all", "All", counts.all],
                ["notes", "Notes", counts.notes],
                ["bookmarks", "Bookmarks", counts.bookmarks],
                ["highlights", "Highlights", counts.highlights],
              ] as const
            ).map(([key, label, n]) => (
              <button
                key={key}
                type="button"
                onClick={() => setTab(key)}
                className={
                  "rounded-full border px-3 py-1 font-sans text-xs font-semibold " +
                  (tab === key
                    ? "border-[var(--reader-accent)]/60 bg-[var(--reader-accent)]/10 text-[var(--reader-accent)]"
                    : "border-[var(--reader-rule)] text-[var(--reader-muted)]")
                }
              >
                {label} <span className="font-normal opacity-75">{n}</span>
              </button>
            ))}
          </div>

          {/* Collections chips. */}
          <div className="mb-1.5 flex flex-wrap items-center gap-1.5">
            {!isPaid && data !== null && (
              <>
                <span className="font-sans text-[10px] font-semibold uppercase tracking-wider text-[var(--reader-muted)]">
                  Collections
                </span>
                <button type="button" onClick={goUpgrade} aria-label="Unlock collections">
                  {lockedChip}
                </button>
              </>
            )}
            {isPaid &&
              collections.map(([name, n]) => (
                <button
                  key={name}
                  type="button"
                  onClick={() =>
                    setActiveCollection((cur) => (cur === name ? null : name))
                  }
                  className={
                    "rounded-full border px-2.5 py-1 font-sans text-[11px] " +
                    (activeCollection === name
                      ? "border-[var(--reader-accent)] text-[var(--reader-accent)]"
                      : "border-[var(--reader-rule)] bg-[var(--reader-surface)] text-[var(--reader-text)]")
                  }
                >
                  <span className="mr-1 text-[10px] text-[var(--reader-accent)]">
                    ▸
                  </span>
                  {name}{" "}
                  <span className="text-[var(--reader-muted)]">{n}</span>
                </button>
              ))}
            {isPaid && collections.length === 0 && (
              <span className="font-sans text-[11px] italic text-[var(--reader-muted)]">
                Add a note or bookmark to a collection with ✎ Collections —
                folder feel, a note can live in several.
              </span>
            )}
          </div>

          {/* Group-by (hidden on Highlights tab — color sections rule
              there per the signed-off proof). */}
          {tab !== "highlights" && (
            <div className="flex items-center justify-between">
              <span className="font-sans text-[10px] font-semibold uppercase tracking-wider text-[var(--reader-muted)]">
                Grouped by
              </span>
              <div className="flex gap-2">
                {(
                  [
                    ["book", "Book"],
                    ["date", "Date"],
                    ["collection", "Collection"],
                  ] as const
                ).map(([key, label]) => (
                  <button
                    key={key}
                    type="button"
                    onClick={() => setGroupMode(key)}
                    className={
                      "font-sans text-xs " +
                      (groupMode === key
                        ? "font-bold text-[var(--reader-accent)]"
                        : "text-[var(--reader-muted)]")
                    }
                  >
                    {label}
                  </button>
                ))}
              </div>
            </div>
          )}
        </div>

        {/* Body scroll region. */}
        <div className="flex-1 overflow-y-auto px-4 py-3">
          {error && (
            <p className="py-2 text-center font-sans text-sm text-red-600" role="status">
              {error}
            </p>
          )}
          {data === null && !error ? (
            <div className="space-y-3 py-2" aria-busy="true">
              {[0, 1, 2].map((i) => (
                <div
                  key={i}
                  className="animate-pulse rounded-xl border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4"
                >
                  <div className="mb-2 h-4 w-36 rounded bg-[var(--reader-rule)]" />
                  <div className="h-3 w-full rounded bg-[var(--reader-rule)]" />
                </div>
              ))}
            </div>
          ) : data !== null && counts.all === 0 ? (
            <p className="py-10 text-center font-serif italic text-[var(--reader-muted)]">
              Long-press any verse to highlight, bookmark, or add a note —
              everything you mark gathers here.
            </p>
          ) : data !== null && visibleItems.length === 0 ? (
            <p className="py-10 text-center font-serif italic text-[var(--reader-muted)]">
              Nothing matches — clear the search or filters above.
            </p>
          ) : (
            groups.map((g) =>
              tab === "highlights" ? (
                renderHighlightGroup(g)
              ) : (
                <section key={g.key} className="mb-4">
                  <div className="mb-1.5 mt-3 flex items-baseline gap-2.5">
                    <h3 className="font-serif text-[15px] font-semibold">
                      {g.heading}
                    </h3>
                    <div className="h-px flex-1 self-center bg-[var(--reader-accent)] opacity-35" />
                    <span className="font-sans text-[11px] text-[var(--reader-muted)]">
                      {g.items.length}{" "}
                      {g.items.length === 1 ? "item" : "items"}
                    </span>
                  </div>
                  {g.items.map((it) => renderCard(it))}
                </section>
              ),
            )
          )}

          {/* Free-tier lever card — full opacity, border + metallic
              chip signaling (NO greyed text per the S127/S201 lock). */}
          {data !== null && !isPaid && (
            <div className="mb-3 mt-4 rounded-xl border border-[var(--reader-accent)]/60 bg-[var(--reader-surface)] px-4 py-3.5">
              <div className="mb-1.5 flex items-center gap-2.5">
                {lockedChip}
                <span className="font-sans text-[12px] text-[var(--reader-muted)]">
                  {data.note_count} of {data.note_cap} free notes used
                </span>
              </div>
              <p className="mb-2.5 font-serif text-[14px] leading-relaxed">
                Unlimited notes, collections, search across everything
                you’ve marked, and clean Markdown + PDF export of your whole
                study.
              </p>
              <button
                type="button"
                onClick={goUpgrade}
                className={UNLOCK_PILL_CLASSES}
              >
                Unlock Study Notes — $1.99
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
