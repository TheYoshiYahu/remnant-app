# Pricing & Ministry-Revenue Strategy — Remnant / More Than Milk Bible App

**Prepared for:** Yoshi (Remnant of Promise / More Than Milk Ministries)
**Date:** 2026-06-11
**Scope:** READ-ONLY analysis. No app code, migrations, or other worktrees touched. This file is the only write.
**Nature of this report:** A **strategic recommendation + a framework to run later.** Yoshi has no current operating numbers (users, conversion, churn, MRR, cost) yet, so this is deliberately *not* a quantitative profit calc. It gives a directional call now, and a break-even worksheet to drive once data exists.

---

## The lens this report optimizes for

This is a **ministry that needs revenue to fund the building of a church.** The goal is **not** to minimize price or maximize "accessibility" at revenue's expense. The governing principle is Paul's in **1 Corinthians 9:9-14** — *"You shall not muzzle the ox while it treads out the grain… those who preach the gospel should live from the gospel."* Charging fairly to fund the work is **right and intended**, not a necessary evil.

So the optimization is a **both/and, not a tradeoff**:
- **Free "milk"** — generous enough to draw people in, build trust, and serve the Great Commission. You don't charge a seeker for the gospel or for the plain Word. This is the funnel and the ministry's open door.
- **Paid "meat"** — the deep cross-reference apparatus, interlinear/Strong's, the restored library, compare-versions depth, and the teachings — **priced to genuinely fund the mission, not undersold.** This is the ox treading the grain. Pricing it confidently is faithful stewardship, not greed.

The whole report below is written to that target: **maximize sustainable ministry revenue *while* staying reachable** — reach *and* funding, deliberately held together.

---

## TL;DR (Bottom Line Up Front)

1. **Do NOT collapse to a flat $4.99-everything plan.** Under the "don't muzzle the ox" lens it's the wrong move: it **undersells your costliest, most differentiated assets** (the interlinear/lexicon stack, the full thread apparatus, the teaching corpus) by pricing them the same as public-domain books, and it **caps your revenue ceiling** right when the explicit goal is to fund a church. Simplicity is worth pursuing — but buy it by going to **two clear tiers**, not by discounting the meat to one low price.

2. **Recommended structure: a generous Free funnel + two confident paid tiers ("Partner" and "Scholar").** Keep the milk open and trust-building; price the meat to fund the work. Retire the fee-poor $1.99 tier (it loses ~18% to Stripe's fixed fee and adds menu paralysis) by folding it up into the primary paid tier.

3. **Strengthen the free tier in ONE specific way — not by giving away more breadth, but by letting people *taste the meat*:** fully unlock **one flagship book** (Romans is complete and central) with its commentary + thread apparatus as a permanent "full-meal sample." This serves the Great Commission funnel *and* converts better than scattering more free content — at zero marginal cost to you.

4. **Add ministry-native revenue depth that raises the ceiling without raising the floor:** an annual nudge, a voluntary **Patron/Benefactor** tier or one-time "support the work" gift for those who *want* to give more, the founder price-lock as honest urgency, and group/household licensing. These let the willing fund the mission generously while seekers still walk in free.

5. **Keep the break-even framework (Part 2 + Appendix) for later.** The moment you have a paying-user mix, you can compute whether any pricing move helps or hurts revenue. Today it's a tool, not a verdict.

---

## Part 1 — The Actual Current Pricing & Tiers (verified from code)

Source of truth: `app/src/routes/Pricing.tsx`, `api/auth.py`, `api/main.py`, `data-schema/schema.sql`, and `data-schema/migrations/session206_founder_pricing.sql`.

### 1.1 The tier ladder

One canonical **strict-chain** ladder (each tier inherits everything below), enforced by `tier_satisfies()` (`schema.sql:728-751`):

```
free (0) < study_notes (1) < extras (2) < complete_study (3) < everything (4)
```

| Display name | Backend slug | Monthly (founder, live) | Annual (founder) | "Later" price (display-only) |
|---|---|---|---|---|
| **(Free reader)** | `free` | $0 | $0 | — |
| **Study Notes** | `study_notes` | **$1.99** | $19.90 | $2.99 / $29.90 |
| **Library** | `extras` | **$4.99** | $49.90 | $7.77 / $77.70 |
| **Companion** (highlighted) | `complete_study` | **$7.49** | $75.00 | $12.99 / $129.90 |
| Scribe (hidden — card not rendered) | `everything` | — | — | — |

Economically relevant facts:
- **Current live prices ARE the "founder" prices;** the struck-through higher numbers are display-only placeholders (`Pricing.tsx:42-51`) and bill nothing. A **permanent price-lock** freezes each subscriber's rate at signup (`subscriptions.locked_price_cents`, `schema.sql:35-42`) — a legitimate "reward the early supporters, raise later" lever.
- **Annual ≈ two months free** (~17% off).
- **Native iOS/Android shells hide checkout and bill on the web** (`Pricing.tsx:126-143`) — deliberately **dodging the 15–30% App Store / Play tax.** Keep this; it's real margin that stays in the ministry.
- **Scribe (`everything`) is hidden, yet the Teaching Corpus / "concepts" still default to `tier_required='everything'`** (`schema.sql:372`) — i.e. that content is currently **unsellable** because no visible tier reaches it. Fix this regardless of the pricing decision; it's stranded revenue.

### 1.2 The exact free-vs-paid split — what's "milk" and what's "meat" today

**FREE today (the milk — anonymous or signed-in):**
- The **entire 66-book canon**, full text, all chapters.
- **Restored / Sacred Names** — the only edition, never gated (the sacred-name *mask* is a free display preference).
- **Baseline cross-references** (free by default since Session 73) — though **curated framework thread callouts** can carry a higher per-row tier.
- **The Appointed Times calendar** (client-side; no gate), **Today hub, devotionals, prayers**, **compare-versions**, **The Witness / The Kingdom** overlays, **basic Strong's**, **verse search**, **native-OS TTS audio**, **bookmarks / reading position / display prefs**.
- Capped personal study: **10-note cap (append-only, no tags)** and **1 highlight color** — the only quantitative free limits.

**PAID today (the meat):**

| Feature (the "meat") | First tier that unlocks it |
|---|---|
| Framework commentary — basic/inline (canon) | **Study Notes ($1.99)** |
| Curated cross-reference thread callouts | **Study Notes → Companion** (per-row) |
| Apocrypha (KJV-1611, 14 books) | **Study Notes ($1.99)** |
| **Full restored library** — Enoch, Jubilees, Jasher, Charles vol 1, Apostolic Fathers, apocryphal NT, Ascension of Isaiah, Josephus (~87 books) | **Library / extras ($4.99)** |
| Deeper-dive commentary on the restored library | **Companion ($7.49)** |
| **Interlinear + full lexicon** (BDB, LSJ, Gesenius, Vincent's) | **Companion ($7.49)** (`main.py:2556, 3214`) |
| **Study tooling** — Nave's, TSK, maps/places, tool annotations | **Companion ($7.49)** (`main.py:3421`) |
| Deeper Statement-of-Faith sections | **Companion ($7.49)** |
| Teaching Corpus / "concepts" | **Scribe / everything** (currently unreachable) |

**Read:** Your architecture is already "milk free, meat paid," and your wedge is split across the line — restored-names and *baseline* cross-refs are free (funnel + trust), while the *deep* apparatus, interlinear, library, and teachings are paid (the ox's grain). The instinct is right. The open questions are: **(a) is the meat priced confidently enough to fund the mission, and (b) does the free tier let people taste enough meat to want it?**

---

## Part 2 — The Revenue Framework (a tool to run later, not a calc today)

You have no operating numbers yet, so this section is **the framework you'll drive once you do** — plus what it already tells us *directionally* about a flat $4.99 plan.

### 2.1 What a flat $4.99-everything plan actually does to revenue

A single $4.99-unlocks-all plan is three different price changes at once:

| Current buyer | Today | Under $4.99-flat | Effect on the ministry's revenue |
|---|---|---|---|
| Study Notes buyer | $1.99 | $4.99 | +151% price — keep the willing, lose the rest to free |
| Library buyer | $4.99 | $4.99 | unchanged price, *more* value given away |
| Companion buyer | $7.49 | $4.99 | **−33% — pure discount on your top supporters** |
| Free user on the fence | $0 | $4.99 | simpler offer → conversion likely rises |

The move **trades away the premium your most committed supporters already pay, and gives your scholar-grade tools away at library price, in exchange for a simpler offer.** Under a "fund the church" mandate, the giveaway side of that trade is exactly what you *don't* want. **Directional conclusion: flat $4.99 is the wrong instrument here** — not because simplicity is bad, but because it buys simplicity by underselling the meat.

### 2.2 The break-even formula (drive this when you have data)

Let `Nc` = current paying users, `ARPUc` = blended revenue per paying user, `Nf` = payers under a new plan. For a text app your marginal cost per user is near zero (§2.4), so compare **revenue**:

```
New plan nets more when:   Nf × (new price)  >  Nc × ARPUc
⇔   Nf / Nc  >  ARPUc / (new price)         ← the required user multiplier Z
```

With paying-mix shares `a` (Study Notes), `b` (Library), `c` (Companion), `a+b+c = 1`:

```
ARPUc = 1.99·a + 4.99·b + 7.49·c
Z (for a $4.99 plan) = ARPUc / 4.99
```

- `ARPUc < $4.99` → `Z < 1` → a $4.99 plan would raise revenue *even with fewer payers* (it lifts ARPU off a cheap-heavy base).
- `ARPUc > $4.99` → `Z > 1` → a $4.99 plan is a price cut needing `Z×` the payers just to break even.

### 2.3 Sensitivity table (read your row once you know your mix)

| Paying mix (SN / Lib / Comp) | Blended ARPUc | Z = ARPUc/4.99 | A $4.99 plan would… |
|---|---|---|---|
| 60 / 30 / 10 (cheap-heavy) | $3.44 | 0.69 | win even losing 31% of payers |
| 40 / 40 / 20 | $4.09 | 0.82 | win even losing 18% of payers |
| 33 / 33 / 33 (even) | $4.82 | 0.97 | ~break-even on user count |
| 30 / 50 / 20 (library-centered) | $4.59 | 0.92 | win with slightly fewer payers |
| 20 / 30 / 50 (premium-heavy) | $5.64 | 1.13 | need +13% more payers |
| 10 / 20 / 70 (Companion-dominant) | $6.49 | 1.30 | need +30% more payers |
| 0 / 0 / 100 (all Companion) | $7.49 | 1.50 | need +50% more payers |

**Important nuance for the ministry lens:** even in the rows where $4.99-flat would "win on raw revenue" (top rows), that's only true *against today's prices*. It still leaves money on the table versus a **two-tier** structure that keeps a higher Scholar price — which is the real comparison you care about. Break-even-vs-today is necessary but not sufficient; you want the structure that funds the work *best*, not merely *better than the status quo*.

### 2.4 Why volume is cheap — and why that helps the mission

This is a **text app**: static content, cached server-side (6h, S231), mirrored to on-device IndexedDB; the calendar's astronomy runs in-browser. **Marginal cost per user is cents/month, dominated by fixed hosting + Postgres + domain.** Two implications:
- **Adding paying supporters is almost pure funding** for the church — the revenue isn't eaten by per-user cost.
- **"Should more be free?" is not a cost question** — free users are cheap to serve. It's purely a funnel/conversion question (Part 3).

### 2.5 The Stripe-fee wrinkle (independent reason to retire $1.99)

Stripe takes **2.9% + $0.30**. The fixed 30¢ guts cheap plans:

| Plan | Gross | Net after fee | Fee load |
|---|---|---|---|
| $1.99 | $1.99 | **$1.63** | **18.0%** |
| $4.99 | $4.99 | $4.55 | 8.9% |
| $7.49 | $7.49 | $6.97 | 6.9% |

The **$1.99 tier loses 18% to fees** — your worst unit economics, and a poor way to fund a ministry. Fold it up. (Annual billing helps everywhere: one 30¢ hit per year, not twelve — and better cash up front for building.)

---

## Part 3 — The Free Tier: Generous Milk as Funnel and Open Door

### 3.1 The ministry framing

Free here is **not** revenue forgone — it's the **Great Commission funnel and the trust-builder.** Paul waived his right to support *when a fee would burden the seeker or obscure the gospel* (1 Cor 9:12, 18), even while affirming the right to be supported. That's exactly the milk/meat split: **the plain Word and the open door cost nothing; the deep apparatus that took years to build is the ox's grain and is fairly priced.** A generous free tier is faithful to *both* halves.

### 3.2 Your free tier is already strong and well-aligned

You already give away the full canon, the restored-names edition, baseline cross-refs, the calendar, the Today hub, the Witness/Kingdom overlays, basic Strong's, search, and audio. For a Bible app that's a **more generous open door than most paywalled competitors** — good for the funnel and good for trust, and it differentiates you from the "another app that paywalls Scripture" complaint your competitive research flagged. **Don't broaden it for its own sake;** the milk is already plentiful, and over-broadening would only erode the funding you need.

### 3.3 The one high-leverage free change: a "full-meal sample"

Today the deep apparatus is **shown-but-locked** — free users see greyed thread callouts and "unlock in Companion" pills. That shows *architecture* but never lets anyone *taste* the payoff, so it doesn't prove the meat is worth paying for. A locked thread sells nothing; a *read* thread sells the whole apparatus.

**Recommendation: permanently unlock ONE flagship book** — full commentary + the curated thread apparatus (optionally interlinear on that book) — as the free taster. **Romans** is the natural pick (complete: 91 threads / 285 members; theologically central to the restored-names case). This is the literal "More Than Milk" funnel — free milk *plus one full meal* — and it converts better than breadth-dumping, at zero marginal cost. It serves the Commission *and* funds the work by turning tasters into supporters.

### 3.4 One friction fix

The free **10-note cap is append-only / no-edit** — that can read as *broken* rather than *limited* and breeds the very resentment you want to avoid in a ministry app. Consider **allowing edit/delete within the 10-note cap**, keeping tags / collections / export paid. Same conversion pressure, less "this app is hobbling me." (1 highlight color is harmless — leave it.)

---

## Part 4 — Recommendation

### 4.1 The call: generous Free funnel + two confident paid tiers ("Good / Better")

Keep the structure tiered, but **simplify to two paid options and price the meat to fund the mission.** Do not flatten to one low price — that undersells the work.

| Tier | Suggested price | Unlocks | Replaces |
|---|---|---|---|
| **Free** | $0 | Current free **+ one fully-unlocked flagship book** (Romans: commentary + threads) | unchanged + sample |
| **Partner** (primary) | **$5.99–$6.99/mo · ~$59–$69/yr** | Full restored library + **all** framework commentary + **the complete cross-reference thread apparatus** (your wedge) | folds in Study Notes **and** Library |
| **Scholar** | **$9.99–$12.99/mo · ~$99–$129/yr** | Everything in Partner **+ interlinear + full lexicon + study tooling + Teaching Corpus** | today's Companion + the stranded Scribe content |

Why this best serves *sustainable ministry revenue while staying reachable*:
- **It does not undersell the meat.** The scholar-grade tools — your most differentiated, most expensive-to-build assets — sit at a price that reflects their value and funds the work. That's "don't muzzle the ox" in practice. (Your own display-only "later" prices already point this direction — $7.77 / $12.99 — so this isn't a leap; it's leaning into a ceiling you'd already sketched.)
- **It keeps the offer simple and the funnel wide.** One obvious "this is the app" Partner tier built around your wedge, one clear step up for serious students, and a generous free door. Far less menu paralysis than four SKUs.
- **It retires the fee-poor $1.99 tier** (18% fee drag) and **rescues the stranded `everything` content** by giving the Teaching Corpus a tier that can actually reach it.
- **It honors the founder price-lock** — early supporters keep their rate; new pricing applies going forward. That's both fair and a legitimate urgency lever ("lock the founder rate now").

On the exact numbers: I've pegged Partner above $4.99 deliberately, because under a "fund the church" mandate the goal is the **highest fair price the value supports**, not the lowest. $5.99–$6.99 keeps you in the impulse-friendly sub-$7 band while meaningfully out-earning $4.99. Scholar at $9.99–$12.99 matches the depth (the study-tool market — Logos, Accordance — is *far* pricier; you're not expensive, you're fair). Tune within these bands as data arrives.

### 4.2 Raise the ceiling without raising the floor (ministry-native revenue)

These let the *willing* fund the mission generously while the seeker still walks in free — squarely in the "live from the gospel" spirit:
- **Annual nudge** — better cash up front for building, better retention, fewer fee hits. Make annual the visually-default choice.
- **Patron / Benefactor option** — a voluntary higher tier (or a one-time "support the work" gift / tithe button) for partners who *want* to give beyond the price. Many ministry users prefer to give more; let them. Pure upside, no floor change.
- **Founder price-lock as honest urgency** — "these founding-partner rates lock for life" is true and motivating; surface it.
- **Group / household / church licensing** — the family-plan tier is already specced (`S174_FAMILY_PLAN_TIER_SPEC.md`); a small-group or congregation license turns one church into many partners at once — natural fit for a church-building ministry.

### 4.3 If you still want maximum simplicity (single price)

If you decide one price is worth it for brand/clarity, **set it at the value of the meat, not the floor** — i.e. a single **~$7.99–$9.99 "everything" plan**, not $4.99. That keeps faith with "don't muzzle the ox" while getting the one-decision simplicity. A $4.99 single price would fund the mission *least* of all the options here and is not recommended. Whatever the count, **still unlock one flagship book free** and **honor the existing price-lock** for current Companion subscribers.

### 4.4 What NOT to do

- **Don't flatten to $4.99-everything.** It's the lowest-revenue structure on the table and gives your costliest assets away cheaply — the opposite of the stated goal.
- **Don't keep four tiers.** $1.99 has 18% fee drag and adds paralysis; Scribe is stranded. Four options is complexity *and* a dead SKU.
- **Don't broaden free content for its own sake.** The milk is already generous; deep-sample (one book) beats breadth-dump for both Commission and conversion, at no cost.

### 4.5 Risks, named

| Choice | Main risk | Mitigation |
|---|---|---|
| **Two-tier, meat priced up (recommended)** | Higher price could dampen raw conversion vs. $1.99/$4.99 | Generous free funnel + one-book taster + founder-lock urgency; price within impulse bands; watch conversion once you have data |
| **$4.99-flat** | Undersells the work; caps the ceiling; discounts top supporters | (Not recommended under this lens) |
| **Single ~$7.99–$9.99 plan** | Loses the cheap on-ramp; some price-sensitive seekers stay free | Acceptable if you weight simplicity highly; free tier still serves them |
| **Status quo (four tiers)** | $1.99 fee drag, paralysis, stranded Scribe, undersold meat | Consolidate to two + lift the meat |
| **Unlock a flagship book free** | A few users satisfied by one book | Far outweighed by trust + taste-of-meat conversion |

---

## Appendix — Drive-it-yourself worksheet (run when you have data)

```
INPUTS (fill in when known)
  Nc   = current paying users ............................ ______
  a    = share on Study Notes ($1.99) ................... ______ %
  b    = share on Library ($4.99) ....................... ______ %
  c    = share on Companion ($7.49) ..................... ______ %   (a+b+c = 100%)
  P    = proposed primary price ......................... $______
  L    = believed conversion lift from the new structure
         (extra payers vs. today, %) .................... ______ %

COMPUTE
  ARPUc = 1.99·a + 4.99·b + 7.49·c ...................... $______
  Z     = ARPUc / P ..................................... ______

DECIDE (revenue-vs-today)
  If Z < 1  → the new price raises revenue even with fewer payers.
  If Z ≥ 1  → it wins only if  L > (Z − 1)·100%.

THEN APPLY THE MINISTRY LENS (the real test)
  Beating today is necessary, not sufficient. Compare the TWO-TIER structure
  (Part 4.1) against any flat option: the tiered structure should out-fund the
  flat one in every mix where you have ANY Scholar-tier demand — because it
  captures the meat's value instead of discounting it. Choose the structure
  that funds the work best while keeping the free door wide, not merely the
  one that beats the status quo.

NET-OF-FEE refinement (more accurate)
  Use net prices: 1.99→1.63, 4.99→4.55, 7.49→6.97. This makes the cheap tier
  look even worse and reinforces folding it up.
```

*Feature→tier facts were read from the `feat/compare-versions` branch (`api/`, `app/src/`, `data-schema/`). Elasticity benchmarks referenced in this analysis come from the repo's existing `PRICING_TIER_ANALYSIS.md` (RevenueCat / Adapty 2025). User-count, conversion, churn, and MRR figures are inputs only Yoshi holds; the report gives a directional call now and a worksheet to confirm it later.*
