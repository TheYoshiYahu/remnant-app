/**
 * PeopleSheet — S472 People & places (Study Notes).
 *
 * Opened from the verse menu ("People & places"). Lists who and where the verse
 * names; tapping one opens its page: the names our text uses, the Hebrew/Greek
 * form, family (parents, spouse, brothers and sisters, children), the father line
 * as far back as the text confirms, a small map for places, and every verse —
 * each one tap away. Every verse and link was confirmed against the app's own
 * text before it was loaded (S472). No outside descriptions are shown; a "who
 * this was" note appears only once Yoshi has approved one (blurb).
 */

import { useEffect, useMemo, useState, type ReactNode } from "react";
import {
  fetchPeopleInVerse,
  fetchPeoplePage,
  searchPeople,
  type PPEntry,
  type PPLink,
  type PPPage,
  type ToolFetchResult,
} from "../lib/api";
import ToolSheet, { ToolEmpty, ToolError, ToolLoading, ToolTierLockedCard } from "./ToolSheet";

interface Props {
  bookSlug: string;
  chapter: number;
  verse: number;
  verseLabel: string;
  onNavigate: (bookSlug: string, chapter: number, verse: number) => void;
  onClose: () => void;
}

type Loadable<T> = ToolFetchResult<T> | { status: "loading" } | null;

const SMALL_WORDS = new Set(["of", "the", "and"]);
export function bookTitleFromSlug(slug: string): string {
  return slug
    .split("-")
    .map((w, i) => (i > 0 && SMALL_WORDS.has(w) ? w : w.charAt(0).toUpperCase() + w.slice(1)))
    .join(" ");
}

function kindLabel(e: PPEntry): string {
  if (e.kind === "place") return "Place";
  if (e.kind === "group") return "People";
  return e.type === "Female" ? "Woman" : "Man";
}

function flagNote(flags: string): string | null {
  if (flags.includes("a")) return "ancestor";
  if (flags.includes("d")) return "people descended";
  if (flags.includes("f")) return "founder";
  if (flags.includes("?")) return "uncertain";
  return null;
}

function Chip({ e, note, onOpen }: { e: PPEntry; note?: string | null; onOpen: (slug: string) => void }) {
  return (
    <button
      type="button"
      onClick={() => onOpen(e.slug)}
      className="mb-2 mr-2 inline-flex items-baseline gap-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)] px-2 py-1 text-sm text-[var(--reader-text)] hover:border-[var(--reader-accent)]"
    >
      {e.name}
      {note ? <span className="text-xs text-[var(--reader-muted)]">({note})</span> : null}
    </button>
  );
}

function FamilyRow({ title, links, onOpen }: { title: string; links: PPLink[]; onOpen: (s: string) => void }) {
  if (links.length === 0) return null;
  return (
    <div className="mb-2">
      <div className="mb-1 text-xs uppercase tracking-wide text-[var(--reader-muted)]">{title}</div>
      <div>
        {links.map((l) => (
          <Chip key={l.rel + l.other.slug} e={l.other} note={flagNote(l.flags)} onOpen={onOpen} />
        ))}
      </div>
    </div>
  );
}

function MiniMap({ page }: { page: PPPage }) {
  const pin = page.pin!;
  const pts = page.nearby;
  // Local equirectangular frame centred on the pin (about 120 km across).
  const W = 320, H = 220, spanLon = 1.3, spanLat = 1.1;
  const x = (lon: number) => ((lon - (pin.lon - spanLon / 2)) / spanLon) * W;
  const y = (lat: number) => H - ((lat - (pin.lat - spanLat / 2)) / spanLat) * H;
  return (
    <svg viewBox={`0 0 ${W} ${H}`} className="mb-1 w-full max-w-md rounded border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)]" role="img" aria-label={`Map of ${page.entry.name}`}>
      {pts.map((n) => (
        <g key={n.slug}>
          <circle cx={x(n.lon)} cy={y(n.lat)} r={2.5} fill="var(--reader-muted)" />
          <text x={x(n.lon) + 4} y={y(n.lat) + 3} fontSize="9" fill="var(--reader-muted)">{n.name}</text>
        </g>
      ))}
      <circle cx={W / 2} cy={H / 2} r={6} fill="var(--reader-accent)" />
      <text x={W / 2 + 9} y={H / 2 + 4} fontSize="12" fontWeight="600" fill="var(--reader-text)">{page.entry.name}</text>
    </svg>
  );
}

function PageView({ page, onOpen, onVerse }: { page: PPPage; onOpen: (s: string) => void; onVerse: (b: string, c: number, v: number) => void }) {
  const byRel = (r: PPLink["rel"]) => page.links.filter((l) => l.rel === r);
  const groups = useMemo(() => {
    const out: { book: string; refs: { c: number; v: number }[] }[] = [];
    for (const r of page.refs) {
      const last = out[out.length - 1];
      if (last && last.book === r.book_slug) last.refs.push({ c: r.chapter, v: r.verse });
      else out.push({ book: r.book_slug, refs: [{ c: r.chapter, v: r.verse }] });
    }
    return out;
  }, [page.refs]);
  const line = [...page.line].reverse(); // oldest first, this person last
  const others = page.names.filter((n) => n !== page.entry.name);

  return (
    <div>
      <div className="mb-1 text-xs uppercase tracking-wide text-[var(--reader-muted)]">{kindLabel(page.entry)}</div>
      <h2 className="text-2xl font-semibold text-[var(--reader-text)]">{page.entry.name}</h2>
      {page.original ? (
        <div className="mt-1 text-lg text-[var(--reader-text)]" dir="auto">{page.original}</div>
      ) : null}
      {others.length > 0 ? (
        <p className="mt-1 text-sm text-[var(--reader-muted)]">Also written: {others.join(", ")}</p>
      ) : null}
      {page.entry.uncertain ? (
        <p className="mt-1 text-xs italic text-[var(--reader-muted)]">Which person this is in some verses is not certain.</p>
      ) : null}
      {page.blurb ? <p className="mt-3 text-base leading-relaxed text-[var(--reader-text)]">{page.blurb}</p> : null}

      {page.pin ? (
        <div className="mt-4">
          <MiniMap page={page} />
        </div>
      ) : null}

      {page.links.length > 0 ? (
        <div className="mt-4">
          <FamilyRow title="Parents" links={byRel("parent")} onOpen={onOpen} />
          <FamilyRow title="Married to" links={byRel("spouse")} onOpen={onOpen} />
          <FamilyRow title="Brothers and sisters" links={byRel("sibling")} onOpen={onOpen} />
          <FamilyRow title="Children" links={byRel("child")} onOpen={onOpen} />
        </div>
      ) : null}

      {line.length > 1 ? (
        <div className="mt-4">
          <div className="mb-1 text-xs uppercase tracking-wide text-[var(--reader-muted)]">
            Father line ({line.length} generations the text names)
          </div>
          <ol className="border-l-2 border-[var(--reader-rule)] pl-3">
            {line.map((e, i) => (
              <li key={e.slug} className="py-0.5">
                {i === line.length - 1 ? (
                  <span className="text-sm font-semibold text-[var(--reader-text)]">{e.name}</span>
                ) : (
                  <button type="button" onClick={() => onOpen(e.slug)} className="text-sm text-[var(--reader-accent)] hover:underline">
                    {e.name}
                  </button>
                )}
              </li>
            ))}
          </ol>
        </div>
      ) : null}

      <div className="mt-4">
        <div className="mb-1 text-xs uppercase tracking-wide text-[var(--reader-muted)]">
          Named in {page.refs.length} {page.refs.length === 1 ? "verse" : "verses"}
        </div>
        {groups.map((g) => (
          <div key={g.book} className="mb-2">
            <div className="text-sm font-semibold text-[var(--reader-text)]">{bookTitleFromSlug(g.book)}</div>
            <div className="flex flex-wrap gap-1">
              {g.refs.map((r) => (
                <button
                  type="button"
                  key={`${r.c}:${r.v}`}
                  onClick={() => onVerse(g.book, r.c, r.v)}
                  className="rounded px-1.5 py-0.5 text-sm text-[var(--reader-accent)] hover:bg-[var(--reader-surface-elev)]"
                >
                  {r.c}:{r.v}
                </button>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

function EntryList({ entries, onOpen, empty }: { entries: PPEntry[]; onOpen: (s: string) => void; empty: string }) {
  if (entries.length === 0) return <ToolEmpty message={empty} />;
  return (
    <ul className="divide-y divide-[var(--reader-rule)]">
      {entries.map((e) => (
        <li key={e.slug}>
          <button type="button" onClick={() => onOpen(e.slug)} className="flex w-full items-baseline justify-between py-2 text-left hover:text-[var(--reader-accent)]">
            <span className="text-base text-[var(--reader-text)]">{e.name}</span>
            <span className="text-xs text-[var(--reader-muted)]">{kindLabel(e)}</span>
          </button>
        </li>
      ))}
    </ul>
  );
}

function Status<T>({ r, children }: { r: Loadable<T>; children: (d: T) => ReactNode }) {
  if (r === null) return null;
  if (r.status === "loading") return <ToolLoading label="Loading…" />;
  if (r.status === "tier-locked") return <ToolTierLockedCard tierRequired={r.tierRequired} />;
  if (r.status === "not-found") return <ToolEmpty message="Nothing found." />;
  if (r.status === "error") return <ToolError message={r.message} />;
  return <>{children(r.data)}</>;
}

export default function PeopleSheet({ bookSlug, chapter, verse, verseLabel, onNavigate, onClose }: Props) {
  const [inVerse, setInVerse] = useState<Loadable<{ entries: PPEntry[] }>>({ status: "loading" });
  const [stack, setStack] = useState<string[]>([]);
  const [page, setPage] = useState<Loadable<PPPage>>(null);
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<Loadable<{ entries: PPEntry[] }>>(null);

  useEffect(() => {
    fetchPeopleInVerse(bookSlug, chapter, verse).then((r) => {
      setInVerse(r);
      // One name in the verse: go straight to its page.
      if (r.status === "ok" && r.data.entries.length === 1) open(r.data.entries[0].slug);
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [bookSlug, chapter, verse]);

  function open(slug: string) {
    setStack((s) => [...s, slug]);
    setPage({ status: "loading" });
    fetchPeoplePage(slug).then(setPage);
  }
  function back() {
    const next = stack.slice(0, -1);
    setStack(next);
    const prev = next[next.length - 1];
    if (prev) {
      setPage({ status: "loading" });
      fetchPeoplePage(prev).then(setPage);
    } else {
      setPage(null);
    }
  }
  function goVerse(b: string, c: number, v: number) {
    onNavigate(b, c, v);
    onClose();
  }

  const current = stack[stack.length - 1];
  return (
    <ToolSheet title={`People & places · ${verseLabel}`} onClose={onClose}>
      <form
        onSubmit={(e) => {
          e.preventDefault();
          if (query.trim().length < 2) return;
          setStack([]);
          setPage(null);
          setResults({ status: "loading" });
          searchPeople(query.trim()).then(setResults);
        }}
        className="mb-4 flex gap-2"
      >
        <input
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Find a person or place"
          className="min-w-0 flex-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-base text-[var(--reader-text)]"
        />
        <button type="submit" className="rounded border border-[var(--reader-accent)] px-3 py-1.5 text-sm text-[var(--reader-accent)]">
          Find
        </button>
      </form>

      {current ? (
        <div>
          <button type="button" onClick={back} className="mb-3 text-sm text-[var(--reader-accent)] hover:underline">
            ← Back
          </button>
          <Status r={page}>{(d) => <PageView page={d} onOpen={open} onVerse={goVerse} />}</Status>
        </div>
      ) : results ? (
        <div>
          <button type="button" onClick={() => setResults(null)} className="mb-3 text-sm text-[var(--reader-accent)] hover:underline">
            ← {verseLabel}
          </button>
          <Status r={results}>
            {(d) => <EntryList entries={d.entries} onOpen={open} empty="No one by that name in the text." />}
          </Status>
        </div>
      ) : (
        <div>
          <div className="mb-2 text-xs uppercase tracking-wide text-[var(--reader-muted)]">Named in {verseLabel}</div>
          <Status r={inVerse}>
            {(d) => <EntryList entries={d.entries} onOpen={open} empty="No people or places are named in this verse." />}
          </Status>
        </div>
      )}
    </ToolSheet>
  );
}
