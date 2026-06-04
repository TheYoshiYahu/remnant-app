# S183 Session Open Prompt — Mark cross-references via the thread-library-first pattern

Request `~/Desktop` access. Load `anthropic-skills:yoshi-voice` in full. Read `~/Desktop/App/S182_CHECKPOINT.md` (the full session — NT Lord-to-Yahuah fix + skill consolidation + the thread-library-first architectural shift Yoshi locked at S182 close).

## The architectural shift locked at S182 close

S180/S181 built four books (John, Romans, Galatians, Revelation — 61 threads total) using **book-scoped thread design**: each book got its own proposal that designed new threads from scratch. The pattern worked but was heavy — every chapter was a fresh design exercise.

S182's close revealed a faster pattern: **thread-library-first**. Most thematic threads already exist in the DB after Matthew (S110, S131-156), the S74 baseline, S111 (fulfill-as-prophecy-bringing-to-pass), S147 (effort-over-accomplishment), and the S181 cohort. The next-book work isn't *design new threads for Mark* — it's *walk Mark verse-by-verse and add Mark verses as new members to the threads that already exist*. New threads only when the verse pattern is genuinely novel and not covered by an existing thread.

The chapter-end card surface accumulates richer naturally — when a partner reads Mark 1:15 (*the time is fulfilled, and the kingdom of Elohim is at hand*), the card surfaces the `fulfill-as-prophecy-bringing-to-pass` thread that already has Matthew 4:17, John 3:3-5, Daniel 2:44, Isaiah 11 as members. Mark joins the gathering, doesn't get its own siloed thread.

## This session: Mark, end-to-end, parallel subagents

Mark has 16 chapters. The plan: 5 subagents (4 drafters + 1 verifier) running in parallel after a shared session-open phase.

### Phase 1 — Session-open and thread-library inventory (serial, ~5-8 turns)

1. Request Desktop access. **Load the yoshi-voice skill in full as the FIRST action** — Skill tool → `anthropic-skills:yoshi-voice`, then read SKILL.md and `references/framework-deep.md` end-to-end. Do not start any work before this load is complete. This is the gate for the dispatcher (the main session Claude) too — the same gate every subagent runs through. The Christianized default reading of Paul, Romans, Galatians, Hebrews, and the olive tree is the trained-in lens; the voice skill is what overrides it. Skipping this step is the failure mode every session is at risk of.
2. Read `S182_CHECKPOINT.md` end-to-end (especially the *thread-library-first* shift in the open-questions / Q15 closing reasoning Yoshi locked).
3. Pull the current thread library inventory. Either by reading the SQL migration files directly (`data-schema/migrations/session74*.sql`, `session110_matthew_cross_references.sql`, `session111_fulfill_thread.sql`, `session147_effort_over_accomplishment_thread.sql`, `session181_*_xref_threads.sql`, all the `session1{31..56}_matt_*_extras_cross_references.sql`) or by running a SELECT against the DB through Yoshi if egress is greenlit.
4. Produce `_scratch/_session183_thread_library_inventory.md` — one row per thread: slug, summary, member-count, books currently represented. This is the lookup the drafters consult.
5. Confirm the S182 canon push status — has Yoshi run the S182 canon-update migration locally? Mark's NT verses should reflect the S182 NT-Lord fix in any thread member_notes that quote them.

### Phase 2 — Parallel drafter dispatch (5 subagents simultaneously)

Send **one message with five Agent tool blocks** so they run concurrently:

1. **Drafter A: Mark 1-4** — opening, calling of disciples, early ministry, parables. Heavy fulfill/kingdom-at-hand territory.
2. **Drafter B: Mark 5-8** — middle Galilean ministry, feeding miracles, Peter's confession at Caesarea Philippi. Bread/feeding parallels, Son-of-Adam title introduction.
3. **Drafter C: Mark 9-12** — transfiguration, passion predictions, Jerusalem entry, controversy with the authorities. Greatest-commandment, render-unto-Caesar, vineyard parable.
4. **Drafter D: Mark 13-16** — Olivet discourse, passion, resurrection. Heavy on prophetic-fulfillment, Suffering Servant, Daniel 7 cloud-coming, Psalm 22 / 69 quotations.
5. **Verifier (deferred until drafters return)** — runs after the four drafter outputs come back. Validates each proposal against the voice skill (Red Lines #1-12), the thread-library inventory (no accidental new threads where existing ones fit), and the framework's posture rules. Same role as the S180 verifier subagents.

   **The verifier's brief MUST open with the same three non-negotiable loads as the drafters:**
   1. Load the yoshi-voice skill in full (Skill tool → `anthropic-skills:yoshi-voice` → read SKILL.md + references/framework-deep.md end-to-end before any verification work).
   2. Read the S182 NT-Lord governing rule under *Adonai (Lord)*.
   3. Read `_scratch/_session183_thread_library_inventory.md` so the verifier can flag any drafter who created a new thread when an existing one fits.

   The verifier's output: `_scratch/s183_mark_xref_VERIFICATION.md` — same format as the S180 verification files. For each drafter chunk: findings categorized as ACCEPT (the draft is framework-aligned and the thread fit is correct), REJECT (the draft has a Christianized phrasing, a binary slip, a Lord-Yahuah confusion, or a thread-fit error — name the specific Red Line or framework violation), REWRITE (the draft has the right thread fit but the member_note needs framework-correcting; supply the corrected note). Verifier does NOT make silent rewrites — every change is named so Yoshi can call accept/override.

Each drafter's brief MUST open with these three non-negotiable instructions, in this exact order, before any work begins:

1. **Load the yoshi-voice skill in full as the FIRST action.** Invoke the `Skill` tool with `skill: "anthropic-skills:yoshi-voice"` (or the bare `yoshi-voice` name — both resolve to the bundled skill). Read SKILL.md end-to-end. Read `references/framework-deep.md` in full — the Galatians framework, the Judaizer Error apologetic, the Paternal Seed apologetic, the Romans 11 / Olive Tree exposition, the Adam-and-Tares architecture, the Nature of God, the Revelation framework — all of it. Do NOT skim. Do NOT start the verse work before this load is complete. The voice skill is the lens; the subagent's defaults (which are Protestant/Catholic Paul, Jew-and-Gentile binary, antinomian grace) will Christianize the text if the skill is not consciously overridden first. This step is the gate.

2. **Read the S182 NT-Lord governing rule** under the Sacred Names Convention's *Adonai (Lord)* entry in SKILL.md. Any Lord-mention in a `member_note` MUST follow the four-bullet rule: preserve as Lord when Yahusha is the named addressee (vocative, titular, self-naming); render as Yahuah (Lord) only when the underlying Hebrew is YHWH (OT quotation contexts); preserve when the referent is human; explicit Yahuah for 1 Corinthians 12:3 (Spirit-revealed equation).

3. **Read the thread-library inventory at `_scratch/_session183_thread_library_inventory.md`** before walking any Mark verse. This is the dispatcher's curated list of every existing thread in the DB — slug, summary, current members, books represented. The verse work is library-first: each Mark verse with cross-reference potential gets checked against this inventory FIRST. If a thread fits, add as a new member. Only flag a new thread when the verse pattern is genuinely novel and not covered by any existing thread.

After those three loads, the brief continues:

- **Mark chapter range assigned** (the specific chapters this drafter owns — A: 1-4, B: 5-8, C: 9-12, D: 13-16). Use the post-S182 `source-texts/parsed/canon.json` text, not the source KJV — the restored names + S182 NT-Lord fix is the version the chapter-end card will surface to readers.
- **Walk verse-by-verse.** For each verse with cross-reference potential, FIRST check the thread library inventory. If a thread fits → draft a `member_note` (1-3 sentences, framework-aligned per the come-and-see discipline: quote target verses in stand-alone italics, name the framework move plainly, do not reference internal scaffolding the reader won't see). Add as a new member of the existing thread. Only flag a new thread when the verse pattern is genuinely novel.
- **Output format:** markdown table per chapter with columns `verse | thread_slug (existing or NEW) | member_note | target_verses_referenced`. Use existing-thread slug exactly as it appears in the inventory; for new threads, propose a slug + summary inline so the verifier and Yoshi can review the addition cleanly.
- **Voice-gate self-check before returning.** Before the subagent reports back, run its own output through the 12 Red Lines and the 12-point editorial checklist. Catch any Jew-and-Gentile binary slip, any false-inclusion-gospel grammar, any sola-fide truncation, any Lord-Yahuah confusion on Yahusha addresses, any non-comparative *Son of Adam* where the kaph belongs. Self-correct before returning.

### Phase 3 — Verifier pass and Yoshi review

1. Verifier runs against all four drafter outputs.
2. Verifier output: `_scratch/s183_mark_xref_VERIFICATION.md` — same pattern as the S180 verification files. Findings categorized as accept / reject / rewrite, each grounded in framework reasoning.
3. Yoshi reviews. Verification findings get accepted or overridden per his call.
4. Final proposal markdown lands at `_scratch/s183_mark_xref_threads.md`.

### Phase 4 — SQL migration build and apply

1. Use the S181 `build_sql_migrations.py` pattern (now at `outputs/build_sql_migrations.py` from S181 — should move to `data-schema/tools/` this session).
2. Generate `session183_mark_xref_members_and_threads.sql`. Mostly `INSERT INTO cross_reference_thread_members` (existing thread additions) with a small tail of `INSERT INTO cross_reference_threads` for genuinely new threads.
3. Build a `session183_smoke_test.sql` modeled on S181's — verify member-count growth on the affected threads, verify any new thread additions, verify the chapter-end card path for Mark 1, Mark 13, Mark 15.
4. Egress to Render Postgres — Yoshi confirmed greenlit at S181 close from his terminal. If sandbox-egress is still walled (same as S181/S182), Yoshi runs the apply locally per the standard runbook.

### Phase 5 — Checkpoint

1. Write `S183_CHECKPOINT.md`: what shipped, what didn't, the architectural-shift validation (did thread-library-first actually save the work it promised?), the next-book queue (Luke next using same pattern; then Acts; then OT priority list).
2. Quote the *thread-library-first* discipline back into the BIBLE_APP_ROADMAP.md so it's the standing pattern going forward — S180's book-scoped pattern was the bootstrap; S183's library-first pattern is the steady-state.

## Open Yoshi-questions carried into S183

From the S182 checkpoint, still pending:
- **Q14** — Broader synoptic vocative sweep. Mark is in scope here — the *Lord,* vocatives addressed to Yahusha in Mark (Mark 1:40 leper, Mark 7:28 Syrophoenician woman, Mark 9:24 father of the demon-possessed boy, Mark 10:51 blind Bartimaeus) need the per-verse Lord-preserve treatment if the lightweight `NT_LORD_PRESERVES.tsv` lookup mechanism is adopted. Bundle this into the Mark session if Yoshi calls it.
- **Q15** — NT-Lord in OT-quotation contexts. Mark has several OT-quotation Lord-references (Mark 12:11 quoting Psalm 118:23, Mark 12:36 quoting Psalm 110:1 — *Yahuah said unto my Lord*). These need the explicit-KEEP marking per the S182 governing rule.
- **Q16** — Skill bundle sync. Should be resolved already if Yoshi clicked Save on the S182 bundle. Verify at session open.

## Operating disciplines for this session

- **Thread-library-first is the standing pattern.** New threads only when no existing thread fits — and "fits" means the new member can be added without rewriting the existing summary beyond a one-line acknowledgment. If the summary needs substantive rewriting, that's a new thread.
- **Come-and-see authoring** for every member_note — quote the verse stand-alone-italics inline, not *per the framework*. The card-reader doesn't have access to internal scaffolding.
- **Voice skill is the standard.** Voice skill loaded fresh at open; subagent dispatchers each include the voice skill in their brief.
- **Session-length hard stop honored.** If the subagent fan-out + verifier pass + Yoshi review + migration build pushes past the 25-30 turn / 70% context discipline, wrap with a checkpoint and queue the migration build for S184. Better to land Mark as a clean proposal-set this session and apply migration next than to thin-spread.
- **Verbal answers transcribe.** Every decision Yoshi makes in conversation about a specific thread or member gets written back into `_scratch/s183_mark_xref_threads.md` before the session is presented as closed.

## Suggested session-open question to Yoshi

> "S183 plan locked: 5-subagent parallel for Mark (4 drafters by chapter block + 1 verifier), thread-library-first, target Mark end-to-end this session. Before I dispatch — should I also load the Q14 Mark vocative-preserves and Q15 Mark OT-quotation KEEPs into the same session, or keep this session strictly to the cross-reference build and queue Q14/Q15 for S184?"

The default if Yoshi doesn't answer: keep S183 to the cross-reference build only. Q14/Q15 are different surfaces (canon-text fix vs. cross-reference architecture) and bundling them adds risk to both.

## Files this prompt expects to exist at session open

- `~/Desktop/App/S182_CHECKPOINT.md` ✓ (S182 close)
- `~/Desktop/App/restoration-pipeline/restore.py` with S182 patches ✓
- `~/Desktop/App/source-texts/parsed/canon.json` regenerated with S182 fix ✓
- `~/Desktop/App/data-schema/migrations/session1{74,110,111,131..156,181}_*.sql` — the existing thread library ✓
- `~/Desktop/App/_scratch/yoshi-voice/SKILL.md` (source-of-truth) with S182 NT-Lord rule ✓
- Cowork-installed yoshi-voice skill — should be the S182 bundle after Yoshi's Save click ✓
