/**
 * S431 — Hidden Words data access (offline-first, like the rest of the reader).
 *
 * Two static bundles live in /public (built deterministically by
 * restoration-pipeline/_session431_build_hidden_words.py):
 *   - hidden-words-index.json : { normalizedSurface: { k: englishKey, n: count } }
 *       small (~250K); loaded once so the reader can mark words while rendering.
 *   - hidden-words-table.json : { englishKey: { n, rows:[{o,x,s,m,u,byb:{slug:[ "c:v" ]}}] } }
 *       larger (~4M); loaded lazily the first time a table is opened.
 *
 * Both are cached in-module. Every access is guarded; on any failure the
 * reader simply shows plain text (the feature degrades, it never throws).
 */

export interface HiddenHit {
  k: string; // english key, e.g. "serpent"
  n: number; // count of distinct originals
}
export interface HiddenOriginalRow {
  o: string; // original script (Hebrew/Greek)
  x: string; // transliteration
  s: string; // Strong's number
  m: string; // plain meaning
  u: number; // total occurrences across the canon
  byb: Record<string, string[]>; // bookSlug -> ["3:1", ...]
}
export interface HiddenTableEntry {
  n: number;
  rows: HiddenOriginalRow[];
}

let indexCache: Record<string, HiddenHit> | null = null;
let indexPromise: Promise<Record<string, HiddenHit>> | null = null;
let tableCache: Record<string, HiddenTableEntry> | null = null;
let tablePromise: Promise<Record<string, HiddenTableEntry>> | null = null;

/** Normalize a surface form to the index key. MUST match the Python build's
 *  `norm()`: lowercase, strip leading/trailing non-[a-z]. */
export function normSurface(surface: string): string {
  return surface
    .toLowerCase()
    .replace(/^[^a-z]+/, "")
    .replace(/[^a-z]+$/, "");
}

export async function loadHiddenWordsIndex(): Promise<Record<string, HiddenHit>> {
  if (indexCache) return indexCache;
  if (indexPromise) return indexPromise;
  indexPromise = fetch("/hidden-words-index.json")
    .then((r) => (r.ok ? r.json() : {}))
    .then((j: Record<string, HiddenHit>) => {
      indexCache = j || {};
      return indexCache;
    })
    .catch(() => {
      indexCache = {};
      return indexCache;
    });
  return indexPromise;
}

/** Synchronous lookup once the index is loaded; null until then (reader shows
 *  plain text on first paint, then re-renders with marks once loaded). */
export function lookupHiddenWord(surface: string): HiddenHit | null {
  if (!indexCache) return null;
  return indexCache[normSurface(surface)] || null;
}

export async function loadHiddenWordsTable(): Promise<Record<string, HiddenTableEntry>> {
  if (tableCache) return tableCache;
  if (tablePromise) return tablePromise;
  tablePromise = fetch("/hidden-words-table.json")
    .then((r) => (r.ok ? r.json() : {}))
    .then((j: Record<string, HiddenTableEntry>) => {
      tableCache = j || {};
      return tableCache;
    })
    .catch(() => {
      tableCache = {};
      return tableCache;
    });
  return tablePromise;
}
