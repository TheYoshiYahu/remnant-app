/**
 * First-run "download for offline" onboarding prompt (Phase 2, Yoshi's idea).
 *
 * A one-time, dismissible banner inviting the partner to pre-load the library
 * for faster, offline reading. It links to Settings → Downloads and never
 * nags: once the partner dismisses it OR taps through, a localStorage flag is
 * set and it never mounts again on this device.
 *
 * Honest scope: it offers FASTER, OFFLINE CONTENT (reading / cross-references)
 * — it makes no claim about The Appointed Times calendar (CPU work, already
 * handled).
 *
 * Placement rules (all enforced here so callers can mount it unconditionally
 * on the home surfaces):
 *   - shown only on the daily/home/reader surfaces (/today, /read, /),
 *   - never while the first-launch welcome modal is up (one ask at a time),
 *   - never once the seen-flag is set.
 *
 * It's a non-blocking bottom banner, not a modal — the partner can ignore it
 * and keep reading; it simply doesn't come back.
 */

import { useState } from "react";

const SEEN_KEY = "rop_offline_prompt_seen_v1";

/** True once the prompt has been dismissed or actioned on this device. */
function hasSeenOfflinePrompt(): boolean {
  try {
    return localStorage.getItem(SEEN_KEY) === "1";
  } catch {
    return true; // storage blocked — fail closed (don't nag)
  }
}

function markSeen(): void {
  try {
    localStorage.setItem(SEEN_KEY, "1");
  } catch {
    /* ignore */
  }
}

interface Props {
  /** Current pathname (App owns routing); the prompt self-restricts to home
   *  surfaces. */
  pathname: string;
  /** True while the sacred-name welcome modal is open — suppress until it's
   *  gone so the partner only faces one ask at a time. */
  welcomeOpen: boolean;
}

export default function OfflineDownloadPrompt({ pathname, welcomeOpen }: Props) {
  const [open, setOpen] = useState<boolean>(() => {
    if (typeof window === "undefined") return false;
    if (hasSeenOfflinePrompt()) return false;
    return true;
  });

  const onHome =
    pathname === "/" ||
    pathname.startsWith("/today") ||
    pathname.startsWith("/read");

  if (!open || welcomeOpen || !onHome) return null;

  const dismiss = () => {
    markSeen();
    setOpen(false);
  };

  const goToDownloads = () => {
    markSeen();
    window.location.href = "/settings#downloads";
  };

  return (
    <div
      role="dialog"
      aria-label="Download for offline use"
      className="fixed inset-x-0 bottom-0 z-50 flex justify-center px-3 pb-3"
      style={{ paddingBottom: "max(0.75rem, env(safe-area-inset-bottom))" }}
    >
      <div className="flex w-full max-w-xl items-center gap-3 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 shadow-lg">
        <span
          className="chrome-metal chrome-metal-emerald shrink-0"
          style={{ padding: "0.3rem 0.55rem", fontSize: "0.85rem" }}
          aria-hidden="true"
        >
          ⤓
        </span>
        <div className="min-w-0 flex-1">
          <p className="font-sans text-sm font-medium text-[var(--reader-text)]">
            Read faster, even offline
          </p>
          <p className="mt-0.5 font-sans text-xs leading-relaxed text-[var(--reader-muted)]">
            Download the library to this device for instant reading with no
            connection.
          </p>
        </div>
        <div className="flex shrink-0 items-center gap-1.5">
          <button
            type="button"
            onClick={goToDownloads}
            className="chrome-metal chrome-metal-emerald"
            style={{ padding: "0.35rem 0.7rem", fontSize: "0.8rem" }}
          >
            Download →
          </button>
          <button
            type="button"
            onClick={dismiss}
            aria-label="Dismiss"
            className="rounded px-2 py-1 font-sans text-sm text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
          >
            ✕
          </button>
        </div>
      </div>
    </div>
  );
}
