-- =====================================================================
-- Session 427 migration — three edits in one:
--   1. 1 John 3:4  — restore "for sin is the transgression of the law"
--   2. Psalm 81:3  — "dark new moon" rendering
--   3. Hebrews 12:26 -> Haggai 2:7 — add the missing cross-reference
--      into the existing "yet once more I shake" thread (a user catch).
-- Canon edition. Idempotent + self-verifying; transactional (all-or-nothing).
--
-- Run:  python3 api/apply_migration.py data-schema/migrations/session427_1john_psalm81_haggai_xref.sql
-- =====================================================================

BEGIN;

-- ---------- 1) 1 John 3:4 ------------------------------------------------
UPDATE verses v
   SET text = 'Everyone who goes on sinning is living in lawlessness; for sin is the transgression of the law.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 3
   AND c.book_id = b.id    AND b.slug = '1-john'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 4
   AND v.text IS DISTINCT FROM 'Everyone who goes on sinning is living in lawlessness; for sin is the transgression of the law.';

-- ---------- 2) Psalm 81:3 ------------------------------------------------
UPDATE verses v
   SET text = 'Blow the trumpet at the dark new moon, in the time appointed, on our solemn feast day.'
  FROM chapters c, books b, editions e
 WHERE v.chapter_id = c.id AND c.chapter_number = 81
   AND c.book_id = b.id    AND b.slug = 'psalms'
   AND b.edition_id = e.id AND e.slug = 'canon'
   AND v.verse_number = 3
   AND v.text IS DISTINCT FROM 'Blow the trumpet at the dark new moon, in the time appointed, on our solemn feast day.';

-- ---------- 3) Hebrews 12:26 -> Haggai 2:7 cross-reference ----------------
CREATE TEMP VIEW _s427_lu AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- the cross_references row (source label 'manual', tier 'free')
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual',
  E'*And I will shake all nations, and the desire of all nations shall come: and I will fill this house with glory, saith Yahuah Tseva''ot (LORD of hosts).* (Haggai 2:7). Hebrews cites the shaking of Haggai 2:6, but the word runs on into verse 7: the same shaking that removes the heavens and the earth reaches *all nations,* and out of it *the desire of all nations shall come* and the house is filled with glory. This is why *Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26) ends not in ruin but in *a kingdom which cannot be moved* (Hebrews 12:28) — the shakable removed, the desire of the nations come, the house filled with His glory.',
  'free'::content_tier
  FROM _s427_lu sv, _s427_lu tv
 WHERE sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.book_slug='haggai'  AND tv.chapter_number=2  AND tv.verse_number=7
   AND sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- reorder: push Deuteronomy 4:24 (Heb 12:29) to sort_order 3 so Haggai 2:7 can sit at 2
UPDATE cross_reference_thread_members m
   SET sort_order = 3
  FROM cross_reference_threads t, cross_references x, _s427_lu sv, _s427_lu tv
 WHERE m.thread_id = t.id AND m.cross_reference_id = x.id
   AND t.slug = 'hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2'
   AND sv.book_slug='hebrews'     AND sv.chapter_number=12 AND sv.verse_number=29
   AND tv.book_slug='deuteronomy' AND tv.chapter_number=4  AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
   AND m.sort_order <> 3;

-- add Haggai 2:7 as thread member at sort_order 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2,
  E'Haggai 2:7 — *And I will shake all nations, and the desire of all nations shall come: and I will fill this house with glory, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:7). The shaking does not stop at heaven and earth; the LORD shakes *all nations,* and out of that shaking *the desire of all nations shall come* and the house is filled with glory. The removing of what can be shaken (Hebrews 12:27) clears the way for the kingdom which cannot be moved (Hebrews 12:28).'
  FROM cross_reference_threads t, cross_references x, _s427_lu sv, _s427_lu tv
 WHERE t.slug = 'hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2'
   AND sv.book_slug='hebrews' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.book_slug='haggai'  AND tv.chapter_number=2  AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------- verify all three ---------------------------------------------
DO $verify$
DECLARE t TEXT; cnt INT;
BEGIN
  -- 1 John 3:4
  SELECT v.text INTO t FROM verses v
    JOIN chapters c ON c.id=v.chapter_id AND c.chapter_number=3
    JOIN books b ON b.id=c.book_id AND b.slug='1-john'
    JOIN editions e ON e.id=b.edition_id AND e.slug='canon'
   WHERE v.verse_number=4;
  IF t IS DISTINCT FROM 'Everyone who goes on sinning is living in lawlessness; for sin is the transgression of the law.' THEN
    RAISE EXCEPTION '1 John 3:4 not corrected: %', t;
  END IF;
  RAISE NOTICE '1 John 3:4 OK';

  -- Psalm 81:3
  SELECT v.text INTO t FROM verses v
    JOIN chapters c ON c.id=v.chapter_id AND c.chapter_number=81
    JOIN books b ON b.id=c.book_id AND b.slug='psalms'
    JOIN editions e ON e.id=b.edition_id AND e.slug='canon'
   WHERE v.verse_number=3;
  IF t IS DISTINCT FROM 'Blow the trumpet at the dark new moon, in the time appointed, on our solemn feast day.' THEN
    RAISE EXCEPTION 'Psalm 81:3 not corrected: %', t;
  END IF;
  RAISE NOTICE 'Psalm 81:3 OK';

  -- Haggai 2:7 cross-reference present in the thread
  SELECT count(*) INTO cnt
    FROM cross_reference_thread_members m
    JOIN cross_reference_threads t ON t.id=m.thread_id
     AND t.slug='hebrews-12-yet-once-more-i-shake-and-our-elohim-a-consuming-fire-haggai-2'
    JOIN cross_references x ON x.id=m.cross_reference_id
    JOIN verses tv ON tv.id=x.target_verse_id
    JOIN chapters tc ON tc.id=tv.chapter_id AND tc.chapter_number=2
    JOIN books tb ON tb.id=tc.book_id AND tb.slug='haggai'
   WHERE tv.verse_number=7;
  IF cnt < 1 THEN
    RAISE EXCEPTION 'Haggai 2:7 cross-reference member missing';
  END IF;
  RAISE NOTICE 'Haggai 2:7 cross-reference OK';
END $verify$;

COMMIT;
