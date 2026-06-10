/**
 * CompareSheet — "Compare to another version" verse/chapter lens (S224).
 *
 * Opened from the VerseActionMenu on a verse. A comparison LENS over the
 * reader's primary text — never a reader. Two stages:
 *
 *   1. Version picker. The nine comparison-only public-domain translations
 *      (KJV, ASV, YLT, Darby, Webster, Geneva, Douay-Rheims, WEB, and
 *      Brenton's English Septuagint — flagged as the LXX). Companion-gated
 *      server-side; below-Companion partners never reach this sheet (the menu
 *      item routes them to /pricing instead).
 *
 *   2. Side-by-side. The chosen version's text sits in a clearly-secondary
 *      right column beside the reader's own text on the left, for either the
 *      single anchor verse or the whole chapter — toggled in place.
 *
 * HARD CAP: at most ONE chapter. The verse↔chapter toggle stays within the
 * anchor chapter; there is deliberately NO next/prev-chapter affordance, so
 * the lens can never be paged into a full-Bible reader. The cap is also
 * enforced server-side (the endpoint exposes no paging and bounds the chapter
 * against compare_books.chapter_count).
 *
 * Aesthetic: the reader's own chrome-metal register. The active version chip
 * carries the spectral apparatus register (same family as the study-apparatus
 * chrome); the comparison column is visibly subordinate to the primary text.
 */

import { useEffect, useMemo, useState } from "react";
import {
  fetchCompareChapter,
  fetchCompareVersions,
  type CompareChapterResponse,
  type CompareVersion,
  type CompareVerseRow,
  type ToolFetchResult,
} from "../lib/api";
import ToolSheet, {
  ToolEmpty,
  ToolError,
  ToolLoading,
  ToolTierLockedCard,
} from "./ToolSheet";

interface Props {
  bookSlug: string;
  bookTitle: string;
  chapter: number;
  /** The long-pressed anchor verse. */
  verse: number;
  /** e.g. "Romans 8:28" — sheet eyebrow. */
  verseLabel: string;
  /** The reader's own chapter, so the primary column needs no extra fetch. */
  readerVerses: { verse_number: number; text: string }[];
  /** Sacred-name mask applied to the reader's column to match the page. */
  applySacredMask?: (text: string) => string;
  onClose: () => void;
}

type Scope = "verse" | "chapter";

/** One aligned row: a verse number with the reader's text and the comparison
 *  version's row(s) for that number (LXX may carry lettered sub-verses). */
interface AlignedRow {
  n: number;
  readerText: string | null;
  compareRows: CompareVerseRow[];
}

export default function CompareSheet({
  bookSlug,
  bookTitle,
  chapter,
  verse,
  verseLabel,
  readerVerses,
  applySacredMask = (t) => t,
  onClose,
}: Props) {
  const [versionsState, setVersionsState] = useState<
    ToolFetchResult<{ versions: CompareVersion[] }> | { status: "loading" }
  >({ status: "loading" });
  const [selected, setSelected] = useState<CompareVersion | null>(null);
  const [scope, setScope] = useState<Scope>("verse");
  const [chapterState, setChapterState] = useState<
    ToolFetchResult<CompareChapterResponse> | { status: "loading" } | null
  >(null);

  // Load the picker once.
  useEffect(() => {
    let cancelled = false;
    fetchCompareVersions().then((res) => {
      if (!cancelled) setVersionsState(res);
    });
    return () => {
      cancelled = true;
    };
  }, []);

  // Load the chosen version's verse/chapter whenever the selection or scope
  // changes. Always a single (version, book, chapter) — never paged.
  useEffect(() => {
    // Only fetch when a version is chosen. When `selected` is null the picker
    // is shown instead, so a stale chapterState is never read — no need to
    // reset it here (and doing so synchronously in the effect is disallowed).
    if (!selected) return;
    let cancelled = false;
    setChapterState({ status: "loading" });
    fetchCompareChapter(
      selected.id,
      bookSlug,
      chapter,
      scope === "verse" ? verse : undefined,
    ).then((res) => {
      if (!cancelled) setChapterState(res);
    });
    return () => {
      cancelled = true;
    };
  }, [selected, scope, bookSlug, chapter, verse]);

  const readerByNumber = useMemo(() => {
    const m = new Map<number, string>();
    for (const v of readerVerses) m.set(v.verse_number, v.text);
    return m;
  }, [readerVerses]);

  const eyebrow = selected
    ? `Compare · ${verseLabel} · ${selected.abbreviation}`
    : `Compare · ${verseLabel}`;

  return (
    <ToolSheet title={eyebrow} onClose={onClose}>
      {!selected ? (
        <VersionPicker
          state={versionsState}
          onPick={(v) => {
            setSelected(v);
            setScope("verse");
          }}
        />
      ) : (
        <CompareBody
          version={selected}
          bookTitle={bookTitle}
          chapter={chapter}
          anchorVerse={verse}
          scope={scope}
          onScope={setScope}
          onChangeVersion={() => setSelected(null)}
          state={chapterState}
          readerByNumber={readerByNumber}
          applySacredMask={applySacredMask}
        />
      )}
    </ToolSheet>
  );
}

// ── Stage 1 — version picker ──────────────────────────────────────────────

function VersionPicker({
  state,
  onPick,
}: {
  state: ToolFetchResult<{ versions: CompareVersion[] }> | { status: "loading" };
  onPick: (v: CompareVersion) => void;
}) {
  if (state.status === "loading")
    return <ToolLoading label="Loading comparison versions…" />;
  if (state.status === "error") return <ToolError message={state.message} />;
  if (state.status === "tier-locked")
    return <ToolTierLockedCard tierRequired={state.tierRequired} />;
  if (state.status === "not-found")
    return <ToolEmpty message="No comparison versions are available." />;

  const versions = state.data.versions;
  return (
    <div>
      <p className="mb-3 text-xs italic leading-relaxed text-[var(--reader-muted)]">
        A comparison lens — pick a public-domain translation to set beside the
        reader's text, one verse or one chapter at a time. These are foils for
        study; the restored framework text stays the primary reading.
      </p>
      <ul className="grid grid-cols-1 gap-2 sm:grid-cols-2">
        {versions.map((v) => (
          <li key={v.id}>
            <button
              type="button"
              onClick={() => onPick(v)}
              className="flex w-full items-start gap-3 rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2.5 text-left hover:border-[var(--reader-accent)]"
            >
              <span
                className="mt-0.5 shrink-0 rounded border border-[var(--reader-accent)] px-1.5 py-0.5 font-sans text-[11px] font-semibold text-[var(--reader-accent)]"
                aria-hidden="true"
              >
                {v.abbreviation}
              </span>
              <span className="min-w-0">
                <span className="block text-sm font-medium text-[var(--reader-text)]">
                  {v.title}
                </span>
                <span className="mt-0.5 block text-xs text-[var(--reader-muted)]">
                  {v.year ?? ""}
                  {v.is_septuagint ? (
                    <span className="text-[var(--reader-accent)]">
                      {v.year ? " · " : ""}Septuagint · Greek OT only
                    </span>
                  ) : !v.has_new_testament ? (
                    <span>{v.year ? " · " : ""}Old Testament only</span>
                  ) : null}
                </span>
              </span>
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

// ── Stage 2 — side-by-side body ───────────────────────────────────────────

function CompareBody({
  version,
  bookTitle,
  chapter,
  anchorVerse,
  scope,
  onScope,
  onChangeVersion,
  state,
  readerByNumber,
  applySacredMask,
}: {
  version: CompareVersion;
  bookTitle: string;
  chapter: number;
  anchorVerse: number;
  scope: Scope;
  onScope: (s: Scope) => void;
  onChangeVersion: () => void;
  state:
    | ToolFetchResult<CompareChapterResponse>
    | { status: "loading" }
    | null;
  readerByNumber: Map<number, string>;
  applySacredMask: (text: string) => string;
}) {
  // Build the aligned rows from whatever the fetch returned.
  const rows: AlignedRow[] = useMemo(() => {
    if (!state || state.status !== "ok") return [];
    const data = state.data;
    const byNumber = new Map<number, CompareVerseRow[]>();
    for (const r of data.verses) {
      const list = byNumber.get(r.verse) ?? [];
      list.push(r);
      byNumber.set(r.verse, list);
    }
    if (scope === "verse") {
      return [
        {
          n: anchorVerse,
          readerText: readerByNumber.get(anchorVerse) ?? null,
          compareRows: byNumber.get(anchorVerse) ?? [],
        },
      ];
    }
    // Chapter scope — union of verse numbers from both sides, in order.
    const numbers = new Set<number>([
      ...readerByNumber.keys(),
      ...byNumber.keys(),
    ]);
    return [...numbers]
      .sort((a, b) => a - b)
      .map((n) => ({
        n,
        readerText: readerByNumber.get(n) ?? null,
        compareRows: byNumber.get(n) ?? [],
      }));
  }, [state, scope, anchorVerse, readerByNumber]);

  return (
    <div>
      {/* Control bar: change version · verse/chapter toggle. No chapter paging
          by design — this is a single-chapter lens. */}
      <div className="mb-3 flex flex-wrap items-center justify-between gap-2 border-b border-[var(--reader-rule)] pb-3">
        <div className="flex items-center gap-2">
          <span
            className="chrome-metal chrome-metal-spectral"
            style={{ padding: "0.25rem 0.5rem", fontSize: "0.8rem" }}
          >
            {version.abbreviation}
            {version.is_septuagint ? " · LXX" : ""}
          </span>
          <button
            type="button"
            onClick={onChangeVersion}
            className="rounded border border-[var(--reader-rule)] px-2 py-1 text-xs text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
          >
            ← Change version
          </button>
        </div>
        <div
          className="inline-flex overflow-hidden rounded border border-[var(--reader-rule)] text-xs"
          role="group"
          aria-label="Comparison scope"
        >
          {(["verse", "chapter"] as const).map((s) => (
            <button
              key={s}
              type="button"
              onClick={() => onScope(s)}
              aria-pressed={scope === s}
              className={`px-3 py-1 font-sans ${
                scope === s
                  ? "bg-[var(--reader-accent)] text-white"
                  : "text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
              }`}
            >
              {s === "verse" ? "This verse" : "Whole chapter"}
            </button>
          ))}
        </div>
      </div>

      {/* Versification caveat — the LXX (and a few others) note real numbering
          differences; surface them so an off-by-one alignment reads as expected. */}
      {version.notes && (
        <p className="mb-3 text-[11px] italic leading-relaxed text-[var(--reader-muted)]">
          {version.notes}
        </p>
      )}

      {/* Column headers. */}
      <div className="mb-1 hidden grid-cols-2 gap-4 sm:grid">
        <h4 className="font-sans text-[11px] font-semibold uppercase tracking-wider text-[var(--reader-accent)]">
          {bookTitle} {chapter} — Reader
        </h4>
        <h4 className="font-sans text-[11px] font-semibold uppercase tracking-wider text-[var(--reader-muted)]">
          {version.title}
        </h4>
      </div>

      {state?.status === "loading" && (
        <ToolLoading label={`Loading ${version.abbreviation}…`} />
      )}
      {state?.status === "error" && <ToolError message={state.message} />}
      {state?.status === "tier-locked" && (
        <ToolTierLockedCard tierRequired={state.tierRequired} />
      )}
      {state?.status === "not-found" && (
        <ToolEmpty
          message={`${version.abbreviation} does not carry ${bookTitle}.`}
        />
      )}
      {state?.status === "ok" && rows.length === 0 && (
        <ToolEmpty message={`No ${version.abbreviation} text for this passage.`} />
      )}
      {state?.status === "ok" && rows.length > 0 && (
        <ul className="space-y-3">
          {rows.map((row) => {
            const isAnchor = scope === "chapter" && row.n === anchorVerse;
            return (
              <li
                key={row.n}
                className={`grid grid-cols-1 gap-x-4 gap-y-1 rounded sm:grid-cols-2 ${
                  isAnchor
                    ? "bg-[color-mix(in_srgb,var(--reader-accent)_8%,transparent)] px-2 py-1.5"
                    : ""
                }`}
              >
                {/* Reader column — primary. */}
                <p className="font-serif text-[15px] leading-relaxed text-[var(--reader-text)]">
                  <sup className="mr-1 font-sans text-[11px] font-semibold text-[var(--reader-accent)]">
                    {row.n}
                  </sup>
                  {row.readerText != null ? (
                    applySacredMask(row.readerText)
                  ) : (
                    <span className="italic text-[var(--reader-muted)]">
                      (no verse {row.n} here)
                    </span>
                  )}
                </p>
                {/* Comparison column — clearly secondary: lighter, smaller. */}
                <p className="border-l border-[var(--reader-rule)] pl-3 font-serif text-[14px] leading-relaxed text-[var(--reader-muted)] sm:border-l-0 sm:pl-0">
                  <sup className="mr-1 font-sans text-[11px] font-semibold text-[var(--reader-muted)] sm:hidden">
                    {version.abbreviation}
                  </sup>
                  {row.compareRows.length > 0 ? (
                    row.compareRows.map((c) => (
                      <span key={c.verse_suffix}>
                        {c.verse_suffix && (
                          <sup className="mr-0.5 text-[10px] text-[var(--reader-accent)]">
                            {c.verse_suffix}
                          </sup>
                        )}
                        {c.text}{" "}
                      </span>
                    ))
                  ) : (
                    <span className="italic">(no verse {row.n})</span>
                  )}
                </p>
              </li>
            );
          })}
        </ul>
      )}

      <p className="mt-4 border-t border-[var(--reader-rule)] pt-2 text-center text-[11px] italic text-[var(--reader-muted)]">
        Comparison lens — one chapter at a time.
      </p>
    </div>
  );
}
