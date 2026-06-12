-- ----- fragment: minion_1adameve_26.sql (session253 1-adam-eve 26) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae26 (view _session253_1ae26_lookup). Sort band base 64625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-26-word-hidden-cave-darkness
  ('adam-eve-conflict', '1-adam-eve', 26, 4, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cave-prison of 1 Adam & Eve 26:4 is the lived consequence of the driving-out and the barred way of Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The very "Word of Elohim" Adam mourns as hidden in 1 Adam & Eve 26:3 is the eternal Logos who was from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 2, 'canon', 'john', 8, 12, 'free', E'John 8:12 — *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* The light from the east that comforted Adam (1 Adam & Eve 26:2) is the Light of the world made flesh, in whom is no darkness.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 1, 'jubilees', 'jubilees', 3, 32, 'extras', E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* Jubilees records the same expulsion and dwelling-place outside Eden that frames Adam and Eve''s return to the cave in 1 Adam & Eve 26:1.'),
  -- thread: 1-adam-eve-26-word-comes-promises-messiah
  ('adam-eve-conflict', '1-adam-eve', 26, 14, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who came and spoke to Adam in 1 Adam & Eve 26:9-15 is the same Logos who at the fulfilled covenant was made flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 15, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "when the covenant is fulfilled" of 1 Adam & Eve 26:15 is the fulness of time when the promised Son of the woman is sent.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 12, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour the Word promises Adam in 1 Adam & Eve 26:12 was foreordained from before the world and made manifest in the last times.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 9, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The Word of Elohim who comes and speaks to Adam in 1 Adam & Eve 26:9 is the Son by whom Elohim made the worlds and now speaks.'),
  -- thread: 1-adam-eve-26-patience-darkness-twelve-hours-joy
  ('adam-eve-conflict', '1-adam-eve', 26, 16, 'canon', 'psalms', 30, 5, 'free', E'Psalms 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* The promise that the cave''s darkness lasts only twelve hours before light comes (1 Adam & Eve 26:16) is the morning-joy that follows the night of weeping.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 11, 'canon', 'james', 5, 7, 'free', E'James 5:7 — *Be patient therefore, brethren, unto the coming of Yahuah (Lord). Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain.* The "bear long... until the time of My covenant is come" of 1 Adam & Eve 26:11 is the same patient waiting for the coming of Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 16, 'canon', 'john', 16, 20, 'free', E'John 16:20 — *Verily, verily, I say unto you, That ye shall weep and lament, but the world shall rejoice: and ye shall be sorrowful, but your sorrow shall be turned into joy.* The twelve hours of darkness ended by light (1 Adam & Eve 26:16) foreshadow the sorrow turned into joy promised to Messiah''s own.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 11, 'canon', 'hebrews', 6, 15, 'free', E'Hebrews 6:15 — *And so, after he had patiently endured, he obtained the promise.* Adam''s calling-of-the-soul to bear long until the covenant (1 Adam & Eve 26:11) is the patient endurance by which the fathers obtained the promise.'),
  -- thread: 1-adam-eve-26-mercy-land-of-gladness-no-sorrow
  ('adam-eve-conflict', '1-adam-eve', 26, 15, 'canon', 'revelation', 21, 4, 'free', E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The land of gladness with neither sorrow nor suffering promised in 1 Adam & Eve 26:15 is the New Jerusalem where all tears are wiped away.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 15, 'canon', 'revelation', 22, 5, 'free', E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The promised "light that never fails" of 1 Adam & Eve 26:15 is the unfailing light of Elohim in the world to come.'),
  ('adam-eve-conflict', '1-adam-eve', 26, 8, 'canon', 'hebrews', 6, 18, 'free', E'Hebrews 6:18 — *That by two immutable things, in which it was impossible for Elohim (God) to lie, we might have a strong consolation, who have fled for refuge to lay hold upon the hope set before us:* The forbearing mercy of 1 Adam & Eve 26:8 rests on the immutable promise of an Elohim who cannot lie.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-26-word-hidden-cave-darkness',
       E'The Word hidden, the cave like a prison',
       E'Returning from the mountain to the Cave of Treasures, Adam grieves that the light has failed: *But now the Word of Elohim (God) is hidden from us; and the light that shown over us is so changed as to disappear, and let darkness and sorrow come over us* (1 Adam & Eve 26:3), *And we are forced to enter this cave which is like a prison, in which darkness covers us, so that we are separated from each other* (1 Adam & Eve 26:4). This is the exile of Genesis 3 lived out from the first day: *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24) — the way back barred, the children of the woman shut out in the dark. Jubilees tells the same beginning: *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation* (Jubilees 3:32). Yet the very Light that is withdrawn is the Light that will come: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1); *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). The seed-war begins in the dark, but the Word is not gone for good.',
       sv.verse_id, ev.verse_id, 'extras', 64625
  FROM _session253_1ae26_lookup sv, _session253_1ae26_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=26 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-26-word-comes-promises-messiah',
       E'The Word comes and promises the Saviour',
       E'Though hidden, the Word does not abandon them — He comes again with the great promise: *Then came the Word of Elohim (God) to Adam, and said to him* (1 Adam & Eve 26:9), *Then shall I come and save you, O Adam, for I do not wish that you be afflicted* (1 Adam & Eve 26:12), *When, however, the covenant is fulfilled, then shall I show you and your descendants mercy* (1 Adam & Eve 26:15). The Word who speaks to Adam at the cave is the same who at last became flesh: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). His coming was set to the fulness of the days: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the Son of the woman of Genesis 3:15. This is no afterthought but the foreordained mercy: *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20). The Word who spoke to the fathers speaks last by the Son: *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds* (Hebrews 1:2). "It ain''t new": the gospel was preached to Adam at the mouth of the cave.',
       sv.verse_id, ev.verse_id, 'extras', 64628
  FROM _session253_1ae26_lookup sv, _session253_1ae26_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=26 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-26-patience-darkness-twelve-hours-joy',
       E'Bear long: twelve hours of darkness, then light',
       E'The Word''s counsel is patience under the night, with light certain to follow: *Yes, rather, bear long and calm your soul while you live night and day; until the fulfillment of the days, and the time of My covenant is come* (1 Adam & Eve 26:11), *Be patient and enter the cave, for the darkness, of which you were afraid, shall only be twelve hours long; and when ended, light shall come up* (1 Adam & Eve 26:16). The morning is promised after the night: *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning* (Psalm 30:5); *Verily, verily, I say unto you, That ye shall weep and lament, but the world shall rejoice: and ye shall be sorrowful, but your sorrow shall be turned into joy* (John 16:20). This is the patience the husbandman keeps until the harvest: *Be patient therefore, brethren, unto the coming of Yahuah (Lord). Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain* (James 5:7). So Adam, like Abraham, must endure to obtain the promise: *And so, after he had patiently endured, he obtained the promise* (Hebrews 6:15).',
       sv.verse_id, ev.verse_id, 'extras', 64631
  FROM _session253_1ae26_lookup sv, _session253_1ae26_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=26 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-26-mercy-land-of-gladness-no-sorrow',
       E'Mercy and the land of gladness where sorrow ends',
       E'Yahuah''s forbearance toward His grieving children is unbroken — He is not angry but patient, and pledges a restored garden: *Therefore Elohim (God) was not angry with them; nor impatient with them; but he was patient and forbearing towards them, as towards the children He had created* (1 Adam & Eve 26:8), *then shall I show you and your descendants mercy, and bring you into a land of gladness, where there is neither sorrow nor suffering; but abiding joy and gladness, and light that never fails, and praises that never cease; and a beautiful garden that shall never pass away* (1 Adam & Eve 26:15). This is the consummation John saw: *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away* (Revelation 21:4). The promised light that never fails is the same eternal day: *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever* (Revelation 22:5). The mercy promised at the cave is anchored in the unchangeable oath: *That by two immutable things, in which it was impossible for Elohim (God) to lie, we might have a strong consolation, who have fled for refuge to lay hold upon the hope set before us* (Hebrews 6:18). The same garden lost in Genesis 3 is the garden restored at the end.',
       sv.verse_id, ev.verse_id, 'extras', 64634
  FROM _session253_1ae26_lookup sv, _session253_1ae26_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=26 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-26-word-hidden-cave-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* The cave-prison of 1 Adam & Eve 26:4 is the lived consequence of the driving-out and the barred way of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-hidden-cave-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The very "Word of Elohim" Adam mourns as hidden in 1 Adam & Eve 26:3 is the eternal Logos who was from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-hidden-cave-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:12 — *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* The light from the east that comforted Adam (1 Adam & Eve 26:2) is the Light of the world made flesh, in whom is no darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-hidden-cave-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:32 — *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ’Eldâ, in the land of their creation.* Jubilees records the same expulsion and dwelling-place outside Eden that frames Adam and Eve''s return to the cave in 1 Adam & Eve 26:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-hidden-cave-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-26-word-comes-promises-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who came and spoke to Adam in 1 Adam & Eve 26:9-15 is the same Logos who at the fulfilled covenant was made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-comes-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "when the covenant is fulfilled" of 1 Adam & Eve 26:15 is the fulness of time when the promised Son of the woman is sent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-comes-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour the Word promises Adam in 1 Adam & Eve 26:12 was foreordained from before the world and made manifest in the last times.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-comes-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* The Word of Elohim who comes and speaks to Adam in 1 Adam & Eve 26:9 is the Son by whom Elohim made the worlds and now speaks.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-word-comes-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-26-patience-darkness-twelve-hours-joy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* The promise that the cave''s darkness lasts only twelve hours before light comes (1 Adam & Eve 26:16) is the morning-joy that follows the night of weeping.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-patience-darkness-twelve-hours-joy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:7 — *Be patient therefore, brethren, unto the coming of Yahuah (Lord). Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain.* The "bear long... until the time of My covenant is come" of 1 Adam & Eve 26:11 is the same patient waiting for the coming of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-patience-darkness-twelve-hours-joy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 16:20 — *Verily, verily, I say unto you, That ye shall weep and lament, but the world shall rejoice: and ye shall be sorrowful, but your sorrow shall be turned into joy.* The twelve hours of darkness ended by light (1 Adam & Eve 26:16) foreshadow the sorrow turned into joy promised to Messiah''s own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-patience-darkness-twelve-hours-joy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 6:15 — *And so, after he had patiently endured, he obtained the promise.* Adam''s calling-of-the-soul to bear long until the covenant (1 Adam & Eve 26:11) is the patient endurance by which the fathers obtained the promise.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-patience-darkness-twelve-hours-joy'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-26-mercy-land-of-gladness-no-sorrow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.* The land of gladness with neither sorrow nor suffering promised in 1 Adam & Eve 26:15 is the New Jerusalem where all tears are wiped away.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-mercy-land-of-gladness-no-sorrow'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:5 — *And there shall be no night there; and they need no candle, neither light of the sun; for Yahuah Elohim (the Lord God) giveth them light: and they shall reign for ever and ever.* The promised "light that never fails" of 1 Adam & Eve 26:15 is the unfailing light of Elohim in the world to come.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-mercy-land-of-gladness-no-sorrow'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 6:18 — *That by two immutable things, in which it was impossible for Elohim (God) to lie, we might have a strong consolation, who have fled for refuge to lay hold upon the hope set before us:* The forbearing mercy of 1 Adam & Eve 26:8 rests on the immutable promise of an Elohim who cannot lie.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae26_lookup sv, _session253_1ae26_lookup tv
 WHERE t.slug='1-adam-eve-26-mercy-land-of-gladness-no-sorrow'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

