# S194 — Scripture-Sweep Minion Orchestration Plan
### Cross-references + chapter-end cards across the library

**Owner:** Yoshi · **Orchestrator:** Claude (lead session) · **Producers:** Claude subagent minions
**Status:** Ready to execute next session. Decisions below are locked from the S193 wrap.

---

## ⚠ HARD OPERATIONAL RULE — read first

**Minions must NEVER call the question-box / AskUserQuestion tool.** It jams the system and forces a
restart (observed, repeatable). Every minion communicates in **plain paragraph text only** — it
reports findings, blockers, and decisions as prose back to the orchestrator. The orchestrator
likewise speaks to Yoshi **directly, paragraph-style**, never via the question box during a
minion run. If a minion hits a genuine ambiguity, it states the ambiguity in prose and makes the
best framework-consistent call, flagging it for the orchestrator's verification pass — it does not
stop and prompt.

---

## Locked decisions (S193 wrap)

1. **Traversal order — finish the NT gospels first.** Fill every remaining chapter-end-card / xref
   gap across Matthew, Mark, Luke, John, then move outward: Acts → the epistles → Revelation →
   Tanakh. The four gospels already have substantial coverage (Matthew S110 + extras S131–156;
   Mark S183; Luke S185; John S181) — the first pass is gap-completion, not a rebuild.
2. **Work-unit — a batch of chapters per minion.** Each minion owns a small batch (≈3–5 chapters),
   and the chapter-anchoring check is run **per chapter** inside the batch, not per batch.
3. **Verification — the orchestrator verifies.** No separate verifier minion. After each minion
   returns, the orchestrator runs the audit script + the voice/Red-Lines check before the SQL is
   accepted and merged.
4. **Full restored library, edition-aware schema — NON-NEGOTIABLE (locked S194).** Every migration
   uses the **edition-aware** lookup view and tuple schema of the Matthew extras worked example
   (`session135_matt_6_extras_cross_references.sql`): a temp view scoped
   `WHERE e.slug IN ('canon','enoch','jubilees','jasher', …all scripture-level extras editions…)`,
   and `input(...)` tuples that carry **`src_edition` and `tgt_edition` columns**, joining
   `sv.edition_slug = i.src_edition` and `tv.edition_slug = i.tgt_edition`. Cross-references are
   bidirectional across the full restored library (canon ↔ Apocrypha ↔ Pseudepigrapha ↔ 1 Enoch ↔
   Jubilees ↔ Jasher ↔ Adam-Eve ↔ Apocalypse of Abraham ↔ Ascension of Isaiah). The **canon-only
   schema** used by S181/183/185 (John/Mark/Luke, no edition columns, `e.slug = 'canon'`) is
   **RETIRED — never copy it.** A migration that targets canon only is a regression and fails the
   QA gate. This is what S194 caught: the John 2/7/9/16 batch was authored canon-only against the
   John precedent and had to be flagged. The standard is Matthew's, not John's. Coverage state and
   the back-fill plan for the six canon-only books live in `App/XREF_LIBRARY_COVERAGE_ROADMAP.md`.

---

## Every minion's required reading (before producing a single row)

A minion that hasn't loaded the lens will quietly Christianize the text and miss the connections
the work exists to surface. Each minion, at spawn, reads **in full**:

1. **`yoshi-voice` SKILL.md** — the framework spine: the Foundational Lie, the Three Categories
   (Judah / scattered seed / nations — never the Jew-Gentile binary), the Four Costumes, the
   12 Red Lines, the Sacred Names convention, and the Come-and-See authoring posture.
2. **`yoshi-voice/references/framework-deep.md`** — the deep apologetic (the Judaizer lineage,
   Paul, Galatians verse-by-verse, Romans 11 olive tree, Adam/the tares, the Nature of God,
   the Revelation framework). Required because nearly every chapter touches this terrain.
3. **`api/CHAPTER_END_CARD_CONTRACT.md`** — the data/teaching apparatus: the thread + member
   schema, tiers, and how a card renders.
4. **`App/data-schema/migrations/session135_matt_6_extras_cross_references.sql`** and
   **`session183_mark_xref_members_and_threads.sql`** — the two canonical worked examples (the
   per-chapter extras format and the combined threads + bulk-additions format).

## The teaching disciplines minions must produce to (from the voice skill)

- **Come and see — quote, don't cite.** The first time a verse is load-bearing, it gets its own
  full italicized line with the citation in parentheses at the end. No bare `per Isaiah 53`.
- **No appendix, no internal-doc references.** The card carries the work; nothing points the reader
  to scaffolding they can't see (`per Red Line #11`, `per the contract` — forbidden in reader text).
- **Cross-references are bidirectional across the full restored library** — canon ↔ Apocrypha ↔
  Pseudepigrapha ↔ 1 Enoch ↔ Jubilees ↔ Jasher ↔ Adam-Eve Conflict ↔ Apocalypse of Abraham ↔
  Ascension of Isaiah, etc. **Historical-witness texts (Josephus, Apostolic Fathers, M.R. James) are
  one-way and deferred from V1 — do not add them as members.**
- **Sacred Names** in every summary_md and member_note: Yahuah (LORD), Yahusha (Jesus), Elohim
  (God), *son of Adam* (never "son of man"), the kaph-comparative preserved at Dan 7:13 / Rev 1:13
  / Rev 14:14, NT-*Lord* governing rule (S182), every mention parenthesized.
- **Thread slugs use English book-names** (`isaiah-53-suffering-servant`, never
  `yeshayahu-…`) — slugs surface in the reader-facing UI.
- **Idempotent SQL** — `ON CONFLICT DO NOTHING` on every INSERT; transaction-scoped temp lookup
  view per the worked examples.

## The non-negotiable: chapter-anchoring (the thing S193 audited)

**A chapter-end card teaches strictly from the chapter it sits at the end of.** Concretely, for a
card on chapter *N* of book *B*:

- Every NEW thread introduced for that card anchors **within chapter N** (`anchor_verse_id_start`
  and `_end` both in B:N). A thread may span a contiguous movement inside the chapter; it must not
  stray into another chapter unless it is a deliberate, justified multi-chapter movement (the rare
  "spanning" case) whose member rows are each genuinely chapter-specific.
- Every member row's **source** verse is in B:N (this is what places the card on the chapter page —
  the endpoint selects by `sv.chapter_id`). Target verses range across the whole library; sources
  stay home.
- **No template bleed.** Member notes are written fresh per chapter. Never copy a member note from
  another chapter's thread. The same proof-text may be cited in two threads, but the explanatory
  note is written for *this* chapter's argument.

## Per-batch QA gate (orchestrator runs this every time)

1. **Anchoring + bleed audit** — run `python3 App/data-schema/migrations/_xref_audit.py` (extended
   to the batch's files). Require: every NEW thread single-chapter-anchored (or a justified,
   distinct-membered span); zero duplicated explanatory member notes.
1a. **Full-library / edition-aware guard (S194) — HARD FAIL.** The audit script now flags any
   migration that uses the canon-only lookup view or carries zero extras-edition targets. A batch
   that the guard marks `CANON-ONLY` does not merge — it goes back for extras targets. Full-library
   coverage (extras targets present where the framework warrants) is required, not optional.
1b. **Live render** — load the batch into the local Postgres and confirm each chapter's card
   renders (smoke test). No static-only acceptance.
2. **Voice / Red-Lines check** — orchestrator reads the batch's summary_md + member_note text
   against the 12 Red Lines and the Come-and-See disciplines. Hard-fail on: Jew-Gentile binary,
   antinomian Paul, scattered seed collapsed to "Gentiles/nations," nations grafted into the olive
   tree, Torah-as-curse, grace-against-commandments grammar, dropped kaph, "son of man," cited-not-
   quoted verses, appendix/internal-ref leakage, or Hebrew book-name slugs.
3. Only on a clean pass is the migration accepted and committed.

## Spawn template (paragraph-style brief the orchestrator hands each minion)

> You are producing cross-reference threads and chapter-end-card member rows for **[Book] chapters
> [X–Y]**. First read, in full: the yoshi-voice SKILL.md, references/framework-deep.md,
> api/CHAPTER_END_CARD_CONTRACT.md, and the worked-example migrations. **Use
> `session135_matt_6_extras_cross_references.sql` as the relational-mechanics template — it is the
> edition-aware schema (multi-edition lookup view + `src_edition`/`tgt_edition` tuple columns) that
> reaches the full restored library.** Use `session183_mark` / `session194_john` for voice and
> structure ONLY — they are canon-only and you must NOT copy their edition scope. Then, for each
> chapter independently, read the chapter closely through the framework and surface every connection
> across the full restored library worthy of a cross-reference — canon AND the extras editions
> (1 Enoch, Jubilees, Jasher, Apocrypha, Pseudepigrapha, Adam-Eve, Apocalypse of Abraham, Ascension
> of Isaiah); a canon-only batch fails the gate. Do not miss the extras-tier and Tanakh-substance
> links. Author idempotent SQL in the Matthew edition-aware format. Anchor every thread inside its
> own chapter; keep every member source verse in that chapter; write every member note fresh — never
> reuse another chapter's note.
> Apply the Sacred Names convention and the Come-and-See quote-don't-cite discipline. **Do not ever
> open a question box or prompt tool — if something is ambiguous, make the best framework-consistent
> call and report it to me in plain prose with your reasoning.** Return your SQL file path and a
> short prose summary of what you found and any calls you flagged.

## Open items carried in

- **§0 shipped-list check vs v1.0.9** is still blocked pending `REMNANT_STUDY_BIBLE_SPEC.md`
  (S192 scratch, not on disk this session). Re-supply to close.
- **S192 wheel-gate** (TestFlight under Remnant of Promise vs. defer iOS) remains open and unrelated
  to the sweep.
