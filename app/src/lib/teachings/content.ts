/**
 * Teachings — data model, registry, and the tier gate.
 *
 * The Teachings tab is a free-for-all hook: every teaching TITLE is listed for
 * everyone, and each teaching's title + synopsis are shown to everyone. The
 * FULL BODY is revealed only when the reader's effective tier OWNS the
 * teaching's `tier_required` (reusing the same `tierOwns` ladder + active/
 * trialing subscription check the reader uses everywhere else).
 *
 * S353 — first teaching ships at tier_required = "free", so its title,
 * synopsis AND full body are visible to everyone. A free teaching has no
 * paywall to leak, so shipping its body as static client content is correct.
 * The gate below stays in place so a FUTURE teaching can flip `tier_required`
 * to a paid tier — a paid teaching should serve its body from the server-gated
 * DB path (never ship the locked body to the client), but the same gate logic
 * decides reveal-vs-locked either way.
 *
 * S354 — a teaching may carry an optional `closing` flourish (a distinct
 * emphatic block after the body) and an optional `promo` (a book cover that
 * links out to the physical-goods product page). Both render only with the
 * revealed body.
 */

import type { ContentTier, PartnerTier, SubscriptionStatus } from "../api";
import { tierOwns } from "../offlineDownload";
import {
  SEED_OF_PROMISE_BODY,
  SEED_OF_PROMISE_SYNOPSIS,
} from "./seed-of-promise";
import { KINGDOM_GOSPEL_SYNOPSIS } from "./kingdom-gospel";
import ephraimRisingCover from "../../assets/ephraim-rising-cover.jpg";

/**
 * Amazon PRINT (paperback) product page for "Ephraim Rising". A printed book is
 * physical goods — Apple/Google permit outbound purchase links and take no
 * commission — so this renders as a REAL clickable external link (unlike the
 * digital-subscription lines, which stay non-clickable).
 */
export const EPHRAIM_RISING_AMAZON_URL = "https://a.co/d/0ey7ESOB";

/** An emphatic closing block appended after a teaching's body. */
export interface TeachingClosing {
  /** Lead paragraph(s), markdown inline (*italic* / **bold**) supported. */
  lead: string;
  /** The emphatic final line — rendered as the metallic finish. */
  finish: string;
}

/** A book-cover promo that links out to a physical-goods product page. */
export interface TeachingPromo {
  /** Bundled cover image URL. */
  image: string;
  alt: string;
  /** External product-page URL (physical goods → real clickable link). */
  href: string;
  /** Small caption under the cover, e.g. "Read the book". */
  caption?: string;
}

export interface Teaching {
  slug: string;
  title: string;
  /** Markdown synopsis — shown to everyone. */
  synopsis: string;
  /** Markdown body. Present inline only for FREE teachings (safe to ship
   *  static). A partner-gated teaching would leave this empty and fetch the
   *  body from the server-gated API once entitlement is confirmed. */
  body: string;
  tier_required: ContentTier;
  order: number;
  /** Optional emphatic closing flourish, shown with the revealed body. */
  closing?: TeachingClosing;
  /** Optional book-cover promo, shown beneath the closing. */
  promo?: TeachingPromo;
}

/** The teaching registry, ordered for display. */
export const TEACHINGS: Teaching[] = [
  {
    slug: "seed-of-promise",
    title: "The Seed of Promise and a Remnant",
    synopsis: SEED_OF_PROMISE_SYNOPSIS,
    body: SEED_OF_PROMISE_BODY,
    tier_required: "free",
    order: 1,
    closing: {
      lead:
        "This is not Hebrew Roots. It is not any religion you have seen " +
        "before. This is the pure, unadulterated Scripture — free from the " +
        "scales, the chains, and the spiritual drunkenness of the doctrines " +
        "of men.",
      finish: "We are Ephraim. And this is our awakening.",
    },
    promo: {
      image: ephraimRisingCover,
      alt: "Ephraim Rising — book cover",
      href: EPHRAIM_RISING_AMAZON_URL,
      caption: "Read the book — Ephraim Rising",
    },
  },
  {
    // S421 — a SERVER-FETCHED teaching: `body` stays empty here and is fetched
    // from GET /v1/teachings/{slug}/body, NOT inlined in the client bundle.
    //
    // S423 (launch hotfix) — tier_required lowered from "everything" to "extras"
    // so this teaching gates EXACTLY like the extra-canonical (apocrypha) books,
    // which sit at tier_required = 'extras'. Free is blocked; the 7-day
    // everything-trial passes (trialing → effective 'everything' owns 'extras');
    // paid members at 'extras' and above are recognized. It was gated at the top
    // of the strict chain ('everything'), which — with member-tier recognition
    // currently unreliable — was stricter than the apocrypha and blocked
    // members it should admit. "extras" makes canReadBody true for exactly the
    // apocrypha audience so the "Dive deeper" reveal shows for them. The body is
    // STILL server-fetched (body:"" — never inlined), and the endpoint still
    // requires a valid JWT. The matching server row is lowered in the same step
    // by data-schema/migrations/session423_kingdom_gospel_open.sql
    // (UPDATE teaching_bodies SET tier_required='extras' WHERE slug='kingdom-gospel')
    // so client reveal and server gate agree. See kingdom-gospel.ts +
    // api.getTeachingBody.
    slug: "kingdom-gospel",
    title: "The True Kingdom Gospel — Not Taught in the Churches of Any Denomination",
    synopsis: KINGDOM_GOSPEL_SYNOPSIS,
    body: "",
    tier_required: "extras",
    order: 2,
  },
];

/** Teachings in display order. */
export function listTeachings(): Teaching[] {
  return [...TEACHINGS].sort((a, b) => a.order - b.order);
}

/** Look a teaching up by slug. */
export function teachingBySlug(slug: string): Teaching | undefined {
  return TEACHINGS.find((t) => t.slug === slug);
}

const TIER_LABEL: Record<ContentTier, string> = {
  free: "Free",
  study_notes: "Study Notes",
  extras: "Extras",
  complete_study: "Complete Study",
  everything: "Everything",
};

/** Human label for a content tier (e.g. for the locked prompt / list pill). */
export function prettyTier(tier: ContentTier): string {
  return TIER_LABEL[tier] ?? tier;
}

/**
 * The statuses the SERVER treats as "not a live subscription" — mirrors
 * api/auth.py TERMINAL_SUBSCRIPTION_STATUSES, plus `none` (no row at all).
 * Every OTHER status (active, trialing, past_due, incomplete) is a live row
 * that keeps the partner on their tier. This is the exact set
 * `_resolve_tier_from_db` excludes when it resolves the caller's tier, so the
 * client reveal admits precisely who the server (and the extra-canonical books,
 * which gate through the same `tier_satisfies` machinery) admits — no stricter.
 *
 * `canceled` is terminal for AUTO-RENEW but NOT for access: a partner who
 * cancels an annual plan keeps the tier they PAID FOR until the paid period
 * actually ends (`current_period_end`). `effectiveTier` restores that window;
 * the server's `_resolve_tier_from_db` honors the same rule so the two agree.
 */
const TERMINAL_SUBSCRIPTION_STATUSES: SubscriptionStatus[] = [
  "none",
  "canceled",
  "unpaid",
  "incomplete_expired",
];

/**
 * Effective content tier for a subscription snapshot. A partner on any LIVE
 * (non-terminal) subscription keeps their tier; a terminal status or no row
 * falls back to free. This mirrors the server's `_resolve_tier_from_db` exactly
 * — the single tier-resolution the extra-canonical books, highlights, and
 * reader chrome all gate on — so the teaching gate is neither looser nor
 * stricter than every other gated surface. The server endpoint remains the
 * final authority and still withholds the body from any non-entitled caller.
 *
 * The one nuance: a `canceled` subscription still owns its tier until the paid
 * period ends. An annual partner who cancels auto-renew has already paid for
 * the remainder of the year, so `currentPeriodEnd` (from /me) — while it is
 * still in the future — keeps them on their tier. `unpaid` / `incomplete_expired`
 * never get this window: there is no paid period to honor.
 */
export function effectiveTier(
  tier: PartnerTier | null,
  status: SubscriptionStatus,
  currentPeriodEnd?: string | null,
): PartnerTier {
  if (!TERMINAL_SUBSCRIPTION_STATUSES.includes(status)) return tier ?? "free";
  // Canceled but still inside the paid period → the partner keeps what they
  // paid for. Parse defensively: a missing/unparseable date fails closed.
  if (status === "canceled" && currentPeriodEnd) {
    const endMs = new Date(currentPeriodEnd).getTime();
    if (!Number.isNaN(endMs) && endMs > Date.now()) return tier ?? "free";
  }
  return "free";
}

/** True when the reader may read the full body of `t`. */
export function canReadBody(
  t: Teaching,
  tier: PartnerTier | null,
  status: SubscriptionStatus,
  currentPeriodEnd?: string | null,
): boolean {
  return tierOwns(effectiveTier(tier, status, currentPeriodEnd), t.tier_required);
}
