S174 — Family-Plan Tier + Community Auth Separation (multi-session spec)

# What this spec covers

S173 closed the Capacitor-wrap code and the cross-device display-prefs
sync; S174 opens the next pricing-model wheel. Two questions land
together because they share an architectural seam (per-account
identity inside a multi-account billing wrapper):

  1. **A new family-plan tier** — one billing relationship, five
     partner accounts under it, each with its own bookmarks / notes /
     highlights / reading position / display preferences. The
     per-user separation already lives in the schema (every
     reader-state table FKs to `users(id)`); the new work is the
     billing-aggregation wrapper, the invite + acceptance flow, and
     the tier's place in the ladder.

  2. **Community auth separation for underage seats on the family
     plan.** The Bible app surface is fine for every age (no
     community surface ships here); the architectural concern is
     that a JWT minted for a family-plan minor is, by default,
     also valid against the community-side of remnantofpromise.org
     (whichever community surfaces ship in the future — community
     posts, partner discussions, the parked community.remnantofpromise.org
     long-term wheel). The underage-protection ask is an
     account-level `is_adult` gate: kids on the family plan get a
     JWT that the community-side rejects even when valid, so the
     family-plan child has Bible-app-only auth and no community
     pathway.

This spec is the wheel-open doc. The build runs across multiple
sessions downstream — schema migration, billing aggregation, invite
flow, JWT claim shape, community-side enforcement, the tier rendered
in /pricing + /manage. S174 lands the spec only; S175+ builds against
it. The pattern matches S171_SACRED_NAME_MASK_SPEC (specced one
session, built across multiple).

# Background — what this supersedes / extends

**Q31 (BIBLE_APP_ROADMAP.md §IX) is the precedent.** Q31 (locked
2026-05-14) is the household / second-seat model: *"one partnership
purchased, the second seat at 50% off, and the whole family can use
the account."* Two seats, half-price on the second, household-shared.
Phase 7 (pricing/Stripe). Implementation noted: *"a household/second-
seat Stripe price at 50%, with multi-profile support under one
partnership."*

The S174 family-plan tier is a **deliberate scale-up** of Q31. Q31's
two-seat household → five-seat family plan. The half-off pricing
model → a flat family-plan price. The multi-profile-under-one-
partnership → five independent partner accounts under one Stripe
subscription. The underage-protection community-auth separation is a
new concern Q31 didn't surface (Q31 predated S88's community-surface
discussion).

**Recommendation:** S174 family-plan tier supersedes Q31 in scope.
Q31's "two-seat 50%-off" pattern doesn't survive as a separate offer
— a partner who wants two seats can either buy two individual
subscriptions, or take the family plan and use 2 of the 5 seats. The
family plan absorbs the "household" intent. Q31's entry in §IX gets
a "→ superseded by S174 family-plan tier" annotation when this spec
closes; not deleted, just transitioned.

(Yoshi: confirm at S174 close. If you want to keep a 2-seat half-off
as a separate offering parallel to the 5-seat family plan, that's
fine — the spec scales to N seats with a per-tier price band; we'd
just be running both shapes. Default move in this spec is family-
plan-only and Q31 superseded.)

# Tier shape — pricing, naming, position

## Five seats under one billing

The fixed seat count is **5**. The shape covers:

  - Parents + 1-3 children — the most common family configuration
    Yoshi has discussed (S88 voice-call referenced his own family).
  - Multi-generational households — adult child + grandparent + a
    couple of younger kids.
  - Small-group / discipleship cells — a teacher and 4 students
    studying together under one billing relationship.

Five is a round-and-meaningful number across scripture (the five
books of Torah; the five wise virgins; the five loaves). Not load-
bearing on the framework, just a pleasant register.

Variable seat counts (3-seat / 5-seat / 7-seat bands at different
prices) are **explicitly out of scope** for V1. Single fixed
seat-count keeps the billing aggregation simple and the partner-
visible offer one decision wide ("buy family or don't").

## Pricing band — Yoshi-decision (recommendations below)

The existing tier ladder per §III pricing:

| Tier | Slug | Monthly | Annual | Defining gift |
|------|------|---------|--------|---------------|
| Free | `free` | $0 | $0 | Restored canon + framework cross-ref seeds + free-tier study apparatus |
| Study Notes | `study_notes` | $1.99 | $19.90 | Adds Apocrypha + notes/memorization/export |
| Library | `extras` | $4.99 | $49.90 | Adds ~50-book extras library + dismantling units |
| Companion | `complete_study` | $9.99 | $99.90 | Adds framework commentary + interlinear + lexicons |
| Scribe | `everything` | $14.99 | $149.90 | Adds Yoshi-voice PVC audio + live sermons + courses |

Three pricing-band candidates for the family plan, each with the math:

**Option A — Family-Companion at $19.99/mo (5 Companion seats).**
Effective price: $4.00/seat at the Companion tier. Individual
Companion is $9.99 × 5 = $49.95; family-plan saves 60%. Annual
prepay (2 months free) lands at $199.90/yr. The proposition reads:
*the whole household at the Companion tier for less than 2 individual
Companion subscriptions.*

**Option B — Family-Library at $9.99/mo (5 Library seats).**
Effective price: $2.00/seat at the Library tier. Individual Library
is $4.99 × 5 = $24.95; family-plan saves 60%. Annual: $99.90/yr.
Reads as: *the whole household reading the canon + extras library
together for the price of one Companion.* Lower entry point, lower
ceiling.

**~~Option C — Family-Scribe at $29.99/mo.~~ DROPPED at S174-close
when Scribe tier was deleted entirely.** Scribe individual deletion
removed the base price the Family-Scribe option calculated against;
Family-Scribe doesn't exist as a Stripe-configurable product without
the underlying Scribe individual SKU. Partners who would have picked
Family-Scribe for the all-narration-included family value now route
through Family-Companion (which carries the full Companion-tier
framework synthesis across all five seats) plus donation channel
support via `/give` for the "support beyond what's built today"
intent. See BIBLE_APP_ROADMAP §III S174-close pricing rewrite + Q40
final closure for the full Scribe-deletion record.

The 60% multi-seat discount across the remaining two options
matches the common Apple Family Sharing / Spotify Family / Google
One Family benchmark and reads as a recognizable "family value"
framing without having to explain the math.

**Recommended default: Option A (Family-Companion $19.99).** Lands at
the same price point as Logos Premium individual ($19.99), at the
Companion tier (which is the framework-synthesis tier — the heart of
the apps' defining offer), with five household seats. Strong "go to
the family plan" pull from the Companion individual tier ($9.99 × 5
households = $49.95 if every member individually subscribed →
$19.99 family-plan = $30/mo saved). Yoshi's call. **S174-close
update:** with Scribe deleted, Companion becomes the highest
individual tier; Family-Companion becomes the highest family tier
correspondingly. The framework-synthesis layer (commentary, threads,
interlinear, lexicons) IS the family-plan headline.

Yoshi may also want to ship **both remaining family bands** (A + B)
for parity with the individual ladder — Family-Library /
Family-Companion — so a partner picks family-tier the same way
they'd pick individual-tier. Slightly more Stripe-config work but
generalizes cleanly from the V1 single-band spec; surface as Open
Question 1 below.

## Naming

**Recommended: "Family"** (Family-Library / Family-Companion if both
remaining bands ship after the S174-close Scribe deletion; "Family
Plan" if a single band ships V1).

Conventional, immediately legible, doesn't require partner education.
Matches the broader subscription-family-tier vocabulary the partner
already knows from Apple/Spotify/Google.

Alternatives considered:

  - **"Household"** — matches Q31's earlier language; slightly more
    voice-aligned but less immediately legible to a new partner who
    hasn't read Q31's working notes.
  - **"Five Seats"** — clear but unusual; the "seat" vocabulary is
    industry-standard for B2B SaaS, less common in consumer apps.
  - **"Five-Account Partnership"** — voice-aligned ("partnership" is
    the existing app vocabulary) but verbose on the pricing page.

Voice-check: "Family" is utility copy in the same register as
"Pricing", "Sign in", "Manage account". The framework voice doesn't
need to claim every label; the work it does is in the body content,
not in the navigation register. "Family" stands.

## Position in the tier ladder

The family-plan tier sits **adjacent to the individual ladder** on
/pricing, not stacked into it. The /pricing page becomes a
two-column or two-tab layout:

```
Individual                          Family
─────────                           ──────
Free          $0                    [Family-Companion]  $19.99/mo
Study Notes   $1.99                  • 5 seats at Companion
Library       $4.99                  • All notes/highlights/bookmarks
Companion     $9.99                    separate per-seat
Scribe        $14.99                 • One billing relationship
                                     • Adult/minor seats
                                       (community access gated on
                                        per-seat age verification)
```

The two-column shape signals "this is a different shape, not just
another tier" — a partner browsing /pricing sees the family plan as
its own decision rather than a higher individual tier.

# Per-user separation — already in the schema

**Good news: no schema work needed for the per-user separation.**
Every reader-state table already FKs to `users(id)`. The family-plan
billing wrapper changes only the billing aggregation; each seat's
state lives in its own user row with its own per-user data:

- `bookmarks(user_id, ...)` — per-seat
- `study_notes(user_id, ...)` — per-seat
- `highlights(user_id, ...)` — per-seat
- `reading_positions(user_id, ...)` — per-seat
- `users.display_prefs JSONB` (S173) — per-seat (sacred-name mask,
  parens-hide, theme, font-size, interlinear default, TTS voice)

A 12-year-old on a Family-Companion seat has her own highlights, her
own notes, her own bookmarks, her own sacred-name display mask, and
her own reading position — none of which her parents see and none of
which her siblings see. The billing relationship doesn't leak across
the per-user boundary.

This is the deliberate consequence of the user_id-scoped reader-state
design from Phase 4. The family-plan tier validates the design — it
unlocks the family use-case without any per-user-state migration.

# Billing aggregation — new tables + new flow

## Schema additions

Two new tables, one new column on `users`, and one new column on
`subscriptions`.

**New table `family_plans`** — one row per active family-plan
billing relationship:

```sql
CREATE TABLE family_plans (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_user_id           UUID NOT NULL REFERENCES users(id)
                                ON DELETE RESTRICT,
    -- The Stripe subscription that carries the family-plan billing.
    -- One subscription per family_plan row; ownership of the
    -- payment relationship belongs to the owner_user_id.
    stripe_subscription_id  TEXT UNIQUE NOT NULL,
    stripe_customer_id      TEXT,
    -- The tier the family-plan grants to every seat. References the
    -- existing content_tier enum so Family-Library / Family-Companion /
    -- Family-Library / Family-Companion (Family-Scribe option
    -- dropped at S174-close with Scribe deletion) flow through
    -- the same column.
    granted_tier            content_tier NOT NULL,
    cadence                 billing_cadence NOT NULL,
    status                  subscription_status NOT NULL,
    locked_price_cents      INT NOT NULL CHECK (locked_price_cents >= 0),
    seat_limit              INT NOT NULL DEFAULT 5
                                CHECK (seat_limit >= 1),
    trial_start             TIMESTAMPTZ,
    trial_end               TIMESTAMPTZ,
    current_period_start    TIMESTAMPTZ,
    current_period_end      TIMESTAMPTZ,
    cancel_at_period_end    BOOLEAN NOT NULL DEFAULT FALSE,
    canceled_at             TIMESTAMPTZ,
    started_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
    ended_at                TIMESTAMPTZ
);

CREATE INDEX idx_family_plans_owner ON family_plans(owner_user_id);
CREATE INDEX idx_family_plans_status ON family_plans(status);
```

**New table `family_plan_seats`** — one row per seat membership
(including the owner's own seat):

```sql
CREATE TABLE family_plan_seats (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    family_plan_id      UUID NOT NULL REFERENCES family_plans(id)
                            ON DELETE CASCADE,
    user_id             UUID REFERENCES users(id) ON DELETE SET NULL,
    -- Invite shape — populated at invite time before the recipient
    -- accepts. user_id stays NULL until the invitee accepts and
    -- their user row is created (or matched by existing email).
    invited_email       TEXT,
    invite_token        TEXT UNIQUE,
    invite_expires_at   TIMESTAMPTZ,
    -- Adult / minor flag set at acceptance time. Drives the JWT
    -- `is_adult` claim used by community-side enforcement.
    is_adult            BOOLEAN,
    invited_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    accepted_at         TIMESTAMPTZ,
    revoked_at          TIMESTAMPTZ,
    UNIQUE (family_plan_id, user_id)
);

CREATE INDEX idx_family_plan_seats_plan ON family_plan_seats(family_plan_id);
CREATE INDEX idx_family_plan_seats_user ON family_plan_seats(user_id);
CREATE INDEX idx_family_plan_seats_invite_token
    ON family_plan_seats(invite_token)
    WHERE invite_token IS NOT NULL;
```

**New column `users.is_adult BOOLEAN`** — the account-level
age-verification gate. Defaults to NULL for the existing-account
population (back-fill via Open Question 6 below — Yoshi's choice on
the existing-population default). Family-plan seat acceptance writes
the value at acceptance time per Q5. Community-side enforcement
reads this value (via JWT claim) at every community-side request.

**New column `subscriptions.family_plan_id UUID NULL`** — links a
subscription row to its family plan when the subscription is a
family-plan seat's tier-grant. Family-plan seats DO get a
`subscriptions` row (for the tier-grant audit trail and for the
existing per-user tier-entitlement logic to continue working
unchanged); the `family_plan_id` column distinguishes "individually
subscribed" from "subscribed via family plan." The billing for these
seat-rows is $0 (`locked_price_cents = 0`) — the actual payment
lives on the parent `family_plans.stripe_subscription_id`.

## Why the seat-rows-as-subscriptions design

The alternative was to make the family-plan tier grant entitlement
*directly* off `family_plan_seats` (without per-seat `subscriptions`
rows). The seat-rows-as-subscriptions design is preferred because:

  1. The existing tier-gate code path reads `subscriptions.tier`
     for the requesting user. Keeping the per-seat subscription row
     means the tier-gate logic doesn't need a special case for
     family-plan seats; it just reads the seat's $0-priced
     subscription row.
  2. Upgrade / downgrade paths stay simple. If a partner is on the
     family plan but also independently subscribes to Scribe to get
     the Yoshi-voice audio on top, the two subscriptions coexist
     and the higher tier wins per the existing tier-resolution
     logic. No new code needed.
  3. The audit trail (when a partner joined the family plan, when
     they left, what tier they had while a member) is preserved in
     the same table that already audits subscription history.

The `family_plan_id` column lets reporting queries filter "actively
billed individual subscriptions" from "family-plan grants" cleanly.

# Membership flow — invite + accept

The owner's flow when buying the family plan:

  1. Owner clicks **Become a partner — Family-Companion** on
     /pricing (or **Manage account** → **Switch to family plan** if
     they're already an individual subscriber).
  2. Stripe Checkout (existing flow) — the family-plan price ID is
     the single line item.
  3. Stripe webhook fires → API creates the `family_plans` row,
     creates the owner's `family_plan_seats` row with `user_id` =
     owner, `is_adult = TRUE` (the billing-owner is necessarily an
     adult — the payment method requires it), creates the owner's
     $0 `subscriptions` row with `family_plan_id` set.
  4. Owner redirected to /manage → new **Family plan** section
     showing 1 of 5 seats used. Empty seat slots show **Invite**
     buttons.

The invite flow (per seat):

  1. Owner clicks **Invite** on an empty seat slot. Modal prompts
     for the invitee's email and an **Is this a minor?** toggle.
  2. API creates `family_plan_seats` row with `user_id = NULL`,
     `invited_email` populated, `invite_token` generated, and
     `is_adult = !isMinor` (set at invite time; final at acceptance).
  3. API sends invite email with a one-time link to
     `bible.remnantofpromise.org/family/accept?token=<invite_token>`.
  4. Invitee clicks link → /family/accept page.
     - If invitee not signed in: sign-in flow → returns to /family/
       accept with the token.
     - If invitee signed in: API validates token, matches or creates
       the `users` row, sets `family_plan_seats.user_id`,
       `accepted_at`, finalizes `is_adult` from the invite-time
       value (or per Q5, prompts for confirmation if the invitee is
       18+ and the invite said minor — to prevent owner-side
       misclassification).
     - API creates the $0 `subscriptions` row for the seat with
       `family_plan_id` set + the family plan's `granted_tier`.
  5. Invitee redirected to the reader; the tier they now have is
     reflected in the next /v1/subscriptions/me fetch + the
     /v1/me/display-prefs sync flow.

Removal flow:

  - Owner can revoke a seat at any time (sets `revoked_at`, sets
    the seat's `subscriptions.status = 'canceled'` with
    `cancel_at_period_end = TRUE`). Per Q8 below — at-period-end
    vs immediate is Yoshi's call.
  - Seat-owner can leave the family plan (same effect; the seat-
    owner's `users` row stays, just unlinks from the plan).
  - Whole plan cancellation cancels all seats' subscriptions at
    period-end (Stripe webhook handles).

# Underage protection — community auth separation

The Bible app has **no community surface**. The reader, the strongs
modal, the notes panel, the bookmarks index, the settings page — all
single-partner-reading-the-text surfaces. No comments, no public
posts, no partner-visible profile, no leaderboards (per Q32 standing
rule). A minor on a family-plan seat reading the canon and the
extras library here is fine without any auth-level age gate.

**The concern is downstream.** Two surfaces sit outside the Bible
app but on the same SSO trust boundary:

  1. **remnantofpromise.org main site** — currently WordPress-based,
     houses the Statement of Faith, the Mission Statement, the blog,
     the book pages, the give flow, and (per BIBLE_APP_ROADMAP §III
     architecture note) "the assembly's social platform."
     WordPress consumes the same JWT the Bible app does (single
     sign-on per Phase 4 lock). The "social platform" surface is
     where the community concern lives — partner posts, threaded
     discussions, partner-to-partner messaging — surfaces where an
     unverified-age partner shouldn't have account-level access.
  2. **The parked community.remnantofpromise.org architecture**
     (BIBLE_APP_ROADMAP.md §III note 2026-05-10 session 9) — the
     long-term subdomain-of-community plan, shelved until Bible app
     revenue funds the build. When it lands, it'll consume the
     same SSO JWT and inherit the same community concern.

The architectural fix: the JWT carries an `is_adult` claim minted
from `users.is_adult`. Community-side surfaces (WordPress side or
the future community subdomain) reject JWTs where `is_adult` is
FALSE — the partner can still sign in to the Bible app, but
community surfaces return a "this surface requires age-verified
adult sign-in" page.

## JWT claim shape

Current Phase 4 JWT body (from the existing WordPress IdP):

```json
{
  "sub": "<wordpress_user_id>",
  "email": "<email>",
  "exp": <unix_ts>,
  "iat": <unix_ts>,
  "iss": "remnantofpromise.org",
  "partner_tier": "free|study_notes|extras|complete_study|everything"
}
```

S174 adds **two claims**:

```json
{
  "is_adult": true,
  "family_plan_id": "<uuid_or_null>"
}
```

- `is_adult` — mirrors `users.is_adult`. Community-side reads this
  claim and gates accordingly. Bible-app side ignores it (the
  reader is age-blind by design).
- `family_plan_id` — surfaces the family-plan relationship so the
  Bible-app side can render the **Family plan** section in /manage
  (the seat-owner sees their seat metadata, the owner sees the
  full seat roster).

The JWT-mint code path on the WordPress side reads the two values
from the API-side `users` table (via the existing WP-API push
flow, S37 or S42 HMAC path) at mint time. Stale JWTs (existing
mints before the claims land) treat the absent claims as
`is_adult = false, family_plan_id = null` — defensive default; a
partner whose JWT predates the rollout signs out + back in to pick
up the claims.

## Community-side enforcement

S174 is **spec-only** for the WordPress-side enforcement work. The
actual WordPress plugin / theme changes that read the JWT's
`is_adult` claim and gate community-surface routes are a separate
S17x wheel. This spec captures the contract: the JWT carries
`is_adult`, the contract is "community surfaces MUST gate on it,
Bible-app surfaces MUST NOT." Yoshi's call on which session opens
the WP-side enforcement work — possibly bundled with the
community.remnantofpromise.org architecture wheel when it unblocks.

## Age-verification mechanism — per-seat

`is_adult` is **owner-declared at invite time** and **confirmed at
acceptance** (per Q5). No government-ID-style verification (no
COPPA-compliance heavy-lift; the family-plan owner is the adult
billing partner who declares each seat's status). The owner takes
responsibility for the declaration when they invite each seat.

Edge cases covered by the acceptance-time confirmation:

  - **Owner mis-flags an adult as a minor at invite time.** At
    acceptance, an authenticated 18+ invitee can re-declare adult
    status (with a "this seat will have community access" warning
    before they confirm).
  - **Owner mis-flags a minor as an adult at invite time.** Less
    catchable — the minor would self-accept as adult. The
    owner's invite-time declaration is the responsibility line; the
    acceptance-time confirmation is best-effort. The
    voice-gated pricing-page copy carries an explicit "the
    billing-owner takes responsibility for declaring each seat's
    age status" line so the obligation is visible at purchase time.

Owner-only changes (Q9): the owner can update any seat's
`is_adult` from /manage's Family plan section. Changes propagate
on next JWT mint (sign-out → sign-in or token refresh, whichever
the WP-side ships).

# Voice-gated copy that S175+ will need

The following copy surfaces need voice-gate drafting before they
land. None is pinned in this spec — Yoshi authors at S175 open or
queues to the voice-gate batch pattern.

  1. **/pricing — Family-Plan card** (tier name, defining-gift line,
     bullet points, the "5 seats / 1 billing / per-seat
     bookmarks-notes-highlights" framing).
  2. **/pricing — Family-Plan responsibility disclosure** ("the
     billing-owner takes responsibility for declaring each seat's
     age status; minor seats have Bible-app access only, no
     community pathway, even when signed in").
  3. **/manage — Family Plan section** (header, seat-list framing,
     invite-button label, revoke-confirm language).
  4. **Invite email subject + body** — sender, framing, link copy.
  5. **/family/accept page** — landing copy for the invitee, the
     "you've been invited to..." block, the adult/minor
     confirmation prompt, the post-accept "you're now on the
     family plan" confirmation.
  6. **Community-side rejection page** (out of S174 scope but
     flagged) — the page a minor-seat partner sees when they
     navigate to a community surface; voice-aligned, not punitive,
     framing-aware ("this surface is for adult-verified accounts;
     your Bible app access continues without change").

# Open Yoshi-questions

  1. **Single family band or all three?** Ship V1 as Option A
     (Family-Companion $19.99 only) or all three bands (Library /
     Companion / Scribe)? The spec scales to either; Yoshi's call
     on launch-scope.
  2. **Pricing band specifically — Option A / B / C?** Default
     recommendation is Option A ($19.99 Family-Companion).
  3. **Naming — Family vs Household?** Default recommendation is
     Family.
  4. **Q31 disposition.** Default: Q31 (2-seat household) superseded
     by the family-plan tier; family-plan absorbs the household-
     value intent. Override: keep both as parallel offerings.
  5. **Adult/minor age threshold.** Default: 18 (US legal-adult
     baseline; aligns with COPPA's adult-supervised-child threshold
     of 13 less the conservative US-state legal adulthood baseline).
     Alternatives: 13 (COPPA), 16 (UK-aligned), 21 (US drinking-
     age conservatism).
  6. **Existing-account population default for `users.is_adult`.**
     The new column lands NULL for the existing population; what
     value should the back-fill set? Options:
     (a) `TRUE` for all (conservative: assume existing partners
     are adults — most are; minimal disruption);
     (b) `NULL` and gate community-side surfaces require an
     explicit one-time confirmation flow before granting community
     access (safer but adds friction for existing partners);
     (c) `NULL` and treat NULL as adult on the community-side until
     a partner explicitly self-declares minor (effectively (a) with
     a self-correction path).
     Recommendation: (a) for V1; revisit if any partner reports a
     mis-classification.
  7. **Invite-email transport.** WordPress's existing email plumbing
     (`wp_mail`)? A separate transactional provider (SendGrid /
     Postmark / Resend)? The Bible-app API doesn't currently send
     email — this is the first transactional-email surface.
  8. **Seat-revoke timing.** At-period-end (consistent with the
     existing cancel-at-period-end pattern; revoked-seat partner
     keeps Bible-app access through current period) or immediate
     (revoked-seat partner loses Bible-app access at the moment
     the owner revokes)? At-period-end is the consistent default.
  9. **Owner re-flagging a seat's `is_adult`.** Default: owner can
     change any seat's `is_adult` from /manage. Override: changes
     require seat-owner consent (a confirmation flow).
 10. **Founder-pricing interaction.** The existing founder-pricing
     locks an individual partner at their signup-tier price for
     life. Does founder pricing apply to the family plan? If yes,
     what's the founder-tier shape — first-N family-plan partners
     at a locked discount? If no, family-plan stays out of the
     founder offer. Default recommendation: no founder pricing on
     family-plan V1; revisit if uptake-data motivates it.

# Touch points to existing docs

  - **BIBLE_APP_ROADMAP.md §III Pricing** — gets a new "Family-plan
     tier" subsection inserted after the individual-tier ladder,
     before the "Four layered moves" block. The new subsection
     references this spec doc.
  - **BIBLE_APP_ROADMAP.md §V Phase 7** — phase definition expands
     to include the family-plan billing-aggregation tables, the
     invite flow, the JWT claim additions, and the community-side
     enforcement contract.
  - **BIBLE_APP_ROADMAP.md §IX Q31** — gets the "→ superseded by
     S174 family-plan tier per S174_FAMILY_PLAN_TIER_SPEC.md"
     annotation when this spec closes. Q31's working notes stay
     for the audit trail.
  - **BIBLE_APP_ROADMAP.md §IX — new Q41 (family plan)** — opens
     to track the Yoshi-decision questions above.
  - **data-schema/schema.sql** — Phase 7 region adds the two new
     tables + the two new columns per the SQL blocks above.
     Migration script per the S173 `_session173_apply_display_prefs.py`
     pattern (idempotent, run from Yoshi's terminal against prod
     Postgres before the new API endpoints resolve).
  - **WordPress-side JWT mint** — needs the two new claims
     (`is_adult`, `family_plan_id`). Read from `users` via the
     existing S37/S42 sync path.

# Multi-session build plan

S174: spec doc (this file).

**S175 candidates** (one wheel per session; ordering Yoshi's call):

  - **S175a — Schema migration.** `_session175_apply_family_plans.py`
     adds the `family_plans` + `family_plan_seats` tables and the
     two new columns. Idempotent. Runs from Yoshi's terminal
     against prod Postgres. Schema_version bumps to
     `1.0.0-phase7-session175`.
  - **S175b — JWT claim additions.** WordPress-side JWT mint reads
     `users.is_adult` + computes `family_plan_id` from
     `family_plan_seats`; API-side reads the new claims and
     surfaces them through `getSubscriptionMe()`'s response shape.
  - **S175c — Stripe family-plan price IDs.** Add the Family-
     Companion price ID (and Family-Library per
     Q1's resolution) to Stripe; wire the checkout flow on
     /pricing.
  - **S175d — Invite + accept flow.** API endpoints
     (POST /v1/family-plans/seats — invite,
     POST /v1/family/accept — accept), the email transport, the
     /family/accept page. Voice-gate copy at this session.
  - **S175e — /manage Family Plan section.** UI for the owner
     (seat roster, invite buttons, revoke confirmations) and for
     a seat-owner (read-only seat metadata, leave-plan button).
     Voice-gate copy at this session.
  - **S175f — Sanity suites + tsc clean + push.**

The community-side WordPress / future-community-subdomain
enforcement work is **out of scope for the family-plan build**.
That work is bundled with the eventual community-surface session
when it opens. The JWT-claim contract this spec lays down is the
forward-compatible hook.

# What this spec does NOT cover

  - **The actual community-side enforcement.** The JWT claim
     contract is here; the WordPress-side plugin / theme work that
     reads the claim and gates community routes is a separate
     wheel.
  - **Voice-gate authored copy.** Every reader-facing string the
     family-plan surfaces will carry — /pricing card, /manage Family
     Plan section, invite email, /family/accept page, community-
     side rejection page — is queued for the voice-gate batch
     pattern in S175+, not written here.
  - **COPPA / GDPR-K / age-verification regulatory compliance.**
     The owner-declared `is_adult` model is V1; if regulatory
     compliance later requires government-ID-style verification,
     that's a separate wheel.
  - **Bible-app surface differences for minors.** This spec leaves
     the Bible-app reader / strongs / lexicon / notes / bookmarks
     untouched for minor seats. If Yoshi later wants per-tier or
     per-age content filtering on the Bible app side (e.g., the
     dismantling units gated to 18+ within the Library tier), that's
     a separate wheel.
  - **Partner-discovery / referral / family-plan virality.** The
     /pricing-side discoverability of family-plan is V1 work; any
     referral-shape (an existing partner referring a family-plan
     buyer) is parked.
  - **Partner-to-partner messaging inside a family plan.** No DM
     surface; the per-seat separation is reader-state separation,
     not communication enablement.

# Closing posture

The family-plan tier is the first multi-account billing wrapper in
the architecture. It rides on top of the per-user reader-state
separation Phase 4 laid down — which means the spec stays small
(two new tables, two new columns, two new JWT claims) while the
partner-visible feature is large (5-seat family billing with
proper per-seat separation and account-level age gating that
forward-protects community surfaces). The architecture is paying
back the Phase 4 design choice.

Multi-session build cleanly downstream — schema first, JWT next,
Stripe + invite flow, /manage UI, sanity + push. The wheel is
predictable.
