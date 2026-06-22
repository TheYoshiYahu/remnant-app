/**
 * Settings → Downloads (Phase 2 of the offline / speed work).
 *
 * The partner-facing face of lib/offlineDownload.ts. Four tiered areas, each
 * with an honest size estimate and a download / pause / resume / clear
 * control, plus a storage view (how much is actually stored) and a clear-all.
 *
 * Two areas (Core Bible, Study tools & interlinear) pre-seed the read-through
 * content cache and work fully offline today. Two (Compare versions, Maps &
 * reference tools) read through paths that aren't cache-backed yet, so they're
 * shown as real, sized, tier-gated rows marked "Available soon" — never a
 * button that fills storage without making anything work offline.
 *
 * Aesthetic: the reader-surface card pattern (matching Settings) with the
 * chrome-metal emerald "go" register on the active download control and a
 * gold storage tally — no grey. Sizes and progress are stated plainly.
 *
 * Tier: this screen resolves the partner's tier itself (Settings renders
 * standalone, outside the Reader where the cache scope is normally set) and
 * activates the content-cache scope so downloads land under the right tier
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
  clearArea,
  clearManifest,
  DOWNLOAD_AREAS,
  isAreaUnlocked,
  type DownloadArea,
  type DownloadAreaId,
  type DownloadProgress,
  type DownloadState,
} from "../lib/offlineDownload";
import {
  abortDownload,
  configureDownloadManager,
  forgetAll,
  forgetArea,
  pauseDownload,
  startDownload,
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

const TIER_LABEL: Record<string, string> = {
  free: "Free",
  study_notes: "Study Notes",
  extras: "Extras",
  complete_study: "Companion",
  everything: "Everything",
};

// ----- per-area UI state ---------------------------------------------------

interface AreaUi {
  state: DownloadState;
  chaptersTotal: number;
  chaptersDone: number;
  booksTotal: number;
  booksDone: number;
  bytes: number;
  error?: string;
}

function uiFromProgress(p: DownloadProgress): AreaUi {
  return {
    state: p.state,
    chaptersTotal: p.chaptersTotal,
    chaptersDone: p.chaptersDone,
    booksTotal: p.booksTotal,
    booksDone: p.booksDone,
    bytes: p.bytes,
    error: p.error,
  };
}

export default function DownloadsSettings() {
  const [tier, setTier] = useState<PartnerTier | null>(null);
  const [tierChecked, setTierChecked] = useState(false);
  const [stats, setStats] = useState<CacheStats | null>(null);
  const [areas, setAreas] = useState<Record<string, AreaUi>>({});
  const [keep, setKeep] = useState<KeepStatus>(() => getKeepStatus());
  // True while any area is actively downloading (drives the "Updating…" status).
  const [downloading, setDownloading] = useState(false);
  // Track the active download across snapshots so we can refresh the storage
  // tally exactly when a run finishes (rather than polling).
  const prevActive = useRef<DownloadAreaId | null>(null);

  const refreshStats = useCallback(async () => {
    setStats(await getCacheStats());
  }, []);

  // Resolve the partner tier, activate the cache scope under it, hand the tier
  // to the background download manager, then measure what's already stored.
  // Downloads now run in the module-level manager (lib/downloadManager.ts), not
  // this component — so leaving this screen never stops or hides a download.
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
      // Idempotent — App.tsx also configures the manager on boot; this covers
      // the case where Settings is the first surface to resolve the tier.
      configureDownloadManager(resolved);
      initOfflineKeep(resolved);
      await refreshStats();
    })();
    return () => {
      cancelled = true;
    };
  }, [refreshStats]);

  // Subscribe to the background manager: its live progress (seeded from the
  // persisted manifest, then updated as the loop runs) drives every area row.
  useEffect(() => {
    const unsub = subscribeDownloadManager((snap) => {
      setAreas(() => {
        const next: Record<string, AreaUi> = {};
        for (const [id, p] of Object.entries(snap.progress)) {
          if (p) next[id] = uiFromProgress(p);
        }
        return next;
      });
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

  const start = useCallback(
    (id: DownloadAreaId) => {
      // "Re-download" (the area is already fully downloaded) forces a fresh
      // refetch of every layer — otherwise runDownload would skip everything
      // already cached and the tap would be a no-op. A fresh/resumed download
      // skips cached layers as before so it picks up where it left off.
      const force = areas[id]?.state === "done";
      startDownload(id, { force });
    },
    [areas],
  );

  const pause = useCallback((id: DownloadAreaId) => {
    pauseDownload(id);
  }, []);

  const toggleKeep = useCallback(() => {
    const next = !getKeepStatus().keepOffline;
    setKeepOffline(next, tier);
  }, [tier]);

  const toggleCellular = useCallback(() => {
    setAllowCellular(!getKeepStatus().allowCellular, tier);
  }, [tier]);

  const doSyncNow = useCallback(() => {
    syncNow(tier);
  }, [tier]);

  const clearOne = useCallback(
    async (id: DownloadAreaId) => {
      abortDownload(id);
      await clearArea(id);
      forgetArea(id);
      await refreshStats();
    },
    [refreshStats],
  );

  const clearEverything = useCallback(async () => {
    for (const area of DOWNLOAD_AREAS) abortDownload(area.id);
    await clearAllCache();
    clearManifest();
    forgetAll();
    await refreshStats();
  }, [refreshStats]);

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
        Save the library to this device for faster reading and full offline
        access. Content only — chapters, marks, cross-references, and study
        tools. Your highlights, notes, and bookmarks already sync separately.
      </p>

      {/* Keep available offline — the primary, persistent toggle. */}
      <div className="mt-3 rounded-md border border-[var(--reader-rule)] bg-[color-mix(in_srgb,var(--reader-accent)_6%,transparent)] px-3.5 py-3">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <span className="text-sm font-semibold text-[var(--reader-text)]">
              Keep available offline
            </span>
            <p className="mt-1 font-sans text-xs leading-relaxed text-[var(--reader-muted)]">
              Save the whole library to this device and keep it up to date
              automatically. New books and edits sync in the background over
              Wi-Fi.
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
              <span>Updating your offline copy…</span>
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

      {/* Storage tally + clear-all. */}
      <div className="mt-3 flex flex-wrap items-center justify-between gap-3 rounded border border-[var(--reader-rule)] bg-[color-mix(in_srgb,var(--reader-accent)_5%,transparent)] px-3 py-2.5">
        <div className="flex items-center gap-2">
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
        {stats && stats.bytes > 0 ? (
          <button
            type="button"
            onClick={() => void clearEverything()}
            className="rounded border border-[var(--reader-rule)] px-2.5 py-1 font-sans text-xs text-[var(--reader-muted)] hover:border-[var(--reader-accent)] hover:text-[var(--reader-text)]"
          >
            Clear all
          </button>
        ) : null}
      </div>

      {/* The four tiered areas. */}
      <ul className="mt-3 space-y-2.5">
        {DOWNLOAD_AREAS.map((area) => (
          <AreaRow
            key={area.id}
            area={area}
            tier={tier}
            tierChecked={tierChecked}
            ui={areas[area.id]}
            onStart={() => start(area.id)}
            onPause={() => pause(area.id)}
            onClear={() => void clearOne(area.id)}
          />
        ))}
      </ul>

      <p className="mt-3 font-sans text-[11px] italic leading-relaxed text-[var(--reader-muted)]">
        Sizes are estimates; downloads resume where they left off. Offline
        downloads speed up reading content — they don't affect The Appointed
        Times calendar.
      </p>
    </section>
  );
}

// ----- one area row --------------------------------------------------------

function AreaRow({
  area,
  tier,
  tierChecked,
  ui,
  onStart,
  onPause,
  onClear,
}: {
  area: DownloadArea;
  tier: PartnerTier | null;
  tierChecked: boolean;
  ui: AreaUi | undefined;
  onStart: () => void;
  onPause: () => void;
  onClear: () => void;
}) {
  const unlocked = isAreaUnlocked(area, tier);
  const comingSoon = area.kind === "soon";
  const state = ui?.state ?? "idle";
  const running = state === "running";
  const done = state === "done";
  const paused = state === "paused";
  const errored = state === "error";

  const pct =
    running && ui && ui.chaptersTotal > 0
      ? Math.min(100, Math.round((ui.chaptersDone / ui.chaptersTotal) * 100))
      : done
        ? 100
        : 0;

  const lockedLabel =
    tierChecked && !unlocked
      ? `Included with the ${TIER_LABEL[area.minTier] ?? area.minTier} tier`
      : null;

  return (
    <li className="rounded-md border border-[var(--reader-rule)] px-3 py-3">
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0">
          <div className="flex flex-wrap items-center gap-2">
            <span className="text-sm font-semibold text-[var(--reader-text)]">
              {area.label}
            </span>
            <span className="font-sans text-[11px] text-[var(--reader-muted)]">
              ~{formatSize(area.estBytes)}
            </span>
            {area.id === "core" ? (
              <span className="rounded-full border border-[var(--reader-accent)] px-1.5 py-0.5 font-sans text-[10px] font-medium text-[var(--reader-accent)]">
                Recommended
              </span>
            ) : null}
            {comingSoon ? (
              <span className="rounded-full border border-[var(--reader-accent)] px-1.5 py-0.5 font-sans text-[10px] font-medium text-[var(--reader-accent)]">
                Available soon
              </span>
            ) : null}
            {done ? (
              <span
                className="chrome-metal chrome-metal-emerald"
                style={{ padding: "0.1rem 0.4rem", fontSize: "0.65rem" }}
              >
                ✓ Downloaded
              </span>
            ) : null}
          </div>
          <p className="mt-1 font-sans text-xs leading-relaxed text-[var(--reader-muted)]">
            {area.blurb}
          </p>
        </div>

        {/* Action control. */}
        <div className="shrink-0">
          {comingSoon ? (
            <span className="font-sans text-[11px] italic text-[var(--reader-muted)]">
              Soon
            </span>
          ) : lockedLabel ? (
            <a
              href="/pricing"
              className="rounded border border-[var(--reader-rule)] px-2.5 py-1 font-sans text-xs text-[var(--reader-accent)] hover:opacity-80"
            >
              Upgrade
            </a>
          ) : running ? (
            <button
              type="button"
              onClick={onPause}
              className="rounded border border-[var(--reader-accent)] px-2.5 py-1 font-sans text-xs text-[var(--reader-text)] hover:opacity-80"
            >
              Pause
            </button>
          ) : (
            <button
              type="button"
              onClick={onStart}
              className="chrome-metal chrome-metal-emerald"
              style={{ padding: "0.3rem 0.7rem", fontSize: "0.78rem" }}
            >
              {done ? "Re-download" : paused || errored ? "Resume" : "Download"}
            </button>
          )}
        </div>
      </div>

      {/* Locked note. */}
      {lockedLabel ? (
        <p className="mt-2 font-sans text-[11px] italic text-[var(--reader-muted)]">
          {lockedLabel}.
        </p>
      ) : null}

      {/* Progress. */}
      {(running || paused || errored) && unlocked && !comingSoon ? (
        <div className="mt-2.5">
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
                width: `${running ? pct : ui && ui.chaptersTotal ? pct : 6}%`,
                backgroundColor: "var(--reader-accent)",
              }}
            />
          </div>
          <p className="mt-1 font-sans text-[11px] text-[var(--reader-muted)]">
            {errored ? (
              <span className="text-[var(--reader-accent)]">
                Download interrupted — tap Resume to continue.
              </span>
            ) : (
              <>
                {ui?.booksDone ?? 0}/{ui?.booksTotal ?? 0} books ·{" "}
                {ui?.chaptersDone ?? 0} chapters · {formatSize(ui?.bytes ?? 0)}
                {paused ? " · paused" : running ? " · downloading…" : ""}
              </>
            )}
          </p>
        </div>
      ) : null}

      {/* Clear (only when this area has stored something). */}
      {(done || paused || (ui && ui.bytes > 0)) && unlocked && !comingSoon ? (
        <button
          type="button"
          onClick={onClear}
          className="mt-2 font-sans text-[11px] text-[var(--reader-muted)] underline decoration-dotted underline-offset-2 hover:text-[var(--reader-text)]"
        >
          Remove from device
        </button>
      ) : null}
    </li>
  );
}
