# S180 Checkpoint — Cross-Reference Fan-Out for John, Romans, Galatians, Revelation

**Date:** 2026-05-31
**Mode:** Author-and-verify session. Proposal-stage artifacts produced for the four priority books named in the S179 checkpoint. No SQL migrations written this session; no database rows landed. The deliverables are review-stage markdown that Yoshi reviews, redlines, and the next session lands as SQL.

---

## 1. What Shipped This Session

Four parallel subagents drafted framework-bearing cross-reference thread proposals, one per priority book. Four independent verification subagents ran voice-gate passes against the drafts. Eight files total on disk:

| Book | Threads | Members (approx) | Proposal | Verification |
|---|---|---|---|---|
| **John** | 14 | ~110 | `_scratch/s180_john_xref_threads.md` (534 lines) | `_scratch/s180_john_xref_VERIFICATION.md` |
| **Romans** | 16 | ~155 | `_scratch/s180_romans_xref_threads.md` (619 lines) | `_scratch/s180_romans_xref_VERIFICATION.md` |
| **Galatians** | 12 | ~105 | `_scratch/s180_galatians_xref_threads.md` (383 lines) | `_scratch/s180_galatians_xref_VERIFICATION.md` |
| **Revelation** | 17 | ~190 | `_scratch/s180_revelation_xref_threads.md` (672 lines) | `_scratch/s180_revelation_xref_VERIFICATION.md` |
| **Total** | **59** | **~560** | | |

Every drafting subagent loaded the yoshi-voice skill in full plus `references/framework-deep.md` before drafting a paragraph. Every member note was self-gated against the 12 Red Lines + 12-point editorial checklist before landing in the proposal. Every proposal then went through a separate (independent) verification subagent that loaded the skill fresh and ran the gate again — to catch what self-review missed.

---

## 2. Audit Findings (from the S180 opening audit)

The pre-fan-out audit confirmed:

- **Matthew 1-28** is essentially complete: ~1,719 source-anchored cross-references across the chapter-end card apparatus, ~80 book-specific framework threads (sessions 110, 131-156), plus the five universal-funnel threads from S73-S74 (`post-harvest-sifting`, `grace-from-names-sake`, `new-heart`, `scattered-seed-gathering`, `false-inclusion-rebuttal`) and the `fulfill-as-prophecy-bringing-to-pass` thread from S111.
- **Every other canon book** has ZERO book-specific framework threads. The other books appear only as target verses inside Matthew-anchored threads or as source rows in the cross-canon `fulfill` thread.
- The architecture is in place: `cross_references` (Layer 1) + `cross_reference_threads` + `cross_reference_thread_members` (Layer 2), with a live API endpoint, a live PWA `<ChapterEndCard />` component, and the two-tier-split policy (Layer 1 baseline at `extras` / Library $4.99, Layer 2 thread callouts at `complete_study` / Companion $9.99, with two free-funnel threads — Kingdom Gospel and Grace That Can Be Lost — visible at every tier).

Conclusion: gap was clear — fan out the four priority books named in the S179 checkpoint. That is what S180 did.

---

## 3. Voice-Gate Verification — What Each Pass Found

The drafting agents' self-checks were honest but not exhaustive. The independent verification pass caught patterns self-review missed. None of the findings is fatal; all are fixable in a focused edit pass. No proposal needs a full re-draft.

### John (14 threads)

- **Threads passing clean:** `other-sheep-other-fold`, `salvation-of-the-yahudim`, `pesach-lamb-bone-not-broken` (and a handful more — see verification file for full list)
- **Edits needed:**
  - **Thread 2 (Word made flesh)** misses John 1:11-13 entirely — the *not of blood, nor of the will of the flesh* prologue verses that the false-inclusion gospel anchors on. Silent miss against Red Line #7. Add coverage.
  - **Threads 5, 7, 11, 13** leave Red Line #10 grace-completion unspoken on the *whosoever believeth* / *eternal life* faith-language. Add the framework completion sentence (grace as means of return to him and his ways) so sola-fide grammar can't float.
  - **Six Johannine *Son of Adam* verses ungathered** — 1:51, 5:27, 6:53, 6:62, 12:34, 13:31 — coverage gap, not a violation. Consider a dedicated Son-of-Adam-as-judge / John-5:27 thread.
- **Verdict:** fit to land after named edits.

### Romans (16 threads)

- **Threads passing clean:** 7 of 16 (including Thread 16 / Romans 14, which the drafter flagged as "riskiest" but actually came in clean)
- **Edits needed:**
  - **Thread 11 (Romans 9)** needs targeted rework on two phrasings to lock the post-harvest sifting architecture and the two-houses-grief frame.
  - **Thread 13 (Romans 11)** — the highest-stakes thread in the file. Substance-correct but needs three explicit additions: wild-olive-as-descendants-of-the-broken-off, cause-and-effect reversal (hearing reveals what was true), names-only-blotted-out. Make these load-bearing on the page, not implicit.
  - **Six row-level clarifiers** across various threads where Jew/Gentile binary slips into standalone verse-pair readings; the summary prose holds it but row members let inherited reading through.
- **Verdict:** fit to land after named edits.

### Galatians (12 threads)

- **Substance:** clean on every Red Line that fires in this letter. Curse-of-the-law as Deuteronomy 28 exile (not Torah) held. Erga-nomou as flesh-credential held. Paidagogos as guardian-in-pre-Messianic-age held; sonship inherits Torah, doesn't graduate past. Hagar as the proselyte-system; Torah is not Hagar. *Neither Jew nor Greek* removes hierarchy, doesn't erase identity. *Israel of Elohim* is scattered seed coming home through the journey. Paul-as-Torah-observant-Benjaminite preserved. No sola-fide truncation.
- **Mechanical issues:**
  - **~20 violations of the book-name English rule** scattered through the file: "Devarim (Deuteronomy)," "Vayikra (Leviticus)," "Yeshayahu (Isaiah)," "Iyov (Job)," etc. The skill's rule is non-negotiable: book names always conventional English, even when surrounding text carries heavy Hebrew restoration on Deity and covenant-people names. Find-and-replace pass before SQL.
  - **Thread 5** renders Galatians 6:7 as "Yahuah (Elohim) is not mocked" — wrong. Should be "Elohim (God) is not mocked." Thread 12 renders the same verse correctly. Fix Thread 5.
  - **Thread 3 Member 6** asserts a Benjamin-tribe-as-mission-to-the-scattered claim that goes beyond framework backing. Soften.
- **Verdict:** fit to land after named edits; no re-draft.

### Revelation (17 threads)

- **Substance:** cyclical Revelation framework held; 144,000 stay literal-from-the-twelve-tribes; great multitude is gathered scattered seed (not faith-grafted-pagans); millennial-reign destination preserved.
- **Five real fixes needed:**
  - **Thread 1: kaph misattribution.** The summary and Member 1 attribute the kaph-comparative to Revelation 1:7 by association. The Greek at 1:7 does NOT carry the *homoion* construction — only 1:13 does (and 14:14). Fix the framing. (The 1:7 verse-quotation itself is technically faithful; the framing claim is the error.)
  - **Thread 1 Member 5** risks Father/Son collapse via the white-wool-hair-of-Daniel-7:9 Ancient-of-Days association applied to the Son. Tighten so the Formless/Formed distinction holds.
  - **Thread 6** frames the great multitude's priestly office as present-tense; the framework requires this to be the millennial-reign destination, not now.
  - **Thread 13 (harlot Babylon)** has the four-costume / 1 John 2:3-4 *contrary-to-Torah* diagnostic as a closing-note only. It must be load-bearing in the body of the thread so the *institutional Christianity is the modern Judaizer movement* identification is on the page.
  - **Thread 15** has *able-to-graft-in-again* language for the forefathers landing too automatic; the conditional-on-faithfulness reading (Philippians 3:11 lock) needs to be explicit.
- **File-level bug:** header says "Sixteen threads below" but the file contains 17. Fix.
- **Verdict:** fit to land after named edits.

---

## 4. What Did NOT Happen This Session

- **No SQL migration was written.** The proposals are in markdown; they need to be (a) edited per the verification findings, then (b) converted to the WITH input(...) VALUES + INSERT INTO cross_reference_threads + INSERT INTO cross_reference_thread_members SQL pattern (per `session110_matthew_cross_references.sql` and `session74_cross_reference_threads_2_to_5.sql` as format references) before they can be applied to the database.
- **No data-flow end-to-end test was run.** The end-to-end test (JSON → loader → DB → reader app surfaces correctly at free tier) requires the SQL migration to have landed first.
- **No tier-revamp implementation work** (S179 named this as a parallel work item — Pricing.tsx tier ladder update, Sabbath open-access mechanic, founder-mechanic UI, etc.). Cross-reference fan-out was this session's focus per Yoshi's direction; tier-revamp implementation is queued for a separate wheel.
- **No Matthew 5 commentary recovery.** Same reason — S179 deferred this to S180+ and S180 went to fan-out instead.

---

## 5. Next Session (S181) — Build Plan

**Track A — Land the proposals.** Yoshi reviews the four proposals + four verifications. Decides edit-by-edit which verification findings to accept, which to reject, which to rewrite. Edits land in the markdown. Then the markdown converts to SQL migrations — one migration per book or one combined — following the established WITH input(...) + INSERT INTO threads + INSERT INTO members pattern. Apply, smoke-test the chapter-end card surface for each of the four books at the free tier (Layer 1 baseline visible to free, Layer 2 thread callouts visible at Companion or higher per the S140 split policy).

**Track B — Tier-revamp implementation work (queued from S179).**
1. Update `app/src/routes/Pricing.tsx` to reflect the four-tier ladder with new prices.
2. Add the launch-month-free + permanent Sabbath open-access mechanic to subscription-gate logic. Time-window check (Friday sundown to Saturday sundown in user's timezone — pending Yoshi's call on local-vs-Jerusalem-time per S179 open question #1) unlocks all Scribe-tier features for free users.
3. Update tier metadata in `api/models.py` and `api/subscriptions.py` for the new tier names + Stripe price IDs (label-rename is reversible; backend slug-rename is breaking — Yoshi to call per S179 open question #4).
4. House-book discovery link in About/Settings surface only.
5. Founder-mechanic UI — show remaining slots at current launch price.

**Track C — Content restructure (S181+ or staged across sessions, queued from S179).** Kill the three-file matthew-N ladder. Rebuild Matt 5 first as the test case using commit `18ba91f` content as baseline + the fulfill survey rendered as prose from `session111_fulfill_thread.sql`. Audit all 28 Matthew chapters for the new single-commentary + VBV-split structure. Then expand to the four S180-fan-out books in the same shape.

**Track D — Additional cross-reference fan-out (after S181 lands the four).** The remaining canon books — especially Genesis, Exodus, Leviticus, Deuteronomy, Isaiah, Jeremiah, Ezekiel, Daniel, Hosea, Acts, Hebrews, James, 1 Peter, 2 Peter, 1 John — all need the same apparatus the four S180 books got. Fan-out the same way: one subagent per book, voice-gate, verify, land.

**Track E — Ad Grants application (Yoshi work, parallel calendar, from S179).** TechSoup verification → Google for Nonprofits → Ad Grants application → conversion tracking on remnantofpromise.org → initial keyword research.

---

## 6. Open Questions Carried Forward

From S179, all still open and now ready for S181:

1. Sabbath open-access mechanic — Friday sundown to Saturday sundown in local timezone or Jerusalem time globally?
2. Public launch date — triggers the launch-month-free window.
3. Should sample teachings exist on remnantofpromise.org as a marketing surface that drives signup to the app?
4. Stripe product IDs — keep existing slugs (`study_notes` / `extras` / `complete_study` / `everything`) with label-rename only, or rename slugs to `study` / `companion` / `scribe`?
5. MTM ebook reader for Scribe tier — delivery format and build timeline?

New from S180:

6. **Tier-required default for the new threads.** The four S180 proposals all default `tier_required = 'free'`. Per the S140 split policy, that puts them on the Companion-tier callout gate (with teaser + fade) for free / Study / Library readers. Question: should any of the 59 threads be promoted to the free funnel (where Kingdom Gospel + Grace That Can Be Lost currently sit)? Candidates from the verifications: Galatians `liberty-in-messiah-from-judaizer-yoke`, John `pesach-lamb-bone-not-broken`, Romans `whosoever-calls-on-yahuah-shall-be-saved` — all carry inviting-the-scattered-home substance that fits the funnel role.
7. **Coverage extension for John *Son of Adam* verses.** Six Johannine *Son of Adam* verses (1:51, 5:27, 6:53, 6:62, 12:34, 13:31) are ungathered in the S180 proposal. Add a dedicated thread in S181 or roll into existing threads?
8. **Galatians book-name-rule pass.** The ~20 violations need a find-and-replace pass before SQL. Trivial to fix; flagging so it doesn't get lost.

---

## 7. Session Discipline Notes

- One denied permission prompt mid-session (Yoshi flagged) — the prior `mcp__cowork__request_cowork_directory` call succeeded so file access was never blocked; whatever the deny was for was a different prompt, possibly related to subagent spawning. Subagents completed normally regardless.
- Subagent fan-out worked as designed — four parallel drafters, four parallel verifiers, eight files produced, all voice-gated independently of each other.
- Verification-as-subagent caught real misses (the Revelation 1:7 kaph misattribution, the John 1:11-13 silent miss, the Galatians book-name violations) that the drafting agents' self-reviews did not. Pattern worth repeating for S181 Track D.
- This session honored the *self-sufficient application of skill + source* discipline — drafted to deliverable, verified, wrapped clean — without breaking the loop to ask Yoshi between every paragraph.
