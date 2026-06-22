/**
 * Global offline-download indicator.
 *
 * The visible half of the Fix-1 background download: a small, fixed pill —
 * mounted once at the app root, OUTSIDE any route — that shows live
 * download progress (and a brief "saved offline" confirmation) no matter
 * what screen the partner is on. Before this, progress was only visible on
 * the Downloads settings screen, so a partner who started a download and
 * navigated away to read had no idea whether it was still going. It now
 * keeps running in the background (lib/downloadManager.ts) AND is always
 * visible here.
 *
 * Tapping the pill jumps to Settings → Downloads (same target as the
 * first-run prompt). It sits bottom-right with a safe-area inset so it
 * clears the bottom-center first-run banner.
 */

import { useEffect, useRef, useState } from "react";
import { DOWNLOAD_AREAS, type DownloadAreaId } from "../lib/offlineDownload";
import {
  subscribeDownloadManager,
  type DownloadManagerSnapshot,
} from "../lib/downloadManager";

const AREA_LABEL: Record<DownloadAreaId, string> = {
  library: "Your library",
};

function labelFor(id: DownloadAreaId): string {
  return (
    AREA_LABEL[id] ?? DOWNLOAD_AREAS.find((a) => a.id === id)?.label ?? "Library"
  );
}

export default function DownloadStatusIndicator() {
  const [snap, setSnap] = useState<DownloadManagerSnapshot | null>(null);
  // Transient "✓ saved offline" confirmation after a run completes.
  const [completedLabel, setCompletedLabel] = useState<string | null>(null);
  const prevActive = useRef<DownloadAreaId | null>(null);
  const completeTimer = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    const unsub = subscribeDownloadManager(setSnap);
    return () => {
      unsub();
      if (completeTimer.current) clearTimeout(completeTimer.current);
    };
  }, []);

  // Detect "active area just finished" → flash a confirmation for a few
  // seconds. We compare the active area across snapshots: when it clears
  // and that area's last progress is "done", it completed.
  useEffect(() => {
    if (!snap) return;
    const wasActive = prevActive.current;
    const nowActive = snap.activeAreaId;
    if (wasActive && wasActive !== nowActive) {
      const finished = snap.progress[wasActive];
      if (finished?.state === "done") {
        setCompletedLabel(labelFor(wasActive));
        if (completeTimer.current) clearTimeout(completeTimer.current);
        completeTimer.current = setTimeout(() => setCompletedLabel(null), 6000);
      }
    }
    prevActive.current = nowActive;
  }, [snap]);

  if (!snap) return null;

  const activeId = snap.activeAreaId;
  const active = activeId ? snap.progress[activeId] : null;
  const queuedCount = snap.queued.length;

  // Nothing running and no confirmation to show → render nothing.
  if (!active && !completedLabel) return null;

  const goToDownloads = () => {
    window.location.href = "/settings#downloads";
  };

  // ----- Completion confirmation (no active run) -----
  if (!active && completedLabel) {
    return (
      <Shell onClick={goToDownloads} ariaLabel={`${completedLabel} saved offline`}>
        <span
          className="chrome-metal chrome-metal-emerald shrink-0"
          style={{ padding: "0.15rem 0.4rem", fontSize: "0.7rem" }}
          aria-hidden="true"
        >
          ✓
        </span>
        <span className="font-sans text-xs font-medium text-[var(--reader-text)]">
          Saved offline
        </span>
      </Shell>
    );
  }

  if (!active) return null;

  // Percent is by BOOKS, not chapters: booksTotal is known up front (so the
  // bar is monotonic and accurate), whereas chaptersTotal is only the running
  // sum of chapters in books walked so far and would race ahead misleadingly.
  const hasTotals = active.booksTotal > 0;
  const pct = hasTotals
    ? Math.min(100, Math.round((active.booksDone / active.booksTotal) * 100))
    : 0;
  const detail = hasTotals ? `${pct}%` : "Preparing…";

  return (
    <Shell
      onClick={goToDownloads}
      ariaLabel={`Downloading ${labelFor(activeId!)} — ${detail}`}
    >
      <span
        className="chrome-metal chrome-metal-emerald shrink-0 animate-pulse"
        style={{ padding: "0.15rem 0.4rem", fontSize: "0.7rem" }}
        aria-hidden="true"
      >
        ⤓
      </span>
      <div className="min-w-0">
        <p className="truncate font-sans text-xs font-medium text-[var(--reader-text)]">
          Saving offline · {detail}
        </p>
        <div
          className="mt-1 h-1 w-full overflow-hidden rounded-full"
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
              width: hasTotals ? `${pct}%` : "30%",
              backgroundColor: "var(--reader-accent)",
            }}
          />
        </div>
        <p className="mt-0.5 truncate font-sans text-[10px] text-[var(--reader-muted)]">
          {labelFor(activeId!)}
          {queuedCount > 0 ? ` · +${queuedCount} queued` : ""}
        </p>
      </div>
    </Shell>
  );
}

function Shell({
  children,
  onClick,
  ariaLabel,
}: {
  children: React.ReactNode;
  onClick: () => void;
  ariaLabel: string;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-label={ariaLabel}
      className="fixed bottom-0 right-0 z-40 m-3 flex max-w-[16rem] items-center gap-2 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2 text-left shadow-lg hover:border-[var(--reader-accent)]"
      style={{
        marginBottom: "max(0.75rem, env(safe-area-inset-bottom))",
      }}
    >
      {children}
    </button>
  );
}
