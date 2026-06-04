/**
 * NavesSheet — §20 Nave's Topical Bible, subordinate labeled foil (S197).
 *
 * Opened from the Cross-references section. A search-and-browse surface over the
 * Nave's headings. The taxonomy itself is the inherited reading, so for the four
 * framework-load-bearing headings (Gentiles, Church, Law, Israel) the framework
 * correction band rides above the entry body (ToolAnnotationBand tool="naves",
 * entry_key=<topic_slug>). Opens pre-seeded with a sensible query so the partner
 * lands on content rather than an empty box.
 */

import { useEffect, useState } from "react";
import {
  fetchNavesTopic,
  searchNaves,
  type NavesTopic,
  type NavesTopicSummary,
  type ToolFetchResult,
} from "../lib/api";
import ToolAnnotationBand from "./ToolAnnotationBand";
import ToolSheet, {
  ToolEmpty,
  ToolError,
  ToolFoilNote,
  ToolLoading,
  ToolTierLockedCard,
} from "./ToolSheet";

interface Props {
  /** Optional initial query (e.g. derived from the verse's first salient word). */
  initialQuery?: string;
  onClose: () => void;
}

export default function NavesSheet({ initialQuery, onClose }: Props) {
  const [query, setQuery] = useState(initialQuery ?? "");
  const [results, setResults] = useState<
    ToolFetchResult<{ topics: NavesTopicSummary[] }> | { status: "loading" } | null
  >(null);
  const [selected, setSelected] = useState<
    ToolFetchResult<NavesTopic> | { status: "loading" } | null
  >(null);

  function runSearch(q: string) {
    if (q.trim().length < 2) {
      setResults(null);
      return;
    }
    setResults({ status: "loading" });
    searchNaves(q.trim()).then(setResults);
  }

  function openTopic(slug: string) {
    setSelected({ status: "loading" });
    fetchNavesTopic(slug).then(setSelected);
  }

  // Auto-run the initial query once on open.
  useEffect(() => {
    if (initialQuery && initialQuery.trim().length >= 2) runSearch(initialQuery);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <ToolSheet title="Nave's Topical" onClose={onClose}>
      <ToolFoilNote>
        Nave's Topical Bible (CC-BY) organizes verses under inherited headings —
        the taxonomy itself carries the Jew/Gentile binary, the church-as-Israel
        reading, and the antinomian framing of Torah. It is shown as a labeled
        foil, kept subordinate to the curated threads. Where a heading carries the
        inherited reading, the framework correction rides above its entry.
      </ToolFoilNote>

      <form
        onSubmit={(e) => {
          e.preventDefault();
          runSearch(query);
        }}
        className="mb-4 flex gap-2"
      >
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search topics (e.g. Israel, Gentiles, Law)…"
          className="flex-1 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)] px-3 py-1.5 text-sm text-[var(--reader-text)] placeholder:text-[var(--reader-muted)]"
        />
        <button
          type="submit"
          className="rounded border border-[var(--reader-accent)] px-3 py-1.5 text-sm font-medium text-[var(--reader-accent)] hover:opacity-90"
        >
          Search
        </button>
      </form>

      {/* Detail view (selected topic) */}
      {selected && (
        <div className="mb-4">
          <button
            type="button"
            onClick={() => setSelected(null)}
            className="mb-2 text-xs text-[var(--reader-accent)] hover:underline"
          >
            ← Back to results
          </button>
          {selected.status === "loading" && <ToolLoading label="Loading topic…" />}
          {selected.status === "error" && <ToolError message={selected.message} />}
          {selected.status === "tier-locked" && (
            <ToolTierLockedCard tierRequired={selected.tierRequired} />
          )}
          {selected.status === "not-found" && (
            <ToolEmpty message="That topic is no longer available." />
          )}
          {selected.status === "ok" && (
            <div className="space-y-3">
              <h2 className="text-base font-semibold text-[var(--reader-text)]">
                {selected.data.subject}
              </h2>
              <ToolAnnotationBand tool="naves" entryKey={selected.data.topic_slug} />
              <p className="text-sm leading-relaxed text-[var(--reader-text)] whitespace-pre-line">
                {selected.data.entry}
              </p>
            </div>
          )}
        </div>
      )}

      {/* Results list (hidden while a topic is open) */}
      {!selected && results && (
        <>
          {results.status === "loading" && <ToolLoading label="Searching…" />}
          {results.status === "error" && <ToolError message={results.message} />}
          {results.status === "tier-locked" && (
            <ToolTierLockedCard tierRequired={results.tierRequired} />
          )}
          {results.status === "not-found" && (
            <ToolEmpty message="No matching topics." />
          )}
          {results.status === "ok" && results.data.topics.length === 0 && (
            <ToolEmpty message="No matching topics." />
          )}
          {results.status === "ok" && results.data.topics.length > 0 && (
            <ul className="divide-y divide-[var(--reader-rule)]">
              {results.data.topics.map((t) => (
                <li key={t.topic_slug}>
                  <button
                    type="button"
                    onClick={() => openTopic(t.topic_slug)}
                    className="w-full py-2 text-left text-sm text-[var(--reader-text)] hover:text-[var(--reader-accent)]"
                  >
                    {t.subject}
                  </button>
                </li>
              ))}
            </ul>
          )}
        </>
      )}

      {!selected && !results && (
        <ToolEmpty message="Type a topic above to search Nave's headings." />
      )}
    </ToolSheet>
  );
}
