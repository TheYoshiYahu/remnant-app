# S161 — Phase 9.3 close run: callout reviews + BDB/LSJ loader + staging apply + production

## S160 close summary — decisions, drafts, and renders landed

S160 opened against the S159 close (BDB sample render gating Phase 9.3) and ran a parallel four-track wheel: §26 redlines from S159 + new §27 always-visible Strong's superscripts toggle + BDB sample re-render + parallel-subagent callout drafting wheel + LSJ first-pass sample render + Gesenius source-data discovery + spec corrections + S160 decision log entries across §26 and the parse plan. Substantive turn count fell within the wrap-signal range; voice-skill error-rate stayed clean (zero "substantial" violations across 33 subagent drafts, zero internal-document references in callout bodies).

### S160 deliverables — landed, pushed-pending

| Deliverable | Location | Status |
|---|---|---|
| §26 redlines — S160 decision log block (Gesenius drop, BDB fidelity, §27 capture) + Gate #2 single-canonical-source update | `DESIGN_LANGUAGE.md` §26 (top decision-log block + Gate #2 rewrite) | LANDED — push pending Yoshi terminal commit |
| New §27 — Always-visible Strong's superscripts toggle (Free tier, BLB-pattern, metallic-argaman toggle + bracket-emerald midtone superscripts) | `DESIGN_LANGUAGE.md` §27 (new section, ~80 lines) | LANDED — push pending |
| COLOR_PALETTE.md surface updates — argaman §1 + bracket-emerald §3 each gain the new active surface entries for §27 | `COLOR_PALETTE.md` §1, §3 | LANDED — push pending |
| `.gitignore` patched — `outputs/*` + `!outputs/Phase_*.html` so future render artifacts survive across sessions | `.gitignore` line 61-65 | LANDED — push pending |
| BDB 25-entry sample render re-produced + reviewed + Yoshi-approved | `outputs/Phase_9.3_BDB_Sample_Render_S160.html` (93 KB, 25 entries, 1 fully-drafted callout (torah) + 9 preview cards + 15 non-callout entries) | LANDED + APPROVED |
| BDB sample-render script | `restoration-pipeline/_session160_bdb_sample_render.py` | LANDED — push pending |
| Parse plan §II BDB section + §III transformation rules — LexicalIndex.xml join correction + sub→root resolution rule + corrected citation/cross-link patterns to match actual XML | `_scratch/S158_LEXICON_PARSE_PLAN.md` §II.BDB + §III table | LANDED (gitignored per `_scratch/` rule) |
| Parse plan §I Gesenius section — source-data gap surfaced + S160 drop decision | `_scratch/S158_LEXICON_PARSE_PLAN.md` §I.Gesenius | LANDED |
| 33 framework-callout drafts (16 Hebrew + 17 Greek; torah was drafted as the exemplar in the BDB render script) | `_scratch/lexicon-callouts-DRAFTS/{strong}_{term}.md` (34 files including torah) | LANDED — awaits Yoshi review |
| LSJ 5-entry sample render with all 5 callouts embedded as Greek-side gold-standard cards | `outputs/Phase_9.3_LSJ_Sample_Render_S160.html` (80 KB; charis, nomos, paidagogos, ethne, agrielaios) | LANDED — awaits Yoshi review |
| LSJ sample-render script | `restoration-pipeline/_session160_lsj_sample_render.py` | LANDED |

### Decisions locked at S160 (in writing per the verbal-answers-transcribe rule)

- **Q1 BDB sample-render review** → Yoshi approved the §26 styling + torah voice + visual register at S160 mid-session. The torah body's voice-rule violation ("Red Line #4 names this:" — internal-doc reference) was fixed at S160 close after Yoshi flagged it; the render now carries the corrected exemplar prose ("The principle the framework holds: never present *torah* as the curse..."). Re-render landed clean on the second run; no follow-up needed.
- **Q2 OpenScriptures BDB fidelity** → ship V1 as-is; defer richer-BDB investigation to v1.1+ post-launch wheel. Captured in the §26 S160 decision log.
- **Q3 Callout drafting wheel timing** → parallel with loader work. Executed S160 — 33 drafts landed in `_scratch/lexicon-callouts-DRAFTS/`.
- **Q4 Staging Postgres environment** → STILL UNRESOLVED. Yoshi answered "i have no clue im ignorant"; Claude leaned production-behind-feature-flag-gate but wanted to verify the App's feature-flag mechanism before locking. S161 open-task: peek REBUILD_STATE.md + the deploy config + the React surface for the feature-flag wiring, then propose a clean staging path.
- **Gesenius source-data gap** → drop Gesenius from V1; ship Hebrew with BDB single-source. Second-Hebrew slot reserved for v1.1+ when a clean source is identified. Captured in the §26 S160 decision log + the parse plan §I.Gesenius.
- **§27 toggle spec** → Free tier, BLB-pattern, chapter chrome strip + Settings reader-preferences, metallic-argaman toggle + bracket-emerald midtone superscripts. Locked S160. React implementation deferred to a future session per spec-then-build.

### Voice-gate sanity on the 33 callout drafts (S160 close)

Across all 34 markdown files in `_scratch/lexicon-callouts-DRAFTS/` (33 drafts + the torah exemplar that the wheel matched against):

- **Zero "substantial" violations** (S157 forward rule held).
- **Zero "per Red Line #X" body references** (no internal-doc references the reader can't see).
- **Zero "per the framework" / "per the voice skill" body references**.
- All files carry the locked frontmatter shape: `strong_number`, `term_display`, `gloss_error_summary`, `red_lines_cited`, `authored_by`, `session: S160`, `status: draft-awaiting-yoshi-review`.

Two minor items flagged by subagents for Yoshi's awareness:

1. **Batches 3 + 6 couldn't read `references/framework-deep.md`** from the subagent sandbox (file outside the connected folder mounts). Those subagents drafted from the main SKILL.md spine + the §26 spec + the torah exemplar, which carried the substance needed. **Affected callouts: chesed H2617, emunah H0530, pistis G4102, tsedek H6664, shabat H7676, kohen H3548, qadosh H6918, hagios G0040.** If Yoshi wants a depth-pass on these eight with the deep reference loaded (the Grace / New Heart / Mercy of Depart exposition touches *chesed* and *charis* most directly), re-pass at S161 open under explicit `mount the deep reference into the subagent prompt` instruction.

2. **Ioudaios G2453 callout stitched-quote** — fixed at S160 close. Yoshi's call was "either two or quote 19-22"; Claude expanded to the full Ezekiel 37:19–22 range with no ellipsis. v.21's *I will take the children of Yashar'el from among the heathen* now does the explicit gathering-from-the-nations work that strengthens the Jew-Gentile-binary dismantling. No follow-up needed.

## Reads at S161 open

1. **Invoke `anthropic-skills:yoshi-voice` in full** — needed for any callout-redline work AND for the loader's content-render decisions. The voice gate remains the standard for every partner-facing surface that ships.

2. **`outputs/Phase_9.3_BDB_Sample_Render_S160.html`** — the 25-entry BDB render Yoshi approved at S160 mid-session. Re-walk if any §26 redlines surface from looking at the rendered surface fresh.

3. **`outputs/Phase_9.3_LSJ_Sample_Render_S160.html`** — the 5-entry LSJ render landed at S160 close. Yoshi reviews visual register parity with the Hebrew side + the 5 fully-drafted callout cards (agrielaios, charis, nomos, paidagogos, ethne) as the Greek-side gold-standard. Any redlines on visual register / Greek body rendering / Tyndale citation hovers land as a small §26 follow-up before the loader runs.

4. **`_scratch/lexicon-callouts-DRAFTS/` directory** — 34 markdown files. Yoshi walks each callout, redlines or approves. Approved drafts move into `data-schema/migrations/sessionXX_lexicon_callouts_v1.sql` at S161 mid-session.

5. **`DESIGN_LANGUAGE.md` §26 + §27** — S160 decision log block at the top of §26, Gate #2 rewrite, the new §27. Confirm the spec reads cleanly under fresh eyes; any redlines land before the loader implementation expands the §26 helper-API surface.

6. **`_scratch/S158_LEXICON_PARSE_PLAN.md` §II + §III** — S160 corrections to the BDB transformation rules + Gesenius gap finding. The loader implementation cribs from these rules + the S160 sample-render scripts.

7. **`_scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md`** — loader skeleton stays as the architectural target. S161 expansion: drop the `parse_gesenius` function entirely (per S160 decision); expand `parse_bdb` and `parse_lsj` from the sample-render-script prototypes to the full-corpus emit.

8. **`REBUILD_STATE.md`** (open at the top) — confirms current production deploy state + any feature-flag mechanism the App carries. Read at S161 open to inform the Q4 staging-environment proposal.

## Open Yoshi-questions at S161 open (carried from S160)

1. **Callout-draft redlines.** 33 drafts to walk; any per-callout redlines, the framework-deep-pass re-do on the eight named callouts above, the Ioudaios stitched-quote-vs-split-quote call. Approved drafts move into the migration file; redlined drafts re-pass under voice-skill load before they move.

2. **LSJ sample-render redlines.** Visual register parity with BDB side + Greek body rendering (Tyndale-formatted HTML carried through largely as-is, with citation hovers converted to classical-cite spans for non-biblical refs and lsj-citation anchors for the NT./LXX./OT.-prefixed biblical refs) + fully-drafted callout cards. Any redlines land as a small §26 commit before the loader full-run.

3. **Q4 staging environment** — pending S161 open infrastructure-verification. Three candidate paths from S160:
   - **Local PG instance** — apply migration locally, walk surface, promote to production behind a feature-flag gate.
   - **Separate Render/Heroku staging app** — closest to production conditions; partner-walkable URL.
   - **Production behind feature-flag gate** — apply directly to production with the §26 surface hidden behind a feature-flag until Yoshi walks it. Fastest; relies on the App carrying a feature-flag mechanism (S161 open task: verify).

## One-way doors — do NOT execute without explicit go-ahead

1. **The lexicon_entries bulk-load migration apply to production.** The migration emits ~17,000 rows across BDB + LSJ (Gesenius dropped per S160 decision; original estimate of ~21,600 reduces to ~17,000 — BDB ~8,600 + LSJ + Abbott-Smith ~5,624 + extras). Apply path: staging first → Yoshi reviews sample render → Yoshi approves → production. The 3-gate proof pattern from S65–S71 applies (schema validation + coverage gate + link-integrity gate + sample-render proof).

2. **The framework-callouts INSERT migration.** Each of the 34 callouts is author-reviewed by Yoshi before the migration applies. Never apply with unreviewed callout text; the §17 the-proclaimer-steps-aside posture requires every callout to pass the voice gate.

3. **Any rip-and-replace of OpenScriptures BDB for a richer source.** Existing source-data is pushed at SHA 21c9add1; switching means re-pulling the corpus, re-recording SHAs in §VIII, and re-running the loader. Don't open this door without Yoshi's call.

4. **Any re-introduction of Gesenius into V1.** S160 decision dropped Gesenius from V1. Re-introducing it means (a) sourcing the body content (Tregelles PDF OCR or alternate dump), (b) updating §26 Gate #2 back to include Compare-with-Gesenius, (c) re-running the loader. v1.1+ scope only; don't open without Yoshi's call.

## Order of operations at S161

1. **Open with Yoshi's callout-draft review.** Walk the 33 drafts in `_scratch/lexicon-callouts-DRAFTS/`. Redlines or approvals per-callout. Any framework-deep-pass re-do on the eight named callouts kicks off as a small parallel-subagent batch with the deep reference mounted into the prompt. Approved drafts ready for migration assembly.

2. **Yoshi's LSJ sample-render review.** Visual register, Greek body rendering, Tyndale citation hovers, fully-drafted callout cards. Any §26 redlines land before the loader runs.

3. **Infrastructure verification — Q4 staging.** Read REBUILD_STATE.md + the app config + scan the React surface for the feature-flag mechanism (or its absence). Propose the staging path; Yoshi confirms.

4. **(Optional)** Re-render the BDB sample with the corrected torah callout body if Yoshi wants the visual-proof refresh.

5. **Full-corpus loader run — BDB + LSJ.** Walk both sources end-to-end (Gesenius dropped per S160 decision). Emit `data-schema/migrations/sessionXX_lexicon_entries_load.sql` (one migration file per the parse plan; or two — BDB + LSJ + Abbott-Smith stays under one source enum `lsj`). Apply coverage gate + link-integrity gate + schema validation per parse plan §V. Expected ~17,000 rows.

6. **Migration apply in staging** per Q4 path. Yoshi reviews via quick live-walk on the staging URL (or the production URL with the feature-flag enabled for his account only).

7. **Callout migration assembly + apply.** Approved callout drafts (from step 1) assemble into `data-schema/migrations/sessionXX_lexicon_callouts_v1.sql`. Apply in staging. Sample-render proof on staging with all 34 callouts visible above their target entries.

8. **Production deploy + live walk.** `bible.remnantofpromise.org` partner-walks the live surface. Phase 9.3 closes.

Honest session-count estimate: S161 (callout review + loader + entries-migration staging) → S162 (callout-migration apply + production deploy + live walk + Phase 9.3 close). Could compress to S161 alone if the callout review runs hot and Yoshi approves all 33 without re-passes. The publish-then-edit standard applies — if callouts miss a clean voice-gate, Yoshi can defer those to v1.1+ and ship the rest with the standing-disclaimer-alone floor per §26 Gate #1.

## Standing efficiency rules (carried forward from S158/S159/S160)

- **Parallel-subagent pattern reusable** for callout redline re-passes per the S155–S156 mechanism. Re-pass batches per the framework-deep-needed subset (chesed / emunah / pistis / tsedek / shabat / kohen / qadosh / hagios) with the deep reference mounted into the subagent prompt this time.
- **Local files first.** All lexicon source data on disk at `~/Desktop/App/source-texts/`; no web-fetch needed for the loader work.
- **Self-sufficient application of skill + source.** Same delegation Yoshi held at S158/S159/S160 open: implementation choices that don't materially affect partner-perceived surface — Claude lands the work, Yoshi reviews at session close.
- **Sandbox-git limitation.** All commits run from Yoshi's terminal via heredoc-script files written to `~/Desktop/`. Sandbox cannot git add/commit/push directly to host-mounted repos.
- **Spec-then-build.** Held cleanly through S121–S160. Carry forward: any architecture refinement caught during implementation lands in the spec docs BEFORE the corresponding loader code lands in `restoration-pipeline/`.
- **Verbal-answers-transcribe.** Strong S160 model — Gesenius drop, BDB fidelity, §27 toggle decision, callout-wheel result all transcribed into spec / parse plan / this open prompt before session close. Honor the same at S161 close.
- **Render artifacts now persist** — `.gitignore` patched at S160 so `outputs/Phase_*.html` files commit. S159's render-lost-to-session-scratchpad failure mode is closed.

## S160 status

§26 + §27 + COLOR_PALETTE + parse plan + .gitignore + BDB render + LSJ render + 33 callout drafts all landed. S160 closed cleanly with the Gesenius gap resolved (V1 drop), the BDB fidelity question resolved (V1 ship as-is), the §27 spec captured, and the callout-drafting wheel completed under voice-skill load. S161 opens against this state for callout reviews + loader + staging + production deploy. Phase 9.3 close is two sessions out (S161 + S162), one if the callout review runs hot.
