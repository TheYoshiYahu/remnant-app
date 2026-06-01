-- S187 patch — Luke 21:20 → Zechariah 14:2 (the load-bearing day-of-Yahuah attach)
-- =====================================================================
-- Yoshi caught the gap at S187 close: the S185 cross-reference build
-- threaded Zech 14:4 at NEW 34 (Luke 24:51 Mount of Olives return) and
-- Zech 12:3 at NEW 27 (Luke 21:24 trodden-down), but missed the load-
-- bearing direct match — Zech 14:1-2's *day of Yahuah cometh... I will
-- gather all nations against Yerushalayim to battle; and the city shall
-- be taken* against Luke 21:20's *when ye shall see Yerushalayim
-- compassed with armies, then know that the desolation thereof is nigh.*
-- The framework reads 70 AD as the first witness; the eschatological
-- day-of-Yahuah as the full witness; the same gathered-against pattern
-- across both fulfillments.
--
-- This patch:
--   1. Extends NEW 27 (`times-of-the-gentiles-and-the-nations-as-
--      territorial-occupier-of-yerushalayim`) anchor to span Luke
--      21:20-24 (the full Yerushalayim-desolation paragraph) so the
--      thread surfaces when reading any verse in that range.
--   2. Adds Luke 21:20 → Zechariah 14:2 as a new member-row carrying
--      the day-of-Yahuah framework reading.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING; the UPDATE
-- is safe to re-run.
--
-- Run: psql -P pager=off "$DATABASE_URL" -f _scratch/_session187_patch_luke_21_20_zechariah_14.sql
-- =====================================================================

\echo 'S187 patch: Luke 21:20 → Zechariah 14:2 (day-of-Yahuah Yerushalayim siege)...'
BEGIN;

-- Resolve the two verse IDs once.
CREATE TEMP TABLE _patch_ids AS
SELECT
  (SELECT v.id FROM verses v
     JOIN chapters c ON c.id = v.chapter_id
     JOIN books b    ON b.id = c.book_id
     JOIN editions e ON e.id = b.edition_id
    WHERE e.slug = 'canon' AND b.slug = 'luke'
      AND c.chapter_number = 21 AND v.verse_number = 20) AS luke_21_20_id,
  (SELECT v.id FROM verses v
     JOIN chapters c ON c.id = v.chapter_id
     JOIN books b    ON b.id = c.book_id
     JOIN editions e ON e.id = b.edition_id
    WHERE e.slug = 'canon' AND b.slug = 'zechariah'
      AND c.chapter_number = 14 AND v.verse_number = 2) AS zech_14_2_id,
  (SELECT id FROM cross_reference_threads
    WHERE slug = 'times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim') AS thread_id;

-- Sanity-check we resolved every ID.
DO $$
DECLARE
  l_id INTEGER;
  z_id INTEGER;
  t_id INTEGER;
BEGIN
  SELECT luke_21_20_id, zech_14_2_id, thread_id INTO l_id, z_id, t_id FROM _patch_ids;
  IF l_id IS NULL THEN RAISE EXCEPTION 'Luke 21:20 verse_id did not resolve'; END IF;
  IF z_id IS NULL THEN RAISE EXCEPTION 'Zechariah 14:2 verse_id did not resolve'; END IF;
  IF t_id IS NULL THEN RAISE EXCEPTION 'NEW 27 times-of-the-gentiles thread_id did not resolve'; END IF;
END $$;

-- 1. Extend anchor of NEW 27 to span Luke 21:20-24 (was Luke 21:24-24).
UPDATE cross_reference_threads
   SET anchor_verse_id_start = (SELECT luke_21_20_id FROM _patch_ids)
 WHERE slug = 'times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim'
   AND anchor_verse_id_start <> (SELECT luke_21_20_id FROM _patch_ids);

-- 2. Insert the cross_references row.
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT
  (SELECT luke_21_20_id FROM _patch_ids),
  (SELECT zech_14_2_id FROM _patch_ids),
  'manual',
  E'thread:times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim | Zekharyah (Zechariah) 14:1-2 — *Behold, the day of Yahuah (the LORD) cometh, and thy spoil shall be divided in the midst of thee. For I will gather all nations against Yerushalayim (Jerusalem) to battle; and the city shall be taken, and the houses rifled, and the women ravished; and half of the city shall go forth into captivity, and the residue of the people shall not be cut off from the city* — names the day-of-Yahuah Yerushalayim-siege substance Luke 21:20''s *And when ye shall see Yerushalayim (Jerusalem) compassed with armies, then know that the desolation thereof is nigh* opens. The framework reads 70 AD as the first witness; the eschatological day-of-Yahuah of Zekharyah 14 as the full witness; the same gathered-against-Yerushalayim pattern Lukan-proximate and Zekharyah-eschatological at once. Zekharyah 14 carries forward into 14:3-5''s *Then shall Yahuah go forth, and fight against those nations... his feet shall stand in that day upon the Mount of Olives* (the Lukan ascension return-locus at Luke 24:51 / NEW 34) — one prophetic day-of-Yahuah architecture spanning siege, vindication, and Yahuah''s feet on the mountain.',
  'free'::content_tier
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3. Link the cross_references row to NEW 27 as a thread member.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT
  p.thread_id,
  x.id,
  COALESCE((SELECT MAX(sort_order) FROM cross_reference_thread_members WHERE thread_id = p.thread_id), 0) + 1,
  E'Zekharyah (Zechariah) 14:1-2 — *Behold, the day of Yahuah (the LORD) cometh, and thy spoil shall be divided in the midst of thee. For I will gather all nations against Yerushalayim (Jerusalem) to battle; and the city shall be taken, and the houses rifled, and the women ravished; and half of the city shall go forth into captivity, and the residue of the people shall not be cut off from the city* — names the day-of-Yahuah Yerushalayim-siege substance Luke 21:20''s *And when ye shall see Yerushalayim (Jerusalem) compassed with armies, then know that the desolation thereof is nigh* opens. The framework reads 70 AD as the first witness; the eschatological day-of-Yahuah of Zekharyah 14 as the full witness; the same gathered-against-Yerushalayim pattern Lukan-proximate and Zekharyah-eschatological at once. Zekharyah 14 carries forward into 14:3-5''s *Then shall Yahuah go forth, and fight against those nations... his feet shall stand in that day upon the Mount of Olives* (the Lukan ascension return-locus at Luke 24:51 / NEW 34) — one prophetic day-of-Yahuah architecture spanning siege, vindication, and Yahuah''s feet on the mountain.'
  FROM _patch_ids p
  JOIN cross_references x
    ON x.source_verse_id = p.luke_21_20_id
   AND x.target_verse_id = p.zech_14_2_id
   AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Report state.
\echo ''
\echo 'NEW 27 anchor (expect Luke 21:20):'
SELECT
  b.slug AS book,
  c.chapter_number,
  v.verse_number
  FROM cross_reference_threads t
  JOIN verses v   ON v.id = t.anchor_verse_id_start
  JOIN chapters c ON c.id = v.chapter_id
  JOIN books b    ON b.id = c.book_id
 WHERE t.slug = 'times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim';

\echo ''
\echo 'Luke 21:20 → Zechariah 14:2 member-row (expect 1):'
SELECT count(*) AS new_member_row
  FROM cross_reference_thread_members m
  JOIN cross_references x ON x.id = m.cross_reference_id
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'luke' AND sc.chapter_number = 21 AND sv.verse_number = 20
   AND tb.slug = 'zechariah' AND tc.chapter_number = 14 AND tv.verse_number = 2
   AND m.thread_id = (SELECT id FROM cross_reference_threads
                       WHERE slug = 'times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim');

DROP TABLE _patch_ids;
COMMIT;

\echo ''
\echo 'S187 Luke 21:20 → Zechariah 14:2 patch applied.'
