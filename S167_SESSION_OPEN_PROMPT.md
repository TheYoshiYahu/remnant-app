S167 — Phase 9.2 (Hebrew-Greek interlinear) implementation opens

# S166 close summary — §28 interlinear spec LANDED + modal max-w-6xl LIVE

Phase 9.2 spec-then-build wheel opens here. S166 lands the spec; S167 opens the
implementation. Pre-9.2 cleanup also landed at S166: the §27/§26 modal family
got one more partner-perceptible width bump after Yoshi's read of the §26
LexiconSheet on production.

## S166 deliverables — what shipped at session close

| Deliverable | Location | Status |
|---|---|---|
| **DESIGN_LANGUAGE.md §28** — Hebrew & Greek interlinear surface spec | `DESIGN_LANGUAGE.md` lines 1512–1610 (~100 lines) | LANDED — four gates locked: Companion tier, above-verse English-aligned column, abbreviated-English morph register with hold-expansion, metallic-argaman chrome parity with §27 |
| Modal family bump max-w-4xl → max-w-6xl (1152px desktop) | 9 components: LexiconSheet, StrongsLookup, VerseActionMenu, HighlightPicker, BookmarkSheet, RangeActionPicker, AudioPlayer, NotesPanel, SearchModal | LANDED — commit `17ba59e` on `main`, deployed via Render Static Site auto-build |
| Word-tap regression diagnosis | Service-worker stale-cache identified; hard-refresh restored §20 + §27 + §26 tap layer | RESOLVED — partner-side workflow note for future deploys: hard-refresh required to invalidate cached chapter assets |
| Close-discipline failure named | Sandbox session closing with staged-but-unpushed work is a discipline gap | LOCKED — push verification folded into every future close prompt |

## §28 interlinear — the four load-bearing gates locked at S166

1. **Tier gate = Companion+.** Aligns with §20 *Locked stub catalog* which has carried `Hebrew/Greek interlinear` at Library/Companion since S122. Morph + lemma + transliteration + gloss data is also server-side tier-gated in the chapter-words endpoint payload.

2. **Display = above-verse stacked column, English-aligned word order.** Top-to-bottom row order in each column: lemma → transliteration → morphology (abbreviated) → gloss → English surface word. Hebrew lemmas render RTL within their cell (SBL Hebrew font) but column-to-column order follows English flow. The come-and-see posture rules out the RTL-mirror-reading credentialing register.

3. **Morphology register = abbreviated English (`aor. act. ind. 3s` / `qal pf. 3ms`), full-expansion on tap-and-hold.** Robinson/STEPBible coded register (`V-AAI-3S`) is Pharisee-scholar credential display; the framework-consistent register is plain English abbreviation visible without a key, with the depth one gesture away.

4. **Toggle architecture = chapter chrome strip + Settings, parity with §27.** Same metallic-argaman pill family. Companion-badge chip distinguishes from §27 (Free). Default OFF, localStorage persistence under `reader-prefs.interlinear`.

Full §28 spec at `DESIGN_LANGUAGE.md` §28 lines 1512–1610.

## S167 scope — implementation opens

The §28 *Implementation deferred to future session* block names the six steps;
S167 is the future session. Sequence:

1. **Source fetch (Yoshi-terminal).** STEPBible TAGNT (Greek NT morph-tagged) + TAHOT (Hebrew/Aramaic OT morph-tagged) are not in the existing `source-texts/stepbible-data/` sparse-checkout (which only carries Lexicons/). Sandbox can't extend the clone — 45s timeout vs ~500MB repo, raw.githubusercontent.com blocked by allowlist. From your terminal:

   ```bash
   cd ~/Desktop/App/source-texts/
   # Re-clone in /tmp to avoid the .git/config.lock filesystem-permission issue
   # S159 hit on host-mounted source-texts/ — same workaround applies.
   rm -rf /tmp/stepbible-extend
   git clone --depth 1 --filter=blob:none --sparse https://github.com/STEPBible/STEPBible-Data.git /tmp/stepbible-extend
   cd /tmp/stepbible-extend
   git sparse-checkout set "Translators Amalgamated OT+NT"
   git rev-parse HEAD  # → record in SOURCE_TEXT_INVENTORY.md §VIII
   # Copy the new directory into the existing host-mounted clone
   cp -R "Translators Amalgamated OT+NT" ~/Desktop/App/source-texts/stepbible-data/
   ls ~/Desktop/App/source-texts/stepbible-data/
   # → Lexicons/ + Translators Amalgamated OT+NT/
   ```

   If the actual directory name in the repo turns out to differ from `Translators Amalgamated OT+NT` (possible — the repo evolves), the sparse-checkout will land empty. Fallback: `git sparse-checkout list` and `git ls-tree --name-only HEAD` to find the right directory name, then re-set sparse-checkout. The repo's README and Wiki document the current bundle names; STEPBible has been consistent with the `Translators ...` naming pattern since 2018, so the path above is the most likely match.

2. **Sample-parse to confirm join keys.** Read a few rows from the TAGNT and TAHOT files; confirm per-verse (verse_id-mappable via book.chapter.verse) + per-word (position-mappable) morph tags. Confirm Strong's-number alignment with the existing `strong_entries` table. The S159 pattern was inline sample-render scripts (`_session160_bdb_sample_render.py`); same pattern for TAGNT/TAHOT verification.

3. **Loader script.** `restoration-pipeline/_session167_load_verse_words_morph.py` (or whatever session number lands the implementation). Populates `verse_words.morphology` from the per-word morph tags. ALTER TABLE not required — column already exists. Coverage target: 100% of canonical OT + NT. Emits a SQL file for the prod apply.

4. **Helper module + sanity tests.** `app/src/lib/interlinear-helpers.ts` — five pure functions per the §28 spec (`formatMorphology`, `selectInterlinearFontStack`, `wrapHebrewBidi`, `buildInterlinearColumn`, `groupVerseColumns`). `_s167_interlinear_sanity.mjs` — ≥30 sanity-test cases per the forward standard.

5. **PWA component + toggle hook + chrome-strip button + Settings entry.** `app/src/components/InterlinearLayer.tsx` + `app/src/lib/useInterlinearToggle.ts` + chapter chrome-strip button in `App.tsx` next to the §27 *Strong's* button + Settings → Reader preferences entry. Argaman pill chrome with Companion-badge chip for below-Companion partners. SBL Hebrew + SBL BibLit font preload behind Companion-tier JWT.

6. **API extension.** `GET /v1/books/:slug/chapters/:n/words` extended to render tier-gated payload: morphology + lemma + transliteration + gloss populated when JWT tier is Companion+, null otherwise. Pattern parity with §26's tier-gated lexicon endpoint.

7. **Live walk verification.** bible.remnantofpromise.org. Companion-tier-test-partner sees the toggle live, taps it on, sees the interlinear layer render above John 1:1 (Greek) and Genesis 1:1 (Hebrew). Hard-refresh post-deploy per the S166 service-worker finding.

Realistic estimate: S167 covers source-fetch + sample-parse + loader (steps 1–3). Helper module + sanity tests likely also S167 if context budget allows. PWA component + API extension + live walk likely S168.

## Standing residuals — carried from S166

- **7 untracked files in the repo.** From S162/S165 sessions, not yet committed:
  - `S162_SESSION_OPEN_PROMPT.md`
  - `S166_SESSION_OPEN_PROMPT.md`
  - `data-schema/migrations/session162_lexicon_callouts_v1.sql`
  - `data-schema/migrations/session162_lexicon_tables.sql`
  - `restoration-pipeline/_session161b_modernize_context_dependent.py`
  - `restoration-pipeline/_session162_assemble_lexicon_callouts_v1.py`
  - `restoration-pipeline/_session162_luke_1_41_ghost_fix.py`

  Per *Render artifacts persist* (outputs/ + data-schema/migrations/ commit via the .gitignore exception, restoration-pipeline scripts as session artifacts), these should be in the repo. Hygiene commit pending. Recommend at S167 open before any new file lands: separate hygiene commit so the §28 implementation files commit cleanly without scope-mixing.

  ```bash
  cd ~/Desktop/App
  git add S162_SESSION_OPEN_PROMPT.md \
          S166_SESSION_OPEN_PROMPT.md \
          S167_SESSION_OPEN_PROMPT.md \
          data-schema/migrations/session162_lexicon_callouts_v1.sql \
          data-schema/migrations/session162_lexicon_tables.sql \
          restoration-pipeline/_session161b_modernize_context_dependent.py \
          restoration-pipeline/_session162_assemble_lexicon_callouts_v1.py \
          restoration-pipeline/_session162_luke_1_41_ghost_fix.py
  git commit -m "S166 hygiene — track prior-session artifacts (S162 lexicon migrations + pipeline scripts + session open prompts)"
  git push
  ```

- **§28 spec push.** The DESIGN_LANGUAGE.md edit is on disk but not yet committed. Stage with the hygiene commit or separately, your call. If separately:

  ```bash
  cd ~/Desktop/App
  git add DESIGN_LANGUAGE.md
  git commit -m "DESIGN_LANGUAGE.md §28 — Hebrew & Greek interlinear surface spec (locked S166, Phase 9.2, Companion tier)"
  git push
  ```

- **9 long-tail singleton verses from S161 Group B** (malachi 4:4, matthew 5:33, mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians 2:5, hebrews 11:37, revelation 1:10). Unchanged from S163/S164/S165.

- **Yahuah → Adonai for vocatives addressing Yahusha.** Restoration-pipeline pass; not lexicon work and not interlinear work.

- **v1.1+ wheel candidates** carried from S165: apocrypha book-slug map extension, Gesenius source investigation, Thayer's 1889 alternate Greek lexicon if a clean Strong's-aligned dump surfaces, system-wide Library → Companion tier-label rename in MenuItem.lockedTier Literal.

## Open Yoshi-questions at S167 open

1. **§28 spec redlines.** S166 closed without redline pass — Yoshi said *lets go* on the draft. Are there partner-perceptible decisions in the four locked gates or the *Defaultable surface* / *What §28 deliberately does NOT prescribe* sections that want a second look before implementation locks them in code? Specific places where my judgment was the lock and you may want to revisit (carried from S166 close):
   - **Hebrew word-order = English-flow.** Locked against traditional RTL-Hebrew-interlinear. If you want partners to read Hebrew in its native right-to-left direction (closer to what a Yashar'eli's reading discipline would carry), that's the other defensible call — and would be cheaper to land at spec-stage than post-implementation.
   - **Morphology register = abbreviated, full on hold.** Could go further toward fully-written-by-default if column space allows on desktop.
   - **Tier gate = Companion.** Held per stub-catalog precedent. The §27-style Free-tier-for-visibility argument exists; the data lift (morph + per-word join + font preload) is heavier than §27's pure-frontend layer, which is why I held Companion.

2. **Hygiene-commit ordering.** Fold the 7 untracked files + the §28 spec into one commit, or run them as two separate commits (hygiene first, spec second)? S166 recommendation was two, but one's faster and the spec is its own clean unit so either reads sensibly in `git log`.

3. **S167 scope ceiling.** How far into the §28 implementation should S167 push? Realistic options: (a) source-fetch + sample-parse only (clean session, hand to S168 for loader); (b) source-fetch + sample-parse + loader (medium, S168 picks up helpers + React); (c) source-fetch + sample-parse + loader + helpers + sanity tests (full, S168 picks up React + API only). Per the publish-then-edit rule we don't need to ship the whole interlinear at S167; per the no-conservative-early-wraps rule we should push at least to the loader.

## Standing efficiency rules (carried — no change)

- Voice-gate batch pattern for any authored-content batch
- Parallel-subagent pattern for fresh-context drafting with framework-deep references mounted
- Local files first before web-fetch
- Self-sufficient application of skill + source — implementation choices that don't materially affect partner-perceived surface land without per-line approval
- Sandbox-git limitation — code lands in the sandbox; commits + applies Render dashboard changes run from Yoshi's terminal (S166 hit this when source-fetch timed out)
- Spec-then-build — architecture refinements land in the spec docs before the corresponding code (§28 landed at S166; implementation opens at S167)
- Verbal-answers-transcribe — settled decisions get written into the next session's open prompt before close (this file IS the transcription)
- Render artifacts persist — outputs/ and data-schema/migrations/ files commit via the .gitignore exception
- Render Postgres IP allowlist — add IP when network changes
- Publish-then-edit — ship V1 when the foundation is right, find errors in subsequent passes, fix and republish
- **NEW S166** — Service-worker stale-cache verification at every PWA deploy. Hard-refresh (Cmd-Opt-R on desktop, or Private Window) is the diagnostic when a deploy "doesn't appear to land." Fold into every post-deploy walk.
- **NEW S166** — Push verification at every session close. Sandbox closing with staged-but-unpushed work is a discipline failure. Every close prompt names: what's pushed, what's committed-not-yet-pushed, what's edited-not-yet-committed.

## S166 status

§28 spec LANDED in DESIGN_LANGUAGE.md (lines 1512–1610). Modal max-w-6xl bump
LIVE on production (commit `17ba59e`). Word-tap regression diagnosed and
restored. S167 opens against this state with the source-fetch handoff at the
top of its scope.

Realistic estimate for S167: source-fetch (Yoshi-terminal) → sample-parse →
loader skeleton lands; helpers + sanity tests likely also fit. React component
+ API extension + live walk fall to S168 unless context budget surprises us.
