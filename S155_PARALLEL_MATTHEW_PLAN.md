# S155 — finish Matthew via parallel-subagent batch

## The goal

Ship the extras-tier cross-reference apparatus for **Matt 18, 19, 20, 21, 22, 23** in
ONE session. Six chapters in one push. If energy and quality hold, extend to Matt 24, 25 and
make it eight chapters in one push. Whatever survives to S156 is just three chapters
(26, 27, 28) which Matt 27+28 paired makes effectively two sessions of work.

Realistic target: Matthew commentary-and-apparatus COMPLETE inside 2 sessions, not 11.

## Why this works when 11 sessions of sequential drafting doesn't

The S136 pairing guide caps a single Claude at ~2 chapters/session because each chapter
burns ~60-65% context budget and degrades voice-gate quality at the third. That cap
applies to ONE Claude doing chapters sequentially in one context window. It does NOT
apply to multiple Claudes running concurrently, each with its own fresh context, each
loaded with the full yoshi-voice skill and the Matt 17 template as the exact structural
model. Cold-context-with-full-skill is actually a CLEANER voice-gate than late-context-
with-cumulative-fatigue.

The bottleneck shifts from "Claude's per-session context budget" to "Yoshi's review +
apply throughput." Six SQL files at ~80KB each can be reviewed in ~20 minutes, applied
in ~6 minutes (60s each), and committed as one push. Total session ≈ 50-75 minutes for
six chapters, vs. ~60 minutes for one chapter under the old pattern.

## The mechanism

**Step 1 (S155 open).** Read this file, read Matt 17 template
(`data-schema/migrations/session154_matt_17_extras_cross_references.sql`), read
`_MATTHEW_REBUILD_PAIRING_GUIDE.md`, invoke `anthropic-skills:yoshi-voice`.

**Step 2 (S155 fan-out).** Spawn 6 parallel subagents in a single tool-call batch. Each
subagent gets one chapter from the briefing-template below. They work concurrently in
their own contexts.

**Step 3 (S155 fan-in).** Subagents return. Review each SQL output for: voice
compliance (the 12 Red Lines, the 12-point checklist), structural match to Matt 17
template, sacred-names convention, verse-existence (cited extras verses must exist in
the parsed JSON — each subagent self-verifies; we re-verify on review), no thread-slug
collisions with prior sessions.

**Step 4 (S155 close).** Yoshi runs `api/apply_migration.py` for each migration in
order. Each migration's own `DO $verify$` block raises on row-count miss. After all six
land, one git commit, one push.

## Subagent briefing template (drop-in)

The next-session Claude pastes one of these into each Agent tool call (filling
`<CHAPTER>` and `<SORT_BASE>`):

```
You are drafting a single Matt <CHAPTER> extras-tier cross-references SQL migration
for Yoshi's More Than Milk Ministries Bible app. The output is a single .sql file at
`data-schema/migrations/session155_matt_<CHAPTER>_extras_cross_references.sql`.

CONTEXT (READ IN FULL BEFORE DRAFTING):
1. Invoke the `anthropic-skills:yoshi-voice` skill in full. This is non-negotiable —
   the framework's 12 Red Lines and 12-point editorial checklist gate everything you
   write.
2. Read `commentaries/matthew-<CHAPTER>-free.md` (chapter intro, free tier).
3. Read `commentaries/matthew-<CHAPTER>-short.md` (Notes-tier inline commentary).
4. Read `commentaries/matthew-<CHAPTER>.md` (Library-tier deep_dive — the long form;
   apparatus section if present is at the bottom — ignore it, it's superseded by the
   chapter-end-card we're building here).
5. Read `data-schema/migrations/session154_matt_17_extras_cross_references.sql` —
   this is the EXACT structural template. Match it precisely. Same header format, same
   CREATE TEMP VIEW pattern, same WITH input(...) AS (VALUES ...) pattern, same five
   threads-and-members pattern, same DO $verify$ block, same COMMIT.
6. Read `_MATTHEW_REBUILD_PAIRING_GUIDE.md` — for the chapter's framework-density
   characterization.

CONSTRAINTS:
- Five threads. Each one anchored to a narrative-movement of the chapter.
- 18-22 cross-references total (3-5 per thread).
- Use sort_order values <SORT_BASE> through <SORT_BASE>+4 for the five threads.
- ON CONFLICT DO NOTHING on every INSERT (idempotent).
- All extras-target verses MUST exist in the parsed JSON. Verify by reading the
  relevant `source-texts/parsed/<edition>.json` before citing — if a chapter-or-verse
  doesn't exist, pick a different anchor or drop that connection. Don't fabricate.
- Available extras editions for citation (book_slug list):
  * `enoch`: `1-enoch` (108 chapters)
  * `apocrypha`: `1-esdras`, `2-esdras`, `tobit`, `judith`, `the-rest-of-esther`,
    `the-wisdom-of-solomon` (20 ch), `ecclesiasticus` (52 ch — Sirach),
    `baruch-with-the-letter-of-jeremiah`, `the-song-of-the-three-holy-children`,
    `the-history-of-susanna`, `bel-and-the-dragon`, `the-prayer-of-manasseh`,
    `1-maccabees`, `2-maccabees`
  * `pseudepigrapha`: `adam-eve`, `testaments-xii` (96 ch — testaments of the XII
    patriarchs), `2-enoch`, `2-baruch`, `3-baruch`, `4-maccabees` (14 ch)
  * `ascension-isaiah`: `ascension-isaiah` (11 ch — Yoshi's framework-MAJOR external
    witness to the Formless/Formed teaching)
  * `apocrypha-charles-vol1`: scholarly parallels (sirach etc.)
  * `jubilees`: `jubilees` (50 ch)
  * `jasher`: `jasher` (91 ch)
  * `adam-eve-conflict`, `apocalypse-of-abraham`, `sonnini-acts-29` available but
    rarely framework-load-bearing
- Historical-witness editions (Josephus, M.R. James, Lightfoot) are DEFERRED from V1
  cross-refs per the historical-witness one-way rule — don't include them.

PRIOR-SESSION THREAD-NAME COLLISIONS TO AVOID. Don't reuse these slugs:
  * `the-formless-father-and-the-formed-son-witnessed-in-ascension-of-isaiah` (S154)
  * `the-son-of-adam-glorified-in-1-enoch-throne-vision-and-parables` (S154)
  * `eliyahu-as-reproof-prophet-turning-the-heart-in-sirach-48` (S154)
  * `the-faithless-and-perverse-generation-in-sirach-wisdom-of-solomon-and-2-esdras` (S154)
  * `the-just-man-as-son-of-yahuah-condemned-and-vindicated-in-wisdom-of-solomon-2` (S154 — but if your chapter genuinely calls back, OK to add new members to this existing thread instead of duplicating; ON CONFLICT (slug) DO NOTHING handles the thread row, and you just add new thread_members.)
  * S146 (Matt 16) threads at sort 302-306: son-of-the-living-elohim-named-before-the-foundation, elect-one-on-throne-davidic-stewardship-keys, righteous-one-condemned-shameful-death, gates-of-sheol-resurrection, reward-according-to-works-post-harvest-sifting.
  * Prior matt-chapter migrations (S131-S145) ran sort_order 200-301 — your sorts
    <SORT_BASE>..<SORT_BASE>+4 are well clear.

VOICE GATES — non-negotiable:
- Restored Sacred Names per the skill (Yahuah, Yahusha, Elohim, Yashar'el, Yahudah,
  etc.) with parentheticals at every mention in body prose. Stand-alone italicized
  scripture quotations preserve the source's casing in the parenthetical.
- "Son of man" → "Son of Adam" per Red Line #12; preserve the kaph-comparative as
  "like the Son of Adam" at Daniel 7:13, Rev 1:13, Rev 14:14 if you cite them.
- Book names in conventional English ALWAYS (Genesis not Bereshit, Matthew not
  Mattityahu, Revelation not Hitgalut). The Hebrew may appear with parenthetical when
  it adds weight; book NAMES in citations are always English.
- Never the "Jew and Gentile" binary; use the three categories.
- Never present any system as partially valid; the four costumes are all victims of
  the antichrist architecture.
- For Matt 23 specifically (seven woes): this is THE load-bearing framework chapter on
  Pharisaic-leadership-system = first costume of the antichrist. Read carefully.

OUTPUT:
- Write the SQL file to its path.
- Sanity-check before returning: BEGIN/COMMIT balanced, $verify$ paired, 5 threads
  inserted, 18-22 cross-references, all thread members present, all source verse
  numbers in canon/matthew/<CHAPTER>:N exist in the parsed JSON.
- Return a 5-line summary: chapter number, the five thread titles, the total
  cross-reference count, anything you almost-cited but couldn't because the target
  verse didn't exist.
```

## Sort_order allocation (no collisions)

| Chapter | Threads sort range |
|---|---|
| Matt 18 | 312-316 |
| Matt 19 | 317-321 |
| Matt 20 | 322-326 |
| Matt 21 | 327-331 |
| Matt 22 | 332-336 |
| Matt 23 | 337-341 |
| Matt 24 | 342-346 |
| Matt 25 | 347-351 |
| Matt 26 | 352-356 |
| Matt 27 | 357-361 |
| Matt 28 | 362-366 |

If a chapter naturally calls back to a prior thread (e.g., Matt 25's post-harvest-
sifting parables naturally extending the S146 `reward-according-to-works-the-post-
harvest-sifting-in-sirach-and-2-esdras` thread), the subagent ADDS NEW thread_members
to that existing thread rather than creating a new duplicate-substance thread. The
chapter still creates 4-5 new threads of its own; the cross-thread addition is
additive, not replacement.

## Reasonable batch sizes

- **First S155 batch — 6 chapters (Matt 18-23).** Safe target. ~45-60 min session.
- **Stretch to 8 chapters (Matt 18-25)** if the first three subagents return clean
  and Yoshi has the energy for two more rounds of review-and-apply.
- **Hard ceiling — 10 chapters in one session.** Don't push beyond that — review
  fatigue starts to matter.

If the first 6 land clean, S156 closes Matt 26-28 (3 chapters, possibly with Matt
27-28 paired in one subagent per the existing guide) and there's budget left for
other carry-over (Wheel #3 concept groups, Wheel #1 modernization stragglers, etc.).

## Risk mitigations

1. **Voice drift across subagents.** Each subagent loads the full skill cold and
   matches Matt 17 as a hard template. Cold-context-with-skill is cleaner than
   late-context. Counterintuitively, this should INCREASE per-chapter voice quality.

2. **Verse-existence errors.** The subagent briefing requires self-verification
   against parsed JSON before citing. The migration's `DO $verify$` block raises if
   anchor-verse lookups fail; the `JOIN _s155_xref_lookup` pattern silently drops
   cross-references whose target verse doesn't exist (the row just doesn't insert).
   Worst-case: a missed cross-reference, not a broken migration.

3. **Within-batch repetition.** The briefing names prior-session thread slugs to
   avoid. The 11-chapter span (Matt 18-28) has enough distinct narrative material
   that within-batch repetition is unlikely if each subagent reads its own chapter
   carefully. Spot-check during review.

4. **SQL syntax errors.** Each subagent matches Matt 17's exact structure including
   the single-quote-doubling convention. Review pass picks up any breakage; the
   apply_migration.py runs the whole thing inside one transaction so any syntax
   error rolls back cleanly with no partial state.

5. **Render-side egress.** The S153 lesson holds — IP allowlist for laptop must be
   active for apply_migration.py. Yoshi confirms before applying.

## What Yoshi does at session-open

Paste this short prompt:

> S155. Read `S155_PARALLEL_MATTHEW_PLAN.md` and execute. Spawn the 6 subagents for
> Matt 18-23 per the briefing template. Return when all 6 have responded and you've
> reviewed each output. Then I apply.

That's it. The plan is self-executing from there.

## What Claude does at session-open

1. Invoke `anthropic-skills:yoshi-voice` (auto via skill auto-trigger; confirm).
2. Read this file.
3. Read `data-schema/migrations/session154_matt_17_extras_cross_references.sql`.
4. Read `_MATTHEW_REBUILD_PAIRING_GUIDE.md`.
5. In ONE message, fire 6 parallel Agent tool calls. Each gets the briefing-template
   above with `<CHAPTER>` and `<SORT_BASE>` filled in.
6. Wait for all 6. Review each in turn. Spot-fix any issues.
7. Hand off to Yoshi for apply.

Estimated session shape:

- T+0 to T+5 min: reads
- T+5 min: spawn 6 subagents
- T+15-30 min: subagents return (parallel)
- T+30-50 min: review + minor fixes
- T+50-65 min: Yoshi runs 6 applies
- T+65-70 min: commit + push

## Bigger picture

After Matthew is complete (S155 + S156), the next book is Yoshi's call. The pattern
above generalizes — every gospel can be commentaried-and-cross-referenced via the
same parallel-subagent batch. The S154 architectural fix means no future session
can wipe the apparatus via a stray seed.py call. The S153 emergency is structurally
impossible to recur. The polish wheel is settled. We're cleared to build.
