/**
 * ToolSheet — shared modal chrome for the S197 public-domain tool surfaces
 * (Vincent's, Nave's, TSK, Maps, Nikkudot).
 *
 * Same bottom-sheet-on-mobile / centered-on-desktop shell as LexiconSheet
 * (z-60, tap-outside + Escape to close, max-w-6xl, max-h-85vh). Each tool sheet
 * wraps its body in <ToolSheet> and renders its own fetched content + the
 * ToolAnnotationBand framework overlay. The shared TierLockedCard / EmptyStateCard
 * keep the tier-lock + coverage-fallback register identical across every tool.
 */

import { useEffect, type ReactNode } from "react";
import { isNativeShell, NATIVE_MANAGE_LINE } from "../lib/native-shell";

interface ToolSheetProps {
  /** Breadcrumb / eyebrow shown top-left, e.g. "Vincent's Word Studies · John 1:1". */
  title: string;
  onClose: () => void;
  children: ReactNode;
}

export default function ToolSheet({ title, onClose, children }: ToolSheetProps) {
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  return (
    <div
      className="fixed inset-0 z-[60] flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={onClose}
      role="dialog"
      aria-label={title}
    >
      <div
        className="w-full max-w-6xl max-h-[85vh] overflow-hidden rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between border-b border-[var(--reader-rule)] px-4 py-3">
          <div className="text-xs uppercase tracking-wide text-[var(--reader-accent)]">
            {title}
          </div>
          <button
            type="button"
            onClick={onClose}
            aria-label="Close"
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-sm font-medium text-[var(--reader-muted)] hover:text-[var(--reader-text)]"
          >
            ✕
          </button>
        </div>
        <div className="max-h-[calc(85vh-3.5rem)] overflow-y-auto px-4 py-4">
          {children}
        </div>
      </div>
    </div>
  );
}

export function ToolTierLockedCard({ tierRequired }: { tierRequired: string }) {
  const tierLabel =
    tierRequired === "complete_study"
      ? "Companion"
      : tierRequired === "everything"
        ? "Everything"
        : tierRequired;
  return (
    <div className="rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface-elev)] p-4">
      <p className="text-sm font-semibold text-[var(--reader-text)]">Tier-locked</p>
      <p className="mt-2 text-sm text-[var(--reader-muted)]">
        The study tools are part of the{" "}
        <span className="text-[var(--reader-text)]">{tierLabel}</span> tier. The
        free Scripture and Strong's lookup you came from stay free.
      </p>
      {isNativeShell() ? (
        // Native: keep the tier-locked state visible but replace the
        // clickable /pricing CTA with the plain-text, non-clickable
        // account-management line.
        <p className="mt-3 text-sm font-medium text-[var(--reader-text)]">
          {NATIVE_MANAGE_LINE}
        </p>
      ) : (
        <a
          href="/pricing"
          className="mt-3 inline-block rounded border border-[var(--reader-accent)] px-3 py-1.5 text-sm font-medium text-[var(--reader-accent)] hover:opacity-90"
        >
          Unlock with {tierLabel}
        </a>
      )}
    </div>
  );
}

export function ToolLoading({ label }: { label: string }) {
  return <p className="text-sm text-[var(--reader-muted)]">{label}</p>;
}

export function ToolError({ message }: { message: string }) {
  return <p className="text-sm text-red-400">Could not load: {message}</p>;
}

export function ToolEmpty({ message }: { message: string }) {
  return <p className="text-sm italic text-[var(--reader-muted)]">{message}</p>;
}

/**
 * A standing "this is an inherited foil" disclaimer, used by Nave's / TSK / Maps
 * so the reader meets the tool as a labeled foil — what the tradition says,
 * with the framework reading beside it — never as the page's own voice.
 */
export function ToolFoilNote({ children }: { children: ReactNode }) {
  return (
    <p className="mb-3 text-xs italic leading-relaxed text-[var(--reader-muted)]">
      {children}
    </p>
  );
}
