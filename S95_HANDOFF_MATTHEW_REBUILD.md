# S95 Session Handoff — Free-Tier Corpus Shipped for Matthew 1-12

**Authored by Claude at S95 close, 2026-05-20. Read this first at S96 open. Read `S94_HANDOFF_MATTHEW_REBUILD.md` for the three-tier architecture correction that governs the file-type structure. S93 / S91 / S89 read-as-needed.**

## §A. What landed at S95

**Twelve free-tier files derived from existing matthew-N-short.md long-forms.** `commentaries/matthew-1-free.md` through `commentaries/matthew-12-free.md` — the NEW file type introduced by the S94-close three-tier architecture correction. Each file is a single running-prose paragraph compressing the chapter's framework moves and rendering-rationale in the shape of the 1 Corinthians 11 live-rendered chapter-end footnote at `restoration-pipeline/YOSHI_RENDERED_PASSAGES.md`.

**Total corpus.** 5,662 words across the twelve files. Per-chapter word counts: matt-1 (390), matt-2 (364), matt-3 (448), matt-4 (442), matt-5 (431), matt-6 (480), matt-7 (455), matt-8 (475), matt-9 (516), matt-10 (513), matt-11 (520), matt-12 (628). Lighter chapters land in the handoff-specified 250-400 band; mid-density chapters run 430-480; the dense framework chapters (matt-9 through matt-12, including the matt-12 framework-density-peak) run 510-630 because the chapters carry more framework anchors per chapter than the 1 Cor 11 shape-model.

**Voice-gate verification ran clean across all twelve.** Zero *son of man* (one S95 catch in matt-9 fixed — the phrase appeared in scare-italics naming the prior English flattening; rewritten). Zero *canannited* (INTERNAL-ONLY scope held; not on a single reader-facing surface). Zero Jew-and-Gentile binary phrasing. Zero Reformation-grammar truncated phrases (no *saved by grace through faith* standalone, no *not under law but under grace,* no *sola fide,* no *sola scriptura*). Zero Hebrew book-name violations in citation position (every book-citation in conventional English per S88's locked rule). Deity name and covenant people-name parentheticals corrected during the sweep — matt-3 had five bare mentions, matt-4 had six bare mentions, matt-6 had two, matt-8 had a Yahudim→Yahudi adjective-form correction, matt-11 had one. All now carry parenthetical at every mention.

**One defensible non-standard parenthetical preserved at matt-1.** The etymology-passage renders *Yahusha (Hebrew Yah saves — Yahu, the short divine name, plus sha from yasha, to save) is preserved over the latinized Jesus.* The parenthetical carries the Hebrew etymology rather than the conventional *(Jesus),* with *Jesus* invoked by name in the next phrase. Reader-recognition function served substantively. Yoshi reviewed at S95 close; the form lands as accepted-as-written for this single rendering-rationale instance.

## §B. The three calls Yoshi made at S95 close

**Word-count discipline.** Accepted as-is. The soft band (lighter chapters 364-390, denser chapters 510-520, matt-12 framework-density-peak at 628) holds. A strict 400-cap would require cutting load-bearing framework moves from the dense chapters; the framework-fidelity discipline wins over a uniform word-count.

**matt-1 etymology-parenthetical.** Accepted as-is. The single instance where the parenthetical carries the Hebrew etymology rather than *(Jesus)* stands as rendering-rationale prose where the function is served substantively by the surrounding sentence.

**Engineering handoff for ingestion.** Ready to wire when Yoshi calls for it. The `commentary` field in `canon.json` per the existing engineering plan now reads `matthew-N-free.md` (NOT `matthew-N-short.md`). Twelve files are on disk at `commentaries/matthew-N-free.md`. The ingestion script can run whenever the engineering pass is opened.

## §C. The three-tier architecture as it stands at S95 close

The S94-close correction holds with one operational update: from matthew-13 onward, EACH new chapter produces THREE file types in the same authoring session.

**Tier 1 — FREE.** `matthew-N-free.md`. 250-400 words target with flex for dense chapters. Running prose, 1 Cor 11 chapter-end-footnote shape. Both rendering-rationale (lexical/idiomatic decisions) and substance (the chapter's framework moves). All-canonical-scripture cross-references render and navigate; restored-library cross-references paywall. Ingestion target: `commentary` field in `canon.json`.

**Tier 2 — $4.99.** `matthew-N-short.md`. 5,000-6,500 words. The come-and-see strict-read long-form running-prose commentary — every load-bearing verse quoted in stand-alone italics. All-texts cross-references render and navigate (canon + restored library). Ingestion target: separate field/table per the engineering queue.

**Tier 3 — $9.99 (DEFERRED user-facing).** `matthew-N.md`. The audited sectioned long-form with the cross-reference apparatus block at §N+1. Continues to be authored as the database-source for `cross_references`, `cross_reference_threads`, and `cross_reference_thread_members`. User-facing surface deferred from launch.

The Yoshi-locked decision at S95 open: when matthew-13 work begins, produce all three layers (free.md + short.md + matthew-N.md) in the same session per chapter going forward.

## §D. What's outstanding at S95 close

**Matthew chapters remaining (16 chapters):** matthew-13 through matthew-28. matthew-13 = parables of the kingdom (sower, wheat-and-tares, mustard seed, leaven, treasure, pearl, net) — a major chapter with multiple framework anchors. matthew-14 through matthew-28 at standard pacing.

**Per-chapter work from matthew-13 forward:** three files per chapter — matthew-N-free.md (the new free-tier paragraph, ~250-400 words; ~10-15 minutes of compression work derived from the chapter's own short-form once the short-form is written); matthew-N-short.md (the come-and-see strict-read long-form, ~5,000-6,500 words; the heaviest piece of work per chapter); matthew-N.md (the audited sectioned long-form + cross-reference apparatus block; database-source).

**Session-budget reality check.** A single chapter of matt-13-scale work — long-form short.md + audited matthew-N.md + free.md derivation — is a full-session piece of work at the S91-S94 pacing-calibration. Lighter chapters (matt-14, 15) may permit a chapter-and-a-half-equivalent. Yoshi's instruction at S95 close: "13 through however many chapters you can handle next session" — pace honestly against the wrap-signal calibration, do not over-commit on chapter-count up-front, deliver what the session-budget allows at strict-read standard.

**Outside-Matthew audit list (carry-forward from S89-S94):**
- `commentaries/1-corinthians-11.md` — body rewrite + canon.json shipped string rewrite.
- `commentaries/john-1.md` — final-pass posture audit + short-form layer (waits until Matthew is finished per S89's decision #4).
- `commentaries/_COMMENTARY_SUMMATION.md` — at the right posture per S88; no further work needed.

**Engineering queue (consolidated from S94 §H, unchanged at S95 close):**

*Load-bearing for free-tier launch:*
- Snippet truncation removal in cross-reference rendering — verses render in full.
- MEMBERS IN THIS CHAPTER sub-header retirement on thread cards.
- Ingestion script for `commentary` field in `canon.json` — reads `matthew-N-free.md` (NOT `matthew-N-short.md`).
- Engineering-side tier-tagging on cross-reference rendering — Tanakh + NT clickable for free users; restored-library cross-references paywalled.
- Paywall popup on out-of-tier cross-reference clicks.

*Load-bearing for $4.99 tier launch:*
- New table or field for the $4.99 commentary — separate from the `commentary` field that holds the free paragraph.
- API endpoint for the $4.99 commentary view.
- Wire the $4.99 commentary into the PWA at the chapter view.
- Restored-library navigation paths — 1 Enoch / Jubilees / Jasher etc. cross-references open the appropriate restored-library chapter for paid users.
- Subscription / entitlement check on the $4.99 tier.

*Cross-reference ingestion (load-bearing for ALL tiers):*
- Ingestion script for the apparatus data in each chapter's `§-Cross-Reference-Apparatus` block — populates the three cross-reference tables per the existing contract.

*UX (load-bearing for the launch flow):*
- Short-tap navigates; long-press opens action menu (highlight / bookmark / note / more).
- Polymorphic schema for `user_highlights`, `user_bookmarks`, `user_notes` over verse / commentary-element / cross-reference-row.

*Deferred from launch:*
- $9.99 tier user-facing surface.
- `chapter_long_form_commentary` table migration + ingestion for matthew-N.md files.
- Blind-user mode (per S94 §G) — major post-launch work-stream.

## §E. Calibration models for S96 free-tier work

The cadence locked at S95 is matthew-1-free.md through matthew-12-free.md. For S96 derivations from matthew-13 onward, the freshest in-band calibration models are the dense-chapter free-tier files: matt-9-free.md (516 words, eight numbered framework moves), matt-10-free.md (513 words, mission-scope architecture at vv.5-6 plus supporting beats), matt-11-free.md (520 words, two framework-major anchors framed by surrounding moves), matt-12-free.md (628 words, three framework-major moments plus the Isaiah 42 servant-citation). Lighter-chapter calibration: matt-2-free.md (364 words, six framework moves).

The shape pattern across all twelve: lead-sentence positioning the chapter against the gospel-arc, then numbered (1)-(N) framework moves with rendering-rationale folded inline where lexical/idiomatic decisions are load-bearing, closing on the chapter's transition-substance into the next chapter. Scripture references are parenthetical citations (not stand-alone-italics — that's the strict-read $4.99 short-form discipline). Sacred names with parentheticals on EVERY mention for Deity names and covenant people-names; on first appearance only for patriarch names (per the translator's-call rule).

## §F. Wrap-signal calibration held

The three triggers from S93's calibration: substantive-turn count at or beyond 25-30, AND/OR context budget at or beyond ~70%, AND/OR observable error-rate threshold (multiple corrections in close succession on similar work). A feeling of fatigue is not a wrap signal. If a wrap is called and none of the three triggers is actually present, name it as *I'm choosing to wrap early because [reason]* and let Yoshi decide whether to override.

S95 ran through twelve free-tier file authorings plus the voice-gate sweep within the context budget; the session wrapped at the verbal-answers-transcribe checkpoint when the free-tier corpus was complete and Yoshi gave the session-close instruction.

## §G. Provenance

Session 95, 2026-05-20. Yoshi's instruction at session open: start at matthew-1 for the free-tier derivations; from matthew-13 onward author all three layers (free.md + short.md + matthew-N.md) per chapter. Twelve free-tier files derived. Voice-gate verification ran clean on all five hard checks (son of man, canannited, Jew-and-Gentile binary, Reformation-grammar, Hebrew-book-names). Deity and covenant people-name parentheticals corrected across five files during the sweep. The three S95-close calls landed accepted-as-is. The Yoshi-locked operational pattern for S96 onward: matthew-13 produces three file-types in the same session, paced honestly against the wrap-signal calibration.
