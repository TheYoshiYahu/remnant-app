-- S152 Wheel #2b — re-sequence two extras editions into their
-- witness_category blocks so the search-result ordering matches the
-- PWA's /read book picker.
--
-- Background. The /read picker (app/src/App.tsx:933) groups books by
-- witness_category in the order they first appear when the books list
-- is sorted by canonical_order ASC. Two editions have canonical_order
-- ranges that land OUTSIDE their witness_category block, which makes
-- the search-result ordering (a flat ORDER BY canonical_order ASC in
-- api/main.py:search_verses) disagree with the picker's grouped view:
--
--   * apocrypha-charles-vol1  (witness_category='apocrypha')
--     currently at canonical_order 550..564 — sits AFTER josephus
--     (400..429), so Sirach from this edition surfaces in search
--     results AFTER Antiquities, even though the picker shows it
--     adjacent to KJV-1611 apocrypha (200..213).
--
--   * pseudepigrapha (Charles vol 2; witness_category='pseudepigrapha')
--     currently at canonical_order 500..505 — sits AFTER josephus
--     (400..429), splitting the pseudepigrapha block (enoch / jubilees
--     / jasher / ascension-isaiah / adam-eve-conflict /
--     apocalypse-of-abraham at 300..350).
--
-- This migration moves both editions into contiguous in-block ranges
-- (Rule-10 in-place UPDATE — no book rows deleted or re-inserted, only
-- the canonical_order integer changes):
--
--   apocrypha-charles-vol1:  551..?   ->  221..?    (delta = -330)
--   pseudepigrapha (vol 2):  501..?   ->  361..?    (delta = -140)
--
-- (Note on the +1: seed.py:557 enumerates books with start=1, so an
-- edition with sort_offset N has its first book at canonical_order N+1,
-- second at N+2, etc. The S151 diagnostic output confirmed live ranges
-- starting at 551 and 501 respectively. Range upper bounds depend on
-- the actual book count in the live DB — block-contiguity invariant
-- below catches any residual split regardless.)
--
-- After the move, each witness_category occupies a contiguous range
-- (book counts shown are the seed.py-documented intent — the live DB
-- has whatever's actually been seeded, which may be smaller):
--   canon              1..66
--   apocrypha          201..235     (KJV 1611: 201..214, Charles vol 1: 221..235)
--   pseudepigrapha     301..375     (enoch..apoc-abraham: 301..352, Charles vol 2: 361..375)
--   historical_witness 401..430     (josephus)
--   apocryphal_gospels 601..611     (mrjames)
--   apostolic_fathers  651..667     (lightfoot)
--   disputed_witness   701          (sonnini)
--
-- Yoshi decision (S152): approved the minimal-fix re-sequencing.
-- Audit + rationale: _scratch/_session152_canonical_order_audit.md.

BEGIN;

-- apocrypha-charles-vol1: 550..564  ->  220..234   (delta = -330)
UPDATE books
   SET canonical_order = canonical_order - 330
 WHERE edition_id = (SELECT id FROM editions WHERE slug = 'apocrypha-charles-vol1');

-- pseudepigrapha (Charles vol 2): 500..505  ->  360..365   (delta = -140)
UPDATE books
   SET canonical_order = canonical_order - 140
 WHERE edition_id = (SELECT id FROM editions WHERE slug = 'pseudepigrapha');

DO $verify$
DECLARE
  v_avc_count INT;
  v_avc_min   INT;
  v_avc_max   INT;
  v_pse_count INT;
  v_pse_min   INT;
  v_pse_max   INT;
BEGIN
  -- apocrypha-charles-vol1 should now sit entirely in 221..280. Lower
  -- bound is sort_offset+1 (seed.py:557 enumerates books with start=1).
  -- Upper bound is loose to accommodate any book-count the live DB has
  -- now or any future re-seed expansion within the apocrypha block (the
  -- next block, pseudepigrapha, starts at 301 pre-move and 301 post-move
  -- as well). The block-contiguity invariant below catches any actual
  -- block split regardless of count.
  SELECT count(*), min(canonical_order), max(canonical_order)
    INTO v_avc_count, v_avc_min, v_avc_max
    FROM books b
    JOIN editions e ON e.id = b.edition_id
   WHERE e.slug = 'apocrypha-charles-vol1';
  IF v_avc_count = 0 THEN
    RAISE EXCEPTION 'apocrypha-charles-vol1 has zero books (edition missing or not seeded?)';
  END IF;
  IF v_avc_min < 221 OR v_avc_max > 280 THEN
    RAISE EXCEPTION 'apocrypha-charles-vol1 canonical_order out of expected 221-280 range (count=%, min=%, max=%)',
      v_avc_count, v_avc_min, v_avc_max;
  END IF;

  -- pseudepigrapha (Charles vol 2) should now sit entirely in 361..399.
  -- Lower bound is sort_offset+1 (start=1 enumeration). Upper bound 399
  -- caps before josephus (401..) so the verify still catches a runaway
  -- delta without blocking legitimate future re-seed expansion.
  SELECT count(*), min(canonical_order), max(canonical_order)
    INTO v_pse_count, v_pse_min, v_pse_max
    FROM books b
    JOIN editions e ON e.id = b.edition_id
   WHERE e.slug = 'pseudepigrapha';
  IF v_pse_count = 0 THEN
    RAISE EXCEPTION 'pseudepigrapha (Charles vol 2) has zero books (edition missing or not seeded?)';
  END IF;
  IF v_pse_min < 361 OR v_pse_max > 399 THEN
    RAISE EXCEPTION 'pseudepigrapha (Charles vol 2) canonical_order out of expected 361-399 range (count=%, min=%, max=%)',
      v_pse_count, v_pse_min, v_pse_max;
  END IF;

  -- Block-contiguity invariant: every witness_category should now
  -- occupy a contiguous canonical_order range. Detect any remaining
  -- out-of-block rows (a row whose witness_category was seen earlier
  -- but a different witness_category appeared in between).
  PERFORM 1
    FROM (
      SELECT witness_category::text AS wc,
             canonical_order,
             LAG(witness_category::text) OVER (ORDER BY canonical_order, id) AS prev_wc,
             MIN(canonical_order) OVER (PARTITION BY witness_category::text) AS first_co
        FROM books
    ) t
   WHERE canonical_order > first_co
     AND prev_wc IS DISTINCT FROM wc;
  IF FOUND THEN
    RAISE EXCEPTION 'canonical_order block-contiguity invariant violated post-migration; some witness_category still split';
  END IF;
END;
$verify$;

-- Bump schema_version. Sibling to the S151 vocab + concept migrations;
-- this is a pure data fix (no DDL), but it's the first prod change to
-- land in S152 so it owns the schema-version bump.
UPDATE schema_version
   SET version    = '1.0.0-phase4-session152',
       landed_at  = now(),
       notes      = 'Wheel #2b — re-sequence apocrypha-charles-vol1 (550..564 -> 220..234) and pseudepigrapha Charles vol 2 (500..505 -> 360..365) so each witness_category occupies a contiguous canonical_order block. Fixes the dropdown-vs-search ordering disagreement S151 caught on `righteous man fall seven times` (Sirach was sorting after Antiquities because Charles vol 1 apocrypha sat outside its block). Pure data fix — no DDL, no schema changes; only the canonical_order integer on the two affected editions changes. Sibling pure-Claude work this session: Wheel #2a tiebreak tuning in api/main.py:_expand_fuzzy (no schema impact). Audit + rationale: _scratch/_session152_canonical_order_audit.md.'
 WHERE id = 1;

COMMIT;
