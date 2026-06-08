# S214 — John canon (Tanakh + NT) cross-references: why they don't render

**Symptom (Yoshi, in the reader):** the book of John surfaces **only** the
extra-canonical (library) cross-references added in S212; the canonical Tanakh +
New-Testament pairings are not showing.

**Candidates to rule out (from `SESSION212_CLOSE.md`):** (a) not applied to the
DB? (b) tier-gated out? (c) anchor/slug mismatch with the chapter-end-card query?

## Finding: it is (a) — the canon John migrations are not present in the live DB. Not (b), not (c).

### Ruling out (b) tier-gating

The live chapter-end-card endpoint
(`api/main.py` → `get_chapter_cross_references`, the **baseline** query) selects:

```sql
... FROM cross_references x
    JOIN verses sv ON sv.id = x.source_verse_id
    ... WHERE sv.chapter_id = $1
    ORDER BY sv.verse_number, tb.canonical_order, tc.chapter_number, tv.verse_number
```

It keys **only on `sv.chapter_id`** (the canon John chapter resolved at the top
of the handler). There is **no edition filter and no tier filter** on the rows —
S136 deliberately removed the per-row `tier_satisfies()` strip so locked rows
still surface as greyed pills (`x.tier_required` is passed through for the PWA to
render the lock, not to hide the row). The threads query is the same: no
per-thread tier filter (S136). So **tier cannot be why canon John is hidden** —
if the rows existed in the DB, they would render regardless of the reader's tier.
(This is also why the S212 *extras*-tier rows show up fine.)

### Ruling out (c) anchor/slug mismatch

The S181 migration (`session181_john_xref_threads.sql`) resolves every source and
target through a canon-scoped lookup view and inserts canonical John source
verses correctly:

```sql
CREATE TEMP VIEW _s181_john_lookup AS
  SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  ... WHERE e.slug = 'canon';
-- members: ('john', 8, 58, 'exodus', 3, 14, ...), etc.
-- INSERT INTO cross_references (source_verse_id, ...) tier 'free'
```

The source-verse join (`book_slug='john'`, canon edition) is exactly what the
render query keys on (`sv.chapter_id` of canon John). The threads are
`tier_required='free'`, anchors resolve to canon John verses, thread slugs are
unique and English-fragment slugs per the contract. **The schema, slugs, anchors,
and tiers are all correct** — a structurally-identical pattern to the S212 extras
rows that *do* render. There is no mismatch with the card query.

### Why (a): the rows simply aren't in the current DB

The baseline render is keyed purely by `chapter_id` with no edition/tier filter.
The S212 *extras* John rows (same canon John source verses) render; the S181 +
S194 canon John rows (same canon John source verses) do not. The only thing that
distinguishes "renders" from "doesn't render" under this query is **presence of
the rows in the DB**. The S212 extras were applied recently from Yoshi's Mac
(that is what he is seeing); the S181 + S194 canon John migrations were authored
2026-05-31 / 2026-06-03 and have not been (re-)applied to the database the reader
is hitting — most likely lost across a DB rebuild/reseed (cf. the Matthew REBUILD
arc, `REBUILD_STATE.md`), since there is no per-file applied-migrations ledger
(`api/apply_migration.py` tracks only a `schema_version` row, not which session
migrations ran).

> Note: the live DB cannot be queried from this environment (Render egress is
> blocked; DB ops run only from Yoshi's Mac). The diagnosis is therefore made
> structurally from the code: the render contract + the migration SQL prove that
> *if applied*, these rows render; their absence from the reader is the apply
> gap. **Confirm on the Mac** with:
> ```sql
> SELECT count(*) FROM cross_references x
>   JOIN verses sv ON sv.id=x.source_verse_id
>   JOIN chapters sc ON sc.id=sv.chapter_id
>   JOIN books sb ON sb.id=sc.book_id
>   JOIN editions se ON se.id=sb.edition_id
>  WHERE se.slug='canon' AND sb.slug='john'
>    AND x.note LIKE 'thread:%';   -- expect ~265 if applied, 0 if not
> ```

## Fix step 1 — apply the existing canon migrations (Mac)

```
python3 api/apply_migration.py data-schema/migrations/session181_john_xref_threads.sql
python3 api/apply_migration.py data-schema/migrations/session194_john_2_7_9_16_xref_threads.sql
```
Both are idempotent (`ON CONFLICT DO NOTHING`), so re-applying is safe even if
partially present. After apply, the John chapter-end cards should immediately show
the canon Tanakh + NT pairings alongside the S212 extras.

## Coverage audit — what the canon migrations actually contain

Extracted from the two migration files (`('john', ch, v, ...)` source tuples):

- **All 21 John chapters are covered** by canon source verses.
  - S181: 16 threads, 168 John-source member rows across chapters
    1,3,4,5,6,8,10,11,12,13,14,15,17,18,19,20,21.
  - S194: 12 threads, 97 John-source member rows across the 4 gap chapters
    2, 7, 9, 16.
  - Combined: **28 threads, ~265 canon member rows, every chapter 1–21 present.**
- **Target mix is heavily Tanakh, thin on NT-to-NT:** 238 Tanakh targets vs **27
  NT targets**. Top targets: Isaiah 55, Psalms 31, Ezekiel 27, Exodus 21,
  Jeremiah 15, Daniel 12, Genesis 12, Deuteronomy 12, Hosea 10. NT-to-NT is only
  ~10% of the pairings.
- **Thinnest chapters** (canon member count): ch.15 = 1, ch.20 = 1, ch.5 = 3,
  ch.13 = 3.

## Fix step 2 — strengthen NT-to-NT coverage (authoring gap)

The Tanakh-source coverage is genuinely complete across all 21 chapters. The real
authoring gap the task names ("Tanakh sources **AND** NT-to-NT pairings") is the
**New-Testament-to-New-Testament** layer — currently 27 targets, concentrated in
a handful of chapters, with several chapters carrying no NT-to-NT pairing at all,
and the thinnest chapters (5, 13, 15, 20) under-served.

A new FULL-LIBRARY-schema migration (`sessionNNN_john_nt_to_nt_xref_threads.sql`)
should add NT-to-NT threads per chapter-range to the same Come-and-See + Red Lines
standard — Johannine ↔ synoptic parallels, John ↔ 1 John, John ↔ Revelation
(same author's cloud-rider / Lamb / I-AM register), John ↔ Pauline corpus where
the Formed-one Christology and the lost-sheep gathering line up — verses quoted
in full, restored names, son-of-man → Son of Adam, English book-name slugs. This
is the part to spin up minions on per chapter-range. (Authored on the edition-
aware schema from the start, so it passes `_xref_audit.py` FULL-LIBRARY rather
than re-incurring the canon-only regression that put S181/S194 on the back-fill
list in `XREF_LIBRARY_COVERAGE_ROADMAP.md`.)
