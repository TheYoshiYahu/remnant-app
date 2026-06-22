/**
 * Read-through cache for the STATIC reading content (Phase 1 of the
 * offline / speed work).
 *
 * The reading path fires 6–9 independent fetches per chapter — verses,
 * chapters list, witness, kingdom, words (interlinear/Strong's),
 * cross-references, commentary — and until this module none of them were
 * cached at all. Every navigation, including a revisit to a chapter read
 * five seconds ago, paid the full round-trip cost again.
 *
 * This module is the storage foundation. It backs:
 *   1. an immediate speed win for every user (online or off) — revisited
 *      chapters paint instantly from IndexedDB while the network
 *      revalidates in the background (stale-while-revalidate), and
 *   2. Phase 2's "Download for offline" button, which will reuse `put`
 *      to pre-seed the same store for a whole book/canon.
 *
 * Why IndexedDB: it works in both the web PWA and the Capacitor WebView
 * with no native plugin, and holds far more than localStorage's ~5 MB.
 *
 * --- Tier scoping (no gated-content leak) -----------------------------
 *
 * Cache entries are keyed by an opaque SCOPE string in addition to
 * book/chapter/layer. The scope is the caller's resolved content tier
 * (see setContentCacheScope). This matters because some reading payloads
 * vary by tier — the words endpoint ships §28 interlinear fields only to
 * Companion+, commentary nulls locked rows, and book-level tier gating
 * decides 200-vs-404. Keying by tier means:
 *   - a free reader and a paid reader never read each other's entries
 *     (no leak even when two people share one device/profile), and
 *   - a tier change just changes the key, so the new tier revalidates
 *     fresh rather than serving the old tier's payload.
 *
 * Until the tier is known (the /me fetch is in flight on cold load), the
 * scope is `null` and the cache runs in PASS-THROUGH mode: it neither
 * reads nor writes, it just calls the fetcher. This is the critical
 * correctness guard — the server computes entitlement from the JWT, not
 * from our scope, so caching a response before we know the tier could
 * file a paid payload under a free key. Pass-through-until-resolved makes
 * that impossible; the cost is only that the very first chapter of a cold
 * session isn't cached (every subsequent navigation is).
 *
 * USER-MUTABLE data (highlights, bookmarks, notes, reading position) is
 * deliberately NOT cached here — it changes when the user edits it and
 * must never be served stale. This module is for static content only.
 */

/** The static reading layers we cache. One entry per (scope, version, book, chapter, layer). */
export type ContentLayer =
  | "chapter" // ChapterDetail (verses + intro)
  | "chapters" // BookChaptersResponse (chapter list, verse counts)
  | "xrefs" // ChapterEndCardResponse (cross-references card)
  | "witness" // ChapterWitnessResponse
  | "kingdom" // ChapterKingdomResponse
  | "words" // ChapterWordsResponse (interlinear / Strong's)
  | "commentary"; // ChapterCommentaryResponse

export interface ContentSpec {
  layer: ContentLayer;
  /** Book slug. For the `chapters` layer this is the only locator that matters. */
  book: string;
  /** Chapter number. Pass 0 for book-level layers (`chapters`). */
  chapter: number;
  /** Edition / version slug. Canon at v1 for every reading layer. */
  version?: string;
}

interface CacheRecord<T> {
  /** Composite primary key — see keyFor(). */
  key: string;
  data: T;
  /** Epoch ms the record was written. Reserved for Phase 2 TTL/eviction. */
  cachedAt: number;
}

const DB_NAME = "rop-content-cache";
const STORE = "content";
const DB_VERSION = 1;

// ----- Tier scope --------------------------------------------------------

let scope: string | null = null;

/**
 * Set the cache scope to the caller's resolved content tier (e.g.
 * "free", "complete_study"). Call this once the /me fetch has resolved
 * — including for anonymous callers, which resolve to "free". Before the
 * first call the cache is in pass-through mode and stores nothing, so a
 * paid payload can never be filed under a free key.
 */
export function setContentCacheScope(tier: string): void {
  scope = tier;
}

/** True once a tier scope is known and the cache is live (not pass-through). */
export function isContentCacheActive(): boolean {
  return scope !== null;
}

function keyFor(spec: ContentSpec): string {
  const version = spec.version ?? "canon";
  return `${scope}|${version}|${spec.book}|${spec.chapter}|${spec.layer}`;
}

// ----- IndexedDB handle (with graceful fallbacks) ------------------------

// When IndexedDB is unavailable (SSR, a locked-down WebView, private-mode
// quirks, or a unit-test environment), we fall back to a process-lifetime
// in-memory Map so the read-through path still de-dupes within a session
// and never throws. `dbPromise === null` after a failed open means
// "memory mode"; a resolved IDBDatabase means "persistent mode".
let dbPromise: Promise<IDBDatabase | null> | null = null;
const memoryStore = new Map<string, CacheRecord<unknown>>();

function openDb(): Promise<IDBDatabase | null> {
  if (dbPromise) return dbPromise;
  dbPromise = new Promise<IDBDatabase | null>((resolve) => {
    try {
      if (typeof indexedDB === "undefined") {
        resolve(null);
        return;
      }
      const req = indexedDB.open(DB_NAME, DB_VERSION);
      req.onupgradeneeded = () => {
        const db = req.result;
        if (!db.objectStoreNames.contains(STORE)) {
          db.createObjectStore(STORE, { keyPath: "key" });
        }
      };
      req.onsuccess = () => resolve(req.result);
      req.onerror = () => resolve(null);
      // Blocked (another tab holds an older version open) — don't hang
      // the reading path; degrade to memory mode.
      req.onblocked = () => resolve(null);
    } catch {
      resolve(null);
    }
  });
  return dbPromise;
}

// ----- Low-level get / put / has (the storage foundation) ----------------

/**
 * Read one record by spec. Returns null on miss, on pass-through (no
 * scope yet), or on any storage error — callers treat all three as
 * "no cache, fetch fresh".
 */
export async function get<T>(spec: ContentSpec): Promise<T | null> {
  if (scope === null) return null;
  const key = keyFor(spec);
  const db = await openDb();
  if (!db) {
    const rec = memoryStore.get(key) as CacheRecord<T> | undefined;
    return rec ? rec.data : null;
  }
  return new Promise<T | null>((resolve) => {
    try {
      const tx = db.transaction(STORE, "readonly");
      const req = tx.objectStore(STORE).get(key);
      req.onsuccess = () => {
        const rec = req.result as CacheRecord<T> | undefined;
        resolve(rec ? rec.data : null);
      };
      req.onerror = () => resolve(null);
    } catch {
      resolve(null);
    }
  });
}

/**
 * Write one record. No-op in pass-through mode (no scope yet). Reused by
 * Phase 2's download button to pre-seed whole books. `now` is injectable
 * so callers/tests can stamp deterministically; defaults to Date.now().
 */
export async function put<T>(
  spec: ContentSpec,
  data: T,
  now: number = Date.now(),
): Promise<void> {
  if (scope === null) return;
  const record: CacheRecord<T> = { key: keyFor(spec), data, cachedAt: now };
  const db = await openDb();
  if (!db) {
    memoryStore.set(record.key, record as CacheRecord<unknown>);
    return;
  }
  return new Promise<void>((resolve) => {
    try {
      const tx = db.transaction(STORE, "readwrite");
      tx.objectStore(STORE).put(record);
      tx.oncomplete = () => resolve();
      tx.onerror = () => resolve();
      tx.onabort = () => resolve();
    } catch {
      resolve();
    }
  });
}

/** True when a record for this spec is cached under the current scope. */
export async function has(spec: ContentSpec): Promise<boolean> {
  const data = await get<unknown>(spec);
  return data !== null;
}

// ----- Stale-while-revalidate read-through -------------------------------

export interface SwrCallbacks<T> {
  /**
   * Called with usable data — possibly twice: once immediately with the
   * cached payload (fromCache=true) for an instant paint, then again with
   * the fresh network payload (fromCache=false). Most callers render the
   * same way for both; the flag is there for the rare site that cares.
   */
  onData: (data: T, fromCache: boolean) => void;
  /**
   * Called only when the network fetch fails AND no cached payload was
   * served — i.e. the caller has nothing to show. When a stale payload
   * WAS served, a revalidation failure is swallowed (stale is fine). If
   * omitted, network errors are swallowed entirely.
   */
  onError?: (err: unknown) => void;
}

export interface SwrHandle {
  /** Cancel pending callbacks (call from a React effect cleanup). */
  cancel: () => void;
}

/**
 * Read-through with stale-while-revalidate.
 *
 *   1. If a cached payload exists, fire onData(cached, true) right away.
 *   2. Always run the fetcher; on success, write the cache and fire
 *      onData(fresh, false).
 *   3. On fetch failure, fire onError only if step 1 served nothing.
 *
 * Returns a handle whose cancel() suppresses any not-yet-delivered
 * callbacks — wire it to the effect cleanup so a fast navigation can't
 * land a stale chapter's data on the new chapter. The network write still
 * completes after cancel (cheap, and warms the cache for the back-button).
 */
export function readThrough<T>(
  spec: ContentSpec,
  fetcher: () => Promise<T>,
  callbacks: SwrCallbacks<T>,
): SwrHandle {
  let cancelled = false;
  let servedCache = false;

  void (async () => {
    try {
      const cached = await get<T>(spec);
      if (!cancelled && cached !== null) {
        servedCache = true;
        callbacks.onData(cached, true);
      }
    } catch {
      // Cache read failure is non-fatal — fall through to the network.
    }

    try {
      const fresh = await fetcher();
      // Persist even if cancelled — warms the cache for a likely revisit.
      void put(spec, fresh);
      if (!cancelled) callbacks.onData(fresh, false);
    } catch (err) {
      if (cancelled) return;
      // Only surface the error when the caller has nothing on screen.
      if (!servedCache) callbacks.onError?.(err);
    }
  })();

  return {
    cancel: () => {
      cancelled = true;
    },
  };
}

// ----- Bulk maintenance (Phase 2 — download / storage view) --------------
//
// The "Download for offline" screen needs to (a) report how much is stored
// and (b) let the partner clear it — per content area or all at once. These
// helpers operate ONLY on the current scope (the partner's resolved tier),
// so clearing never touches another tier's entries on a shared device. They
// degrade to the in-memory store when IndexedDB is unavailable, same as the
// rest of this module.

/** Decoded form of a composite key — see keyFor(). */
function parseKey(
  key: string,
): { scope: string; version: string; book: string; chapter: string; layer: string } | null {
  const parts = key.split("|");
  if (parts.length !== 5) return null;
  return {
    scope: parts[0],
    version: parts[1],
    book: parts[2],
    chapter: parts[3],
    layer: parts[4],
  };
}

/** Approx serialized size of a record's payload, in bytes (UTF-8-ish). */
function approxBytes(data: unknown): number {
  try {
    // Byte length, not char length — multi-byte chars (Hebrew/Greek) count
    // correctly. Falls back to char length if TextEncoder is missing.
    const json = JSON.stringify(data) ?? "";
    if (typeof TextEncoder !== "undefined") {
      return new TextEncoder().encode(json).length;
    }
    return json.length;
  } catch {
    return 0;
  }
}

export interface CacheLayerStat {
  records: number;
  bytes: number;
}

export interface CacheStats {
  records: number;
  bytes: number;
  /** Per-layer breakdown, keyed by ContentLayer. */
  byLayer: Partial<Record<ContentLayer, CacheLayerStat>>;
}

/**
 * Count records + approximate bytes stored under the CURRENT scope, broken
 * down by layer. Returns zeros in pass-through mode (no scope yet) or on any
 * storage error — the storage view reads that as "nothing downloaded."
 */
export async function getCacheStats(): Promise<CacheStats> {
  const empty: CacheStats = { records: 0, bytes: 0, byLayer: {} };
  if (scope === null) return empty;

  const add = (stats: CacheStats, layer: string, bytes: number) => {
    stats.records += 1;
    stats.bytes += bytes;
    const l = layer as ContentLayer;
    const cur = stats.byLayer[l] ?? { records: 0, bytes: 0 };
    cur.records += 1;
    cur.bytes += bytes;
    stats.byLayer[l] = cur;
  };

  const db = await openDb();
  if (!db) {
    const stats: CacheStats = { records: 0, bytes: 0, byLayer: {} };
    for (const [key, rec] of memoryStore) {
      const parsed = parseKey(key);
      if (!parsed || parsed.scope !== scope) continue;
      add(stats, parsed.layer, approxBytes(rec.data));
    }
    return stats;
  }

  return new Promise<CacheStats>((resolve) => {
    const stats: CacheStats = { records: 0, bytes: 0, byLayer: {} };
    try {
      const tx = db.transaction(STORE, "readonly");
      const req = tx.objectStore(STORE).openCursor();
      req.onsuccess = () => {
        const cursor = req.result;
        if (!cursor) {
          resolve(stats);
          return;
        }
        const rec = cursor.value as CacheRecord<unknown>;
        const parsed = parseKey(rec.key);
        if (parsed && parsed.scope === scope) {
          add(stats, parsed.layer, approxBytes(rec.data));
        }
        cursor.continue();
      };
      req.onerror = () => resolve(stats);
    } catch {
      resolve(stats);
    }
  });
}

/** Internal: delete every record under the current scope matching `keep`. */
async function deleteWhere(
  keep: (parsed: NonNullable<ReturnType<typeof parseKey>>) => boolean,
): Promise<void> {
  if (scope === null) return;
  const db = await openDb();
  if (!db) {
    for (const key of [...memoryStore.keys()]) {
      const parsed = parseKey(key);
      if (parsed && parsed.scope === scope && keep(parsed)) memoryStore.delete(key);
    }
    return;
  }
  return new Promise<void>((resolve) => {
    try {
      const tx = db.transaction(STORE, "readwrite");
      const store = tx.objectStore(STORE);
      const req = store.openCursor();
      req.onsuccess = () => {
        const cursor = req.result;
        if (!cursor) return; // tx.oncomplete resolves
        const rec = cursor.value as CacheRecord<unknown>;
        const parsed = parseKey(rec.key);
        if (parsed && parsed.scope === scope && keep(parsed)) cursor.delete();
        cursor.continue();
      };
      tx.oncomplete = () => resolve();
      tx.onerror = () => resolve();
      tx.onabort = () => resolve();
    } catch {
      resolve();
    }
  });
}

/** Delete every record for the given layers under the current scope. */
export async function clearByLayers(layers: ContentLayer[]): Promise<void> {
  const set = new Set<string>(layers);
  await deleteWhere((p) => set.has(p.layer));
}

/** Delete every record under the current scope (all downloaded content). */
export async function clearAll(): Promise<void> {
  await deleteWhere(() => true);
}

/**
 * Delete EVERY record regardless of scope — used by the content-version
 * sweep (lib/contentVersion.ts) to purge stale cached content after a
 * deploy. Unlike clearAll/deleteWhere this ignores the active scope so it
 * also clears entries left by a different tier on a shared device. Works
 * even in pass-through mode (scope === null), since it doesn't filter by
 * scope. Degrades to the in-memory store when IndexedDB is unavailable.
 */
export async function clearAllScopes(): Promise<void> {
  const db = await openDb();
  if (!db) {
    memoryStore.clear();
    return;
  }
  return new Promise<void>((resolve) => {
    try {
      const tx = db.transaction(STORE, "readwrite");
      tx.objectStore(STORE).clear();
      tx.oncomplete = () => resolve();
      tx.onerror = () => resolve();
      tx.onabort = () => resolve();
    } catch {
      resolve();
    }
  });
}
