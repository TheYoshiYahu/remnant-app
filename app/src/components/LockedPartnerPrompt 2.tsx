/**
 * LockedPartnerPrompt — the one reusable "visible-but-locked → become a partner"
 * affordance (show-all-gate-access / compliance tier build).
 *
 * Used by:
 *   - the book picker, when the full library is shown with paid books locked
 *   - locked extra-canonical cross-reference click-throughs in the Gospels
 *
 * COMPLIANCE (consumption-only): this component contains NO in-app checkout or
 * pricing link and NO tappable route toward purchase — informational text only.
 * It names what a partnership opens and points to the web account in plain,
 * non-clickable words (same posture as NATIVE_MANAGE_LINE). Partnership is
 * chosen and paid for on the web, outside the app.
 *
 * `tone="inline"` is a compact one-liner (for inside a sheet / under a row);
 * `tone="card"` (default) is a bordered block (for under the book picker).
 */

interface Props {
  /** Optional headline override. */
  title?: string;
  /** Optional body override. */
  message?: string;
  tone?: "card" | "inline";
}

const DEFAULT_TITLE = "Part of the partner library";
const DEFAULT_MESSAGE =
  "This is part of the partner library — the restored library beyond the canon " +
  "(Apocrypha, 1 Enoch, Jubilees, Jasher, the Apostolic Fathers, Josephus, and " +
  "more) plus the deeper study tools. The 66-book canon stays free for everyone. " +
  "Partnership is managed from your account on the web at remnantofpromise.org.";

export default function LockedPartnerPrompt({
  title = DEFAULT_TITLE,
  message = DEFAULT_MESSAGE,
  tone = "card",
}: Props) {
  if (tone === "inline") {
    return (
      <p className="text-xs italic leading-relaxed text-[var(--reader-muted)]">
        🔒 {message}
      </p>
    );
  }
  return (
    <div className="mt-3 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3">
      <p className="text-sm font-semibold text-[var(--reader-text)]">
        🔒 {title}
      </p>
      <p className="mt-1 text-sm leading-relaxed text-[var(--reader-muted)]">
        {message}
      </p>
    </div>
  );
}
