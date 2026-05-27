S151 — PWA regression walk on the v2 search + concept layer when Yoshi names the groups

# S150 close summary

**Two large pieces landed in prod this session.**

**Landed — canon modernization (Part A).** `data-schema/migrations/session149_modernize_canon.sql` applied via `apply_migration.py` wrapped in `_scratch/_s150_apply_and_verify.py`. 13,238 verse text UPDATEs across the canon edition (~42.6% of canon's 31,102 verses) under one transaction with `DO $verify$` block raising on mismatch. Verified non-destructive — `cross_references`, `cross_reference_thread_members`, `commentary_entries`, `concept_verse_index`, canon verses, and Prov-24:16 source xrefs all `delta=+0` on the pre/post snapshot. Same `verses.id` survived every UPDATE; every FK-referenced row stayed attached. `schema_version` bumped to `1.0.0-phase4-session149`. Rule 10 (in-place UPDATE for verse-text changes) held under its heaviest possible test.

**Landed — profound search engine v2 (Part B).** `data-schema/migrations/session150_search_engine_v2.sql` applied. Adds `verses.text_tsv tsvector GENERATED ALWAYS AS (to_tsvector('english', text)) STORED` with a GIN index, plus a unified `search_expansion_groups` / `search_expansion_terms` schema with a `kind in ('synonym', 'concept')` discriminator. 15 synonym groups seeded covering Yahuah / Yahusha / Elohim / Messiah / Ruach / Yashar'el / Yahudah / Yahudim / Yahudi / tsaddiq / shalom / Torah / Sabbath / Melchizedek / Adam — 63 variants. False-name variants (Jehovah, Yahweh, YHWH, Yeshua, Yehoshua, etc.) and phonetic variants (shalum, Yisrael, Yisroel, tzaddik) deliberately included so readers who learned different forms still land on the right verses (Rule 13 — the pastoral framing of the synonym layer). `api/main.py:search_verses` rewritten to expand each user token against the synonym groups and query `verses.text_tsv @@ to_tsquery('english', $expanded)` with canonical ORDER BY. Response shape preserved so the PWA does not change. `schema_version` bumped to `1.0.0-phase4-session150`.

**Carry-over — concept layer (deferred to S151), token-level fuzzy / typo correction (deferred to v2.1), phrase synonyms (deferred to v2.1).** Schema already reserves `kind='concept'`. v2.1 work has design sketches in `S150_CHECKPOINT.md` ready to lift.

**Three mid-session perf fixes shipped.** Yoshi caught the broken state post-deploy with his eye — *search isnt working at all*. Direct API probe via Chrome MCP showed 4-15s per query. Three rounds of in-session work brought it to <150ms typical / ~600ms worst on the synonym surface. `fall seven times` returns Proverbs 24:16 as the top hit — modernization stemming + tsquery + canonical ordering working end-to-end. The S149 cornerstone closes the way the wheel intended. Full perf history in `S150_CHECKPOINT.md` under "Perf history this session — the three rounds."

# Verified live in prod (Chrome MCP, end-of-S150)

| Query | Time | First hit |
|---|---|---|
| jehovah | 92-256 ms | Genesis 2:4 |
| yahweh | 376 ms | Genesis 2:4 (synonyms working — same set as jehovah) |
| righteous | 89 ms | Genesis 6:9 (Noah was a righteous man) |
| shalum | 109 ms | Genesis 15:15 (peace to thy fathers — shalum→shalom firing) |
| **fall seven times** | **422 ms** | **Proverbs 24:16** ← the S149 cornerstone |
| yahuah | 97 ms | Genesis 2:4 |
| name | 107 ms | Genesis 2:11 |
| sabbath | 87 ms | Exodus 16:23 |
| synagauge | 593 ms | **0 results** ← v2.1 work (vocabulary-table fuzzy) |

# The S151 wheel

## Wheel #1 — Chrome MCP regression walk against the live PWA (FIRST THING)

Direct API perf was confirmed at end-of-S150 via Chrome MCP. The PWA-side flow — search box typing → result list rendering → tap a hit → verse modal opens at the right chapter — has NOT been eyeballed. Walk through https://bible.remnantofpromise.org with the same seven probe queries from the table above plus:

1. **`righteous man fall seven times`** — Proverbs 24:16 top hit + the NT echoes (Romans 1:17, Galatians 3:11, Hebrews 10:38, Habakkuk 2:4) via stemming + tsaddiq group.
2. **`Jehovah`** → all Yahuah/LORD verses; Genesis 2:4 first.
3. **`Yahweh`** → same result set as Jehovah; confirms the synonym group fires symmetrically.
4. **`shalum`** → shalom verses via the synonym group.
5. **`Yeshua`** → all Yahusha verses (Group 2).
6. **`name's sake`** → the gathering-callback cluster (Psalm 23, Isaiah 48, Ezekiel 20, John 14) via stemming.
7. **`synagogue of Satan`** → Revelation 2:9 + 3:9. (NOT yet linked to sons-of-Belial; that's Wheel #3.)

For each query, verify:
- Result list renders.
- Modernized text reads naturally — no stray `thou/thee/thy/thine` outside source-echo parens, no broken `art` constructions, no `-eth` verbs in canon verses.
- Result order is canonical (Genesis → Revelation), not relevance-ranked. (S150 traded ts_rank for canonical ordering as the perf fix.)
- Tap target opens the chapter at the verse the search hit pointed at.
- The PWA's tier-aware snippet rendering uses the new `tier_required` field from the response (W6 search UI § DESIGN_LANGUAGE.md §23).

If anything regresses (broken text, wrong chapter, missing snippet), file under "Bug discovered during S151 regression walk" and patch before moving to the next wheel.

## Wheel #2 — v2.1 token-level fuzzy via materialized vocabulary

The `synagauge → 0 results` gap. `S150_CHECKPOINT.md` carries the design under "Wheel #2 — v2.1 token-level fuzzy via materialized vocabulary." Summary:

1. Create `search_vocabulary` table: `(lexeme TEXT PRIMARY KEY, occurrences INT)`. GIN index with `gin_trgm_ops`.
2. Populate from `ts_stat('SELECT text_tsv FROM verses')` — every lexeme that appears in any verse, with its frequency.
3. In `_expand_synonyms` (or a sibling `_expand_fuzzy`), for each user token NOT matching a synonym group, query the vocabulary table via `lexeme % $token` (similarity above the configured threshold) ORDER BY similarity DESC LIMIT 3. OR-expand the user token to those 3 nearest real lexemes in the tsquery.
4. Threshold tunable via `SET pg_trgm.similarity_threshold = 0.3` for the query (lower than the 0.6 default — catches `synagauge → synagogue` at ~0.45 similarity in the relaxed config).
5. Diagnostic script update: rewrite the L2 probes in `_scratch/_session150_search_engine_diagnostic.py` against the new vocabulary-fuzzy design.

Migration: `data-schema/migrations/session151_search_vocabulary.sql`.

## Wheel #3 — Concept layer

This is Yoshi's curation work. The `search_expansion_groups` table reserves `kind='concept'`; S150 did not populate any rows because each concept group is a framework call that only Yoshi can name.

**S150 starter group, awaiting Yoshi sign-off + addition of more groups:**

- **synagogue-of-Satan / sons-of-Belial** — Revelation's "synagogue of Satan" (Rev 2:9, 3:9) and the Tanakh's "sons of Belial" name the same group in the framework's reading. Search for either returns verses matching both. Phrases: `synagogue of Satan`, `sons of Belial`, `son of Belial`, `children of Belial`, `daughter of Belial`, `man of Belial`. (Yoshi to add/remove phrases.)

**Candidate groups Yoshi may want to name** (each is a framework reading; not pre-populated without his call):

- The seed war (watchers, tares, synagogue of Satan, sons of Belial, serpent's seed, sons of the wicked one)
- The lost sheep / scattered seed of the house of Yisrael (lost sheep, scattered, the dispersed, ten tribes, Ephraim, Yosef)
- The ingathering / gathering of the twelve tribes (gathering, ingathering, restoration, all Yashar'el saved)
- The curse / Deuteronomy 28 exile judgment (the curse, the wrath, the day of Yahuah, exile, scattering)
- The four costumes / antichrist systems (synagogue of Satan + Christianity + Hebrew Roots + Islam under one diagnostic — IF Yoshi wants the diagnostic to surface at this granularity)
- Effort over accomplishment (S147 thread cornerstone — `righteous falls seven times`, `the race`, `pressing toward the mark`, `run with patience`)

Migration template in `_scratch/_session150_search_synonyms.md` under "Concept groups." API change to read `kind='concept'` rows sketched in `S150_CHECKPOINT.md` under "Wheel #3 — Concept layer." Single additive edit; doesn't disturb the synonym path.

## Wheel #4 — Phrase synonyms (v2.1 polish)

Single-token synonyms covered S150's cornerstone use case. The phrase pairs need `phraseto_tsquery` + position-aware matching:

- Holy Spirit ↔ Ruach HaKodesh (Group 5 has the single tokens; the phrase pair is the addition)
- Son of Adam ↔ son of man (Group 15 placeholder waiting)
- Melek Tsadiq (Group 14 has Melchizedek variants; the Hebrew phrase is the addition)
- Lord's Prayer ↔ Our Father (whichever phrase users search for)

Single-token Adam group is already seeded as the attachment point.

## Order of operations

Wheel #1 first — regression walk. Confirms the v2 engine actually works for readers, not just in synthetic perf probes. If anything regresses, fix before moving on.

Wheels #2 (vocabulary fuzzy) and #3 (concept layer) are independent; either can land first. Wheel #3 depends on Yoshi naming the groups, so realistically Wheel #2 (which is pure Claude work) goes first if Yoshi is busy.

Wheel #4 (phrase synonyms) is lowest priority — its use case is mostly covered by single-token expansion plus the english stemmer.

Realistic full-session shape: Wheel #1 in the first 15-20 minutes (it's mostly walking and watching), then Wheel #2 for the rest of the session if Yoshi hasn't surfaced concept groups. If Yoshi surfaces 1-2 concept groups, Wheel #3 lands in parallel with Wheel #2.

# Standing efficiency rules (locked through S150 — fifteen rules now)

The thirteen rules from earlier sessions hold. S150 surfaced two new calibrations:

**Rule 14 — Bound CTE result sets early, never trust the outer LIMIT to cut.** S150's Round-1 search was 15× over budget because the inner `ts_hits` CTE returned thousands of rows and the outer `LIMIT $3` only cut at the very end — after `ts_rank` was computed for every row and a `GROUP BY MAX(rank)` aggregated them all. The planner cannot push the outer LIMIT into a CTE whose ordering depends on a computed expression. Every CTE that produces candidate row sets ships with its own LIMIT and ORDER BY matching the planner's index-friendly ordering.

**Rule 15 — Test latency BEFORE the regression walk on a feature where latency is the failure mode.** S150's deploy went out, Yoshi caught the broken state with his eye, and only then did Claude run the perf probe. If the perf probe had been part of the first post-deploy step — not deferred to a later session's Chrome MCP regression walk — the broken state would have been caught in seconds, not in Yoshi's lap. Latency-sensitive endpoints get a direct API probe immediately after deploy, before any PWA-side test.

# Read on session-open (in parallel-tool-call batch per Rule 3)

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` mount if not already attached.
3. Read this file in full (you're reading it now if you're S151-Claude).
4. Read `S150_CHECKPOINT.md` in full — especially "Perf history this session — the three rounds" (the failure-mode-then-fix sequence), the standing rules section, and "What did NOT land this session."
5. Read `_scratch/_session150_search_synonyms.md` for the concept-group proposal Yoshi will redline as Wheel #3 work starts.
6. Read `api/main.py:search_verses` (~line 1564) to load the current v2 implementation in context — the synonym expansion helper, the simple direct query, the canonical ordering. Round-3 final form, not the CTE'd Round-1/Round-2 versions.

S151-Claude: search engine v2 is live and working end-to-end. The PWA regression walk verifies that the reader experience matches the API perf. Then v2.1 polish (vocabulary fuzzy for typos) and the concept layer when Yoshi names the groups. Apply skill to source; verify against the live DB; meet readers where they were taught and bring them home in the restored form.
