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
 * emphatic block after the body) and one or more `promos` (book covers that
 * link out to a physical-goods product page). Both render only with the
 * revealed body.
 *
 * S355 — the Teachings LIST also carries "The Library": a shelf of the print
 * series (LIBRARY_BOOKS). These are PHYSICAL books, so the outbound Amazon
 * links are compliant and commission-free (Apple/Google permit them). The
 * shelf is free-for-all — visible to everyone, no gating, no pricing/buy/cart
 * steering, just tappable covers.
 */

import type { ContentTier, PartnerTier, SubscriptionStatus } from "../api";
import { tierOwns } from "../offlineDownload";
import {
  SEED_OF_PROMISE_BODY,
  SEED_OF_PROMISE_SYNOPSIS,
} from "./seed-of-promise";
import ephraimRisingCover from "../../assets/ephraim-rising-cover.jpg";

/**
 * Base URL for the hotlinked print-cover images. The covers are already
 * web-hosted on the ministry site, so they are hotlinked (never bundled).
 */
export const COVER_BASE =
  "https://remnantofpromise.org/wp-content/themes/remnant-of-promise/assets/covers/";

/** Amazon product page for a physical book by its ASIN. */
function amazonDp(asin: string): string {
  return `https://www.amazon.com/dp/${asin}`;
}

/**
 * Amazon PRINT (paperback) product page for "Ephraim Rising". A printed book is
 * physical goods — Apple/Google permit outbound purchase links and take no
 * commission — so this renders as a REAL clickable external link (unlike the
 * digital-subscription lines, which stay non-clickable).
 */
export const EPHRAIM_RISING_AMAZON_URL = "https://a.co/d/0ey7ESOB";

/** Amazon PRINT product page for "Not My People". */
export const NOT_MY_PEOPLE_AMAZON_URL = amazonDp("B0GTRC7K2J");

/** An emphatic closing block appended after a teaching's body. */
export interface TeachingClosing {
  /** Lead paragraph(s), markdown inline (*italic* / **bold**) supported. */
  lead: string;
  /** The emphatic final line — rendered as the metallic finish. */
  finish: string;
}

/** A book-cover promo that links out to a physical-goods product page. */
export interface TeachingPromo {
  /** Cover image URL (bundled asset or hotlinked print cover). */
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
  /** Optional book-cover promos, shown in order beneath the closing. */
  promos?: TeachingPromo[];
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
    // Scattering → homecoming: "Not My People" first, then "Ephraim Rising".
    promos: [
      {
        image: COVER_BASE + "not-my-people.png",
        alt: "Not My People — book cover",
        href: NOT_MY_PEOPLE_AMAZON_URL,
        caption: "Read the book — Not My People",
      },
      {
        image: ephraimRisingCover,
        alt: "Ephraim Rising — book cover",
        href: EPHRAIM_RISING_AMAZON_URL,
        caption: "Read the book — Ephraim Rising",
      },
    ],
  },
];

/**
 * "The Library" shelf on the Teachings list — the print series in reading
 * order. PHYSICAL books, so the Amazon links are compliant and commission-free;
 * shown to everyone (no gating). Covers are hotlinked from COVER_BASE.
 */
export interface LibraryBook {
  title: string;
  /** Hotlinked cover image URL. */
  image: string;
  /** Amazon product page (physical goods → real clickable link). */
  href: string;
}

/** The Library shelf, in series reading order. */
export const LIBRARY_BOOKS: LibraryBook[] = [
  {
    title: "The Faith in Jesus That Saves",
    image: COVER_BASE + "faith-in-jesus-that-saves.jpeg",
    href: amazonDp("B0GSVLPLP5"),
  },
  {
    title: "Decoding Salvation",
    image: COVER_BASE + "decoding-salvation.jpg",
    href: amazonDp("B0GRGVJP5G"),
  },
  {
    title: "Not My People",
    image: COVER_BASE + "not-my-people.png",
    href: amazonDp("B0GTRC7K2J"),
  },
  {
    title: "You Should Have Known Better!",
    image: COVER_BASE + "you-should-have-known-better.jpg",
    href: amazonDp("B0GSMMT4N5"),
  },
  {
    title: "Ephraim Rising!",
    image: COVER_BASE + "ephraim-rising.jpg",
    href: amazonDp("B0GNHPDFTQ"),
  },
  {
    title: "Babylon's Galatian Deception",
    image: COVER_BASE + "babylons-galatian-deception.png",
    href: amazonDp("B0GWWLP4H4"),
  },
  {
    title: "What the Bible Really Says About the Rapture",
    image: COVER_BASE + "what-the-bible-says-about-rapture.jpg",
    href: amazonDp("B0GTQMJ4VZ"),
  },
  {
    title: "My Yoke Is Easy and My Burden Is Light",
    image: COVER_BASE + "my-yoke-is-easy.jpg",
    href: amazonDp("B0GRWG7NNN"),
  },
  {
    title: "Rapture Deception Exposed!",
    image: COVER_BASE + "rapture-deception-exposed.png",
    href: amazonDp("B0GRHTY9QF"),
  },
  {
    title: "Is God a Zionist?",
    image: COVER_BASE + "what-is-zionism.jpeg",
    href: amazonDp("B0GSRKYMQ3"),
  },
  {
    title: "The Sides of the North",
    image: COVER_BASE + "sides-of-the-north.jpg",
    href: amazonDp("B0GPWNYCQ7"),
  },
  {
    title: "Did God Really Say?",
    image: COVER_BASE + "did-god-really-say.jpg",
    href: amazonDp("B0GXRNR9TX"),
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
 * Effective content tier for a subscription snapshot: the partner's tier
 * counts only while the subscription is active or trialing; any other status
 * (none / past_due / canceled / …) falls back to free. Mirrors the reader
 * chrome's active-or-trialing check.
 */
export function effectiveTier(
  tier: PartnerTier | null,
  status: SubscriptionStatus,
): PartnerTier {
  if (status === "active" || status === "trialing") return tier ?? "free";
  return "free";
}

/** True when the reader may read the full body of `t`. */
export function canReadBody(
  t: Teaching,
  tier: PartnerTier | null,
  status: SubscriptionStatus,
): boolean {
  return tierOwns(effectiveTier(tier, status), t.tier_required);
}
