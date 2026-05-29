# S163 — Lexicon loader + apply chain + production deploy (Phase 9.3 close)

## S162 close summary — what shipped

S162 opened against the S162 prompt: callout reviews + LSJ render review + Phase 9.3 close run. The session went hot — voice-gate compressed into one analytic pass instead of per-callout walk, parallel-subagent batch ran clean, and the staging path got decided. Phase 9.3 close itself slipped to S163 because the full-corpus lexicon loader is heavier than a single session can land cleanly alongside the callout work.

### S162 deliverables — landed and pushed

| Deliverable | Location | Status |
|---|---|---|
| Holy Ghost cluster smoke-test (Matt 28:19, Mark 1:8, John 14:26, Luke 1:41) | API verification via Chrome MCP | 3 of 4 clean on first pass; Luke 1:41 surfaced as residual bug |
| Luke 1:41 Ghost→Spirit + G0040→G4151 narrow fix script | `restoration-pipeline/_session162_luke_1_41_ghost_fix.py` | LANDED + applied from Yoshi's terminal + re-verified |
| Voice-gate of 34 callouts (12 Red Lines + 12-point editorial checklist + structural rules) | `outputs/S162_CALLOUT_REVIEW.md` | 0 Red Line violations; 27 PASS, 7 FLAG (all surface fixes) |
| 8 framework-deep re-drafts (chesed, emunah, pistis, tsedek, shabat, kohen, qadosh, hagios) via parallel subagent batch | `_scratch/lexicon-callouts-DRAFTS/*.REDRAFT.md` (then mv'd over originals) | LANDED — `framework-deep.md` + torah exemplar + S160 current draft mounted in each subagent |
| 7 FLAG fixes applied to source drafts | G4151, G4561, H0120, H7307 (originals) + H2617, H0530, H3548 (REDRAFTs) | LANDED — surgical Edit calls |
| 8 REDRAFTs moved over their S160 originals | `_scratch/lexicon-callouts-DRAFTS/` (34 canonical files, 0 REDRAFT residuals) | LANDED |
| LSJ sample-render review | `outputs/Phase_9.3_LSJ_Sample_Render_S160.html` | PASS — 5 callouts (charis/nomos/paidagogos/ethne/agrielaios) all match current source drafts; visual register parity with BDB confirmed; Tyndale citation hover pattern (blue dotted-underline for biblical + emerald for classical) clean |
| Q4 staging path decision | This file (S162 carry-forward) | Path 3 — production with API env-var gate (`LEXICON_ENABLED`) |
| Schema migration — lexicon_entries + lexicon_callouts | `data-schema/migrations/session162_lexicon_tables.sql` | LANDED on disk; APPLY GATED on Yoshi |
| Callout migration assembly script | `restoration-pipeline/_session162_assemble_lexicon_callouts_v1.py` | LANDED |
| Callout migration SQL output | `data-schema/migrations/session162_lexicon_callouts_v1.sql` (1174 lines, 34 INSERTs with ON CONFLICT DO UPDATE) | LANDED on disk; APPLY GATED on Yoshi |

### Voice-gate methodology recorded for re-application

The S162 voice-gate pattern (Claude reads every draft, applies the 12 Red Lines + 12-point editorial checklist + structural rules in one analytic pass, surfaces only FLAGs for author redline, batch-applies the surgical fixes once Yoshi greenlights) supersedes the per-callout walk. Apply the same pattern to any future authored-content batch (book chapters, commentary entries, callout additions). Per Yoshi's S162 correction: *"you are supposed to be pretty self sufficient at reading my skill and teachings and accomplishing the goal"* — the voice skill governs, Claude gates, Yoshi reviews only what the gate flags.

### Decisions locked at S162 (per verbal-answers-transcribe rule)

- **Walk order on the 26 unflagged drafts** → strict A→Z file order (G first then H), skip the 8 flagged → walk re-pass at end. **Then superseded** by the voice-gate-batch pivot after Yoshi's correction on per-callout asking.
- **Subagent refs for the 8 framework-deep re-pass** → `framework-deep.md` (full) + `H8451_torah.md` (gold-standard exemplar) + the current S160 draft (preserve what works, deepen what's shallow).
- **Q4 staging path** → Path 3 (prod + API env-var gate). Reasoning: smallest mass (no new infrastructure, no $7/mo cost, schema additive-only), reversible via Render dashboard, aligns with publish-then-edit discipline. Path 2 (separate staging stack) deferred for future wheels that genuinely need ongoing staging surface (likely Phase 10 native-wrap work).
- **Lexicon body — replacement decision** → the 8 `.REDRAFT.md` files become canonical; S160 originals get overwritten (already done at S162 close via `mv`). No archive copies kept; git history carries the pre-S162 versions.
- **Luke 1:41 fix scope** → narrow 1-row UPDATE (chosen over broad scan of Ghost-G0040-misalignments-across-canon). Reasoning: the S161c rule swept the canon cleanly; this was the lone miss. Broader scan can run as v1.1+ defensive sweep if more surface.

## Known residuals carried from S161 + S162

### 9 long-tail singleton verses (Group B from S161 final scan)

Each is its own specific quirk. Trace-and-fix individually when Yoshi encounters them. Pattern: malachi 4:4 / matthew 5:33 / mark 10:15 / philippians 2:2 / john 21:7 / romans 1:13 / ephesians 2:5 / hebrews 11:37 / revelation 1:10.

### Yahuah → Adonai for vocatives addressing Yahusha

S149 restoration pipeline modernized 'Lord' → 'Yahuah (LORD)' everywhere except pre-stashed secular human-royalty vocatives. Vocative cases addressing Yahusha as 'Lord' (e.g., Matthew 20:30-31 blind men) should be 'Adonai (Lord)' per the voice skill. Caught by Yoshi mid-S161. Needs a vocative-to-the-Son detection layer added to the restoration pipeline. Separate pass, not Strong's alignment work.

### Optional — BDB sample render re-render

The S160 BDB sample render at `outputs/Phase_9.3_BDB_Sample_Render_S160.html` shows the S160 versions of chesed/shabat/qadosh/kohen callouts. The S162 REDRAFTs replaced those four. The sample render is stale for those four callout bodies. Not blocking — the production loader pulls current source drafts. Re-render is purely cosmetic if Yoshi wants the visual proof refreshed; otherwise the BDB sample stays as a S160-snapshot reference.

## Reads at S163 open

1. **Invoke `anthropic-skills:yoshi-voice` in full** — needed for any callout edit decisions and for the API endpoint copy review.

2. **`_scratch/S158_LEXICON_PARSE_PLAN.md`** — full parse plan (BDB XML + LexicalIndex.xml join, TFLSJ tab-delimited, citation normalization rules, link-integrity gate). S159+S160 corrections layered in. Read §II + §III + §V (validation approach) before writing the loader.

3. **`_scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md`** — Phase 1-5 skeleton (verify sources → parse per source → enrich from TBESH/TBESG → normalize citations + cross-refs → emit migration SQL). Skeleton only; implementation is S163 work.

4. **`DESIGN_LANGUAGE.md` §26** — schema DDL (now in `session162_lexicon_tables.sql`), helper-API contract (`buildBreadcrumb`, `formatDisclaimer`, `parseLexiconBodyLinks`, `selectDefaultSource`, `formatCalloutHeader`), sanity-test target (≥30 cases).

5. **`source-texts/openscriptures-hebrewlexicon/BrownDriverBriggs.xml`** + **`LexicalIndex.xml`** — BDB source + the Strong's-number ↔ BDB-id join layer.

6. **`source-texts/stepbible-data/Lexicons/TFLSJ 0-5624 ...txt`** + **`TFLSJ extra ...txt`** — LSJ + Abbott-Smith body source (tab-delimited).

7. **`source-texts/stepbible-data/Lexicons/TBESH ...txt`** + **`TBESG ...txt`** — Tyndale gloss/transliteration enrichment data.

8. **`restoration-pipeline/_session160_bdb_sample_render.py`** + **`_session160_lsj_sample_render.py`** — existing partial parsers for BDB and LSJ (sample-render scope). Production loader extends these to full-corpus + adds citation normalization + link-integrity + bulk SQL emission.

9. **`outputs/S162_CALLOUT_REVIEW.md`** — for reference if any callout body needs a touch-up before the migration applies.

## Open Yoshi-questions at S163 open

1. **Loader implementation gates.** The full-corpus loader is the heaviest single deliverable in this trajectory. Three sub-questions to settle at S163 open:
   - **Batch size** — INSERT 500 rows per statement (the S158 skeleton spec) vs 1000 vs single-statement-with-multi-row VALUES?
   - **Citation normalization aggressiveness** — should the loader log + downgrade unresolved citations to `<span class="lexicon-unresolved-cite">` per Edge Case #9, or fail-loud on the first unresolved cite?
   - **Body size cap** — outlier entries (charis ~40KB, nomos ~40KB) — store full body and let the API gate on Companion-tier alone, or paginate / collapse-toggle at storage time?

2. **API endpoint shape.** §26 names `GET /v1/lexicon/{source}/{strong_number}` and `GET /v1/lexicon/{strong_number}/callout`. Two questions:
   - Single combined endpoint `GET /v1/lexicon/{strong_number}` returning `{ entries: [...], callout: {...} }` vs the two-endpoint pattern in §26?
   - Tier gate at the endpoint (Companion) vs at the PWA surface only (let any signed-in user fetch, gate the surface render)?

3. **PWA LexiconSheet component.** §26 spec is locked. Implementation lands at S163 (or splits to S164 if loader runs hot). Five pure helpers per §26 with ≥30 sanity tests.

4. **Render Postgres allowlist + auto-deploy.** Carried from S161. Still pending decision on broad CIDR vs documented per-network add. Auto-deploy verification on the Static Site service.

## One-way doors — do NOT execute without explicit go-ahead (carried from S162)

1. **The schema migration apply** (`session162_lexicon_tables.sql`). Additive but still a production schema change. Apply from Render Shell:
   ```
   psql "$DATABASE_URL" -f data-schema/migrations/session162_lexicon_tables.sql
   ```

2. **The lexicon_entries bulk-load migration apply to production.** ~17,000 rows across BDB + LSJ (Gesenius dropped per S160). Apply only after schema migration lands. Loader emits the migration file at S163.

3. **The framework-callouts INSERT migration apply** (`session162_lexicon_callouts_v1.sql`). 34 rows, author-reviewed. Apply only after the schema migration lands. Re-runnable via ON CONFLICT DO UPDATE.

4. **The API env-var gate** (`LEXICON_ENABLED=false` initially). Add at the new lexicon endpoints when they land; flip to `true` for Yoshi's walk after entries + callouts are loaded.

5. **Production deploy of the PWA LexiconSheet surface.** Standard Static Site rebuild on Render (~2 min). Apply after the staging walk approves.

6. **Any rip-and-replace of OpenScriptures BDB for a richer source.** Carried from S162.

7. **Any re-introduction of Gesenius into V1.** Carried from S162.

## Order of operations at S163

1. **Write the full-corpus lexicon loader** — `restoration-pipeline/_session163_load_lexicon_entries.py`. Parses BDB XML + LexicalIndex.xml + TFLSJ + TBESH/TBESG; normalizes citations + cross-refs; emits `data-schema/migrations/session163_lexicon_entries_load.sql`. Coverage gate + link-integrity gate before emit.

2. **Apply schema migration** (`session162_lexicon_tables.sql`) from Yoshi's terminal — Render Shell after IP allowlist check.

3. **Run the loader against prod** — emit the SQL file; Yoshi applies via Render Shell or psql from terminal.

4. **Apply callout migration** (`session162_lexicon_callouts_v1.sql`) — Yoshi applies via psql.

5. **Build the API lexicon endpoints** — `GET /v1/lexicon/{source}/{strong_number}` and `GET /v1/lexicon/{strong_number}/callout` (or combined per Q2 above). Add `LEXICON_ENABLED` env-var gate. PR + push from Yoshi's terminal.

6. **Build the PWA LexiconSheet** — component per §26, 5 pure helpers per §26 (≥30 sanity tests in `_s163_lexicon_sanity.mjs`). Static Site rebuild on Render.

7. **Flip `LEXICON_ENABLED=true`** in Render dashboard.

8. **Yoshi's live walk** on `bible.remnantofpromise.org` — tap into a Greek word, see LSJ body + framework callout; tap into a Hebrew word, see BDB body + framework callout. Spot-check 5-10 entries across both languages including a couple of the framework-deep callouts (chesed, pistis, qadosh) to verify the redrafts render correctly.

9. **If clean** → leave gate on, Phase 9.3 closes. **If issues** → flip gate back to `false`, iterate, re-walk.

10. **Phase 9.3 closes at S163** (or S164 if loader + API + PWA + walk runs hot — honest estimate). Phase 9.2 (Hebrew-Greek interlinear) opens at next session.

## Standing efficiency rules (carried from S158/S159/S160/S161/S162)

- **Voice-gate batch pattern** (new from S162). For any future authored-content batch, Claude reads every draft and applies the gate analytically; surfaces only FLAGs for Yoshi review; batch-applies fixes on greenlight. Supersedes per-draft walk.
- **Parallel-subagent pattern** reusable for any future content batch needing fresh-context drafting with framework-deep references mounted.
- **Local files first.** All lexicon source data on disk at `~/Desktop/App/source-texts/`; no web-fetch needed.
- **Self-sufficient application of skill + source.** Implementation choices that don't materially affect partner-perceived surface — Claude lands the work, Yoshi reviews at session close.
- **Sandbox-git limitation.** All commits + migration applies run from Yoshi's terminal via heredoc-script files or direct psql. Sandbox cannot git add/commit/push or apply to host-mounted prod DB directly.
- **Spec-then-build.** Carry forward: any architecture refinement caught during implementation lands in the spec docs BEFORE the corresponding loader code lands.
- **Verbal-answers-transcribe.** Honored at S162 — all decisions transcribed into this S163 open prompt before session close.
- **Render artifacts persist.** `.gitignore` patched at S160 so `outputs/Phase_*.html` files commit.
- **Render Postgres IP allowlist.** When network changes, add IP to Render dashboard before scripting against prod DB.

## S162 status

Phase 9.3 callout review + voice-gate + LSJ render review + staging path decision + schema + callout migration assembly all landed. **The loader is the gating piece for Phase 9.3 close.** Holy Ghost smoke clean across all 4 sample verses. 34 callouts ready for migration, 0 Red Line violations in the set, all 7 FLAGs surgically corrected. Schema migration + callout migration SQL both on disk waiting for Yoshi's apply per the one-way doors above.

S163 opens against this state for the final Phase 9.3 closure run: loader + schema apply + lexicon load + callout apply + API endpoints + PWA LexiconSheet + walk. Realistic estimate: S163 alone if loader runs to spec; S164 if API + PWA surface code splits to its own session.
