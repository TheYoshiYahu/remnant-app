-- ----- fragment: minion_apocalypseofabraham_15.sql (session253 apocalypse-of-abraham 15) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa15 (view _session253_aoa15_lookup). Sort band base 67350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-15-smoking-furnace
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 1, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The smoke as of a furnace that Abraham sees when the sun went down (Apocalypse of Abraham 15:1) is the very smoking furnace of the covenant-cutting in the Torah.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 1, 'canon', 'genesis', 15, 12, 'free', E'Genesis 15:12 — *And when the sun was going down, a deep sleep fell upon Abram; and, lo, an horror of great darkness fell upon him.* The same sundown hour and the same dread frame the scene Abraham now enters at Apocalypse of Abraham 15:1.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 2, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The portions of the sacrifice that the angels carry up from the furnace (Apocalypse of Abraham 15:2) are these very animals Abram was commanded to take.'),
  -- thread: apocalypse-of-abraham-15-undivided-birds
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 3, 'canon', 'genesis', 15, 10, 'free', E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* This is precisely why the pigeon and turtle-dove on which Abraham rides were neither slaughtered nor divided (Apocalypse of Abraham 15:3) — they alone were left whole in the covenant rite.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 3, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The covenant whose sacrifice now bears Abraham heavenward (Apocalypse of Abraham 15:3) is the very promise of a seed as the stars.'),
  -- thread: apocalypse-of-abraham-15-chariot-ascent
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 4, 'enoch', '1-enoch', 14, 3, 'extras', E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* Abraham too is borne up as with many winds to the borders of the flaming fire (Apocalypse of Abraham 15:4); the wind-and-fire ascent is the shared pattern of the prophets caught up to heaven.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 4, 'canon', 'ezekiel', 1, 4, 'free', E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The borders of the flaming fire reached by many winds (Apocalypse of Abraham 15:4) are the wind-and-fire that surround the throne of the chariot-vision.'),
  -- thread: apocalypse-of-abraham-15-strong-light-worship
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 5, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiercely burning fire full of a great host of people, worshipping (Apocalypse of Abraham 15:5), is the same fiery stream and innumerable ministering host before the Ancient of days.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 5, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The crying with a sound of words Abraham could not understand (Apocalypse of Abraham 15:5) is this unceasing antiphon of the seraphim before the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 5, 'canon', 'revelation', 4, 5, 'free', E'Revelation 4:5 — *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God).* The strong light impossible to describe and the burning fire of the heavenly court (Apocalypse of Abraham 15:5) match the lamps of fire and the radiance before the throne of the Lamb.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 15, 5, 'canon', 'ezekiel', 1, 27, 'free', E'Ezekiel 1:27 — *And I saw as the colour of amber, as the appearance of fire round about within it, from the appearance of his loins even upward, and from the appearance of his loins even downward, I saw as it were the appearance of fire, and it had brightness round about.* The indescribable strong light shot through with burning fire (Apocalypse of Abraham 15:5) is the fire-and-brightness of the glory enthroned above the firmament.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-15-smoking-furnace',
       E'The smoke as of a furnace — the covenant sacrifice (Genesis 15)',
       E'Abraham''s vision opens exactly where the Torah leaves it: *And it came to pass, when the sun went down, and lo, a smoke as of a furnace. And the angels who had the portions of the sacrifice ascended from the top of the smoking furnace* (Apocalypse of Abraham 15:1-2). This is no new scene — it is the very hour of the cutting of the covenant. *And when the sun was going down, a deep sleep fell upon Abram; and, lo, an horror of great darkness fell upon him* (Genesis 15:12); *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17). The pieces the angels bear up are the heifer, goat, ram, and birds Abram had laid out — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9). It ain''t new; the apocalypse simply lifts the smoking furnace of Genesis off the ground.',
       sv.verse_id, ev.verse_id, 'extras', 67350
  FROM _session253_aoa15_lookup sv, _session253_aoa15_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-15-undivided-birds',
       E'The wing of the pigeon and the turtledove — the birds divided he not',
       E'The angel Yahoel bears Abraham up not on his own wings but upon the offering itself: *And the Angel took me with the right hand and set me on the right wing of the pigeon, and set himself on the left wing of the turtle-dove, which birds had neither been slaughtered nor divided* (Apocalypse of Abraham 15:3). The detail is faithful to the Torah down to the knife: in the covenant rite Abram halved the beasts but left the two birds whole — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not* (Genesis 15:10). It is on the only undivided, living portion of the sacrifice — the turtledove and the pigeon — that the patriarch is carried to heaven. The seed that was promised by this covenant is reckoned by faith: *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars... So shall thy seed be* (Genesis 15:5).',
       sv.verse_id, ev.verse_id, 'extras', 67353
  FROM _session253_aoa15_lookup sv, _session253_aoa15_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-15-chariot-ascent',
       E'Borne up with many winds to the flaming fire — the chariot ascent',
       E'*And he bore me to the borders of the flaming fire, and we ascended as with many winds to the heaven which was fixed upon the surface* (Apocalypse of Abraham 15:4). The wind-borne ascent toward the fire is the same road Enoch was taken — it ain''t new. *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven* (1 Enoch 14:3). And it is the throne-vision of the merkabah itself, where the glory comes wrapped in wind and fire: *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it... out of the midst of the fire* (Ezekiel 1:4). One Spirit, one ascent, one fiery threshold of the heavens.',
       sv.verse_id, ev.verse_id, 'extras', 67356
  FROM _session253_aoa15_lookup sv, _session253_aoa15_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-15-strong-light-worship',
       E'The strong light and the fiery host that worship — before the throne',
       E'At the height of the ascent Abraham beholds what no tongue can frame: *And I saw on the air, on the height to which we ascended, a strong light which it was impossible to describe, and lo, in this light a fiercely burning fire for people, many people of male appearance... and worshipping and crying with a sound of words which I knew not* (Apocalypse of Abraham 15:5). This is the fiery court of the Ancient of days: *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* (Daniel 7:10). It is the throne Isaiah saw, with the unceasing cry that Abraham hears but cannot read: *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3). And it is the sea of fire before the throne of the Revelation: *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim* (Revelation 4:5). The vision ain''t new — it is the one throne, the one fire, the one ceaseless worship.',
       sv.verse_id, ev.verse_id, 'extras', 67359
  FROM _session253_aoa15_lookup sv, _session253_aoa15_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=15 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-15-smoking-furnace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The smoke as of a furnace that Abraham sees when the sun went down (Apocalypse of Abraham 15:1) is the very smoking furnace of the covenant-cutting in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-smoking-furnace'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:12 — *And when the sun was going down, a deep sleep fell upon Abram; and, lo, an horror of great darkness fell upon him.* The same sundown hour and the same dread frame the scene Abraham now enters at Apocalypse of Abraham 15:1.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-smoking-furnace'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The portions of the sacrifice that the angels carry up from the furnace (Apocalypse of Abraham 15:2) are these very animals Abram was commanded to take.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-smoking-furnace'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-15-undivided-birds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* This is precisely why the pigeon and turtle-dove on which Abraham rides were neither slaughtered nor divided (Apocalypse of Abraham 15:3) — they alone were left whole in the covenant rite.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-undivided-birds'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The covenant whose sacrifice now bears Abraham heavenward (Apocalypse of Abraham 15:3) is the very promise of a seed as the stars.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-undivided-birds'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-15-chariot-ascent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* Abraham too is borne up as with many winds to the borders of the flaming fire (Apocalypse of Abraham 15:4); the wind-and-fire ascent is the shared pattern of the prophets caught up to heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-chariot-ascent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The borders of the flaming fire reached by many winds (Apocalypse of Abraham 15:4) are the wind-and-fire that surround the throne of the chariot-vision.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-chariot-ascent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-15-strong-light-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The fiercely burning fire full of a great host of people, worshipping (Apocalypse of Abraham 15:5), is the same fiery stream and innumerable ministering host before the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-strong-light-worship'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The crying with a sound of words Abraham could not understand (Apocalypse of Abraham 15:5) is this unceasing antiphon of the seraphim before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-strong-light-worship'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:5 — *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God).* The strong light impossible to describe and the burning fire of the heavenly court (Apocalypse of Abraham 15:5) match the lamps of fire and the radiance before the throne of the Lamb.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-strong-light-worship'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:27 — *And I saw as the colour of amber, as the appearance of fire round about within it, from the appearance of his loins even upward, and from the appearance of his loins even downward, I saw as it were the appearance of fire, and it had brightness round about.* The indescribable strong light shot through with burning fire (Apocalypse of Abraham 15:5) is the fire-and-brightness of the glory enthroned above the firmament.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa15_lookup sv, _session253_aoa15_lookup tv
 WHERE t.slug='apocalypse-of-abraham-15-strong-light-worship'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

