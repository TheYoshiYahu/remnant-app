/**
 * Content-version self-heal — make a deploy reach every user on next open
 * with NO manual "clear cache" / reinstall.
 *
 * THE PROBLEM. After a deploy (new book published, apparatus edited, menu
 * filter changed) a partner could stay stuck on stale cached content until
 * they manually cleared the browser cache — which Yoshi had to do to see
 * the full book list. The app shell + hashed assets already self-heal
 * (render.yaml serves index.html `no-cache` and /assets/* `immutable`),
 * and the reading API is now `no-cache` too (api/main.py), so the HTTP
 * layer revalidates. This module closes the last gap: the client's own
 * IndexedDB read-through cache (lib/contentCache.ts) and any future
 * service-worker caches, which the network headers don't govern.
 *
 * THE MECHANISM. The server exposes a tiny always-fresh token at
 * /v1/content-version that bumps on every deploy (Render git commit + DB
 * schema_version). On cold open the client compares it to the last value
 * it stored:
 *   - unchanged → nothing to do;
 *   - changed → purge the stale local caches and refetch;
 *   - first run (nothing stored) → just record it; a fresh install has
 *     nothing stale to purge, and we must not wipe a download the partner
 *     made before this code shipped;
 *   - token fetch FAILS (offline) → do NOTHING. We only ever purge when we
 *     reached the server, which both proves we can refetch and guarantees
 *     an offline partner's downloaded library is never wiped out from
 *     under them.
 *
 * OFFLINE-SAFE PURGE. "Purge" must REFRESH, not empty, a downloaded
 * library:
 *   - if the partner has downloaded an offline library, we DON'T wipe it.
 *     We hand the refresh to offlineKeep.requestBackgroundSync, which
 *     refreshes each downloaded area IN PLACE (force re-fetch, overwriting
 *     each layer only after its fresh payload arrives) — but only when the
 *     "Keep available offline" toggle is on AND the connection policy allows
 *     it (Wi-Fi-only by default). If it can't sync now (cellular / unknown
 *     connection under Wi-Fi-only) the refresh is DEFERRED, not skipped: the
 *     library stays on the prior content until Wi-Fi returns. This is the
 *     S354 fix for the deploy-token cellular-data trap.
 *   - if the partner has NO downloaded library, the only local content is
 *     incidental read-through cache; we clear it wholesale (cheap, and they
 *     refetch as they read — they're online, since the token fetch worked).
 *   - either way we clear CacheStorage (service-worker caches), which is
 *     defensive today (no SW yet) and correct the moment one ships.
 */

import { getContentVersion } from "./api";
import { clearAllScopes } from "./contentCache";
import { hasAnyDownload } from "./offlineDownload";
import { requestBackgroundSync } from "./offlineKeep";

const VERSION_KEY = "rop_content_version_v1";

export interface ContentVersionResult {
  /** The token changed since last open and a purge/refresh ran. */
  changed: boolean;
  /** The token couldn't be fetched (offline) — caches left untouched. */
  offline: boolean;
  /** A downloaded offline library was refreshed in place (not wiped). */
  refreshedLibrary: boolean;
}

function readStored(): string | null {
  try {
    return localStorage.getItem(VERSION_KEY);
  } catch {
    return null;
  }
}

function writeStored(version: string): void {
  try {
    localStorage.setItem(VERSION_KEY, version);
  } catch {
    /* localStorage full / disabled — we'll just re-check next open */
  }
}

/** Delete every CacheStorage (service-worker) cache. Defensive: there's no
 *  SW today, but this makes the sweep correct the instant one ships. */
async function clearServiceWorkerCaches(): Promise<void> {
  try {
    if (typeof caches === "undefined") return;
    const keys = await caches.keys();
    await Promise.all(keys.map((k) => caches.delete(k)));
  } catch {
    /* CacheStorage unavailable / blocked — ignore */
  }
}

/**
 * Compare the server content-version to the last-seen value and self-heal
 * if it changed. Call once on cold open AFTER the cache scope is set and
 * the download manager is configured (so an in-place library refresh lands
 * under the right tier). Never throws — every failure path is swallowed so
 * a version check can't break app boot.
 */
export async function checkContentVersionAndHeal(): Promise<ContentVersionResult> {
  const idle: ContentVersionResult = {
    changed: false,
    offline: false,
    refreshedLibrary: false,
  };

  let token: string;
  try {
    token = (await getContentVersion()).version;
  } catch {
    // Offline (or the endpoint is down): leave all local caches intact so
    // offline reading is undisturbed. We'll re-check on the next open.
    return { ...idle, offline: true };
  }

  const stored = readStored();

  // First run: record the token, purge nothing. A fresh install has no
  // stale cache, and a pre-existing download must not be wiped.
  if (stored === null) {
    writeStored(token);
    return idle;
  }

  if (stored === token) return idle;

  // Token changed → self-heal.
  await clearServiceWorkerCaches();

  let refreshedLibrary = false;
  if (hasAnyDownload()) {
    // Refresh the downloaded library in place — never empty it — subject to
    // the "Keep available offline" toggle + the Wi-Fi-only connection policy.
    // If the policy defers it, the library stays on the prior content and the
    // refresh runs later when Wi-Fi returns (offlineKeep marks it pending).
    const { started } = requestBackgroundSync();
    refreshedLibrary = started;
  } else {
    // No offline library: drop the incidental read-through cache so the
    // next read pulls fresh content (the partner is online — the token
    // fetch just succeeded).
    await clearAllScopes();
  }

  writeStored(token);
  return { changed: true, offline: false, refreshedLibrary };
}
