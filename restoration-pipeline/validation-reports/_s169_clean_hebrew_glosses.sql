-- S169 — §28 column-stack gloss cleanup for Hebrew + Aramaic strong_entries.
--
-- Extends the Greek cleanup (_s169_clean_greek_glosses.sql) to the OT
-- side per Yoshi live-walk redline 6. Hebrew glosses ship in
-- ``1) first, beginning, best, chief`` format from S120's OSIS parser —
-- already much cleaner than Greek's ``:--`` blocks — but a few entries
-- run long. H0853 ``אֵת`` (object marker) is 118 chars, makes a 4-line
-- tall column-stack on Genesis 1:1.
--
-- Hebrew-specific rules (different from Greek):
--   - NO ``:--`` strip — Hebrew doesn't carry the marker
--   - NO ``(`` cut — Hebrew uses ``(plural)`` / ``(Qal)`` style
--     annotations that ARE informative; cutting at first paren would
--     destroy them
--   - DO cap at 40 chars
--   - DO back off to last comma boundary inside the cap window so the
--     truncation lands on a clean phrase boundary (no mid-word cuts)
--   - DO strip trailing whitespace + ``,.;`` punctuation
--
-- Idempotent + single-transaction. Re-applying produces no further
-- changes (rows already ≤40 chars are filtered out by the WHERE
-- clause, and the back-off-to-comma is stable).

-- Disable psql's pager so the PREVIEW SELECT doesn't block on `(END)`
-- and the UPDATE + POST-APPLY STATS flow through in one pass.
\pset pager off

BEGIN;

\echo
\echo === PREVIEW (10 before/after samples — Hebrew/Aramaic only, rows > 40 chars) ===
SELECT
  strong_number,
  LEFT(short_definition, 80)                                     AS before,
  TRIM(BOTH ' ,.;' FROM
    CASE
      WHEN POSITION(',' IN LEFT(short_definition, 40)) > 0 THEN
        -- Back off to the position of the LAST comma inside the first
        -- 40 chars. ``STRPOS(REVERSE(...), ',')`` gives the offset of
        -- the last comma counted from the end; converting to a from-
        -- start position is ``40 - STRPOS(REVERSE(LEFT(s, 40)), ',')``.
        LEFT(
          short_definition,
          40 - STRPOS(REVERSE(LEFT(short_definition, 40)), ',')
        )
      ELSE
        LEFT(short_definition, 40)
    END
  )                                                              AS after_clean
FROM strong_entries
WHERE language IN ('hebrew', 'aramaic')
  AND short_definition IS NOT NULL
  AND LENGTH(short_definition) > 40
ORDER BY LENGTH(short_definition) DESC
LIMIT 10;

\echo
\echo === APPLY ===
UPDATE strong_entries
SET short_definition = TRIM(BOTH ' ,.;' FROM
    CASE
      WHEN POSITION(',' IN LEFT(short_definition, 40)) > 0 THEN
        LEFT(
          short_definition,
          40 - STRPOS(REVERSE(LEFT(short_definition, 40)), ',')
        )
      ELSE
        LEFT(short_definition, 40)
    END
)
WHERE language IN ('hebrew', 'aramaic')
  AND short_definition IS NOT NULL
  AND LENGTH(short_definition) > 40;

\echo
\echo === POST-APPLY STATS ===
SELECT
  language,
  COUNT(*)                                                       AS total_rows,
  COUNT(*) FILTER (WHERE LENGTH(short_definition) > 40)          AS still_over_40,
  ROUND(AVG(LENGTH(short_definition)), 1)                        AS avg_gloss_len,
  MAX(LENGTH(short_definition))                                  AS max_gloss_len
FROM strong_entries
WHERE language IN ('hebrew', 'aramaic')
  AND short_definition IS NOT NULL
GROUP BY language
ORDER BY language;

COMMIT;
