S167 — Phase 9.2 (Hebrew-Greek interlinear) implementation

# S166 close — what shipped

- **DESIGN_LANGUAGE.md §28** — Hebrew & Greek interlinear surface spec. Four gates locked: Companion tier, above-verse English-aligned column, abbreviated-English morph register with hold-expansion, metallic-argaman chrome parity with §27. **§20 menu-stub deprecation locked A** — the per-word `Hebrew/Greek interlinear` stub gets removed when §28 ships (chrome-strip toggle covers the case, same pattern as §26 Vine's deprecation).
- **DESIGN_LANGUAGE.md §29** — Bookmarks Index spec. Free tier, bottom slide-up panel max-w-6xl, chronological newest-first, navigate-on-tap.
- **§29 implementation shipped end-to-end** — `GET /v1/bookmarks/index` endpoint + Pydantic models + TypeScript client + 5 helpers + 34/34 sanity tests + `BookmarksIndex.tsx` + chrome `⚑ Bookmarks` button left of Notes. tsc clean. Live on `e99475c` post-deploy.
- Modal family max-w-6xl pushed earlier (`17ba59e`). Word-tap regression diagnosed (PWA service-worker stale-cache; hard-refresh restores).

# S167 builds — §28 interlinear implementation

Six steps from §28 *Implementation deferred to future session*:

1. **Source fetch (Yoshi-terminal).** STEPBible TAGNT + TAHOT — sandbox can't clone, repo too big for 45s timeout.

   ```bash
   rm -rf /tmp/stepbible-extend
   git clone --depth 1 --filter=blob:none --sparse https://github.com/STEPBible/STEPBible-Data.git /tmp/stepbible-extend
   cd /tmp/stepbible-extend
   git sparse-checkout set "Translators Amalgamated OT+NT"
   git rev-parse HEAD  # → record in SOURCE_TEXT_INVENTORY.md §VIII
   cp -R "Translators Amalgamated OT+NT" ~/Desktop/App/source-texts/stepbible-data/
   ```

   If `Translators Amalgamated OT+NT` is the wrong dir name, `git ls-tree --name-only HEAD` to find the right one.

2. **Sample-parse** — read a few rows from TAGNT/TAHOT, confirm per-verse + per-word join keys against `verse_words`.
3. **Loader** — `restoration-pipeline/_session167_load_verse_words_morph.py` populates `verse_words.morphology` from TAGNT/TAHOT. No ALTER (column exists). Emits SQL for prod apply.
4. **Helpers + sanity** — `app/src/lib/interlinear-helpers.ts` (5 functions per §28) + `_s167_interlinear_sanity.mjs` (≥30 cases).
5. **PWA component** — `InterlinearLayer.tsx` + chapter chrome-strip toggle + Settings entry + SBL Hebrew / SBL BibLit font preload. Also: remove the §20 interlinear menu stub per the §28 deprecation lock.
6. **API extension** — `GET /v1/books/:slug/chapters/:n/words` tier-gated payload: morph + lemma + transliteration + gloss populated for Companion+, null otherwise.
7. **Live walk** — bible.remnantofpromise.org, Companion-tier test partner.

Realistic estimate: S167 lands steps 1–4 (source-fetch + sample-parse + loader + helpers/sanity). Steps 5–7 (React + API + walk) → S168.

# Standing residuals

- **9 long-tail S161 Group B singletons** (malachi 4:4, matthew 5:33, mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians 2:5, hebrews 11:37, revelation 1:10) — restoration-pipeline work, not in §28 scope.
- **Yahuah → Adonai vocatives addressing Yahusha** — restoration-pipeline pass.
- **v1.1+ candidates**: apocrypha book-slug map, Gesenius source investigation, Thayer's 1889 if a clean dump surfaces, system-wide Library→Companion lockedTier Literal rename.

# Open Yoshi-questions

1. **§28 spec redlines** before implementation locks code:
   - Hebrew word order = English-flow (locked). Native RTL is the other defensible call — cheaper to revisit at spec stage than post-implementation.
   - Morphology register = abbreviated + hold-expansion (locked). Could go fully-written-by-default if desktop column space allows.
   - Tier = Companion (locked). Free-tier-for-visibility is defensible too.

2. **§29 first-walk check** — once Render rebuilds, hard-refresh the live site and tap the ⚑ Bookmarks chrome button. Confirm: list renders chronological, tap-row navigates to the verse, inline-glyph visible post-nav, empty-state copy on a fresh partner. Redlines flow into S167 fast-follow.

3. **S167 scope ceiling** — full Track B push (steps 1–7) or land 1–4 and let 5–7 fall to S168? Per publish-then-edit, splitting is fine; per no-conservative-early-wraps, push at least to the helpers.

# Standing efficiency rules (carried)

- Voice-gate batch pattern for authored content
- Local files first before web-fetch
- Self-sufficient application of skill + source
- Sandbox-git limitation — commits + Render dashboard changes run from Yoshi's terminal
- Spec-then-build
- Verbal-answers-transcribe to the file before close
- Render artifacts persist
- Publish-then-edit
- **S166 — Service-worker hard-refresh verification at every PWA deploy**
- **S166 — Push verification at every session close (named: pushed / committed-not-pushed / edited-not-committed)**

# S166 status

§28 spec + §29 spec + §29 implementation all LIVE on `e99475c`. S167 opens against this state with §28 interlinear implementation as the sole new track.
