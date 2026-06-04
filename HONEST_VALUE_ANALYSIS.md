# Honest Value & Viability Analysis

Authored 2026-05-31 against `REBUILD_STATE.md` S157 state, the current four-tier ladder, and the `$200/mo` ad budget Yoshi set. Numbers are sourced from `PRICING_TIER_ANALYSIS.md`, `COMPETITIVE_LANDSCAPE.md`, the `ROP_Study_Bible_Projection_Analysis.docx` model, and an audit of `commentaries/` + `source-texts/`. No softening.

---

## 1. Inventory — what actually ships today

**Live in production at `bible.remnantofpromise.org` right now:**

- Restored Names canon, all 66 books, with paragraph markers (4,635 USFX-extracted), restored sacred names, parentheticals.
- Strong's tap-on-word data + UI: 8,674 Hebrew + 5,523 Greek entries; 348,884 tagged tokens across the canon; the modal works.
- Native-OS TTS audio narration (S157, web SpeechSynthesis path) with a 45-entry sacred-name substitution table, voice picker, continuous-play through witness-category — Free tier, all tiers.
- Highlights: 13-color × 3-style, multi-mark up to 3 per verse, color-meaning dictionary.
- Bookmarks + single-global notepad (Free); scoped per-verse notes scaffold present.
- Range-selection mechanic + multi-verse highlight.
- Search V1 across canon and the four ingested extras.
- Reading-position persistence verse-precise across devices.
- Dark theme + Lora 18/500/1.7 body register.
- Stripe checkout via WP `/goshen/` SSO, four-tier active subscriptions verified end-to-end.
- Cross-references: 1,695 curated rows + 67 framework threads on Matthew only.
- Commentary on the canon: **Matthew is complete — 28/28 chapters in all three layers (free + short + deeper).** John has chapter 1 only. 1 Corinthians has chapter 11 only. **Of 1,189 chapters in the 66-book canon, ~28 chapters have commentary. That is 2.4% of the canon. Of 66 books, two have any commentary at all (Matthew complete; John + 1 Cor partial).**

**In-build / launch-blocking (per S157, 6–9 sessions away — ~3–5 weeks at the current pace):**

- BDB / Thayer's / Gesenius lexicons (data exists in `source-texts/openscriptures-hebrewlexicon` + STEPBible; UI surface not built — ~2–3 sessions).
- Hebrew/Greek interlinear (alignment work on top of the shipped Strong's foundation — ~3–5 sessions).
- Capacitor wrap → signed Android AAB → Play Console submission. Apple Developer enrollment not yet opened.

**Planned-but-distant (roadmap, no shipping date):**

- Notes export to PDF; verse-highlight recommendations engine; nikkudot-strip; chronological toggle.
- Extras library beyond the four already ingested. Source manifest lists ~46 candidate books across Shamayim (~14), Ha'avoth (~21), and others. **Only Apocrypha, Jasher, 1 Enoch, Jubilees are ingested and live. Sonnini, Josephus, Adam & Eve, Charles Vol 1 & 2, Apocalypse of Abraham, Ascension of Isaiah, Lightfoot Apostolic Fathers, MR James Apocryphal NT are parsed-to-JSON but the live-app exposure surface and tier-gating beyond the first four is not verified shipped.**
- Verse-by-verse teachings (Scribe tier) — not started.
- In-app ebook reader + the MTM book series. **The MTM imprint folder on disk contains one book: "Sides of the North."** Yoshi's "My Book" folder contains one Kindle EPUB + one print PDF — unclear if same or different work. **A "Scribe tier ebook library" today is one to two ebooks.**
- ElevenLabs Yoshi-voice PVC narration (Scribe).
- Founder feedback widget (designed, not built).

**The gap between the tier-card promise and disk reality is real. The Free tier ships everything it promises today. The Study tier ships everything except interlinear + lexicons (launch-blocking, ~5 weeks). The Companion tier ships the framework cross-refs but the chapter commentary covers 2.4% of the canon and ~91% of the promised extras library is parsed-but-not-live. The Scribe tier promises verse-by-verse teachings that don't exist yet and an ebook bundle of effectively one book.**

---

## 2. Per-tier honest value

**Free ($0) — strong, possibly the strongest in the niche.** Restored Names canon + Strong's + cross-references + TTS audio is genuinely competitive with Yah Scriptures (free, no Strong's) and the Cepher Abridged (free, no Strong's). Blue Letter Bible gives free Strong's + interlinear but no restored names. YouVersion gives free reading but no restored names, no Strong's. **Honest value: $0–$3/mo equivalent. Price is right. The Free tier is the strongest acquisition surface in the entire ladder and the framework-distinctive piece is already real.**

**Study ($1.99 launch / $2.99 anchor) — fair once the launch-blockers ship, undervalued today.** Notes, bookmarks, highlights, search are live. Hebrew/Greek interlinear + WLC + Scrivener TR + BDB/Thayer/Gesenius are 5 weeks out. **Olive Tree charges $5.99 for less on commentary breadth but more on lexicon depth. Blue Letter Bible gives BDB + Thayer + interlinear for free.** Honest value: $1.99 is correctly priced *only* if launch-blockers land before paid acquisition turns on. If you start ads now, the Study tier is buying notes+highlights+search for $1.99 — fair, not compelling. Anchor at $2.99 still beats every paid competitor. **Value-gap: interlinear + lexicons are the headline of this tier and aren't live yet.**

**Companion ($4.99 launch / $7.99 anchor) — overpriced versus delivered value today; correctly priced versus promised value.** What ships today: the four ingested extras (Apocrypha, Jasher, 1 Enoch, Jubilees) + 28 chapters of commentary (all on Matthew) + Layer-2 framework threads on Matthew. What's promised: ~46 more public-domain books + commentary on the rest of the canon. **Bible Gateway Plus is $6.99 with 30+ study Bibles and 50+ commentaries (Believer's, Expositor's, NIV Application). Logos Premium is $9.99 with their full ecosystem.** A new Companion partner who comes for "chapter commentaries on the canon" gets Matthew + nothing else and notices on day two. At $4.99 launch this is forgivable as founder pricing; at the $7.99 anchor it competes directly against Bible Gateway Plus on a *much* smaller content base. **Value-gap: 64 of 66 books have zero commentary, 91% of the extras library is not actually shipped, and there is no published completion timeline.**

**Scribe ($7.99 launch / $12.99 anchor) — the weakest tier today by a wide margin.** Verse-by-verse teachings: not authored. In-app ebook reader: not built. MTM series: one to two books on disk. **At $12.99 anchor a partner is paying within $2 of Logos Pro ($14.99) and $3 above Bible Gateway Plus, and getting one book they could buy from KDP for under $10 once and own forever.** The Scribe tier is the only one in the ladder where the promised stack is genuinely thin. **Honest value at $7.99 today: ~$3–$5. At $12.99 anchor: ~$4–$6. This tier needs either much more content or a price cut before it stops being the obvious upsell partners will skip.**

---

## 3. Viability at $200/mo ad budget

The math, honestly run.

**CAC for niche Christian app installs (Meta/YouTube, 2026 benchmarks).** General mobile-app installs run $1.50–$4 on Meta, $2–$6 on YouTube pre-roll. Faith and Bible-app niche tends to *outperform* general benchmarks on install CPC because the audience is high-intent — call it $1.50–$3 per install on a working creative, $4–$6 on a weak one. The projection memo assumes $25–$50 per *paying partner* (not per install) and your existing model uses $33 CAC base / $50 conservative.

**$200/mo at $2 per install = 100 installs/month.** At $3 per install = 67. At $5 per install (likely until creative is tuned) = 40. **Use 60 installs/mo as a credible blended starting point.**

**Free-to-paid conversion at the launch ladder.** Your own pricing analysis put base-case Free→$1.99 at 7%, conservative at 4%. Run it cold: 60 installs/mo × 5% blended conversion = **3 paying partners/month from paid acquisition.** Plus organic from Yoshi's existing remnantofpromise.org audience + YouTube + book readers — the projection memo estimates 3–5 paid partners/month from organic pre-launch, 5–25/month post-launch. **Realistic total: 6–10 new paying partners per month combined**, weighted toward the Study tier per the projection memo's 30/55/15 tier mix.

**Monthly revenue trajectory at launch prices.** Blended ARPU at launch prices with 30% Study / 55% Companion / 15% Scribe = $1.99 × 0.30 + $4.99 × 0.55 + $7.99 × 0.15 = **$3.54/partner/month** (the projection memo uses $4.84, which assumes a richer tier mix; $3.54 is more honest for the early founder cohort that skews to the cheapest tier). At 8 net new partners/month and the 8% monthly churn the model assumes, you reach steady-state at roughly 100 partners total (~12.5 months) for **~$350/mo MRR / ~$4.2k ARR**. That tracks the Conservative scenario in your projection memo almost exactly ($4.8k ARR at 82 partners).

**When does the 1,200-partner founder cap get hit?** At 8 net new partners/month, never. **1,200 ÷ 8 = 150 months = 12.5 years.** Even with the entire tier mix collapsing into one tier, the math doesn't change: you would need ~100 net new partners/month for 12 months to hit the Companion cap in a year. At $200/mo ad budget, that's not happening. The founder cap is not a real urgency mechanic at this acquisition pace — it's invisible.

**Post-cap monthly revenue at anchor prices** is therefore irrelevant for years. If you scale ad budget to $2,500/mo (Aspirational), and channel efficiency holds at $25 CAC per paying partner (the most fragile assumption in your projection model), you'd add 100 paying partners/mo and hit the first cap in roughly 12 months across the lowest tier — still not all three caps. Anchor pricing kicks in for new Study partners then but the Companion + Scribe caps would still be open for another 18–36 months.

**Stripe + processing: 6% all-in per the projection memo. App Store/Play Store take: ZERO on your current model** because subscriptions go through web Stripe via the `/goshen/` SSO bridge, not in-app purchase. **This is the most important number in the analysis and it doesn't appear in any of your other docs.** When the Capacitor wrap ships to Apple, Apple's reader-app guidelines (3.1.3(a)) permit you to keep external web checkout *and* link to it from inside the app via the External Link Account entitlement (approved for "reader" apps, which Bible apps qualify as). Google Play Billing has a similar carve-out under Play Billing's "Alternative Billing" rules in eligible regions, plus they don't enforce on subscriptions sold outside the app for content consumed inside it. **Net: you can plausibly avoid the 15–30% storefront take entirely** if you architect carefully and don't add in-app purchase. The legal/policy risk is non-zero (Apple has historically been hostile; the Spotify and Patreon rulings of 2024–2025 opened the door but it can close). If forced to switch to IAP at any point, **add 15% (small business tier, under $1M) to your cost line and re-do the LTV math: blended ARPU drops from $3.54 to $3.01 and your LTV/CAC ratio at base scenario falls from 1.82x to 1.55x — still survivable, still below the 3.0x healthy threshold.**

---

## 4. Where the model breaks

What has to be true for this to work, and what fails it:

- **Commentary backlog is a real retention risk on the Companion + Scribe tiers.** 28 chapters out of 1,189. Yoshi is the sole author at the current pace, ~1 chapter per session, ~2 sessions/week at peak shipping cadence. That's ~100 chapters/year before any new feature work. **The full canon at this pace = ~11 years.** Even Matthew + Mark + Luke + John (the case for "we have the gospels" as a defensible MVP) = ~88 more chapters = ~10 months of pure-commentary work, blocking everything else.
- **The 1,200 founder cap is invisible at $200/mo ad budget.** No new visitor will see urgency. The cap creates urgency only if you can credibly threaten to fill it, which requires showing growth velocity. You could show "247 of 1,200 founder seats taken" on the pricing page once the cap is real, but at 8/month you can show that for years without it ever feeling close. **Tradeoff: at current acquisition pace, the cap isn't psychologically operative. It either needs faster growth or you need a different urgency frame.** Not surfacing it as a tradeoff suggestion — that's your call — just noting that the mechanic doesn't fire at this budget.
- **Scribe ebook bundle is the thinnest part of the offer.** One MTM book on disk. To justify $7.99/mo against a Christian audience used to buying KDP ebooks for $4.99–$9.99 *once and owning forever*, the bundle needs 4–6 books minimum and they need to be ones partners can't easily buy themselves. The subscription-to-own-it math says: 12 months of Scribe = $96 = roughly 10 Christian-imprint paperbacks at typical Amazon pricing. **The ebook reader build itself is non-trivial — EPUB rendering, pagination, table-of-contents, reading position, syncing — call it 4–8 sessions of work, and shipping ebooks that are also sold on KDP requires a quiet decision about whether Scribe partners get the KDP titles for free (KDP exclusivity reset) or only new/exclusive content.**
- **Honest commerce vs. YouVersion-conditioned audience.** YouVersion has 1B installs and 14M DAU at $0. Your Free tier matching YouVersion's reading depth and exceeding it on restored names is the right play. But the *paid* upgrade asks a Christian to pay monthly for what their pastor's app and Blue Letter Bible give them free. The honest-commerce posture is correct ethically and is also a real conversion drag versus charm-priced freemium with manipulative paywalls. The projection memo's 8% monthly churn assumes industry-typical SaaS; faith-tier churn could land at 5% (memo's optimistic case) or 12%+ if curiosity-driven Christian downloaders behave like Christian app downloaders historically have (high install, fast bounce). **You don't have the data yet. Until you do, plan to the 8% number and accept that 5% would be a pleasant surprise.**
- **App Store/Play Store algorithmic discovery is unproven for this niche.** YouVersion dominates the search results. "Restored names" / "sacred name" / "Hebrew roots Bible" are low-volume queries — measurable in the hundreds-of-searches-per-month range, not thousands. Organic store discovery beyond direct-name searches for "Remnant of Promise" will be small. Word-of-mouth in the existing audience is the primary acquisition channel; ad spend amplifies it; store discovery is a long tail, not a primary funnel.
- **Founder is the only author and the only developer.** Bus factor is 1. Phase 9 closure depends on Yoshi shipping at 2 wheels/week. Real-life interruptions (work, family, illness, congregational duties) directly push launch. The projection memo flags this and the mitigation is "protect the wheel-shipping pace" — fair, but worth naming: there is no resilience against Yoshi being unavailable.

---

## 5. Million-dollar potential — sober assessment

**$1M ARR = $83,333 MRR = ~23,500 paying partners at the $3.54 launch ARPU, or ~17,300 at the $4.84 projection-memo ARPU, or ~11,000 at full $7.50 anchor ARPU.**

**Year 1 at $200/mo ad budget:** Conservative case from the projection memo, almost exactly: **82 partners / $4.8k ARR.** Best plausible case at this budget: **~150 partners / ~$9k ARR.** Not close to $1M.

**Year 2 at $200/mo:** ~250 partners / ~$15k ARR if churn stays 8% and conversion holds. Still not close.

**Year 3 at $200/mo:** ~500 partners / ~$30k ARR. 3% of the $1M target. **At a flat $200/mo ad budget, $1M ARR is unreachable inside a 5-year horizon.**

**What would need to change for $1M ARR to be achievable inside 3–4 years:**

1. **Ad budget scales to $2,500–$5,000/mo by Year 2 and channel efficiency holds.** This is the Aspirational scenario in the projection memo and the model itself flags it as the fragile assumption. If creatives + audiences scale, paid acquisition could deliver 200–500 paid partners/month sustained. Over 24 months that's 4,800–12,000 partners. Achievable but requires real capital deployment Yoshi doesn't have today.
2. **Commentary completes to a critical mass on the canon, not just Matthew.** Either Yoshi outsources the commentary writing (which breaks the framework-voice integrity and is probably not negotiable), or the canon-commentary completion stays a multi-year roadmap and the value-prop for Companion stays a Matthew-centric pitch with "more coming" framing.
3. **Organic acquisition through Yoshi's existing audience materially exceeds the projection memo's 5–25 partners/month post-launch.** If the YouTube channel, book readers, congregational ties, and word-of-mouth in the restored-names community produce 100+ paid partners/month organically, the ad budget becomes amplification rather than primary acquisition. **This is the only path to $1M ARR that doesn't require capital injection.** It requires Yoshi to grow the upstream audience aggressively, which competes for the same time as wheel-shipping.
4. **The Scribe tier gets a real product** — 6+ ebooks + verse-by-verse teachings on at least the gospels — so the top of the ladder is worth its sticker price. Without this the ARPU stays anchored to Study + Companion and the math gets harder.
5. **A pivot to a higher-value institutional offering** — small-group study packs, congregational licenses, study-guide PDFs — could surface a separate revenue stream that doesn't depend on individual subscription scale. The framework's content is genuinely defensible for small-group Bible study; the surface for that doesn't exist today.

**The honest read on the million-dollar question:** the *content* is a million-dollar property if the audience scales. The *app at this acquisition budget* is a $5k–$50k/year revenue floor with a believable path to $100–250k ARR over 3 years if the projection memo's Base scenario materializes. $1M ARR requires either capital, an organic-audience-growth breakout, or both. Million-dollar ideas don't go broke from being executed wrong — they go broke from being executed at half the scale they need. **At $200/mo ad budget, this is a sustainable side-revenue ministry product, not a million-dollar app. It can become one only if Yoshi's upstream audience funnel materially outpaces what the projection memo currently models.**

---

**Single most important recommendation:** Spend the next 90 days driving upstream audience growth (YouTube, book promotion, congregational network) at the expense of the in-app feature backlog beyond the launch-blockers, because at $200/mo ad spend the bottleneck is not the product — it is the size of the warm audience the app converts from.
