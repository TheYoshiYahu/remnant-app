-- S227 enrichment — Revelation 10: the mighty angel and the little scroll
-- ADD-only: new cross_references + new thread members on the existing live ch10 threads
-- (built in session224). References the shared view _s227_rev_lookup. No rewrites.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the mighty angel clothed with a cloud, rainbow, pillars of fire (free, P=daniel/ezekiel)
  ('canon','revelation',10,1,'canon','daniel',10,5,'free', E'*Then I lifted up mine eyes, and looked, and behold a certain man clothed in linen, whose loins were girded with fine gold of Uphaz* (Daniel 10:5). The mighty angel whose *face was as it were the sun, and his feet as pillars of fire* (Revelation 10:1) is the man Daniel saw by the great river — *a certain man clothed in linen,* girded with fine gold. John sees the same shining figure that came to Daniel; the latter-day messenger wears the one unbroken glory.'),
  ('canon','revelation',10,3,'canon','ezekiel',43,2,'free', E'*and, behold, the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters: and the earth shined with his glory* (Ezekiel 43:2). The angel *cried with a loud voice* (Revelation 10:3), and the glory that returns to the temple in Ezekiel cries with *a voice... like a noise of many waters.* The mighty angel''s loud cry is the voice of the returning glory the prophet heard — the same throne-glory bending down upon the sea and the earth.'),
  -- thread: the cry as a lion roaring and the seven thunders sealed up (free, P=amos/daniel)
  ('canon','revelation',10,3,'canon','psalms',29,3,'free', E'*The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters* (Psalm 29:3). The seven thunders that *uttered their voices* (Revelation 10:3) are the thunder of Yahuah (LORD) the psalm names — *the Elohim (God) of glory thundereth.* The loud cry and the rolling thunders are the voice of Yahuah (LORD) upon the waters, the very utterance the psalmist sang seven times over his deep.'),
  -- thread: the angel's oath by him that liveth for ever (free, P=daniel)
  ('canon','revelation',10,5,'canon','genesis',14,22,'free', E'*And Abram said to the king of Sodom, I have lift up mine hand unto Yahuah (LORD), the El Elyon (most high God), the possessor of heaven and earth* (Genesis 14:22). The angel *lifted up his hand to heaven, and sware by him that liveth for ever and ever, who created heaven... and the earth... and the sea* (Revelation 10:5-6). Abram swore the oldest such oath, hand lifted to *the possessor of heaven and earth* — the very Maker by whom the angel now swears. The raised hand unto the Creator of heaven and earth is the patriarch''s oath-gesture, taken up at the consummation.'),
  -- thread: take it, and eat it up — sweet as honey, bitter in the belly (extras) — add fiery-cup + Ezekiel 3:2
  ('canon','revelation',10,9,'apocrypha','2-esdras',14,38,'extras', E'*And the next day, behold, a voice called me, saying, Esdras, open your mouth, and drink that I give you to drink* (2 Esdras 14:38). The angel says, *Take it, and eat it up* (Revelation 10:9); the restored library tells the same charge given to Esdras — *open your mouth, and drink that I give you.* Whether the word is eaten as a scroll or drunk as a cup, the prophet must first take it into himself, mouth opened to receive what he will then speak.'),
  ('canon','revelation',10,10,'apocrypha','2-esdras',14,39,'extras', E'*Then opened I my mouth, and, behold, he reached me a full cup, which was full as it were with water, but the colour of it was like fire* (2 Esdras 14:39). John *took the little book... and ate it up* (Revelation 10:10); Esdras took *a full cup... the colour of it was like fire.* The fiery draught and the eaten scroll are one figure — the word of Yahuah (LORD) received into the very body of the prophet, fire to take in, that he may be filled and made able to speak.'),
  ('canon','revelation',10,10,'canon','ezekiel',3,2,'free', E'*So I opened my mouth, and he caused me to eat that roll* (Ezekiel 3:2). *And I took the little book out of the angel''s hand, and ate it up* (Revelation 10:10). Ezekiel''s very act is John''s — *I opened my mouth, and he caused me to eat that roll.* The eating of the scroll is the receiving of the word that becomes the prophet''s own, the same commission re-enacted upon the sea and the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== thread members =====
-- members: revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1 (existing 1..4)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 10:5 — *a certain man clothed in linen, whose loins were girded with fine gold of Uphaz* the shining man Daniel saw by the river, the mighty angel''s sun-bright face and fiery feet (Revelation 10:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 43:2 — *the glory of the Elohim (God) of Yashar''el (Israel) came from the way of the east: and his voice was like a noise of many waters* the returning throne-glory whose voice is many waters, the angel''s loud cry (Revelation 10:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-mighty-angel-clothed-with-a-cloud-the-rainbow-and-the-pillars-of-fire-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel (existing 1..5)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth* the seven thunders are the voice of Yahuah (LORD) upon the waters, the glory that thundereth (Revelation 10:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-lion-roaring-and-the-seven-thunders-sealed-up-amos-and-daniel'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=29 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12 (existing 1..3)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Genesis 14:22 — *I have lift up mine hand unto Yahuah (LORD), the El Elyon (most high God), the possessor of heaven and earth* Abram''s oath-gesture, the lifted hand unto the Maker of heaven and earth (Revelation 10:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-the-angels-oath-by-him-that-liveth-for-ever-deuteronomy-32-and-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3 (existing 1..6)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'2 Esdras 14:38 — *Esdras, open your mouth, and drink that I give you to drink* the prophet bidden to open his mouth and take the word in, as John is bidden to eat the little book (Revelation 10:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 14:39 — *he reached me a full cup, which was full as it were with water, but the colour of it was like fire* the fiery draught Esdras drank, one figure with the eaten scroll John took in (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Ezekiel 3:2 — *So I opened my mouth, and he caused me to eat that roll* Ezekiel''s very act of eating the roll, the same commission John re-enacts (Revelation 10:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-10-take-it-and-eat-it-up-sweet-as-honey-bitter-in-the-belly-ezekiel-2-and-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
