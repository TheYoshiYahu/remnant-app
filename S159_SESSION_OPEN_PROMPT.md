S160 — Phase 9.3 continues: BDB + LSJ + Gesenius loader full run + callout drafting wheel (Companion tier)

# S159 close summary — §26 redlines landed, source-fetch complete, BDB sample render up for review

S159 opened against the S158 spec-docs trio and Yoshi's flagged §26 redline (agrielaios G65 as the 33rd → 34th V1 callout, per Red Line #11). All four redline gates from S158-close answered on the recommended paths:

1. **agrielaios G65 — added as 18th Greek callout.** V1 callout list locked at **16 Hebrew + 18 Greek = 34 entries**. Wild-olive word itself now carries the framework reading that Red Line #11 dismantles: lexicons gloss *wild olive tree / Gentile grafted in by faith*; framework restores agrielaios as the natural descendants of the broken-off, scattered seed of Yashar'el grown wild among the nations, gathered home through the journey the prophets named.
2. **Callout drafting authorship.** Claude drafts under voice-skill load via parallel-subagent pattern (S155–S156 mechanism); Yoshi redlines and approves at session close. ~9 subagent calls × ~4 callouts each, fresh context per subagent, S157 *no-substantial-tic* guard.
3. **Vine's Expository deprecation confirmed.** §20 stub removed from the Word-study catalog at the buildMenuSections level; if a public-domain Vine's-class resource surfaces post-launch, it slots in as a v1.1+ alternate Greek lexicon.
4. **Source-fetch authorized.** Both repos cloned via sparse-checkout pattern; SHAs captured in §VIII.

Mid-session: STEPBible source-fetch revealed a parse-plan error. STEPBible does NOT carry Thayer's; it carries **TFLSJ** — Tyndale-edited LSJ (1940, classical Greek + NT) with **Abbott-Smith fallback** (1922 *Manual Greek Lexicon of the New Testament*) for NT-only vocabulary. Yoshi confirmed the swap at S159 mid-session; §26 locks LSJ as V1 Greek source. Thayer's 1889 becomes a v1.1+ alternate-Greek candidate if a clean Strong's-aligned public-domain dump is identified. Full LSJ-swap decision log lives at the top of §26 just before Gate #1.

Live walk on bible.remnantofpromise.org cleared for v1.1 polish per Yoshi's S158-open call; nothing on the live PWA changes until S160's migration applies in production.

---

# S159 deliverables — landed and pushed

| Deliverable | Location | Status |
|---|---|---|
| **§26 redlines** — agrielaios row, LSJ swap, decision log, count updates, source-posture sweep | `DESIGN_LANGUAGE.md` §26 (incl. line 1297 count text; SQL CHECK enum) | LANDED + PUSHED |
| **§20 stub catalog rename** — Thayer's → LSJ | `DESIGN_LANGUAGE.md` §20 (line 472 catalog row + lines 466 / 487 prose) | LANDED + PUSHED |
| **Parse plan corrections** — TFLSJ format section, LSJ + Abbott-Smith hybrid, fetch-pattern correction, sandbox-mount caveat | `_scratch/S158_LEXICON_PARSE_PLAN.md` §I + §II + §III + §IV + §V + §VII | LANDED (gitignored per `_scratch/` rule) |
| **Loader skeleton corrections** — parse_thayers → parse_lsj, SQL comments, source enum, sequencing | `_scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md` | LANDED (gitignored) |
| **Source fetch — OpenScriptures HebrewLexicon** @ SHA `21c9add13bc727d3a951361778e97e3ff7afd1ce` | `source-texts/openscriptures-hebrewlexicon/` (23M after OldLexicon + sinri trimmed) | LANDED + PUSHED |
| **Source fetch — STEPBible-Data Lexicons sparse-checkout** @ SHA `0753f2506dd2f8e4b56d76e5215fbd06c9ac2e32` | `source-texts/stepbible-data/Lexicons/` (39M — TBESH + TBESG + TFLSJ 0-5624 + TFLSJ extra) | LANDED + PUSHED |
| **Inventory §VIII provenance** — 6 new rows at 2026-05-28 | `source-texts/SOURCE_TEXT_INVENTORY.md` §VIII | LANDED + PUSHED |
| **BDB sample render proof** — 25 entries through the §26 LexiconSheet styling | `outputs/Phase_9.3_BDB_Sample_Render_S159.html` (94KB, local review artifact) | LANDED — awaits Yoshi review |

The S159 commit message names the architecture corrections inline so the rebuild-state ledger picks them up on its next sweep.

## Architecture findings (caught at S159; refine parse plan §III at S160 open)

1. **`entry/@id` is NOT the Strong's number.** Parse plan §II assumed `<entry id="H0410">`-style direct keying; actual format is TEI internal path (`a.ac.aa`). The Strong's join lives in `LexicalIndex.xml` via `<entry id="aaf"><xref bdb="a.ac.aa" strong="6" twot="2"/></entry>`. Loader must build a Strong's → BDB-id map from LexicalIndex first, then join to BrownDriverBriggs.xml's `<entry>` content. Sample render confirms the pattern works for all 25 selected entries (after H1 → H0001 zero-padding normalization).

2. **BDB has a sub→root entry architecture.** Derived nouns and adjectives (torah, elohim, ruach, qadosh, kohen, chesed, ...) carry `etym type="sub"` in LexicalIndex and live as compact entries in BDB (~150–1,500 chars). The full lexicographic depth lives at the etymological **verbal root** entry (`etym type="main"`, pointed at via the sub entry's `<etym type="sub">root-lex-id</etym>` text). Sample render now resolves sub→root and stacks both: derived-form brief content above a divider, then "Root analysis" header + the root entry's body below. 19 of 25 sample entries resolved to root analyses; the other 6 are themselves the verbal roots. **Parse plan §III needs a sub→root resolution rule added at S160 open** — the rendered body should always include both layers when the sub-type relationship exists.

3. **OpenScriptures BDB is abridged relative to the print edition.** Most root analyses are 150–1,500 chars; the famous BDB depth on Elohim (5+ pages in print covering plural-of-majesty, comparative Semitic parallels, theological history) is compact in the digital version. This is a partner-perceptible V1 fidelity question — see open Yoshi-question #2 below.

4. **Sandbox-mount git limitation.** Git clones fail directly into the host-mounted folder due to `.git/config.lock` write permission errors; workaround is clone-to-`/tmp` then `cp` working tree across. Sandbox cannot `git add/commit/push` directly to host-mounted repo (`.git/index.lock` blocked). All future commits run from Yoshi's terminal. Captured in parse plan §I.

---

# Reads at S160 open (the next session)

1. **Invoke `anthropic-skills:yoshi-voice`** — needed for the framework-callout drafting wheel (34 callouts authored under explicit voice-skill load before they land in `lexicon_callouts`). Subagent batches per the S155–S156 parallel pattern with the explicit "avoid the word *substantial* as a default modifier" guard from the S157 forward rule.
2. **`DESIGN_LANGUAGE.md §26`** — locked display surface spec, S159-updated with the agrielaios callout row + LSJ swap + S159 decision-log entry at the top + count language synced to 34 entries. Loader implementation must respect every named gate and the schema verbatim.
3. **`_scratch/S158_LEXICON_PARSE_PLAN.md`** — parse plan corrected at S159 for the LSJ swap and the architecture findings above. **At S160 open, add the parse plan §III sub→root resolution rule** per the architecture finding the sample render exposed.
4. **`_scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md`** — loader skeleton corrected at S159 for the LSJ swap (parse_thayers → parse_lsj; SQL enum / API source param swept). Loader implementation expands the skeleton's function stubs and writes the migration files.
5. **`source-texts/SOURCE_TEXT_INVENTORY.md` §VIII** — 6 new rows at 2026-05-28 covering the cloned lexicon sources with SHAs.
6. **`outputs/Phase_9.3_BDB_Sample_Render_S159.html`** — 25-entry BDB visual proof. **Yoshi's review feedback on this render gates the loader full-run work.** Specifically: visual register (typography, color, spacing), content fidelity (BDB body content rendered faithfully), framework-callout placement above the lexicon body, disclaimer wording, and any §26 redlines that surface from looking at the real render.
7. **`outputs/sample_render_25_bdb.py`** — the Python script that produced the BDB sample render. The parse + render logic here is the prototype for the production loader's body-HTML rendering rules; reuse the BDB → HTML transformation functions (render_element, render_bdb_entry_body, sub→root resolution) when expanding the loader skeleton.

# Open Yoshi-questions at S159 close (carried to S160)

1. **BDB sample-render redlines.** Visual register / content fidelity / framework-callout placement / disclaimer wording — any redlines surface as a small follow-up §26 commit before the loader full-run lands. Particularly review the torah card (the only fully-drafted framework callout in the sample) against the other 9 callout preview cards to confirm the locked architecture is correct before the 34-callout drafting wheel kicks off.

2. **OpenScriptures BDB fidelity — V1 acceptable, or investigate richer source?** OpenScriptures BDB is abridged relative to the print edition; root analyses average 150–1,500 chars vs print's multi-page treatments on major terms. The partner-perceived experience on tap-into-Elohim → BDB shows ~3KB of compact analysis vs the print's ~20KB+ of theological / etymological discussion. Three paths:
   - **Ship V1 with OpenScriptures as-is.** Cleanest path; CC-licensed; depth comes from the framework callouts above the lexicon body. The lexicon-body's job is to show how the inherited tradition handled the word; abridged-but-faithful is honest.
   - **Investigate BibleHub / BlueLetterBible scraped versions.** Both surface richer BDB online but neither publishes a clean raw download; scraping is fragile + license-questionable.
   - **Defer richer-BDB to v1.1+.** Ship OpenScriptures at V1, queue a richer-source investigation as a post-launch wheel if partner feedback flags the depth gap.

3. **Callout drafting wheel — kick off in parallel with S160 loader work, or sequence after entries land in staging?** Two paths:
   - **Parallel** — start the 9 subagent calls drafting the 34 callouts in parallel with the loader full-run + staging apply. By the time staging is up, drafts are ready for Yoshi's review.
   - **Sequential** — staging apply lands first; partner-tested visual register confirmed on staging; then drafting kicks off with the locked surface as visible context. Slower but safer; redlines on the surface can land before callouts get drafted.

4. **Staging environment access.** Parse plan + loader skeleton assume a staging Postgres available for the migration apply gate. Confirm: is staging the local PG instance, a separate Render/Heroku staging app, or do we apply directly to production behind a feature-flag gate?

5. **Parse plan §III architecture note.** The sub→root resolution rule + the LexicalIndex.xml join correction need to land in parse plan §III as an architecture refinement. Trivial edit (~15-20 lines); land at S160 open before the loader implementation work starts.

# One-way doors — do NOT execute without explicit go-ahead

- **The lexicon-entries bulk-load migration apply to production.** The migration emits ~21,600 rows across BDB + LSJ + Gesenius. Apply path: **staging first** → Yoshi reviews sample render → Yoshi approves → production. The 3-gate proof pattern from S65–S71 applies (schema validation + coverage gate + link-integrity gate + sample-render proof).
- **The framework-callouts INSERT migration.** Each of the 34 callouts is author-reviewed by Yoshi before the migration applies. Never apply with unreviewed callout text; the §17 *the proclaimer steps aside* posture requires every callout to pass the voice gate.
- **Any rip-and-replace of OpenScriptures BDB for a richer source.** Existing source-data is pushed at SHA `21c9add1...`; switching to a different BDB source (BibleHub-scraped, alternate public-domain dump) means re-pulling the corpus, re-recording SHAs in §VIII, and re-running the loader. Don't open this door without Yoshi's call on #2 above.

# Order of operations at S160

1. **Open with Yoshi's BDB sample-render review.** Visual register feedback, any §26 redlines, OpenScriptures-fidelity decision (Q2 above). Any §26 redlines land as a small follow-up commit before the loader work opens.
2. **Parse plan §III update.** Add the LexicalIndex join correction + the sub→root resolution rule per architecture finding #1 and #2 above. ~15-20 line addition to §III; the rule is well-understood from S159, just needs to be transcribed.
3. **First-pass LSJ parse + 5-entry sample render.** Parity with the BDB sample-render proof: 5 Greek entries through the §26 styling (charis G5485, nomos G3551, paidagogos G3807, ethne G1484, agrielaios G65 — the framework-callout-list-with-the-biggest-anchors). Confirm the TFLSJ tab-delimited parse + LSJ HTML → §26 body-html transformation works; Yoshi reviews visual register parity with Hebrew side.
4. **First-pass Gesenius parse + 5-entry sample render.** Same pattern: 5 Hebrew entries with Gesenius alongside BDB in the Compare-mode panel stack. Confirms Gate #2's stacked-compare layout.
5. **Full-corpus loader run.** Walk all three sources end-to-end; emit `data-schema/migrations/sessionXX_lexicon_entries_load.sql` (one migration file or three; defer per loader-skeleton §VI's open-decision). Coverage gate + link-integrity gate + schema validation per parse plan §V.
6. **Migration applies in staging.** Yoshi reviews staging via a quick live-walk on the staging URL.
7. **Callout drafting wheel kicks off.** 9 parallel-subagent batches per S155–S156 mechanism, 4 callouts per batch (one batch has only 2 callouts), each in fresh context with `yoshi-voice` loaded and the §26 callout table as the structural template. Drafts land in `_scratch/lexicon-callouts-DRAFTS/{strong_number}.md`.
8. **Yoshi reviews each callout draft.** Redlines or approvals; approved drafts move into the callout migration file `sessionXX_lexicon_callouts_v1.sql`.
9. **Callout migration applies in staging.** Sample-render proof on staging with all 34 callouts visible above their target entries.
10. **Production deploy + live walk.** `bible.remnantofpromise.org` partner-walks the live surface; Phase 9.3 closes.

Honest session-count estimate: S160 (parses + loader + staging entries) → S161 (callout drafts + reviews + staging callouts) → S162 (production deploy + live walk + Phase 9.3 close). Could compress to S160 + S161 if the callout wheel runs hot in parallel. The publish-then-edit standard applies — if callouts miss the V1 boat, ship with the standing-disclaimer-alone V1 floor per §26 Gate #1.

# Standing efficiency rules (carried forward from S158)

- **Parallel-subagent pattern reusable for callout drafting** per the S155–S156 mechanism. 34 callouts / ~4 per batch / ~9 subagent calls; each subagent in fresh context with `yoshi-voice` loaded and the §26 callout table as the structural template. Briefing template includes the S157 "no *substantial* tic" guard. Briefing template also includes the agrielaios entry as one of the 9-callouts-list-for-batch-1 since it's the Red Line #11 anchor and the newest addition.
- **Local files first.** Lexicon source data is on disk at `~/Desktop/App/source-texts/`; no web-fetch needed for the loader work.
- **Self-sufficient application of skill + source.** Same delegation Yoshi held at S158/S159 open: implementation choices that don't materially affect partner-perceived surface — Claude lands the work, Yoshi reviews at session close.
- **Sandbox-git limitation.** All commits run from Yoshi's terminal via heredoc-script files written to `~/Desktop/` (the S159 push script pattern). Sandbox cannot `git add/commit/push` directly to host-mounted repos.
- **Spec-then-build.** Held cleanly through S121–S159 (S121 Wheel 2 / 3, S122, S123, S125, S126, S157, S158, S159). Carry forward: any architecture refinement caught during implementation (like the LexicalIndex join correction or the sub→root resolution rule) lands in the spec docs BEFORE the corresponding loader code lands in `restoration-pipeline/`.

---

**S159 status:** §26 redlines + LSJ swap + source-fetch + BDB sample render all landed; spec + 62M of source data pushed at S159 commit. Phase 9.3 entries-side and callouts-side both gated behind Yoshi's BDB sample-render review. S160 opens after that review.
