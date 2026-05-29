S167 — §28 Phase 9.2 (Hebrew-Greek interlinear) — steps 1–4 landed

# What shipped this session

Steps 1–4 of the §28 implementation plan complete; steps 5–7 (React component, API extension, live walk) deferred to S168 per the prompt's scope ceiling.

## Step 1 — STEPBible source fetch (Yoshi-terminal)

- Sparse-checkout clone landed `TAHOT Gen-Deu / Jos-Est / Job-Sng / Isa-Mal` (4 files), `TAGNT Mat-Jhn / Act-Rev` (2 files), and `Morphology codes/TEHMC` + `TEGMC` (2 files). ~156 MB OT+NT, ~848 KB legends. `Lexicons/` from S159 preserved.
- HEAD SHA recorded: `b87e1d144ab3f16309f0e20dec0e5858c8470473`.
- §28 spec's "TAGNT/ + TAHOT/" expected dir names were wrong; actual STEPBible repo carries one combined dir `Translators Amalgamated OT+NT`. The S167 open prompt got this right.

## Step 2 — Sample-parse against verse_words

- TAGNT row format (tab-separated): `Mat.1.1#06=NKO	Δαυὶδ (Dauid)	of David	G1138=N-GSM-P	...` — field 4 is `Strong=Morph` combined.
- TAHOT row format: `Gen.1.1#01=L	בְּ/רֵאשִׁ֖ית	be./re.Shit	in/ beginning	H9003/{H7225G}	HR/Ncfsa	...` — field 4 is compound Strong's (braced primary + unbraced prefixes), field 5 is compound morph (slash-separated).
- Confirmed join key cannot be `(verse_id, position)` — STEPBible's source-position counts original-language word order; our `verse_words.position` counts English KJV order. The reliable join is `(verse_id, primary_strong, occurrence_index)`.

## Step 3 — Loader

**File:** `restoration-pipeline/_session167_load_verse_words_morph.py`

**Output:** `restoration-pipeline/validation-reports/_s167_morph_updates.sql` (12.4 MB, single transaction, idempotent).

**Strategy:** parses 420,053 per-word data rows across the full 66-book Protestant canon (282,218 Hebrew + 137,835 Greek; 134,486 Hebrew rows have compound prefix+base morphemes). Emits a temp-table COPY + CTE-with-ROW_NUMBER UPDATE that ranks both source rows and verse_words rows by per-verse strong-number occurrence index and joins on `(book_slug, chapter_number, verse_number, primary_strong, strong_occ)`. Smaller-count-wins on English/original-language word-count mismatches per verse.

**Hebrew compound storage:** the FULL compound morph code (`HR/Ncfsa`, `HC/To`, `HTd/Ncmpa`, etc.) stored verbatim in `verse_words.morphology`; the helper splits on `/` at render time.

**Strong's normalization:** primary Strong's extracted from braced `{H####X?}` token; trailing homonym letter (G/H/A/B/C/D) stripped to match `verse_words.strong_number`'s S120 4-digit zero-padded form.

**Run path (Yoshi's terminal, against prod):**
```
psql "$DATABASE_URL" -f restoration-pipeline/validation-reports/_s167_morph_updates.sql
```

The SQL prints post-apply stats: total verse_words, morph_populated, strong_no_morph.

**No ALTER, no migration, no schema change.** `verse_words.morphology` already exists as nullable TEXT (S120 V2-deferred).

## Step 4 — Helpers + sanity

**File:** `app/src/lib/interlinear-helpers.ts` (5 helpers per §28 spec, ~600 lines incl. inlined morph dictionaries).

- `formatMorphology(rawCode, language, register='short'|'expanded')` — Greek (Robinson) + Hebrew/Aramaic (Westminster) decoders inlined; compound Hebrew codes split on `/` and joined with ` + `; unknown / language-mismatch / null inputs return defensive fallback per spec.
- `selectInterlinearFontStack(language)` — SBL Hebrew for Hebrew+Aramaic, SBL BibLit for Greek, body fallback otherwise.
- `wrapHebrewBidi(lemma)` — Unicode FSI/PDI isolation markers (U+2068 / U+2069).
- `buildInterlinearColumn(verseWord, strongEntry, fontStackOverride?)` — emits the render-ready column structure `{ position, surface, lemma, transliteration, morphology: { short, expanded }, gloss, language, fontStack }`. Surface-only column when strong_entry is null. Morphology pre-decoded to both registers so the long-press swap is render-only.
- `groupVerseColumns(verseWords, strongEntries)` — per-verse column array in English-flow position order; defensive against out-of-order input, duplicate positions (last-wins), and missing strong entries.

**File:** `_s167_interlinear_sanity.mjs` at app root.

**Result: 76/76 sanity cases pass** (target ≥30). Coverage:

- Greek (16): V-AAI-3S, V-PAI-1P, V-2AAI-3S (2nd aorist), V-PAP-NSM (participle), V-AAN (infinitive), N-GSM, N-ASM-P (proper), T-ASM, A-APF, P-GSM, P-1GS (person prefix), CONJ, PREP, PRT-N (negative), ADV-I (interrogative); short + expanded registers.
- Hebrew (16): qal/niphal/piel/pual/hiphil/hophal/hithpael perfect/imperfect; noun common masc plural absolute; noun common fem sg absolute; compound HR/Ncfsa, HC/To, HTd/Ncmpa; bare HTo (object marker), HC (conj); Aramaic peal perfect.
- Defensive (4): unknown raw → raw; null/empty → empty; Hebrew code in Greek context → raw; Greek code in Hebrew context → raw.
- Font stack (5): hebrew + aramaic → SBL Hebrew; greek → SBL BibLit; unknown + null → body fallback.
- wrapHebrewBidi (6): Hebrew with/without niqqud, Aramaic, empty/null, LTR passthrough.
- buildInterlinearColumn (15 sub-assertions across 4 scenarios): Hebrew full / Greek full / surface-only / null morphology cases.
- groupVerseColumns (5+): in-order / out-of-order sort / dedup last-wins / missing strong / empty.

**`tsc -b` clean** on `app/`.

## SOURCE_TEXT_INVENTORY.md §VIII updated

Three new provenance log rows added — TAHOT, TAGNT, TEHMC+TEGMC — all dated 2026-05-29 with the STEPBible HEAD SHA.

# Push verification

**edited-not-committed:**
- `source-texts/SOURCE_TEXT_INVENTORY.md` — three §VIII rows added.
- `app/src/lib/interlinear-helpers.ts` — NEW.
- `_s167_interlinear_sanity.mjs` — NEW.
- `restoration-pipeline/_session167_load_verse_words_morph.py` — NEW.
- `restoration-pipeline/validation-reports/_s167_morph_updates.sql` — NEW (12.4 MB).

**not in git (intentional — large source data, .gitignore territory or skip):**
- `source-texts/stepbible-data/Translators Amalgamated OT+NT/` — 156 MB, sparse-checkout artifacts; can `.gitignore` if not already.
- `source-texts/stepbible-data/Morphology codes/` — 848 KB legend files, keep or `.gitignore`.

**committed-not-pushed:** none.
**pushed:** none new this session (sandbox can't push; awaiting Yoshi's terminal).

**Suggested Yoshi commit flow:**
```bash
cd ~/Desktop/app
git add app/src/lib/interlinear-helpers.ts \
        _s167_interlinear_sanity.mjs \
        restoration-pipeline/_session167_load_verse_words_morph.py \
        restoration-pipeline/validation-reports/_s167_morph_updates.sql \
        source-texts/SOURCE_TEXT_INVENTORY.md
git commit -m "S167 §28 Phase 9.2 — interlinear helpers + sanity + loader + SQL"
git push
```

Then to apply against prod:
```bash
psql "$DATABASE_URL" -f restoration-pipeline/validation-reports/_s167_morph_updates.sql
```

The SQL is idempotent; the in-transaction post-apply SELECT prints stats so you'll know the populate worked.

# What S168 opens against

1. **PWA component** — `InterlinearLayer.tsx`, `useInterlinearToggle` hook, chapter chrome-strip toggle button (argaman §27 register, Companion-badge for below-tier), Settings → Reader preferences entry. SBL Hebrew + SBL BibLit font preload conditional on Companion JWT. Remove the §20 `interlinear` menu stub per the deprecation lock.
2. **API extension** — `GET /v1/books/:slug/chapters/:n/words` tier-aware payload extending `ChapterWordsResponse`: morphology + lemma + transliteration + gloss populated for Companion+, NULL otherwise. Single endpoint, tier-aware response shape per `JWT.tier`.
3. **Live walk** — bible.remnantofpromise.org, Companion-tier test partner, hard-refresh per S166 PWA service-worker rule, verify column-stack rendering / long-press morph expansion / chrome-strip toggle persistence across chapters.

# Open Yoshi-questions carried forward

1. **§29 first-walk** — once Render rebuilds and hard-refresh on the live site, confirm: ⚑ Bookmarks button visible left of Notes / list renders chronological newest-first / tap-row navigates to verse / inline-glyph visible post-nav / empty-state copy on fresh partner. Redlines flow into S168 fast-follow.
2. **Compound-Hebrew display register in S168** — `formatMorphology` decodes `HR/Ncfsa` as `prep. + n. com. f. sg. abs.` (full compound). Defensible alternative: render only the primary (`n. com. f. sg. abs.`) and surface the prefix on long-press. Worth your eye on a few sample verses once the InterlinearLayer is live.
3. **Verse-coverage shortfall reporting** — the SQL emits stats on `morph_populated` vs `strong_no_morph`. After apply, if `strong_no_morph` is materially > 0, that's the count of verse_words rows that need closer occurrence-index review (most likely Strong's-homonym disambiguation in our `verse_words.strong_number` not matching STEPBible's homonym suffix; addressable in S168 with a one-pass enrichment if the count is non-trivial).

# Standing residuals (carried)

- 9 long-tail S161 Group B singletons (malachi 4:4, matthew 5:33, mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians 2:5, hebrews 11:37, revelation 1:10) — restoration-pipeline work, not in §28 scope.
- Yahuah → Adonai vocatives addressing Yahusha — restoration-pipeline pass.
- v1.1+ candidates: apocrypha book-slug map, Gesenius source investigation, Thayer's 1889 clean dump, system-wide Library → Companion lockedTier Literal rename.

# Standing efficiency rules (carried)

- Voice-gate batch pattern for authored content
- Local files first before web-fetch
- Self-sufficient application of skill + source
- Sandbox-git limitation — commits + Render dashboard changes run from Yoshi's terminal
- Spec-then-build
- Verbal-answers-transcribe to the file before close
- Render artifacts persist
- Publish-then-edit
- S166 — Service-worker hard-refresh verification at every PWA deploy
- S166 — Push verification at every session close (named: pushed / committed-not-pushed / edited-not-committed)
