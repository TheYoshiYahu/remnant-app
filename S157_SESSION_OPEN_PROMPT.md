S157 — Phase 10 begins: downloadable apps (Capacitor wrap → Google Play + Apple App Store)

# S156 close summary — Matthew apparatus complete

**Phase 9.1 closed.** Matt 24–28 extras-tier cross-references shipped in one parallel-batch session per the S155 mechanism — 5 subagents drafting concurrently, each in its own fresh context with the full yoshi-voice skill loaded and Matt 17 (`data-schema/migrations/session154_matt_17_extras_cross_references.sql`) as the structural template. Migrations applied in order: Matt 24 → 25 → 26 → 27 → 28.

**What landed at S156 close:**

| Migration | Threads | Cross-refs | Sort range |
|---|---|---|---|
| `session156_matt_24_extras_cross_references.sql` | 5 | 22 | 342–346 |
| `session156_matt_25_extras_cross_references.sql` | 5 | 22 | 347–351 |
| `session156_matt_26_extras_cross_references.sql` | 5 | 19 | 352–356 |
| `session156_matt_27_extras_cross_references.sql` | 5 | 21 | 357–361 |
| `session156_matt_28_extras_cross_references.sql` | 5 | 22 | 362–366 |

**Verification at S156 close.** Each migration's own `DO $verify$` block passed at apply. All 150 unique non-canon extras citations across the 5 files independently re-verified to exist in the parsed JSONs (zero phantom verses). No slug collisions internal-batch OR against S131–S155 (40-slug collision-avoid list applied).

**One fix applied during review pre-apply.** Matt 28's signature thread had a non-ASCII `ē` (e-macron) in its slug — `panta-ta-ethnē-...`. Every prior session's slugs are pure ASCII, so renamed to `panta-ta-ethne-...` across the 11 occurrences in the file. Title and summary_md prose still carry the Greek transliteration with macron; slug text only was changed.

**Editorial debt logged (Yoshi accepted ship-as-is, polish later).** The Matt 24 / 25 / 26 / 28 subagents heavily over-used the word *"substantial"* as a verbal tic across member_notes and summary_md prose. Baseline counts: Matt 17 template = 0; Matt 27 (clean) = 10; Matt 25 = 278; Matt 28 = 234; Matt 26 = 481; Matt 24 = **513**. The framework reads cleanly underneath — none of this breaks the 12 Red Lines or the 12-point checklist — but it reads as Claude-default-padding, not Yoshi's voice. Yoshi chose ship-as-is at S156 close per the publish-then-edit operating discipline; a polish-wheel sweep is the natural follow-up after Phase 10 ships. Sweep mechanics: per-file sed-pass won't do it cleanly (many "substantial"s are inside compound-modifiers like *substantial-substance*); needs editorial care. **Carry this as the v3 polish wheel.**

**Cross-thread member-additions that were considered and skipped.** Several Matt 26 / 27 / 28 movements call back to prior threads (S146 `righteous-one-condemned-shameful-death`, S154 `the-just-man-as-son-of-yahuah-condemned-and-vindicated-in-wisdom-of-solomon-2`, S155 Matt 20's `the-cup-of-suffering-and-the-vindication-of-the-righteous-...`, S155 Matt 22's `the-elect-one-at-the-right-hand-the-davidic-lord-witnessed-in-1-enoch-parables`). The subagents opted for new threads at each chapter rather than additive thread_members. Consolidation onto prior threads is a future editorial wheel — same low-priority as the voice-noise sweep.

**Matthew commentary + cross-reference apparatus is COMPLETE.** 28 of 28 chapters. Free-tier `chapter_intro` + Notes-tier short-form + Library-tier deep-dive + Library-tier per-verse cross-references + Companion-tier framework-thread cluster cards. The launch-blocking content track per Section III Launch Scope Lock has closed.

---

# S157 — Phase 10 opens

Per `BIBLE_APP_ROADMAP.md` §V, Phase 9 closes when all four launch-blocking deliverables land in production. With Matt 12–28 commentary done as of S156 close, Phase 9.1 closes. The remaining three launch-blockers (9.2 Hebrew-Greek interlinear, 9.3 lexicons, 9.4 native-OS TTS) may or may not have shipped in sessions Claude doesn't have a write-up for; that gets confirmed at S157 open.

The shape of Phase 10:

- **10.1 Android (Google Play Store, organization account `Remnant Of Promise`).** Capacitor wrap (`@capacitor/core` + `@capacitor/cli` + `@capacitor/android`); generate signing keystore (`~/Desktop/App/_signing/`, gitignored — losing it means no app updates ever again); build signed AAB + APK; stage APK at `bible.remnantofpromise.org/download/remnant-bible-vX.Y.Z.apk` for direct download (live immediately); submit AAB to Play Console Production (organization account exempts the 12-tester / 14-day Closed Testing rule); review window 1–7 days for first submission. Voice-gated listing copy (short description, full description, content rating).
- **10.2 iOS (Apple App Store).** Apple Developer Program account application starts in parallel ($99/yr, 24–48hr activation). `@capacitor/ios` install, bundle identifier (`com.remnantofpromise.bible` or similar), signing certs, App Store Connect listing. **Apple reader-app external-link entitlement application** — Apple requires explicit approval to use the entitlement that routes subscriptions through external Stripe checkout (97% revenue retention vs. Apple's 15–30%). TestFlight verify on a real iPhone before submission.

# Reads at S157 open

1. **Invoke `anthropic-skills:yoshi-voice`** — needed for voice-gating the Play Store / App Store listing copy, the content-rating answers, and any UI strings touched during the wrap.
2. **`BIBLE_APP_ROADMAP.md`** — §III Locked Decisions (platform: PWA-first, Capacitor wrap for store discovery, Apple reader-app entitlement for Stripe-on-iOS, organization account `Remnant Of Promise` on Play), §V Phase 9 + Phase 10 detail, the Launch Scope Lock at the end of §III.
3. **`REBUILD_STATE.md`** — current rolling state. Confirm Phase 9.1 closure showed up at the top; check whether 9.2 / 9.3 / 9.4 have ship-entries.
4. **`DESIGN_LANGUAGE.md`** — for any UI string voice-gating (the app icon, splash screen, store screenshots' chrome).
5. **Skim** `data-schema/migrations/session156_matt_*.sql` ONLY to confirm via `_session_info_` row or `schema_version` row that the S156 batch landed cleanly in prod; otherwise close S156 fully before opening Phase 10 work. If any S156 migration shows partial state, FIX before proceeding.

# Open Yoshi-questions at S157 (ask via AskUserQuestion, don't guess)

1. **Phase 9 closure check.** Are 9.2 (interlinear), 9.3 (lexicons), 9.4 (TTS) all done in production? If not, are we shipping the Capacitor wrap with whatever's currently live (publish-then-edit applies) or finishing those three first?
2. **Track priority.** Android-first (Play Console is faster + signed AAB is on home turf), iOS-first (Apple Developer activation takes 24–48hr — start the clock now), or both in parallel?
3. **APK direct-download.** Stage at `bible.remnantofpromise.org/download/remnant-bible-vX.Y.Z.apk` immediately (Yoshi can share the link the same day as the build), or sequential after Play submission?
4. **Listing copy.** Draft the voice-gated short description, full description, and content-rating questionnaire as the first build deliverable — or get the Capacitor build standing first and copy after?
5. **App icon / splash.** Use the existing PWA icon and parchment-brown splash, or design a store-listing-specific asset set?

# One-way doors — do NOT execute without explicit go-ahead

- **Android signing keystore generation.** Lose the keystore → no app updates ever again on Play. Generate, immediately back up offline (password too), then commit `.gitignore` for `_signing/`. Do not touch without Yoshi naming the backup location.
- **Apple Developer Program enrollment.** $99/yr, irreversible org-account assertion. Yoshi confirms business legal name (Remnant of Promise the 501(c)(3)) is the enrollee before submission.
- **Apple reader-app external-link entitlement application.** Submitting the entitlement request is reversible but adds review friction if denied; rationale (97% revenue retention to 501(c)(3) mission) should be voice-gated and Yoshi-approved before submission.
- **Play Console Production submission.** Once submitted, edits during review are visible to Google reviewers; pre-flight the listing copy with Yoshi before clicking submit.

# Order of operations

**Open with the Phase 9 closure check.** Until 9.2 / 9.3 / 9.4 are either shipped or explicitly waived under publish-then-edit, Phase 10 is moving the gate. Yoshi answers; from there:

- If Phase 9 stragglers remain and Yoshi wants them shipped first → execute them in the remaining-wheel order (9.4 native TTS is the cheapest at ~1 session; 9.3 lexicons next; 9.2 interlinear is the heaviest at 3–5 sessions). Phase 10 opens after.
- If Phase 9 is waived under publish-then-edit → start Phase 10 immediately. Run track-priority Q first, then either 10.1 or 10.2 by Yoshi's call. Apple Developer enrollment runs in the background regardless because activation latency.

**Carry-over context (v3 polish wheel).** The S156 "substantial" voice-noise sweep is logged above. Don't execute it in S157 — Phase 10 is launch-pacing work; polish runs after launch.

# Standing efficiency rules

No changes at S156. The parallel-subagent batch pattern (5 chapters / 5 subagents / 1 review pass + apply) closed Matthew in a single session; pattern is reusable for any future gospel commentary work (Mark, Luke, John when Yoshi decides). The S156 voice-noise tic is a known failure mode of the pattern — future subagent briefings should add an explicit "avoid the word *substantial* as a default modifier" gate to the briefing template.

**One forward rule to lock at S157 close (if S157 confirms it):** if the parallel-subagent pattern is used again, the briefing template gains a "no *substantial* tic" line, and the review pass spot-grep for the word. Costs nothing; catches the v3-polish-debt at draft time.
