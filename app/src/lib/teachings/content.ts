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
 */

import type { ContentTier, PartnerTier, SubscriptionStatus } from "../api";
import { tierOwns } from "../offlineDownload";
import {
  SEED_OF_PROMISE_BODY,
  SEED_OF_PROMISE_SYNOPSIS,
} from "./seed-of-promise";

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
