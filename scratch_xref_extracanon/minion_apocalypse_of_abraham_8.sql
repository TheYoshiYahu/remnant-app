-- ----- fragment: minion_apocalypseofabraham_08.sql (session253 apocalypse-of-abraham 8) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa8 (view _session253_aoa8_lookup). Sort band base 67175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-8-here-am-i
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 1, 'canon', 'genesis', 22, 1, 'free', E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* The doubled call and the ready answer of Apocalypse of Abraham 8:1-2 are the same covenant address Abraham knows on Moriah.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 2, 'canon', 'exodus', 3, 4, 'free', E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* As the One out of the fiery cloud cries "Abraham, Abraham" and is answered "Here am I," so the One in the burning bush cries "Moses, Moses" and is answered the same.'),
  -- thread: apocalypse-of-abraham-8-i-am-he-creator
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 3, 'canon', 'isaiah', 43, 10, 'free', E'Isaiah 43:10 — *Ye are my witnesses, saith Yahuah (LORD), and my servant whom I have chosen: that ye may know and believe me, and understand that I am he: before me there was no Elohim (God) formed, neither shall there be after me.* The "I am He" the LORD speaks to the nations is the very word He speaks to Abraham in Apocalypse of Abraham 8:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 3, 'canon', 'isaiah', 44, 6, 'free', E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The Elohim of gods and Creator who answers Abraham''s seeking heart is the One beside whom there is no other.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 3, 'jubilees', 'jubilees', 12, 17, 'extras', E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God)... You alone are my Elohim (God)... And You have created all things, And all things that are are the work of Your hands.* The parallel restored record gives Abraham''s own confession of the Creator that meets the "I am He" of Apocalypse of Abraham 8:3.'),
  -- thread: apocalypse-of-abraham-8-get-thee-out
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 4, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee.* The "get thee out from the house" of Apocalypse of Abraham 8:4 is the very lekh-lekha that founds the covenant in the Torah.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 4, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen rehearses before the council the same calling-out of Abraham that Apocalypse of Abraham 8:4 records.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 4, 'jubilees', 'jubilees', 12, 22, 'extras', E'Jubilees 12:22 — *Get you up from your country, and from your kindred and from the house of your father to a land which I shall show you, and I shall make you a great and numerous nation.* The parallel restored record gives the identical call out of the father''s house that meets Apocalypse of Abraham 8:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 5, 'canon', '2-corinthians', 6, 17, 'free', E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you.* Abraham''s "And I went out" is the pattern of separation from the idol-system that the elect are still called to.'),
  -- thread: apocalypse-of-abraham-8-fire-on-the-idol-house
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 6, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah''s served-gods are the idol-house that burns in Apocalypse of Abraham 8:6.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 6, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* The thunder-fire that consumes Terah''s house in Apocalypse of Abraham 8:6 is the same heaven-sent fire of judgment on the cities of the plain.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 8, 6, 'jasher', 'jasher', 12, 26, 'extras', E'Jasher 12:26 — *And Haran died when they had cast him into the fire, and he was burned to ashes, for his heart was not perfect with Yahuah (the Lord); and those men who cast him into the fire, the flame of the fire spread over them, and they were burned, and twelve men of them died.* The parallel record''s fire of Ur consumes the unfaithful while the called one walks free, as the fire takes Terah''s house in Apocalypse of Abraham 8:6.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-8-here-am-i',
       E'Abraham, Abraham — Here am I',
       E'The voice falls from heaven in a fiery cloud-burst upon the young idol-breaker: *"Abraham, Abraham!"* (Apocalypse of Abraham 8:1), and he answers, *"Here am I."* (Apocalypse of Abraham 8:2). It ain''t new — this is the doubled covenant-name and the ready heart all through the Torah. On the mount of the binding the same word and the same answer: *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* (Genesis 22:1). And out of the bush that burned and was not consumed: *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* (Exodus 3:4). The fire-vision that calls Abraham is the fire-vision that calls Moses; the called one answers the same.',
       sv.verse_id, ev.verse_id, 'extras', 67175
  FROM _session253_aoa8_lookup sv, _session253_aoa8_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-8-i-am-he-creator',
       E'The Elohim of gods, the Creator — I am He',
       E'To the heart that sought past the dead idols of Terah, He declares Himself: *"Thou art seeking, in the understanding of thine heart, the Elohim (God) of Gods and the Creator; I am He."* (Apocalypse of Abraham 8:3). It ain''t new — "I am He" and "beside me there is no Elohim" is the LORD''s own self-witness to the nations. *Ye are my witnesses, saith Yahuah (LORD), and my servant whom I have chosen: that ye may know and believe me, and understand that I am he: before me there was no Elohim (God) formed, neither shall there be after me.* (Isaiah 43:10). *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6). And Abraham came to this very confession over the idols in the parallel record: *All the signs of the stars... are all in the hand of Yahuah (God)... You alone are my Elohim (God)... And You have created all things, And all things that are are the work of Your hands.* (Jubilees 12:17). The Creator is the One True Elohim; the idol is nothing.',
       sv.verse_id, ev.verse_id, 'extras', 67178
  FROM _session253_aoa8_lookup sv, _session253_aoa8_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-8-get-thee-out',
       E'Go out from thy father''s house',
       E'The command that founds the covenant: *"Go out from thy father Terah, and get thee out from the house, that thou also be not slain in the sins of thy father''s house."* (Apocalypse of Abraham 8:4), *"And I went out."* (Apocalypse of Abraham 8:5). It ain''t new — this is the lekh-lekha of Genesis word for word. *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* (Genesis 12:1). Stephen rehearses it before the council: *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* (Acts 7:3). The parallel record carries the same call: *Get you up from your country, and from your kindred and from the house of your father to a land which I shall show you.* (Jubilees 12:22). And the call to come out from the idol-house is the call to the elect still — not to abandon the covenant but to separate from the system that perishes: *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you.* (2 Corinthians 6:17).',
       sv.verse_id, ev.verse_id, 'extras', 67181
  FROM _session253_aoa8_lookup sv, _session253_aoa8_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-8-fire-on-the-idol-house',
       E'The fire that burnt the idol-house',
       E'No sooner is Abraham out the door than the judgment falls: *there came a sound of a great thunder and burnt him and his house, and everything whatsoever in his house, down to the ground, forty cubits.* (Apocalypse of Abraham 8:6). It ain''t new — Terah was the idol-maker, and the gods of wood and stone bring fire, not rescue. *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* (Joshua 24:2). The fire that came out of heaven on the cities of the plain is the same righteous fire: *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* (Genesis 19:24). And the parallel record knows the furnace of Ur and the burning of the unfaithful house: *And Haran died when they had cast him into the fire, and he was burned to ashes, for his heart was not perfect with Yahuah (the Lord).* (Jasher 12:26). The idol cannot save itself or its house; the one called out walks free.',
       sv.verse_id, ev.verse_id, 'extras', 67184
  FROM _session253_aoa8_lookup sv, _session253_aoa8_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-8-here-am-i
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:1 — *And it came to pass after these things, that Elohim (God) did tempt Abraham, and said unto him, Abraham: and he said, Behold, here I am.* The doubled call and the ready answer of Apocalypse of Abraham 8:1-2 are the same covenant address Abraham knows on Moriah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-here-am-i'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* As the One out of the fiery cloud cries "Abraham, Abraham" and is answered "Here am I," so the One in the burning bush cries "Moses, Moses" and is answered the same.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-here-am-i'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-8-i-am-he-creator
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:10 — *Ye are my witnesses, saith Yahuah (LORD), and my servant whom I have chosen: that ye may know and believe me, and understand that I am he: before me there was no Elohim (God) formed, neither shall there be after me.* The "I am He" the LORD speaks to the nations is the very word He speaks to Abraham in Apocalypse of Abraham 8:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-i-am-he-creator'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The Elohim of gods and Creator who answers Abraham''s seeking heart is the One beside whom there is no other.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-i-am-he-creator'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God)... You alone are my Elohim (God)... And You have created all things, And all things that are are the work of Your hands.* The parallel restored record gives Abraham''s own confession of the Creator that meets the "I am He" of Apocalypse of Abraham 8:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-i-am-he-creator'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-8-get-thee-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee.* The "get thee out from the house" of Apocalypse of Abraham 8:4 is the very lekh-lekha that founds the covenant in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-get-thee-out'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen rehearses before the council the same calling-out of Abraham that Apocalypse of Abraham 8:4 records.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-get-thee-out'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:22 — *Get you up from your country, and from your kindred and from the house of your father to a land which I shall show you, and I shall make you a great and numerous nation.* The parallel restored record gives the identical call out of the father''s house that meets Apocalypse of Abraham 8:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-get-thee-out'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you.* Abraham''s "And I went out" is the pattern of separation from the idol-system that the elect are still called to.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-get-thee-out'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-8-fire-on-the-idol-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah''s served-gods are the idol-house that burns in Apocalypse of Abraham 8:6.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-fire-on-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* The thunder-fire that consumes Terah''s house in Apocalypse of Abraham 8:6 is the same heaven-sent fire of judgment on the cities of the plain.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-fire-on-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jasher 12:26 — *And Haran died when they had cast him into the fire, and he was burned to ashes, for his heart was not perfect with Yahuah (the Lord); and those men who cast him into the fire, the flame of the fire spread over them, and they were burned, and twelve men of them died.* The parallel record''s fire of Ur consumes the unfaithful while the called one walks free, as the fire takes Terah''s house in Apocalypse of Abraham 8:6.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa8_lookup sv, _session253_aoa8_lookup tv
 WHERE t.slug='apocalypse-of-abraham-8-fire-on-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=12 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

