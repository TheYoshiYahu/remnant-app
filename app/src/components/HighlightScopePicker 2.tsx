/**
 * HighlightScopePicker — Session 424.
 *
 * The click-time menu shown the moment a partner initiates a highlight
 * from the verse action menu. Yoshi's chosen UX: offer four scopes up
 * front rather than defaulting straight to whole-verse.
 *
 *   - Word        — tap one word to mark it (sub-verse).
 *   - Phrase      — tap the first then the last word to mark a run.
 *   - Whole verse — the existing S113→S117 whole-verse mark.
 *   - Start a range — the existing S123 multi-verse range mechanic.
 *
 * "Whole verse" and "Start a range" route to the existing, unchanged
 * paths; "Word" and "Phrase" enter the S424 sub-verse selection flow.
 *
 * Pure presentational — all four callbacks are wired in App.tsx. Modal
 * shell mirrors HighlightPicker / VerseActionMenu so partners read one
 * modal shape across the reader.
 */

import { useEffect } from "react";

interface HighlightScopePickerProps {
  onWord: () => void;
  onPhrase: () => void;
  onWholeVerse: () => void;
  onStartRange: () => void;
  onClose: () => void;
}

interface ScopeChoice {
  key: "word" | "phrase" | "whole" | "range";
  label: string;
  hint: string;
  icon: string;
  run: (p: HighlightScopePickerProps) => void;
}

const CHOICES: ScopeChoice[] = [
  {
    key: "word",
    label: "Word",
    hint: "Tap one word",
    icon: "✦",
    run: (p) => p.onWord(),
  },
  {
    key: "phrase",
    label: "Phrase",
    hint: "Tap the first then the last word",
    icon: "❯❮",
    run: (p) => p.onPhrase(),
  },
  {
    key: "whole",
    label: "Whole verse",
    hint: "Mark the entire verse",
    icon: "▬",
    run: (p) => p.onWholeVerse(),
  },
  {
    key: "range",
    label: "Start a range",
    hint: "Mark across several verses",
    icon: "↔",
    run: (p) => p.onStartRange(),
  },
];

export default function HighlightScopePicker(props: HighlightScopePickerProps) {
  const { onClose } = props;

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  return (
    <div
      className="fixed inset-0 z-40 flex items-end justify-center bg-black/40 p-4 sm:items-center"
      onClick={onClose}
    >
      <div
        className="w-full max-w-md rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 shadow-xl"
        onClick={(e) => e.stopPropagation()}
        role="menu"
        aria-label="Choose what to highlight"
      >
        <div className="mb-3">
          <h3 className="text-sm font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            Highlight
          </h3>
        </div>
        <ul className="space-y-1.5">
          {CHOICES.map((c) => (
            <li key={c.key} role="none">
              <button
                type="button"
                role="menuitem"
                onClick={() => {
                  c.run(props);
                  onClose();
                }}
                className="flex w-full items-center justify-between gap-3 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-2.5 text-left hover:bg-[var(--reader-bg)]"
                style={{ minHeight: "2.75rem" }}
              >
                <span className="flex items-center gap-2">
                  <span
                    aria-hidden="true"
                    className="w-6 text-center text-[var(--reader-accent)]"
                  >
                    {c.icon}
                  </span>
                  <span className="text-base font-medium text-[var(--reader-text)]">
                    {c.label}
                  </span>
                </span>
                <span className="font-sans text-xs text-[var(--reader-muted)]">
                  {c.hint}
                </span>
              </button>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}
