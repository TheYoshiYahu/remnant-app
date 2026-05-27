# S150 Checkpoint — Canon Modernization Live + Search Engine v2 Landed

## Status at session close

**Part A — Canon Modernization: APPLIED TO PROD.** Verified non-destructive (cross_references, cross_reference_thread_members, commentary_entries, concept_verse_index, verses_canon, Prov 24:16 source xrefs all delta=+0).

**Part B — Profound Search Engine v2: MIGRATION APPLIED + API REWRITTEN. DEPLOY DEFERRED to next git push.**

**Concept layer: DEFERRED to S151+** (Yoshi's mid-session call — *we can add concept thinking later, lets wrap up what we were already doing*). The `search_expansion_groups` table reserves `kind='concept'` so the layer can be added without further migration.

## Live state of prod

`schema_version` after this session:

| Stage | Version |
|---|---|
| S149 close | `1.0.0-phase4-session149` (Part A) |
| S150 close | `1.0.0-phase4-session150` (Part B migration) |

## Files written this session

| Path | Purpose |
|---|---|
| `_scratch/_s150_apply_and_verify.py` | Part A apply harness (Render handshake retries + TCP/IP-allowlist diagnostic + pre/post snapshot + diff). Reusable for any future in-place verse-text migration. |
| `_scratch/_session150_search_synonyms.md` | Design record for Part B — three search layers, unified storage schema, 15 synonym groups + 63 variants, concept-group proposal (deferred). |
| `data-schema/migrations/session150_search_engine_v2.sql` | Part B migration: `verses.text_tsv` generated column + GIN index + `search_expansion_groups` + `search_expansion_terms` + seeded synonym data + schema_version bump. |
| `_scratch/_s150b_apply_and_verify.py` | Part B apply harness. Idempotency-guarded (aborts if text_tsv already exists). |
| `_scratch/_session150_search_engine_diagnostic.py` | EXPLAIN ANALYZE probe suite for L1 (tsquery + stemming + synonym) and L2 (pg_trgm fuzzy) layers. Run after Part B apply. |
| `api/main.py` (edit) | `search_verses` rewritten to v2 — three-layer query expansion. Response shape unchanged so PWA doesn't change. |

## Voice-gate findings this session

### Yoshi's expansion of the synonym pastoral framing

Mid-session — *some people will search yahweh and jahova and all varients of false names, so they should actually be listed as synanyms though it feels wrong as hell, but so they can be found some people even say shalum instead of shalom*.

The framework's posture — *they were handed this; the deception is not their fault* — applies to discovery, not just to body text. Search-layer inclusion of false-name variants (Jehovah, Yahweh, Yeshua, Jesus) and phonetic typos (shalum, synagauge) lets readers land on the right verses with the vocabulary they were taught. **The text on the page stays restored per the Sacred Names Convention** — Yahuah, Yahusha, Yashar'el, etc. — but the discovery path meets them where they were taught.

Encoded in `search_expansion_groups` (kind='synonym') with 15 groups, 63 variants. The .md design record carries the full list with notes.

### Sacred-name Convention adherence

Display-layer is untouched. The pipeline-restored canon text continues to render in the Sacred Names form. Search-layer expansion is a query-time discovery affordance that does NOT modify what the reader sees rendered. Pastoral framing intact: meet readers where they are; bring them home.

## Carry-over to S151

### Wheel #1 — Deploy the API rewrite (FIRST THING NEXT SESSION)

The migration landed, but `api/main.py` is uncommitted on disk. To activate v2 search on the live PWA:

```bash
cd ~/Desktop/App
git status                                       # confirm api/main.py is dirty
git add -A ':!.~lock*' \
    S150_CHECKPOINT.md \
    _scratch/_s150_apply_and_verify.py \
    _scratch/_s150b_apply_and_verify.py \
    _scratch/_session150_search_synonyms.md \
    _scratch/_session150_search_engine_diagnostic.py \
    data-schema/migrations/session150_search_engine_v2.sql \
    api/main.py
git commit -F - <<'MSG'
S150 — Search engine v2 (synonym + fuzzy layers) + canon modernization live

Part A (canon modernization in-place UPDATE) landed in prod —
schema_version 1.0.0-phase4-session149 — verified non-destructive
(cross_references / cross_reference_thread_members / commentary_entries /
concept_verse_index / Prov-24:16 source xrefs all delta=+0).

Part B (search engine v2) -
* verses.text_tsv GENERATED ALWAYS AS to_tsvector('english', text) STORED
  populates for all 51,965+ verses; GIN-indexed at idx_verses_text_tsv.
* search_expansion_groups + search_expansion_terms (kind='synonym' /
  kind='concept' discriminator). 15 synonym groups seeded covering
  restored sacred names + covenant people-names + righteousness +
  shalom + Torah + Sabbath + Melchizedek + Adam (63 variants).
* api/main.py search_verses rewritten - 3-layer query expansion:
  L1 synonym (token-level OR-expansion via search_expansion_terms),
  L2 fuzzy (pg_trgm word_similarity for typos like 'synagauge'),
  L3 concept (deferred to S151+, schema reserves kind='concept').
  Response shape preserved so PWA needs no change.

Pastoral framing in the synonym layer (Yoshi, mid-S150):  meet readers
with the vocabulary they were taught (Jehovah, Yahweh, Yeshua,
phonetic misspellings); the text on the page stays restored per the
Sacred Names Convention. The discovery path brings them home.

schema_version 1.0.0-phase4-session150.
MSG
git push
```

Render rebuilds the API automatically on push. Once the new pod is healthy (~2-3 min), v2 search is live.

### Wheel #2 — Run the diagnostic against live prod

```bash
cd ~/Desktop/App
python3 _scratch/_session150_search_engine_diagnostic.py
```

Probes L1 (synonym + stemming via tsquery) and L2 (pg_trgm fuzzy via word_similarity). Target <50ms typical, <500ms worst case. If anything is over budget, EXPLAIN ANALYZE the slow probe and adjust the SQL strategy.

### Wheel #3 — Chrome MCP regression walk against the live PWA

Once the new API pod is live (Render's deploy progress in the dashboard), walk through these searches on https://bible.remnantofpromise.org:

1. **`righteous man fall seven times`** — should return Proverbs 24:16 as the top hit; should also pick up the four NT echoes (Habakkuk 2:4, Romans 1:17, Galatians 3:11, Hebrews 10:38) via stemming + tsaddiq synonym group.
2. **`Jehovah`** — should return all 6,800+ canon verses containing Yahuah, ranked by ts_rank.
3. **`Yahweh`** — same result set as Jehovah (synonym group fires).
4. **`shalum`** — should find shalom verses via the synonym group OR the pg_trgm fuzzy path.
5. **`synagauge of satan`** — fuzzy should land on Revelation 2:9 + 3:9. **Note**: it will NOT yet link to sons-of-Belial passages because the concept layer is S151+.
6. **`Yeshua`** — should return all canon Yahusha verses via Group 2.
7. **`name's sake`** — should return the gathering-callback passages (Psalm 23, Isaiah 48, Ezekiel 20, John 14, etc.) via English stemming.

Eyeball that the modernized text reads naturally in each result card.

### Wheel #4 — Concept layer for S151

Yoshi has the floor on what concept groups to seed. The deferred seed phrase (synagogue of Satan ↔ sons of Belial) is the starter. The .md design record carries the full proposal — open for redline.

When S151 picks up the concept work, the migration template is:

```sql
WITH g AS (
    INSERT INTO search_expansion_groups (kind, label, notes)
    VALUES ('concept', '<slug>', '<framework explanation>')
    RETURNING id
)
INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, t.term, true   -- is_phrase = TRUE for concept layer
  FROM g, (VALUES
    ('synagogue of Satan'),
    ('sons of Belial'),
    ('son of Belial'),
    ...
  ) AS t(term);
```

The API change needed for the concept layer (small additive edit to `search_verses`):

```python
# Add after the synonym expansion block in search_verses:
# Layer 3 — concept phrase matching.
concept_rows = await conn.fetch(
    """
    SELECT DISTINCT et2.term AS phrase
      FROM search_expansion_terms et1
      JOIN search_expansion_groups g ON g.id = et1.group_id
      JOIN search_expansion_terms et2 ON et2.group_id = g.id
     WHERE g.kind = 'concept'
       AND LOWER($1) LIKE '%' || LOWER(et1.term) || '%'
       AND et2.term <> et1.term
    """,
    q,
)
# UNION-in verses matching any of the concept phrases.
```

Out of S150 scope; carried as-is.

## Standing rules surfaced this session

The S150 wheel added these calibrations to the standing list:

* **Rule 11 — Render's IP allowlist is the first thing to check on any external Postgres connection failure.** When `ConnectionDoesNotExistError: connection was closed in the middle of operation` appears, run the TCP probe first. If raw TCP succeeds but SSL retries all fail, the Postgres-side filter is blocking the source IP — fix via Render dashboard → remnant-app-db → Access Control before exhausting other diagnostics.

* **Rule 12 — Schema column names verified BEFORE the migration ships.** Caught this session at `verses.edition_id` not existing (the chain is verses → chapters → books → editions). Rule 9 is now Rule 9 + 12: read the actual `data-schema/schema.sql` for every column the migration or follow-up scripts touch.

* **Rule 13 — Synonym layer is the framework posture in code.** False-name variants (Jehovah, Yahweh, etc.) and phonetic typos (shalum, synagauge) belong in the search-time discovery layer even when the framework's body-text rendering excludes them. Meet readers with the vocabulary they were taught; the text on the page brings them home in the restored form. Locked at S150 with Yoshi's mid-session call.

These belong at the top of the S151 session-open prompt.

## What did NOT land this session

* **Concept layer (deferred to S151+).** Schema reserves `kind='concept'`; no data populated.
* **Deploy of the v2 search API.** `api/main.py` is on disk; not committed; not pushed; Render still running the v1 search code. Wheel #1 above closes this in the first few minutes of S151.
* **Chrome MCP regression walk.** Pending the API deploy above.
* **Phrase synonyms** (Holy Spirit ↔ Ruach HaKodesh, Son of Adam ↔ son of man). Deferred to v2.1 — token-level synonyms covered the cornerstone use case; phrase synonyms need different plumbing (phraseto_tsquery + position handling). Single-token Adam group seeded as a placeholder so phrase variants attach to it later.

## Key architectural takeaway

The same `verses.id` survived the canon modernization. Every cross_reference, every commentary_entry, every chapter-end thread member, every concept_verse_index row that referenced a canon verse before S149 still references the correct (now-modernized) text. Rule 10 (in-place UPDATE for verse-text changes) held under the heaviest test it'll ever face: 13,238 verse UPDATEs touching 42.6% of canon, all under one transaction with the verification block raising on mismatch. The pattern is locked for any future verse-text edit — modernization, restoration, typo fix, anything.

The S149/S150 wheel is the proof. Future verse-text edits follow the same template:

```
data-schema/migrations/session<N>_modernize_canon.sql is the template.
1. CREATE TEMP TABLE _sN_updates ...
2. Multi-VALUES INSERT in chunks of 1000 (dollar-quoted text payload).
3. UPDATE through editions+books+chapters JOIN, gated by v.text <> u.new_text.
4. DO $verify$ block raising on payload/matched mismatch.
5. UPDATE schema_version.
6. DROP TEMP TABLE; COMMIT.
```

That's the standing pattern.
