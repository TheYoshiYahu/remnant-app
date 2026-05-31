# S179 Checkpoint — Tier Revamp + Pricing + Trial Mechanics + Ad Grants Strategy

**Date:** 2026-05-31
**Mode:** Strategy session. No code changes. No content edits. Architecture-level decisions locked for S180 execution.
**Context:** S178 shipped APK v1.0.6 with in-app sign-in working. S179 opened with Yoshi catching that the prior Matthew commentary work had stripped load-bearing argument (S134 cut 139 lines from matthew-5.md including the §9 Cross-Reference Apparatus and the *ye have heard* methodological-key paragraph). Recovery is git-recoverable from commit 18ba91f. That work pivoted mid-session into a full tier + pricing + content-structure revamp.

---

## 1. Tier Structure — LOCKED

| Tier | Launch | Anchor after 1,200 founders | Contents |
|---|---|---|---|
| **Free** | $0 | $0 | Restored Names canon (66 books) + Strong's apparatus + cross-references with framework-bearing notes + native TTS audio |
| **Study** | $1.99/mo | $2.99/mo | Free + study tools (notes, bookmarks, highlights, search, sharing) + Hebrew/Greek interlinear (Westminster Leningrad Codex + Scrivener TR) + BDB + Thayer's + Gesenius lexicons |
| **Companion** | $4.99/mo | $7.99/mo | Study + extras library (Apocrypha, Jasher, 1 Enoch, Jubilees already shipped + ~46 more public-domain restored-canon books planned) + chapter commentaries on the canon + Layer-2 framework cross-reference threads |
| **Scribe** | $7.99/mo | $12.99/mo | Companion + verse-by-verse teachings + in-app ebook reader for the full More Than Milk Ministries book series |

**Founder mechanic:** First 1,200 partners at each tier lock the launch price for life. After 1,200, that tier resets to the anchor price for new partners.

**Pricing posture:** Charm pricing (.99 endings) kept after Yoshi worked through alternatives ($2.71/$4.99/$7.77 calculated-looking prices, $2.01 entry-tier wink, $X.38/$X.72 odd-cent prices, flat $2/$5/$8). Landed on .99 with the note that "it's all imaginary anyway — could give the app away if I wanted to." The honesty footnote on the pricing page can name the price posture explicitly if useful.

**Scribe stays in.** S174 had marked Scribe for deletion (deliverables too distant). S179 brought it back with new, shippable deliverables: VBV teachings + MTM ebook reader. Verse-by-verse is the apex teaching; the ebook reader bundles Yoshi's full book library in-app for the deepest-tier partner.

---

## 2. Content Structure — Three-File Ladder Killed

**Killed:** the matthew-N.md / matthew-N-free.md / matthew-N-short.md three-file ladder. The deeper-dive / deepest-dive structure created repetition, was bloated, and broke from chapter 17 onward (shorts longer than fulls).

**New shape, per chapter:**

1. **Single end-of-chapter commentary** — explains what the chapter discusses, plain teaching, no padding. Lives at Companion tier ($4.99).
2. **Cross-references with framework-bearing notes** — already free. Stay free. Carry the framework substance in short form for the awakening reader.
3. **Verse-by-verse teachings** — only when a chapter warrants more than one teaching. Lives at Scribe tier ($7.99).

**Strategic decision on free-tier commentary access:** Commentaries are entirely paid. No "key chapters free" hook. Reasoning: the framework commentary IS the dismantle of institutional Christianity (per voice skill — modern Judaizer diagnostic, antinomian-Paul correction, etc.). Confronting a Christian reader with that in the free tier risks the bounce-off before any relationship has formed. Once a partner has paid even $1.99, they're inside the relationship and more likely to actually receive what comes next. Same posture Yahusha walked with "I have many things to say unto you, but ye cannot bear them now."

**Cross-references retain framework-bearing notes in free tier.** Short-form framework exposure that invites curiosity rather than confronts. Subtler entry into the framework than full commentary.

---

## 3. Trial Mechanics — LOCKED

**Killed:** 7-day free trial. Coupon-abuse vector is real (new email accounts, device fingerprinting leaks), engineering cost not worth it vs the next mechanic.

**LOCKED — Permanent Sabbath open access.** Every Friday sundown to Saturday sundown, free users get full Scribe-tier access — every commentary, every VBV teaching, the full extras library, the MTM ebook reader. Brand-aligned (Sabbath is the day the framework calls people back to), no abuse vector (global time window, not per-user perk), recurring exposure (52 conversion moments per user per year, not one), conversion-narrative-clean ("I had access on Sabbath, I need it every day, I partner"), distinctive (no other Bible app does this).

**LOCKED — Launch-month-free.** First full calendar month of public launch, every user gets full Scribe-tier access. Drives signup spike, lets people experience the depth, transitions to founder pricing with the Sabbath weekly access remaining permanent.

**Killed:** In-reading-flow MTM book ads or samples. House book discovery link goes in About/Settings only, not in the reading surface. Same posture as the voice skill's back-matter-only cross-pollination rule.

---

## 4. Competitive Position — Locked in Strategy

**Free vs YouVersion:** Different Bible (Restored Names, framework cross-refs, Strong's). Not competing on YouVersion's axis. Wins for the awakening remnant audience.

**Study at $1.99 vs Logos / Olive Tree:** Aggressive. Olive Tree charges $20+ for Strong's bundles; lexicons $50–100 individually. $1.99 for interlinear + 3 lexicons + tools is 80% off Logos.

**Companion at $4.99 vs Logos Premium ($9.99):** Different category of value at half the price. Extras library + framework commentary that doesn't exist anywhere else.

**Scribe at $7.99 vs Logos Premium Plus ($14.99):** Partially vapor today (VBV doesn't exist yet, ebook reader not built). Once built, complete library at half of Premium Plus.

**Niche-of-one moat:** No competitor in the restored-names space. Low churn from competitive switching.

---

## 5. Ad Grants Strategy — Priority Work Item

Yoshi raised driving the $10K/month Google Ad Grants nonprofit benefit as the lever that makes the $1M ARR trajectory realistic.

**Reality check on Ad Grants:**
- $10K is a ceiling, not a floor. Most grantees spend $1–3K/month due to restrictions. Well-run accounts clear $6–8K/month in actual spend.
- $2 bid cap on standard bidding (lifted under Maximize Conversions strategy).
- 5% CTR minimum required to maintain the grant.
- No single-word keywords, no overly generic terms.
- 1–3 hours/week active management required to keep account healthy.

**Niche Christian/Bible CPCs:** $0.30–1.50 range. Search queries like "restored names bible app," "two-house Israel teaching," "scattered tribes prophecy," "1 Enoch Bible app," "Apocrypha Bible app" are low-competition, high-intent. At $0.75 avg CPC, $6K/month actual spend = 8,000 clicks → 8–12% install conversion = 600–1,000 installs/month from search alone. 10–15x the $200/mo paid budget assumed in the prior viability analysis.

**Application sequence:**
1. TechSoup verification of Remnant of Promise's 501(c)(3) status — usually a few weeks.
2. Google for Nonprofits enrollment.
3. Ad Grants application + Google's review (1–4 weeks).
4. Conversion tracking properly wired on remnantofpromise.org — installs, signups, subscriptions tracked as Google conversions.
5. Initial campaign build with niche-keyword targeting and active management discipline.

**Decision:** Yoshi to start application work as soon as possible. Calendar time (2 months to approval) runs in parallel with all other work and the upside justifies it.

---

## 6. Million-Dollar Verdict — Revised

The HONEST_VALUE_ANALYSIS.md report (also generated this session, on Desktop) projected ~$30K ARR by year 3 at $200/mo ad budget alone. That projection over-anchored on the small ad budget and missed three compounding factors that the rest of the session surfaced:

1. **Sabbath mechanic** compounds — 52 conversion moments per free user per year, cumulative 20–40% annual conversion probability per free user vs the 2–7% of one-shot trials.
2. **Upstream audience** (books, YouTube, remnantofpromise.org reach) is the real funnel, not the $200/mo paid budget. Existing organic reach is unquantified but real.
3. **Stripe-direct checkout** bypasses Apple/Play 15–30% platform tax — 95%+ of revenue retained. Worth deliberately protecting in any future native subscription UI work.

**Revised trajectory at Ad Grants + Sabbath + upstream growth:**
- Year 1: launch-month-free + Sabbath + existing audience → $50K–$200K ARR
- Year 2: content backfill + Ad Grants compounding → $150K–$400K ARR
- Year 3: $400K–$1M ARR depending on whether upstream channels (books, video) keep adding fuel

**What has to be true:**
1. Yoshi keeps writing — books (audience growth) AND commentary (retention).
2. Sabbath mechanic ships and works as designed.
3. Niche posture stays — don't dilute trying to win mainstream Christians.
4. Content backfill on high-traffic books (John, Romans, Galatians, Revelation) happens within 6 months.
5. Ad Grants approved and actively managed.

---

## 7. Outstanding Work Item from Earlier in S179

**Matthew 5 commentary recovery (from before tier revamp pivoted the session):**

S134 commit `ddd05b7` deleted 139 lines from matthew-5.md and 64 lines from matthew-5-short.md. The cut content (full salt-and-light covenant exposition, the *ye have heard* methodological-key paragraph, Mark 7 / Deuteronomy 4:2 buttress, §9 Cross-Reference Apparatus with the heart-torah-not-abolition + oral-tradition-correction-not-torah-supersession threads) was moved to a SQL migration thread and stripped from the prose. Reader app shows shorter commentary; load-bearing argument gone from the file.

**Git-recoverable baseline:** commit `18ba91f` has matthew-5.md at 446 lines and matthew-5-short.md at 89 lines.

**The fulfill survey** (35-passage NT *plēroō* walkthrough Yoshi remembered) was added in commit `d17a37d` (S111) — but as a SQL migration cross-reference thread (`session111_fulfill_thread.sql`), NOT as prose in matthew-5-free.md. The data exists; it needs to be rendered as prose into the new commentary structure.

**Status:** deferred to S180+ as part of the broader content restructure. The three-file ladder is now killed, so Matt 5 will be rebuilt in the new single-commentary + VBV shape rather than as a restoration of the prior structure.

---

## 8. Next Session (S180) — Build Plan

**Yoshi's direction:** "Next session we get all the cross references done. You can create subs and really get after it."

**Cross-reference work, with subagent parallelization:**

1. **Audit existing cross-references** in canon.json and the chapter-end card apparatus. Map what threads exist, where they're anchored, what the framework-bearing notes look like in the current state.
2. **Identify gaps** — chapters with missing or sparse cross-references, framework threads that should exist but don't, threads that exist as SQL migrations but aren't wired into reader-visible form.
3. **Parallel build via subagents** — divide canon by book or thematic thread (scattered-seed-gathering, fulfill-as-prophecy-bringing-to-pass, heart-torah-not-abolition, oral-tradition-correction-not-torah-supersession, pharisaic-sadducean-system-as-judaizer-predecessor, etc.) and run multiple subagents in parallel to build out the cross-reference layer chapter-by-chapter.
4. **Voice-gate every thread member note** — must pass the 12 Red Lines + the 12-point editorial checklist before landing. Subagents must load yoshi-voice skill before drafting any thread member note.
5. **Test the data flow** end-to-end: cross-references in JSON → loader script → database → reader app surfaces correctly at the free tier.

**Tier-revamp implementation work (S180 or later wheel):**

1. Update `app/src/routes/Pricing.tsx` to reflect new four-tier ladder with new prices.
2. Add launch-month-free + permanent Sabbath open access mechanic to subscription gate logic. Time-window check (Friday sundown to Saturday sundown in user's timezone) unlocks all Scribe-tier features for free users.
3. Update tier metadata in `api/models.py` and `api/subscriptions.py` for the new tier names + Stripe price IDs.
4. House-book discovery link in About/Settings surface only.
5. Founder mechanic UI — show remaining slots at current launch price ("X of 1,200 founder slots remaining at this price").

**Content restructure (S181+ or staged across sessions):**

1. Kill the three-file matthew-N ladder. Move to single end-of-chapter commentary + VBV split.
2. Rebuild Matt 5 first as the test case using commit `18ba91f` content as baseline + the fulfill survey rendered as prose from `session111_fulfill_thread.sql`.
3. Audit all 28 Matthew chapters for the new structure.
4. Expand to high-traffic books next: John, Romans, Galatians, Revelation.
5. Voice-gate every chapter — load yoshi-voice skill before drafting.

**Ad Grants application (Yoshi work, parallel calendar):**

1. TechSoup verification of RoP nonprofit status.
2. Google for Nonprofits enrollment.
3. Ad Grants application submitted.
4. Conversion tracking wired on remnantofpromise.org.
5. Initial keyword research for niche restored-names search terms.

---

## 9. Open Questions for Next Session

1. Sabbath open-access mechanic — does "Sabbath" mean Friday sundown to Saturday sundown in the user's local timezone, or Jerusalem time globally? Yoshi to call.
2. Launch month — when does the public launch actually happen? Triggers the launch-month-free window.
3. "Key chapters" hook is killed for free tier — but should specific sample teachings exist on remnantofpromise.org as a marketing surface that drives signup to the app? Different surface, different question.
4. Stripe product IDs — do we keep the existing `study_notes` / `extras` / `complete_study` / `everything` slugs in the backend and just rename the partner-facing labels, or rename the slugs to `study` / `companion` / `scribe`? Backend-rename is breaking; label-rename is reversible.
5. MTM ebook reader for Scribe tier — what's the actual delivery format (PDF? Reflowable HTML? Native ebook engine)? When does the build land? Without it, Scribe is vapor.

---

## 10. Session Discipline Notes

- Yoshi pushed back on the AskUserQuestion popup tool early in the session — kept conversational text-only Q&A throughout.
- Voice skill was loaded once midway and stayed in context. The framework-deep.md reference was not pulled this session because the work was strategy-level, not commentary editing. S180 commentary work will require it.
- Subagent was used once for the HONEST_VALUE_ANALYSIS report. Yoshi pushed back that the report over-anchored on the $200/mo ad budget assumption and missed the competitive read — corrected in subsequent conversational answer rather than re-spawning the agent.
- Session ran long but stayed in strategy mode rather than execution. Tomorrow Yoshi has work; S180 picks up the cross-reference execution work with subagent parallelization.
