/**
 * Settings → Downloads.
 *
 * S355 — collapsed to a SINGLE all-or-nothing control. There is no longer a
 * core / study / compare / maps split and no per-area upgrade prompt: the
 * design principle (Yoshi) is that nobody elects PARTIAL offline. So this
 * screen is just the "Keep available offline" toggle — flip it on and the
 * partner's COMPLETE entitled library downloads in one action (every book
 * they can read, including the extra-canonical witnesses their plan includes,
 * plus cross-references, the interlinear, and study notes), keeps itself up to
 * date in the background (Wi-Fi-only by default), and can be removed to
 * reclaim space. Tiering still applies — at the data layer (the walk fetches
 * only what the partner is entitled to; the cache is tier-scoped) — so there's
 * nothing to gate in the UI.
 *
 * The download itself runs in the module-level manager (lib/downloadManager.ts)
 * and resumes on every page load (lib/main bootstrap), so leaving this screen
 * never stops it.
 *
 * Tier: this screen resolves the partner's tier itself (Settings renders
 * standalone, outside the Reader where the cache scope is normally set) and
 * activates the content-cache scope so the download lands under the right tier
 * key — never storing or serving content the tier doesn't own.
 *
 * Offline content only — this does NOT speed up The Appointed Times calendar
 * (that's CPU work, already handled). The copy never claims otherwise.
 */

import { useCallback, useEffect, useRef, useState } from "react";
import { getSubscriptionMe, type PartnerTier } from "../lib/api";
import {
  clearAll as clearAllCache,
  getCacheStats,
  setContentCacheScope,
  type CacheStats,
} from "../lib/contentCache";
import {
  clearManifest,
  LIBRARY_AREA_ID,
  type DownloadAreaId,
  type DownloadProgress,
} from "../lib/offlineDownload";
import {
  abortDownload,
  configureDownloadManager,
  forgetAll,
  subscribeDownloadManager,
} from "../lib/downloadManager";
import {
  getKeepStatus,
  initOfflineKeep,
  setAllowCellular,
  setKeepOffline,
  subscribeKeep,
  syncNow,
  type KeepStatus,
} from "../lib/offlineKeep";

// ----- formatting ---------------------------------------------------------

function formatSize(bytes: number): string {
  if (bytes <= 0) return "0 MB";
  const mb = bytes / (1024 * 1024);
  if (mb < 1) return `${Math.max(1, Math.round(bytes / 1024))} KB`;
  if (mb < 10) return `${mb.toFixed(1)} MB`;
  return `${Math.round(mb)} MB`;
}

/** Compact "x ago" for the last-synced stamp. */
function formatAgo(ts: number | null): string {
  if (!ts) return "never";
  const secs = Math.max(0, Math.round((Date.now() - ts) / 1000));
  if (secs < 60) return "just now";
  const mins = Math.round(secs / 60);
  if (mins < 60) return `${mins}m ago`;
  const hrs = Math.round(mins / 60);
  if (hrs < 24) return `${hrs}h ago`;
  const days = Math.round(hrs / 24);
  return `${days}d ago`;
}

const CONNECTION_LABEL: Record<string, string> = {
  wifi: "Wi-Fi",
  cellular: "cellular",
  unknown: "this connection",
};

export default function DownloadsSettings() {
  const [tier, setTier] = useState<PartnerTier | null>(null);
  const [tierChecked, setTierChecked] = useState(false);
  const [stats, setStats] = useState<CacheStats | null>(null);
  const [keep, setKeep] = useState<KeepStatus>(() => getKeepStatus());
  // True while the library is actively downloading (drives the "Updating…" line).
  const [downloading, setDownloading] = useState(false);
  // Live progress for the single library download (books/chapters/bytes).
  const [progress, setProgress] = useState<DownloadProgress | null>(null);
  // Track the active download across snapshots so we can refresh the storage
  // tally exactly when a run finishes (rather than polling).
  const prevActive = useRef<DownloadAreaId | null>(null);

  const refreshStats = useCallback(async () => {
    setStats(await getCacheStats());
  }, []);

  // Resolve the partner tier, activate the cache scope under it, hand the tier
  // to the background download manager, then measure what's already stored.
  useEffect(() => {
    let cancelled = false;
    (async () => {
      let resolved: PartnerTier | null;
      try {
        const me = await getSubscriptionMe();
        resolved = me.tier ?? "free";
      } catch {
        resolved = "free"; // anonymous / no JWT → free entitlement
      }
      if (cancelled) return;
      setTier(resolved);
      setTierChecked(true);
      setContentCacheScope(resolved ?? "free");
      // Idempotent — App.tsx + the main bootstrap also configure the manager;
      // this covers the case where Settings is the first surface to resolve it.
      configureDownloadManager(resolved);
      initOfflineKeep(resolved);
      await refreshStats();
    })();
    return () => {
      cancelled = true;
    };
  }, [refreshStats]);

  // Subscribe to the background manager for live progress + downloading state.
  useEffect(() => {
    const unsub = subscribeDownloadManager((snap) => {
      setProgress(snap.progress[LIBRARY_AREA_ID] ?? null);
      setDownloading(snap.activeAreaId !== null);
      // A download just finished/paused (active → idle) — re-measure storage
      // and re-read the keep status (last-synced / pending may have changed).
      const nowActive = snap.activeAreaId;
      if (prevActive.current && prevActive.current !== nowActive) {
        void refreshStats();
        setKeep(getKeepStatus());
      }
      prevActive.current = nowActive;
    });
    return unsub;
  }, [refreshStats]);

  // Re-read the keep status whenever the preference or network changes.
  useEffect(() => {
    return subscribeKeep(() => setKeep(getKeepStatus()));
  }, []);

  const toggleKeep = useCallback(() => {
    setKeepOffline(!getKeepStatus().keepOffline, tier);
  }, [tier]);

  const toggleCellular = useCallback(() => {
    setAllowCellular(!getKeepStatus().allowCellular, tier);
  }, [tier]);

  const doSyncNow = useCallback(() => {
    syncNow(tier);
  }, [tier]);

  const clearEverything = useCallback(async () => {
    abortDownload(LIBRARY_AREA_ID);
    await clearAllCache();
    clearManifest();
    forgetAll();
    await refreshStats();
    setKeep(getKeepStatus());
  }, [refreshStats]);

  // Percent by BOOKS — known up front, so the bar is monotonic and honest
  // (chaptersTotal only sums books walked so far and would race ahead).
  const pct =
    progress && progress.booksTotal > 0
      ? Math.min(100, Math.round((progress.booksDone / progress.booksTotal) * 100))
      : 0;

  return (
    <section
      id="downloads"
      className="scroll-mt-4 rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4"
    >
      <div className="flex items-baseline justify-between gap-3">
        <h2 className="text-base font-semibold text-[var(--reader-text)]">
          Downloads
        </h2>
        <span className="font-sans text-[11px] uppercase tracking-wider text-[var(--reader-accent)]">
          Offline
        </span>
      </div>
      <p className="mt-1 font-sans text-sm leading-relaxed text-[var(--reader-muted)]">
        Keep your whole library on this device for full offline reading — every
        book you can read, the cross-references, the interlinear, and the study
        notes, in one download. Your highlights, notes, and bookmarks already
        sync separately.
      </p>

      {/* Keep available offline — the single, persistent control. */}
      <div className="mt-3 rounded-md border border-[var(--reader-rule)] bg-[color-mix(in_srgb,var(--reader-accent)_6%,transparent)] px-3.5 py-3">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <span className="text-sm font-semibold text-[var(--reader-text)]">
              Keep available offline
            </span>
            <p className="mt-1 font-sans text-xs leading-relaxed text-[var(--reader-muted)]">
              Download your complete library and keep it up to date
              automatically. New books and edits sync in the background over
              Wi-Fi. Downloading continues even if you leave this screen.
            </p>
          </div>
          <button
            type="button"
            role="switch"
            aria-checked={keep.keepOffline}
            aria-label="Keep available offline"
            onClick={toggleKeep}
            disabled={!tierChecked}
            className="relative mt-0.5 inline-flex h-6 w-11 shrink-0 items-center rounded-full transition-colors disabled:opacity-50"
            style={{
              backgroundColor: keep.keepOffline
                ? "var(--reader-accent)"
                : "color-mix(in srgb, var(--reader-muted) 35%, transparent)",
            }}
          >
            <span
              className="inline-block h-5 w-5 rounded-full bg-white shadow transition-transform"
              style={{
                transform: keep.keepOffline
                  ? "translateX(1.375rem)"
                  : "translateX(0.125rem)",
              }}
            />
          </button>
        </div>

        {/* Live status line. */}
        <p className="mt-2.5 flex items-center gap-1.5 font-sans text-[12px] text-[var(--reader-text)]">
          {!keep.online ? (
            <>
              <span aria-hidden="true">⦸</span>
              <span className="text-[var(--reader-muted)]">
                Offline — reading from your saved copy.
              </span>
            </>
          ) : downloading ? (
            <>
              <span className="animate-pulse" aria-hidden="true">
                ⤓
              </span>
              <span>
                Saving your library… {progress && progress.booksTotal > 0 ? `${pct}%` : ""}
              </span>
            </>
          ) : keep.syncPending ? (
            <>
              <span aria-hidden="true">◷</span>
              <span>
                Update ready — will sync over{" "}
                {CONNECTION_LABEL[keep.connection] ?? "Wi-Fi"}.
              </span>
            </>
          ) : keep.hasDownload ? (
            <>
              <span className="text-[var(--reader-accent)]" aria-hidden="true">
                ✓
              </span>
              <span>
                Up to date
                <span className="text-[var(--reader-muted)]">
                  {" "}
                  · synced {formatAgo(keep.lastSynced)}
                </span>
              </span>
            </>
          ) : keep.keepOffline ? (
            <span className="text-[var(--reader-muted)]">Preparing download…</span>
          ) : (
            <span className="text-[var(--reader-muted)]">
              Not saved to this device.
            </span>
          )}
        </p>

        {/* Progress bar + counts while the library downloads. */}
        {downloading ? (
          <div className="mt-2">
            <div
              className="h-1.5 w-full overflow-hidden rounded-full"
              style={{
                backgroundColor:
                  "color-mix(in srgb, var(--reader-accent) 18%, transparent)",
              }}
              role="progressbar"
              aria-valuenow={pct}
              aria-valuemin={0}
              aria-valuemax={100}
            >
              <div
                className="h-full rounded-full transition-all duration-300"
                style={{
                  width: progress && progress.booksTotal > 0 ? `${pct}%` : "30%",
                  backgroundColor: "var(--reader-accent)",
                }}
              />
            </div>
            {progress ? (
              <p className="mt-1 font-sans text-[11px] text-[var(--reader-muted)]">
                {progress.booksDone}/{progress.booksTotal} books ·{" "}
                {progress.chaptersDone} chapters · {formatSize(progress.bytes)}
              </p>
            ) : null}
          </div>
        ) : null}

        {/* Sync now — surfaced when an update is waiting (e.g. on cellular /
            an undetectable connection under the Wi-Fi-only default). */}
        {keep.keepOffline && keep.syncPending && !downloading ? (
          <button
            type="button"
            onClick={doSyncNow}
            className="chrome-metal chrome-metal-emerald mt-2"
            style={{ padding: "0.25rem 0.6rem", fontSize: "0.72rem" }}
          >
            Sync now
          </button>
        ) : null}

        {/* Allow-cellular sub-setting (only meaningful while keeping offline). */}
        {keep.keepOffline ? (
          <div className="mt-3 flex items-start justify-between gap-3 border-t border-[var(--reader-rule)] pt-2.5">
            <div className="min-w-0">
              <span className="font-sans text-[12px] font-medium text-[var(--reader-text)]">
                Allow updates over cellular
              </span>
              <p className="mt-0.5 font-sans text-[11px] leading-relaxed text-[var(--reader-muted)]">
                {keep.allowCellular
                  ? "Automatic updates may use mobile data."
                  : keep.connection === "unknown"
                    ? "Off — to protect mobile data, automatic updates only run when Wi-Fi is detected. This device can’t report its connection type, so updates wait for a manual “Sync now” unless you allow cellular."
                    : "Off — automatic updates only run on Wi-Fi."}
              </p>
            </div>
            <button
              type="button"
              role="switch"
              aria-checked={keep.allowCellular}
              aria-label="Allow updates over cellular"
              onClick={toggleCellular}
              className="relative mt-0.5 inline-flex h-5 w-9 shrink-0 items-center rounded-full transition-colors"
              style={{
                backgroundColor: keep.allowCellular
                  ? "var(--reader-accent)"
                  : "color-mix(in srgb, var(--reader-muted) 35%, transparent)",
              }}
            >
              <span
                className="inline-block h-4 w-4 rounded-full bg-white shadow transition-transform"
                style={{
                  transform: keep.allowCellular
                    ? "translateX(1.125rem)"
                    : "translateX(0.125rem)",
                }}
              />
            </button>
          </div>
        ) : null}

        {/* Reclaim space — explicit, never automatic on toggle-off. */}
        {keep.hasDownload && stats && stats.bytes > 0 ? (
          <button
            type="button"
            onClick={() => void clearEverything()}
            className="mt-2.5 font-sans text-[11px] text-[var(--reader-muted)] underline decoration-dotted underline-offset-2 hover:text-[var(--reader-text)]"
          >
            Remove downloaded data ({formatSize(stats.bytes)})
          </button>
        ) : null}
      </div>

      {/* Storage tally (informational). */}
      <div className="mt-3 flex items-center gap-2 rounded border border-[var(--reader-rule)] bg-[color-mix(in_srgb,var(--reader-accent)_5%,transparent)] px-3 py-2.5">
        <span
          className="chrome-metal chrome-metal-bronze"
          style={{ padding: "0.2rem 0.5rem", fontSize: "0.75rem" }}
          aria-hidden="true"
        >
          ⤓ Stored
        </span>
        <span className="font-sans text-sm text-[var(--reader-text)]">
          {stats ? formatSize(stats.bytes) : "…"} on this device
          {stats && stats.records > 0 ? (
            <span className="text-[var(--reader-muted)]">
              {" "}
              · {stats.records.toLocaleString()} items
            </span>
          ) : null}
        </span>
      </div>

      <p className="mt-3 font-sans text-[11px] italic leading-relaxed text-[var(--reader-muted)]">
        The download continues in the background and resumes automatically — no
        need to keep this screen open. Offline downloads speed up reading
        content; they don't affect The Appointed Times calendar.
      </p>
    </section>
  );
}
