import { useEffect, useState } from "react";
import {
  type BillingCadence,
  type CheckoutCreateRequest,
  type PartnerTier,
  type SubscriptionMe,
  createCheckoutSession,
  getSubscriptionMe,
} from "../lib/api";
import { loadStoredNativeToken } from "../lib/native-auth";
import { isNativeShell, NATIVE_MANAGE_LINE } from "../lib/native-shell";

/**
 * Session 38 — Pricing surface. Tier-name overhaul S140 — display names
 * renamed Study Notes / Library / Companion / Scribe (backend slugs
 * `study_notes` / `extras` / `complete_study` / `everything` unchanged).
 * Prices appear
 * only on this Pricing page; every other reader-facing surface uses the
 * tier name and the "Unlock in [Name] tier" CTA convention.
 *
 * Renders the four paid tiers (Study Notes / Library / Companion / Scribe)
 * with a monthly+annual toggle, the founder CTA prominently on the
 * scribe-annual card, and a brief permanent-price-lock note
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
  /** S206 — the post-founder price, shown struck-through next to the
   *  founder price. Arbitrary-by-design (Yoshi: "we will raise prices
   *  of all the tiers"); display-only, nothing bills at these. */
  laterMonthlyLabel: string;
  laterAnnualLabel: string;
  /** TRUE when this tier bills through its founder catalog row
   *  (is_founder=true on the checkout request). Study Notes and
   *  Library bill their standard rows — their standard price IS the
   *  founder price; only Companion carries dedicated founder rows. */
  founderBilling: boolean;
  annualNoteLabel: string;
  blurb: string;
  bullets: string[];
  highlight?: boolean;
};

/**
 * S206 — founder pricing across the whole ladder while the app is
 * built and updated daily (Yoshi's call). Three tiers; SCRIBE
 * (everything) is hidden until the future — its catalog rows and
 * existing subscribers are untouched, the card just doesn't render.
 * The "later" prices are deliberate placeholders for the post-founder
 * raise; nothing bills at them. Companion bills through its NEW
 * founder catalog rows (session206_founder_pricing.sql + two Stripe
 * prices) — founderBilling=true sends is_founder on the checkout
 * request. The Study Notes "every chapter" and Scribe Teaching-Corpus
 * overclaims were corrected in the same pass (S206 honesty check).
 */
const TIERS: TierCard[] = [
  {
    tier: "study_notes",
    name: "Study Notes",
    monthlyPriceLabel: "$1.99 / month",
    annualPriceLabel: "$19.90 / year",
    laterMonthlyLabel: "$2.99",
    laterAnnualLabel: "$29.90",
    founderBilling: false,
    annualNoteLabel: "two months free",
    blurb: "Framework commentary growing chapter by chapter across the canon, and curated cross-reference threads that anchor every passage in its Tanakh source.",
    bullets: [
      "Yoshi's framework commentary — growing chapter by chapter across the 66 books, updated as it's written",
      "Curated cross-reference threads — every passage grounded in its Tanakh source",
      "Everything in the free reader",
    ],
  },
  {
    tier: "extras",
    name: "Library",
    monthlyPriceLabel: "$4.99 / month",
    annualPriceLabel: "$49.90 / year",
    laterMonthlyLabel: "$7.77",
    laterAnnualLabel: "$77.70",
    founderBilling: false,
    annualNoteLabel: "two months free",
    blurb: "The full restored library beyond the canon — Apocrypha, Enoch, Jubilees, Jasher, Charles vol 1, Apostolic Fathers, Apocryphal NT, Ascension of Isaiah, and Josephus's Wars and Antiquities — all Restored Names.",
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
    name: "Companion",
    monthlyPriceLabel: "$7.49 / month",
    annualPriceLabel: "$75 / year",
    laterMonthlyLabel: "$12.99",
    laterAnnualLabel: "$129.90",
    founderBilling: true,
    annualNoteLabel: "two months free",
    blurb: "Study Notes plus Library, combined, with framework commentary extended into the restored library and the framework thread callouts that synthesize how canon and library answer each other.",
    bullets: [
      "Everything in Study Notes",
      "Everything in Library",
      "Framework commentary on the restored library (not just the canon)",
      "Framework thread callouts — the hidden detail expand on every chapter-end card, synthesizing the cross-references across canon and restored library",
      "Deeper-dive Statement of Faith sections surfaced inline",
    ],
    highlight: true,
  },
];

/**
 * S206 — consumption-only store posture. Inside the native shells
 * (Capacitor; Play Store / App Store builds) the checkout surface is
 * hidden entirely: no prices, no cadence toggle, no Subscribe or
 * founder buttons, no promo-code hint. The page keeps the tier names
 * and what each tier carries, plus a calm note that tiers are managed
 * from the partner's account on the web. The web/PWA keeps full
 * Stripe checkout untouched. Same runtime-bridge detection pattern as
 * SignIn.tsx — no Capacitor import, so the web bundle stays slim and
 * the by-URL shell (capacitor.config.ts server.url) picks this up on
 * the next web deploy with no app rebuild.
 */
function isNativePlatform(): boolean {
  const cap = (window as unknown as {
    Capacitor?: { isNativePlatform?: () => boolean };
  }).Capacitor;
  return cap?.isNativePlatform?.() === true;
}

export default function Pricing() {
  // S113 hotfix: default to monthly. The $1.99 first paid tier reads
  // more accessibly at the monthly price; partners who want the annual
  // discount can toggle. Annual was the prior default (S38) — flipped
  // after Yoshi's S113-verification feedback.
  const [cadence, setCadence] = useState<BillingCadence>("monthly");
  const native = isNativePlatform();
  const [busy, setBusy] = useState<string | null>(null); // which card is checking out
  const [me, setMe] = useState<SubscriptionMe | null>(null);
  const [meError, setMeError] = useState<string | null>(null);

  // S191 — mirror App.tsx's S178 fix. The Capacitor shell stores its
  // JWT in Capacitor Preferences; the in-memory cache that api.ts reads
  // synchronously is reset to null on every full page navigation
  // (window.location.assign), and the chrome's "Become a partner" link
  // IS a full nav. Without awaiting loadStoredNativeToken() first, this
  // me-fetch races the async Preferences read, fires without a Bearer
  // header, comes back 401, sets meError, flips isSignedIn=false, and
  // the tier-click handler below bounces the partner back to /sign-in
  // even though they signed in moments earlier. On web,
  // loadStoredNativeToken() is a no-op (returns null without touching
  // Preferences), so the PWA cookie path is unaffected.
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      getSubscriptionMe()
        .then((m) => {
          if (cancelled) return;
          setMe(m);
        })
        .catch((e) => {
          if (cancelled) return;
          // 401 means neither the native cache nor the cookie has a
          // token. Treat as anonymous + record so the tier-click
          // handler routes to /sign-in before checkout.
          setMeError(String(e));
        });
    });
    return () => {
      cancelled = true;
    };
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

  // Native shells (App Store / Play builds) must surface NO purchase or
  // upgrade path — no prices, no tier cards, no cadence toggle, no
  // checkout button, not even a tappable "manage on the web" link. The
  // whole surface collapses to a single plain-text, non-clickable line
  // pointing the partner to the web account. Web/PWA is untouched below.
  if (isNativeShell()) {
    return (
      <div className="mx-auto max-w-5xl px-6 py-8">
        <header className="mb-8 border-b border-[var(--reader-rule)] pb-4">
          <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
            Become a Partner
          </h1>
        </header>
        <p className="mx-auto max-w-xl text-center text-base text-[var(--reader-text)]">
          {NATIVE_MANAGE_LINE}
        </p>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-5xl px-6 py-8">
      <header className="mb-8 border-b border-[var(--reader-rule)] pb-4">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Become a Partner
        </h1>
        <p className="mt-2 text-base text-[var(--reader-muted)]">
          The 66-book canon stays open to anyone. The tiers below open the rest —
          the extras library, the framework commentary, and Strong's lookup — and
          the work the assembly carries forward.
        </p>
        <p className="mt-2 text-base text-[var(--reader-muted)]">
          Every tier is at founder pricing while the app is built and updated
          daily. Prices will rise as the work grows —{" "}
          <span className="font-medium text-[var(--reader-text)]">
            but the price you pay today is the price you pay forever.
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

      {/* Native shells must not surface any tappable path to checkout
          (App Store / Play Store consumption-only posture). Show plain,
          NON-clickable informational text only — no button, no window.open,
          no link out to a pricing/checkout page. */}
      {native && (
        <div className="mb-8 rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3 text-base text-[var(--reader-text)]">
          <p>
            Subscriptions are managed on the web. Visit
            bible.remnantofpromise.org in your browser, sign in, and choose your
            tier — then return here and everything it carries unlocks
            automatically.
          </p>
        </div>
      )}

      {/* Cadence toggle */}
      {!native && (
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
      )}

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
      <div className="grid grid-cols-1 gap-5 md:grid-cols-3">
        {TIERS.map((t) => {
          const priceLabel =
            cadence === "monthly" ? t.monthlyPriceLabel : t.annualPriceLabel;
          const laterLabel =
            cadence === "monthly" ? t.laterMonthlyLabel : t.laterAnnualLabel;
          const noteLabel =
            cadence === "annual" ? t.annualNoteLabel : undefined;
          const checkoutKey = `${t.tier}-${cadence}-${t.founderBilling}`;

          return (
            <div
              key={t.tier}
              className={`flex flex-col rounded-lg border ${
                t.highlight
                  ? "border-[var(--reader-text)] bg-[var(--reader-surface)]"
                  : "border-[var(--reader-rule)] bg-[var(--reader-surface)]"
              } p-5`}
            >
              <h2 className="text-lg font-semibold text-[var(--reader-text)]">
                {t.name}
              </h2>
              {!native && (
                <div className="mt-1">
                  <div className="text-xl font-medium text-[var(--reader-text)]">
                    <s className="mr-2 text-base font-normal text-[var(--reader-muted)]">
                      {laterLabel}
                    </s>
                    {priceLabel}
                  </div>
                  <div className="text-xs text-[var(--reader-muted)]">
                    founder pricing — locked forever
                    {noteLabel ? ` · ${noteLabel}` : ""}
                  </div>
                </div>
              )}
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

              {!native && (
              <button
                type="button"
                disabled={busy !== null || buttonDisabled}
                onClick={() => handleCheckout(t.tier, t.founderBilling)}
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
              )}
            </div>
          );
        })}
      </div>

      {/* Footer: promo-code hint + permanent-price-lock reminder */}
      <footer className="mt-10 border-t border-[var(--reader-rule)] pt-4 text-base text-[var(--reader-muted)]">
        {!native && (
          <p>
            Have a partner code? Enter it on the Stripe checkout page that opens
            after you click Subscribe — there's a field for it on the right side
            of the page.
          </p>
        )}
        <p className="mt-2">
          {native
            ? "The 501(c)(3) is the legal home of the work."
            : "Subscriptions route through Stripe. The 501(c)(3) is the legal home of the work."}
        </p>
      </footer>
    </div>
  );
}
