/**
 * Background download manager — the singleton that owns the offline
 * download loop OUTSIDE the React tree.
 *
 * THE BUG THIS FIXES. The original "Download for offline" button drove
 * lib/offlineDownload.ts#runDownload directly from inside the
 * DownloadsSettings component: the AbortController lived in a component
 * `useRef`, and progress was a component `useState`. So the only thing
 * keeping the download "visible" — and, on a hard navigation (a sign-in
 * `window.location.assign`, a reload, the iOS WebView suspending a
 * backgrounded tab), the only thing keeping it RUNNING and resuming — was
 * that one screen being mounted. A partner who tapped Download and then
 * navigated away to read believed they had offline access; in fact the
 * run had quietly stopped and never resumed. New radio-driven installs hit
 * exactly this.
 *
 * THE FIX. Hoist the loop to module scope. This manager:
 *   - runs runDownload from a module-level promise, so SPA navigation
 *     (which unmounts the screen but keeps the JS context) never stops it;
 *   - persists progress through offlineDownload's localStorage manifest,
 *     so a context-destroying reload/kill can be detected and RESUMED on
 *     next launch (manifest state "running" = interrupted);
 *   - auto-resumes interrupted/failed areas on launch, on regaining
 *     connectivity (`online`), and when the app returns to the foreground
 *     (`visibilitychange`) — covering the WebView-suspend case;
 *   - exposes subscribe()/getSnapshot() so ANY component — the Downloads
 *     screen AND a global, always-visible progress indicator — can render
 *     the same live state from anywhere in the app.
 *
 * Concurrency: one area downloads at a time (a small FIFO queue). The
 * layers overlap across areas and are deduped in the cache via `has`, so
 * serial is both simpler and avoids fetching the shared text twice.
 */

import { type PartnerTier } from "./api";
import {
  DownloadPausedError,
  type DownloadAreaId,
  type DownloadProgress,
  type DownloadState,
  getArea,
  listInterruptedAreas,
  readManifest,
  runDownload,
} from "./offlineDownload";

// ----- Snapshot the UI renders --------------------------------------------

export interface DownloadManagerSnapshot {
  /** The area currently downloading, or null when idle. */
  activeAreaId: DownloadAreaId | null;
  /** Areas waiting their turn (excludes the active one). */
  queued: DownloadAreaId[];
  /** Last-known progress per area (seeded from the manifest, then live). */
  progress: Partial<Record<DownloadAreaId, DownloadProgress>>;
  /** Bumped on every change so subscribers needn't deep-compare. */
  rev: number;
}

interface QueueItem {
  id: DownloadAreaId;
  force: boolean;
}

// ----- Module-level state (survives every component unmount) --------------

let tier: PartnerTier | null = null;
let tierConfigured = false;
let activeId: DownloadAreaId | null = null;
let activeController: AbortController | null = null;
const queue: QueueItem[] = [];
const progress: Partial<Record<DownloadAreaId, DownloadProgress>> = {};
let rev = 0;
const listeners = new Set<(s: DownloadManagerSnapshot) => void>();
let lifecycleWired = false;

function snapshot(): DownloadManagerSnapshot {
  return {
    activeAreaId: activeId,
    queued: queue.map((q) => q.id),
    progress: { ...progress },
    rev,
  };
}

function emit(): void {
  rev += 1;
  const snap = snapshot();
  for (const fn of listeners) {
    try {
      fn(snap);
    } catch {
      /* a bad subscriber must not break the loop */
    }
  }
}

/** Seed progress[] from the persisted manifest so a freshly-mounted UI
 *  shows prior state (downloaded / paused / interrupted) immediately. */
function seedFromManifest(): void {
  const manifest = readManifest();
  for (const [id, entry] of Object.entries(manifest)) {
    if (!entry) continue;
    const areaId = id as DownloadAreaId;
    progress[areaId] = {
      areaId,
      // A run left "running" by a reload/kill reads as paused until resumed.
      state: entry.state === "running" ? "paused" : (entry.state as DownloadState),
      booksTotal: entry.booksTotal,
      booksDone: entry.booksDone,
      chaptersTotal: entry.chaptersTotal,
      chaptersDone: entry.chaptersDone,
      bytes: entry.bytes,
    };
  }
}

// ----- Public API ----------------------------------------------------------

/**
 * Tell the manager the partner's resolved tier. Called by App.tsx once /me
 * settles (anonymous → "free"). Seeds progress from the manifest and wires
 * the lifecycle listeners exactly once. Re-calling with a CHANGED tier
 * resets the seeded progress (a new tier owns different content).
 */
export function configureDownloadManager(nextTier: PartnerTier | null): void {
  const changed = tierConfigured && nextTier !== tier;
  tier = nextTier;
  tierConfigured = true;
  if (changed) {
    for (const k of Object.keys(progress)) delete progress[k as DownloadAreaId];
  }
  seedFromManifest();
  wireLifecycle();
  emit();
}

export function subscribeDownloadManager(
  fn: (s: DownloadManagerSnapshot) => void,
): () => void {
  listeners.add(fn);
  fn(snapshot());
  return () => {
    listeners.delete(fn);
  };
}

export function getDownloadSnapshot(): DownloadManagerSnapshot {
  return snapshot();
}

/** True when the area is downloading right now or waiting in the queue. */
export function isAreaActive(id: DownloadAreaId): boolean {
  return activeId === id || queue.some((q) => q.id === id);
}

/**
 * Start (or resume) a background download for an area. No-op if it's
 * already running or queued, so repeated taps / auto-resume triggers can't
 * double-run it. `force` re-fetches every layer (used to refresh a
 * downloaded library in place after a content-version change).
 */
export function startDownload(id: DownloadAreaId, opts: { force?: boolean } = {}): void {
  if (isAreaActive(id)) return;
  queue.push({ id, force: opts.force ?? false });
  // Optimistically reflect "running" so the UI flips immediately, even
  // while this item waits behind another in the queue.
  const prev = progress[id];
  progress[id] = {
    areaId: id,
    state: "running",
    booksTotal: prev?.booksTotal ?? 0,
    booksDone: prev?.booksDone ?? 0,
    chaptersTotal: prev?.chaptersTotal ?? 0,
    chaptersDone: prev?.chaptersDone ?? 0,
    bytes: prev?.bytes ?? 0,
  };
  emit();
  void pump();
}

/**
 * Pause an area. If it's the active download, abort it (runDownload writes
 * the manifest to "paused"); if it's merely queued, drop it from the
 * queue. Explicit pause is user intent — auto-resume never touches a
 * paused area.
 */
export function pauseDownload(id: DownloadAreaId): void {
  if (activeId === id && activeController) {
    activeController.abort();
    return;
  }
  const i = queue.findIndex((q) => q.id === id);
  if (i >= 0) {
    queue.splice(i, 1);
    const prev = progress[id];
    if (prev) progress[id] = { ...prev, state: "paused" };
    emit();
  }
}

/** Abort an area if it's active (used by "Remove from device" / clear). */
export function abortDownload(id: DownloadAreaId): void {
  if (activeId === id && activeController) activeController.abort();
  const i = queue.findIndex((q) => q.id === id);
  if (i >= 0) queue.splice(i, 1);
}

/** Drop the manager's in-memory progress for an area (after a clear). */
export function forgetArea(id: DownloadAreaId): void {
  delete progress[id];
  emit();
}

/** Drop all in-memory progress (after a clear-all). */
export function forgetAll(): void {
  for (const k of Object.keys(progress)) delete progress[k as DownloadAreaId];
  emit();
}

/**
 * Resume any area that was interrupted (manifest state "running") and was
 * NOT explicitly paused. Safe to call repeatedly — startDownload dedupes.
 * Called on launch and whenever connectivity / foreground returns.
 */
export function resumeInterruptedDownloads(): void {
  if (!tierConfigured) return;
  for (const id of listInterruptedAreas(tier)) startDownload(id);
}

/**
 * Refresh already-downloaded libraries in place to the current content
 * version (force re-fetch, overwriting each layer only after its fresh
 * payload arrives, so the offline copy is never emptied). Called by the
 * content-version sweep after a deploy.
 */
export function refreshDownloadedAreas(ids: DownloadAreaId[]): void {
  for (const id of ids) startDownload(id, { force: true });
}

// ----- The pump (serial queue runner) -------------------------------------

async function pump(): Promise<void> {
  if (activeId !== null) return; // one at a time
  const item = queue.shift();
  if (!item) return;

  // Guard: tier must own the area. An un-owned area (e.g. after a
  // downgrade) is dropped rather than looped on.
  try {
    getArea(item.id);
  } catch {
    void pump();
    return;
  }

  activeId = item.id;
  activeController = new AbortController();
  emit();

  try {
    await runDownload(item.id, tier, {
      force: item.force,
      signal: activeController.signal,
      onProgress: (p) => {
        progress[item.id] = p;
        emit();
      },
    });
  } catch (err) {
    if (err instanceof DownloadPausedError) {
      // runDownload already wrote the manifest to "paused".
      progress[item.id] = { ...(progress[item.id] as DownloadProgress), state: "paused" };
    } else {
      progress[item.id] = {
        ...(progress[item.id] as DownloadProgress),
        state: "error",
        error: err instanceof Error ? err.message : String(err),
      };
    }
  } finally {
    activeId = null;
    activeController = null;
    emit();
    // Drain the rest of the queue.
    void pump();
  }
}

// ----- Lifecycle: resume on reconnect / foreground -------------------------

function wireLifecycle(): void {
  if (lifecycleWired || typeof window === "undefined") return;
  lifecycleWired = true;
  // Regained connectivity → retry interrupted runs.
  window.addEventListener("online", () => resumeInterruptedDownloads());
  // App returned to the foreground (WebView un-suspended) → retry.
  if (typeof document !== "undefined") {
    document.addEventListener("visibilitychange", () => {
      if (document.visibilityState === "visible") resumeInterruptedDownloads();
    });
  }
}
