/**
 * S431 — Hidden Words bottom sheet. Opened by tapping a hidden-word count.
 * Shows the originals behind the English word: the ones used in the book being
 * read first ("In {book}", with their verses), then the rest of the canon.
 * Matches the approved mockup v2 (HIDDEN_WORDS_MOCKUP.html).
 */
import { useEffect, useState } from "react";
import {
  loadHiddenWordsTable,
  type HiddenTableEntry,
  type HiddenOriginalRow,
} from "../lib/hidden-words";
import "../hidden-words.css";

export interface HiddenWordsSheetProps {
  /** english key, e.g. "serpent" — null = closed */
  wordKey: string | null;
  /** slug of the book being read, e.g. "revelation" */
  bookSlug: string;
  /** display name of the book being read, e.g. "Revelation" */
  bookName: string;
  onClose: () => void;
  /** jump the reader to a verse in the current book */
  onJump?: (bookSlug: string, chapter: number, verse: number) => void;
}

export default function HiddenWordsSheet({
  wordKey,
  bookSlug,
  bookName,
  onClose,
  onJump,
}: HiddenWordsSheetProps) {
  const [table, setTable] = useState<Record<string, HiddenTableEntry> | null>(null);

  useEffect(() => {
    if (wordKey && !table) {
      loadHiddenWordsTable().then(setTable);
    }
  }, [wordKey, table]);

  if (!wordKey) return null;
  const entry = table ? table[wordKey] : undefined;

  const here: HiddenOriginalRow[] = entry
    ? entry.rows.filter((r) => (r.byb[bookSlug] || []).length > 0)
    : [];
  const els: HiddenOriginalRow[] = entry
    ? entry.rows.filter((r) => (r.byb[bookSlug] || []).length === 0)
    : [];

  const jump = (ref: string) => {
    const m = /^(\d+):(\d+)$/.exec(ref);
    if (m && onJump) onJump(bookSlug, parseInt(m[1], 10), parseInt(m[2], 10));
  };

  const rowTable = (rows: HiddenOriginalRow[], showVerses: boolean) => (
    <table className="hw-tbl">
      <thead>
        <tr>
          <th>Original word</th>
          <th>Strong&apos;s</th>
          <th>Plain meaning</th>
          {showVerses && <th>Verses</th>}
        </tr>
      </thead>
      <tbody>
        {rows.map((r) => {
          const refs = r.byb[bookSlug] || [];
          return (
            <tr key={r.s}>
              <td>
                <span className="hw-orig">{r.o}</span>
                <span className="hw-xlit">{r.x}</span>
              </td>
              <td className="hw-sn">{r.s}</td>
              <td>{r.m}</td>
              {showVerses && (
                <td>
                  {refs.slice(0, 6).map((ref, i) => (
                    <span
                      key={i}
                      className="hw-ref"
                      role="button"
                      tabIndex={0}
                      onClick={() => jump(ref)}
                      onKeyDown={(e) => {
                        if (e.key === "Enter" || e.key === " ") jump(ref);
                      }}
                    >
                      {bookName} {ref}
                    </span>
                  ))}
                  {refs.length > 6 && (
                    <span className="hw-more">+{refs.length - 6} more</span>
                  )}
                </td>
              )}
            </tr>
          );
        })}
      </tbody>
    </table>
  );

  const n = entry?.n ?? 0;

  return (
    <>
      <div className="hw-sheet-bg" onClick={onClose} />
      <div className="hw-sheet" role="dialog" aria-label={`${wordKey} — original words`}>
        <div className="hw-grab" />
        <div className="hw-sheet-in">
          <h3>
            {wordKey}
            {n ? ` — ${n} original words` : ""}
          </h3>
          {n > 0 && (
            <p className="hw-sub">
              The King James uses one English word where scripture uses {n}{" "}
              different Hebrew or Greek words.
            </p>
          )}
          {!entry && <p className="hw-sub">Loading…</p>}
          {here.length > 0 && (
            <>
              <div className="hw-group">In {bookName}</div>
              {rowTable(here, true)}
            </>
          )}
          {els.length > 0 && (
            <details open={here.length === 0}>
              <summary className="hw-group" style={{ cursor: "pointer" }}>
                {here.length > 0
                  ? `Elsewhere in the canon — ${els.length} more word${els.length === 1 ? "" : "s"}`
                  : "Where these words are used"}
              </summary>
              {rowTable(els, false)}
            </details>
          )}
          <button className="hw-close" onClick={onClose}>
            Close
          </button>
        </div>
      </div>
    </>
  );
}
