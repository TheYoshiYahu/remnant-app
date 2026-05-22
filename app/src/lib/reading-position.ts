/**
 * Reading-position persistence (Session 116).
 *
 * Solves the S115/S116 observation that refresh always returned to
 * Genesis 1 — the Reader's selectedBookSlug + selectedChapter state
 * was hardcoded-initialized and lost on every page load.
 *
 * Architecture per DESIGN_LANGUAGE.md §9 (free-tier feature):
 *
 *   - **Authenticated partners:** API row at /v1/reading-position
 *     (single-row-per-user, server-side verse_id pointer) is the
 *     source of truth. Reader hydrates from the API on initial mount,
 *     saves to the API on chapter-change + on topmost-visible-verse
 *     change (debounced ~1500ms).
 *
 *   - **Anonymous partners:** No API call (would 401). localStorage
 *     is the only persistence surface. Same shape; same save/load
 *     functions; the same-device resume still works.
 *
 *   - **Authenticated + offline / API unreachable:** localStorage is
 *     written in parallel with every API save, so the fallback
 *     resume works even if the API is down. On next mount, if the
 *     API GET fails, the helper falls through to localStorage.
 *
 *   - **Cross-device migration:** when an authenticated partner has
 *     a localStorage row but no API row (e.g. they used to be
 *     anonymous on this device, then signed in), the Reader's first
 *     successful chapter-change save persists the localStorage value
 *     into the API. No explicit migration step needed.
 *
 * No verse_id surfaces in this module — the PWA speaks
 * (bookSlug, chapter, verseNumber) at every layer. The API
 * translates to / from verse_id on the server side.
 */

import {
  getReadingPosition,
  putReadingPosition,
  type ReadingPositionResponse,
} from "./api";

/**
 * Shape persisted both in localStorage and (server-resolved) in the
 * reading_positions table. The PWA always reasons in this register.
 */
export interface SavedPosition {
  bookSlug: string;
  chapter: number;
  verseNumber: number;
}

const STORAGE_KEY = "reading-position";

// Module-level debounce handle so rapid saves collapse to one
// API + localStorage write. Cleared and re-set on every saveDebounced
// call.
let saveDebounceHandle: ReturnType<typeof setTimeout> | null = null;
const SAVE_DEBOUNCE_MS = 1500;

/**
 * Read the saved position from localStorage. Returns null when the
 * key is absent, when the value fails to parse, or when the parsed
 * shape doesn't match SavedPosition.
 *
 * SSR-safe — returns null when `window` is undefined.
 */
export function loadLocalPosition(): SavedPosition | null {
  if (typeof window === "undefined") return null;
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY);
    if (!raw) return null;
    const parsed = JSON.parse(raw) as unknown;
    if (
      parsed &&
      typeof parsed === "object" &&
      typeof (parsed as SavedPosition).bookSlug === "string" &&
      typeof (parsed as SavedPosition).chapter === "number" &&
      typeof (parsed as SavedPosition).verseNumber === "number"
    ) {
      return parsed as SavedPosition;
    }
    return null;
  } catch {
    // JSON.parse threw, or localStorage threw (private-mode quota etc.)
    return null;
  }
}

/**
 * Write the position to localStorage. Silent on failure (private
 * browsing, quota exceeded — the resume is best-effort).
 */
export function saveLocalPosition(pos: SavedPosition): void {
  if (typeof window === "undefined") return;
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(pos));
  } catch {
    // ignore — best-effort persistence
  }
}

/**
 * Hydrate the partner's saved position at Reader mount.
 *
 * Resolution order:
 *   1. API row (authenticated). Wins when present.
 *   2. localStorage row. Used when API returned 401 / 404 / network
 *      failure, or when the partner is anonymous.
 *   3. null — caller falls through to its hardcoded default
 *      (Genesis 1 in the Reader).
 *
 * Best-effort throughout — every failure path falls through to the
 * next source; the helper never throws. The API call is fired
 * unconditionally; anonymous callers get a 401 which is caught and
 * treated the same as "no row" (the network round-trip is the same
 * cost either way and avoids a tri-state on the caller side).
 */
export async function loadInitialPosition(): Promise<SavedPosition | null> {
  // Try the API. 401 (anonymous) and 404 (no row) both fall through
  // to localStorage. Network errors fall through too.
  try {
    const apiRow: ReadingPositionResponse = await getReadingPosition();
    return {
      bookSlug: apiRow.book_slug,
      chapter: apiRow.chapter_number,
      verseNumber: apiRow.verse_number,
    };
  } catch {
    // fall through
  }

  // No API row → check localStorage.
  const local = loadLocalPosition();
  if (local !== null) return local;

  // Neither — caller defaults to Genesis 1.
  return null;
}

/**
 * Debounced save. Writes localStorage immediately (so a refresh
 * within the debounce window still resumes) and schedules the API
 * write for SAVE_DEBOUNCE_MS later. Subsequent calls within the
 * window cancel the pending API write and re-schedule with the new
 * values — last-call-wins.
 *
 * The API write is best-effort. A 401 (anonymous), 404 (verse triple
 * didn't resolve), or network error is swallowed — the localStorage
 * write already happened, so the same-device resume still works.
 */
export function saveReadingPositionDebounced(pos: SavedPosition): void {
  // localStorage is synchronous + cheap — write immediately on every
  // call. The debounce only applies to the API call.
  saveLocalPosition(pos);

  if (saveDebounceHandle !== null) {
    clearTimeout(saveDebounceHandle);
  }
  saveDebounceHandle = setTimeout(() => {
    saveDebounceHandle = null;
    putReadingPosition({
      book_slug: pos.bookSlug,
      chapter_number: pos.chapter,
      verse_number: pos.verseNumber,
    }).catch(() => {
      // 401 (anonymous), 404 (stale verse), network error — silent.
      // localStorage already has the value; the resume still works
      // on this device. The next successful save (when the partner
      // signs in / connectivity returns) will land in the API.
    });
  }, SAVE_DEBOUNCE_MS);
}

/**
 * Cancel any pending debounced save. Call from useEffect cleanup so a
 * mid-flight save doesn't fire after the component unmounts.
 */
export function cancelPendingSave(): void {
  if (saveDebounceHandle !== null) {
    clearTimeout(saveDebounceHandle);
    saveDebounceHandle = null;
  }
}
