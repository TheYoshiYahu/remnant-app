# S194 — Scripture-Sweep Batch 1 Verification (John 2, 7, 9, 16)

**Date:** 2026-06-03
**Orchestrator/verifier:** Claude (lead session)
**Producer:** Claude subagent minion (paragraph-only; no question box)
**Migration produced:** `App/data-schema/migrations/session194_john_2_7_9_16_xref_threads.sql`

---

## Verdict: CLEAN — accept and merge

Batch 1 clears both halves of the per-batch QA gate: the anchoring + template-bleed audit and
the 12-Red-Lines / Come-and-See voice pass. The migration is idempotent, single-chapter-anchored,
bleed-free, and framework-faithful.

---

## Why this batch, and why it is first

The locked traversal order finishes the NT gospels first by gap-completion, not rebuild. An
orchestrator survey of the four gospels' existing cross-reference migrations established where the
real gaps are — measured by whether any thread member's **source** verse lands in a chapter (the
endpoint selects a chapter's card by `sv.chapter_id`, so a chapter with no source-verse member has
no card):

| Gospel  | Chapters | Chapters with a card | Gap chapters |
|---------|----------|----------------------|--------------|
| Matthew | 28       | 28 (S110 + S131–156) | none |
| Mark    | 16       | 16 (S183)            | none |
| Luke    | 24       | 24 (S185)            | none |
| **John**| 21       | 17 (S181)            | **2, 7, 9, 16** |

John was the only gospel with chapters carrying no card at all. Chapters 2 (Cana / temple
cleansing), 7 (Tabernacles / rivers of living water), 9 (the man born blind), and 16 (the
Comforter / sorrow-into-joy / "I have overcome the world") are all substantial. Those four became
the first work-unit — a clean batch of four, inside the ≈3–5 target.

## What the minion produced

Twelve NEW threads, three per chapter, ninety-seven member rows, mirroring the S181 John format
exactly (transaction-scoped `_s194_john_lookup` canon view, thread INSERTs, `WITH input(...) AS
(VALUES …)` → `cross_references` → `thread_members` link blocks, `COMMIT`). Sort orders 1101–1112.
All threads `tier='free'`.

- **John 2 (24 rows):** `cana-new-wine-the-messianic-banquet-begun`,
  `zeal-for-thine-house-the-temple-cleansed`,
  `destroy-this-temple-the-body-raised-in-three-days`.
- **John 7 (25 rows):** `rivers-of-living-water-the-tabernacles-outpouring` (9 members),
  `division-over-him-the-stone-of-stumbling`,
  `my-doctrine-is-not-mine-the-sent-one-and-the-torah`.
- **John 9 (24 rows):** `light-of-the-world-opening-the-blind-eyes`,
  `for-judgment-the-seeing-made-blind`,
  `cast-out-of-the-synagogue-the-shepherd-receives-the-outcast`.
- **John 16 (24 rows):** `the-comforter-the-spirit-of-truth-who-leads-into-all-truth`,
  `your-sorrow-turned-into-joy-the-travail-then-the-birth`,
  `i-have-overcome-the-world-peace-in-the-day-of-trouble`.

## QA gate — anchoring + template-bleed (static parse, no live DB)

1. **Thread anchoring** — all 12 NEW threads are single-chapter-anchored, `anchor_verse_id_start`
   and `_end` both in their own John chapter (2/7/9/16). Zero spanning threads, so the
   distinct-membership burden a span carries does not arise. PASS.
2. **Sources stay home** — every one of the 97 member source verses lands in its thread's home
   chapter. The distinct source-chapter set across the file is exactly {2, 7, 9, 16}. PASS.
3. **Template-bleed within the file** — zero duplicated explanatory member notes across all 97
   rows. PASS.
4. **Cross-file bleed vs. S181 John** — zero shared member-note strings with the existing John
   migration. The new threads teach fresh; they do not copy S181. PASS.
5. **Slug + sort-order collision** — no slug collides with any S181 John thread; sort range
   1101–1112 is clear of S181's 1001–1016. PASS.
6. **Idempotency** — `ON CONFLICT DO NOTHING` present on every INSERT (threads on `(slug)`,
   cross_references on `(source_verse_id, target_verse_id, source)`, members on
   `(thread_id, cross_reference_id)`). PASS.

## QA gate — voice / 12 Red Lines / Come-and-See

- **No Jew-Gentile binary** — zero "Gentile(s)" in the file. The reception-failure and gathering
  material is carried in the scattered-seed register (the outcasts of Yashar'el (Israel) received
  into the house of prayer; the divorced-and-scattered wife drawn home). PASS (Red Lines #1, #3, #7).
- **No antinomian Paul / Torah-as-curse** — the two "abolish" occurrences both *refute* the
  antinomian reading: the One "the pulpit later casts as the abolisher of the Torah" is shown
  rebuking the people for *not keeping* it, and the cross "did not abolish the consequence-system."
  PASS (Red Lines #2, #4).
- **Spirit not separated from Torah** — the John 7 rivers thread states the outpouring "does not
  lead away from the Torah; it writes the Torah on the heart … the same Spirit who spoke at Sinai."
  PASS (Red Line #6).
- **Red Line #10 grammar** — grace framed as homecoming with the consequence-system still
  operative ("the cross opened the door home; it did not abolish the consequence-system or lift the
  believer out of the operation of [the curse]"). No standalone sola-fide formula. PASS.
- **Sacred Names throughout** — `Yahuah (the LORD)` ×61 (source-echo casing), `Yahusha (Jesus)`,
  `Elohim (God)`, `Yashar'el (Israel)`, `Yahudim (Jews)`, `Ruach HaKodesh (Holy Spirit)`,
  parenthetical on every mention. The Son is never mislabeled `Yahuah (Jesus)` (zero), and the
  John 9:38 vocative is correctly preserved as "Lord, I believe" per the NT-*Lord* governing rule.
  PASS.
- **Son of Adam / kaph** — zero "son of man" left un-restored. No kaph-comparative verses
  (Daniel 7:13 / Revelation 1:13 / 14:14) were warranted by these four chapters, so the rule had
  nothing to act on. PASS.
- **Come and see — quote, don't cite** — every load-bearing verse is quoted in full inside the
  member note with the navigational citation in conventional-English book-name form at the end
  (`(Isaiah 25:6)`, `(Malachi 3:1-3)`, `(Zechariah 14:8-9)`, `(John 2:1, 9-10)`). No bare
  citations, no appendix posture, no internal-document references ("Red Line", "the contract",
  "appendix" all zero). PASS.
- **English book-name slugs** — all 12 thread keys use English book-name fragments. The
  Hebrew prophet-name forms that appear (`Yeshayahu (Isaiah) 25`, `Tehillim (Psalm) 69`,
  `Zekharyah (Zechariah) 14`) are prophet-as-author references in running prose — translator's-call
  and consistent with the already-approved S181 John file — not navigational citations or slugs.
  PASS.

## Strongest cross-library connections surfaced

The rivers-of-living-water thread (John 7:37–39) anchors the Tabernacles water-drawing rite to
Zechariah 14:8's living waters going out from Yerushalayim (Jerusalem) — set inside the very feast
Zechariah 14 ties to those waters — and folds in the new-heart promise of Ezekiel 36. The Cana
thread reads the first sign as the opening note of the Isaiah 25 / Amos 9 gathering-banquet, set at
a wedding because the gathering is itself Hosea's betrothal of the scattered house. The John 9
cast-out thread runs the healed man's expulsion-then-reception straight into Ezekiel 34's
shepherd-seeking and Isaiah 66:5's "cast out for my name's sake." John 16:33 is held against
Jeremiah 30:7's still-standing day of Ya'aqov's (Jacob's) trouble — the door opened without the
curse-system abolished.

## Flagged calls (producer judgment, verifier-accepted)

1. **Extras-library targets deferred to a future extras-targeted migration.** The `_s194_john_lookup`
   view is canon-scoped, exactly like S181/S183, so a member row whose target is an extras book
   (1 Enoch, Jubilees, etc.) would silently drop on the join. Per the S183 header precedent, all 97
   resolvable member rows are canon (Tanakh + four intra-John targets), and the extras connections
   are carried as reader-facing framework substance only. **Accepted** — matches the established
   pattern; the deferred extras links (e.g. John 7 rivers → 1 Enoch's fountains; John 9 light →
   1 Enoch 48–49's light-of-the-nations Elect One) are noted for the future extras pass.
2. **Two intra-John targets** (John 2:4 → 7:30 "mine hour"; John 7:43 → 10:26 hearing/not-hearing).
   Both keep the **source** verse in the home chapter, so the card still lands correctly; only the
   target ranges out, which the contract permits. **Accepted.**
3. **No Son-of-Adam / kaph verses arose** in these four chapters. **Accepted** — noted for
   completeness.

## Not done this session (carried)

- **Live JSON / psql render** of a sample card was not produced — no seeded Postgres available here,
  same constraint as S193. The contract conformance was confirmed statically against the migration
  structure. Re-run against a live DB when one is available to confirm the four chapters now render
  cards.
- **§0 shipped-list check vs. v1.0.9** remains blocked pending re-supply of
  `REMNANT_STUDY_BIBLE_SPEC.md` (still not on Desktop this session).
- **S192 wheel-gate** (TestFlight under Remnant of Promise vs. defer iOS) remains open, unrelated to
  the sweep.

## Recommended next batch

John's card-level gaps are now closed (pending merge). With Matthew, Mark, Luke, and John all
chapter-covered, the gospel gap-completion pass is essentially complete at the card level. Next
under the locked order is **Acts** (begin a fresh anchored pass, chapters 1–5 as Batch 2), then the
epistles → Revelation → Tanakh. A deeper, optional follow-on for the gospels would be enrichment of
thinly-covered single-member chapters in Mark/Luke, but that is enrichment, not gap-completion, and
should wait behind Acts.
