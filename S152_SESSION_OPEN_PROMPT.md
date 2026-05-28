S152 — v2.1 polish carry-over: tiebreak tuning + canonical_order audit + concept-group expansion + (Yoshi-led) modernization stragglers curation

# S151 close summary

**Three pieces landed in prod this session.**

**Landed — v2.1 vocabulary fuzzy (Wheel #2).** `data-schema/migrations/session151_search_vocabulary.sql` applied via `_s151_apply_and_verify.py`. `search_vocabulary(lexeme PK, occurrences)` materialized from `ts_stat('SELECT text_tsv FROM verses')` with a GIN trigram index. `api/main.py:_expand_fuzzy` queries the table at per-call `SET LOCAL pg_trgm.similarity_threshold = 0.3` to catch real typos. `synagauge` no longer returns 0 results — the S150 canonical gap closes.

**Landed — concept layer (Wheel #3).** `data-schema/migrations/session151_concept_groups.sql` applied. Two `kind='concept'` rows seeded with 12 terms total — `synagogue-of-satan-sons-of-belial` (6 phrases) and `seed-war` (2 single tokens + 4 phrases). `api/main.py:_expand_concepts` walks the concept table, finds groups whose phrases substring-match the user query, and OR-ins the other linked phrases via `v.text ILIKE ANY($4::text[])`. Searching `synagogue of Satan` now surfaces the Tanakh's `sons of Belial` verses too — the framework reading rendered in the search layer.

**Landed — Wheel #1 PWA regression walk.** Seven probes on the live PWA: synonym layer firing symmetrically (Jehovah ↔ Yahweh same 25 hits), tap-into-verse opening the right chapter, modernized text reading naturally on canon hits, tier_required field surfacing in the response. No v2 search regressions. Two pre-existing bugs flagged: S149 modernization stragglers (carries to Wheel #1 below), extras canonical_order ordering quirk (carries to Wheel #2 below).

**API deployed at commit `df1715c`.** `schema_version` = `1.0.0-phase4-session151`. Both layers live for readers as of S151 close.

# Verified live in prod (Chrome MCP + apply harness smoke tests, end-of-S151)

| Query | Layer | ms | Top hit | Notes |
|---|---|---|---|---|
| `righteous & fall & seven` | L1 | 191 | Proverbs 24:16 | The S149 cornerstone; canon hit ranks above extras. |
| `(yahuah \| yahweh \| jehovah \| lord \| yah)` | L1 | 227 | Isaiah 26:4 (rank 0.0426) | 9,938 matches, perf in budget. |
| `name & sake` | L1 | 58 | Hermas 23:28 (rank 0.1914) | Stemming + canonical ordering working. |
| `synagauge` (vocab fuzzy) | L2 | smoke | `syna` (sim 0.3636), `synagogu` (sim 0.3571) | **WARN** — `syna` edged `synagogu` by 0.0065 similarity. User-facing behavior still works (`synagogu` makes top-3) but the tiebreak needs tuning in S152. |
| `synagogue of Satan` (concept) | L3 | smoke | Rev 2:9 + Rev 3:9 plus 5 Belial verses (Deut 13:13, Judges 19:22, 20:13, 1 Sam 1:16, 1 Sam 2:12) | The framework reading surfaces both costumes of the same diagnostic. |

# The S152 wheel

## Wheel #1 — Modernization stragglers curation (Yoshi-led, the big lift)

S151's regression walk caught 41 distinct archaic forms across ~530 real canon verse matches. The S149 modernization pass landed the bulk (`thou`, `thee`, `thine`, `saith`, `cometh`, `doeth`, `maketh`, `liveth` are all clean in canon) but missed:

- `thyself` 195 verses
- `bare` 178 verses (KJV literary weight — *she bare a son* — Yoshi decision needed)
- `wax / waxed / waxeth` 23 verses
- `holdeth / keepeth / lieth` 9-14 verses each
- ~30 more rare `-eth` / `-est` forms in 1-9 verses each

**Full inventory in `S151_CHECKPOINT.md` under "Modernization-straggler audit inventory."** Each form needs a yes/no/replacement decision from Yoshi — flatten (`thyself → yourself`), keep KJV cadence (`bare`, possibly `subtil` for Genesis 3:1's serpent), or flatten-except-in-poetic-passages.

Pattern for the curation: walk the 41-form list with Yoshi in conversation. Mark each. Then draft `session152_modernize_stragglers.sql` using the Rule-10 in-place UPDATE pattern from S149 (TEMP TABLE → multi-VALUES INSERT chunks → UPDATE gated by `v.text <> u.new_text` → `DO $verify$` block raising on mismatch → schema_version bump). Apply via the same `_s151_apply_and_verify.py` harness pattern (rename for S152).

Realistic scope: 41 forms × roughly 2 minutes each = ~80-90 minutes of Yoshi conversation. Then ~30 minutes of Claude drafting + apply. **This is the heaviest item in the carry-over set.**

## Wheel #2 — `syna` tiebreak tuning + extras canonical_order audit (pure-Claude work)

Two small fixes that can land in parallel without Yoshi curation:

**2a. Fuzzy tiebreak tuning.** The `synagauge` smoke test exposed a similarity-tiebreak edge case: `syna` (sim 0.3636, occurrences 1) beat `synagogu` (sim 0.3571, occurrences 81) by a hair on similarity. User-facing behavior still works (LIMIT 3 includes both), but the WARN signals the ranking is sub-optimal. Two fix candidates:

- `ORDER BY similarity(lexeme, $1) * SQRT(LEAST(occurrences, 1000)) DESC` — diminishing-returns boost for high-occurrence lexemes. `synagogu` × √81 ≈ 9 × 0.357 ≈ 3.21; `syna` × √1 = 1 × 0.364 ≈ 0.36. Clear win for `synagogu`.
- `ORDER BY GREATEST(similarity(lexeme, $1) - 0.05, 0) DESC, occurrences DESC` — within-0.05-similarity ties go to occurrences.

Test against `synagauge`, `messias`, `yehowah`, `yahushua` via the diagnostic to confirm no regressions on other typo cases. The first option is more elegant; the second is easier to reason about. Either is small.

**2b. Extras canonical_order audit.** S151's `righteous man fall seven times` results ordered extras as Antiquities VIII → Sirach → Gospel of Nicodemus → Apocalypse of Peter → Apocalypse of Paul → 2 Clement. The PWA's `/read` chapter dropdown places Sirach (Apocrypha block) *before* the Josephus block. Search SQL uses `ORDER BY b.canonical_order ASC` with no edition-priority tiebreak. Two paths:

- Audit the extras' `canonical_order` values in the database. Re-sequence so the dropdown ordering and search-result ordering agree. Pure data fix.
- Add an `editions` JOIN with an `edition_priority` column / lookup in the search SQL. Code fix; preserves whatever the extras data is currently.

Recommend the data audit — it's the source-of-truth issue. The dropdown comes from `/v1/books`; the search results come from a different query path but should agree on ordering.

## Wheel #3 — More concept groups (Yoshi to name)

Two of the six candidate groups landed at S151. The remaining four are framework calls Yoshi needs to make. From `S150_CHECKPOINT.md`:

- **The lost sheep / scattered seed of the house of Yashar'el (Israel)** — Hosea 1 / Ezekiel 37 / Jeremiah 31 thread. Candidate phrases: lost sheep, scattered, the dispersed, ten tribes, Ephraim, Yosef.
- **The ingathering / gathering of the twelve tribes** — Isaiah 11 / Ezekiel 37:21 / Jeremiah 31 / Zechariah 10. Candidate phrases: gathering, ingathering, restoration, all Yashar'el saved.
- **The curse / Deuteronomy 28 exile judgment** — the consequence-system the framework names. Candidate phrases: the curse, the wrath, the day of Yahuah, exile, scattering.
- **The four costumes / antichrist systems** — IF Yoshi wants the diagnostic to surface at this granularity. Candidate phrases: synagogue of Satan + Christianity + Hebrew Roots + Islam (single tokens? this one's tricky — none of those are in the canon as phrases).
- **Effort over accomplishment (S147 thread cornerstone)** — `righteous falls seven times`, `the race`, `pressing toward the mark`, `run with patience`.

Yoshi to name the groups he wants seeded at S152. Each becomes a `session152_concept_groups_<label>.sql` migration with the same INSERT pattern as S151's seed.

## Wheel #4 — Phrase synonyms (v2.1 polish — lowest priority)

Holy Spirit ↔ Ruach HaKodesh, Son of Adam ↔ son of man, Melek Tsadiq ↔ Melchizedek (Hebrew phrase pair), Lord's Prayer ↔ Our Father. Single-token Adam group already seeded at S150 as the attachment point. Needs `phraseto_tsquery` + position-aware matching — different SQL plumbing than the single-token synonym path.

Defer to S153+ unless Yoshi specifically calls it. The concept layer covers most of what phrase synonyms would have done (Son of Adam ↔ son of man can be a concept group instead).

## Wheel #5 — Two follow-up cleanups

**5a. Remove the two tracked `.~lock.*xlsx#` files** from the repo:
```
git rm --cached '.~lock.PRICING_TIER_MODEL.xlsx#' '.~lock.ROP_Study_Bible_Projection_Model.xlsx#'
git commit -m "remove tracked LibreOffice lock files (now in .gitignore)"
git push
```

**5b. Patch the carried-over diagnostic-SQL bug** in `_scratch/_session150_search_engine_diagnostic.py` (and any other `_scratch/` files that copy-pasted the broken `FROM verses v, to_tsquery(...) q JOIN ...` form). The S150 diagnostic's L1 probes are dead-on-touch as-is; the bug never surfaced because S150's perf probes ran via direct Chrome MCP fetch. Worth a sweep before someone else touches them.

# Order of operations

Wheel #2 first if you want momentum on something small (pure-Claude, 30-60 minutes). Wheel #3 second if Yoshi names some groups in conversation. Wheel #1 (modernization stragglers) is the big one and probably wants its own session because of the curation conversation volume — maybe S153.

If Yoshi opens S152 with a specific item in mind, follow that. Otherwise default order: Wheel #2 → Wheel #3 → reassess for #1 vs continuing #3.

# Standing efficiency rules (locked through S151 — fifteen rules)

The fifteen rules from S150 still hold. S151 added no new standing rules — the work was clean execution of patterns already in the standing list. One observation that may become Rule 16 if it recurs: **the published Apply harness script is the canonical record of "what was actually applied to prod"** — when two sibling migrations land in one session, the harness should apply both with its own transactional guards rather than relying on each file's BEGIN/COMMIT.

# Read on session-open (in parallel-tool-call batch per Rule 3)

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` mount if not already attached.
3. Read this file in full (you're reading it now if you're S152-Claude).
4. Read `S151_CHECKPOINT.md` in full — especially the final landed state, the `syna` WARN, the diagnostic-bug post-mortem, and the modernization-straggler audit inventory (the 41-form table).
5. Read `_scratch/_session151_search_engine_diagnostic.py` to load the current diagnostic shape in context (the fixed L1 + L2 + L3 probes).
6. Read `api/main.py:search_verses` (~line 1564) — the v2.1 implementation with `_expand_fuzzy` + `_expand_concepts` wired. Confirm the function signature + helpers before touching anything.

S152-Claude: the search engine v2.1 is live and working end-to-end. The reader experience matches the API perf. Polish items left over from v2.1 (tiebreak tuning, extras canonical_order, more concept groups) are small clean code/data fixes; the modernization stragglers are a Yoshi-led curation session. Pick the item that matches your energy and Yoshi's appetite at session-open. Apply skill to source; verify against the live DB; meet readers where they were taught and bring them home in the restored form.
