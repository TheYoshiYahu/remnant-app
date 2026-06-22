/**
 * "Keep available offline" — the persistent preference + auto-sync policy that
 * sits ON TOP of the S353 background download foundation.
 *
 * S353 shipped the moving parts: a module-level background download manager
 * (downloadManager.ts) that survives the app's full-page-reload navigation and
 * resumes interrupted runs; a content-version token (/v1/content-version +
 * contentVersion.ts) that detects a deploy on cold open; and a refresh-in-place
 * path (offlineDownload.runDownload `force`) that re-fetches a downloaded
 * library without ever emptying it.
 *
 * What was missing — and what this module adds — is the PARTNER INTENT layer:
 *
 *   1. A persistent "Keep available offline" toggle. ON means "keep the whole
 *      library on this device and keep it current automatically"; OFF means
 *      "stop syncing" (the already-downloaded content stays readable offline —
 *      we never auto-delete; the partner gets an explicit Remove button).
 *
 *   2. An auto-sync policy that is WI-FI-ONLY BY DEFAULT. The content-version
 *      token bumps on EVERY deploy, and S353's contentVersion heal refreshed
 *      the downloaded library unconditionally — which, over a cellular
 *      connection, is a mobile-data trap (a full re-fetch every time Yoshi
 *      pushes). This module gates the background refresh on the connection
 *      type so an automatic update never burns cellular data unless the
 *      partner has opted in.
 *
 * NETWORK DETECTION. Capacitor's Network plugin is not installed, so we read
 * the web Network Information API (`navigator.connection.type`). It reports
 * "wifi" / "cellular" reliably on Android Chrome + the Android WebView, but is
 * absent on iOS Safari / WKWebView (and some desktops), where the type is
 * UNKNOWN. When the type can't be determined we choose the SAFE default: a
 * background auto-sync is NOT started (so an unknown connection is never
 * assumed to be free). The partner always has two escapes — "Allow updates
 * over cellular" (which also covers the can't-detect case) and a manual
 * "Sync now" — and the Downloads screen states this plainly.
 *
 * The INITIAL download (the partner deliberately flipping the toggle ON) is
 * explicit consent and runs regardless of connection type — only the silent,
 * automatic, deploy-triggered refresh is Wi-Fi-gated.
 */

import { type PartnerTier } from "./api";
import {
  DOWNLOAD_AREAS,
  hasAnyDownload,
  listDownloadedAreas,
  isAreaUnlocked,
  readManifest,
  type DownloadAreaId,
} from "./offlineDownload";
import {
  pauseDownload,
  refreshDownloadedAreas,
  startDownload,
  subscribeDownloadManager,
} from "./downloadManager";

// ----- localStorage keys (same store the rest of the offline stack uses) ---

const KEEP_KEY = "rop_keep_offline_v1";
const CELLULAR_KEY = "rop_allow_cellular_v1";
const LAST_SYNCED_KEY = "rop_last_synced_v1";
const PENDING_KEY = "rop_sync_pending_v1";

function readBool(key: string): boolean | null {
  try {
    const raw = localStorage.getItem(key);
    if (raw === null) return null;
    return raw === "1";
  } catch {
    return null;
  }
}

function writeBool(key: string, value: boolean): void {
  try {
    localStorage.setItem(key, value ? "1" : "0");
  } catch {
    /* localStorage full / disabled — preference just won't persist */
  }
}

// ----- preference getters --------------------------------------------------

/**
 * Is "Keep available offline" on? If the partner has never touched the toggle
 * we default to whatever a pre-S354 download already implies: a partner who
 * had downloaded a library (via the old per-area buttons) is treated as
 * opted-in, so their library keeps getting refreshed — now Wi-Fi-gated rather
 * than unconditionally as before. A fresh install with no download defaults
 * OFF.
 */
export function isKeepOffline(): boolean {
  const stored = readBool(KEEP_KEY);
  if (stored !== null) return stored;
  return hasAnyDownload();
}

/** Has the toggle been explicitly set (vs. defaulted from an existing download)? */
export function isKeepOfflineExplicit(): boolean {
  return readBool(KEEP_KEY) !== null;
}

/** Allow automatic updates over cellular? Default OFF (Wi-Fi only). */
export function isAllowCellular(): boolean {
  return readBool(CELLULAR_KEY) ?? false;
}

function isSyncPending(): boolean {
  return readBool(PENDING_KEY) ?? false;
}

function setSyncPending(pending: boolean): void {
  writeBool(PENDING_KEY, pending);
}

/** Epoch-ms of the last successful sync/download, or null if never. Falls back
 *  to the newest manifest entry so a pre-S354 download still shows a time. */
export function getLastSynced(): number | null {
  try {
    const raw = localStorage.getItem(LAST_SYNCED_KEY);
    if (raw) {
      const n = Number(raw);
      if (Number.isFinite(n) && n > 0) return n;
    }
  } catch {
    /* ignore */
  }
  // Fallback: newest manifest updatedAt (covers libraries downloaded before
  // this module recorded its own timestamp).
  let newest = 0;
  for (const entry of Object.values(readManifest())) {
    if (entry && entry.updatedAt > newest) newest = entry.updatedAt;
  }
  return newest > 0 ? newest : null;
}

function setLastSynced(ts: number): void {
  try {
    localStorage.setItem(LAST_SYNCED_KEY, String(ts));
  } catch {
    /* ignore */
  }
}

// ----- network detection ---------------------------------------------------

export type ConnectionType = "wifi" | "cellular" | "unknown";

/** Minimal shape of the Network Information API (not in the TS DOM lib). */
interface NetworkInformationLike {
  type?: string;
  effectiveType?: string;
  addEventListener?: (type: "change", listener: () => void) => void;
  removeEventListener?: (type: "change", listener: () => void) => void;
}

function navConnection(): NetworkInformationLike | undefined {
  if (typeof navigator === "undefined") return undefined;
  const nav = navigator as Navigator & {
    connection?: NetworkInformationLike;
    mozConnection?: NetworkInformationLike;
    webkitConnection?: NetworkInformationLike;
  };
  return nav.connection ?? nav.mozConnection ?? nav.webkitConnection;
}

/**
 * Best-effort connection type. "wifi" / "cellular" come straight from the
 * Network Information API's `type`; "ethernet"/"wimax" count as un-metered
 * (treated like wifi); a missing API or an indeterminate value → "unknown".
 */
export function getConnectionType(): ConnectionType {
  const conn = navConnection();
  const t = conn?.type;
  if (t === "wifi" || t === "ethernet" || t === "wimax") return "wifi";
  if (t === "cellular") return "cellular";
  // Some engines expose only effectiveType (2g/3g/4g) with no `type`; that
  // doesn't distinguish wifi from cellular, so it stays unknown.
  return "unknown";
}

/** Can the connection type be determined at all on this device? */
export function isConnectionTypeKnown(): boolean {
  return getConnectionType() !== "unknown";
}

export function isOnline(): boolean {
  if (typeof navigator === "undefined") return true;
  return navigator.onLine !== false;
}

/**
 * PURE policy (exported for tests): may a silent, automatic background sync
 * run under these conditions? Offline → never. Allow-cellular → yes whenever
 * online. Otherwise (Wi-Fi only) → only on a connection KNOWN to be wifi; an
 * unknown type is the safe-default block.
 */
export function autoSyncAllowed(opts: {
  online: boolean;
  connection: ConnectionType;
  allowCellular: boolean;
}): boolean {
  if (!opts.online) return false;
  if (opts.allowCellular) return true;
  return opts.connection === "wifi";
}

/** Live evaluation of {@link autoSyncAllowed} against the device right now. */
export function canAutoSyncNow(): boolean {
  return autoSyncAllowed({
    online: isOnline(),
    connection: getConnectionType(),
    allowCellular: isAllowCellular(),
  });
}

// ----- which areas the toggle keeps ---------------------------------------

/**
 * S355 — "Keep available offline" downloads ONE thing: the partner's complete
 * entitled library. There is a single download area now, open to every tier
 * (the server gates the content), so this is always the library area. (The
 * `tier`/`isAreaUnlocked` check is retained for forward-compatibility but is
 * always true today.)
 */
export function keepAreaIds(tier: PartnerTier | null): DownloadAreaId[] {
  return DOWNLOAD_AREAS.filter((a) => isAreaUnlocked(a, tier)).map((a) => a.id);
}

// ----- status (for the UI) -------------------------------------------------

export interface KeepStatus {
  keepOffline: boolean;
  allowCellular: boolean;
  connection: ConnectionType;
  online: boolean;
  /** A new content version is downloaded-but-deferred, waiting for Wi-Fi. */
  syncPending: boolean;
  lastSynced: number | null;
  hasDownload: boolean;
}

export function getKeepStatus(): KeepStatus {
  return {
    keepOffline: isKeepOffline(),
    allowCellular: isAllowCellular(),
    connection: getConnectionType(),
    online: isOnline(),
    syncPending: isSyncPending(),
    lastSynced: getLastSynced(),
    hasDownload: hasAnyDownload(),
  };
}

// ----- pub/sub so the Settings UI re-renders on pref/network change --------

const listeners = new Set<() => void>();

export function subscribeKeep(fn: () => void): () => void {
  listeners.add(fn);
  return () => {
    listeners.delete(fn);
  };
}

function emitKeep(): void {
  for (const fn of listeners) {
    try {
      fn();
    } catch {
      /* a bad subscriber must not break the others */
    }
  }
}

// ----- actions -------------------------------------------------------------

/**
 * Flip the toggle. ON → persist + kick off the background download of every
 * owned reading area (explicit consent: runs regardless of connection type;
 * the manager queues + resumes it). OFF → persist + pause any in-progress
 * keep-area download and stop auto-syncing; already-downloaded content is left
 * in place (the partner removes it explicitly via "Remove downloaded data").
 */
export function setKeepOffline(on: boolean, tier: PartnerTier | null): void {
  writeBool(KEEP_KEY, on);
  if (on) {
    setSyncPending(false);
    for (const id of keepAreaIds(tier)) startDownload(id);
  } else {
    // Stop syncing. Pause an active initial download (keeps the partial,
    // resumable copy); auto-resume only touches "running"/interrupted areas,
    // and paused areas are never auto-resumed, so this truly stops it.
    for (const id of keepAreaIds(tier)) pauseDownload(id);
    setSyncPending(false);
  }
  emitKeep();
}

/** Toggle cellular permission. Turning it ON may unblock a deferred sync. */
export function setAllowCellular(on: boolean, tier: PartnerTier | null): void {
  writeBool(CELLULAR_KEY, on);
  emitKeep();
  if (on) runPendingSyncIfPossible(tier);
}

/**
 * Called by the content-version heal after a deploy is detected. Decides
 * whether to refresh the downloaded library now or defer it:
 *   - no downloaded library, or toggle OFF → do nothing;
 *   - toggle ON + auto-sync allowed (Wi-Fi, or cellular permitted) → refresh
 *     in place now;
 *   - toggle ON but not allowed (cellular / unknown under Wi-Fi-only) → mark
 *     the sync pending and wait for Wi-Fi / foreground / cellular opt-in.
 * Returns what it did so the caller can log it.
 */
export function requestBackgroundSync(): {
  started: boolean;
  deferred: boolean;
} {
  const downloaded = listDownloadedAreas();
  if (downloaded.length === 0) return { started: false, deferred: false };
  if (!isKeepOffline()) return { started: false, deferred: false };
  if (canAutoSyncNow()) {
    refreshDownloadedAreas(downloaded);
    emitKeep();
    return { started: true, deferred: false };
  }
  setSyncPending(true);
  emitKeep();
  return { started: false, deferred: true };
}

/**
 * Make sure a kept-offline library actually gets built. If the toggle is ON
 * but nothing has been downloaded yet — e.g. the partner flipped it on while
 * offline, or the very first listBooks failed before any manifest was written
 * — start the initial download as soon as we're back online. The initial
 * download is explicit consent, so it runs regardless of the Wi-Fi-only gate
 * (that gate only governs the silent, automatic deploy refresh). startDownload
 * dedupes, so this is safe to call repeatedly.
 */
export function ensureKeptOffline(tier: PartnerTier | null): void {
  if (!isKeepOffline()) return;
  if (!isOnline()) return;
  if (hasAnyDownload()) return; // a real download (or partial) already exists
  for (const id of keepAreaIds(tier)) startDownload(id);
}

/**
 * If a sync was deferred (waiting for Wi-Fi) and conditions now allow it,
 * start the refresh. Safe to call repeatedly — refreshDownloadedAreas dedupes
 * through the manager. Wired to the `online`/foreground/`change` events.
 */
export function runPendingSyncIfPossible(tier: PartnerTier | null): void {
  void tier; // reserved; refresh operates on the already-downloaded set
  if (!isSyncPending()) return;
  if (!isKeepOffline()) {
    setSyncPending(false);
    emitKeep();
    return;
  }
  if (!canAutoSyncNow()) return;
  const downloaded = listDownloadedAreas();
  if (downloaded.length === 0) {
    setSyncPending(false);
    emitKeep();
    return;
  }
  refreshDownloadedAreas(downloaded);
  emitKeep();
}

/**
 * Manual "Sync now" / "Download now" — explicit user action, so it ignores the
 * Wi-Fi-only gate (the partner asked for it). Refreshes a downloaded library
 * in place, or starts the initial download of the owned reading areas if
 * nothing is downloaded yet.
 */
export function syncNow(tier: PartnerTier | null): void {
  const downloaded = listDownloadedAreas();
  if (downloaded.length > 0) {
    refreshDownloadedAreas(downloaded);
  } else {
    for (const id of keepAreaIds(tier)) startDownload(id);
  }
  setSyncPending(false);
  emitKeep();
}

// ----- lifecycle: record sync completions, retry deferred syncs ------------

let inited = false;
let lastActive: DownloadAreaId | null = null;

/**
 * Wire offlineKeep's listeners exactly once (App.tsx calls this on boot, after
 * the download manager is configured). Records "last synced" when a keep-area
 * download finishes, clears the pending flag, and retries a deferred sync when
 * connectivity / foreground / cellular-permission changes.
 */
export function initOfflineKeep(tier: PartnerTier | null): void {
  if (inited || typeof window === "undefined") return;
  inited = true;

  // Stamp "last synced" the moment an active keep-area download completes.
  subscribeDownloadManager((snap) => {
    const now = snap.activeAreaId;
    if (lastActive && lastActive !== now) {
      const finished = snap.progress[lastActive];
      if (finished?.state === "done") {
        setLastSynced(Date.now());
        if (isSyncPending()) setSyncPending(false);
        emitKeep();
      }
    }
    lastActive = now;
  });

  const retry = () => {
    ensureKeptOffline(tier); // start a download that never got off the ground
    runPendingSyncIfPossible(tier); // resume a Wi-Fi-deferred refresh
  };
  window.addEventListener("online", () => {
    emitKeep(); // refresh the status pill's online/offline state
    retry();
  });
  window.addEventListener("offline", () => emitKeep());
  const conn = navConnection();
  conn?.addEventListener?.("change", () => {
    emitKeep(); // connection type may have changed (wifi ⇄ cellular)
    retry();
  });
  if (typeof document !== "undefined") {
    document.addEventListener("visibilitychange", () => {
      if (document.visibilityState === "visible") retry();
    });
  }
}
