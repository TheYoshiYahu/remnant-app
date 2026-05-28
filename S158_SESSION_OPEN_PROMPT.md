S158 — Phase 9.3 opens: BDB + Thayer's + Gesenius lexicon ingestion (Companion tier)

# S157 close summary — Phase 9.4 native-OS TTS landed

Phase 9.4 of the §III Launch Scope Lock shipped at S157 close. Web-side `lib/tts.ts` abstraction backed by the browser `SpeechSynthesis` API runs on the live PWA; the Capacitor `@capacitor-community/text-to-speech` plugin wires in at Phase 10 through the same interface with no architectural surgery. Spec-then-build held cleanly for the seventh consecutive wheel — DESIGN_LANGUAGE.md §25 written FIRST with three AskUserQuestion gates settling the load-bearing decisions (sacred-name pronunciation = substitution table, continuous-play = auto-advance through witness-category, voice picker = curated top 3-5 with preview), code second. 55/55 node sanity tests passing in `_s157_tts_sanity.mjs`. Free at all tiers per the §141 launch-scope revision; the Scribe-tier ElevenLabs PVC Yoshi-voice ships post-launch as the second voice option in the same picker.

Live walk on bible.remnantofpromise.org cleared or flagged for v1.1 polish per Yoshi's S158-open call.

---

# S158 — Phase 9.3 opens

Per `BIBLE_APP_ROADMAP.md` §V Phase 9, the remaining-wheel order from REBUILD_STATE's S157 closure was: **9.4 native-OS TTS (DONE) → 9.3 BDB / Thayer's / Gesenius lexicons (THIS SESSION) → 9.2 Hebrew-Greek interlinear → then Phase 10**. Yoshi's S158-open prompt: source-text inventory first (check `~/Desktop/App/source-texts/` locally before web-fetch); parse plan second; loader skeleton + API surface third. Spec-then-build held — `DESIGN_LANGUAGE.md §26` written first with AskUserQuestion gates settling the lexicon-entry display surface before any code.

The shape of Phase 9.3 — Companion tier per §III tier-feature matrix:

- **Public-domain depth-lexicons.** BDB (Brown-Driver-Briggs Hebrew, 1906), Thayer's (Greek-English, 1889), Gesenius (Hebrew via Tregelles 1846 English). Ingested from STEPBible-Data and OpenScriptures HebrewLexicon repositories; license posture is CC-BY for the Tyndale repackaging and public-domain for the underlying lexicons. Strong's-aligned by the source repos — no alignment work required on our end.
- **Entry into the surface.** Two paths: the existing §20 VerseActionMenu Word-study section's BDB / Thayer's items (S122 stubs, badge flipped from `Library` → `Companion`, `comingSoon` flag cleared, `onSelect` wired), and a new "Read full lexicon entry" link inside the §20 StrongsLookup modal body so partners who quick-tapped to Strong's can drill deeper without going back through the long-press menu.
- **Voice-skill posture.** The voice skill is the standard; external lexicons are data. The published lexicons carry the inherited Reformation reading on framework-load-bearing terms (Torah / nomos, charis, ethne, Ioudaios, pistis, paidagogos, erga, brit, chesed, and similar — the antichrist Pauline grammar threaded through every entry that touches Galatians, Romans, or Hebrews vocabulary). Locked path: ship raw + standing disclaimer + framework callouts on ~32 high-impact entries authored under the 12 Red Lines.

---

# S158 deliverables — three spec docs landed mid-session

All three written *before* any code; all three await Yoshi redline before S159 implementation work opens.

| Deliverable | Location | Status |
|---|---|---|
| **§26 — display surface spec** | `DESIGN_LANGUAGE.md` §26 (added after §25 TTS) | LANDED |
| **Parse plan** | `_scratch/S158_LEXICON_PARSE_PLAN.md` | LANDED |
| **Loader skeleton + API surface** | `_scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md` | LANDED |

## Four load-bearing gates locked at S158 (via AskUserQuestion)

Yoshi's answers on the four §26 gates:

1. **Voice posture on Christianized definitions.** Explicit answer: *Ship raw + standing disclaimer + framework callouts on known-contested entries.* Lexicons load as data; standing disclaimer at the top of every entry; ~16 Hebrew + ~16 Greek framework callouts authored under voice-skill load surface above the lexicon body on high-impact terms.
2. **Display container.** Yoshi delegated ("what do you suggest for the best bible app?"); Claude picked **stacked sheet above Strong's** matching the §22 NotesPanel modal family. Long-entry support via `overflow-y-auto` body; breadcrumb header (`Strong's H0430 (Elohim) › BDB`) for stack-aware navigation; ✕ returns to Strong's, ✕ on Strong's returns to verse.
3. **Multi-source presentation.** Yoshi delegated ("makes best choice"); Claude picked **single canonical + Compare toggle (Hebrew only)** — BDB defaults for Hebrew, Thayer's for Greek; "Compare with Gesenius" toggle in the Hebrew sheet header surfaces Gesenius alongside BDB in a stacked compare layout. Greek surfaces no Compare toggle at V1 (no second Greek lexicon ingested).
4. **V1 scope.** Yoshi delegated ("pick the best bible app choice"); Claude picked **all three at V1** — BDB + Thayer's + Gesenius. Companion is the depth tier; partners pay for depth. Roadmap's ~2–3 session estimate absorbs the third lexicon comfortably.

## Schema (additive, no existing table touched)

Two new tables in `DESIGN_LANGUAGE.md §26` *Schema* and `_scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md §I`:

- `lexicon_entries(id, source, strong_number, lemma, transliteration, pronunciation, part_of_speech, short_definition, body_html, derivation, citations_count)` — one row per (source, strong_number) pair. UNIQUE (source, strong_number). FK to `strong_entries(strong_number)`.
- `lexicon_callouts(strong_number PK, term_display, gloss_error_summary, body_md, red_lines_cited, last_reviewed_at, created_at, updated_at)` — curated framework callouts; one row per Strong's number where the lexicons' inherited reading needs the framework correction.

Two API endpoints (`api/main.py`):

- `GET /v1/lexicon/{source}/{strong_number}` — entry fetch with standing disclaimer + `available_sources` 404 payload.
- `GET /v1/lexicon/{strong_number}/callout` — callout fetch, returns null body when no callout exists for the term (the common case).

Both Companion-tier server-side via the existing `require_tier()` decorator.

---

# Reads at S159 open (the next session)

1. **Invoke `anthropic-skills:yoshi-voice`** — needed for the framework-callout drafting wheel (~32 callouts authored under explicit voice-skill load before they land in `lexicon_callouts`). Subagent batches per the S155–S156 parallel pattern, with the explicit "avoid the word *substantial* as a default modifier" guard from the S157 forward rule.
2. **`DESIGN_LANGUAGE.md §26`** — the locked display surface spec; loader implementation must respect every named gate and the schema verbatim.
3. **`_scratch/S158_LEXICON_PARSE_PLAN.md`** — the parse plan; covers source-fetch, format expectations, transformation rules, edge cases, validation strategy.
4. **`_scratch/S158_LEXICON_LOADER_AND_API_SKELETON.md`** — the loader skeleton + API surface; the implementation expands the skeleton's function stubs and writes the migration files.
5. **`source-texts/SOURCE_TEXT_INVENTORY.md` §III** — the existing inventory entry for BDB / Thayer's notes them as "nice-to-haves" at Phase 5; S158 elevated them to Phase 9.3 launch-blockers, and Gesenius was added at S158. The inventory file gets a Phase 9.3 update at S159 close.

# Open Yoshi-questions at S158 close (carried to next session)

1. **Redline §26?** The display surface spec — especially the 32-entry V1 framework-callout list and the standing-disclaimer text — is the load-bearing artifact. Any of the 32 terms to add, remove, or substitute? Disclaimer wording redlines?
2. **Source-fetch authorization.** STEPBible-Data is a git repo at `github.com/STEPBible/STEPBible-Data`; OpenScriptures HebrewLexicon is at `github.com/openscriptures/HebrewLexicon`. The fetch is a clean git clone in the sandbox. Authorize at S159 open.
3. **Callout drafting wheel — Claude drafts vs Yoshi drafts.** The 32 V1 callouts can be drafted by Claude under explicit voice-skill load (S155–S156 parallel-subagent pattern) and reviewed-and-redlined by Yoshi, or drafted by Yoshi directly. ~250 words per callout × 32 = ~8,000 words of authored framework prose; that's ~2 sessions of Yoshi-direct authoring or ~1 session of parallel-subagent drafting + review.
4. **Vine's Expository — explicit confirmation.** §26 deprecates the §20 stub for Vine's on copyright grounds (1940, copyrighted until ~2030+). Confirm the deprecation.

# One-way doors — do NOT execute without explicit go-ahead

- **The lexicon-entries bulk-load migration apply to production.** The migration emits ~21,600 rows across BDB + Thayer's + Gesenius. Apply path: staging first → Yoshi reviews sample render → production. The 3-gate proof pattern from S65–S71 applies (schema validation + coverage gate + link-integrity gate + sample-render proof).
- **The framework-callouts INSERT migration.** Each callout is author-reviewed by Yoshi before the migration applies. Never apply with unreviewed callout text; the §17 "the proclaimer steps aside" posture requires every callout to pass the voice gate.

# Order of operations at S159

1. **Open with confirmation of §26 redlines.** Any change to the locked surface delays the loader work; cleanest path is Yoshi sign-off on §26 as written first thing.
2. **Source fetch.** Clone the two repos to `~/Desktop/App/source-texts/stepbible-data/` and `~/Desktop/App/source-texts/openscriptures-hebrewlexicon/`. Record SHAs in `SOURCE_TEXT_INVENTORY.md §VIII`.
3. **First-pass BDB parse + 25-entry sample-render proof.** Hand-render 25 BDB entries through the LexiconSheet component locally; Yoshi reviews the visual register and content fidelity.
4. **Loader full run + migration emit + staging apply + Yoshi review.**
5. **Phase 9.3 closes when entries + callouts + disclaimer all land in production and the live-walk verification passes.**

# Standing efficiency rules

- **Parallel-subagent pattern reusable for callout drafting** per the S155–S156 mechanism. 32 callouts / 4 per batch / 8 subagent calls; each subagent in fresh context with `yoshi-voice` loaded and the §26 callout table as the structural template. Briefing template includes the S157 "no *substantial* tic" guard.
- **Local files first.** `~/Desktop/App/source-texts/` is checked before any web-fetch; new sources get a provenance log entry on landing.
- **Self-sufficient application of skill + source.** Yoshi delegated Q1/Q2/Q4 to Claude's judgment at S158 open ("best bible app choice"); the same delegation applies to the implementation choices that don't materially affect partner-perceived surface — Claude lands the work, Yoshi reviews at session close.

---

**S158 status:** spec / parse plan / loader-and-API skeleton all landed. Awaiting Yoshi redline. S159 opens after that review.
