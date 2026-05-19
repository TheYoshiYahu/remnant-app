# Bible-App Competitive Landscape — S80 Analysis

Authored S80, 2026-05-18. The detailed competitive analysis Yoshi requested to test the
tier-matrix strategy. This file is the authoritative competitive intel for future tier
and pricing decisions until refreshed.

---

## 1. The Competitive Field (current as of May 2026)

### Mass-market FREE Bible apps

**YouVersion (Bible App / Bible.com).** 1 billion+ installs. 3,750+ versions in 2,400+
languages. Reading plans, audio, sharing, social features. **Zero monetization** — no
subscription, no premium tier, no ads, no in-app purchases. In March 2026 they launched
**YouVersion Platform**, giving the engine away for free to any ministry or developer
who wants to embed Scripture into their own app. They're commoditizing the basic
Bible-reading layer at the infrastructure level. They have no reason to chase paid tier
features because their entire model is free + donations.

**Blue Letter Bible (BLB).** ~10M annual users, 500M page views. **Fully free**, no
premium tier, no ads, no in-app purchases. Strong's lexicon, Hebrew/Greek interlinear,
commentaries (recently added the Scofield Reference Notes Feb 2026), and 1.5M sermons
via SermonAudio partnership (added 2026). **This is the existing free-tier serious-study
competitor.** Anyone wanting lexicons + interlinear for $0 has BLB.

**Tecarta / Life Bible.** Free base app with à la carte version purchases (NLT $7.99,
NKJV $12.99, The Message $5.99) plus a Premium subscription unlocking 150+ translations
+ Study Bibles + Commentaries. Subscription pricing not surfaced in available results.

### Mass-market PAID subscription Bible apps

**Bible Gateway Plus.** $6.99/mo or $69.99/yr (sometimes promo to $34.99/yr first year).
Free 7-day trial. 30+ study Bibles (NIV Application, NIV Study, NKJV MacArthur, CSB Tony
Evans), 50+ commentaries (Believer's Bible Commentary, Expositor's Bible Commentary,
NIV Application), dictionaries (Mounce's, Vine's, Zondervan Illustrated). $2,300 worth
of resources for the subscription price. **Most direct mainstream subscription competitor
at the mid-tier.**

**Olive Tree Bible.** $5.99/mo, $29.99/six-mo, or $59.99/yr. 14-day free trial. Free
base app with hundreds of free resources; thousands of paid resources via à la carte
purchase plus subscription tier. Resource Guide links commentaries, maps, study notes
inline to verses. Premium HarperCollins-owned.

**Logos Bible Software (Logos NEW subscription model, 2024+).** Three tiers:
- **Logos Premium** — **$9.99/mo or $99.99/yr** — "small group prep" use case
- **Logos Pro** — $14.99/mo or $149.99/yr — "sermon prep" use case
- **Logos Max** — $19.99/mo or $199.99/yr — "academic + original language" use case

Plus library packages purchased separately (Bronze $300, Silver $700, Gold $1500,
Platinum $3000+) — books bought are owned forever. **Logos Premium at $9.99 is the
critical data point — it's a direct match, not an undercut, at our $9.99 price point.**

**Accordance.** Basic Starter $49.90 one-time, with à la carte resource packages from
$50–$500+. Mobile + desktop. No subscription tier surfaced.

**e-Sword.** Free PC desktop. Mobile (e-Sword LT) $2.99 one-time on iOS, $2.99 on
Android. Strong's, Hebrew/Greek lexicons, TSK cross-references, commentaries — all
bundled. The free-desktop power-user choice.

### Restored Names / Hebrew Roots / Messianic apps (our actual niche)

**Cepher.** Print Bible $95 one-time. App: **Cepher Abridged Edition free**; **The
Cepher (full) $22 one-time** with all future updates included, sync across devices,
highlighting in 7 colors, Hebrew lexicon of transliterated words. 87 books including
Enoch, Jubilees, Jasher, Baruch, Apocrypha. Yahuah/Yahusha/Ruach Ha'Qodesh restored
plus 3,100+ Hebrew names transliterated. **No subscription model.** One-time purchase
is their pattern.

**Yah Scriptures app.** **Free.** Restored Hebrew names, removes pagan titles, 103 books
(66 canon + 37 Apocrypha), basic bookmarks/notes, offline access, no ads. Direct free
competitor in our niche.

**HalleluYah Scriptures.** Print-primary (multiple editions: standard, large print,
pocket, waterproof, Hebrew/English parallel, leather, children's, audiobook). No
significant app presence.

**ISR Scriptures ("The Scriptures").** Sacred Name translation distributed via scripture
software programs as a download. Not a standalone app.

---

## 2. Critical Findings

### Finding 1 — The restored-names niche has NO subscription competitor.

Every major restored-names option is either free (Yah Scriptures, Cepher Abridged) or
one-time-purchase (Cepher Full $22, HalleluYah print, ISR). Subscription pricing in this
niche is unprecedented. **Yoshi's "no one can come down to match us" thesis is true
inside the niche** — no competitor has the subscription infrastructure built, the
content rendered for app surfaces, and the framework-distinctive content to charge for.

### Finding 2 — Mainstream subscription pricing starts at $5.99 (Olive Tree).

Olive Tree at $5.99/mo is the cheapest mainstream subscription Bible app. Bible Gateway
Plus is $6.99. Logos Premium is $9.99. **At $1.99 and $4.99, we are below every
mainstream subscription competitor.** No one can come down to match $1.99/mo
profitably — the content licensing models (which our public-domain + Yoshi-authored
approach sidesteps entirely) won't support it.

### Finding 3 — The Logos-killer thesis at $9.99 does not survive contact with the data.

**Logos Premium IS $9.99/mo.** Our proposed $9.99 tier matches Logos's entry tier on
price, not undercut it. Worse, Logos Premium users get:
- 70+ years of database engineering (better search, syntax, original-language indexing
  than we can match in V1 or V2)
- Multi-device ecosystem (desktop + mobile + web, deeply integrated)
- Library purchases they keep forever (purchases stack across sessions/years/decades)
- Brand familiarity ("Logos = serious Bible study" since 1991)

Trying to peel Logos users off at $9.99 fails on three axes:
1. **Switching cost.** Years of purchased resources ($300–$10,000+ libraries) and built
   study workflows.
2. **Feature parity at the deep end.** Logos Pro ($14.99) and Max ($19.99) ship features
   we cannot match in V1 or V2 (advanced syntax searches, theology models, lemma-level
   morphology analysis backed by their proprietary databases).
3. **Brand inertia.** "I use Logos" is identity for serious Bible students. Switching
   means re-learning a UI, losing library familiarity, and explaining to study partners
   why you moved.

The honest read: **we cannot kill Logos at $9.99.** Logos users are not the addressable
market for our top tier. Reframe needed.

### Finding 4 — Blue Letter Bible at $0 is the existing FREE serious-study standard.

Blue Letter Bible already gives users Strong's + Hebrew/Greek lexicons + commentaries +
interlinear views for free. 10M annual users. Our free tier's Strong's lookup needs to
match BLB's depth to be competitive at $0, OR we need to anchor free on what BLB
*doesn't* have (restored names, Apocrypha, framework-rendered commentary). Our existing
free-tier spec does the latter, which is the correct move.

### Finding 5 — YouVersion's Platform release commoditizes the basic reader layer.

In March 2026 YouVersion gave away the core Bible-reader engine for free as YouVersion
Platform — embedded Bible reading for 1,487 Bibles in 1,283 languages, free to any
developer. **Anyone can now build a basic Bible app in a weekend.** Differentiation has
to live somewhere other than the basic reader — and for us, it does (restored names,
Apocrypha, framework commentary, recommendations, Yoshi's keys, nikkudot reveal). Worth
noting as we evaluate moat features.

---

## 3. Where We Sit in the Pricing Landscape

```
$0     FREE: YouVersion, Blue Letter Bible, Cepher Abridged, Yah Scriptures, Tecarta base
$1.99  (no mainstream competitor)        ← us
$2.99  e-Sword LT mobile (one-time)
$4.99  (no mainstream competitor)        ← us
$5.99  Olive Tree
$6.99  Bible Gateway Plus
$9.99  Logos Premium                     ← us (match, not undercut)
$14.99 Logos Pro                         ← us (we hit one ceiling here too)
$19.99 Logos Max
$22    Cepher Full (one-time, all updates included)
$49.90 Accordance Starter (one-time)
$300+  Logos library packages
```

**Where we are uniquely positioned:**
- $1.99 — empty mainstream slot, undercut every paid Bible app on the market
- $4.99 — empty mainstream slot, $1 below Olive Tree and $2 below BGP
- $9.99 — match with Logos Premium (not undercut)
- $14.99 — match with Logos Pro (not undercut)

**Where the moat is real:**
- The restored-names niche specifically. No subscription competitor exists. We define
  the category.
- The framework-distinctive content. No competitor at any price has Yoshi's voice, the
  framework reading, the curated cross-reference threads, or the nikkudot Masoretic
  reveal.

**Where the moat is thin:**
- The lexicon library + interlinear at any tier. Blue Letter Bible has these for free.
  Charging for the public-domain lexicons themselves is hard to justify when BLB is one
  app-store search away. We need to charge for *the way they integrate with the
  framework reading* — the value-add over BLB — rather than for the lexicons as
  standalone data.
- Strong's lookup at free. Already at the BLB standard — needs to stay there or BLB
  becomes the obvious alternative.

---

## 4. Testing the Two Strategic Theses

### Thesis A: "Low enough that no one can come down to match us" — VALIDATED in niche.

This is true *inside the restored-names niche.* No competitor has subscription
infrastructure, restored content for app surfaces at scale, framework-distinctive
commentary, or curated cross-reference data. Cepher could in theory go subscription but
they've been one-time-purchase for years and the model rebuild is non-trivial. Yah
Scriptures has nothing to gate. HalleluYah is print-primary.

In the broader Bible-app space, the thesis is *partially* true — we're below every paid
subscription option at $1.99 and $4.99, but Olive Tree at $5.99 and Bible Gateway Plus
at $6.99 are within easy striking distance if either decided to compete on price.
Neither has yet because the niche-overlap with us is minimal — they target mainstream
evangelical study, not restored names.

**Implication:** Hold the bottom of the ladder tight at $1.99 / $4.99. The moat is real
in our niche. The mainstream competitors have no reason to undercut us because we're
not fishing in their pond.

### Thesis B: "$9.99 kills Logos" — FALSIFIED.

Logos Premium is $9.99. We match, not undercut. And the Logos audience is locked in by
library investment, ecosystem, brand, and switching cost. The framing should change.

**Reframe:** $9.99 is not the *Logos killer.* It is **the framework-depth tier for the
user who has already adopted the app and wants Yoshi's reading at full depth.** Different
audience than Logos's customer base; not competing for the same wallet. The pitch is
*here is the deepest version of the framework's study Bible,* not *here is Logos
cheaper.*

This means we don't need to match Logos feature-for-feature at $9.99. We don't need
Logos-level syntax search, lemma morphology databases, or academic apparatus. We need
the framework's deepest content + research tools rendered through the framework's lens.
Different product. Adjacent shelf, not competing shelf.

### Thesis C: "Low entry could spread like wildfire" — REAL but conditional.

The viral mechanics work if:
1. The free tier is so substantial that word-of-mouth happens organically. **It is.**
   Restored names + Apocrypha + Strong's + offline + share-with-watermark gives the
   restored-names community an app that doesn't exist elsewhere.
2. The upgrade gates feel low. **$1.99 absolutely does. $4.99 is impulse-buy
   territory.**
3. There's an acquisition catalyst. **Share-with-watermark is exactly this** — every
   verse shared from the app stamps the framework's app brand into the share. Viral
   loop.
4. The framework distinctives are sharable. **They are.** Restored names is shareable
   ("look how this verse reads when the name isn't substituted"); Apocrypha access is
   shareable ("did you know there are 37 books not in your Bible"); framework commentary
   is shareable ("this is how this passage reads when the lie comes off").

The restored-names community is small but **vocal and motivated.** Users who care about
this share. The viral mechanics are real here, and the low entry price removes the
last friction.

---

## 5. Strategic Recommendation — Tier Reorganization

Based on the analysis, the recommended adjustments to the DESIGN_LANGUAGE.md §9 tier
matrix:

### Free, $1.99, $4.99 — capture-the-free-crowd ladder (V1)

**Free** (no change from current spec):
- Restored sacred names
- Full Apocrypha + pseudepigrapha library
- Strong's reference lookup (at BLB-competitive depth)
- 1 highlight color (neon yellow, fill only)
- Single global notepad
- Basic commentary OR off
- Search across canon + extras
- Reading history
- Basic bookmarks
- Share with watermark (viral acquisition channel)
- Offline downloads

**$1.99** (no change from current spec):
- All 12 tribe-palette highlight colors
- All 3 mark styles (fill, underline, border outline)
- Separate notes per book/chapter/verse
- Note central hub
- Free-form color-meaning dictionary
- Bookmark-by-color topical study view

**$4.99** — the "reading companion + light study" tier (REDUCED from current spec):
- Notes export PDF
- Recommendations engine (curated framework threads)
- In-depth chapter commentary (the chapter-by-chapter pass output)
- Reading trails (framework-shaped guided journeys — roadmap item 27)

### $9.99, $14.99 — framework-depth ladder (V2 build)

**$9.99** — "framework-depth tier" (EXPANDED from current spec, moves from $4.99):
- ⬆️ Full public domain reference library (BDB, Thayer's, Vine's, ATS, Easton's, Smith's,
  Nave's, Treasury of Scripture Knowledge) — moved up from $4.99
- ⬆️ Hebrew/Greek interlinear — moved up from $4.99
- ⬆️ Nikkudot-strip Masoretic-reveal feature — moved up from $4.99 (S80 decision)
- Yoshi's pre-loaded keys (marks + end-of-chapter notes + teaching expansions)
- Chronological order toggle per framework dating

**$14.99** — community/family/founder tier (no change to spec; still deferred):
- Direct-access elements (forum, monthly group call, Q&A surface)
- Family-plan / multi-seat
- Early access to new books / threads / commentary
- Founder/patron tier with named acknowledgment

### Why this reorganization

**$4.99 stops doing double duty.** Currently it's both "impulse upgrade for the free
crowd" AND "Logos-grade research apparatus at impulse pricing." Pulling the
Logos-grade pieces up to $9.99 clarifies the tier: $4.99 is now coherently a
*reading companion power-user* tier, not a *try-to-replace-Logos-cheap* tier.

**$9.99 gets shape.** Currently $9.99 has only two features (keys + chronological).
Adding the reference library + interlinear + nikkudot reveal builds the tier into
something with real depth — *the framework's serious study apparatus* — that
justifies the 2x jump from $4.99 for the user who's already committed.

**No tier matches Logos head-to-head.** $9.99 is the *framework-depth* tier, not the
*Logos competitor.* Different audience. No expectation that Logos users will defect.

**The conversion ladder reads cleanly:**
- Free → $1.99 — marks/notes power-user impulse upgrade
- $1.99 → $4.99 — reading companion upgrade (commentary, recommendations, trails, export)
- $4.99 → $9.99 — framework-depth upgrade (full research apparatus + Yoshi's keys +
  chronological view + Masoretic reveal)
- $9.99 → $14.99 — community / family / founder upgrade

### Cost to V1 ship-gap

Three features shift from V1 to V2:
- Full reference library ingestion (BDB, Thayer's, Vine's, ATS, Easton's, Smith's,
  Nave's, TSK)
- Hebrew/Greek interlinear data alignment
- Nikkudot-strip feature

These were V1 work because they sat at the $4.99 V1 tier. They become V2 work because
they move to the $9.99 V2 tier. **V1 ships sooner** with a clean $0 / $1.99 / $4.99
ladder. V2 ships the framework-depth apparatus after V1 generates conversion data and
funding.

This may actually be a *net positive* for ship velocity — three substantial engineering
tracks (lexicon ingestion at scale, interlinear data alignment, nikkudot consonantal-
form index) move out of V1's critical path. V1 ships on a tighter scope.

---

## 6. Adjacent Question — Is FREE Over-Loaded?

Worth surfacing even though not asked directly. Our free tier is generous by Bible-app
standards. Specifically:

- **Full Apocrypha + pseudepigrapha library at free** — Cepher gates this behind the
  $22 full version. Yah Scriptures has it free. The framework requires it free (these
  are part of Yah's canon in the framework's reading; gating them would betray the
  theological framing). **Keep free.**
- **Strong's reference lookup at free** — BLB has this free. If we charge for it, BLB
  becomes the obvious alternative. **Keep free, at BLB-competitive depth.**
- **Offline downloads at free** — table-stakes for any modern Bible app. YouVersion has
  it. **Keep free.**
- **Share with watermark at free** — this is the viral acquisition mechanism. Gating it
  defeats its strategic purpose. **Keep free, watermark non-removable.**

The free tier is loaded *because acquisition is hard for a teacher with no audience.*
Cold installers don't pay for unfamiliar apps. The framework distinctives (restored
names + Apocrypha + framework basic commentary) are what get the user to install in the
first place. Stripping any of them weakens acquisition. **Keep free as spec'd.**

The lever for higher ARPU is not stripping free — it's **enriching $9.99** so the
top-tier conversion has more pull.

---

## 7. Sources

- [YouVersion Bible App](https://www.youversion.com/bible-app), [YouVersion Platform announcement](https://www.youversion.com/news/introducing-youversion-platform)
- [Bible Gateway Plus pricing review](https://divinenarratives.org/is-bible-gateway-plus-worth-it-features-benefits-and-pricing/), [Bible Gateway app review 2026](https://bibleinyear.com/blog/bible-gateway-app)
- [Logos Subscription Plans and Pricing](https://www.logos.com/configure/subscriptions), [Logos buyer's guide 2026](https://www.nickstapleton.me/logos-buyers-guide/)
- [Olive Tree Bible App](https://www.olivetree.com/bible-study-apps/), [Olive Tree Google Play](https://play.google.com/store/apps/details?id=biblereader.olivetree)
- [Blue Letter Bible app review 2026](https://bibleinyear.com/blog/blue-letter-bible-app), [Blue Letter Bible](https://www.blueletterbible.org/)
- [The Cepher main site](https://www.cepher.net/), [Cepher Abridged Edition](https://apps.apple.com/us/app/cepher-abridged-edition/id1406576338)
- [Yah Scriptures app](https://apps.apple.com/us/app/yah-scriptures/id6747885930)
- [HalleluYah Scriptures](https://www.halleluyahscriptures.com/)
- [Accordance Bible Software](https://www.accordancebible.com/), [Accordance Purchase Options](https://www.accordancebible.com/purchase-options/)
- [e-Sword main site](https://www.e-sword.net/), [e-Sword LT iOS](https://apps.apple.com/us/app/e-sword-lt-bible-study-to-go/id634158738)
- [Tecarta / Life Bible](https://tecarta.com/)

---

## 8. Open Questions for Yoshi

1. **Tier reorganization green-light.** Move reference library + interlinear + nikkudot
   from $4.99 to $9.99? Update DESIGN_LANGUAGE.md §9 and §15 accordingly.

2. **$14.99 spec.** Currently deferred. Worth spec'ing now or holding until post-V1?

3. **Free trial for $1.99 or $4.99.** Bible Gateway Plus does 7 days; Olive Tree does
   14 days. Should we match? At what tier?

4. **Annual pricing discount.** Industry standard is 12 months for the price of 10
   ($19.99/yr for $1.99/mo, $49.99/yr for $4.99/mo). Worth offering at launch or holding
   for post-launch optimization?

5. **Launch / founder pricing.** Lower-than-list pricing for first 100 subscribers (or
   first month) as launch promo. Standard SaaS practice. Worth doing?

---

**End of S80 competitive analysis.**
