import { useEffect, useState } from "react";
import {
  type CancelResponse,
  type SubscriptionMe,
  cancelSubscription,
  getSubscriptionMe,
} from "../lib/api";
import { isNativeShell, NATIVE_MANAGE_LINE } from "../lib/native-shell";

/**
 * Session 39 — Manage account surface (renamed at S174 per Yoshi
 * voice-call; prior name "Manage partnership"). Same route /manage,
 * same partnership-state surface for partners with a subscription,
 * same anonymous-redirect and no-subscription branches; the chrome
 * entry and page title carry the broader "account" framing so the
 * door reads consistently for partners and non-partner signed-in
 * users alike.
 *
 * Renders the current subscription state (tier, cadence, founder/promo
 * status, locked price, period-end date, cancel-at-period-end flag) and
 * a Cancel button. Confirmation copy runs through the voice gate:
 *
 *   - no "are you sure"
 *   - no "we'll miss you"
 *   - no "consider what you'll be giving up"
 *   - no spiritual-consequences framing
 *
 * The honest message the framework reading hands to the partner:
 *
 *   "Your access continues through the end of your current period.
 *    You can resubscribe anytime — your forever-locked price stays with
 *    you."
 *
 * Cancellation is the partner's free choice. The assembly does not
 * gate-keep, does not require a reason, does not implore them to stay.
 *
 * Resubscribe / upgrade flows land in a later wheel (Q42 in Section IX —
 * Stripe Customer Portal vs in-app reactivation). For Session 39 the
 * Manage page surfaces the locked price + period-end date so a partner
 * who changes their mind can see clearly that the same price stays with
 * them.
 */

type ViewState =
  | { kind: "loading" }
  | { kind: "anonymous" }
  | { kind: "no_subscription" }
  | { kind: "active"; sub: SubscriptionMe }
  | { kind: "load_error"; message: string };

// Display names per S140 tier-name overhaul. Backend slugs unchanged.
const TIER_LABELS: Record<string, string> = {
  free: "Free",
  study_notes: "Study Notes",
  extras: "Library",
  complete_study: "Companion",
  everything: "Scribe",
};

const STATUS_LABELS: Record<string, string> = {
  trialing: "in trial",
  active: "active",
  past_due: "past due",
  canceled: "ended",
  unpaid: "unpaid",
  incomplete: "incomplete",
  incomplete_expired: "expired",
};

function formatDollars(cents: number | null | undefined): string | null {
  if (cents === null || cents === undefined) return null;
  if (cents === 0) return "$0";
  const dollars = (cents / 100).toFixed(2).replace(/\.00$/, "");
  return `$${dollars}`;
}

function formatDate(iso: string | null | undefined): string | null {
  if (!iso) return null;
  try {
    const d = new Date(iso);
    if (Number.isNaN(d.getTime())) return null;
    return d.toLocaleDateString(undefined, {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  } catch {
    return null;
  }
}

export default function Manage() {
  const [view, setView] = useState<ViewState>({ kind: "loading" });
  const [showConfirm, setShowConfirm] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [cancelError, setCancelError] = useState<string | null>(null);
  const [justCancelled, setJustCancelled] = useState<CancelResponse | null>(
    null
  );

  useEffect(() => {
    getSubscriptionMe()
      .then((me) => {
        if (me.status === "none") {
          setView({ kind: "no_subscription" });
        } else {
          setView({ kind: "active", sub: me });
        }
      })
      .catch((err) => {
        const message = String(err);
        // 401 = no JWT cookie present. Treat as anonymous so we can route
        // the partner to sign-in rather than dumping the raw error.
        if (message.includes("401")) {
          setView({ kind: "anonymous" });
        } else {
          setView({ kind: "load_error", message });
        }
      });
  }, []);

  async function handleCancelConfirmed() {
    setSubmitting(true);
    setCancelError(null);
    try {
      const resp = await cancelSubscription();
      setJustCancelled(resp);
      setShowConfirm(false);
    } catch (err) {
      setCancelError(String(err));
    } finally {
      setSubmitting(false);
    }
  }

  // ---- Render: anonymous (no JWT cookie) ---------------------------------
  if (view.kind === "anonymous") {
    return (
      <PageShell title="Manage account">
        <p className="text-base text-[var(--reader-muted)]">
          Sign in at{" "}
          <a
            href="https://remnantofpromise.org/login?redirect=/manage"
            className="underline"
          >
            remnantofpromise.org
          </a>{" "}
          to manage your partnership.
        </p>
      </PageShell>
    );
  }

  // ---- Render: loading ---------------------------------------------------
  if (view.kind === "loading") {
    return (
      <PageShell title="Manage account">
        <p className="text-sm text-[var(--reader-muted)]">Loading…</p>
      </PageShell>
    );
  }

  // ---- Render: load error ------------------------------------------------
  if (view.kind === "load_error") {
    return (
      <PageShell title="Manage account">
        <div className="rounded border border-red-300 bg-red-50 p-3 text-sm text-red-800">
          Could not load your partnership: {view.message}
        </div>
      </PageShell>
    );
  }

  // ---- Render: signed in but no subscription -----------------------------
  if (view.kind === "no_subscription") {
    return (
      <PageShell title="Manage account">
        <p className="mb-4 text-base text-[var(--reader-muted)]">
          You don't have an active partnership on this account.
        </p>
        {isNativeShell() ? (
          // Native: no in-app purchase path — plain text, non-clickable.
          <p className="text-base text-[var(--reader-text)]">
            {NATIVE_MANAGE_LINE}
          </p>
        ) : (
          <a
            href="/pricing"
            className="inline-block rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
          >
            Become a partner
          </a>
        )}
      </PageShell>
    );
  }

  // ---- Render: just cancelled (post-action confirmation) -----------------
  if (justCancelled) {
    const periodEndLabel = formatDate(justCancelled.current_period_end);
    const tierLabel = justCancelled.tier
      ? TIER_LABELS[justCancelled.tier] ?? justCancelled.tier
      : null;
    const priceLabel = formatDollars(justCancelled.locked_price_cents);

    return (
      <PageShell title="Manage account">
        <div className="mb-6 rounded border border-emerald-300 bg-emerald-50 px-4 py-3 text-base text-emerald-900">
          <div className="font-medium">Cancellation set.</div>
          {periodEndLabel ? (
            <p className="mt-1">
              Your access continues through{" "}
              <span className="font-medium">{periodEndLabel}</span>.
            </p>
          ) : (
            <p className="mt-1">
              Your access continues through the end of your current period.
            </p>
          )}
          <p className="mt-2">
            You can resubscribe anytime
            {priceLabel && tierLabel
              ? `. Your ${tierLabel} price (${priceLabel}) is locked to you and stays the same if you come back.`
              : ". Your forever-locked price stays with you if you come back."}
          </p>
        </div>
        <a
          href="/"
          className="inline-block rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
        >
          ← back to the reader
        </a>
      </PageShell>
    );
  }

  // ---- Render: active partnership (the main surface) ---------------------
  const sub = view.sub;
  const tierLabel = sub.tier ? TIER_LABELS[sub.tier] ?? sub.tier : "—";
  const statusLabel = STATUS_LABELS[sub.status] ?? sub.status;
  const cadenceLabel =
    sub.cadence === "monthly"
      ? "monthly"
      : sub.cadence === "annual"
      ? "annual"
      : null;
  const priceLabel = formatDollars(sub.locked_price_cents);
  const periodEndLabel = formatDate(sub.current_period_end);
  const isAlreadyWindingDown = sub.cancel_at_period_end === true;
  const isTerminal = sub.status === "canceled" || sub.status === "unpaid";

  return (
    <PageShell title="Manage account">
      {/* Subscription summary */}
      <div className="mb-6 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5">
        <div className="flex items-baseline justify-between">
          <h2 className="text-lg font-semibold text-[var(--reader-text)]">
            {tierLabel}
          </h2>
          <span className="text-xs text-[var(--reader-muted)]">
            {statusLabel}
          </span>
        </div>

        <dl className="mt-3 space-y-1.5 text-base">
          {cadenceLabel && (
            <Row label="Billing" value={`${cadenceLabel}`} />
          )}
          {priceLabel && (
            <Row
              label="Locked price"
              value={
                cadenceLabel === "monthly"
                  ? `${priceLabel} / month`
                  : cadenceLabel === "annual"
                  ? `${priceLabel} / year`
                  : priceLabel
              }
            />
          )}
          {sub.is_founder_pricing && (
            <Row
              label="Founder partner"
              value="yes — forever-locked at this price"
            />
          )}
          {sub.is_promo_subscriber && (
            <Row label="Partner code" value="redeemed" />
          )}
          {periodEndLabel && (
            <Row
              label={
                isAlreadyWindingDown ? "Access continues through" : "Renews on"
              }
              value={periodEndLabel}
            />
          )}
        </dl>
      </div>

      {/* Cancel surface — only when the partner has something to cancel */}
      {!isTerminal && !isAlreadyWindingDown && (
        <div className="mb-4">
          {!showConfirm ? (
            <button
              type="button"
              onClick={() => {
                setShowConfirm(true);
                setCancelError(null);
              }}
              className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:opacity-90"
            >
              Cancel partnership
            </button>
          ) : (
            <div className="rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5">
              <p className="text-base text-[var(--reader-text)]">
                Your access continues through
                {periodEndLabel ? (
                  <>
                    {" "}
                    <span className="font-medium">{periodEndLabel}</span>.
                  </>
                ) : (
                  " the end of your current period."
                )}
              </p>
              <p className="mt-2 text-base text-[var(--reader-text)]">
                You can resubscribe anytime
                {priceLabel
                  ? `. Your ${priceLabel}${
                      cadenceLabel === "monthly"
                        ? " / month"
                        : cadenceLabel === "annual"
                        ? " / year"
                        : ""
                    } price is locked to you and stays the same if you come back.`
                  : ". Your forever-locked price stays with you if you come back."}
              </p>
              {cancelError && (
                <div className="mt-3 rounded border border-red-300 bg-red-50 p-2 text-xs text-red-800">
                  {cancelError}
                </div>
              )}
              <div className="mt-4 flex gap-2">
                <button
                  type="button"
                  disabled={submitting}
                  onClick={handleCancelConfirmed}
                  className="rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90 disabled:opacity-60"
                >
                  {submitting ? "Working…" : "Confirm cancellation"}
                </button>
                <button
                  type="button"
                  disabled={submitting}
                  onClick={() => {
                    setShowConfirm(false);
                    setCancelError(null);
                  }}
                  className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-2 text-sm font-medium text-[var(--reader-text)] hover:opacity-90 disabled:opacity-60"
                >
                  Keep partnership
                </button>
              </div>
            </div>
          )}
        </div>
      )}

      {/* Already-winding-down banner */}
      {isAlreadyWindingDown && !isTerminal && (
        <div className="mb-4 rounded border border-amber-300 bg-amber-50 px-4 py-3 text-base text-amber-900">
          <div className="font-medium">Cancellation already set.</div>
          {periodEndLabel ? (
            <p className="mt-1">
              Your access continues through{" "}
              <span className="font-medium">{periodEndLabel}</span>.
            </p>
          ) : (
            <p className="mt-1">
              Your access continues through the end of your current period.
            </p>
          )}
          <p className="mt-2">
            You can resubscribe anytime
            {priceLabel
              ? `. Your ${priceLabel} price stays locked to you.`
              : ". Your forever-locked price stays with you."}
          </p>
          {isNativeShell() ? (
            // Native: no in-app reactivation purchase path — plain text.
            <p className="mt-3 text-base text-amber-900">{NATIVE_MANAGE_LINE}</p>
          ) : (
            <div className="mt-3">
              <a
                href="/pricing"
                className="inline-block rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
              >
                Reactivate
              </a>
            </div>
          )}
        </div>
      )}

      {/* Terminal-state banner */}
      {isTerminal && (
        <div className="mb-4 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 text-base text-[var(--reader-muted)]">
          {isNativeShell() ? (
            // Native: no in-app resubscribe purchase path — plain text.
            <>
              This partnership has ended.
              <p className="mt-3 text-base text-[var(--reader-text)]">
                {NATIVE_MANAGE_LINE}
              </p>
            </>
          ) : (
            <>
              This partnership has ended. You can become a partner again from
              the{" "}
              <a href="/pricing" className="underline">
                partnership page
              </a>
              .
              <div className="mt-3">
                <a
                  href="/pricing"
                  className="inline-block rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-3 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
                >
                  Resubscribe
                </a>
              </div>
            </>
          )}
        </div>
      )}

      <a
        href="/"
        className="inline-block text-sm text-[var(--reader-muted)] hover:underline"
      >
        ← back to the reader
      </a>
    </PageShell>
  );
}

function PageShell({
  title,
  children,
}: {
  title: string;
  children: React.ReactNode;
}) {
  return (
    <div className="mx-auto max-w-2xl px-6 py-8">
      <header className="mb-6 border-b border-[var(--reader-rule)] pb-4">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          {title}
        </h1>
        <nav className="mt-2 text-sm">
          <a href="/" className="text-[var(--reader-muted)] hover:underline">
            ← back to the reader
          </a>
        </nav>
      </header>
      {children}
    </div>
  );
}

function Row({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex items-baseline justify-between gap-4">
      <dt className="text-[var(--reader-muted)]">{label}</dt>
      <dd className="text-[var(--reader-text)]">{value}</dd>
    </div>
  );
}
