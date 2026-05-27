# S149 Checkpoint — Canon Modernization Overhaul (Part A landed offline)

## Status at session close

**Part A — Canon Modernization: COMPLETE OFFLINE. LIVE APPLY DEFERRED.**
**Part B — Profound Search Engine: CARRIED TO S150.**

The work product is on disk and voice-gated. Live application of the
SQL migration is intentionally deferred to your review pass before
ship — given the scope (13,238 verse UPDATEs on the prod DB) and the
S147b lesson, I did NOT run apply_migration.py this session.

## Files written this session

| Path | Purpose |
|---|---|
| `restoration-pipeline/_session149_modernize_canon.py` | The modernizer (27 self-tests passing). |
| `source-texts/parsed/canon.modernized.json` | Modernized canon (13,238 verses changed, 42.6%). |
| `_scratch/_session149_canon_changes.json` | Per-verse change records (5.5 MB). |
| `data-schema/migrations/session149_modernize_canon.sql` | The migration (2.31 MB, single transaction). |

## Voice-gate findings caught + fixed mid-session

1. **Matt 6:9 Lord's Prayer** — modernizing "Our Father which art in
   heaven" to "which are in heaven" is grammatically broken modern
   English. The Lord's Prayer at Matt 6:9 + Luke 11:2 is now preserved
   as a learned KJV phrase. The surrounding clause still modernizes
   normally (`pray ye` → `pray you`, `thy name` → `your name`).
2. **Reversed-order constructions** — `Where art thou?` → `Where art
   you?` (broken) was caught and patched to `Where are you?` across
   93 + 48 = 141 verses (lowercase + capital). Final standalone-art
   count outside source-echo parens (excluding Lord's Prayer): **0**.

## Tsaddiq parallel restorations applied (Hebrew tsaddiq → righteous)

* Genesis 6:9    — Noah was a righteous man
* **Proverbs 24:16 (the S149 cornerstone)** — *for a righteous man
  falls seven times, and rises up again*
* Habakkuk 2:4   — the righteous shall live by his faith
* Romans 1:17    — The righteous shall live by faith
* Galatians 3:11 — The righteous shall live by faith
* Hebrews 10:38  — Now the righteous shall live by faith

## Sacred-name source-echo protection — verified clean

Every Hebrew-head + parenthetical pair (`Yahuah Rapha (the LORD that
healeth thee)`, `Yahuah Elohayka (the LORD thy God)`, etc.) is
pre-stashed before pattern application and emerges unchanged. The
303 `thy` residuals in modernized canon are ALL inside protected
parens (zero false negatives on parenthetical protection).

## Final residual scan

* `thou`, `thee` (outside parens), `thine`, `ye`, `hath`, `saith`,
  `hast`, `art` (outside parens, non-Lord's-Prayer): **all at 0**.
* `-eth` verbs: ~1,180 occurrences remaining (long-tail uncommon
  archaic verbs like `languisheth`, plus proper nouns Beth/Heth/
  Mephibosheth/Nazareth/Japheth/twentieth/teeth — proper nouns are
  ~387 of the residual, true archaic ~3% of canon).
* `-est` verbs: ~364 occurrences remaining (long-tail; ~75% are modern
  English homonyms like priest/rest/lest/harvest/forest/west/best).

The residual is mostly the long-tail of rare archaic verbs each
occurring 1-9 times. Extending the explicit pattern list further
would close the gap; the marginal reader-experience cost is small.
Available for a future polish pass.

## Live apply (when ready)

The git index lock is stuck — you'll need to clear it first:

```bash
cd ~/Desktop/App
# kill any zombie git process, then:
rm -f .git/index.lock
git add -A ':!.~lock*' S149_CHECKPOINT.md S149_SESSION_OPEN_PROMPT.md \
    restoration-pipeline/_session149_modernize_canon.py \
    source-texts/parsed/canon.modernized.json \
    _scratch/_session149_canon_changes.json \
    _scratch/_session149_modernization_diff.txt \
    data-schema/migrations/session149_modernize_canon.sql
git commit -F - <<'MSG'
S149 Part A — Canon modernization overhaul (script + canon.modernized.json + migration; live apply deferred)

Modernizes the 1611/1769 KJV English skin on canon edition's verses.text. Touches 13,238 verses (~42.6% of canon's 31,102). Restoration changes only verses.text; verses.id preserved across the in-place UPDATE so every cross_references / cross_reference_thread_members / commentary_entries / concept_verse_index / study_notes / bookmarks / verse_highlights / reading_positions row referencing the modernized verses survives FK-intact.

Scope (voice-gated, 27 self-tests pass):
* -eth verb endings (~330 explicit forms) -> modern -s
* thou/thee/thy/thine -> you/you/your/yours
* ye -> you
* hast/wast/wert/dost/didst/shalt/shouldst etc. -> modern
* mine X (attributive) -> my X
* art -> are outside source-echo parens, EXCEPT the Lord's Prayer

Tsaddiq parallel restorations at Genesis 6:9, Proverbs 24:16 (S149 cornerstone — righteous man falls seven times and rises up again), Habakkuk 2:4, Romans 1:17, Galatians 3:11, Hebrews 10:38.

Sacred-name source-echo parentheticals protected. Lord's Prayer at Matt 6:9 + Luke 11:2 preserves 'which art in heaven' verbatim. Reversed-order 'art thou' constructions caught + patched (Where art thou -> Where are you).

Live apply DEFERRED to S150 voice-gate review. Migration is idempotent (WHERE v.text <> u.new_text). Part B (profound legitimate search engine — tsvector + synonyms) carries to S150.
MSG
git push
```

Then apply the migration to prod:

```bash
cd ~/Desktop/App/api
DATABASE_URL='...your-Render-DSN...' python3 apply_migration.py \
    ../data-schema/migrations/session149_modernize_canon.sql
```

The migration has a verification block (`DO $verify$ ... $verify$`)
that raises if the matched-row count doesn't equal the payload-row
count (13,238). It also bumps `schema_version` to
`1.0.0-phase4-session149`.

## After live apply — cross-reference survival verification (next session opens here)

The whole reason for in-place UPDATE rather than seed.py `--seed-only`
(which DELETEs books cascade-then-INSERTs, losing every cross-reference,
every commentary entry, every chapter-end thread member, every
concept_verse_index row) is preserving verse_ids. After the migration
lands, spot-check:

```sql
-- Cross-references still linked to the modernized canon verses
SELECT count(*) FROM cross_references x
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id AND sb.slug = 'proverbs'
WHERE sc.chapter_number = 24 AND sv.verse_number = 16;
-- Expect: the Proverbs-24:16 effort-over-accomplishment thread members
-- (S147 landed 48 canon pairs)

-- Chapter-end thread members survive
SELECT count(*) FROM cross_reference_thread_members;
-- Expect: same count as pre-migration (~60+ from S147 + 5 v1 threads)

-- Commentary entries survive
SELECT count(*) FROM commentary_entries;
```

If counts match pre-migration, the in-place UPDATE preserved
everything. If they don't, something cascaded that shouldn't have.

## Carry-over to S150 — Part B (profound legitimate search engine)

Per the S149 prompt's contingency: *"If S149 fills with Part A and the
modernization pass is clean, Part B carries to S150."* That's what's
happened. Part B's wheel:

1. `data-schema/migrations/session150_search_engine_v2.sql` —
   `text_tsv tsvector GENERATED ALWAYS AS (to_tsvector('english', text))
   STORED` + GIN index. Schema column names verified against
   `data-schema/schema.sql` BEFORE the migration ships (Rule 9).
2. Synonym dictionary + TS configuration — `just↔righteous`,
   `LORD↔Yahuah↔Yah`, `God↔Elohim`, `Christ↔Messiah↔Yahusha`, restored-
   name family. Voice-gate against the Sacred Names Convention.
3. `api/main.py:search_verses` — rewrite to `text_tsv @@ to_tsquery(
   <synonym-config>, $1)` with `ts_rank(...)` ordering + canonical
   ordering tiebreak. Keep `similarity(v.text, $1)` in SELECT for the
   PWA (no client-side change).
4. `_scratch/_session150_search_engine_diagnostic.py` — EXPLAIN ANALYZE
   probes for `righteous man fall seven times` (should hit Prov 24:16
   via stemming + synonym), `name's sake`, `Yahuah`, `the gathering`.
   Target <50ms typical, <500ms worst case.
5. Chrome MCP regression walk against the PWA.

Part A's modernization makes Part B's English-stemmer happier:
post-modernization `falls/falling/fell` all stem to `fall`. Pre-
modernization `falleth` did not stem.

## Standing rules surfaced this session

The S149 wheel surfaced one calibration that's locked for S150+:

* **Rule 10 — Seed.py is destructive for content edits.** Don't reach
  for `seed.py --seed-only` to apply verse-text changes to prod. It
  DELETEs books CASCADE-then-INSERTs, which loses every
  cross_reference / commentary_entry / chapter-end thread member /
  concept_verse_index row that depends on verse_ids. For verse-text
  changes (modernization, restoration, typo fixes), use an in-place
  UPDATE migration keyed by the natural key (edition_slug, book_slug,
  chapter_number, verse_number) → verses.id. The migration template
  is now `data-schema/migrations/session149_modernize_canon.sql` —
  CREATE TEMP TABLE, multi-VALUES INSERT in chunks of 1000 with
  dollar-quoted text payloads, single UPDATE through editions+books+
  chapters JOIN, DO-block verification, schema_version stamp, DROP
  TABLE, COMMIT.

This belongs in the standing-rules list at the top of the next
session-open prompt.
