-- ----- fragment: minion_apocalypseofabraham_01.sql (session253 apocalypse-of-abraham 1) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa1 (view _session253_aoa1_lookup). Sort band base 67000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-1-gods-of-wood-and-stone
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture names the very house Abraham serves in — Terah''s gods of wood and stone are the "other gods" out of which Abraham is called.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The very metals of Terah''s temple — gold and silver, brass and iron — are the helpless handiwork of men.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'canon', 'psalms', 115, 7, 'free', E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* The god with feet that cannot walk is found by Abraham fallen forward at another idol''s feet, unable to rise.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* A god that *must needs be borne* is exactly the stone Merumath, too heavy for Abraham to lift back to its place.'),
  -- thread: apocalypse-of-abraham-1-the-idol-maker-recarves
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 8, 'canon', 'isaiah', 44, 13, 'free', E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Terah hewing "another Merumath out of another stone" is Isaiah''s craftsman shaping a god to stand in the house.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 8, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Terah worships the "residue" of his own carving — the shattered remainder re-made into a god.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 8, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The idol-maker and his work are alike vanity — Terah re-carving a headless god is its own witness against him.'),
  -- thread: apocalypse-of-abraham-1-the-head-that-fell
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 3, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The god whose head falls into Abraham''s hands is no more able to help itself than the men who trust in it.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 6, 'canon', 'jeremiah', 10, 3, 'free', E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Terah''s call "Bring me an axe" to mend his broken god is exactly Jeremiah''s workman with the axe — the vain custom exposed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 6, 'canon', 'jeremiah', 10, 4, 'free', E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The god must be fastened lest it move — yet Merumath''s head falls off the moment it is moved, a god that cannot keep itself together.'),
  -- thread: apocalypse-of-abraham-1-called-out-of-chaldea
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'jubilees', 'jubilees', 12, 2, 'extras', E'Jubilees 12:2 — *And he said, "What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth..."* The same Abraham, in the same house of Terah''s idols, declares the dumb forms have no spirit and calls his father to the living Elohim.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'jasher', 'jasher', 11, 16, 'extras', E'Jasher 11:16 — *And Abram came to his father''s house and saw twelve gods standing there in their temples, and the anger of Abram was kindled when he saw these images in his father''s house.* Jasher tells the identical temple scene — Abraham finding his father''s idols and burning with zeal against them.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Abraham''s searching "who the Mighty Elohim in truth is" is answered when the Elohim of glory appears and calls him out of the land of the idols.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 1, 1, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* The break with Terah''s gods is the break with Terah''s house — the called seed is sent out from the idol-system to the land of promise.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-1-gods-of-wood-and-stone',
       E'The gods of wood and stone that fall and cannot save',
       E'*On the day when I planed the gods of my father Terah and the gods of Nahor his brother, when I was searching as to who the Mighty Elohim (God) in truth is — I, Abraham, at the time when it fell to my lot, when I fulfilled the services (the sacrifices) of my father Terah to his gods of wood and stone, gold and silver, brass and iron, having entered into their temple for service, I found the god whose name was Merumath (which was) hewn out of stone, fallen forward at the feet of the iron god Nahon.* It ain''t new. The young Abraham serves at his father''s temple and finds the stone god toppled face-down — a god that cannot keep its own feet. The prophets sing this same exposure of the idols of metal and wood: *Their idols are silver and gold, the work of men''s hands. They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:4-5); *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go* (Jeremiah 10:5). And the LORD names the very household: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Abraham''s heart is already *searching as to who the Mighty Elohim in truth is* — election precedes confession; the seed is called out of the idol-system, not the system reformed.',
       sv.verse_id, ev.verse_id, 'extras', 67000
  FROM _session253_aoa1_lookup sv, _session253_aoa1_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-1-the-idol-maker-recarves',
       E'The idol-maker who re-hews the god he himself made',
       E'*And he hewed aright another Merumath out of another stone, without head, and the head which had been thrown down from Merumath he placed upon it, and the rest of Merumath he shattered.* It ain''t new. Terah the idol-maker simply carves a fresh god, fits the old head onto a new body, and shatters the rest — proof that the "god" is only what the craftsman''s axe makes it. Isaiah laughs the same laugh: *The carpenter stretcheth out his rule... and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house* (Isaiah 44:13); *He burneth part thereof in the fire... And the residue thereof he maketh a god, even his graven image: he falleth down unto it* (Isaiah 44:16-17). The same wood warms the house and becomes the worshipped thing — *a deceived heart hath turned him aside... Is there not a lie in my right hand?* (Isaiah 44:20). The maker is greater than the made; Terah''s hands betray that his gods are no gods. The system is to be dismantled, not served.',
       sv.verse_id, ev.verse_id, 'extras', 67003
  FROM _session253_aoa1_lookup sv, _session253_aoa1_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-1-the-head-that-fell',
       E'The head that fell — the god that could not stand',
       E'*And he entered with me, and when both of us moved him (the god) forward, so that we might bring him back to his place, his head fell from him while I was still holding him by the head.* It ain''t new. Father and son together cannot keep the god upright — its head breaks off in Abraham''s hand. The dumb idol is shamed before its servants. Jeremiah strips the trade bare: *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe* (Jeremiah 10:3) — the same axe Terah calls for to re-make his fallen god (Apocalypse of Abraham 1:6). And the maker becomes the made: *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). The toppled, headless god is the verdict on all that is *the work of men''s hands*.',
       sv.verse_id, ev.verse_id, 'extras', 67006
  FROM _session253_aoa1_lookup sv, _session253_aoa1_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-1-called-out-of-chaldea',
       E'Searching for the true Elohim — the seed called out of Ur',
       E'*On the day when I planed the gods of my father Terah... when I was searching as to who the Mighty Elohim (God) in truth is.* It ain''t new. Abraham''s break with the idols is the beginning of the calling-out: the same scene is told in the restored books, where Abraham confronts his father and burns the temple. Jubilees gives the very words: *What help and profit have we from those idols which you do worship... For there is no spirit in them, For they are dumb forms... Worship the Elohim (God) of heaven* (Jubilees 12:2). And Jasher: *Abram came to his father''s house and saw twelve gods standing there in their temples, and the anger of Abram was kindled* (Jasher 11:16); *where is Elohim who created heaven and earth* (Jasher 11:19). The searching ends when the Elohim of glory speaks: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2), saying *Get thee out of thy country, and from thy kindred* (Genesis 12:1) — out of *Ur of the Chaldees* (Genesis 11:31). The idol-system is left behind; the called seed goes forth.',
       sv.verse_id, ev.verse_id, 'extras', 67009
  FROM _session253_aoa1_lookup sv, _session253_aoa1_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-1-gods-of-wood-and-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture names the very house Abraham serves in — Terah''s gods of wood and stone are the "other gods" out of which Abraham is called.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-gods-of-wood-and-stone'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The very metals of Terah''s temple — gold and silver, brass and iron — are the helpless handiwork of men.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-gods-of-wood-and-stone'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* The god with feet that cannot walk is found by Abraham fallen forward at another idol''s feet, unable to rise.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-gods-of-wood-and-stone'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* A god that *must needs be borne* is exactly the stone Merumath, too heavy for Abraham to lift back to its place.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-gods-of-wood-and-stone'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-1-the-idol-maker-recarves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Terah hewing "another Merumath out of another stone" is Isaiah''s craftsman shaping a god to stand in the house.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-the-idol-maker-recarves'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Terah worships the "residue" of his own carving — the shattered remainder re-made into a god.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-the-idol-maker-recarves'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The idol-maker and his work are alike vanity — Terah re-carving a headless god is its own witness against him.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-the-idol-maker-recarves'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-1-the-head-that-fell
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The god whose head falls into Abraham''s hands is no more able to help itself than the men who trust in it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-the-head-that-fell'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Terah''s call "Bring me an axe" to mend his broken god is exactly Jeremiah''s workman with the axe — the vain custom exposed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-the-head-that-fell'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The god must be fastened lest it move — yet Merumath''s head falls off the moment it is moved, a god that cannot keep itself together.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-the-head-that-fell'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-1-called-out-of-chaldea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 12:2 — *And he said, "What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth..."* The same Abraham, in the same house of Terah''s idols, declares the dumb forms have no spirit and calls his father to the living Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-called-out-of-chaldea'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jasher 11:16 — *And Abram came to his father''s house and saw twelve gods standing there in their temples, and the anger of Abram was kindled when he saw these images in his father''s house.* Jasher tells the identical temple scene — Abraham finding his father''s idols and burning with zeal against them.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-called-out-of-chaldea'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Abraham''s searching "who the Mighty Elohim in truth is" is answered when the Elohim of glory appears and calls him out of the land of the idols.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-called-out-of-chaldea'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* The break with Terah''s gods is the break with Terah''s house — the called seed is sent out from the idol-system to the land of promise.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa1_lookup sv, _session253_aoa1_lookup tv
 WHERE t.slug='apocalypse-of-abraham-1-called-out-of-chaldea'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

