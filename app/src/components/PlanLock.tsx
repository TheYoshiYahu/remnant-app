/**
 * PlanLock — the S442 lock surface for the Year Plan study pages (/plan,
 * /my-teachings, /teach). Wraps the reusable LockedPartnerPrompt.
 *
 * COMPLIANCE (consumption-only): on the native shell NO pricing or checkout
 * link — informational text only. On the web, the S441 rule: one "Unlock in
 * [Name] tier" route to /pricing naming the tier that opens the feature.
 * A sign-in doorway is offered to signed-out readers on both (sign-in is not
 * a purchase).
 */

import LockedPartnerPrompt from "./LockedPartnerPrompt";
import { isNativeShell } from "../lib/native-shell";

export default function PlanLock({
  title,
  message,
  tierName,
  signedIn,
}: {
  title: string;
  message: string;
  /** "Study Notes" (cheapest paid tier) or "Everything". */
  tierName: string;
  signedIn: boolean;
}) {
  const native = isNativeShell();
  return (
    <div className="mt-4">
      <LockedPartnerPrompt title={title} message={message} />
      <div className="mt-3 flex flex-wrap items-center gap-2">
        {!native && (
          <a href="/pricing" className="chrome-metal chrome-metal-gold">
            Unlock in {tierName} tier
          </a>
        )}
        {!signedIn && (
          <a
            href={
              "/sign-in?return_to=" +
              encodeURIComponent(
                typeof window !== "undefined" ? window.location.href : "/plan",
              )
            }
            className="chrome-metal chrome-metal-emerald"
          >
            Already a partner? Sign in
          </a>
        )}
      </div>
    </div>
  );
}

/** Shared page shell for the plan pages. */
export function PlanShell({
  back = { href: "/read", label: "← Back to reading" },
  children,
}: {
  back?: { href: string; label: string };
  children: React.ReactNode;
}) {
  return (
    <div className="min-h-screen bg-[var(--reader-bg)] px-4 py-8 text-[var(--reader-text)]">
      <div className="mx-auto max-w-2xl">
        <a href={back.href} className="text-sm text-[var(--reader-accent)] hover:underline">
          {back.label}
        </a>
        {children}
      </div>
    </div>
  );
}

export const GHOST_BTN =
  "rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-3 py-1.5 text-sm font-medium text-[var(--reader-text)] hover:opacity-90 disabled:opacity-40";

export const SMALL_BTN =
  "rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-xs font-medium text-[var(--reader-text)] hover:opacity-90 disabled:opacity-40";

export const INPUT =
  "rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] px-2 py-1 text-sm text-[var(--reader-text)]";

export const CARD =
  "rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 font-sans";
