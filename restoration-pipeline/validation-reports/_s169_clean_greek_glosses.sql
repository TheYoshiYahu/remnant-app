-- S169 — §28 column-stack gloss cleanup for Greek strong_entries.
--
-- Strips the ":--" / ":--+" marker prefix, cuts at the first
-- parenthetical clarifier, trims trailing punctuation, and caps at
-- 40 chars so the §28 column-stack gloss cell renders tight.
--
-- Hebrew untouched — Hebrew kjv_defs ship in "1) first, beginning,
-- best, chief" format from S120's OSIS parser, already compact.
--
-- Idempotent + single-transaction. Re-applying produces no further
-- changes.

BEGIN;

-- Preview: 10 rows before/after the cleanup, sampled from the rows
-- the UPDATE will touch (greek entries with the ":--" marker).
\echo
\echo === PREVIEW (10 before/after samples) ===
SELECT
  strong_number,
  LEFT(short_definition, 80)                                     AS before,
  LEFT(
    TRIM(BOTH ' ,.;' FROM
      REGEXP_REPLACE(
        REGEXP_REPLACE(short_definition, '^:--\s*\+?\s*', ''),
        '\s*\(.*$', ''
      )
    ),
    40
  )                                                              AS after_clean
FROM strong_entries
WHERE language = 'greek'
  AND short_definition LIKE ':--%'
ORDER BY strong_number
LIMIT 10;

\echo
\echo === APPLY ===
UPDATE strong_entries
SET short_definition = LEFT(
    TRIM(BOTH ' ,.;' FROM
      REGEXP_REPLACE(
        REGEXP_REPLACE(short_definition, '^:--\s*\+?\s*', ''),
        '\s*\(.*$', ''
      )
    ),
    40
)
WHERE language = 'greek'
  AND short_definition IS NOT NULL;

\echo
\echo === POST-APPLY STATS ===
SELECT
  COUNT(*)                                                      AS total_greek,
  COUNT(*) FILTER (WHERE short_definition LIKE ':--%')           AS still_has_marker,
  COUNT(*) FILTER (WHERE short_definition LIKE '%(%')            AS still_has_paren,
  ROUND(AVG(LENGTH(short_definition)), 1)                        AS avg_gloss_len,
  MAX(LENGTH(short_definition))                                  AS max_gloss_len
FROM strong_entries
WHERE language = 'greek'
  AND short_definition IS NOT NULL;

COMMIT;
