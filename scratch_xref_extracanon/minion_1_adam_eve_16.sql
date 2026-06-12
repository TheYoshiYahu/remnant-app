-- ----- fragment: minion_1adameve_16.sql (session253 1-adam-eve 16) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae16 (view _session253_1ae16_lookup). Sort band base 64375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-16-feared-the-sun-as-elohim
  ('adam-eve-conflict', '1-adam-eve', 16, 6, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 -- *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The very error Adam falls into at sunrise -- taking the sun for Elohim -- is the host-of-heaven worship Torah forbids the seed.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 6, 'apocrypha', 'the-wisdom-of-solomon', 13, 2, 'extras', E'Wisdom of Solomon 13:2 -- *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* Wisdom catalogues the same confusion Adam shows in 16:6, mistaking the lights of heaven for the God who made them.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 3, 'enoch', '1-enoch', 41, 5, 'extras', E'1 Enoch 41:5 -- *And I saw the chambers of the sun and moon, whence they proceed and whither they come again, and their glorious return, and how one is superior to the other, and their stately orbit, and how they do not leave their orbit, and they add nothing to their orbit and they do not take away from it, and they keep faith one with another: and in accordance with an oath they set and they rise.* Enoch shows the sun as an ordered servant kept under oath, not the god Adam dreaded in 16:3.'),
  -- thread: 1-adam-eve-16-this-sun-is-not-elohim
  ('adam-eve-conflict', '1-adam-eve', 16, 11, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 -- *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The Word''s correction in 16:11 simply repeats the creation decree -- the sun is a light made to rule the day, not a god.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 11, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 -- *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The greater light Adam feared in the cave''s mouth is the very lamp Elohim made and set in order, exactly as the Word tells him in 16:11.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 11, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 -- *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The sun preaches the Maker rather than claiming worship -- the lesson the Word presses on Adam in 16:11.'),
  -- thread: 1-adam-eve-16-the-word-came-and-comforted
  ('adam-eve-conflict', '1-adam-eve', 16, 10, 'canon', 'john', 1, 1, 'free', E'John 1:1 -- *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes to Adam in 16:10 and names Himself Elohim in 16:12 is the eternal Logos John reveals.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 11, 'canon', 'john', 1, 4, 'free', E'John 1:4 -- *In him was life; and the life was the light of men.* The Word who teaches Adam that the sun is but a created light is Himself the true Light of men, the One greater than the lamp Adam feared in 16:11.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 12, 'canon', 'genesis', 3, 8, 'free', E'Genesis 3:8 -- *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* The Word who comforted Adam in the night (16:12) is the same voice he once hid from in the garden -- now come outside to seek and steady him.'),
  -- thread: 1-adam-eve-16-fear-not-the-sun-shall-not-smite-thee
  ('adam-eve-conflict', '1-adam-eve', 16, 5, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 -- *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* Against Adam''s cry to be spared in 16:5, Yahuah''s word is not destruction but the strengthening ''fear not'' He speaks to His own.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 5, 'canon', 'psalms', 121, 6, 'free', E'Psalm 121:6 -- *The sun shall not smite thee by day, nor the moon by night.* The very plague Adam dreads from the sun in 16:5 is the harm the keeper of the seed pledges to hold back from His people.'),
  ('adam-eve-conflict', '1-adam-eve', 16, 5, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 -- *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The consuming burning Adam fears in 16:5 is appointed for the wicked, not for the seed Yahuah is keeping.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-16-feared-the-sun-as-elohim',
       E'He thought the sun was Elohim',
       E'Coming out of the cave at sunrise, Adam meets the blazing light for the first time outside the garden and mistakes the creature for the Creator: *And when he came to the mouth of it, and stood and turned his face towards the east, and saw the sunrise in glowing rays, and felt the heat thereof on his body, he was afraid of it, and thought in his heart that this flame came forth to plague him* (1 Adam & Eve 16:3) -- *For he thought the sun was Elohim (God)* (1 Adam & Eve 16:6). It ain''t new: the worship of the host of heaven, the fire and the lights mistaken for gods, begins on the first morning outside Eden. Moses warns the seed against this very error, *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them* (Deuteronomy 4:19). The Wisdom of the fathers names the snare exactly -- they *deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world* (Wisdom of Solomon 13:2). But the sun is set in its order under Yahuah, *I saw the chambers of the sun and moon, whence they proceed and whither they come again, and their glorious return* (1 Enoch 41:5).',
       sv.verse_id, ev.verse_id, 'extras', 64375
  FROM _session253_1ae16_lookup sv, _session253_1ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-16-this-sun-is-not-elohim',
       E'This sun is not Elohim -- but a light to rule the day',
       E'The Word of Elohim raises Adam from his terror and teaches him the difference between the creature and the Creator: *This sun is not Elohim (God); but it has been created to give light by day, of which I spoke to you in the cave saying, ''that the dawn would come, and there would be light by day''* (1 Adam & Eve 16:11). This is Genesis 1 spoken into Adam''s fear: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14) -- *the greater light to rule the day, and the lesser light to rule the night* (Genesis 1:16). The heavens are a witness, not a master: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork* (Psalm 19:1), the sun set as *a bridegroom coming out of his chamber* (Psalm 19:5). The same Word that ordered the lights now interprets them to Adam.',
       sv.verse_id, ev.verse_id, 'extras', 64378
  FROM _session253_1ae16_lookup sv, _session253_1ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-16-the-word-came-and-comforted',
       E'The Word of Elohim came and comforted him',
       E'While Adam trembles, it is the Word -- the Logos -- who comes, speaks, and comforts: *But while he was thinking like this in his heart, the Word of Elohim (God) came to him and said* (1 Adam & Eve 16:10) -- *But I am Elohim (God) who comforted you in the night* (1 Adam & Eve 16:12). This is the One John names from the beginning: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), by whom *All things were made* (John 1:3), in whom *was life; and the life was the light of men* (John 1:4). The voice Adam heard walking in the garden -- *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day* (Genesis 3:8) -- is the same Word still seeking and comforting fallen Adam outside the gate.',
       sv.verse_id, ev.verse_id, 'extras', 64381
  FROM _session253_1ae16_lookup sv, _session253_1ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-16-fear-not-the-sun-shall-not-smite-thee',
       E'Fear not -- the sun shall not smite thee',
       E'Adam falls on his face and begs the burning light not to consume him: *O Yahuah (Lord), plague me not, neither consume me, nor yet take away my life from the earth* (1 Adam & Eve 16:5). Into that dread the Word speaks the covenant comfort heard all through Scripture: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee* (Isaiah 41:10). The keeper of the seed will not let the creature harm him -- *The sun shall not smite thee by day, nor the moon by night* (Psalm 121:6). For the day of true burning is reserved for the proud, not for the redeemed, *the day that cometh shall burn them up* (Malachi 4:1); to Adam the Word brings not a plague but a promise.',
       sv.verse_id, ev.verse_id, 'extras', 64384
  FROM _session253_1ae16_lookup sv, _session253_1ae16_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=16 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-16-feared-the-sun-as-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 -- *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* The very error Adam falls into at sunrise -- taking the sun for Elohim -- is the host-of-heaven worship Torah forbids the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-feared-the-sun-as-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:2 -- *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* Wisdom catalogues the same confusion Adam shows in 16:6, mistaking the lights of heaven for the God who made them.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-feared-the-sun-as-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 41:5 -- *And I saw the chambers of the sun and moon, whence they proceed and whither they come again, and their glorious return, and how one is superior to the other, and their stately orbit, and how they do not leave their orbit, and they add nothing to their orbit and they do not take away from it, and they keep faith one with another: and in accordance with an oath they set and they rise.* Enoch shows the sun as an ordered servant kept under oath, not the god Adam dreaded in 16:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-feared-the-sun-as-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=41 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-16-this-sun-is-not-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 -- *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The Word''s correction in 16:11 simply repeats the creation decree -- the sun is a light made to rule the day, not a god.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-this-sun-is-not-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:16 -- *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The greater light Adam feared in the cave''s mouth is the very lamp Elohim made and set in order, exactly as the Word tells him in 16:11.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-this-sun-is-not-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 19:1 -- *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The sun preaches the Maker rather than claiming worship -- the lesson the Word presses on Adam in 16:11.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-this-sun-is-not-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-16-the-word-came-and-comforted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 -- *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes to Adam in 16:10 and names Himself Elohim in 16:12 is the eternal Logos John reveals.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-the-word-came-and-comforted'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:4 -- *In him was life; and the life was the light of men.* The Word who teaches Adam that the sun is but a created light is Himself the true Light of men, the One greater than the lamp Adam feared in 16:11.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-the-word-came-and-comforted'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:8 -- *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* The Word who comforted Adam in the night (16:12) is the same voice he once hid from in the garden -- now come outside to seek and steady him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-the-word-came-and-comforted'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-16-fear-not-the-sun-shall-not-smite-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:10 -- *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* Against Adam''s cry to be spared in 16:5, Yahuah''s word is not destruction but the strengthening ''fear not'' He speaks to His own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-fear-not-the-sun-shall-not-smite-thee'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 121:6 -- *The sun shall not smite thee by day, nor the moon by night.* The very plague Adam dreads from the sun in 16:5 is the harm the keeper of the seed pledges to hold back from His people.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-fear-not-the-sun-shall-not-smite-thee'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:1 -- *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The consuming burning Adam fears in 16:5 is appointed for the wicked, not for the seed Yahuah is keeping.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae16_lookup sv, _session253_1ae16_lookup tv
 WHERE t.slug='1-adam-eve-16-fear-not-the-sun-shall-not-smite-thee'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

