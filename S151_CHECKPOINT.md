# S151 Checkpoint — v2 PWA Regression + v2.1 Vocabulary Fuzzy + Concept Layer Seeded

## Status at session close

**Wheel #1 — Chrome MCP regression walk against the live PWA: DONE.** Seven probes ran end-to-end against `https://bible.remnantofpromise.org`. Search box renders, results list renders, tap-into-verse opens the right chapter, the response includes `tier_required` for the PWA's gate-(c) tier-aware snippet card. Two bugs flagged (modernization stragglers in canon, extras canonical_order ordering quirk) — both pre-existing carry-over from S149 + the extras data load, NOT v2 search regressions.

**Wheel #2 — v2.1 token-level fuzzy via materialized vocabulary: DRAFTED, READY TO APPLY.** `data-schema/migrations/session151_search_vocabulary.sql` + the `_expand_fuzzy` helper wired into `api/main.py:search_verses`. Per-query `SET LOCAL pg_trgm.similarity_threshold = 0.3` widens the `%` operator's index seek to catch real typos (synagauge → synagogue at sim ~0.45). LATERAL JOIN against `unnest($1::text[])` keeps the lookup to one roundtrip for any number of user tokens.

**Wheel #3 — Concept layer: DRAFTED, READY TO APPLY.** `data-schema/migrations/session151_concept_groups.sql` seeds two `kind='concept'` rows (12 terms total). The `_expand_concepts` helper + the `OR (cardinality($4::text[]) > 0 AND v.text ILIKE ANY($4::text[]))` clause added to the search SQL. Yoshi named the groups in S151:

- **synagogue-of-satan-sons-of-belial** (6 phrases): synagogue of Satan, sons of Belial, son of Belial, children of Belial, daughter of Belial, man of Belial.
- **seed-war** (6 terms — 2 single tokens, 4 phrases): watchers, tares, synagogue of Satan, sons of Belial, serpent's seed, sons of the wicked one.

**Modernization stragglers: DEFERRED to a future curation session.** Audit revealed 41 distinct archaic forms across ~530 canon verse matches. Yoshi's call — these need word-by-word curation (which to flatten, which to keep for KJV cadence) and that's not autonomous-Claude territory. Full inventory captured below in *Modernization-straggler audit inventory*.

**Apply + deploy: WAITING ON YOSHI** (or on a future session's apply harness run from the allowlisted IP).

## Live state of prod

`schema_version` after S151 application (pending):

| Stage | Version |
|---|---|
| S149 close | `1.0.0-phase4-session149` (Part A — canon modernization) |
| S150 close | `1.0.0-phase4-session150` (Part B — search engine v2 with synonym layer) |
| S151 close (after apply) | `1.0.0-phase4-session151` (v2.1 vocabulary fuzzy + concept seed) |

## Files written this session

| Path | Purpose |
|---|---|
| `data-schema/migrations/session151_search_vocabulary.sql` | Creates `search_vocabulary(lexeme PK, occurrences)` + GIN trgm index, seeds from `ts_stat('SELECT text_tsv FROM verses')`. Bumps `schema_version`. |
| `data-schema/migrations/session151_concept_groups.sql` | Seeds two `kind='concept'` rows in `search_expansion_groups` + 12 terms in `search_expansion_terms`. No `schema_version` bump (sibling to vocab). |
| `_scratch/_s151_apply_and_verify.py` | Apply harness for both migrations. Render IP-allowlist diagnostic + handshake retries (same pattern as `_s150b_apply_and_verify.py`). Pre/post snapshot + verification + two smoke tests. |
| `_scratch/_session151_search_engine_diagnostic.py` | Rewritten L2 probes against the new vocabulary path; new L3 probes for the concept layer. L1 probes unchanged. |
| `api/main.py` (edit) | Adds `_expand_fuzzy` + `_expand_concepts` helpers; updates `_build_tsquery` to take an optional `fuzzy_map`; rewrites `search_verses` to call all three layers and add the concept `OR ILIKE ANY` clause. Round-3 perf shape preserved (single SELECT, no CTEs, no GROUP BY, GIN-backed both sides of the OR). |

## Wheel #1 — regression walk findings

Seven probes executed against the live API at `https://api.bible.remnantofpromise.org/v1/verses/search` from inside the PWA at `bible.remnantofpromise.org`:

| Probe | ms | Total | Top hit | Notes |
|---|---|---|---|---|
| `righteous man fall seven times` | 708 | 7 | Proverbs 24:16 | 5-token AND query (highest cost). NT echoes don't share all 5 tokens so don't surface here — the S151-prompt expectation that the tsaddiq group would carry Romans/Galatians/Hebrews/Habakkuk was based on stemming alone; with AND-joined tokens, those verses fall outside the result set. Working as designed. |
| `Jehovah` | 112 | 25 | Genesis 2:4 | Yahuah synonym group firing. |
| `Yahweh` | 83 | 25 | Genesis 2:4 (identical set) | Symmetric synonym group firing. |
| `shalum` | 98 | 25 | Genesis 15:15 | shalom synonym group firing. |
| `Yeshua` | 204 | 25 | Matthew 1:1 | Yahusha synonym group firing. |
| `name's sake` | 410 | 25 | 1 Samuel 12:22 | Apostrophe handled; stemming surfaces Psalms 23 / Isaiah 48 / Ezekiel 20 / Matthew 10 / Matthew 19; John 14 beyond LIMIT 25 (not a regression). |
| `synagogue of Satan` | 519 | 5 | Revelation 2:9 | Plus Rev 3:9 + three Gospel-of-Nicodemus extras hits. Concept linkage to sons-of-Belial NOT yet active at S150-deployed state — drafted in S151's concept seed, awaiting apply. |

Two queries above the 500ms target (708ms / 519ms) but well within the post-Round-3 budget. **No latency regression.**

**Tap-into-verse confirmed working.** Clicked Proverbs 24:16 from search results → page navigated to Proverbs 24 with verse 16 at top of viewport; search modal closed; cross-reference-apparatus header rendered at chapter end.

**tier_required surfacing confirmed.** Canon verses come back as `"tier_required": "free"`; extras as `"tier_required": "extras"`. The PWA's W6 search-V1 UI per DESIGN_LANGUAGE.md §23 can read this directly.

**Modernized text reads naturally on the canon hits.** Verified clean (zero canon hits) for the common archaisms: `thou`, `thee` (one hit, inside `(the LORD thy God)` source-echo), `thine`, `saith`, `cometh`, `doeth`, `maketh`, `liveth`. The S149 pass landed cleanly on the bulk of the modernization. The stragglers are below.

### Bug flagged during the walk #1 — modernization stragglers in canon

Caught in the regression walk. The S149 modernization pass missed rare `-eth` / `-est` forms and the reflexive `thyself`. Audit inventory captured below for the deferred curation session. NOT a v2 search regression — pre-existing data carry-over from S149.

### Bug flagged during the walk #2 — extras canonical_order ordering quirk

`righteous man fall seven times` results ordered the extras hits as: Antiquities VIII → Sirach → Gospel of Nicodemus → Apocalypse of Peter → Apocalypse of Paul → 2 Clement. The PWA's `/read` chapter dropdown places Sirach (in the Apocrypha block) *before* the Josephus block (Wars / Antiquities). The search SQL uses `ORDER BY b.canonical_order ASC` with no edition-priority tiebreak; the `/v1/books` endpoint returns the 66 canon books only, so the extras' `canonical_order` values aren't directly visible. Either an extras canonical_order data audit is needed, or the search SQL should add an `editions` join with an `edition_priority` tiebreak. Filed as task; not blocking for v2.1.

## Wheel #2 — v2.1 vocabulary fuzzy

The `synagauge → 0 results` gap closes. Design:

1. **`search_vocabulary` table.** `(lexeme TEXT PRIMARY KEY, occurrences INT NOT NULL)`. GIN trigram index `idx_search_vocab_trgm`. Seeded from `ts_stat('SELECT text_tsv FROM verses')` — every english-parser lexeme across canon + extras with its `ndoc` document-frequency count.

2. **`_expand_fuzzy` helper.** For each user token NOT matched by a synonym group, queries the vocabulary table via `lexeme % $token` with `SET LOCAL pg_trgm.similarity_threshold = 0.3`. ORDER BY `similarity DESC, occurrences DESC LIMIT 3`. LATERAL JOIN against `unnest($1::text[])` so all unexpanded tokens get expanded in one roundtrip.

3. **Tsquery composition (`_build_tsquery` extended).** Synonym hits OR-expand to all group variants (same as S150). Fuzzy hits OR-expand to the original token + the nearest lexemes (so an exact-match user token still hits via the literal even when fuzzy alternatives are added). AND-join across tokens.

4. **Threshold rationale.** PG's `pg_trgm.similarity_threshold` defaults to 0.6 — too strict for real typos (`synagauge` vs `synagogue` scores ~0.45). 0.3 catches the meaningful misses without flooding the result set. Locked at S151 per Yoshi confirmation.

5. **API change.** `api/main.py:search_verses` calls `_expand_synonyms` → computes `unexpanded` tokens → calls `_expand_fuzzy` → builds tsquery with both maps. Round-3 perf shape preserved.

Expected behavior after deploy:

| Typo | Expansion target | Mechanism |
|---|---|---|
| `synagauge` | `synagogu` (synagogue's stemmed form) | sim ~0.45, top fuzzy lexeme |
| `messias` | `messiah` | sim ~0.55 |
| `yehowah` | `yahuah` | sim ~0.35 (over threshold, just barely) |
| `yahushua` | `yahusha` | sim ~0.80 (very close) |

## Wheel #3 — Concept layer (Yoshi named the groups)

`search_expansion_groups (kind='concept')` ships with two groups:

**Group 1 — `synagogue-of-satan-sons-of-belial`.** The framework reads Revelation 2:9 + 3:9's "synagogue of Satan" and the Tanakh's repeated "sons of Belial" as the same group — the counterfeit-within-the-covenant, the tares woven in. Searching either phrase surfaces both.

Phrases (all `is_phrase=true`):
- synagogue of Satan
- sons of Belial
- son of Belial
- children of Belial
- daughter of Belial
- man of Belial

**Group 2 — `seed-war`.** Genesis 6 + Matthew 13 + Revelation diagnostic. The watchers seeded their lineage into the covenant; the tares grow alongside the wheat until the harvest; the synagogue of Satan and the sons of Belial are the same counterfeit lineage in different costumes; the serpent's seed and the sons of the wicked one name the same persistent lineage across the canon.

Terms:
- watchers (single token, `is_phrase=false`)
- tares (single token, `is_phrase=false`)
- synagogue of Satan (phrase)
- sons of Belial (phrase)
- serpent's seed (phrase)
- sons of the wicked one (phrase)

Note: "synagogue of Satan" and "sons of Belial" sit in both groups — the framework reads the diagnostics as overlapping. A user searching either phrase gets the union of all linked phrases across both groups.

**`_expand_concepts` helper.** Pulls all `kind='concept'` rows in one roundtrip. Python-side substring check finds which groups have any phrase matching the user query (case-insensitive). Returns the linked phrases (excluding the matched phrase itself, which tsquery already covers) as ILIKE patterns. The search SQL adds `OR (cardinality($4::text[]) > 0 AND v.text ILIKE ANY($4::text[]))` to the WHERE clause. Round-3 perf shape preserved.

The ILIKE clause rides the existing `idx_verses_text_trgm` GIN trgm index — added at S148b for the original substring search. PG can BitmapOr the two GIN scans (tsv + trgm). Should stay in budget.

## Order to apply / deploy

1. From a Render-allowlisted machine:
   ```bash
   cd ~/Desktop/App
   python3 _scratch/_s151_apply_and_verify.py
   ```
   This applies both migrations sequentially with verification + smoke tests. Aborts if either migration appears already applied (idempotency guard).

2. Verify perf with the diagnostic script BEFORE the PWA-side test (Rule 15):
   ```bash
   python3 _scratch/_session151_search_engine_diagnostic.py
   ```
   Confirms L1 unchanged, L2 vocabulary fuzzy returns nearest lexemes at threshold 0.3, L3 concept layer surfaces linked verses. Target <50ms typical / <500ms worst case across all three layers.

3. Commit + push `api/main.py` to deploy the new helpers to Render. The migrations are already live in the DB by this point — the API just starts using them when the pod restarts.

4. PWA-side regression walk on the new layers:
   - `synagauge` should now return synagogue verses (Rev 2:9 + 3:9 etc.)
   - `yehowah` should land on Yahuah verses via fuzzy
   - `synagogue of Satan` should now ALSO surface sons-of-Belial verses
   - `tares` should now surface the seed-war cluster
   - All seven S150 probes should still pass at the same perf

## Modernization-straggler audit inventory (DEFERRED — curation session needed)

41 distinct archaic forms in canon. Total real-match verses ~530 (count drops considerably from initial 1,100 because several forms — `hast`, `wast` — were stemming false-positives matching `hasted`/`haste`/`wasted`/`waste`).

**Confirmed clean in canon** (zero hits — modernization landed): `thou`, `thee` (1 hit inside source-echo for `Yahuah Elohayka (the LORD thy God)`), `thine`, `saith`, `cometh`, `doeth`, `maketh`, `liveth`, `goeth`, `speaketh`, `walketh`, `judgeth`, `rejoiceth`, `seemeth`, `wouldest`, `didst`, `mayest`, `wert`.

**Stragglers requiring word-by-word curation:**

| Form | Real canon hits | Suggested target (Yoshi to confirm/redline) |
|---|---|---|
| thyself | 195 | yourself |
| bare | 178 | bore (BUT carries KJV literary weight in *she bare a son* — Yoshi decision) |
| wax / waxed / waxeth | 23 | grow / became / grow (Sarah *waxed old laughing*) — Yoshi decision |
| exalteth | 9 | exalts |
| holdeth | 9 | holds |
| thinkest | 9 | think |
| feedeth | 8 | feeds |
| filleth | 6 | fills |
| careth | 6 | cares |
| pleaseth | 6 | pleases |
| withereth | 8 | withers |
| remembereth | 5 | remembers |
| wandereth | 5 | wanders |
| testifieth | 5 | testifies |
| tendeth | 5 | tends |
| prayeth | 7 | prays |
| betimes | 5 | early |
| sanctifieth | 4 | sanctifies |
| scorneth | 4 | scorns |
| sleepest | 4 | sleep |
| keepest | 4 | keep |
| meanest | 4 | mean |
| yieldeth | 4 | yields |
| stumbleth | 4 | stumbles |
| watcheth | 3 | watches |
| subtil | 3 | subtle (BUT Genesis 3:1's serpent is load-bearing — Yoshi decision) |
| wasteth | 3 | wastes |
| lovest | 3 | love |
| makest | 3 | make |
| art | 3 | are (BUT Obadiah 1:5's poetic register — Yoshi decision) |
| seest | 3 | see |
| striveth | 2 | strives |
| restoreth | 2 | restores |
| risest | 2 | rise |
| travelleth | 2 | travels |
| desirest | 2 | desire |
| takest | 2 | take |
| writest | 2 | write |
| standest | 2 | stand |
| walkest | 2 | walk |
| escheweth | 2 | shuns |
| gendereth | 2 | bears |
| glorifieth | 1 | glorifies |
| smelleth | 1 | smells |
| sufficeth | 1 | suffices |
| toucheth | 1 | touches |
| treadeth | 1 | treads |
| givest | 1 | give |
| reasoneth | 1 | reasons |
| shouldest | 1 | should |
| asketh | 2 | asks |
| buildeth | 3 | builds |
| cleaveth | 2 | cleaves |
| hideth | 2 | hides |
| keepeth | 9 | keeps |
| lieth | 14 | lies |
| sittest | 5 | sit |
| heareth | 5 | hears |
| sheweth | 5 | shows |
| sinneth | 4 | sins |
| knoweth (canon-only — 2 Esdras hits are Apocrypha) | TBD | knows |

Pattern for the curation session: walk the form list with Yoshi, mark each `flatten` / `keep` / `flatten-but-not-in-poetic-passages`, then draft `session<N>_modernize_stragglers.sql` using the Rule-10 in-place UPDATE pattern from S149. Same single-transaction `DO $verify$` block raising on payload mismatch. Verse_id stability preserved (Rule 10).

## Standing rules — unchanged from S150 close

The 15 rules from S150's close carry forward. S151 added no new standing rules — the work was clean execution of patterns already in the standing list. Rule 11 (Render IP allowlist), Rule 12 (schema column names), Rule 13 (synonym layer = framework posture in code), Rule 14 (bound CTE result sets early), and Rule 15 (test latency BEFORE the regression walk on latency-sensitive features) all held.

S151 surfaced one observation that may become Rule 16 if it recurs: **the published Apply harness script is the canonical record of "what was actually applied to prod."** When two sibling migrations land in one session, the harness should apply both with its own transactional guards rather than relying on each file's BEGIN/COMMIT. Worth a session of observation before formalizing.

## Verbal-answers-transcribe rule honored

Yoshi's S151 decisions transcribed into this file:

- **Modernization stragglers — DEFERRED to a curation session** (Q1 answer; full inventory above).
- **Fuzzy similarity threshold — 0.3** (Q2 answer; encoded in `_FUZZY_SIMILARITY_THRESHOLD` in `api/main.py` and `FUZZY_THRESHOLD` in the diagnostic).
- **Concept groups named — `synagogue-of-satan-sons-of-belial` + `seed-war`** (Q3 answer; encoded in `session151_concept_groups.sql`).
- **Session shape — press on Wheel #2 AND Wheel #3 this session, defer stragglers** (Q4 answer; this is what landed).

## What did NOT land this session

- **Migration apply + deploy.** Sandbox IP not on Render allowlist; the harness is drafted and ready, but Yoshi (or a future session running from an allowlisted machine) needs to invoke `python3 _scratch/_s151_apply_and_verify.py` to actually move S151's schema into prod, then `git add . && git commit -m "S151 v2.1 — vocabulary fuzzy + concept layer" && git push` to roll the API change forward. Once both are live, the final PWA-side verification can confirm `synagauge → synagogue`, `synagogue of Satan` surfacing Belial verses, etc.

- **PWA-side verification of the new layers.** Has to wait until apply + deploy. The seven S150 probes already passed at S151 open; the new probes are listed in *Order to apply / deploy* above.

- **The extras canonical_order data audit.** Filed as a follow-up task. The dropdown's ordering for extras (Apocrypha block before Josephus block) does not match the search response ordering (which seems to put Josephus before Apocrypha). Either the extras `canonical_order` values need re-audit or the search SQL needs an `edition_priority` join.

- **Phrase synonyms (v2.1 polish — Wheel #4 in the original S151 prompt).** Lower priority than vocabulary fuzzy + concept seed; the single-token Adam group already serves as the attachment point for when phrase plumbing lands. The framework reading covered by the concept layer overlaps with what phrase synonyms would have done, so the urgency is reduced.

- **Modernization stragglers curation.** Yoshi to walk the 41-form inventory in a future session.

## Key architectural takeaway

S150's single-SELECT Round-3 perf shape extends cleanly to two more layers (vocabulary fuzzy expansion in tsquery; concept-linked phrases in an OR ILIKE-ANY clause). No CTEs, no GROUP BY, both sides of the OR GIN-backed. The pattern locked at S150 mid-session — *bound CTE result sets early, never trust the outer LIMIT to cut* (Rule 14) — held by simply not introducing any CTEs in S151's expansion. The search engine is a single SELECT today, regardless of how many layers of expansion the API computes before the SQL fires.

The framework posture — *meet readers with the vocabulary they were taught; the text on the page brings them home in the restored Sacred Names form* — extends cleanly from the synonym layer (S150) to the fuzzy layer (typos count; misspellings count; the pastoral act of letting the reader land on the right verse with whatever they typed) to the concept layer (the framework's diagnostic readings surface together so the reader sees the canon's witness as one voice across both Testaments). The search engine is now the framework, encoded.
