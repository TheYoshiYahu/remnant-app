-- =====================================================================
-- Session 226 — Revelation FRAMEWORK REFINEMENT (S224/S225 follow-up)
-- =====================================================================
-- Yoshi's settled Revelation framework, applied to the one place the live
-- apparatus still drifted toward the inherited reading: the great white throne
-- of Revelation 20.
--
-- THE DRIFT (by silence): the session224 white-throne thread described the
-- throne faithfully through Daniel 2 / Psalm 102 / Isaiah 51, but said nothing
-- of the cyclical frame — and so left standing the inherited Christian habit of
-- reading Revelation 11, 19, 20, 21 as beads on a string: a literal thousand-
-- year box, then a SEPARATE, sequential great-white-throne judgment laid after
-- it, then a fourth event. Yoshi's framework rejects exactly this. Revelation is
-- cyclical, not linear. There is ONE judgment of the souls of the dead. The seal
-- of chapter 11 (the seventh trumpet's "the time of the dead, that they should
-- be judged," 11:18) and the throne of chapter 20 are NOT two reckonings — they
-- are the same reckoning shown twice, two panels of one judgment, so that no eye
-- misses it. And the "thousand years" is the appointed reign under symbolic
-- measure, true but not a stopwatch counted off on a chart.
--
-- THE CORRECTION: (1) UPDATE the live white-throne thread summary to carry the
-- cyclical frame — naming the throne as the same judgment the seventh trumpet
-- already sounded (11:18), setting down the literal-millennium-box / linear-chain
-- habit, while preserving every Tanakh witness already in the thread. (2) add a
-- cross_reference Rev 20:11 -> Rev 11:18 binding the two panels in the data, and
-- (3) link it into the white-throne thread as a member, so the reader can see the
-- one judgment shown from two faces. This completes the loop S225 began on the
-- chapter-11 side (where 11:18 was tied forward to the throne of 20:11-12); this
-- file ties the chapter-20 side back to 11:18.
--
-- Idempotent: ON CONFLICT DO NOTHING for inserts; the UPDATE is by slug. The
-- session224 migration text is left as the historical record; this file is the
-- authoritative correction, exactly as session225 corrected the chapter-11 frame.
-- The source fragment scratch_xref_revelation/minion_revelation_20.sql is edited
-- to match (for the verify_fidelity / offline_resolve gates).
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session226_revelation_framework_refinement.sql
-- =====================================================================

\echo 'session226 — Revelation framework refinement (white-throne cyclical frame) starting...'
BEGIN;

CREATE TEMP VIEW _s226_rev_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon');

-- ----- (1) new cross_reference: Rev 20:11 (the great white throne) -> Rev 11:18 (the seventh trumpet's judgment of the dead) — the two panels of the one judgment -----
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon', 'revelation', 20, 11, 'canon', 'revelation', 11, 18, 'free', E'*And the nations were angry, and thy wrath is come, and the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets, and to the saints, and them that fear thy name, small and great; and shouldest destroy them which destroy the earth* (Revelation 11:18). The seventh trumpet already sounded the judgment of the dead — the very reckoning the great white throne now shows: *from whose face the earth and the heaven fled away* (Revelation 20:11), and the dead judged out of the books. The trumpet of chapter eleven and the throne of chapter twenty are not two judgments laid end to end but one judgment shown from two faces — two panels of the one reckoning of the souls of the dead, that no eye should miss it. The Revelation tells the one end cyclically, the same close shown and shown again, not a chain of separate sequential events.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s226_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s226_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- (2) UPDATE the white-throne thread summary — the cyclical frame, two panels one judgment -----
UPDATE cross_reference_threads SET
  summary_md = E'*And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11). The fleeing of earth and heaven re-speaks three Tanakh witnesses at once. When Daniel''s great image was struck, the kingdoms of man were carried away *that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35) — the same *no place was found for them* the seer says of the old earth and heaven, while the stone-kingdom remains. The psalm sets the perishing of the heavens against the enduring of the One who sits: *all of them shall wax old like a garment; as a vesture shalt thou change them, and they shall be changed* (Psalm 102:26), for *thou art the same, and thy years shall have no end* (Psalm 102:27). And Isaiah saw the same: *the heavens shall vanish away like smoke, and the earth shall wax old like a garment... but my salvation shall be for ever* (Isaiah 51:6). The garment-heavens pass and the aging earth flees; what abides before the great white throne is *him that sat on it* and his everlasting salvation. And this throne is no fresh and separate reckoning laid in sequence after a thousand-year box counted off on a chart; it is the same judgment the seventh trumpet already sounded — *the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets, and to the saints... and shouldest destroy them which destroy the earth* (Revelation 11:18). Two panels, one judgment: the trumpet of chapter eleven names it, the throne of chapter twenty shows it again with the Judge in the foreground, that no eye should miss it. The Revelation does not run as a chain of separate end-events strung one after another, nor is its thousand years a stopwatch ticked off on a chart; it tells the one end from many faces, the appointed reign under symbolic measure, the same close shown and shown again until the destination is named. The earth and heaven flee; the One on the throne endures, and the dead stand before him — the one judgment of the souls of the dead toward which the whole book has been moving.'
 WHERE slug = 'revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2';

-- ----- (3) link the new Rev 11:18 cross_reference into the white-throne thread (sort_order 4) -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 11:18 — *the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets, and to the saints* the seventh trumpet already named the judgment of the dead; the great white throne is that same judgment shown again — two panels of one reckoning, the Revelation telling the one end cyclically, not a separate sequential event (Revelation 20:11).'
  FROM cross_reference_threads t, cross_references x, _s226_rev_lookup sv, _s226_rev_lookup tv
 WHERE t.slug='revelation-20-the-great-white-throne-the-earth-and-heaven-fled-away-daniel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=20 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'session226 — Revelation framework refinement complete.'
