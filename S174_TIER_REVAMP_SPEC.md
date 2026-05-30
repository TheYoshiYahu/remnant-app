S174 — Tier Revamp Spec (Library disclosure + Companion works-in-progress surfaces)

# REVISION NOTE — S174 final close

Yoshi reframed at the absolute end of S174: **"i dont want to create a
new email adress we might just nix the notion of founder, this are
all founder prices and may probably increase in the future but those
who get them now will retain prices for life."**

The reframe simplifies the founder concept substantially. Most of the
surfaces drafted below assume a "founder tier as relationship" design
that S175 must NOT execute as-written. The corrected reading:

  - **Scribe deletion STANDS** (anti-false-promise posture, unchanged)
  - **Library disclosure STANDS** (Surface 1 below — voice-aligned
    works-in-progress posture, independent of any founder framing)
  - **Companion card REVISED** (Surface 2 below) — drop the "Founder
    tier during beta" badge, drop the "Become a founder" button copy,
    drop the signed Yoshi paragraph. Replace with: current
    introductory pricing + permanent price-lock + concise WIP
    disclosure. Subscribe button stays plain "Subscribe — $9.99/mo."
  - **Companion confirmation modal REVISED** (Surface 3 below) —
    keep the WIP disclosure substance (paragraphs 1 + 2 + 4 + 5 stay,
    with founder-specific phrasing stripped); drop paragraph 3
    entirely (founder relationship + feedback channel commitment).
    Title becomes "Before you subscribe" or similar — no "founder"
    language.
  - **Founder feedback channel (Surface 4) DROPPED entirely.** No new
    email address. No WordPress contact form for founders. Q48 closed
    deferred. Partners reach Yoshi through existing remnantofpromise.org
    contact paths if/when they need to.
  - **/manage Founder section (Surface 5) DROPPED entirely.** No
    "You're a Founder" surface in /manage. Companion partners see
    their tier the same way Library / Study Notes partners see theirs.
  - **Scribe card removal (Surface 6) STANDS** (purely structural)

The drafts below are preserved unchanged for the audit trail but
should be read THROUGH the revisions above. S175 redrafts Surface 2
and Surface 3 against the simpler "current pricing window + permanent
price-lock" framing; skips Surfaces 4 + 5 entirely.

**Effective S175 scope:** Surface 1 (Library disclosure) + Surface 2
revised + Surface 3 revised + Surface 6 (Scribe removal). The four
surfaces ship as the tier-revamp payload; founder-tier UI surfaces
don't ship at all.

---



# What this spec covers

The S174 close-emergent tier revamp landed two halves at session
close. **The structural decisions landed live in BIBLE_APP_ROADMAP.md
§III + §IX Q40 closure + §IX Q48 lock:**

  - Scribe ($14.99) deleted entirely (anti-false-promise posture;
    deliverables too distant)
  - Companion ($9.99) opens to beta sale as the founder tier
  - Founder = relationship designation, not separate discount
  - Q40 fully closed (founder re-pointed at Companion)
  - Q48 locked to mechanism (b) WordPress contact-form surface
  - 1,000-slot founder cap retires (open-ended for beta phase)

**This spec captures the OTHER half — the voice-gated partner-facing
copy + UX surfaces S175 executes.** Six surfaces need authored copy:

  1. Library ($4.99) tier card disclosure — works-in-progress footnote
  2. Companion ($9.99) tier card copy — founder framing inline
  3. Companion post-click confirmation modal — full WIP statement
     + beta-phase + founder framing + price-lock guarantee + consent
     before payment
  4. Founder feedback channel — WordPress contact-form page copy +
     submission-confirmation copy
  5. /manage Founder section copy — for Companion partners who land
     on /manage; surfaces "you're a founder" + feedback channel link
     + WIP status
  6. /pricing tier-card removal — Scribe card deleted from the
     pricing surface

S175 executes each surface against the drafts below. Yoshi redlines
any draft before it ships. Voice gate runs on every line.

# Posture

The framework's honest-commerce posture rules out hidden-deliverables
copy. Every partner-facing string in this spec is honest about what's
shipping today vs what's coming. The framing pivot: from "buy this
tier and get X" to "partner with work in active build; here's exactly
what you're partnering with."

Three voice-gated principles applied:

  1. **No false promises.** Specifics ship in present tense; future
     work ships in honest "as it's authored" / "chapter-by-chapter"
     framing. Never a date binding I can't honor.
  2. **Skip is a real option.** The Companion confirmation modal
     surfaces a clean "not now" / cancel path — informed consent
     means real consent, not friction-as-coercion.
  3. **The text is always free.** Even the highest-paid tier carries
     the framework's anti-gating posture: the canon + extras +
     Strong's apparatus + free-tier framework threads + accessibility
     TTS all stay free. Paid tiers add depth, not access.

# Surface 1 — Library ($4.99) tier card disclosure

## Where it lands

`app/src/routes/Pricing.tsx` — Library tier card, small footnote
caption under the bullet list (above the Subscribe button).

## Voice-gated draft

> **Active build:** the extras library is live now (the four
> already-published Restored Names editions + the dismantling units
> shipping as authored). Framework cross-reference threads and
> chapter-by-chapter content land as each chapter is voice-gated.
> The catalog grows daily — your permanent price-lock travels with
> you for every update.

## Rationale

Library partners get the extras library NOW (Apocrypha + Jasher +
Enoch + Jubilees all shipped; the other ~46 books in the manifest
arrive as they're ingested). The chapter-end framework threads at
Layer 1 are ongoing-author work. The disclosure honors the
publish-then-edit cadence by surfacing it explicitly — the partner
sees what's live and what's growing.

The "catalog grows daily" phrase carries the same energy as the
Companion founder framing without using the "founder" word at
Library tier (which is reserved for Companion-during-beta).

# Surface 2 — Companion ($9.99) tier card copy

## Where it lands

`app/src/routes/Pricing.tsx` — Companion tier card. Becomes the
highest individual tier on the page (Scribe card removed entirely).

## Voice-gated draft

**Card header:**

> Companion — $9.99/mo
> *Founder tier during beta*

**Tier-content body** (the bullet list partners read):

> - Everything in Library, plus the framework synthesis layer
> - Chapter-by-chapter framework commentary on the canon (Matthew
>   1–11 shipping today; the rest of the canon arrives chapter-by-
>   chapter as each one is authored and voice-gated)
> - Hebrew-Greek interlinear — tap-a-word for the Westminster
>   Leningrad Codex Hebrew / Scrivener TR Greek with Strong's
>   number + transliteration + lexical entry
> - The BDB + Thayer's + Gesenius lexicons paired with Strong's
>   and the interlinear
> - The nikkudot-strip + grouped-column view
> - Framework-bearing cross-reference threads at Layer 2 —
>   anchored on the Tanakh + extras sources rather than Reformation-
>   grammar TSK

**Founder relationship line** (callout below the bullets, above the
Subscribe button):

> **The Companion tier during beta is the founder tier.** You
> partner with work in active build. You see chapter-by-chapter
> progress as it ships. You have a feedback channel back to me that
> shapes what gets built next. — Yoshi

**Subscribe button:** "Become a founder — $9.99/mo"

## Rationale

The "founder tier during beta" badge replaces the marketing-y "Most
Popular" / "Recommended" labels competing tools use. It's
specifically a TIME-BOUND designation — every Companion partner
during the beta phase IS a founder; the relationship is concrete
and time-stamped.

The founder line is signed "— Yoshi" because the relationship is
literally a partnership with him personally (founders' feedback
goes to him directly per Q48). The signature is the framework's
honest-relationship posture made explicit.

The Subscribe button copy shifts from generic "Subscribe" to
"Become a founder — $9.99/mo" so the partner's commitment frame
matches the relationship they're entering. After they click, the
confirmation modal (Surface 3) is what they actually consent to
before payment.

# Surface 3 — Companion post-click confirmation modal

## Where it lands

`app/src/routes/Pricing.tsx` — new modal triggered by clicking
"Become a founder" on the Companion card. Displays BEFORE the
Stripe Checkout redirect fires. Partner must click Continue
(consent) or Cancel (back to /pricing). New file probably:
`app/src/components/FounderConfirmationModal.tsx`.

## Voice-gated draft

**Title:**

> Before you become a founder

**Body — paragraph 1: what's shipping today**

> The Companion tier carries the framework synthesis layer — the
> commentary that reads the canon through the restored framework,
> the Hebrew-Greek interlinear, the BDB + Thayer's + Gesenius
> lexicons paired with Strong's, the nikkudot-strip view, and the
> Layer-2 framework cross-reference threads. Matthew 1–11 is
> shipping today. The interlinear and lexicons are landing in the
> launch-blocking sprint.

**Body — paragraph 2: what's growing**

> The rest of the canon's framework commentary lands chapter-by-
> chapter as I author each one and voice-gate it through the
> framework standards. The Layer-2 thread library grows the same
> way. Some chapters are days away; others are weeks; the canon
> takes time to walk through honestly. I work daily.

**Body — paragraph 3: the founder relationship**

> The Companion tier during beta IS the founder tier. You're not
> buying a finished product. You're partnering with work in active
> build. You fund the daily author-and-ship cadence; you see
> progress as it ships; you have a feedback channel back to me
> that shapes what gets built next. The feedback channel lives at
> remnantofpromise.org/founder/feedback after you sign up — submit
> thoughts, questions, requests; I read every one personally.

**Body — paragraph 4: price-lock**

> Your $9.99/mo is locked for life. Every chapter that ships, every
> book that lands, every feature that comes online — all of it
> reaches you without an upcharge for as long as you stay a
> partner. The price you pay today is the price you pay forever.

**Body — paragraph 5: the honest skip**

> If "work in active build" isn't what you want today, that's the
> right call to make now. The text is always free. The free tier
> carries the restored canon, the framework cross-reference seeds,
> the Strong's apparatus, the public-domain reference library, and
> the native TTS audio. You can come back to the Companion tier
> any time.

**Action row:**

> [ Continue to checkout ] *(primary action)*
> [ Not yet — back to pricing ] *(secondary action)*

## Rationale

Five paragraphs because the commitment is substantive — informed
consent before payment is the framework's honest-commerce posture
in action. The partner reads what they're partnering with in plain
prose, not marketing register.

Paragraph 3's "I read every one personally" makes the feedback
channel relationship concrete. This is the literal commitment
behind the Q48 mechanism — Yoshi reads + triages.

Paragraph 5 ("the honest skip") is critical voice work. The
framework refuses to use friction-as-coercion at the payment point.
A partner who exits at the modal isn't a lost sale — they're a
partner who walked away from a real consent moment. That's the
right thing to happen.

# Surface 4 — Founder feedback channel (WordPress)

## Where it lands

WordPress side: `remnantofpromise.org/founder/feedback` route. New
WordPress page + plugin extension that validates the SSO JWT on
submission, checks the partner's tier === complete_study + status
in active/trialing, accepts the submission, writes to a custom
table or custom-post-type.

## Voice-gated draft — page copy

**Page title:** Founder Feedback

**Intro paragraph:**

> This page is for Companion-tier founders. You're partnering with
> work in active build, and your thoughts shape what gets built
> next. Tell me what's working, what's not, what you wish were
> different, what you wish were here. I read every submission
> personally and triage them into the build queue.

**Form fields (voice-checked labels):**

  - Subject (text input) — "What's this about?"
  - Body (textarea, 10+ rows) — "Tell me your thought"
  - Submit button — "Send it"

**Submission confirmation message:**

> Received. I'll read this and add it to the queue. If it warrants
> a direct response I'll reach out at your account email; if it's
> a build-direction thought it'll show up in the work as it lands.
> Thank you for partnering with this. — Yoshi

**Non-founder error page** (shown if a non-Companion or anonymous
visitor hits the URL):

> This page is for Companion-tier founders. If you're not on the
> Companion tier yet, the doorway is at
> remnantofpromise.org/bible/pricing.

## Rationale

The "Send it" button copy refuses the corporate-form pattern
("Submit Feedback" / "Send Message") in favor of the conversational
register. The framework's voice is honest and direct — even the
form button reflects that.

The confirmation message is short and concrete: I'll read it; if it
needs a response you'll get one; if it shapes the build you'll see
it land. No "thank you for your valuable input" boilerplate.

The non-founder error page is honest about the tier-gate without
being condescending — and provides the doorway link for visitors
who want to become founders.

# Surface 5 — /manage Founder section

## Where it lands

`app/src/routes/Manage.tsx` — for Companion-tier partners (tier ===
'complete_study' AND status IN ('active', 'trialing')), render a new
section below the existing partnership summary that surfaces the
founder relationship explicitly.

## Voice-gated draft

**Section header:** You're a Founder

**Body:**

> The Companion tier during beta is the founder tier. You're
> partnering with framework commentary chapter-by-chapter as it
> ships, the Hebrew-Greek interlinear + lexicons as they land,
> and the Layer-2 thread library as it grows.

**Build-status surface** (optional — could land as a separate
sub-section if Yoshi wants):

> What's shipping right now:
> - Matthew 1–11 (live)
> - Interlinear + lexicons (launch-blocking sprint)
> - Layer-2 thread library (growing weekly)

**Feedback channel link** (callout button):

> [ Send Yoshi a thought ]
> Opens remnantofpromise.org/founder/feedback in a new tab; your
> SSO session carries through.

## Rationale

The /manage Founder section closes the loop on the founder
relationship. The partner who subscribed via the confirmation modal
now sees the same relationship language at /manage every time they
check their account — the framing is consistent across the
partner's whole experience.

The build-status surface is honest about WIP without committing to
specific dates. "Growing weekly" is honest (the threads ARE growing
weekly); "launch-blocking sprint" is honest (interlinear + lexicons
are in the Phase 9 launch-blocker list per §III).

# Surface 6 — /pricing tier-card removal (Scribe)

## Where it lands

`app/src/routes/Pricing.tsx` — find the Scribe ($14.99) tier card
JSX and delete the entire block. The page becomes 4 cards: Free /
Study Notes / Library / Companion.

## What also touches

Any /pricing copy that mentions "$14.99" or "Scribe" or "Everything"
gets removed or updated. The "compare to Logos" framing line (if
present on /pricing) updates to reflect the new top tier being
Companion vs Logos Premium.

`app/src/routes/Manage.tsx` — the TIER_LABELS dict keeps the
`everything: "Scribe"` mapping for backward compatibility (any
historical subscription rows with `tier = 'everything'` should
still render readably in the audit trail), but the active tier
shown to a new partner can never be Scribe again.

`api/models.py` — `PartnerTier` enum keeps `everything` value for
backward compat; new Stripe checkouts never select it.

# S175 build wheel — implementation order

When S175 opens this work:

  1. **Spec review with Yoshi.** Read this doc; redline any draft
     copy. Don't ship a single string until Yoshi has eyes on it.
  2. **Surface 6 first** — Scribe card removal. Smallest scope;
     unblocks the layout shift on /pricing before adding new
     surfaces.
  3. **Surface 1** — Library disclosure. Single-line addition.
  4. **Surface 2** — Companion card rewrite. Includes the founder
     badge + "Become a founder" button copy.
  5. **Surface 3** — Companion confirmation modal. New component
     file; new state in Pricing.tsx; click-handler intercept before
     Stripe checkout.
  6. **Surface 5** — /manage Founder section. Renders for
     Companion-tier partners.
  7. **Surface 4** — WordPress founder feedback page. Separate WP-
     side wheel; needs the bible-companion plugin extension OR a
     new small plugin. Can land same-session as S175 or as a
     follow-on wheel depending on Yoshi's bandwidth.

# Voice gate — every line through the skill

Every string in this spec passes the 12-point editorial checklist
and the 12 Red Lines before it ships. The yoshi-voice skill stays
loaded for the duration of S175's execution session. Anything that
sounds marketing-puff, sales-y, or gate-y gets redlined before it
lands. The framework's posture is honest, direct, non-imposing.

# What this spec does NOT cover

  - Voice-gated copy for non-founder tiers' tier cards (Free, Study
    Notes) — those copy lines don't change at S174 close.
  - Pricing.tsx structural code beyond the Scribe-card removal +
    the Companion card additions + the new modal. The layout
    grid + card-component shape stay as-is.
  - The Stripe price ID configuration for Companion at beta —
    needs Yoshi to create the new Stripe product OR re-point an
    existing one. Probably the existing `complete_study` price ID
    works for both monthly + annual; the Companion-during-beta
    designation is partner-facing copy, not a Stripe-side
    distinction.
  - The bible-companion WordPress plugin extension for the
    founder feedback page — that's a separate WP-side spec.
  - The /manage Founder section's build-status surface format
    if Yoshi wants a richer "what's shipping this week" feed
    later. The V1 draft is static-paragraph; a dynamic feed is
    V1.1+.
