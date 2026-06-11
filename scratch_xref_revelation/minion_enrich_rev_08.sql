-- S227 enrichment — Revelation 8: seventh seal, silence, trumpets, censer, plagues
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: silence-in-heaven — add extra-canonical silence (2 Esdras 7:30, the old silence)
  ('canon','revelation',8,1,'apocrypha','2-esdras',7,30,'extras', E'*And the world shall be turned into the old silence seven days, like as in the former judgments: so that no man shall remain.* (2 Esdras 7:30). The seventh seal opens on *silence in heaven about the space of half an hour* (Revelation 8:1), and the restored library knew this silence as the hush at the turning of the ages — *the world shall be turned into the old silence... like as in the former judgments.* Esdras sets the silence at the very hinge of judgment and resurrection; the half-hour of Revelation is that same primeval stillness, the world returned to silence before the trumpets and the day of Yahuah (LORD) begin.'),

  -- thread: hail-and-fire-mingled-with-blood — add prophetic roots beyond Exodus (Ezekiel 38:22, Joel 2:30)
  ('canon','revelation',8,7,'canon','ezekiel',38,22,'free', E'*I will rain upon him, and upon his bands, and upon the many people that are with him, an overflowing rain, and great hailstones, fire, and brimstone.* (Ezekiel 38:22). The first trumpet brings *hail and fire mingled with blood* (Revelation 8:7), and Ezekiel had foretold this very mingling over Gog''s hordes — *great hailstones, fire, and brimstone.* The day-of-Yahuah storm the prophet rained upon the enemy of his people is the trumpet''s storm upon the earth; the hail and fire of the seal are the prophet''s own arsenal of judgment.'),
  ('canon','revelation',8,7,'canon','joel',2,30,'free', E'*And I will shew wonders in the heavens and in the earth, blood, and fire, and pillars of smoke.* (Joel 2:30). *Hail and fire mingled with blood* fall at the first trumpet (Revelation 8:7), and Joel had named the triad of the day of Yahuah (LORD) — *blood, and fire, and pillars of smoke.* The wonders Joel said would come before the great and terrible day are the trumpet''s signs: blood and fire poured out upon the earth as the day breaks.'),

  -- thread: the-star-wormwood — add Lamentations 3:19 (the wormwood and the gall)
  ('canon','revelation',8,11,'canon','lamentations',3,19,'free', E'*Remembering mine affliction and my misery, the wormwood and the gall.* (Lamentations 3:19). The third trumpet names the star *Wormwood* and turns the waters bitter (Revelation 8:11). The lament binds *the wormwood and the gall* together as the very taste of judgment and affliction — the same bitter pair Jeremiah pronounced over the people. The waters made wormwood are the cup of affliction the prophet remembered, the bitterness of the day of Yahuah (LORD) poured into the rivers of the earth.'),

  -- thread: sun-moon-stars-third-darkened — add Amos 8:9 (sun down at noon) and Joel 2:31 (moon to blood)
  ('canon','revelation',8,12,'canon','amos',8,9,'free', E'*I will cause the sun to go down at noon, and I will darken the earth in the clear day:* (Amos 8:9). The fourth trumpet darkens *the third part of the sun... so as... the day shone not for a third part of it* (Revelation 8:12). Amos had named the sign of the day of Yahuah (LORD) — *the sun to go down at noon... darken the earth in the clear day.* The day failing at its height is the prophet''s portent, the light withdrawn in the very hour it should shine, now smitten at the trumpet.'),
  ('canon','revelation',8,12,'canon','joel',2,31,'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). The fourth trumpet smites *the third part of the moon* with the sun and stars (Revelation 8:12), and Joel had set the darkened sun and the moon turned to blood as the sign *before the great and the terrible day of Yahuah (LORD).* The lights failing at the trumpet are Joel''s day-of-Yahuah signs; the eagle''s threefold *Woe* (8:13) follows because the day the prophet announced is breaking upon the inhabiters of the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- silence-in-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 7:30 — *the world shall be turned into the old silence seven days, like as in the former judgments* the restored library''s silence at the hinge of judgment, the half-hour hush of the seventh seal (Revelation 8:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-silence-in-heaven-before-yahuah-habakkuk-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- hail-and-fire-mingled-with-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 38:22 — *great hailstones, fire, and brimstone* the prophet''s day-of-Yahuah storm over Gog, the hail and fire mingled with blood of the first trumpet (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:30 — *I will shew wonders in the heavens and in the earth, blood, and fire, and pillars of smoke* Joel''s day-of-Yahuah triad, the blood and fire of the first trumpet (Revelation 8:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-hail-and-fire-mingled-with-blood-the-seventh-plague-exodus-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-star-wormwood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Lamentations 3:19 — *the wormwood and the gall* the lament binds wormwood and gall as the taste of judgment, the bitter waters of the third trumpet (Revelation 8:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-the-star-wormwood-and-the-bitter-waters-jeremiah-9-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- sun-moon-stars-third-darkened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Amos 8:9 — *I will cause the sun to go down at noon, and I will darken the earth in the clear day* the day failing at its height, the sun smitten at the fourth trumpet (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Joel 2:31 — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD)* Joel''s day-of-Yahuah signs, the lights smitten at the fourth trumpet (Revelation 8:12).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-8-the-sun-moon-and-stars-a-third-darkened-exodus-10-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
