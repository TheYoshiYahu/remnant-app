import { useEffect, useState } from "react";
import {
  type BillingCadence,
  type CheckoutCreateRequest,
  type PartnerTier,
  type SubscriptionMe,
  createCheckoutSession,
  getSubscriptionMe,
} from "../lib/api";

/**
 * Session 38 — Pricing surface.
 *
 * Renders the four paid tiers (Study Notes / Extras / Complete Study /
 * Everything) with a monthly+annual toggle, the founder CTA prominently
 * on the everything-annual card, and a brief permanent-price-lock note
 * (Section III's "The price you pay today is the price you pay forever"
 * commitment, framed as a kingdom-value statement, not an auditability
 * claim — see the Locked Decisions note in BIBLE_APP_ROADMAP.md).
 *
 * Voice gate on every string: no Christian framing, no "convert", no
 * false-inclusion gospel implications, no prescription per Red Line #8.
 * The page describes the surface; it does not preach to the reader.
 *
 * Promo codes: the Stripe-hosted checkout page surfaces an "Add
 * promotion code" field automatically (allow_promotion_codes=True is
 * set on every session). Users with a FRIENDS_FAMILY or FOUNDER50 code
 * enter it on the Stripe page itself; no UI on our side.
 */

type TierCard = {
  tier: Exclude<PartnerTier, "free">;
  name: string;
  monthlyPriceLabel: string;
  annualPriceLabel: string;
  annualNoteLabel: string;
  blurb: string;
  bullets: string[];
};

const TIERS: TierCard[] = [
  {
    tier: "study_notes",
    name: "Study Notes",
    monthlyPriceLabel: "$1.99 / month",
    annualPriceLabel: "$19.90 / year",
    annualNoteLabel: "two months free",
    blurb: "Framework commentary on every chapter of the canon, Strong's tap-on-word lookup, and curated cross-reference threads that anchor every passage in its Tanakh source.",
    bullets: [
      "Yoshi's framework commentary on every chapter of the 66 books",
      "Strong's lookup on every word — tap to open the lemma",
      "Curated cross-reference threads — every passage grounded in its Tanakh source",
      "Everything in the free reader",
    ],
  },
  {
    tier: "extras",
    name: "Extras",
    monthlyPriceLabel: "$4.99 / month",
    annualPriceLabel: "$49.90 / year",
    annualNoteLabel: "two months free",
    blurb: "The full extras library — Apocrypha, Enoch, Jubilees, Jasher, Charles vol 1, Apostolic Fathers, Apocryphal NT, Ascension of Isaiah, and Josephus's Wars and Antiquities — all Restored Names.",
    bullets: [
      "Apocrypha (KJV-1611, restored)",
      "Enoch, Jubilees, Jasher (already-published Restored Names editions)",
      "Charles vol 1 apocrypha, Apostolic Fathers, M.R. James apocryphal NT",
      "Ascension of Isaiah, Josephus's Wars and Antiquities",
      "Everything in the free reader",
    ],
  },
  {
    tier: "complete_study",
    name: "Complete Study",
    monthlyPriceLabel: "$9.99 / month",
    annualPriceLabel: "$99.90 / year",
    annualNoteLabel: "two months free",
    blurb: "Study Notes plus Extras, combined, with framework commentary extended to the extras and advanced search across canon and extras together.",
    bullets: [
      "Everything in Study Notes",
      "Everything in Extras",
      "Framework commentary on the extras (not just the canon)",
      "Advanced search across canon and extras together",
      "Deeper-dive Statement of Faith sections surfaced inline",
    ],
  },
  {
    tier: "everything",
    name: "Everything",
    monthlyPriceLabel: "$14.99 / month",
    annualPriceLabel: "$149 / year",
    annualNoteLabel: "two months free",
    blurb: "Complete Study plus the live sermons feed, the courses platform when it launches, full Teaching Corpus, early access to new books and chapters as Yoshi publishes them, video integration with the assembly's YouTube channel, and partner-only Sabbath teachings.",
    bullets: [
      "Everything in Complete Study",
      "Live sermons feed (when it launches)",
      "Courses platform (when it launches)",
      "Full Teaching Corpus access — forty concepts at depth",
      "Early access to new books and chapters",
      "Partner-only Sabbath teachings + bonus content",
    ],
  },
];

const FOUNDER_ANNUAL_LABEL = "$75 / year — forever locked";
const FOUNDER_MONTHLY_LABEL = "$7.49 / month — forever locked";

export default function Pricing() {
  // S113 hotfix: default to monthly. The $1.99 first paid tier reads
  // more accessibly at the monthly price; partners who want the annual
  // discount can toggle. Annual was the prior default (S38) — flipped
  // after Yoshi's S113-verification feedback.
  const [cadence, setCadence] = useState<BillingCadence>("monthly");
  const [busy, setBusy] = useState<string | null>(null); // which card is checking out
  const [me, setMe] = useState<SubscriptionMe | null>(null);
  const [meError, setMeError] = useState<string | null>(null);

  useEffect(() => {
    getSubscriptionMe()
      .then(setMe)
      .catch((e) => {
        // 401 means no JWT cookie present. Treat as anonymous + record
        // so the page can route the partner to WordPress sign-in
        // before checkout.
        setMeError(String(e));
      });
  }, []);

  const isSignedIn = me !== null && meError === null;
  // S113 hotfix: separate the "is this partner an active subscriber"
  // question (used for the banner copy) from the "is the Subscribe
  // button disabled" question (used for click-gating). A partner whose
  // subscription is active but cancel_at_period_end=true is technically
  // still active until period_end, but they need a reactivation path —
  // disabling their button locked them out. Fix: hasActiveSubscription
  // still flips the banner on; reactivationOpen flips the button to
  // "Reactivate" and re-enables it.
  const hasActiveSubscription = me?.status === "active" || me?.status === "trialing";
  const reactivationOpen =
    hasActiveSubscription && me?.cancel_at_period_end === true;
  const buttonDisabled = hasActiveSubscription && !reactivationOpen;

  async function handleCheckout(
    tier: Exclude<PartnerTier, "free">,
    isFounder: boolean
  ) {
    if (!isSignedIn) {
      // Route the partner to the new /sign-in intermediate landing
      // page first. After they pick Log In or Create Account there,
      // WordPress handles auth and bounces them back via the
      // redirect_to= contract.
      //
      // S126 swap: the prior direct route to /goshen/?redirect_to=...
      // was bouncing first-time visitors straight to a login-only WP
      // page with no visible create-account path. The new /sign-in
      // PWA route surfaces both Log In and Create Account up front
      // so first-time visitors have a clear path to subscription.
      // See SignIn.tsx for the page itself; both buttons there honor
      // the return_to query value below.
      //
      // S119 swap (prior): /login 404'd because the login slug had
      // been moved to /goshen/. That swap landed live; /sign-in now
      // wraps it with the two-button intermediate page.
      //
      // The full S118 /account combined surface in WordPress (single-
      // page combined Log-In + Create-Account form) stays queued for
      // when WP email deliverability is fixed.
      window.location.href =
        "/sign-in?return_to=" +
        encodeURIComponent(window.location.href);
      return;
    }
    const key = `${tier}-${cadence}-${isFounder}`;
    setBusy(key);
    try {
      const body: CheckoutCreateRequest = {
        tier,
        cadence,
        is_founder: isFounder,
        success_url: `${window.location.origin}/?subscribed=1`,
        cancel_url: window.location.href,
      };
      const resp = await createCheckoutSession(body);
      window.location.href = resp.checkout_url;
    } catch (e) {
      setBusy(null);
      alert(`Checkout could not be started: ${String(e)}`);
    }
  }

  return (
    <div className="mx-auto max-w-5xl px-6 py-8">
      <header className="mb-8 border-b border-[var(--reader-rule)] pb-4">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Become a Partner
        </h1>
        <p className="mt-2 text-base text-[var(--reader-muted)]">
          The 66-book canon stays open to anyone. The tiers below open the rest —
          the extras library, the framework commentary, Strong's lookup, and the
          Teaching Corpus — and the work the assembly carries forward.
        </p>
        <p className="mt-2 text-base text-[var(--reader-muted)]">
          <span className="font-medium text-[var(--reader-text)]">
            The price you pay today is the price you pay forever.
          </span>{" "}
          Once a tier is locked in, it doesn't go up on you. Cancel anytime; no
          surprise increases at renewal.
        </p>
        <nav className="mt-3 text-sm">
          <a href="/" className="text-[var(--reader-muted)] hover:underline">
            ← back to the reader
          </a>
        </nav>
      </header>

      {/* Cadence toggle */}
      <div className="mb-8 flex items-center justify-center gap-3 font-sans text-sm">
        <button
          type="button"
          onClick={() => setCadence("monthly")}
          className={`rounded border px-4 py-1.5 ${
            cadence === "monthly"
              ? "border-[var(--reader-text)] bg-[var(--reader-text)] text-[var(--reader-bg)]"
              : "border-[var(--reader-rule)] bg-[var(--reader-surface)] text-[var(--reader-text)]"
          }`}
        >
          Monthly
        </button>
        <button
          type="button"
          onClick={() => setCadence("annual")}
          className={`rounded border px-4 py-1.5 ${
            cadence === "annual"
              ? "border-[var(--reader-text)] bg-[var(--reader-text)] text-[var(--reader-bg)]"
              : "border-[var(--reader-rule)] bg-[var(--reader-surface)] text-[var(--reader-text)]"
          }`}
        >
          Annual <span className="text-xs opacity-75">— two months free</span>
        </button>
      </div>

      {/* Already-active banner. When cancel_at_period_end=true the
          partner is still active until period_end but needs a
          reactivation path — banner copy explains, button below stays
          enabled (S113 hotfix). */}
      {hasActiveSubscription && !reactivationOpen && (
        <div className="mb-6 rounded border border-emerald-300 bg-emerald-50 px-4 py-3 text-base text-emerald-900">
          You're an active partner at the{" "}
          <span className="font-medium">{me?.tier}</span>{" "}
          tier ({me?.cadence}).
          {me?.is_founder_pricing && " Founder pricing — forever locked."}
          {me?.is_promo_subscriber && " Promotional partner — bypass the founder cap."}
        </div>
      )}
      {reactivationOpen && (
        <div className="mb-6 rounded border border-amber-300 bg-amber-50 px-4 py-3 text-base text-amber-900">
          Your subscription is set to end at the current period.
          Pick a tier below to reactivate — your access continues
          uninterrupted, and your locked price is preserved.
        </div>
      )}

      {/* Tier cards */}
      <div className="grid grid-cols-1 gap-5 md:grid-cols-2 lg:grid-cols-4">
        {TIERS.map((t) => {
          const isEverything = t.tier === "everything";
          const priceLabel =
            cadence === "monthly" ? t.monthlyPriceLabel : t.annualPriceLabel;
          const noteLabel =
            cadence === "annual" ? t.annualNoteLabel : undefined;
          const founderLabel =
            cadence === "annual" ? FOUNDER_ANNUAL_LABEL : FOUNDER_MONTHLY_LABEL;
          const checkoutKey = `${t.tier}-${cadence}-false`;
          const founderKey = `${t.tier}-${cadence}-true`;

          return (
            <div
              key={t.tier}
              className={`flex flex-col rounded-lg border ${
                isEverything
                  ? "border-[var(--reader-text)] bg-[var(--reader-surface)]"
                  : "border-[var(--reader-rule)] bg-[var(--reader-surface)]"
              } p-5`}
            >
              <h2 className="text-lg font-semibold text-[var(--reader-text)]">
                {t.name}
              </h2>
              <div className="mt-1">
                <div className="text-xl font-medium text-[var(--reader-text)]">
                  {priceLabel}
                </div>
                {noteLabel && (
                  <div className="text-xs text-[var(--reader-muted)]">
                    {noteLabel}
                  </div>
                )}
              </div>
              <p className="mt-3 text-base text-[var(--reader-muted)]">
                {t.blurb}
              </p>
              <ul className="mt-3 flex-1 space-y-1.5 text-base text-[var(--reader-text)]">
                {t.bullets.map((b) => (
                  <li key={b} className="flex gap-2">
                    <span aria-hidden className="text-[var(--reader-muted)]">
                      ·
                    </span>
                    <span>{b}</span>
                  </li>
                ))}
              </ul>

              <button
                type="button"
                disabled={busy !== null || buttonDisabled}
                onClick={() => handleCheckout(t.tier, false)}
                className={`mt-5 rounded border px-4 py-2 text-sm font-medium ${
                  buttonDisabled
                    ? "cursor-not-allowed border-[var(--reader-rule)] bg-[var(--reader-surface)] text-[var(--reader-muted)]"
                    : "border-[var(--reader-text)] bg-[var(--reader-text)] text-[var(--reader-bg)] hover:opacity-90"
                } disabled:opacity-60`}
              >
                {busy === checkoutKey
                  ? "Starting checkout…"
                  : buttonDisabled
                  ? "Already a partner"
                  : reactivationOpen
                  ? "Reactivate"
                  : "Subscribe"}
              </button>

              {isEverything && !buttonDisabled && (
                <div className="mt-3 rounded border border-amber-300 bg-amber-50 p-3 text-xs text-amber-900">
                  <div className="font-medium">First 100 founder partners</div>
                  <div className="mt-1">{founderLabel}</div>
                  <div className="mt-1 text-amber-800">
                    Half off, locked at this price for as long as you remain
                    subscribed. Shared cap across monthly and annual.
                  </div>
                  <button
                    type="button"
                    disabled={busy !== null}
                    onClick={() => handleCheckout("everything", true)}
                    className="mt-2 w-full rounded border border-amber-700 bg-amber-700 px-3 py-1.5 text-xs font-medium text-white hover:opacity-90 disabled:opacity-60"
                  >
                    {busy === founderKey
                      ? "Starting checkout…"
                      : "Claim founder pricing"}
                  </button>
                </div>
              )}
            </div>
          );
        })}
      </div>

      {/* Footer: promo-code hint + permanent-price-lock reminder */}
      <footer className="mt-10 border-t border-[var(--reader-rule)] pt-4 text-base text-[var(--reader-muted)]">
        <p>
          Have a partner code? Enter it on the Stripe checkout page that opens
          after you click Subscribe — there's a field for it on the right side
          of the page.
        </p>
        <p className="mt-2">
          Subscriptions route through Stripe. The 501(c)(3) is the legal home of
          the work.
        </p>
      </footer>
    </div>
  );
}
