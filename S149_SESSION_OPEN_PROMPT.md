S149 — Canon modernization overhaul + profound legitimate search engine

# S148 close summary

**Three things landed and one wheel is queued.**

**Landed — content surfaces.** Effort-over-accomplishment cross-reference thread (#6 in the thread set) seeded across canon and the four extras editions: `session147_effort_over_accomplishment_thread.sql` (canon, 48 pairs) and `session147b_effort_over_accomplishment_extras.sql` (apocrypha + enoch + jubilees + pseudepigrapha-charles-vol2, 12 pairs). Both applied via `apply_migration.py` and committed. Companion deliverables also shipped: blog post 22 (`the-same-god-says-both`) on the static site and in `blog-posts-batch-1/`, featured commentary tile-2 at `~/Desktop/App/commentary/featured/the-same-god-says-both.md`, teaching corpus concept 11 populated (summary + verses + yoshi-clarifications), and chapter-mapping review doc filed alongside the featured commentary. S147b initial apply failed on `column se.sort_offset does not exist` — Claude had treated a Python dict key in `seed.py`'s EDITION_PROFILES as a real column name; corrected by dropping the editions-table reference from the ORDER BY (books.canonical_order already encodes cross-edition ordering). Yoshi's rebuke locked the standing rule: schema column names get verified against `schema.sql` before any SQL ships, never from Python source.

**Landed — search bar perf fix (CODE WRITTEN, NOT YET COMMITTED).** The S148 search-bar investigation (Yoshi: *I type and it just sits*) traced to two real problems. First: `api/main.py:1598`'s search query was `WHERE v.text % $1 OR v.text ILIKE '%' || $1 || '%' ORDER BY similarity(v.text, $1) DESC NULLS LAST, ...`. Diagnostic in `_scratch/_session148_diag.out` proved the trigram `%` operator at threshold 0.3 returned **zero hits** for word-in-verse queries like `Yahuah` — all 9,287 hits came from the ILIKE branch. The OR forced a Bitmap Heap Scan with per-row recheck adding ~6.8s of overhead with no benefit. `ORDER BY similarity()` forced sorting all 9,287 candidates before LIMIT. Live execution: **9,849 ms**. S148b candidate-comparison diagnostic in `_scratch/_session148b_diag.out` verified the fix: drop the trigram WHERE, drop similarity from ORDER BY (keep it in SELECT for the PWA), order by canonical book/chapter/verse. Live execution: **4.9 ms** (2,000× speedup). Stress-tested on `grace` (165ms), `Israel` (12ms), `fall seven times` (103ms), `name's sake` (414ms) — all sub-second. Second problem: `SearchModal.tsx:48` had `MIN_QUERY_LENGTH = 2` with no UI feedback for one-character queries — the idle hint persisted silently, reading as "nothing happens." Both fixes written but **not yet committed/pushed** — see Apply command below.

**Queued — canon modernization gap surfaced.** Investigation into why the search couldn't find Proverbs 24:16 from `righteous man fall seven times` surfaced two separate gaps: the verse-form gap (canon says `falleth`, not `fall`) and the synonym gap (canon says `just man`, not `righteous man`). Audit on `~/Desktop/App/source-texts/parsed/` confirmed: **the canon was never modernized.** 31,102 verses, 10.9% with `-eth` verbs (3,385 verses), 21.0% with `thou/thee/thy/thine` (6,542 verses), 6.9% with `hast/wast/dost`, 9.2% with `ye`. The Apocrypha and Jubilees are fully modernized (0% on all pronoun categories); Enoch is partially modernized; canon never touched. The `_reference_modernize_from_apocrypha.py` pattern exists and ran cleanly on the Apocrypha — same pattern adapts to canon.

# Apply command — commit the S148 search fix BEFORE S149 substantive work

The main.py and SearchModal.tsx changes are sitting uncommitted in the working tree. Ship them first so Render's redeploy is rolling while S149 work proceeds.

```
cd /Users/mtm/Desktop/App \
  && rm -f .git/index.lock \
  && git add -A ':!.~lock*' \
  && git commit -m "S148 — search bar fix: drop trigram OR from search_verses WHERE (returned 0 hits at threshold 0.3 for word-in-verse queries and added 7s of bitmap-recheck overhead per S148 diagnostic), drop similarity from ORDER BY (forced sort over 9287 candidates before LIMIT). Verified live: 9849 ms -> 4.9 ms (2000x). Stress-tested across grace/Israel/fall-seven-times/name's-sake, all <500ms. Diagnostics at _scratch/_session148_diag.out + _session148b_diag.out. + SearchModal short-query hint: 'Type at least 2 characters to search' fires when query.length is 1, replacing the silent idle-hint that read as 'nothing happens'." \
  && git push
```

After Render's auto-deploy lands (3-5 min API + PWA), verify in Yoshi's browser via the Chrome MCP — type two characters, watch the network panel return in <100ms and the modal render hits.

# S148 verbal answers transcribed (Verbal-Answers-Transcribe operating discipline)

These are Yoshi's settled decisions from the S148 dialog. They define the S149 wheel and are not revisitable in S149 open without explicit Yoshi reversal.

**Canon modernization — DO IT.** Full pass across the canon edition: `-eth` verb endings → modern `-s` (`falleth → falls`, `hath → has`, `doeth → does`, `saith → says`, `cometh → comes`, etc.); `thou/thee/thy/thine → you/you/your/yours`; `hast/wast/wert/dost/didst/shalt/shouldst → have/were/were/do/did/shall/should`; `ye → you`. The Apocrypha modernizer at `restoration-pipeline/_reference_modernize_from_apocrypha.py` is the reference pattern — adapt to canon. Touches ~30% of canon verses. Restoration move, not paraphrase: the underlying Hebrew/Greek/Aramaic is unchanged; only the Elizabethan English skin is removed.

**Proverbs 24:16 — `just man → righteous man`.** Specific verse-level restoration during the canon modernization pass. The Hebrew is *tsaddiq* (צַדִּיק) — one word, translated inconsistently as *just* in some verses and *righteous* in others by the 1611/1769 translators. The framework's *effort-over-accomplishment* teaching reads this verse as *the righteous man falls seven times and rises* (per Yoshi's articulation in S148 — locked into blog 22, featured commentary tile-2, teaching corpus concept 11). Bringing the canon English form into line with the framework's reading IS restoration in the same sense as restoring *the LORD* to *Yahuah*. Audit `tsaddiq` translation choices across the canon for parallel cases that may warrant the same normalization in the modernization pass.

**Search engine — profound legitimate, not patched-ILIKE.** Implement Option 2 AND Option 3 from the S148 design dialog. Option 2: Postgres full-text search via `tsvector` on `verses.text` with English stemming (fall = falls = falling = fell collapse to one lexeme; falleth is residual-handled via the modernization pass). New GIN index on the `tsvector` column. Option 3: synonym dictionary layered on top — `just ↔ righteous`, `LORD ↔ Yahuah ↔ Yah`, `God ↔ Elohim`, and the framework's restored-name family. Postgres supports synonym dictionaries via `CREATE TEXT SEARCH DICTIONARY ... TEMPLATE synonym`. The search becomes lexeme-and-synonym-aware, not character-substring-aware. The combination of canon modernization + FTS + synonyms is what makes the search engine *profound and legitimate* per Yoshi's framing.

# The S149 wheel

## Part A — Canon modernization overhaul

1. **Read** `restoration-pipeline/_reference_modernize_from_apocrypha.py` in full. Inventory the VERB_FORMS + PRONOUN patterns and verify completeness against the canon corpus.
2. **Audit** canon for residual archaic forms not covered by the Apocrypha reference patterns. The S148 verse-form audit numbers (10.9% `-eth`, 21% thou/thee) are the baseline; after the patterns run, the residual should be <0.5% on the same scan.
3. **Author** `restoration-pipeline/_session149_modernize_canon.py` (or similar) — adapts the reference modernizer to canon. Keep the case-preserving + word-boundaried pattern discipline. Pre-stash sacred-name compounds the pattern set might break.
4. **Specific edit** alongside the bulk pass: Proverbs 24:16 `just man → righteous man`. Audit for parallel `tsaddiq → just` translation choices across canon and apply same normalization where the framework's reading prefers *righteous*.
5. **Validate**: run the modernizer on a working copy, diff against the live canon.json, manual spot-check 20 random verses, then apply. Voice-gate the output against the 12 Red Lines + 12-point editorial checklist.
6. **Re-seed** the live database from the modernized canon.json. `cd ~/Desktop/App/api && DATABASE_URL=... python3 seed.py --seed-only` (or `--bootstrap` if a fuller reset is wanted). Verify verse counts unchanged.
7. **Cross-reference impact check**: the cross_references table stores verse_ids, not text. Modernization changes text only — every cross_reference row, every chapter-end thread member, every commentary link survives. Confirm via spot-check after re-seed.

## Part B — Profound search engine

1. **Add tsvector column** to `verses` via migration: `text_tsv tsvector GENERATED ALWAYS AS (to_tsvector('english', text)) STORED`, with a GIN index on it. Migration filename: `session149_search_engine_v2.sql`.
2. **Author synonym dictionary** — list the framework's standing synonyms (`just ↔ righteous`, `LORD ↔ Yahuah`, `God ↔ Elohim`, `Christ ↔ Messiah ↔ Yahusha`, `son of man ↔ son of Adam` family, restored-name family). Postgres `CREATE TEXT SEARCH DICTIONARY` + `CREATE TEXT SEARCH CONFIGURATION` plumbing. Voice-gate the synonym list against the voice skill's Sacred Names convention.
3. **Rewrite** `api/main.py:search_verses` to use `text_tsv @@ to_tsquery(<synonym-aware config>, $1)` instead of ILIKE. Keep `similarity(v.text, $1)` in the SELECT for client display (no behavior change to `VerseSearchHit`). Order by `ts_rank(text_tsv, query) DESC, b.canonical_order, c.chapter_number, v.verse_number` — proper relevance ranking on the lexeme-matched set, fast because pre-LIMIT candidate set is small thanks to FTS index.
4. **Verify** via diagnostic at `_scratch/_session149_search_engine_diagnostic.py` following the S148/S148b pattern. Test queries: `righteous man fall seven times` (should hit Proverbs 24:16 — `righteous` synonyms to `just`, `fall` stems to `falls/falling/fell`, `seven times` exact-phrase-equivalent in lexeme space), `name's sake` (multi-word, should hit Psalm 25:11 + Isaiah 48 cluster), `Yahuah` (should hit thousands across canon + extras, sub-second), `the gathering` (semantic-ish, lexeme-driven hits). EXPLAIN ANALYZE every probe — target <50ms for typical queries, <500ms worst case.
5. **PWA-side**: verify `SearchModal.tsx` rendering against the new response shape. No client changes expected since similarity stays in the response, but a regression walk in the Chrome MCP confirms.

## Order of operations

Part A (modernization) lands first because the search engine's stemming is most effective on modernized text — `falleth` doesn't stem to `fall` under standard English stemmers, but `falls` and `falling` do. After Part A, Part B's diagnostic should already show `fall seven times` finding Proverbs 24:16 via stemming alone, before synonym handling is layered on. Then Part B layers synonyms to bridge `just ↔ righteous` and the restored-name family.

Both parts are full-session-quality wheels on their own. If S149 fills with Part A and the modernization pass is clean, Part B carries to S150. If Part A is tight (the reference modernizer is already proven on Apocrypha), both may land in S149.

# Standing efficiency rules (from S145 / S146 / S148; nine rules now locked)

The eight S145 rules hold. S148 surfaced one new calibration:

**Rule 9 — Schema column names verified before SQL ships.** Column names, enum values, and table relationships in SQL migrations get checked against `data-schema/schema.sql` (or `\d <table>` against the live DB) before the migration is authored. Python source files (`seed.py`'s `EDITION_PROFILES` dict, `models.py` field names, etc.) are NOT the source of truth for SQL column names — they are application-side mappings that may diverge. The S147b `editions.sort_offset` failure made this rule's absence visible; Yoshi's rebuke locked it as standing. Same discipline applies to chapter:verse references and book slugs — verified against the parsed JSON or live DB, never from training memory.

# Read on session-open (in parallel-tool-call batch per Rule 3)

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` mount if not already attached.
3. Read this file in full (you're reading it now if you're S149-Claude).
4. Read `restoration-pipeline/_reference_modernize_from_apocrypha.py` (the canonical pattern Part A adapts).
5. Read `restoration-pipeline/INTENTIONAL_VARIANCES.md` (governance posture on pipeline-vs-published divergence).
6. Read `_scratch/_session148_diag.out` + `_scratch/_session148b_diag.out` (the perf-fix evidence base; Part B's diagnostic format follows this).
7. Spot-check `~/Desktop/App/source-texts/parsed/canon.json` at Proverbs 24:16 to confirm pre-modernization state, then again after the modernization pass to confirm `just → righteous` + `falleth → falls`.

S149-Claude: the work is real. Restoration of the canon's English skin AND the search engine that makes the restoration findable. Apply skill to source; verify against the database; ship.
