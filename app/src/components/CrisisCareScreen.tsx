/**
 * CrisisCareScreen — gentle, dismissible care surface shown when the on-device
 * watchlist (lib/crisis-safety.ts) matches a journal entry.
 *
 * Leads with the 988 Suicide & Crisis Lifeline (immediate, 24/7), then offers
 * the ministry as a secondary relational option. Includes the transparency
 * disclosure: the check happened on the device and nothing was sent or stored.
 * Non-blocking — the entry is already saved; "Close" returns to the journal.
 *
 * Tone: warm, non-judgmental, no assessment questions. Resources are offered,
 * not imposed.
 */

import { CRISIS_RESOURCES } from "../lib/crisis-safety";

export default function CrisisCareScreen({ onClose }: { onClose: () => void }) {
  const { lifeline988, ministry } = CRISIS_RESOURCES;
  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-labelledby="careTitle"
      className="fixed inset-0 z-[80] flex items-end justify-center bg-black/60 p-0 sm:items-center sm:p-4"
    >
      <div className="w-full max-w-md rounded-t-2xl border border-[var(--reader-rule)] bg-[var(--reader-bg)] p-6 shadow-xl sm:rounded-2xl">
        <h2
          id="careTitle"
          className="text-xl font-semibold tracking-tight text-[var(--reader-text)]"
        >
          You're not alone
        </h2>
        <p className="mt-2 text-base leading-relaxed text-[var(--reader-text)]">
          What you wrote sounds heavy, and it matters. If you're hurting or
          thinking about harming yourself, please reach out — help is available
          right now.
        </p>

        {/* 988 first */}
        <div className="mt-4 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3">
          <p className="text-base font-semibold text-[var(--reader-text)]">
            {lifeline988.name}
          </p>
          <p className="mt-1 text-sm text-[var(--reader-muted)]">
            {lifeline988.blurb}
          </p>
          <div className="mt-3 flex gap-3">
            <a
              href={lifeline988.call}
              className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
            >
              Call 988
            </a>
            <a
              href={lifeline988.text}
              className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-transparent px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
            >
              Text 988
            </a>
          </div>
        </div>

        {/* Ministry, secondary */}
        <div className="mt-3 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3">
          <p className="text-base font-semibold text-[var(--reader-text)]">
            {ministry.name}
          </p>
          <p className="mt-1 text-sm text-[var(--reader-muted)]">
            {ministry.blurb}
          </p>
          <div className="mt-3 flex gap-3">
            <a
              href={ministry.email}
              className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-transparent px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
            >
              Email the ministry
            </a>
          </div>
        </div>

        {/* Transparency disclosure */}
        <p className="mt-4 text-xs leading-relaxed text-[var(--reader-muted)]">
          How this works: the app checked the words you wrote <em>on your
          device</em> to offer this. Your journal stays private — nothing about
          it was sent anywhere or recorded, and no flag was saved.
        </p>

        <button
          type="button"
          onClick={onClose}
          className="mt-5 w-full rounded border border-[var(--reader-rule)] px-4 py-2 text-sm font-medium text-[var(--reader-muted)] hover:opacity-90"
        >
          Close
        </button>
      </div>
    </div>
  );
}
