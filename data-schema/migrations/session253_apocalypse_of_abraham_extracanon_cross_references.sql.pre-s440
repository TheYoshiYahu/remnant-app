-- =====================================================================
-- Session 253 — Apocalypse of Abraham FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_apocalypse_of_abraham_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Apocalypse of Abraham cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_apocalypseofabraham_02.sql (session253 apocalypse-of-abraham 2) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa2 (view _session253_aoa2_lookup). Sort band base 67025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-2-idol-makers-trade
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 1, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah, who hands the boy the gods to sell here, is named by Joshua as an idol-server — the very house Abraham is called out of.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 1, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The made gods Terah peddles are exactly the manufactured vanity Isaiah exposes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 1, 'canon', 'acts', 19, 26, 'free', E'Acts 19:26 — *Moreover ye see and hear, that not alone at Ephesus, but almost throughout all Asia, this Paul hath persuaded and turned away much people, saying that they be no gods, which are made with hands:* What Abraham learns selling his father''s wares, the apostle preaches openly — gods made with hands are no gods.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 1, 'jubilees', 'jubilees', 12, 2, 'extras', E'Jubilees 12:2 — *And he said, "What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart..."* Jubilees gives the same young Abraham pleading with the same idol-keeping father over the same lifeless wares.'),
  -- thread: apocalypse-of-abraham-2-gods-that-break
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 5, 'canon', 'hosea', 8, 6, 'free', E'Hosea 8:6 — *For from Yashar''el (Israel) was it also: the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces.* What a workman made is no Elohim and shall be broken — exactly the fate of the three gods smashed when the ass bolts.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 5, 'canon', '1-samuel', 5, 4, 'free', E'1 Samuel 5:4 — *And when they arose early on the morrow morning, behold, Dagon was fallen upon his face to the ground before the ark of Yahuah (LORD); and the head of Dagon and both the palms of his hands were cut off upon the threshold; only the stump of Dagon was left to him.* Dagon shatters on his own threshold as these gods shatter at a startled ass — a god that cannot stand is no god.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 5, 'canon', 'isaiah', 46, 2, 'free', E'Isaiah 46:2 — *They stoop, they bow down together; they could not deliver the burden, but themselves are gone into captivity.* The carried gods cannot even deliver themselves off the beast — Isaiah names the helplessness the camel''s groan exposes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 5, 'jasher', 'jasher', 11, 36, 'extras', E'Jasher 11:36 — *And Terah entered the room and found all the idols fallen down and broken, and the hatchet in the hand of the largest, which was not broken, and the savory meat which Abram his son had made was still before them.* Jasher''s Abraham deliberately does what the camel''s groan begins — fells and breaks Terah''s gods to prove they cannot save themselves.'),
  -- thread: apocalypse-of-abraham-2-pricing-the-broken-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 8, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* The merchants pricing broken gods are the miserable men who set their hope in dead works of men''s hands.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 8, 'canon', 'jeremiah', 10, 4, 'free', E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The very craft and material of the gods being haggled over — fastened so they will not move, yet they fell anyway.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 6, 'canon', 'acts', 17, 29, 'free', E'Acts 17:29 — *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device.* The Syrians treat gold-and-stone gods as if real; the apostle declares the offspring of Elohim must not — settling what the boy is beginning to see.'),
  -- thread: apocalypse-of-abraham-2-gods-that-sink
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 9, 'apocrypha', 'the-wisdom-of-solomon', 13, 16, 'extras', E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help:* The image that cannot help itself sinks into the river and is gone — proof in the boy''s own hands that it never could save.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 9, 'canon', 'isaiah', 44, 20, 'free', E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* The idolater cannot deliver his soul, and his god cannot deliver itself from the depths of the river Gur.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 2, 9, 'canon', 'habakkuk', 2, 19, 'free', E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* No breath is in the gods that sink into the depths and leave nothing — the woe Habakkuk pronounces, dramatized in the water.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-2-idol-makers-trade',
       E'The idol-maker''s wares: gods made to be sold',
       E'Terah the idol-maker hands the boy his stock to peddle: *And he made five other gods, and gave them to me, and commanded me to sell them outside in the street of the town.* (Apocalypse of Abraham 2:1) — gods that a man manufactures and sets out for trade. It ain''t new: the prophets already knew the house Abraham was called out of. *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* (Joshua 24:2) — Terah is named by name. Isaiah strips the trade bare: *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* (Isaiah 44:9). And the apostle carries the same word into the streets of Asia: *Moreover ye see and hear, that not alone at Ephesus, but almost throughout all Asia, this Paul hath persuaded and turned away much people, saying that they be no gods, which are made with hands:* (Acts 19:26). The system that makes gods for the market is the same system in every age; Abraham was called to walk out of it.',
       sv.verse_id, ev.verse_id, 'extras', 67025
  FROM _session253_aoa2_lookup sv, _session253_aoa2_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-2-gods-that-break',
       E'Gods that fall and break at a camel''s groan',
       E'A camel groans, a startled ass bolts, and the gods go over: *And one of their camels uttered a groan, and the ass took fright and sprang away and upset the gods, and three of them were smashed, and two were preserved.* (Apocalypse of Abraham 2:5) — gods so helpless they cannot keep their footing on an ass''s back. The Tanakh has watched idols topple before. *For from Yashar''el (Israel) was it also: the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces.* (Hosea 8:6). Dagon fell on his own threshold: *And when they arose early on the morrow morning, behold, Dagon was fallen upon his face to the ground before the ark of Yahuah (LORD); and the head of Dagon and both the palms of his hands were cut off upon the threshold; only the stump of Dagon was left to him.* (1 Samuel 5:4). And when the carved gods are loaded on the beasts, *They stoop, they bow down together; they could not deliver the burden, but themselves are gone into captivity.* (Isaiah 46:2). It ain''t new — Abraham''s own son''s hatchet does to Terah''s gods what the camel''s groan begins here: *And Terah entered the room and found all the idols fallen down and broken...* (Jasher 11:36).',
       sv.verse_id, ev.verse_id, 'extras', 67028
  FROM _session253_aoa2_lookup sv, _session253_aoa2_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-2-pricing-the-broken-gods',
       E'Haggling over broken gods: dead things they call gods',
       E'The Syrian merchants want to settle the loss and buy what is left: *Give us, at any rate, the gods that remain, and we will give thee the proper price for the broken gods, also for the gods that have been preserved.* (Apocalypse of Abraham 2:8) — men setting a market-price on gods, mourning the loss of shards. The Wisdom of the fathers pities exactly this: *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* (Wisdom of Solomon 13:10). Jeremiah shows the trade — silver, gold, nails, hammers: *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* (Jeremiah 10:4). And the apostle on Mars'' hill closes the case: *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device.* (Acts 17:29). A god you can price, break, and replace is no god at all.',
       sv.verse_id, ev.verse_id, 'extras', 67031
  FROM _session253_aoa2_lookup sv, _session253_aoa2_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-2-gods-that-sink',
       E'Gods cast into the river that cannot save themselves',
       E'The boy disposes of the wreckage in the only way fit for it: *and the three broken ones I cast into the water of the river Gur, which was at that place, and they sank into the depths, and there was nothing more of them.* (Apocalypse of Abraham 2:9) — gods that sink like stones and leave no trace, unable to lift themselves out of the water. The Wisdom of the fathers names the absurdity exactly: *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help:* (Wisdom of Solomon 13:16). Isaiah weighs the same drowning helplessness: *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* (Isaiah 44:20). And Habakkuk cries woe over the breathless wood and stone: *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* (Habakkuk 2:19). It ain''t new — a god that cannot save itself from a river was never going to save the man. So the system is dismantled and the living Elohim is found.',
       sv.verse_id, ev.verse_id, 'extras', 67034
  FROM _session253_aoa2_lookup sv, _session253_aoa2_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-2-idol-makers-trade
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah, who hands the boy the gods to sell here, is named by Joshua as an idol-server — the very house Abraham is called out of.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-idol-makers-trade'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The made gods Terah peddles are exactly the manufactured vanity Isaiah exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-idol-makers-trade'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 19:26 — *Moreover ye see and hear, that not alone at Ephesus, but almost throughout all Asia, this Paul hath persuaded and turned away much people, saying that they be no gods, which are made with hands:* What Abraham learns selling his father''s wares, the apostle preaches openly — gods made with hands are no gods.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-idol-makers-trade'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 12:2 — *And he said, "What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart..."* Jubilees gives the same young Abraham pleading with the same idol-keeping father over the same lifeless wares.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-idol-makers-trade'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-2-gods-that-break
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 8:6 — *For from Yashar''el (Israel) was it also: the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces.* What a workman made is no Elohim and shall be broken — exactly the fate of the three gods smashed when the ass bolts.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-gods-that-break'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 5:4 — *And when they arose early on the morrow morning, behold, Dagon was fallen upon his face to the ground before the ark of Yahuah (LORD); and the head of Dagon and both the palms of his hands were cut off upon the threshold; only the stump of Dagon was left to him.* Dagon shatters on his own threshold as these gods shatter at a startled ass — a god that cannot stand is no god.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-gods-that-break'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 46:2 — *They stoop, they bow down together; they could not deliver the burden, but themselves are gone into captivity.* The carried gods cannot even deliver themselves off the beast — Isaiah names the helplessness the camel''s groan exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-gods-that-break'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 11:36 — *And Terah entered the room and found all the idols fallen down and broken, and the hatchet in the hand of the largest, which was not broken, and the savory meat which Abram his son had made was still before them.* Jasher''s Abraham deliberately does what the camel''s groan begins — fells and breaks Terah''s gods to prove they cannot save themselves.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-gods-that-break'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-2-pricing-the-broken-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* The merchants pricing broken gods are the miserable men who set their hope in dead works of men''s hands.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-pricing-the-broken-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The very craft and material of the gods being haggled over — fastened so they will not move, yet they fell anyway.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-pricing-the-broken-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:29 — *Forasmuch then as we are the offspring of Elohim (God), we ought not to think that the Godhead is like unto gold, or silver, or stone, graven by art and man''s device.* The Syrians treat gold-and-stone gods as if real; the apostle declares the offspring of Elohim must not — settling what the boy is beginning to see.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-pricing-the-broken-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-2-gods-that-sink
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help:* The image that cannot help itself sinks into the river and is gone — proof in the boy''s own hands that it never could save.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-gods-that-sink'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* The idolater cannot deliver his soul, and his god cannot deliver itself from the depths of the river Gur.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-gods-that-sink'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* No breath is in the gods that sink into the depths and leave nothing — the woe Habakkuk pronounces, dramatized in the water.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa2_lookup sv, _session253_aoa2_lookup tv
 WHERE t.slug='apocalypse-of-abraham-2-gods-that-sink'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_03.sql (session253 apocalypse-of-abraham 3) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa3 (view _session253_aoa3_lookup). Sort band base 67050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-3-fathers-served-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 2, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as the idol-server, the very father whose evil deed Abraham questions in his heart at 3:2.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 3, 'apocrypha', 'the-wisdom-of-solomon', 15, 17, 'extras', E'Wisdom of Solomon 15:17 — *For being mortal, he works a dead thing with wicked hands: for he himself is better than the things which he worshippeth: whereas he lived once, but they never.* Wisdom states Abraham''s own riddle at 3:3 — the maker is greater than the made, so it is the gods who ought to worship Terah, not Terah them.'),
  -- thread: apocalypse-of-abraham-3-the-idol-that-cannot-rise
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 5, 'canon', 'isaiah', 46, 7, 'free', E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s god that cannot move from its place is Merumath who fell and could not rise until Abraham and Terah lifted him (3:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 5, 'apocrypha', 'the-wisdom-of-solomon', 13, 16, 'extras', E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The maker must keep the idol from falling because it cannot help itself — exactly Terah propping the headless Merumath at 3:5.'),
  -- thread: apocalypse-of-abraham-3-broken-gods-cannot-save
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 6, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven image is vanity and cannot profit — the five broken gods of 3:6 that could neither help themselves nor hurt the ass.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 6, 'canon', 'isaiah', 44, 10, 'free', E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* Isaiah asks why a man would form a god profitable for nothing — the very gods broken to pieces from the ass and helpless in the river at 3:6.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 6, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The makers become as lifeless as the broken fragments of 3:6 that could not even rise from the river.'),
  -- thread: apocalypse-of-abraham-3-can-a-stone-hear-prayer
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 7, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* A man prays "Deliver me" to carved wood — the empty prayer Abraham exposes when he asks how a stone could hear a man''s prayer at 3:7.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 7, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The idol cannot do good or evil and must be carried — so it cannot rescue a man or reward him, the very thing Abraham concludes at 3:7.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 3, 7, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* "A stone good for nothing" is precisely the stone Merumath whose prayer-hearing power Abraham denies at 3:7.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-fathers-served-other-gods',
       E'The fathers served other gods — Terah the idol-maker',
       E'The boy Abraham walks perplexed, his heart troubled at his father''s trade: *And I said in my heart: "What evil deed is this that my father is doing? Is not he, rather, the god of his gods, since they come into existence through his chisels and lathes, and his wisdom, and is it not rather fitting that they should worship my father, since they are his work?"* (Apocalypse of Abraham 3:2-3). It ain''t new — the Tanakh names this very house. *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2) — Terah is named, the idol-house Abraham is being called out of. And the Apocrypha turns the same lathe: *For being mortal, he works a dead thing with wicked hands: for he himself is better than the things which he worshippeth: whereas he lived once, but they never* (Wisdom of Solomon 15:17) — the maker is greater than the made, which is Abraham''s own riddle on the page.',
       sv.verse_id, ev.verse_id, 'extras', 67050
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-the-idol-that-cannot-rise',
       E'Merumath fell and could not rise — the god that needs help',
       E'Abraham watches the stone god collapse: *Behold, Merumath fell and could not rise in his own temple, nor could I, by myself, move him until my father came, and the two of us moved him; and as we were thus too weak, his head fell from him, and he set it upon another stone of another god, which he had made without head* (Apocalypse of Abraham 3:5). The prophets mocked this exact helplessness. *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble* (Isaiah 46:7) — the god must be carried, cannot move itself. And the Apocrypha names the absurdity straight: *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help* (Wisdom of Solomon 13:16) — the maker must prop up the god that cannot prop up itself, which is Merumath fallen and headless in his own temple.',
       sv.verse_id, ev.verse_id, 'extras', 67053
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-broken-gods-cannot-save',
       E'Broken gods that cannot help themselves nor hurt the ass',
       E'The five gods shatter and the ass walks free: *And the other five gods were broken in pieces down from the ass, which were able neither to help themselves, nor to hurt the ass, because it had broken them to pieces; nor did their broken fragments come up out of the river* (Apocalypse of Abraham 3:6). This is the prophets'' whole indictment. *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed* (Isaiah 44:9); *Who hath formed a god, or molten a graven image that is profitable for nothing?* (Isaiah 44:10). The psalm seals it: *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8) — a beast of burden out-survives the gods it carries, for they could neither help themselves nor rise from the river.',
       sv.verse_id, ev.verse_id, 'extras', 67056
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-3-can-a-stone-hear-prayer',
       E'Can a stone god rescue a man or hear his prayer?',
       E'Abraham reasons to the root: *And I said in my heart: "If this be so, how can Merumath, my father''s god, having the head of another stone, and himself being made of another stone, rescue a man, or hear a man''s prayer and reward him?"* (Apocalypse of Abraham 3:7). Isaiah had already exposed the prayer that goes nowhere. *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god* (Isaiah 44:17) — a man prays "Deliver me" to wood he carved. *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5) — they cannot answer, cannot save, cannot reward. The Apocrypha joins the verdict: *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand* (Wisdom of Solomon 13:10) — "a stone good for nothing," which is the stone Merumath Abraham now refuses.',
       sv.verse_id, ev.verse_id, 'extras', 67059
  FROM _session253_aoa3_lookup sv, _session253_aoa3_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-3-fathers-served-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as the idol-server, the very father whose evil deed Abraham questions in his heart at 3:2.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 15:17 — *For being mortal, he works a dead thing with wicked hands: for he himself is better than the things which he worshippeth: whereas he lived once, but they never.* Wisdom states Abraham''s own riddle at 3:3 — the maker is greater than the made, so it is the gods who ought to worship Terah, not Terah them.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-3-the-idol-that-cannot-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s god that cannot move from its place is Merumath who fell and could not rise until Abraham and Terah lifted him (3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-the-idol-that-cannot-rise'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The maker must keep the idol from falling because it cannot help itself — exactly Terah propping the headless Merumath at 3:5.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-the-idol-that-cannot-rise'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-3-broken-gods-cannot-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven image is vanity and cannot profit — the five broken gods of 3:6 that could neither help themselves nor hurt the ass.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-broken-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* Isaiah asks why a man would form a god profitable for nothing — the very gods broken to pieces from the ass and helpless in the river at 3:6.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-broken-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The makers become as lifeless as the broken fragments of 3:6 that could not even rise from the river.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-broken-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-3-can-a-stone-hear-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* A man prays "Deliver me" to carved wood — the empty prayer Abraham exposes when he asks how a stone could hear a man''s prayer at 3:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-can-a-stone-hear-prayer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The idol cannot do good or evil and must be carried — so it cannot rescue a man or reward him, the very thing Abraham concludes at 3:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-can-a-stone-hear-prayer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* "A stone good for nothing" is precisely the stone Merumath whose prayer-hearing power Abraham denies at 3:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa3_lookup sv, _session253_aoa3_lookup tv
 WHERE t.slug='apocalypse-of-abraham-3-can-a-stone-hear-prayer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_04.sql (session253 apocalypse-of-abraham 4) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa4 (view _session253_aoa4_lookup). Sort band base 67075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-4-gods-cannot-save
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* Isaiah''s verdict on the carved god is Abraham''s verdict on Terah''s wares — their power is vain (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'isaiah', 44, 10, 'free', E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* The prophet''s mocking question echoes Abraham''s: the thing the maker formed cannot profit or save him (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The idols that did not help themselves are the deaf, blind handiwork of Psalm 115 — they cannot help Terah (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Abraham''s barb that Terah is his gods'' god — *thou art their god, since thou hast made them* — is the Psalm''s warning that the maker shares the idol''s ruin (Apocalypse of Abraham 4:4).'),
  -- thread: apocalypse-of-abraham-4-the-idol-maker
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 2, 'canon', 'isaiah', 44, 12, 'free', E'Isaiah 44:12 — *The smith with the tongs both worketh in the coals, and fashioneth it with hammers, and worketh it with the strength of his arms: yea, he is hungry, and his strength faileth: he drinketh no water, and is faint.* Terah''s boast that *my work was not in vain* is the labouring smith of Isaiah — sweat poured into a thing that cannot feed him (Apocalypse of Abraham 4:2).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The maker who calls his own handiwork god is exactly Abraham''s charge — *thou art their god, since thou hast made them* (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 5, 'canon', 'jeremiah', 10, 4, 'free', E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The silver Abraham carries for the broken gods is the silver-decked idol Jeremiah describes, nailed down so it cannot fall (Apocalypse of Abraham 4:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 5, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The broken gods Abraham brokered the money for cannot move or save — Jeremiah''s helpless, carried idol (Apocalypse of Abraham 4:5).'),
  -- thread: apocalypse-of-abraham-4-fathers-served-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 6, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as an idolater — the very father whose gods Abraham rebukes (Apocalypse of Abraham 4:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 6, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Abraham''s break with his father''s gods is the hinge on which Yahuah takes him out and multiplies the seed (Apocalypse of Abraham 4:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 6, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen''s retelling of the call out of Ur frames Abraham''s rupture with Terah''s house as the start of the covenant (Apocalypse of Abraham 4:6).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-4-gods-cannot-save',
       E'Their blessing is ruination — the gods that cannot help themselves',
       E'Abraham hands Terah the silver and turns his father''s own boast back on him: *"Blessed are the gods of thee, for thou art their god, since thou hast made them; for their blessing is ruination, and their power is vain; they who did not help themselves, how shall they, then, help thee or bless me?"* (Apocalypse of Abraham 4:4). It ain''t new — this is the prophets'' indictment of the idol exactly. Isaiah laughs the same laugh: *"They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed."* (Isaiah 44:9), and *"Who hath formed a god, or molten a graven image that is profitable for nothing?"* (Isaiah 44:10). The Psalmist seals the futility: *"They have mouths, but they speak not: eyes have they, but they see not:"* (Psalm 115:5) — and the verdict that the maker shares the fate of his handiwork: *"They that make them are like unto them; so is every one that trusteth in them."* (Psalm 115:8). The young Abraham sees what Israel would later be charged to see: a god you carve cannot carry you.',
       sv.verse_id, ev.verse_id, 'extras', 67075
  FROM _session253_aoa4_lookup sv, _session253_aoa4_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-4-the-idol-maker',
       E'Because thou hast made them — the workman and his god',
       E'Terah glories in his trade: *"Blessed art thou, Abraham, of my gods, because thou hast brought the price of the gods, so that my work was not in vain."* (Apocalypse of Abraham 4:2), and Abraham fixes on the absurdity — *"Blessed are the gods of thee, for thou art their god, since thou hast made them"* (Apocalypse of Abraham 4:4). This is the very scene Isaiah dissects, the craftsman who fells a tree, burns half for warmth, and bows to the rest: *"The smith with the tongs both worketh in the coals, and fashioneth it with hammers, and worketh it with the strength of his arms: yea, he is hungry, and his strength faileth: he drinketh no water, and is faint."* (Isaiah 44:12), until *"the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god."* (Isaiah 44:17). Jeremiah names the tools Terah used — silver, nails, hammers: *"They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not."* (Jeremiah 10:4), the dumb thing that *"must needs be borne, because they cannot go."* (Jeremiah 10:5). The man bowing to what his own hands hammered is the system Abraham walks out of.',
       sv.verse_id, ev.verse_id, 'extras', 67078
  FROM _session253_aoa4_lookup sv, _session253_aoa4_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-4-fathers-served-other-gods',
       E'Your fathers served other gods — and Abraham was taken out',
       E'Abraham''s hard words against Terah''s gods — *"And when he heard my word, he became furiously angry with me, because I had spoken hard words against his gods."* (Apocalypse of Abraham 4:6) — stand at the seam of the whole story of election. Joshua tells Israel plainly where Abraham came from: *"Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods."* (Joshua 24:2), and then the call: *"And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac."* (Joshua 24:3). Stephen preaches the same call out of the idol-house: *"And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee."* (Acts 7:3). It ain''t new — the man who rejects his father''s idols is the man Yahuah calls out of Ur, and the covenant begins not with a church replacing Israel but with the seed taken from among the nations and kept.',
       sv.verse_id, ev.verse_id, 'extras', 67081
  FROM _session253_aoa4_lookup sv, _session253_aoa4_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-4-gods-cannot-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* Isaiah''s verdict on the carved god is Abraham''s verdict on Terah''s wares — their power is vain (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* The prophet''s mocking question echoes Abraham''s: the thing the maker formed cannot profit or save him (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The idols that did not help themselves are the deaf, blind handiwork of Psalm 115 — they cannot help Terah (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Abraham''s barb that Terah is his gods'' god — *thou art their god, since thou hast made them* — is the Psalm''s warning that the maker shares the idol''s ruin (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-4-the-idol-maker
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:12 — *The smith with the tongs both worketh in the coals, and fashioneth it with hammers, and worketh it with the strength of his arms: yea, he is hungry, and his strength faileth: he drinketh no water, and is faint.* Terah''s boast that *my work was not in vain* is the labouring smith of Isaiah — sweat poured into a thing that cannot feed him (Apocalypse of Abraham 4:2).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The maker who calls his own handiwork god is exactly Abraham''s charge — *thou art their god, since thou hast made them* (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The silver Abraham carries for the broken gods is the silver-decked idol Jeremiah describes, nailed down so it cannot fall (Apocalypse of Abraham 4:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The broken gods Abraham brokered the money for cannot move or save — Jeremiah''s helpless, carried idol (Apocalypse of Abraham 4:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-4-fathers-served-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as an idolater — the very father whose gods Abraham rebukes (Apocalypse of Abraham 4:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Abraham''s break with his father''s gods is the hinge on which Yahuah takes him out and multiplies the seed (Apocalypse of Abraham 4:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen''s retelling of the call out of Ur frames Abraham''s rupture with Terah''s house as the start of the covenant (Apocalypse of Abraham 4:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_05.sql (session253 apocalypse-of-abraham 5) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa5 (view _session253_aoa5_lookup). Sort band base 67100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-5-the-god-of-wood-burns
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 8, 'canon', 'isaiah', 44, 15, 'free', E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood-god of Apocalypse of Abraham 5:8 is the very thing Isaiah names — fuel called a god, kindled by the same hand that bows to it.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 11, 'canon', 'isaiah', 44, 20, 'free', E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes in Apocalypse of Abraham 5:11 is Isaiah''s deceived heart unmasked — the god is the lie in the idol-maker''s hand.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 13, 16, 'extras', E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The carpenter must fasten the idol lest it topple; in Apocalypse of Abraham 5:8 Barisat does fall backward into the fire, helpless to save even itself.'),
  -- thread: apocalypse-of-abraham-5-it-cannot-save-itself
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 16, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah the idol-maker and the ashen Barisat of Apocalypse of Abraham 5:16 are bound as one — the maker is as lifeless as what his hands have made.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 9, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* Abraham''s taunt in Apocalypse of Abraham 5:9 exposes exactly this — a god that must be carried and cannot move cannot kindle a fire or cook a meal.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 16, 'canon', 'isaiah', 46, 7, 'free', E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Barisat, burnt to dust in Apocalypse of Abraham 5:16, could not answer or save itself from the flame, let alone its worshipper.'),
  -- thread: apocalypse-of-abraham-5-fathers-served-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 18, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture names Terah the very idolater whose endless wood-gods Abraham mocks in Apocalypse of Abraham 5:18.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 13, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* While Terah blesses Merumath in Apocalypse of Abraham 5:13, the God of glory is already moving to call Abraham out of that idol-house.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 17, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* Terah''s boast in Apocalypse of Abraham 5:17 — *Great is the power of Barisat!* — is the misery the apocrypha names: hope set in dead things, the work of a maker''s hand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-5-the-god-of-wood-burns',
       E'The god of wood burned to ashes',
       E'*And it came to pass, when I had laid the splinters in the fire, in order that I might make ready food for my father — on going out to ask a question regarding the food, I placed Barisat before the kindled fire... And on returning I found Barisat fallen backwards, and his feet surrounded by fire and horribly burnt... he was gradually burnt up by the fire and reduced to ashes* (Apocalypse of Abraham 5:6,8,11). The young Abraham sees the lie with his own eyes: the same fire that was meant to cook the meal devours the god. It ain''t new — the prophets say exactly this. *He burneth part thereof in the fire... yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto* (Isaiah 44:16,15) — the selfsame wood that warms the man is called a god. *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* (Isaiah 44:20) — Barisat reduced to ashes is the prophet''s verdict made visible. And the apocrypha says it of one piece: *a crooked piece of wood, and full of knots, has carved it diligently... and fashioned it to the image of a man... For he provided for it that it might not fall, knowing that it was unable to help itself* (Wisdom of Solomon 13:13,16) — the carpenter props up what cannot stand, and Barisat fell backward into the flame.',
       sv.verse_id, ev.verse_id, 'extras', 67100
  FROM _session253_aoa5_lookup sv, _session253_aoa5_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-5-it-cannot-save-itself',
       E'It cannot save — not even itself',
       E'Abraham''s mocking taunt cuts to the root: *Truly, Barisat, thou canst kindle the fire and cook food!* (Apocalypse of Abraham 5:9) — and *He is burnt to ashes in the violence of the fire and is reduced to dust* (5:16). A god that cannot deliver itself from the flame can deliver no one. It ain''t new — the psalm and the prophet say the same of every idol of men''s hands. *They have mouths, but they speak not... They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:5,8). *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5). And Isaiah''s word lands precisely: *one shall cry unto him, yet can he not answer, nor save him out of his trouble* (Isaiah 46:7) — Barisat could not so much as keep its own feet from the fire.',
       sv.verse_id, ev.verse_id, 'extras', 67103
  FROM _session253_aoa5_lookup sv, _session253_aoa5_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-5-fathers-served-other-gods',
       E'Terah the idol-maker — your fathers served other gods',
       E'Terah blesses his god Merumath, and is content to *make another to-day* when Barisat is gone: *Great is the power of Barisat! I will make another to-day, and to-morrow he will prepare my food* (Apocalypse of Abraham 5:17-18). The father who carves gods cannot grieve their death — he simply carves more. It ain''t new — the LORD names Terah by name as the idolater out of whom Abraham was called. *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). And the calling-out follows: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2) — the One living Elohim breaks into the idol-maker''s house. The apocrypha frames the whole tragedy: *miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands* (Wisdom of Solomon 13:10).',
       sv.verse_id, ev.verse_id, 'extras', 67106
  FROM _session253_aoa5_lookup sv, _session253_aoa5_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-5-the-god-of-wood-burns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood-god of Apocalypse of Abraham 5:8 is the very thing Isaiah names — fuel called a god, kindled by the same hand that bows to it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-the-god-of-wood-burns'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes in Apocalypse of Abraham 5:11 is Isaiah''s deceived heart unmasked — the god is the lie in the idol-maker''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-the-god-of-wood-burns'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The carpenter must fasten the idol lest it topple; in Apocalypse of Abraham 5:8 Barisat does fall backward into the fire, helpless to save even itself.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-the-god-of-wood-burns'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-5-it-cannot-save-itself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah the idol-maker and the ashen Barisat of Apocalypse of Abraham 5:16 are bound as one — the maker is as lifeless as what his hands have made.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-it-cannot-save-itself'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* Abraham''s taunt in Apocalypse of Abraham 5:9 exposes exactly this — a god that must be carried and cannot move cannot kindle a fire or cook a meal.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-it-cannot-save-itself'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Barisat, burnt to dust in Apocalypse of Abraham 5:16, could not answer or save itself from the flame, let alone its worshipper.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-it-cannot-save-itself'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-5-fathers-served-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture names Terah the very idolater whose endless wood-gods Abraham mocks in Apocalypse of Abraham 5:18.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* While Terah blesses Merumath in Apocalypse of Abraham 5:13, the God of glory is already moving to call Abraham out of that idol-house.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* Terah''s boast in Apocalypse of Abraham 5:17 — *Great is the power of Barisat!* — is the misery the apocrypha names: hope set in dead things, the work of a maker''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_06.sql (session253 apocalypse-of-abraham 6) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa6 (view _session253_aoa6_lookup). Sort band base 67125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-6-stone-cannot-be-renewed
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 5, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture itself records that Abraham''s rebuke in 6:5 was aimed at the very idolatry of Terah''s house.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 7, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The stone Merumath of 6:7 is the Psalm''s dumb, blind idol, unable to renew even itself.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 7, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah is made foolish (6:5) by the lifeless thing he trusts, exactly as the Psalm warns.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 7, 'canon', 'jeremiah', 10, 8, 'free', E'Jeremiah 10:8 — *But they are altogether brutish and foolish: the stock is a doctrine of vanities.* The broken stone that cannot be renewed (6:7) is Jeremiah''s vain stock, a doctrine of nothing.'),
  -- thread: apocalypse-of-abraham-6-barisat-hewn-from-the-tree
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'canon', 'isaiah', 44, 14, 'free', E'Isaiah 44:14 — *He heweth him down cedars, and taketh the cypress and the oak, which he strengtheneth for himself among the trees of the forest: he planteth an ash, and the rain doth nourish it.* The living tree Abraham mourns in 6:10 is Isaiah''s forest cedar, nourished by rain before the axe.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'canon', 'isaiah', 44, 15, 'free', E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The same wood that warms and bakes is hewn into Barisat the god (6:10), the prophet''s exact absurdity.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'canon', 'jeremiah', 10, 3, 'free', E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abraham''s axe in 6:10 is Jeremiah''s axe; the custom of cutting a god from a tree is one and the same vanity.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 10, 'apocrypha', 'the-wisdom-of-solomon', 13, 13, 'extras', E'Wisdom of Solomon 13:13 — *And taking the very refuse among those which served to no use, being a crooked piece of wood, and full of knots, has carved it diligently, when he had nothing else to do, and formed it by the skill of his understanding, and fashioned it to the image of a man;* Barisat made into a god by Terah''s art (6:10) is the carpenter''s refuse-wood shaped into a deity, the same witness in the deuterocanon.'),
  -- thread: apocalypse-of-abraham-6-burnt-to-ashes-no-helper
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 11, 'canon', 'isaiah', 44, 20, 'free', E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes (6:11) is the very ash the deceived heart feeds on, unable to deliver a single soul.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 11, 'canon', 'habakkuk', 2, 18, 'free', E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abraham''s burnt and profitless Barisat (6:11) is the prophet''s dumb idol that profits the maker nothing.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 1, 'canon', 'isaiah', 44, 2, 'free', E'Isaiah 44:2 — *Thus saith Yahuah (LORD) that made thee, and formed thee from the womb, which will help thee; Fear not, O Jacob, my servant; and thou, Jesurun, whom I have chosen.* Against the statue that cannot help his father (6:1), Isaiah sets the Maker who forms from the womb and truly helps.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 1, 'apocrypha', 'the-wisdom-of-solomon', 13, 16, 'extras', E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help:* Abraham''s question whether the statue can help his father (6:1) is answered in the deuterocanon: the image cannot help itself, let alone anyone.'),
  -- thread: apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 5, 'canon', 'romans', 1, 22, 'free', E'Romans 1:22 — *Professing themselves to be wise, they became fools,* Terah, foolish in his mind for praising a god he carved (6:5), is Paul''s wise man turned fool by his own idols.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 5, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The folly Abraham exposes in 6:5 is the exchange of the living glory for a corruptible carved image.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 6, 2, 'canon', 'isaiah', 44, 18, 'free', E'Isaiah 44:18 — *They have not known nor understood: for he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand.* The spirit handed over to folly and ignorance (6:2) is Isaiah''s shut-eyed, uncomprehending heart of the idolater.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-stone-cannot-be-renewed',
       E'The stone-god that cannot be renewed',
       E'Abraham turns to his idol-maker father and names the lie outright: *O father Terah, whichever of these thou praisest as a god, thou art foolish in thy mind* (Apocalypse of Abraham 6:5) — for *if your god Merumath is changed or broken, he will not be renewed, because he is a stone* (6:7). It ain''t new. Joshua, generations later, names the very house this came out of: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). The Psalm has already weighed Merumath and found him deaf: *Their idols are silver and gold, the work of men''s hands. They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:4-5) — *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). And the prophet calls the stock by its true name: *the stock is a doctrine of vanities* (Jeremiah 10:8). The young Abraham sees what the elders forgot: a god that cannot mend itself cannot mend you.',
       sv.verse_id, ev.verse_id, 'extras', 67125
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-barisat-hewn-from-the-tree',
       E'Barisat, the god hewn out of the living tree',
       E'Abraham traces Barisat back to the forest he came from: *But thy god Barisat, while he was still, before he had been prepared, rooted up upon the earth and was great and wonderful with the glory of branches and blossom, thou didst hew out with the axe, and by means of thy art he hath been made into a god* (Apocalypse of Abraham 6:10). This is Isaiah''s mockery of the idol-maker drawn to the life: *He heweth him down cedars, and taketh the cypress and the oak... he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto* (Isaiah 44:14-15). Jeremiah saw the same axe: *one cutteth a tree out of the forest, the work of the hands of the workman, with the axe* (Jeremiah 10:3). And the deuterocanon tells Barisat''s story almost word for word — the carpenter who *taking the very refuse among those which served to no use, being a crooked piece of wood... formed it by the skill of his understanding, and fashioned it to the image of a man* (Wisdom of Solomon 13:13). It ain''t new: a thing of branches and blossom, alive in the field, is killed by the axe and called a god.',
       sv.verse_id, ev.verse_id, 'extras', 67128
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-burnt-to-ashes-no-helper',
       E'Burnt to ashes, and no more — the god who cannot save',
       E'The speech ends where every idol ends: *he, Barisat himself, is burnt up by fire and reduced to ashes and is no more* (Apocalypse of Abraham 6:11) — and Abraham had already asked the question this answers: *How then can that which is made by him — manufactured statues — be a helper of my father?* (6:1). Isaiah feeds the same fire and weighs the same ash-heart: *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* (Isaiah 44:20). Habakkuk pronounces the woe: *What profiteth the graven image that the maker thereof hath graven it... to make dumb idols?* (Habakkuk 2:18). And the deuterocanon says plainly what Barisat could never do — the idol *was unable to help itself; for it is an image, and has need of help* (Wisdom of Solomon 13:16). It ain''t new: the made thing burns, but the One who *made thee, and formed thee from the womb* (Isaiah 44:2) is the living Elohim who alone can help.',
       sv.verse_id, ev.verse_id, 'extras', 67131
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater',
       E'Professing wisdom, the idolater becomes a fool',
       E'Abraham''s whole charge rests on one diagnosis of the mind: *whichever of these thou praisest as a god, thou art foolish in thy mind* (Apocalypse of Abraham 6:5), grieving that *the body then be subject to its soul, and the soul to the spirit, and the spirit to folly and ignorance* (6:2). Paul names this same descent of the heathen mind: *Professing themselves to be wise, they became fools* (Romans 1:22), who *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man* (Romans 1:23). The prophet diagnoses the blinded craftsman: *They have not known nor understood: for he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand* (Isaiah 44:18). It ain''t new: idolatry is first a darkening of the mind — the spirit handed over to folly — and Abraham, the youngest in the house, is the only one who has not been blinded.',
       sv.verse_id, ev.verse_id, 'extras', 67134
  FROM _session253_aoa6_lookup sv, _session253_aoa6_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-6-stone-cannot-be-renewed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture itself records that Abraham''s rebuke in 6:5 was aimed at the very idolatry of Terah''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The stone Merumath of 6:7 is the Psalm''s dumb, blind idol, unable to renew even itself.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah is made foolish (6:5) by the lifeless thing he trusts, exactly as the Psalm warns.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:8 — *But they are altogether brutish and foolish: the stock is a doctrine of vanities.* The broken stone that cannot be renewed (6:7) is Jeremiah''s vain stock, a doctrine of nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-stone-cannot-be-renewed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-6-barisat-hewn-from-the-tree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:14 — *He heweth him down cedars, and taketh the cypress and the oak, which he strengtheneth for himself among the trees of the forest: he planteth an ash, and the rain doth nourish it.* The living tree Abraham mourns in 6:10 is Isaiah''s forest cedar, nourished by rain before the axe.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The same wood that warms and bakes is hewn into Barisat the god (6:10), the prophet''s exact absurdity.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abraham''s axe in 6:10 is Jeremiah''s axe; the custom of cutting a god from a tree is one and the same vanity.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 13:13 — *And taking the very refuse among those which served to no use, being a crooked piece of wood, and full of knots, has carved it diligently, when he had nothing else to do, and formed it by the skill of his understanding, and fashioned it to the image of a man;* Barisat made into a god by Terah''s art (6:10) is the carpenter''s refuse-wood shaped into a deity, the same witness in the deuterocanon.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-barisat-hewn-from-the-tree'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-6-burnt-to-ashes-no-helper
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes (6:11) is the very ash the deceived heart feeds on, unable to deliver a single soul.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abraham''s burnt and profitless Barisat (6:11) is the prophet''s dumb idol that profits the maker nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:2 — *Thus saith Yahuah (LORD) that made thee, and formed thee from the womb, which will help thee; Fear not, O Jacob, my servant; and thou, Jesurun, whom I have chosen.* Against the statue that cannot help his father (6:1), Isaiah sets the Maker who forms from the womb and truly helps.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help:* Abraham''s question whether the statue can help his father (6:1) is answered in the deuterocanon: the image cannot help itself, let alone anyone.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-burnt-to-ashes-no-helper'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:22 — *Professing themselves to be wise, they became fools,* Terah, foolish in his mind for praising a god he carved (6:5), is Paul''s wise man turned fool by his own idols.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The folly Abraham exposes in 6:5 is the exchange of the living glory for a corruptible carved image.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:18 — *They have not known nor understood: for he hath shut their eyes, that they cannot see; and their hearts, that they cannot understand.* The spirit handed over to folly and ignorance (6:2) is Isaiah''s shut-eyed, uncomprehending heart of the idolater.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa6_lookup sv, _session253_aoa6_lookup tv
 WHERE t.slug='apocalypse-of-abraham-6-the-foolish-mind-of-the-idolater'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_07.sql (session253 apocalypse-of-abraham 7) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa7 (view _session253_aoa7_lookup). Sort band base 67150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-7-fire-water-no-god
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 2, 'apocrypha', 'the-wisdom-of-solomon', 13, 2, 'extras', E'Wisdom of Solomon 13:2 — *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* The Apocrypha names the very ladder Abraham climbs in 7:2 — fire, water, the stars — and calls it the error of those who mistook creature for Creator.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 3, 'apocrypha', 'the-wisdom-of-solomon', 13, 4, 'extras', E'Wisdom of Solomon 13:4 — *But if they were astonished at their power and virtue, let them understand by them, how much mightier he is that made them.* Abraham''s refusal to call water ''Elohim'' because it is subject to the earth (7:3) is the same reasoning: the power of a thing points past it to the One who made it mightier still.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 1, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* What is subjected and perishable, as Abraham says of fire in 7:1, cannot answer or save — the same indictment the Psalm lays on every idol.'),
  -- thread: apocalypse-of-abraham-7-sun-moon-stars-not-god
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 8, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abraham''s refusal to call moon or stars god (7:8) is the very fence Moses sets — the host of heaven serves, it is not served.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 6, 'canon', 'genesis', 1, 16, 'free', E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun Abraham honours but will not worship (7:6) is a made thing, ruled and set in place by the One who made it.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 7, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The sun whose course is obscured by night and cloud (7:7) profits no more than the carved idol — both are vanity beside the Maker.'),
  -- thread: apocalypse-of-abraham-7-terah-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 9, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abraham''s address to Terah in 7:9 stands at the exact hinge Joshua names — the father served other gods; the son will make known the One who made everything.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 9, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call where this chapter sets it — in Abraham''s homeland among the idols, before the going out, the same Elohim Abraham proclaims to Terah in 7:9.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 9, 'canon', 'jeremiah', 10, 10, 'free', E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The ''Elohim who hath made everything'' that Abraham names in 7:9 is Jeremiah''s living and true Elohim, set against the gods that did not make the heavens.'),
  -- thread: apocalypse-of-abraham-7-maker-of-all
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 12, 'canon', 'genesis', 1, 9, 'free', E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* Abraham''s praise that the Maker ''hath made the earth dry in the midst of many waters'' (7:12) recites the third day of Genesis word for deed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 12, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The crimsoned heavens and golden sun Abraham points to in 7:12 are the very handywork the Psalm says declares the Maker''s glory.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 7, 13, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Abraham''s plea that Elohim reveal Himself through Himself (7:13) meets Paul''s word that the made things already make Him clearly seen.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-fire-water-no-god',
       E'Fire and water are not gods — the elements are subjected',
       E'Young Abraham reasons his way up the ladder of the elements and finds every one of them subject to another: *Behold, the fire is more worthy of honour than all things formed, because even that which is not subjected is subjected unto it, and things easily perishable are mocked by its flames.* (Apocalypse of Abraham 7:1) — *But even more worthy of honour is the water, because it conquereth the fire and satisfieth the earth.* (Apocalypse of Abraham 7:2) — *But even it I do not call Elohim (God), because it is subjected to the earth under which the water inclineth.* (Apocalypse of Abraham 7:3). It ain''t new: the same dismantling stands in the Apocrypha, where the men who mistook the elements for the powers that rule the world are answered — *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* (Wisdom of Solomon 13:2) — *But if they were astonished at their power and virtue, let them understand by them, how much mightier he is that made them.* (Wisdom of Solomon 13:4). A thing that can be conquered cannot save: *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5). The system of carved and elemental gods is taken apart; only the Maker stands.',
       sv.verse_id, ev.verse_id, 'extras', 67150
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-sun-moon-stars-not-god',
       E'Nor sun, nor moon, nor stars — the host of heaven obscured',
       E'Abraham climbs past the earth to the lights of the sky, and finds even these fail: *I call the sun more worthy of honour than the earth, because it with its rays illumineth the whole world and the different atmospheres.* (Apocalypse of Abraham 7:6) — *But even it I do not call god, because at night and by clouds its course is obscured.* (Apocalypse of Abraham 7:7) — *Nor, again, do I call the moon or the stars god, because they also in their season obscure their light at night.* (Apocalypse of Abraham 7:8). The Torah set this same fence: *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* (Deuteronomy 4:19). For the lights were made — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* (Genesis 1:16) — and a made thing is no god. It ain''t new: Abraham reaches by reason what Moses commands by covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67153
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-terah-other-gods',
       E'Hear, Terah my father — the call out of the fathers'' gods',
       E'Abraham turns from the elements to address the idol-maker himself: *But hear this, Terah my father; for I will make known to thee the Elohim (God) who hath made everything, not these we consider as gods.* (Apocalypse of Abraham 7:9). This is the household of Joshua''s witness — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* (Joshua 24:2) — and the scene Stephen preaches — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2). The living Elohim is the One who makes and is not made: *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king* (Jeremiah 10:10). The system of the fathers'' gods is left behind; the call out of Ur begins in this very rebuke.',
       sv.verse_id, ev.verse_id, 'extras', 67156
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-7-maker-of-all',
       E'Who hath crimsoned the heavens — the Maker of everything revealed',
       E'Abraham''s argument arrives at its end: only the Maker is worthy, and only He can reveal Himself. *Who hath crimsoned the heavens, and made the sun golden, and the moon lustrous, and with it the stars; and hath made the earth dry in the midst of many waters, and set thee in the world.* (Apocalypse of Abraham 7:12) — *Yet may Elohim (God) reveal Himself to us through Himself!* (Apocalypse of Abraham 7:13). This is Genesis'' own order of creation — the lights set, the dry land drawn out of the waters: *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* (Genesis 1:9). The heavens themselves preach the Maker — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1) — and Paul says the witness is plain — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made* (Romans 1:20). It ain''t new: from the made things Abraham reasons to the One who must reveal Himself, through Himself.',
       sv.verse_id, ev.verse_id, 'extras', 67159
  FROM _session253_aoa7_lookup sv, _session253_aoa7_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=7 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-7-fire-water-no-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 13:2 — *But deemed either fire, or wind, or the swift air, or the circle of the stars, or the violent water, or the lights of heaven, to be the gods which govern the world.* The Apocrypha names the very ladder Abraham climbs in 7:2 — fire, water, the stars — and calls it the error of those who mistook creature for Creator.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-fire-water-no-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 13:4 — *But if they were astonished at their power and virtue, let them understand by them, how much mightier he is that made them.* Abraham''s refusal to call water ''Elohim'' because it is subject to the earth (7:3) is the same reasoning: the power of a thing points past it to the One who made it mightier still.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-fire-water-no-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* What is subjected and perishable, as Abraham says of fire in 7:1, cannot answer or save — the same indictment the Psalm lays on every idol.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-fire-water-no-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-7-sun-moon-stars-not-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abraham''s refusal to call moon or stars god (7:8) is the very fence Moses sets — the host of heaven serves, it is not served.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-sun-moon-stars-not-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:16 — *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also.* The sun Abraham honours but will not worship (7:6) is a made thing, ruled and set in place by the One who made it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-sun-moon-stars-not-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The sun whose course is obscured by night and cloud (7:7) profits no more than the carved idol — both are vanity beside the Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-sun-moon-stars-not-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-7-terah-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abraham''s address to Terah in 7:9 stands at the exact hinge Joshua names — the father served other gods; the son will make known the One who made everything.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-terah-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call where this chapter sets it — in Abraham''s homeland among the idols, before the going out, the same Elohim Abraham proclaims to Terah in 7:9.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-terah-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The ''Elohim who hath made everything'' that Abraham names in 7:9 is Jeremiah''s living and true Elohim, set against the gods that did not make the heavens.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-terah-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-7-maker-of-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* Abraham''s praise that the Maker ''hath made the earth dry in the midst of many waters'' (7:12) recites the third day of Genesis word for deed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-maker-of-all'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The crimsoned heavens and golden sun Abraham points to in 7:12 are the very handywork the Psalm says declares the Maker''s glory.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-maker-of-all'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* Abraham''s plea that Elohim reveal Himself through Himself (7:13) meets Paul''s word that the made things already make Him clearly seen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa7_lookup sv, _session253_aoa7_lookup tv
 WHERE t.slug='apocalypse-of-abraham-7-maker-of-all'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

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

-- ----- fragment: minion_apocalypseofabraham_09.sql (session253 apocalypse-of-abraham 9) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa9 (view _session253_aoa9_lookup). Sort band base 67200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-9-the-covenant-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 5, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five creatures of Apocalypse of Abraham 9:5 are the very beasts Yahuah names for the covenant sacrifice in Genesis — it ain''t new.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 5, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The pure sacrifice Abraham is told to set forth in 9:5 is the covenant between the pieces, sealed by the burning lamp that passes through them.'),
  -- thread: apocalypse-of-abraham-9-fear-not-i-am-thy-shield
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 4, 'canon', 'genesis', 15, 1, 'free', E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not... I am a shield over thee'' of Apocalypse of Abraham 9:3-4 is the opening of the same covenant vision in Genesis.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 4, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The Helper of 9:4 is the same upholding right hand spoken over Abraham''s chosen seed in Isaiah.'),
  -- thread: apocalypse-of-abraham-9-named-my-friend
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'isaiah', 41, 8, 'free', E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The ''I have named thee my Friend'' of 9:6 is the prophet''s own title for Abraham, carried down to his chosen seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', '2-chronicles', 20, 7, 'free', E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads at the throne the very friend-name Abraham is given in 9:6.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'james', 2, 23, 'free', E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The apostle confirms the same name spoken over Abraham in 9:6 — it ain''t new.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'john', 15, 15, 'free', E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* The friend-naming of Abraham in 9:6 — to whom the ages are made known — is the pattern the Master extends to His own, making all things known to friends.'),
  -- thread: apocalypse-of-abraham-9-the-ages-to-come-shewn
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The ''ages to come'' laid before Abraham in 9:6 are the very foretelling joined to the Genesis covenant — what shall come to pass upon the seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''great things which thou hast not seen hitherto'' of 9:6 begin with the seed beyond numbering shown at the same sacrifice.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The ages ''which shall come to pass'' shewn Abraham in 9:7 are seen by the same faith that calls the not-yet as though it already were.'),
  -- thread: apocalypse-of-abraham-9-go-forth-to-the-place-shewn
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The ''place which I will shew thee'' of 9:7 echoes the first call out of Ur — the land Yahuah shews and does not yet name.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen rehearses the same shew-thee call before the council — the appointed place Abraham is sent to in 9:7 is the calling out itself.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who bears the Name (the Yahoel of this Apocalypse) brings to the prepared place — the very mountain Abraham is told to go up to in 9:7.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The Word by which Yahuah shews Abraham the ages in 9:7 is borne by the angel in whom the Name dwells — the Name-bearing guide of the called-out man.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-the-covenant-sacrifice',
       E'The heifer, the goat, the ram, the turtledove and the pigeon',
       E'The voice commands the very offering of the covenant between the pieces: *Go, take me a young heifer of three years old, and a she-goat of three years old, and a ram of three years old, and a turtledove and a pigeon, and bring me a pure sacrifice* (Apocalypse of Abraham 9:5). It ain''t new — it is Genesis word for word: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9). And the smoking furnace that passed between the pieces sealed the covenant: *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17). The same beasts, the same Abraham, the same cutting of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67200
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-fear-not-i-am-thy-shield',
       E'Fear not — I am a shield over thee',
       E'The voice that calls Abraham twice steadies him: *fear not, for I am before the worlds, and a mighty Elohim (God) who hath created the light of the world* (Apocalypse of Abraham 9:3), *I am a shield over thee, and I am thy helper* (Apocalypse of Abraham 9:4). It ain''t new — this is the opening of the covenant vision: *Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1). The shield-word stands over Abraham''s seed forever: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee* (Isaiah 41:10). The same fear-not, the same shield, the same Helper.',
       sv.verse_id, ev.verse_id, 'extras', 67203
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-named-my-friend',
       E'I have named thee my Friend',
       E'The voice tells Abraham why this vision is given him: *because thou hast loved to search me out, and I have named thee my Friend* (Apocalypse of Abraham 9:6). It ain''t new — the title rings through the whole library. The prophet calls him so: *the seed of Abraham my friend* (Isaiah 41:8). Jehoshaphat pleads it before the throne: *gavest it to the seed of Abraham thy friend for ever* (2 Chronicles 20:7). The apostle seals it: *and he was called the Friend of Elohim (God)* (James 2:23). And the Master turns the name toward His own: *Henceforth I call you not servants... but I have called you friends* (John 15:15). The friendship of Abraham is the pattern of all who are called out.',
       sv.verse_id, ev.verse_id, 'extras', 67206
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-the-ages-to-come-shewn',
       E'In this sacrifice I will lay before thee the ages to come',
       E'Upon the covenant offering the unseen things are unveiled: *And in this sacrifice I will lay before thee the ages (to come), and make known to thee what is reserved, and thou shalt see great things which thou hast not seen hitherto* (Apocalypse of Abraham 9:6); *there I will shew thee the ages which have been created and established... and I will make known to thee what shall come to pass in them on those who have done evil and practised righteousness* (Apocalypse of Abraham 9:7). It ain''t new — Genesis joins the cutting of the covenant to the long foretelling of what shall befall the seed: *Know of a surety that thy seed shall be a stranger in a land that is not theirs... and afterward shall they come out with great substance* (Genesis 15:13-14). And the same Abraham was shown the seed beyond numbering: *Look now toward heaven, and tell the stars, if thou be able to number them... So shall thy seed be* (Genesis 15:5); the apostle names this the faith that *calleth those things which be not as though they were* (Romans 4:17). The sacrifice opens the scroll of the ages.',
       sv.verse_id, ev.verse_id, 'extras', 67209
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-go-forth-to-the-place-shewn',
       E'Set forth for me the sacrifice in the place which I will shew thee',
       E'The fast of forty days ends with a journey to an appointed mountain: *then set forth for me the sacrifice which I have commanded thee, in the place which I will shew thee, on a high mountain* (Apocalypse of Abraham 9:7). It ain''t new — this is the call out of the land, to a place not yet named: *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). Stephen rehearses it before the council: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia* (Acts 7:2), *come into the land which I shall shew thee* (Acts 7:3). And the One who brings to the prepared place is the angel who bears the Name — the same Yahoel who will lead Abraham up: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared... for my name is in him* (Exodus 23:20-21). The called-out man is led by the Name to the place the Name appoints.',
       sv.verse_id, ev.verse_id, 'extras', 67212
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-9-the-covenant-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five creatures of Apocalypse of Abraham 9:5 are the very beasts Yahuah names for the covenant sacrifice in Genesis — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The pure sacrifice Abraham is told to set forth in 9:5 is the covenant between the pieces, sealed by the burning lamp that passes through them.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-fear-not-i-am-thy-shield
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not... I am a shield over thee'' of Apocalypse of Abraham 9:3-4 is the opening of the same covenant vision in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-fear-not-i-am-thy-shield'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The Helper of 9:4 is the same upholding right hand spoken over Abraham''s chosen seed in Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-fear-not-i-am-thy-shield'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-named-my-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The ''I have named thee my Friend'' of 9:6 is the prophet''s own title for Abraham, carried down to his chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads at the throne the very friend-name Abraham is given in 9:6.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The apostle confirms the same name spoken over Abraham in 9:6 — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* The friend-naming of Abraham in 9:6 — to whom the ages are made known — is the pattern the Master extends to His own, making all things known to friends.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-the-ages-to-come-shewn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The ''ages to come'' laid before Abraham in 9:6 are the very foretelling joined to the Genesis covenant — what shall come to pass upon the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-ages-to-come-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''great things which thou hast not seen hitherto'' of 9:6 begin with the seed beyond numbering shown at the same sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-ages-to-come-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The ages ''which shall come to pass'' shewn Abraham in 9:7 are seen by the same faith that calls the not-yet as though it already were.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-ages-to-come-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-go-forth-to-the-place-shewn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The ''place which I will shew thee'' of 9:7 echoes the first call out of Ur — the land Yahuah shews and does not yet name.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen rehearses the same shew-thee call before the council — the appointed place Abraham is sent to in 9:7 is the calling out itself.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who bears the Name (the Yahoel of this Apocalypse) brings to the prepared place — the very mountain Abraham is told to go up to in 9:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The Word by which Yahuah shews Abraham the ages in 9:7 is borne by the angel in whom the Name dwells — the Name-bearing guide of the called-out man.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_10.sql (session253 apocalypse-of-abraham 10) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa10 (view _session253_aoa10_lookup). Sort band base 67225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-10-friend-of-god
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 3, 'canon', 'james', 2, 23, 'free', E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The angel hails Abraham by the very name Scripture gives him in apocalypse-of-abraham 10:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 3, 'canon', '2-chronicles', 20, 7, 'free', E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads the same friendship the angel speaks over Abraham in apocalypse-of-abraham 10:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 4, 'canon', 'isaiah', 41, 8, 'free', E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The Creator who loveth Abraham (apocalypse-of-abraham 10:4) carries that love into the chosen seed of Israel.'),
  -- thread: apocalypse-of-abraham-10-the-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 6, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Jaoel is a power by virtue of the ineffable Name dwelling in him (apocalypse-of-abraham 10:6) — the Name-bearing Angel of Exodus.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 11, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* As that Angel brings Israel to the prepared place, Jaoel is sent to bring Abraham to the land prepared for him in apocalypse-of-abraham 10:11.'),
  -- thread: apocalypse-of-abraham-10-cherubim-leviathan-hades
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 7, 'canon', 'ezekiel', 1, 13, 'free', E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The living creatures of the Cherubim Jaoel restrains (apocalypse-of-abraham 10:7) are the fiery beasts of Ezekiel''s chariot.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 8, 'canon', 'isaiah', 27, 1, 'free', E'Isaiah 27:1 — *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent, even leviathan that crooked serpent; and he shall slay the dragon that is in the sea.* The Leviathan subject to Jaoel''s restraint (apocalypse-of-abraham 10:8) is the very dragon Yahuah judges.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 8, 'canon', 'psalms', 74, 14, 'free', E'Psalm 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* The menace of Leviathan that bows to His command (apocalypse-of-abraham 10:8) is the head Yahuah has already broken.'),
  -- thread: apocalypse-of-abraham-10-burn-the-idol-house
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah''s idolatrous house, marked for burning in apocalypse-of-abraham 10:10, is named outright in Israel''s own record.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The dead idols Terah reveres (apocalypse-of-abraham 10:10) are the very vanity Isaiah exposes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'canon', 'isaiah', 44, 15, 'free', E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood that becomes a worshipped god is fit only for the fire that consumes the idol-house in apocalypse-of-abraham 10:10.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The corrupting reverence for dead idols burned away in apocalypse-of-abraham 10:10 is the same Azazel-system whose works defile the earth.'),
  -- thread: apocalypse-of-abraham-10-fulfil-the-sacrifices
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 15, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The sacrifices Jaoel commands Abraham to fulfil (apocalypse-of-abraham 10:15) are the exact heifer, goat, ram, turtledove and pigeon of the Genesis covenant.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 16, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The generation prepared to spring from Abraham (apocalypse-of-abraham 10:16) is the innumerable seed shown as the stars.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 11, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The land the Eternal One hath prepared, for which Jaoel comes (apocalypse-of-abraham 10:11), is the land of the first calling-out.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-friend-of-god',
       E'Abraham, Friend of Elohim, raised and strengthened',
       E'Abraham lies on the earth as a stone, and the angel grasps him: *And the angel came, whom He had sent to me, in the likeness of a man, and grasped me by my right hand, and set me up upon my feet, and said to me: "Stand up, Abraham, Friend of Elohim (God) who loveth thee; let not the trembling of man seize thee!* It ain''t new — the title belongs to the whole witness. *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God)* (James 2:23); *Art not thou our Elohim (God)... and gavest it to the seed of Abraham thy friend for ever?* (2 Chronicles 20:7); *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend* (Isaiah 41:8). The friendship reaches the elect seed, not a church replacing them.',
       sv.verse_id, ev.verse_id, 'extras', 67225
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-the-name-bearing-angel',
       E'Jaoel — the angel in whom is the ineffable Name',
       E'The angel names himself by the Name he carries: *I am called Jaoel by Him who moveth that which existeth with me on the seventh expanse upon the firmament, a power in virtue of the ineffable Name that is dwelling in me.* It ain''t new — this is the Angel of Exodus: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20); *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). The same Name dwells in the angel sent to bless Abraham — *I have been sent to bless thee now, and the land which the Eternal One... hath prepared for thee* — and the prepared place answers the prepared land.',
       sv.verse_id, ev.verse_id, 'extras', 67228
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-cherubim-leviathan-hades',
       E'Restraining the living creatures, the Leviathan, and Hades',
       E'Jaoel recounts his charge over the powers of the throne and the deep: *I am the one who hath been given to restrain, according to His commandment, the threatening attack of the living creatures of the Cherubim against one another, and to teach those who carry Him the song of the seventh hour of the night of man* — *I am ordained to restrain the Leviathan, for unto me are subject the attack and menace of every single reptile* — *I am he who hath been commissioned to loosen Hades, to destroy him who stareth at the dead.* It ain''t new — the living creatures are Ezekiel''s: *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps... and out of the fire went forth lightning* (Ezekiel 1:13). And the Leviathan is the dragon Yahuah alone subdues: *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent... and he shall slay the dragon that is in the sea* (Isaiah 27:1); *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness* (Psalm 74:14).',
       sv.verse_id, ev.verse_id, 'extras', 67231
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-burn-the-idol-house',
       E'Set on fire thy father''s house — the dead idols cannot save',
       E'Jaoel declares his commission against Terah''s idolatry: *I am the one who was commissioned to set on fire thy father''s house together with him, because he displayed reverence for dead idols.* It ain''t new — the fathers served other gods, and the system burns: *And Joshua said unto all the people... Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). The idol-maker is exposed as vanity — *They that make a graven image are all of them vanity... they see not, nor know; that they may be ashamed* (Isaiah 44:9) — wood for the fire he bows to: *Then shall it be for a man to burn... yea, he maketh a god, and worshippeth it* (Isaiah 44:15). The dead idols cannot save; the system is dismantled, and Abraham is called out of it. So too the corrupting works traced to Azazel: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin* (1 Enoch 10:8).',
       sv.verse_id, ev.verse_id, 'extras', 67234
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-fulfil-the-sacrifices',
       E'Go, fulfil the sacrifices commanded — the land and the seed',
       E'The angel sends Abraham to the covenant offering and to the seed to come: *Go, fulfil the sacrifices commanded* — *For, lo, I have been appointed to be with thee and with the generation prepared to spring from thee; and with me Michael blesseth thee for ever.* It ain''t new — this is the cutting of the covenant in Genesis 15: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9); and the prepared generation is the promised seed as the stars — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars... So shall thy seed be* (Genesis 15:5). The call to fulfil the sacrifice answers the first call out: *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1).',
       sv.verse_id, ev.verse_id, 'extras', 67237
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=15
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-10-friend-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The angel hails Abraham by the very name Scripture gives him in apocalypse-of-abraham 10:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-friend-of-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads the same friendship the angel speaks over Abraham in apocalypse-of-abraham 10:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-friend-of-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The Creator who loveth Abraham (apocalypse-of-abraham 10:4) carries that love into the chosen seed of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-friend-of-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-the-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Jaoel is a power by virtue of the ineffable Name dwelling in him (apocalypse-of-abraham 10:6) — the Name-bearing Angel of Exodus.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* As that Angel brings Israel to the prepared place, Jaoel is sent to bring Abraham to the land prepared for him in apocalypse-of-abraham 10:11.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-cherubim-leviathan-hades
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The living creatures of the Cherubim Jaoel restrains (apocalypse-of-abraham 10:7) are the fiery beasts of Ezekiel''s chariot.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-cherubim-leviathan-hades'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 27:1 — *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent, even leviathan that crooked serpent; and he shall slay the dragon that is in the sea.* The Leviathan subject to Jaoel''s restraint (apocalypse-of-abraham 10:8) is the very dragon Yahuah judges.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-cherubim-leviathan-hades'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* The menace of Leviathan that bows to His command (apocalypse-of-abraham 10:8) is the head Yahuah has already broken.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-cherubim-leviathan-hades'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-burn-the-idol-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah''s idolatrous house, marked for burning in apocalypse-of-abraham 10:10, is named outright in Israel''s own record.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The dead idols Terah reveres (apocalypse-of-abraham 10:10) are the very vanity Isaiah exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood that becomes a worshipped god is fit only for the fire that consumes the idol-house in apocalypse-of-abraham 10:10.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The corrupting reverence for dead idols burned away in apocalypse-of-abraham 10:10 is the same Azazel-system whose works defile the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-fulfil-the-sacrifices
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The sacrifices Jaoel commands Abraham to fulfil (apocalypse-of-abraham 10:15) are the exact heifer, goat, ram, turtledove and pigeon of the Genesis covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-fulfil-the-sacrifices'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The generation prepared to spring from Abraham (apocalypse-of-abraham 10:16) is the innumerable seed shown as the stars.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-fulfil-the-sacrifices'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The land the Eternal One hath prepared, for which Jaoel comes (apocalypse-of-abraham 10:11), is the land of the first calling-out.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-fulfil-the-sacrifices'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_11.sql (session253 apocalypse-of-abraham 11) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa11 (view _session253_aoa11_lookup). Sort band base 67250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-11-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who grasps Abraham''s right hand and leads him is this same sent Angel who goes before to bring the elect into the prepared place.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, the angel of Apocalypse of Abraham 11:1, is precisely the One in whom the Name dwells — the Name-bearer the Torah commanded Israel to obey.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'daniel', 10, 6, 'free', E'Daniel 10:6 — *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* Daniel by the Hiddekel beholds the same gem-bodied, fire-eyed glory Abraham beholds in his angelic guide.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'revelation', 1, 14, 'free', E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* The snow-white hair of Abraham''s guide is the snow-white hair John sees — one continuous vision of the same glorious Lord.'),
  -- thread: apocalypse-of-abraham-11-fear-not-set-on-feet
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 4, 'canon', 'daniel', 8, 17, 'free', E'Daniel 8:17 — *So he came near where I stood: and when he came, I was afraid, and fell upon my face: but he said unto me, Understand, O son of Adam: for at the time of the end shall be the vision.* As Gabriel calms Daniel''s fright before the vision, so Yahoel tells Abraham not to let his look affright him.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 4, 'canon', 'daniel', 10, 12, 'free', E'Daniel 10:12 — *Then said he unto me, Fear not, Daniel: for from the first day that thou didst set thine heart to understand, and to chasten thyself before thy Elohim (God), thy words were heard, and I am come for thy words.* The "Fear not" to the trembling seer is the very word the angel speaks over Abraham''s perturbed soul.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 4, 'canon', 'daniel', 10, 10, 'free', E'Daniel 10:10 — *And, behold, an hand touched me, which set me upon my knees and upon the palms of my hands.* The angelic hand that raises the fallen prophet is the same hand that grasped Abraham by the right hand and set him upon his feet (11:1).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 3, 'canon', 'ezekiel', 1, 28, 'free', E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Ezekiel falls before the rainbow-glory and hears a voice — Abraham answers that voice, "Here am I, thy servant."'),
  -- thread: apocalypse-of-abraham-11-rainbow-throne-glory
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire body of Abraham''s angel is the sapphire-stone throne and the man-likeness upon it that Ezekiel beheld.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'revelation', 4, 3, 'free', E'Revelation 4:3 — *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* The rainbow-turban on Yahoel''s head is the rainbow round about the throne John saw — the same covenant-token crowning the glory.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 1, 'canon', 'revelation', 10, 1, 'free', E'Revelation 10:1 — *And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire:* John''s mighty angel wears the rainbow on his head exactly as Abraham''s angel wears the turban like the rainbow.'),
  -- thread: apocalypse-of-abraham-11-led-to-the-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 5, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The "sacrifice" Yahoel leads Abraham toward is this very covenant offering of the heifer, goat, ram, turtledove and pigeon.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 5, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The Presence "visible" at the sacrifice is the smoking furnace and burning lamp that passed between the pieces of Abraham''s covenant.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 6, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* The same God of glory who called Abraham out of Mesopotamia now sends His Name-bearing angel to say "come with me."'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 11, 6, 'canon', 'joshua', 5, 14, 'free', E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The captain of Yahuah''s host who is worshipped by Joshua is the same Name-bearing angel Abraham follows with "Here am I, thy servant."')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-name-bearing-angel',
       E'Yahoel — the angel in whom is the Name',
       E'Abraham is raised by the angel who took his right hand, and the description is the description of the glory: *And I rose up and saw him who had grasped me by my right hand and set me up upon my feet; and the appearance of his body was like sapphire, and the look of his countenance like chrysolite, and the hair of his head like snow, and the turban upon his head like the appearance of the rainbow, and the clothing of his garments like purple; and a golden sceptre was in his right hand.* (Apocalypse of Abraham 11:1). It ain''t new. This is the angel the Torah already named — the One who carries the Name itself: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* (Exodus 23:20), of whom Yahuah says, *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* (Exodus 23:21) — the Name-bearer, Yahoel, the Yah-El. Daniel saw the same figure by the great river: *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* (Daniel 10:6). And John on Patmos: *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* (Revelation 1:14) — the snow-white hair, the same glory, the same Lord.',
       sv.verse_id, ev.verse_id, 'extras', 67250
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-fear-not-set-on-feet',
       E'Fear not — the prophet raised and named',
       E'The angel calls Abraham by name and stills his dread: *And he said to me: "Abraham!" And I said: "Here am I, thy servant." And he said: "Let not my look affright thee, nor my speech, that thy soul be not perturbed."* (Apocalypse of Abraham 11:2-4). It ain''t new — this is how heaven always meets the seer who falls before its glory. Daniel could not stand: *So he came near where I stood: and when he came, I was afraid, and fell upon my face: but he said unto me, Understand, O son of Adam: for at the time of the end shall be the vision.* (Daniel 8:17), and again he was strengthless until *behold, an hand touched me, which set me upon my knees and upon the palms of my hands.* (Daniel 10:10), and the word came, *Fear not, Daniel: for from the first day that thou didst set thine heart to understand... thy words were heard.* (Daniel 10:12). Abraham''s "Here am I, thy servant" is the servant-posture Ezekiel knew when *I fell upon my face, and I heard a voice of one that spake.* (Ezekiel 1:28). The man is unmade by the glory, then set on his feet and named — that the vision may be understood.',
       sv.verse_id, ev.verse_id, 'extras', 67253
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-rainbow-throne-glory',
       E'The turban like the rainbow — the throne-glory',
       E'The crown of the angel is the sign of the covenant: *the turban upon his head like the appearance of the rainbow* (Apocalypse of Abraham 11:1). It ain''t new — the rainbow round the head and round the throne is the unbroken token of the glory. Ezekiel saw it over the firmament: *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* (Ezekiel 1:26) — the very sapphire of Abraham''s angel. John saw it ring the throne: *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* (Revelation 4:3), and crowning the mighty angel: *And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire:* (Revelation 10:1). The rainbow on Yahoel''s head is the throne brought down to lead Abraham up to the throne.',
       sv.verse_id, ev.verse_id, 'extras', 67256
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-11-led-to-the-sacrifice',
       E'Come with me — led to the covenant sacrifice',
       E'The angel''s whole errand is to bring Abraham to the offering: *Come with me and I will go with thee, until the sacrifice, visible; but after the sacrifice, invisible for ever. Be of good cheer, and come!* (Apocalypse of Abraham 11:5-6). It ain''t new — this is the road to Genesis 15, the cutting of the covenant: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* (Genesis 15:9), and the glory that passed between the pieces: *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* (Genesis 15:17) — the visible Presence at the sacrifice. The God of glory had already called Abraham out by this same summons: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* (Acts 7:2) saying *Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* (Acts 7:3). And the man-with-the-sword who met Joshua is the same captain who is worshipped: *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship...* (Joshua 5:14) — the angel who bears the Name, leading the elect to the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67259
  FROM _session253_aoa11_lookup sv, _session253_aoa11_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-11-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who grasps Abraham''s right hand and leads him is this same sent Angel who goes before to bring the elect into the prepared place.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, the angel of Apocalypse of Abraham 11:1, is precisely the One in whom the Name dwells — the Name-bearer the Torah commanded Israel to obey.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 10:6 — *His body also was like the beryl, and his face as the appearance of lightning, and his eyes as lamps of fire, and his arms and his feet like in colour to polished brass, and the voice of his words like the voice of a multitude.* Daniel by the Hiddekel beholds the same gem-bodied, fire-eyed glory Abraham beholds in his angelic guide.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 1:14 — *His head and his hairs were white like wool, as white as snow; and his eyes were as a flame of fire;* The snow-white hair of Abraham''s guide is the snow-white hair John sees — one continuous vision of the same glorious Lord.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-11-fear-not-set-on-feet
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 8:17 — *So he came near where I stood: and when he came, I was afraid, and fell upon my face: but he said unto me, Understand, O son of Adam: for at the time of the end shall be the vision.* As Gabriel calms Daniel''s fright before the vision, so Yahoel tells Abraham not to let his look affright him.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 10:12 — *Then said he unto me, Fear not, Daniel: for from the first day that thou didst set thine heart to understand, and to chasten thyself before thy Elohim (God), thy words were heard, and I am come for thy words.* The "Fear not" to the trembling seer is the very word the angel speaks over Abraham''s perturbed soul.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 10:10 — *And, behold, an hand touched me, which set me upon my knees and upon the palms of my hands.* The angelic hand that raises the fallen prophet is the same hand that grasped Abraham by the right hand and set him upon his feet (11:1).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 1:28 — *As the appearance of the bow that is in the cloud in the day of rain, so was the appearance of the brightness round about. This was the appearance of the likeness of the glory of Yahuah (LORD). And when I saw it, I fell upon my face, and I heard a voice of one that spake.* Ezekiel falls before the rainbow-glory and hears a voice — Abraham answers that voice, "Here am I, thy servant."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-fear-not-set-on-feet'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-11-rainbow-throne-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The sapphire body of Abraham''s angel is the sapphire-stone throne and the man-likeness upon it that Ezekiel beheld.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-rainbow-throne-glory'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 4:3 — *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* The rainbow-turban on Yahoel''s head is the rainbow round about the throne John saw — the same covenant-token crowning the glory.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-rainbow-throne-glory'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 10:1 — *And I saw another mighty angel come down from heaven, clothed with a cloud: and a rainbow was upon his head, and his face was as it were the sun, and his feet as pillars of fire:* John''s mighty angel wears the rainbow on his head exactly as Abraham''s angel wears the turban like the rainbow.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-rainbow-throne-glory'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-11-led-to-the-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The "sacrifice" Yahoel leads Abraham toward is this very covenant offering of the heifer, goat, ram, turtledove and pigeon.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The Presence "visible" at the sacrifice is the smoking furnace and burning lamp that passed between the pieces of Abraham''s covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* The same God of glory who called Abraham out of Mesopotamia now sends His Name-bearing angel to say "come with me."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 5:14 — *And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come. And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* The captain of Yahuah''s host who is worshipped by Joshua is the same Name-bearing angel Abraham follows with "Here am I, thy servant."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa11_lookup sv, _session253_aoa11_lookup tv
 WHERE t.slug='apocalypse-of-abraham-11-led-to-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_12.sql (session253 apocalypse-of-abraham 12) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa12 (view _session253_aoa12_lookup). Sort band base 67275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-12-forty-days-no-bread
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'canon', 'exodus', 34, 28, 'free', E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Abraham''s forty-day fast without bread or water on Horeb is the same mountain-fast Moses kept before the covenant was written.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'canon', 'deuteronomy', 9, 9, 'free', E'Deuteronomy 9:9 — *When I was gone up into the mount to receive the tables of stone, even the tables of the covenant which Yahuah (LORD) made with you, then I abode in the mount forty days and forty nights, I neither did eat bread nor drink water:* the identical phrasing of Abraham''s abstinence marks his ascent as a covenant-mountain ordeal like Moses'' own.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'enoch', '1-enoch', 14, 2, 'extras', E'1 Enoch 14:2 — *Enoch also saw the vision, the ends of all things, and all things did he see, even to the ends of the earth, and no one spoke a word to him.* As Enoch was carried in silent vision to the ends of all things, so Abraham is fed only by the angel''s speech, sustained by the sight he is about to be given.'),
  -- thread: apocalypse-of-abraham-12-mount-of-elohim-horeb
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 2, 'canon', 'exodus', 3, 1, 'free', E'Exodus 3:1 — *Now Moses kept the flock of Jethro his father in law, the priest of Midian: and he led the flock to the backside of the desert, and came to the mountain of Elohim (God), even to Horeb.* Abraham is brought to the very Horeb, the Mount of Elohim, where Moses will later stand before the fire of the bush.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 8, 'canon', 'exodus', 3, 4, 'free', E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Abraham''s reply ''Here am I'' to the angel''s call is the ready answer of the servant, echoing Moses at the bush on this same mountain.'),
  -- thread: apocalypse-of-abraham-12-covenant-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 6, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five animals the angel shows Abraham are precisely the five Yahuah named for the covenant cutting between the pieces.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'genesis', 15, 10, 'free', E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The command to halve the beasts one against the other yet leave the birds unsevered is the very rite of Genesis 15 reenacted on Horeb.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'romans', 4, 18, 'free', E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* The sacrifice Abraham prepares seals the promise of the seed as the stars, the faith Paul holds up as the father''s righteousness.'),
  -- thread: apocalypse-of-abraham-12-yahoel-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who leads Abraham up the mountain to the place prepared for the vision is the same sent Angel who goes before to keep the way.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 3, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, whom Abraham obeys in every word and calls Singer of the Eternal One, is the messenger in whom the Name dwells — his name itself bearing YAH.'),
  -- thread: apocalypse-of-abraham-12-ascent-chariot-cosmic-vision
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'enoch', '1-enoch', 14, 3, 'extras', E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* As Enoch was borne up by the fiery chariot to the ends of heaven, so the angel will bear Abraham up on the wings of the bird to be shown heaven and earth.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'ezekiel', 1, 4, 'free', E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The heaven into which Abraham is to ascend is the merkabah-fire Ezekiel saw, the throne-chariot of the living Elohim.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'genesis', 1, 1, 'free', E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The fulness of the whole world Abraham is promised to gaze upon — heaven, earth, sea, abyss, and the Garden — is the entire creation Moses opens with in the beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-forty-days-no-bread',
       E'Forty days, no bread, no water — the fast of the mountain',
       E'Abraham journeys to the holy mount as Moses fasted before the LORD: *And we went, the two of us together, forty days and nights, and I ate no bread, and drank no water, because my food was to see the angel who was with me, and his speech — that was my drink* (Apocalypse of Abraham 12:1). It ain''t new — this is the very measure of the mountain-fast: *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water* (Exodus 34:28), and again *then I abode in the mount forty days and forty nights, I neither did eat bread nor drink water* (Deuteronomy 9:9). And the seer borne up to behold all things — *Enoch also saw the vision, the ends of all things, and all things did he see, even to the ends of the earth, and no one spoke a word to him* (1 Enoch 14:2). The friend of Elohim is fed not by bread but by the word of the messenger.',
       sv.verse_id, ev.verse_id, 'extras', 67275
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-mount-of-elohim-horeb',
       E'The Mount of Elohim, the glorious Horeb — ''Here am I''',
       E'They arrive where Moses would later meet the fire: *And we came to the Mount of Elohim (God), the glorious Horeb* (Apocalypse of Abraham 12:2); and when the angel calls *''Abraham!''* (12:7) he answers *''Here am I''* (12:8). It ain''t new — the mountain is named already: *and he led the flock to the backside of the desert, and came to the mountain of Elohim (God), even to Horeb* (Exodus 3:1); and the call-and-answer is the burning-bush exchange — *Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I* (Exodus 3:4). The same holy ground, the same summons, the same ready word of the called-out servant.',
       sv.verse_id, ev.verse_id, 'extras', 67278
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-covenant-sacrifice',
       E'The covenant sacrifice — heifer, she-goat, ram, turtledove, pigeon',
       E'The angel shows the very animals of the covenant cut: *there were following us all the prescribed sacrificial animals — the young heifer, and the she-goat, and the ram, and the turtle-dove, and the pigeon* (Apocalypse of Abraham 12:6), and commands *All these slaughter, and divide the animals into halves, one against the other, but the birds do not sever* (12:9). It ain''t new — this is Genesis 15 itself: *Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9), *and divided them in the midst, and laid each piece one against another: but the birds divided he not* (Genesis 15:10). And the seed that this cutting seals is the stars of heaven — *according to that which was spoken, So shall thy seed be* (Romans 4:18). The Apocalypse opens out the same covenant scene Moses recorded.',
       sv.verse_id, ev.verse_id, 'extras', 67281
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-yahoel-name-bearing-angel',
       E'Yahoel — the angel who is fed upon, in whom is the Name',
       E'Abraham''s food and drink is the angel and his speech (12:1), and he names him *''Singer of the Eternal One!''* (12:3) and obeys his every word. It ain''t new — this is the Name-bearing messenger of the Exodus: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20), of whom it is said *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). Yahoel — the angel whose very name carries YAH — is that same messenger in whom the Name dwells, to be heeded and not provoked; not a rival god, but the bearer of the One Name.',
       sv.verse_id, ev.verse_id, 'extras', 67284
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-ascent-chariot-cosmic-vision',
       E'Borne up on the wings — heaven, earth, abyss, the whole world shown',
       E'The angel takes the turtledove and pigeon for himself: *I will ascend upon the wings of the bird, in order to shew thee in heaven, and on the earth, and in the sea, and in the abyss, and in the under-world, and in the Garden of Eden, and in its rivers and in the fulness of the whole world and its circle — thou shalt gaze in them all* (Apocalypse of Abraham 12:9). It ain''t new — the righteous are carried up in fire to behold all things: *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven* (1 Enoch 14:3). The opened heaven is the merkabah-fire — *a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber* (Ezekiel 1:4) — and what Abraham will gaze upon is the whole creation, from the beginning: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1).',
       sv.verse_id, ev.verse_id, 'extras', 67287
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-12-forty-days-no-bread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Abraham''s forty-day fast without bread or water on Horeb is the same mountain-fast Moses kept before the covenant was written.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-forty-days-no-bread'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 9:9 — *When I was gone up into the mount to receive the tables of stone, even the tables of the covenant which Yahuah (LORD) made with you, then I abode in the mount forty days and forty nights, I neither did eat bread nor drink water:* the identical phrasing of Abraham''s abstinence marks his ascent as a covenant-mountain ordeal like Moses'' own.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-forty-days-no-bread'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 14:2 — *Enoch also saw the vision, the ends of all things, and all things did he see, even to the ends of the earth, and no one spoke a word to him.* As Enoch was carried in silent vision to the ends of all things, so Abraham is fed only by the angel''s speech, sustained by the sight he is about to be given.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-forty-days-no-bread'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-mount-of-elohim-horeb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 3:1 — *Now Moses kept the flock of Jethro his father in law, the priest of Midian: and he led the flock to the backside of the desert, and came to the mountain of Elohim (God), even to Horeb.* Abraham is brought to the very Horeb, the Mount of Elohim, where Moses will later stand before the fire of the bush.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-mount-of-elohim-horeb'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Abraham''s reply ''Here am I'' to the angel''s call is the ready answer of the servant, echoing Moses at the bush on this same mountain.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-mount-of-elohim-horeb'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-covenant-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five animals the angel shows Abraham are precisely the five Yahuah named for the covenant cutting between the pieces.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The command to halve the beasts one against the other yet leave the birds unsevered is the very rite of Genesis 15 reenacted on Horeb.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* The sacrifice Abraham prepares seals the promise of the seed as the stars, the faith Paul holds up as the father''s righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-yahoel-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who leads Abraham up the mountain to the place prepared for the vision is the same sent Angel who goes before to keep the way.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-yahoel-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, whom Abraham obeys in every word and calls Singer of the Eternal One, is the messenger in whom the Name dwells — his name itself bearing YAH.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-yahoel-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-ascent-chariot-cosmic-vision
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* As Enoch was borne up by the fiery chariot to the ends of heaven, so the angel will bear Abraham up on the wings of the bird to be shown heaven and earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-ascent-chariot-cosmic-vision'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The heaven into which Abraham is to ascend is the merkabah-fire Ezekiel saw, the throne-chariot of the living Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-ascent-chariot-cosmic-vision'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The fulness of the whole world Abraham is promised to gaze upon — heaven, earth, sea, abyss, and the Garden — is the entire creation Moses opens with in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-ascent-chariot-cosmic-vision'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_13.sql (session253 apocalypse-of-abraham 13) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa13 (view _session253_aoa13_lookup). Sort band base 67300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 1, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The divided animals and the birds of Apocalypse of Abraham 13:1 are the very covenant offering Yahuah commanded Abram to take.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 1, 'canon', 'genesis', 15, 10, 'free', E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* That the angel takes the birds whole in Apocalypse of Abraham 13:1 keeps faith with Abram dividing the beasts but not the birds.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 3, 'canon', 'genesis', 15, 11, 'free', E'Genesis 15:11 — *And when the fowls came down upon the carcases, Abram drove them away.* The unclean bird Abraham drives off in Apocalypse of Abraham 13:3 is the same fowl that came down upon the covenant carcases and was driven away in Genesis.'),
  -- thread: apocalypse-of-abraham-13-this-is-azazel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 7, 'canon', 'leviticus', 16, 8, 'free', E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The naming of Azazel in Apocalypse of Abraham 13:7 reaches straight back to the lot of the scapegoat cast on the day of atonement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 8, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The disgrace pronounced on Azazel in Apocalypse of Abraham 13:8 is the sending-away of the uncleanness-bearing goat into the wilderness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 7, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The ungodliness named in Apocalypse of Abraham 13:7 is the same Watcher to whom the earth''s corruption and all sin are ascribed.'),
  -- thread: apocalypse-of-abraham-13-his-lot-on-earth-cast-down
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 10, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Azazel made a dweller upon the earth in Apocalypse of Abraham 13:10 is the same Watcher bound and cast into the desert-darkness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 9, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* That Azazel''s lot is on the earth and not in heaven (Apocalypse of Abraham 13:9) is the angels who left their first habitation, reserved unto judgment.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 10, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The adversary made a dweller upon the earth in Apocalypse of Abraham 13:10 is the dragon cast down to the earth with his angels.'),
  -- thread: apocalypse-of-abraham-13-the-righteous-not-in-thy-hand
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 13, 'canon', 'zechariah', 3, 2, 'free', E'Zechariah 3:2 — *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* The angel''s "Depart from this man!" in Apocalypse of Abraham 13:13 is the LORD''s rebuke of the accuser who resists the chosen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 12, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the tempter has no leave to play upon the righteous (Apocalypse of Abraham 13:12) is the devil who flees when resisted.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 10, 'canon', 'luke', 10, 19, 'free', E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The righteous kept out of the unclean one''s hand in Apocalypse of Abraham 13:10 are given power over all the power of the enemy.'),
  -- thread: apocalypse-of-abraham-13-the-vesture-transferred
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 15, 'canon', 'zechariah', 3, 4, 'free', E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* The heavenly vesture set aside for Abraham in Apocalypse of Abraham 13:15 is the change of raiment the LORD puts upon the chosen one before the angel.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 13, 15, 'canon', 'zechariah', 3, 3, 'free', E'Zechariah 3:3 — *Now Joshua was clothed with filthy garments, and stood before the angel.* The mortality transferred to Azazel in Apocalypse of Abraham 13:15 answers to the filthy garments stripped from the righteous who stands before the angel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice',
       E'The unclean bird driven from the divided sacrifice',
       E'Abraham keeps the covenant-cutting and waits for the evening offering, and the adversary comes as a bird upon the carcasses: *And I did everything according to the commandment of the angel, and gave the angels, who had come to us, the divided animals, but the angel took the birds.* (Apocalypse of Abraham 13:1) — *And there flew an unclean bird down upon the carcasses, and I drove it away.* (Apocalypse of Abraham 13:3) It ain''t new — this is the very scene of Genesis 15, the divided heifer and goat and ram, the turtledove and pigeon, and the fowls that came down: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* (Genesis 15:9) — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* (Genesis 15:10) — *And when the fowls came down upon the carcases, Abram drove them away.* (Genesis 15:11) The one fowl Abram drove from the covenant in Genesis is here named: ungodliness, Azazel, come to spoil the offering of the friend of Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 67300
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-this-is-azazel',
       E'This is ungodliness, this is Azazel — the goat sent away',
       E'The bird that speaks is unmasked: *And he said: "This is ungodliness, this is Azazel."* (Apocalypse of Abraham 13:7) — *And he said to it: "Disgrace upon thee, Azazel!"* (Apocalypse of Abraham 13:8) It ain''t new — Azazel is the lot of the scapegoat in the Torah''s day of atonement, the goat that bears uncleanness away into the wilderness while the LORD''s lot is offered for the people: *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* (Leviticus 16:8) — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* (Leviticus 16:10) And the Watchers'' apparatus names him plainly — the corrupter of the earth to whom all sin is ascribed: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* (1 Enoch 8:1 / 1 Enoch 10:8). Two lots, two peoples; the unclean is sent away, the righteous is kept.',
       sv.verse_id, ev.verse_id, 'extras', 67303
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-his-lot-on-earth-cast-down',
       E'Abraham''s lot in heaven, Azazel''s upon the earth',
       E'The angel pronounces the two dwelling-places: *For Abraham''s lot is in heaven, but thine upon the earth.* (Apocalypse of Abraham 13:9) — *Because thou hast chosen and loved this for the dwelling-place of thine uncleanness, therefore the eternal mighty Yahuah (Lord) made thee a dweller upon the earth...* (Apocalypse of Abraham 13:10) It ain''t new — this is the fallen one cast down out of the heights to the earth. The Watchers'' apparatus binds and casts Azazel into the desert until the judgment: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4) The angels that kept not their first estate are reserved in chains: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6) — and the great dragon and his angels are flung to the earth: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9) The adversary''s reach is the dust; Abraham''s portion is above.',
       sv.verse_id, ev.verse_id, 'extras', 67306
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-the-righteous-not-in-thy-hand',
       E'The bodies of the righteous not in the tempter''s hand — rebuked and put to flight',
       E'The adversary is denied his hold on the elect: *...hath not permitted that the bodies of the righteous should be in thy hand, in order that thereby the life of the righteous and the destruction of the unclean may be assured.* (Apocalypse of Abraham 13:10) — *For it hath not been given to thee to play the tempter in regard to all the righteous.* (Apocalypse of Abraham 13:12) — *Depart from this man!* (Apocalypse of Abraham 13:13) It ain''t new — this is the very rebuke of the accuser standing at the right hand to resist the chosen, plucked as a brand from the fire: *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* (Zechariah 3:2) The friend of Elohim has only to stand fast and the tempter is put to flight: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* (James 4:7) — for authority over the enemy has been given: *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* (Luke 10:19) The system accuses; Yahuah rebukes; the elect are kept.',
       sv.verse_id, ev.verse_id, 'extras', 67309
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-13-the-vesture-transferred',
       E'The heavenly vesture set aside for the righteous, the mortality transferred',
       E'The garment is exchanged: *For, behold, the vesture which in heaven was formerly thine hath been set aside for him, and the mortality which was his hath been transferred to thee.* (Apocalypse of Abraham 13:15) It ain''t new — before the angel of Yahuah the chosen one stands in filthy garments while the accuser resists, and the LORD takes away the filth and clothes him in the raiment of heaven: *Now Joshua was clothed with filthy garments, and stood before the angel.* (Zechariah 3:3) — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4) The fallen one is stripped to his mortality; the friend of Elohim is robed in the vesture that was the adversary''s lost glory — the same exchange the prophet saw at the right hand of the resisting Satan.',
       sv.verse_id, ev.verse_id, 'extras', 67312
  FROM _session253_aoa13_lookup sv, _session253_aoa13_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The divided animals and the birds of Apocalypse of Abraham 13:1 are the very covenant offering Yahuah commanded Abram to take.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* That the angel takes the birds whole in Apocalypse of Abraham 13:1 keeps faith with Abram dividing the beasts but not the birds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:11 — *And when the fowls came down upon the carcases, Abram drove them away.* The unclean bird Abraham drives off in Apocalypse of Abraham 13:3 is the same fowl that came down upon the covenant carcases and was driven away in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-bird-driven-from-the-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-this-is-azazel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The naming of Azazel in Apocalypse of Abraham 13:7 reaches straight back to the lot of the scapegoat cast on the day of atonement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-this-is-azazel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The disgrace pronounced on Azazel in Apocalypse of Abraham 13:8 is the sending-away of the uncleanness-bearing goat into the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-this-is-azazel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The ungodliness named in Apocalypse of Abraham 13:7 is the same Watcher to whom the earth''s corruption and all sin are ascribed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-this-is-azazel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-his-lot-on-earth-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Azazel made a dweller upon the earth in Apocalypse of Abraham 13:10 is the same Watcher bound and cast into the desert-darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-his-lot-on-earth-cast-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* That Azazel''s lot is on the earth and not in heaven (Apocalypse of Abraham 13:9) is the angels who left their first habitation, reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-his-lot-on-earth-cast-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The adversary made a dweller upon the earth in Apocalypse of Abraham 13:10 is the dragon cast down to the earth with his angels.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-his-lot-on-earth-cast-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-the-righteous-not-in-thy-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:2 — *And Yahuah (LORD) said unto Satan, Yahuah (LORD) rebuke thee, O Satan; even Yahuah (LORD) that hath chosen Jerusalem rebuke thee: is not this a brand plucked out of the fire?* The angel''s "Depart from this man!" in Apocalypse of Abraham 13:13 is the LORD''s rebuke of the accuser who resists the chosen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-righteous-not-in-thy-hand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* That the tempter has no leave to play upon the righteous (Apocalypse of Abraham 13:12) is the devil who flees when resisted.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-righteous-not-in-thy-hand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 10:19 — *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you.* The righteous kept out of the unclean one''s hand in Apocalypse of Abraham 13:10 are given power over all the power of the enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-righteous-not-in-thy-hand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-13-the-vesture-transferred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* The heavenly vesture set aside for Abraham in Apocalypse of Abraham 13:15 is the change of raiment the LORD puts upon the chosen one before the angel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-vesture-transferred'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 3:3 — *Now Joshua was clothed with filthy garments, and stood before the angel.* The mortality transferred to Azazel in Apocalypse of Abraham 13:15 answers to the filthy garments stripped from the righteous who stands before the angel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa13_lookup sv, _session253_aoa13_lookup tv
 WHERE t.slug='apocalypse-of-abraham-13-the-vesture-transferred'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_14.sql (session253 apocalypse-of-abraham 14) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa14 (view _session253_aoa14_lookup). Sort band base 67325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-14-rebuke-azazel-scapegoat
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement already drives Azazel out into the desert, exactly the ''inaccessible parts of the earth'' to which Abraham banishes him in 14:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Watchers'' apocalypse names the same fallen one and consigns him to the same desert pit Abraham invokes in 14:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Abraham''s word makes Azazel ''the burning coal of the Furnace of the earth'' (14:4) — the same fire reserved for him at the great judgement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* This is the ''heritage'' and ''enmity'' Abraham assigns him in 14:4 — the corrupter of the earth, to whom all sin is ascribed.'),
  -- thread: apocalypse-of-abraham-14-stars-clouds-watchers-taught
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 8, 1, 'extras', E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* Named there as the teacher of the earth''s hidden craft, this is the very one whom 14:3 calls scatterer of ''the secrets of heaven.'''),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' stolen lore of constellations and clouds is exactly the ''stars and clouds'' Abraham binds to Azazel''s portion in 14:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 3, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The apostle confirms the sentence on the one who ''hath rebelled against the Mighty One'' (14:3) — chains and darkness reserved for the great judgement.'),
  -- thread: apocalypse-of-abraham-14-answer-him-not-resist
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 8, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The apostle''s rule is the angel''s counsel of 14:8-9 — give the adversary no foothold, and his ''will'' has no free course.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 8, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The adversary Abraham refuses to answer is the same old serpent finally laid hold of and bound in the vision''s end.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 3, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* He who ''slandereth truth'' (14:3) is the deceiver of the whole world, cast out — the accuser overthrown, not appeased.'),
  -- thread: apocalypse-of-abraham-14-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 5, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel who teaches Abraham the word of rebuke (14:5) is the Name-bearing angel — Yahoel — in whom the very Name dwells.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 5, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The sent angel who keeps and leads is the same office as the guide who commands and teaches Abraham every word in 14:5,10.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 10, 'canon', 'zechariah', 3, 1, 'free', E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* The accuser stands to resist before the angel of Yahuah, exactly as Azazel stands before Abraham and the angel — and in both the adversary is rebuked, not answered (14:10).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-rebuke-azazel-scapegoat',
       E'Go, Azazel — the burning coal, the scapegoat into the wilderness',
       E'The angel arms Abraham with the word of rebuke: *Say to him: ''Be thou the burning coal of the Furnace of the earth; go, Azazel, into the inaccessible parts of the earth; for thy heritage is to be over those existing with thee, being born with the stars and clouds, with the men whose portion thou art, and who through thy being exist; and thine enmity is justification.* It ain''t new. The Day of Atonement already drove a lot-cast adversary out into the desert: *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness* (Leviticus 16:10) — the Hebrew names that goat *Azazel*. And the Watchers'' apocalypse already sentenced him by name: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein* (1 Enoch 10:4) — *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6), the very Furnace Abraham names. *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin* (1 Enoch 10:8) — that is the ''heritage'' and the ''enmity.'' The adversary is sent OUT; he is not worshipped, he is dismissed.',
       sv.verse_id, ev.verse_id, 'extras', 67325
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-stars-clouds-watchers-taught',
       E'Born with the stars and clouds — the secrets scattered, the Watchers'' craft',
       E'Abraham''s rebuke charges Azazel with the men *being born with the stars and clouds, with the men whose portion thou art* (14:4), and earlier the angel names him as the one *who hath scattered over the earth the secrets of heaven and hath rebelled against the Mighty One* (14:3). It ain''t new. The Watchers'' indictment is precisely this scattering of forbidden secrets: *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them* (1 Enoch 8:1) — *Barâqîjâl taught astrology, Kôkabêl the constellations... Ezêqêêl the knowledge of the clouds* (1 Enoch 8:2), the very stars and clouds of Abraham''s verdict. And the apostle ratifies the sentence on the rebels: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). The ''secrets of heaven'' were stolen and scattered; Abraham, son of the idol-maker, hands them back to the dark.',
       sv.verse_id, ev.verse_id, 'extras', 67328
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-answer-him-not-resist',
       E'Answer him not — the adversary rebuked, the chosen given authority',
       E'Twice the angel warns: *Answer him not; for Elohim (God) hath given him power (lit. will) over those who do answer him* (14:8), *that his will may have no free course in thee* (14:9). And Abraham is told the Eternal One *hath chosen thee, He whom thou lovest; be of good courage and use this authority... against him who slandereth truth* (14:3). It ain''t new. The same posture stands across the witness: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you* (James 4:7). It is the rebuke itself, not parley, that drives him out — *And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand* (Revelation 20:1) — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years* (Revelation 20:2). The accuser who *slandereth truth* is the one *which deceiveth the whole world* — *he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). The chosen one does not negotiate with the system; he stands in given authority and says, *go, Azazel.*',
       sv.verse_id, ev.verse_id, 'extras', 67331
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-name-bearing-angel',
       E'The angel who teaches the word — my Name is in him',
       E'Abraham does nothing of himself; he speaks only *the words which the angel had taught me* (14:5), and obeys: *I did what was commanded me by the angel; and however much he spake to me, I answered him nothing whatsoever* (14:10). It ain''t new. The wilderness generation was given just such a Name-bearing guide: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20) — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). This is Yahoel, the angel who bears the Name, in whom the authority resides. And the pattern of the accuser silenced before the high priest is the same scene from the other side: *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him* (Zechariah 3:1) — there too the adversary is rebuked, not answered.',
       sv.verse_id, ev.verse_id, 'extras', 67334
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-14-rebuke-azazel-scapegoat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement already drives Azazel out into the desert, exactly the ''inaccessible parts of the earth'' to which Abraham banishes him in 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Watchers'' apocalypse names the same fallen one and consigns him to the same desert pit Abraham invokes in 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Abraham''s word makes Azazel ''the burning coal of the Furnace of the earth'' (14:4) — the same fire reserved for him at the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* This is the ''heritage'' and ''enmity'' Abraham assigns him in 14:4 — the corrupter of the earth, to whom all sin is ascribed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-14-stars-clouds-watchers-taught
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* Named there as the teacher of the earth''s hidden craft, this is the very one whom 14:3 calls scatterer of ''the secrets of heaven.'''
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-stars-clouds-watchers-taught'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' stolen lore of constellations and clouds is exactly the ''stars and clouds'' Abraham binds to Azazel''s portion in 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-stars-clouds-watchers-taught'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The apostle confirms the sentence on the one who ''hath rebelled against the Mighty One'' (14:3) — chains and darkness reserved for the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-stars-clouds-watchers-taught'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-14-answer-him-not-resist
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The apostle''s rule is the angel''s counsel of 14:8-9 — give the adversary no foothold, and his ''will'' has no free course.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-answer-him-not-resist'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The adversary Abraham refuses to answer is the same old serpent finally laid hold of and bound in the vision''s end.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-answer-him-not-resist'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* He who ''slandereth truth'' (14:3) is the deceiver of the whole world, cast out — the accuser overthrown, not appeased.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-answer-him-not-resist'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-14-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel who teaches Abraham the word of rebuke (14:5) is the Name-bearing angel — Yahoel — in whom the very Name dwells.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The sent angel who keeps and leads is the same office as the guide who commands and teaches Abraham every word in 14:5,10.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* The accuser stands to resist before the angel of Yahuah, exactly as Azazel stands before Abraham and the angel — and in both the adversary is rebuked, not answered (14:10).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

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

-- ----- fragment: minion_apocalypseofabraham_16.sql (session253 apocalypse-of-abraham 16) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa16 (view _session253_aoa16_lookup). Sort band base 67375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-16-himself-thou-canst-not-see
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'exodus', 33, 20, 'free', E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The same boundary set for Moses is set for Abraham in 16:3 — the Eternal One draws near and loves, yet His face cannot be seen by mortal eyes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'deuteronomy', 4, 12, 'free', E'Deuteronomy 4:12 — *And Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice.* Israel at Horeb heard the voice and saw no form, just as Abraham hears the ''great voice of holiness'' in 16:3 while Himself he cannot see.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', '1-timothy', 6, 16, 'free', E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* Paul states as doctrine what Abraham learns by experience in 16:3 — the Eternal One who loves him dwells in unapproachable light and cannot be seen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'john', 1, 18, 'free', E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen God of 16:3 is made known through a mediator — the same office the Name-bearing angel fills for Abraham as he is brought near.'),
  -- thread: apocalypse-of-abraham-16-fear-not-i-am-with-thee
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 4, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The angel''s exact words to Abraham in 16:4 — ''fear not... I am with thee, strengthening thee'' — are the LORD''s own covenant promise to Abraham''s seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 2, 'canon', 'genesis', 15, 1, 'free', E'Genesis 15:1 — *After these things the word of Yahuah (the LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not'' that opens Abraham''s covenant vision is the same word the angel speaks over him in 16:2 as he is brought up to the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 4, 'canon', 'revelation', 1, 17, 'free', E'Revelation 1:17 — *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last.* As Abraham grows faint before the loud crying in 16:4, John too is overcome and steadied by the same ''fear not'' — the seer''s response to the throne is always one word.'),
  -- thread: apocalypse-of-abraham-16-the-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 2, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who steadies Abraham and brings him up in 16:2 is the same Name-bearing Angel sent to lead the covenant seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel beside Abraham in 16:2-3, who points to the Eternal One yet bears His authority, is Yahoel — the angel in whom the Name dwells.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The ''great voice of holiness'' coming straight toward Abraham in 16:3 is the seraphim''s cry before the throne the angel leads him to.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 2, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azazel: to him ascribe all sin.* The fallen Watcher rebuked in Abraham''s ascent is this same Azazel; in 16:2 it is the Name-bearing angel, not the corrupter, who keeps the elect near.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-16-himself-thou-canst-not-see',
       E'The Eternal One whom thou canst not see',
       E'*And He whom thou seest come straight towards us with great voice of holiness — that is the Eternal One who loveth thee; but Himself thou canst not see* (Apocalypse of Abraham 16:3). The angel does not hide the LORD from Abraham out of cruelty but out of the very nature of the Holy One: He comes near, He loves, yet His face is veiled to mortal eyes. It ain''t new — this is the same word the LORD spoke to Moses on the mount: *And he said, Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). At Horeb the people heard the voice and saw nothing: *And Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice* (Deuteronomy 4:12) — exactly Abraham''s ''great voice of holiness'' without a form. Paul names the same mystery: the Eternal One *only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see* (1 Timothy 6:16). And John tells how the unseen God is made known: *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18) — the same pattern by which the angel Yahoel, bearing the Name, brings Abraham near to the One he cannot look upon.',
       sv.verse_id, ev.verse_id, 'extras', 67375
  FROM _session253_aoa16_lookup sv, _session253_aoa16_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-16-fear-not-i-am-with-thee',
       E'Fear not; I am with thee, strengthening thee',
       E'Trembling and faint, Abraham is steadied by the angel: *Remain by me; fear not* (Apocalypse of Abraham 16:2), and again *let not thy spirit grow faint on account of the loud crying, for I am with thee, strengthening thee* (Apocalypse of Abraham 16:4). It ain''t new — this is the LORD''s own covenant word to the seed of Abraham: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness* (Isaiah 41:10). It is the word that falls on every man overcome by the glory: *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last* (Revelation 1:17). The same ''fear not'' was the first word over Abraham''s covenant vision from the beginning: in the like scene the LORD says *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1). The angel who strengthens does not replace the LORD; he carries the Name and the LORD''s own assurance to the man on his face.',
       sv.verse_id, ev.verse_id, 'extras', 67378
  FROM _session253_aoa16_lookup sv, _session253_aoa16_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-16-the-name-bearing-angel',
       E'Yahoel, the angel in whom is the Name',
       E'The angel says of the One approaching, *that is the Eternal One who loveth thee* (Apocalypse of Abraham 16:3), and yet it is the angel himself — Yahoel, who bears the Name — who stands beside Abraham strengthening him: *Remain by me; fear not* (Apocalypse of Abraham 16:2). It ain''t new — this is the Angel of the LORD given to lead the seed of Abraham, *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20), the one of whom it is said *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21) — the very pattern of Yahoel, the Name borne in the angel. The throne he leads Abraham toward is the merkabah of the prophets, where the living creatures cry holy: *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3) — the same ''great voice of holiness'' that comes straight toward Abraham. The adversary who is rebuked in this ascent is the Watcher Azazel, *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.’* (1 Enoch 10:8); the Name-bearing angel, not the fallen one, brings the elect near.',
       sv.verse_id, ev.verse_id, 'extras', 67381
  FROM _session253_aoa16_lookup sv, _session253_aoa16_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-16-himself-thou-canst-not-see
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The same boundary set for Moses is set for Abraham in 16:3 — the Eternal One draws near and loves, yet His face cannot be seen by mortal eyes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:12 — *And Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice.* Israel at Horeb heard the voice and saw no form, just as Abraham hears the ''great voice of holiness'' in 16:3 while Himself he cannot see.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* Paul states as doctrine what Abraham learns by experience in 16:3 — the Eternal One who loves him dwells in unapproachable light and cannot be seen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen God of 16:3 is made known through a mediator — the same office the Name-bearing angel fills for Abraham as he is brought near.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-16-fear-not-i-am-with-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The angel''s exact words to Abraham in 16:4 — ''fear not... I am with thee, strengthening thee'' — are the LORD''s own covenant promise to Abraham''s seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-fear-not-i-am-with-thee'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:1 — *After these things the word of Yahuah (the LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not'' that opens Abraham''s covenant vision is the same word the angel speaks over him in 16:2 as he is brought up to the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-fear-not-i-am-with-thee'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 1:17 — *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last.* As Abraham grows faint before the loud crying in 16:4, John too is overcome and steadied by the same ''fear not'' — the seer''s response to the throne is always one word.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-fear-not-i-am-with-thee'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-16-the-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who steadies Abraham and brings him up in 16:2 is the same Name-bearing Angel sent to lead the covenant seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel beside Abraham in 16:2-3, who points to the Eternal One yet bears His authority, is Yahoel — the angel in whom the Name dwells.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The ''great voice of holiness'' coming straight toward Abraham in 16:3 is the seraphim''s cry before the throne the angel leads him to.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azazel: to him ascribe all sin.* The fallen Watcher rebuked in Abraham''s ascent is this same Azazel; in 16:2 it is the Name-bearing angel, not the corrupter, who keeps the elect near.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_17.sql (session253 apocalypse-of-abraham 17) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa17 (view _session253_aoa17_lookup). Sort band base 67400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-17-voice-in-the-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'ezekiel', 1, 24, 'free', E'Ezekiel 1:24 — *And when they went, I heard the noise of their wings, like the noise of great waters, as the voice of the Almighty, the voice of speech, as the noise of an host: when they stood, they let down their wings.* Ezekiel''s living-creatures roar the same waters-voice Abraham hears coming in the fire.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The fire that comes round about Abraham is the fiery throne Daniel beholds set in heaven.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'psalms', 29, 3, 'free', E'Psalms 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters.* David already named the voice in the fire as the voice of Yahuah upon many waters.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 1, 'canon', 'revelation', 1, 15, 'free', E'Revelation 1:15 — *And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters.* The selfsame waters-voice that meets Abraham in the fire meets John on Patmos at the end.'),
  -- thread: apocalypse-of-abraham-17-eternal-mighty-holy
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 7, 'canon', 'deuteronomy', 6, 4, 'free', E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* Abraham''s ''El, Elohim only — Supreme!'' is the Shema spoken before Sinai — Elohim only, one.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 7, 'canon', 'isaiah', 44, 6, 'free', E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The ''Elohim only — Supreme'' of the song is Isaiah''s first-and-last beside whom there is no other.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 8, 'canon', 'psalms', 90, 2, 'free', E'Psalms 90:2 — *Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God).* The ''Uncreate, without father, without mother, unbegotten'' One is the everlasting-to-everlasting Elohim of Moses.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 8, 'canon', '1-timothy', 1, 17, 'free', E'1 Timothy 1:17 — *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen.* Paul''s doxology echoes Abraham''s song word for word — eternal, immortal, the only Elohim.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 9, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* Abraham''s ''holy Sabaoth, very glorious'' is the seraphim''s Holy, holy, holy of the LORD of hosts.'),
  -- thread: apocalypse-of-abraham-17-jaoel-name-bearer
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 10, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* Yahoel who leads Abraham up is the Angel sent before to keep the way and bring to the prepared place.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 10, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* ''Jaoel'' is the very ''my name is in him'' — the Name-bearing angel of the Presence.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 10, 'canon', 'psalms', 104, 4, 'free', E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The fiery angel Yahoel is one of the flaming-fire ministers David sings.'),
  -- thread: apocalypse-of-abraham-17-the-light-before-the-light
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 13, 'canon', '1-john', 1, 5, 'free', E'1 John 1:5 — *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* The Light that shines before the morning, needing no other light, is the Elohim-is-light John declares.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 13, 'canon', 'james', 1, 17, 'free', E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The splendour from the lights of His countenance is the Father of lights, with whom is no shadow of turning.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 13, 'canon', '1-timothy', 6, 16, 'free', E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* The heavenly dwelling-places of unspeakable splendour are the unapproachable light in which He dwells.'),
  -- thread: apocalypse-of-abraham-17-the-sacrifice-prepared
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 14, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The ''sacrifice which Thou hast prepared through me'' is the very covenant cutting of Genesis 15, where the fire passed between the pieces.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 14, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The accepted sacrifice seals the land-and-seed covenant Yahuah cut with Abram.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 17, 14, 'canon', 'revelation', 4, 5, 'free', E'Revelation 4:5 — *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God).* The fire that received Abraham''s offering is the lamp-fire burning before the throne he ascends toward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-voice-in-the-fire',
       E'The fire and the voice of many waters',
       E'As Abraham ascends with the angel, the Presence comes not in the seen idol but in fire and a sound: *And while he yet spake, and lo, fire came against us round about, and a voice was in the fire like a voice of many waters, like the sound of the sea in its uproar* (Apocalypse of Abraham 17:1). It ain''t new — this is the merkabah Ezekiel already saw: *And when they went, I heard the noise of their wings, like the noise of great waters, as the voice of the Almighty, the voice of speech, as the noise of an host: when they stood, they let down their wings* (Ezekiel 1:24), and the throne-fire of Daniel: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). David sang the same voice over the waters: *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters* (Psalms 29:3); and the same voice meets John at the end: *His feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters* (Revelation 1:15). One throne, one fire, one voice, from Sinai to the Apocalypse.',
       sv.verse_id, ev.verse_id, 'extras', 67400
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-eternal-mighty-holy',
       E'The song of the One: El, Elohim only, Supreme',
       E'Having forsaken his father''s idols, Abraham is taught the song and sings the One: *Eternal, mighty, Holy, El, Elohim (God) only — Supreme!* (Apocalypse of Abraham 17:7) — *Thou who art self-originated, incorruptible, spotless, Uncreate, immaculate, immortal, Self-complete, self-illuminating, Without father, without mother, unbegotten, Exalted, fiery One!* (Apocalypse of Abraham 17:8). It ain''t new — it is the Shema: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* (Deuteronomy 6:4), and the first-and-last of Isaiah: *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6). The everlasting, unbegotten One is Moses'' Rock: *Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God)* (Psalms 90:2); whom Paul doxes in Abraham''s very words: *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen* (1 Timothy 1:17). The seraphim''s Holy answers the song: *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3).',
       sv.verse_id, ev.verse_id, 'extras', 67403
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-jaoel-name-bearer',
       E'El, El, El, Jaoel — the angel in whom is the Name',
       E'The climax of the song names the angel-guide by the Name he bears: *El, El, El, El, Jaoel!* (Apocalypse of Abraham 17:10) — *Thou art He whom my soul hath loved!* (Apocalypse of Abraham 17:11). Yahoel is the angel of the Presence in whom the Name dwells. It ain''t new — this is the Angel Yahuah sends before Yashar''el: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20); *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). The ministers of fire that Abraham ascends among are spirits: *Who maketh his angels spirits; his ministers a flaming fire:* (Psalms 104:4) — which Hebrews carries forward: *And of the angels he saith, Who maketh his angels spirits, and his ministers a flame of fire* (Hebrews 1:7).',
       sv.verse_id, ev.verse_id, 'extras', 67406
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-the-light-before-the-light',
       E'The Light before the morning light',
       E'The song closes adoring the uncreated Light: *Thou, O Light, shinest before the light of the morning upon Thy creatures, so that it becometh a day upon the earth; and in Thy heavenly dwelling-places there is no need of any other light than that of the unspeakable splendour from the lights of Thy countenance* (Apocalypse of Abraham 17:13). It ain''t new — this is the light of the first day before sun or moon, and the message John declares: *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all* (1 John 1:5). Every light flows down from Him: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17) — He *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen* (1 Timothy 6:16). It is the city''s lamp at the end, where no other light is needed.',
       sv.verse_id, ev.verse_id, 'extras', 67409
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-17-the-sacrifice-prepared',
       E'The sacrifice prepared through me',
       E'Abraham ends his song pleading the covenant offering: *Accept my prayer, and be well-pleased with it, likewise also the sacrifice which Thou hast prepared Thee through me who sought Thee!* (Apocalypse of Abraham 17:14). It ain''t new — this is the very scene of Genesis 15, the cut covenant where the fire of the Presence passes between the pieces: *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17); *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* (Genesis 15:18). And the throne-fire he now ascends toward is the seven-lamp fire before the throne: *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God)* (Revelation 4:5). The fire that received the covenant sacrifice is the fire of the throne.',
       sv.verse_id, ev.verse_id, 'extras', 67412
  FROM _session253_aoa17_lookup sv, _session253_aoa17_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=17 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-17-voice-in-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:24 — *And when they went, I heard the noise of their wings, like the noise of great waters, as the voice of the Almighty, the voice of speech, as the noise of an host: when they stood, they let down their wings.* Ezekiel''s living-creatures roar the same waters-voice Abraham hears coming in the fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The fire that comes round about Abraham is the fiery throne Daniel beholds set in heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters.* David already named the voice in the fire as the voice of Yahuah upon many waters.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=29 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 1:15 — *And his feet like unto fine brass, as if they burned in a furnace; and his voice as the sound of many waters.* The selfsame waters-voice that meets Abraham in the fire meets John on Patmos at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-voice-in-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-eternal-mighty-holy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD):* Abraham''s ''El, Elohim only — Supreme!'' is the Shema spoken before Sinai — Elohim only, one.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The ''Elohim only — Supreme'' of the song is Isaiah''s first-and-last beside whom there is no other.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 90:2 — *Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God).* The ''Uncreate, without father, without mother, unbegotten'' One is the everlasting-to-everlasting Elohim of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Timothy 1:17 — *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen.* Paul''s doxology echoes Abraham''s song word for word — eternal, immortal, the only Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* Abraham''s ''holy Sabaoth, very glorious'' is the seraphim''s Holy, holy, holy of the LORD of hosts.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-eternal-mighty-holy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-jaoel-name-bearer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* Yahoel who leads Abraham up is the Angel sent before to keep the way and bring to the prepared place.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-jaoel-name-bearer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* ''Jaoel'' is the very ''my name is in him'' — the Name-bearing angel of the Presence.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-jaoel-name-bearer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 104:4 — *Who maketh his angels spirits; his ministers a flaming fire:* The fiery angel Yahoel is one of the flaming-fire ministers David sings.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-jaoel-name-bearer'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-the-light-before-the-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 1:5 — *This then is the message which we have heard of him, and declare unto you, that Elohim (God) is light, and in him is no darkness at all.* The Light that shines before the morning, needing no other light, is the Elohim-is-light John declares.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-light-before-the-light'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The splendour from the lights of His countenance is the Father of lights, with whom is no shadow of turning.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-light-before-the-light'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* The heavenly dwelling-places of unspeakable splendour are the unapproachable light in which He dwells.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-light-before-the-light'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-17-the-sacrifice-prepared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The ''sacrifice which Thou hast prepared through me'' is the very covenant cutting of Genesis 15, where the fire passed between the pieces.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-sacrifice-prepared'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The accepted sacrifice seals the land-and-seed covenant Yahuah cut with Abram.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-sacrifice-prepared'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:5 — *And out of the throne proceeded lightnings and thunderings and voices: and there were seven lamps of fire burning before the throne, which are the seven Spirits of Elohim (God).* The fire that received Abraham''s offering is the lamp-fire burning before the throne he ascends toward.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa17_lookup sv, _session253_aoa17_lookup tv
 WHERE t.slug='apocalypse-of-abraham-17-the-sacrifice-prepared'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=17 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_18.sql (session253 apocalypse-of-abraham 18) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa18 (view _session253_aoa18_lookup). Sort band base 67425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-18-throne-of-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'ezekiel', 1, 26, 'free', E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The same throne of fire Abraham sees above the living creatures is what Ezekiel saw above the firmament over the cherubim.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'isaiah', 6, 1, 'free', E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Isaiah''s high and lifted-up throne is the throne of fire Abraham beholds the all-seeing ones encircling with song.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fire with its fiery wheels is exactly what Daniel saw the Ancient of days seated upon.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 3, 'canon', 'revelation', 4, 2, 'free', E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John, like Abraham, is carried up in the spirit to behold the one enthroned amid fire.'),
  -- thread: apocalypse-of-abraham-18-four-living-creatures
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'ezekiel', 1, 10, 'free', E'Ezekiel 1:10 — *As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* Abraham''s living creatures with the four faces of lion, man, ox, and eagle are Ezekiel''s four-faced creatures by the river Chebar.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'ezekiel', 10, 14, 'free', E'Ezekiel 10:14 — *And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle.* Ezekiel names these same four-faced creatures the cherubim, the living beings that bear the throne Abraham now beholds.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'revelation', 4, 7, 'free', E'Revelation 4:7 — *And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle.* The four beasts round the heavenly throne in John''s vision are the same lion, ox, man, and eagle Abraham sees under the throne of fire.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'enoch', '1-enoch', 39, 11, 'extras', E'1 Enoch 39:11 — *And I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits, and they intercede for the children of men.* Enoch too saw four presences encircling the throne of glory, the same fourfold company Abraham beholds round the throne of fire.'),
  -- thread: apocalypse-of-abraham-18-six-wings-covered
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 5, 'canon', 'isaiah', 6, 2, 'free', E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* Abraham''s creatures cover face and feet and spread wings to fly exactly as Isaiah''s six-winged seraphim do before the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 4, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six-winged creatures Abraham sees are the four six-winged beasts John saw, ceaselessly singing the holy before the throne.'),
  -- thread: apocalypse-of-abraham-18-chariot-wheels-of-eyes
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'canon', 'ezekiel', 1, 18, 'free', E'Ezekiel 1:18 — *As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* Abraham''s fiery wheels full of eyes round about are Ezekiel''s dreadful wheel-rings full of eyes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'canon', 'ezekiel', 10, 12, 'free', E'Ezekiel 10:12 — *And their whole body, and their backs, and their hands, and their wings, and the wheels, were full of eyes round about, even the wheels that they four had.* The chariot-wheels covered with eyes that Abraham sees are the eye-covered wheels of the cherubim in Ezekiel''s temple vision.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne over fiery wheels encircled with fire that Abraham beholds is the fiery-wheeled throne of the Ancient of days.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 9, 'enoch', '1-enoch', 14, 3, 'extras', E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* Enoch too was carried up by a chariot of fire to behold the throne, the same fiery chariot Abraham sees bearing the throne of the Eternal.'),
  -- thread: apocalypse-of-abraham-18-the-song
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 8, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The song of peace the living creatures recite is the seraphim''s antiphonal Holy, holy, holy before the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 8, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The unceasing song Abraham hears the creatures recite is the unresting Holy of the four beasts before the heavenly throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 18, 8, 'enoch', '1-enoch', 39, 12, 'extras', E'1 Enoch 39:12 — *And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* Enoch likewise heard the four presences uttering praise before the throne of glory, the same song of peace Abraham hears taught by Yahoel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-throne-of-fire',
       E'The throne of fire above the host',
       E'Abraham, led up by Yahoel, beholds what Ezekiel and Isaiah and John beheld — *And as the fire raised itself up, ascending into the height, I saw under the fire a throne of fire, and, round about it, all-seeing ones, reciting the song* (Apocalypse of Abraham 18:3). It ain''t new: the prophet by the river Chebar saw the same — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26), and *I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1). The Ancient of days sits on the same fiery seat — *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9) — and the seer of Patmos was carried up to it: *a throne was set in heaven, and one sat on the throne* (Revelation 4:2). One throne, one vision, across the witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 67425
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-four-living-creatures',
       E'The four living creatures: lion, man, ox, eagle',
       E'Under the throne Abraham sees *four fiery living creatures... each one of them with four faces* — *of a lion, of a man, of an ox, of an eagle* (Apocalypse of Abraham 18:3-4). It ain''t new: this is the merkabah of Ezekiel, whose creatures *had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle* (Ezekiel 1:10), the same creatures he names cherubim — *the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle* (Ezekiel 10:14). And the four beasts before the throne in heaven are these very four — *the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle* (Revelation 4:7). One company of living creatures bears the throne in every seeing.',
       sv.verse_id, ev.verse_id, 'extras', 67428
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-six-wings-covered',
       E'Six wings: covering face and feet, spread to fly',
       E'Each creature has *six wings from their shoulders* — *with the two wings from their shoulders they covered their faces, and with the two wings which sprang from their loins they covered their feet, while the two middle wings they spread out for flying* (Apocalypse of Abraham 18:4-5). It ain''t new: this is precisely the seraphim of Isaiah — *each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly* (Isaiah 6:2) — and the four beasts of the throne — *the four beasts had each of them six wings about him; and they were full of eyes within* (Revelation 4:8). The same reverent posture before the same throne: the face veiled, the feet veiled, the wings spread to serve.',
       sv.verse_id, ev.verse_id, 'extras', 67431
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-chariot-wheels-of-eyes',
       E'The chariot of fiery wheels full of eyes',
       E'Behind the living creatures Abraham sees *a chariot with fiery wheels, each wheel full of eyes round about; and over the wheels was a throne... covered with fire* (Apocalypse of Abraham 18:9). It ain''t new: Ezekiel''s merkabah is this very wheelwork — *their rings were full of eyes round about them four* (Ezekiel 1:18), the wheel within the wheel — *and their whole body, and their backs, and their hands, and their wings, and the wheels, were full of eyes round about, even the wheels that they four had* (Ezekiel 10:12). Daniel saw the Ancient of days with these same flaming wheels — *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). And Enoch was borne to the throne in this very chariot — *I Enoch was carried off in a whirlwind, with a chariot of fire* (1 Enoch 14:3). One fiery chariot bears the throne in every ascent.',
       sv.verse_id, ev.verse_id, 'extras', 67434
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-18-the-song',
       E'The unceasing song before the throne',
       E'The all-seeing ones and the living creatures are *reciting the song* without ceasing, and Yahoel *taught them the song of peace which hath its origin in the Eternal One* (Apocalypse of Abraham 18:3,8). It ain''t new: before the throne the seraphim cry the everlasting Holy — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3) — and the four beasts take it up day and night — *they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come* (Revelation 4:8). Enoch too heard the four presences before the throne — *I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory* (1 Enoch 39:12). The same song of peace, sung from the foundation, surrounds the throne in every heaven.',
       sv.verse_id, ev.verse_id, 'extras', 67437
  FROM _session253_aoa18_lookup sv, _session253_aoa18_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=18 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-18-throne-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:26 — *And above the firmament that was over their heads was the likeness of a throne, as the appearance of a sapphire stone: and upon the likeness of the throne was the likeness as the appearance of a man above upon it.* The same throne of fire Abraham sees above the living creatures is what Ezekiel saw above the firmament over the cherubim.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* Isaiah''s high and lifted-up throne is the throne of fire Abraham beholds the all-seeing ones encircling with song.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne of fire with its fiery wheels is exactly what Daniel saw the Ancient of days seated upon.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John, like Abraham, is carried up in the spirit to behold the one enthroned amid fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-throne-of-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-four-living-creatures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:10 — *As for the likeness of their faces, they four had the face of a man, and the face of a lion, on the right side: and they four had the face of an ox on the left side; they four also had the face of an eagle.* Abraham''s living creatures with the four faces of lion, man, ox, and eagle are Ezekiel''s four-faced creatures by the river Chebar.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 10:14 — *And every one had four faces: the first face was the face of a cherub, and the second face was the face of a man, and the third the face of a lion, and the fourth the face of an eagle.* Ezekiel names these same four-faced creatures the cherubim, the living beings that bear the throne Abraham now beholds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:7 — *And the first beast was like a lion, and the second beast like a calf, and the third beast had a face as a man, and the fourth beast was like a flying eagle.* The four beasts round the heavenly throne in John''s vision are the same lion, ox, man, and eagle Abraham sees under the throne of fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 39:11 — *And I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits, and they intercede for the children of men.* Enoch too saw four presences encircling the throne of glory, the same fourfold company Abraham beholds round the throne of fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-four-living-creatures'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-six-wings-covered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* Abraham''s creatures cover face and feet and spread wings to fly exactly as Isaiah''s six-winged seraphim do before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-six-wings-covered'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The six-winged creatures Abraham sees are the four six-winged beasts John saw, ceaselessly singing the holy before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-six-wings-covered'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-chariot-wheels-of-eyes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:18 — *As for their rings, they were so high that they were dreadful; and their rings were full of eyes round about them four.* Abraham''s fiery wheels full of eyes round about are Ezekiel''s dreadful wheel-rings full of eyes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 10:12 — *And their whole body, and their backs, and their hands, and their wings, and the wheels, were full of eyes round about, even the wheels that they four had.* The chariot-wheels covered with eyes that Abraham sees are the eye-covered wheels of the cherubim in Ezekiel''s temple vision.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The throne over fiery wheels encircled with fire that Abraham beholds is the fiery-wheeled throne of the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* Enoch too was carried up by a chariot of fire to behold the throne, the same fiery chariot Abraham sees bearing the throne of the Eternal.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-chariot-wheels-of-eyes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-18-the-song
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The song of peace the living creatures recite is the seraphim''s antiphonal Holy, holy, holy before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-the-song'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The unceasing song Abraham hears the creatures recite is the unresting Holy of the four beasts before the heavenly throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-the-song'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 39:12 — *And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* Enoch likewise heard the four presences uttering praise before the throne of glory, the same song of peace Abraham hears taught by Yahoel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa18_lookup sv, _session253_aoa18_lookup tv
 WHERE t.slug='apocalypse-of-abraham-18-the-song'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_19.sql (session253 apocalypse-of-abraham 19) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa19 (view _session253_aoa19_lookup). Sort band base 67450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-19-here-am-i-out-of-the-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 1, 'canon', 'genesis', 22, 11, 'free', E'Genesis 22:11 — *And the angel of Yahuah (LORD) called unto him out of heaven, and said, Abraham, Abraham: and he said, Here am I.* The same doubled name from heaven that the patriarch heard on Moriah is the voice out of the fire in Apocalypse of Abraham 19:1.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 1, 'canon', 'exodus', 3, 2, 'free', E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The voice that speaks to Abraham from the midst of the fire is the same fire-that-does-not-consume that called Moses at Horeb (Apocalypse of Abraham 19:1).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 2, 'canon', 'isaiah', 6, 8, 'free', E'Isaiah 6:8 — *Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me.* Abraham''s answer in the throne-room — *Here am I!* — is the standing reply of the elect, the very words Isaiah gives before the throne (Apocalypse of Abraham 19:2).'),
  -- thread: apocalypse-of-abraham-19-fire-living-creatures-throne
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 5, 'canon', 'ezekiel', 1, 13, 'free', E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The fire widely extended over the living creatures on Abraham''s seventh firmament is the burning-coal fire of Ezekiel''s living creatures (Apocalypse of Abraham 19:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 5, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The widely-extended fire and the power of invisible glory Abraham sees is the fiery-flame throne of the Ancient of days (Apocalypse of Abraham 19:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 5, 'canon', 'revelation', 4, 6, 'free', E'Revelation 4:6 — *And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind.* The living creatures over which Abraham sees the power of invisible glory are the four living creatures round John''s throne (Apocalypse of Abraham 19:5).'),
  -- thread: apocalypse-of-abraham-19-angels-pure-spirit-carry-commands
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 6, 'canon', 'psalms', 104, 4, 'free', E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Abraham''s angels of pure spirit without bodies, serving the fiery angels, are the very spirits-and-flaming-ministers of the Psalm (Apocalypse of Abraham 19:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 6, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The multitude of angels who carry out the commands of the fiery angels is the thousand-thousand host ministering before the fiery throne (Apocalypse of Abraham 19:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 7, 'canon', 'ezekiel', 1, 12, 'free', E'Ezekiel 1:12 — *And they went every one straight forward: whither the spirit was to go, they went; and they turned not when they went.* That the angels are powers only of pure spirit carrying out commands answers Ezekiel''s creatures who move solely where the Spirit sends them (Apocalypse of Abraham 19:7).'),
  -- thread: apocalypse-of-abraham-19-powers-of-the-stars-obey
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 9, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The powers of the stars that carry out the commands laid upon them are the appointed lights set in the firmament from creation (Apocalypse of Abraham 19:9).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 9, 'enoch', '1-enoch', 18, 13, 'extras', E'1 Enoch 18:13 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* Abraham''s powers of the stars under command match Enoch''s host bound to their commandment and judged when they fail to keep it (Apocalypse of Abraham 19:9).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 19, 9, 'enoch', '1-enoch', 18, 4, 'extras', E'1 Enoch 18:4 — *I saw the winds of heaven which turn and bring the circumference of the sun and all the stars to their setting.* The elements of the earth obeying the powers of the stars echoes Enoch''s winds that govern the sun and all the stars in their courses (Apocalypse of Abraham 19:9).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-here-am-i-out-of-the-fire',
       E'The Voice Out of the Fire — "Abraham, Abraham!"',
       E'Out of the burning the Name calls the patriarch by his doubled name, and he answers as the elect always answer: *And a voice came to me out of the midst of the fire, saying: "Abraham, Abraham!"* (Apocalypse of Abraham 19:1) — *I said: "Here am I!"* (Apocalypse of Abraham 19:2). It ain''t new. This is the same doubled call that stayed the knife on Moriah: *And the angel of Yahuah (LORD) called unto him out of heaven, and said, Abraham, Abraham: and he said, Here am I* (Genesis 22:11). It is the voice from the unconsumed fire on Horeb: *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed* (Exodus 3:2). And when the prophet stands in the throne-room and the same voice asks who will go, the elect answer in Abraham''s own words: *Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me* (Isaiah 6:8). The call comes out of the fire; the man says *Here am I*.',
       sv.verse_id, ev.verse_id, 'extras', 67450
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-fire-living-creatures-throne',
       E'The Fire, the Living Creatures, and the Glory on the Highest Firmament',
       E'Lifted to the seventh firmament, Abraham sees the throne-fire and the living creatures wrapped in invisible glory: *And I saw upon the seventh firmament upon which I stood a fire widely extended, and light, and dew, and a multitude of angels, and a power of invisible glory over the living creatures which I saw; but no other being did I see there* (Apocalypse of Abraham 19:5). It ain''t new — this is the merkabah Ezekiel saw by the Chebar: *Also out of the midst thereof came the likeness of four living creatures... As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps* (Ezekiel 1:5, 13), and over them the throne: *and upon the likeness of the throne was the likeness as the appearance of a man above upon it* (Ezekiel 1:26). It is the fiery throne Daniel beheld: *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). And it is the throne John saw, with the living creatures full of fire and the glory: *And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind* (Revelation 4:6). One throne, one fire, one company of living creatures — seen by Abraham, Ezekiel, Daniel, and John alike.',
       sv.verse_id, ev.verse_id, 'extras', 67453
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-angels-pure-spirit-carry-commands',
       E'Angels of Pure Spirit Who Carry Out the Commands',
       E'Below the highest heaven Abraham sees rank upon rank of bodiless ministers doing the bidding of the fiery angels: *And I looked from the mountain in which I stood downwards to the sixth firmament, and saw there a multitude of angels, of pure spirit, without bodies, who carried out the commands of the fiery angels who were upon the eighth firmament* (Apocalypse of Abraham 19:6). It ain''t new. The Psalm names them exactly so — spirit and flame: *Who maketh his angels spirits; his ministers a flaming fire* (Psalm 104:4). Daniel numbers the same host attending the fiery throne: *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* (Daniel 7:10). And Ezekiel''s living creatures move only at command, each one going straight on the errand of the Spirit: *And they went every one straight forward: whither the spirit was to go, they went; and they turned not when they went* (Ezekiel 1:12). The angels do not act of themselves; they carry out the commands.',
       sv.verse_id, ev.verse_id, 'extras', 67456
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-19-powers-of-the-stars-obey',
       E'The Powers of the Stars That Carry Out the Commands',
       E'On the fifth firmament Abraham sees the host of heaven under orders, and the very elements obeying them: *And I saw there, on the fifth firmament, the powers of the stars which carry out the commands laid upon them, and the elements of the earth obeyed them* (Apocalypse of Abraham 19:9). It ain''t new — the lights were set in the firmament under appointment from the first day: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). And the live witness of Enoch shows the same: the stars are a host bound to their commandment, judged when they keep it not — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times* (1 Enoch 18:13), the winds themselves turning *the circumference of the sun and all the stars to their setting* (1 Enoch 18:4). The powers of heaven are servants under command, not gods to be feared — the very lesson Abraham learned when he forsook Terah''s idols.',
       sv.verse_id, ev.verse_id, 'extras', 67459
  FROM _session253_aoa19_lookup sv, _session253_aoa19_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-19-here-am-i-out-of-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:11 — *And the angel of Yahuah (LORD) called unto him out of heaven, and said, Abraham, Abraham: and he said, Here am I.* The same doubled name from heaven that the patriarch heard on Moriah is the voice out of the fire in Apocalypse of Abraham 19:1.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-here-am-i-out-of-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:2 — *And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed.* The voice that speaks to Abraham from the midst of the fire is the same fire-that-does-not-consume that called Moses at Horeb (Apocalypse of Abraham 19:1).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-here-am-i-out-of-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 6:8 — *Also I heard the voice of Yahuah (Lord), saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me.* Abraham''s answer in the throne-room — *Here am I!* — is the standing reply of the elect, the very words Isaiah gives before the throne (Apocalypse of Abraham 19:2).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-here-am-i-out-of-the-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-19-fire-living-creatures-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The fire widely extended over the living creatures on Abraham''s seventh firmament is the burning-coal fire of Ezekiel''s living creatures (Apocalypse of Abraham 19:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-fire-living-creatures-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The widely-extended fire and the power of invisible glory Abraham sees is the fiery-flame throne of the Ancient of days (Apocalypse of Abraham 19:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-fire-living-creatures-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:6 — *And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind.* The living creatures over which Abraham sees the power of invisible glory are the four living creatures round John''s throne (Apocalypse of Abraham 19:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-fire-living-creatures-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-19-angels-pure-spirit-carry-commands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Abraham''s angels of pure spirit without bodies, serving the fiery angels, are the very spirits-and-flaming-ministers of the Psalm (Apocalypse of Abraham 19:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-angels-pure-spirit-carry-commands'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The multitude of angels who carry out the commands of the fiery angels is the thousand-thousand host ministering before the fiery throne (Apocalypse of Abraham 19:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-angels-pure-spirit-carry-commands'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 1:12 — *And they went every one straight forward: whither the spirit was to go, they went; and they turned not when they went.* That the angels are powers only of pure spirit carrying out commands answers Ezekiel''s creatures who move solely where the Spirit sends them (Apocalypse of Abraham 19:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-angels-pure-spirit-carry-commands'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-19-powers-of-the-stars-obey
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* The powers of the stars that carry out the commands laid upon them are the appointed lights set in the firmament from creation (Apocalypse of Abraham 19:9).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-powers-of-the-stars-obey'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 18:13 — *And the stars which roll over the fire are they which have transgressed the commandment of Yahuah (God) in the beginning of their rising, because they did not come forth at their appointed times.* Abraham''s powers of the stars under command match Enoch''s host bound to their commandment and judged when they fail to keep it (Apocalypse of Abraham 19:9).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-powers-of-the-stars-obey'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 18:4 — *I saw the winds of heaven which turn and bring the circumference of the sun and all the stars to their setting.* The elements of the earth obeying the powers of the stars echoes Enoch''s winds that govern the sun and all the stars in their courses (Apocalypse of Abraham 19:9).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa19_lookup sv, _session253_aoa19_lookup tv
 WHERE t.slug='apocalypse-of-abraham-19-powers-of-the-stars-obey'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_20.sql (session253 apocalypse-of-abraham 20) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa20 (view _session253_aoa20_lookup). Sort band base 67475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-20-number-the-stars
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 3, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The angel''s charge to number the stars in Apocalypse of Abraham 20:3 is the very covenant scene of Genesis 15 lifted into the heavens.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The stars-as-seed promise that AoA 20:6 makes into a nation is the oath sworn over the bound Isaac.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'hebrews', 11, 12, 'free', E'Hebrews 11:12 — *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable.* The Besorah confirms the heavenly star-count of AoA 20:6 was fulfilled in Abraham''s innumerable seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'romans', 4, 18, 'free', E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* Sha''ul reads the same star-promise rehearsed in AoA 20:6 as the faith counted to Abraham for righteousness.'),
  -- thread: apocalypse-of-abraham-20-dust-and-ashes
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 5, 'canon', 'genesis', 18, 27, 'free', E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes.* Abraham''s confession in AoA 20:5 that he is *but a man of dust and ashes* is his own self-naming from the plea for Sodom.'),
  -- thread: apocalypse-of-abraham-20-set-apart-heritage
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* The seed *set apart for me in my heritage* of AoA 20:6 is the Song of Moshe''s word that Jacob is Yahuah''s own portion.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The setting-apart of Abraham''s seed as a heritage in AoA 20:6 is the dividing of the nations around the children of Israel.'),
  -- thread: apocalypse-of-abraham-20-azazel-inveighed
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 9, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Azazel who *inveighed against* Abraham in AoA 20:9 is the wilderness-lot of the Day of Atonement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.''* The Azazel named with Abraham''s heritage in AoA 20:6 is the bound Watcher of the restored Enoch.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 6, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The fallen one set against Abraham''s portion in AoA 20:6 is the Watcher to whom all sin is ascribed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 20, 9, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The accuser who *inveighed against* Abraham in AoA 20:9 stands already reserved in chains for judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-number-the-stars',
       E'Number the stars — so shall thy seed be',
       E'The Eternal Mighty One lifts Abraham above the firmament and sets him the same charge given at the covenant of the pieces: *"Consider from above the stars which are beneath thee, and number them for me, and make known to me their number."* (Apocalypse of Abraham 20:3) — *"As the number of the stars and their power, so will I make thy seed a nation and a people, set apart for me..."* (20:6). It ain''t new: this is Genesis 15 carried up into heaven. There the same voice *brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). The oath was doubled at the binding — *in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17), and the Besorah testifies it came to pass: *there sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude* (Hebrews 11:12). Sha''ul names it the seed-promise believed against hope — *according to that which was spoken, So shall thy seed be* (Romans 4:18).',
       sv.verse_id, ev.verse_id, 'extras', 67475
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-dust-and-ashes',
       E'But a man of dust and ashes',
       E'When the heavens are opened to him, Abraham answers from his own lowliness: *"When can I? For I am but a man of dust and ashes."* (Apocalypse of Abraham 20:4-5). The phrase is Abraham''s own from the canon — pleading for Sodom he said *Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes* (Genesis 18:27). It ain''t new: the patriarch who would father stars never forgot he was formed of the ground, and the man yet bows before the Eternal *Mighty One*.',
       sv.verse_id, ev.verse_id, 'extras', 67478
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-set-apart-heritage',
       E'A people set apart in His heritage',
       E'The promise is not numbers only but separation: *"so will I make thy seed a nation and a people, set apart for me in my heritage..."* (Apocalypse of Abraham 20:6). This is the Song of Moshe: *For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9) — and the dividing of the nations *according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). Election precedes confession; the seed is set apart as Yahuah''s own heritage. Not a people replacing Israel — Israel IS the heritage.',
       sv.verse_id, ev.verse_id, 'extras', 67481
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-20-azazel-inveighed',
       E'Azazel inveighed against me — the accuser bound',
       E'Twice the fallen one is named: the heritage is set apart *"with Azazel"* (Apocalypse of Abraham 20:6), and Abraham protests, *"before Thou leddest me up Azazel inveighed against me. How, then... hast Thou constituted Thyself with him?"* (20:9-10). It ain''t new: Azazel is the lot driven into the wilderness — *the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD)... and to let him go for a scapegoat into the wilderness* (Leviticus 16:10). The restored Watchers'' book names him the chief of the fallen: *Bind Azâzêl hand and foot, and cast him into the darkness... to him ascribe all sin* (1 Enoch 10:4,8). Yahudah testifies of the same fate — *the angels which kept not their first estate... he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). The accuser inveighs; the system is bound.',
       sv.verse_id, ev.verse_id, 'extras', 67484
  FROM _session253_aoa20_lookup sv, _session253_aoa20_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=20 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-20-number-the-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The angel''s charge to number the stars in Apocalypse of Abraham 20:3 is the very covenant scene of Genesis 15 lifted into the heavens.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The stars-as-seed promise that AoA 20:6 makes into a nation is the oath sworn over the bound Isaac.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:12 — *Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable.* The Besorah confirms the heavenly star-count of AoA 20:6 was fulfilled in Abraham''s innumerable seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* Sha''ul reads the same star-promise rehearsed in AoA 20:6 as the faith counted to Abraham for righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-number-the-stars'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-20-dust-and-ashes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes.* Abraham''s confession in AoA 20:5 that he is *but a man of dust and ashes* is his own self-naming from the plea for Sodom.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-dust-and-ashes'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-20-set-apart-heritage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* The seed *set apart for me in my heritage* of AoA 20:6 is the Song of Moshe''s word that Jacob is Yahuah''s own portion.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-set-apart-heritage'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The setting-apart of Abraham''s seed as a heritage in AoA 20:6 is the dividing of the nations around the children of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-set-apart-heritage'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-20-azazel-inveighed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Azazel who *inveighed against* Abraham in AoA 20:9 is the wilderness-lot of the Day of Atonement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.''* The Azazel named with Abraham''s heritage in AoA 20:6 is the bound Watcher of the restored Enoch.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The fallen one set against Abraham''s portion in AoA 20:6 is the Watcher to whom all sin is ascribed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The accuser who *inveighed against* Abraham in AoA 20:9 stands already reserved in chains for judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa20_lookup sv, _session253_aoa20_lookup tv
 WHERE t.slug='apocalypse-of-abraham-20-azazel-inveighed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=20 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_21.sql (session253 apocalypse-of-abraham 21) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa21 (view _session253_aoa21_lookup). Sort band base 67500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-21-creation-foreshadowed
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 1, 'canon', 'genesis', 1, 1, 'free', E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The creation Abraham is shown foreshadowed in the expanse is the very work of the first day of Genesis.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 1, 'canon', 'genesis', 1, 6, 'free', E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* The "firmaments" beneath Abraham''s feet are the dividing firmament Elohim set in place.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 2, 'canon', 'genesis', 1, 20, 'free', E'Genesis 1:20 — *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* The creatures and animate beings Abraham sees moving on the earth are the swarming life Elohim called forth.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 2, 'canon', 'psalms', 104, 24, 'free', E'Psalms 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* Abraham''s overview of all the creatures and their works is the psalmist''s wonder at the wisdom by which they were made.'),
  -- thread: apocalypse-of-abraham-21-leviathan-the-deep
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 3, 'canon', 'job', 41, 1, 'free', E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The Leviathan with his dominion and his caves that Abraham sees is the unmasterable sea-monster Yahuah sets before Job.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 3, 'canon', 'psalms', 104, 26, 'free', E'Psalms 104:26 — *There go the ships: there is that leviathan, whom thou hast made to play therein.* The sea with its islands and its monster in Abraham''s vision is the wide sea where the made Leviathan plays.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 3, 'enoch', '1-enoch', 60, 7, 'extras', E'1 Enoch 60:7 — *And on that day were two monsters parted, a female monster whose name is Leviathan, dwelling in the abysses of the ocean over the fountains of the waters.* The Leviathan in his deep camping-ground that Abraham beholds is Enoch''s Leviathan dwelling in the abysses of the waters.'),
  -- thread: apocalypse-of-abraham-21-garden-of-eden
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 5, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Garden of Eden Abraham is shown is the very garden Yahuah planted eastward and set the man within.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 5, 'canon', 'genesis', 2, 10, 'free', E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The source of the stream issuing from Eden that Abraham sees is the river that went out to water the garden.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 5, 'canon', 'genesis', 2, 9, 'free', E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The trees and their bloom and fruits Abraham beholds are the garden''s trees pleasant to the sight and good for food.'),
  -- thread: apocalypse-of-abraham-21-two-peoples-right-left
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 7, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The multitude halved on the right and the left in Abraham''s vision is the two peoples Yahuah separated from the womb.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 7, 'canon', 'matthew', 25, 32, 'free', E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two halves of the great multitude Abraham beholds are the nations the Son of Adam gathers and divides at the end.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 21, 7, 'canon', 'matthew', 25, 33, 'free', E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The right side and the left side of Abraham''s picture are the sheep on the right hand and the goats on the left at the judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-creation-foreshadowed',
       E'The creation foreshadowed in the expanse',
       E'Abraham is shown the whole work of the Maker laid out beneath him: *And He said to me: "Look, now, beneath thy feet at the firmaments, and understand the creation foreshadowed in this expanse, the creatures existing on it, and the age prepared according to it."* (Apocalypse of Abraham 21:1). It ain''t new — this is the opening of Genesis, the heavens and the earth and the dividing firmament: *In the beginning Elohim (God) created the heaven and the earth.* (Genesis 1:1) and *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* (Genesis 1:6). The patriarch beholds the very expanse and its teeming life: *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* (Genesis 1:20). And the psalmist, gazing on the same world, cries the same wonder: *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* (Psalms 104:24). The God who called Abram out of Ur is the God who made it all.',
       sv.verse_id, ev.verse_id, 'extras', 67500
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-leviathan-the-deep',
       E'Leviathan in the abyss of the waters',
       E'From the height Abraham looks down on the sea and its master: *I saw there the sea and its islands, and its monsters and its fishes, and Leviathan and his dominion, and his camping-ground, and his caves, and the world which lay upon him, and his movements, and the destructions of the world on his account.* (Apocalypse of Abraham 21:3). It ain''t new — Leviathan is no invention here; he is the great creature of the deep that no man can master: *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* (Job 41:1), and the playing monster of the wide sea: *There go the ships: there is that leviathan, whom thou hast made to play therein.* (Psalms 104:26). And the now-live witness of Enoch sets him in the very same abyss of the waters at the end: *And on that day were two monsters parted, a female monster whose name is Leviathan, dwelling in the abysses of the ocean over the fountains of the waters.* (1 Enoch 60:7). The chaos-beast is real, but he is a made thing, under the dominion of the One Abraham beholds.',
       sv.verse_id, ev.verse_id, 'extras', 67503
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-garden-of-eden',
       E'The Garden of Eden and its river',
       E'Abraham''s eye is led to the place of beginnings: *And I saw there the Garden of Eden and its fruits, the source of the stream issuing from it, and its trees and their bloom, and those who behaved righteously.* (Apocalypse of Abraham 21:5), and *And I saw therein their foods and blessedness.* (Apocalypse of Abraham 21:6). It ain''t new — this is the garden Yahuah planted in the east, with its trees and its single rising river: *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* (Genesis 2:8), and *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* (Genesis 2:10), and *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* (Genesis 2:9). The blessedness Abraham sees reserved for the righteous is the garden''s foods, the same Eden — paradise is not a new promise but the first home kept for those who behave righteously.',
       sv.verse_id, ev.verse_id, 'extras', 67506
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-21-two-peoples-right-left',
       E'The two peoples — the right and the left',
       E'At the last Abraham sees the multitude divided in two: *And I saw there a great multitude — men and women and children, half of them on the right side of the picture, and half of them on the left side of the picture.* (Apocalypse of Abraham 21:7). It ain''t new — election runs back to Rebekah''s womb, two peoples sundered before they had done good or ill: *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). And the same dividing stands at the end, when the Son of Adam separates the gathered nations: *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* (Matthew 25:32), *And he shall set the sheep on his right hand, but the goats on the left.* (Matthew 25:33). The right hand is the elect of Abraham''s seed and the left the heathen — election precedes confession, and it is not a church replacing Yashar''el but the dividing the Maker fixed from the womb to the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 67509
  FROM _session253_aoa21_lookup sv, _session253_aoa21_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-21-creation-foreshadowed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The creation Abraham is shown foreshadowed in the expanse is the very work of the first day of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* The "firmaments" beneath Abraham''s feet are the dividing firmament Elohim set in place.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:20 — *And Elohim (God) said, Let the waters bring forth abundantly the moving creature that hath life, and fowl that may fly above the earth in the open firmament of heaven.* The creatures and animate beings Abraham sees moving on the earth are the swarming life Elohim called forth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 104:24 — *O Yahuah (LORD), how manifold are thy works! in wisdom hast thou made them all: the earth is full of thy riches.* Abraham''s overview of all the creatures and their works is the psalmist''s wonder at the wisdom by which they were made.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-creation-foreshadowed'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-21-leviathan-the-deep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The Leviathan with his dominion and his caves that Abraham sees is the unmasterable sea-monster Yahuah sets before Job.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-leviathan-the-deep'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 104:26 — *There go the ships: there is that leviathan, whom thou hast made to play therein.* The sea with its islands and its monster in Abraham''s vision is the wide sea where the made Leviathan plays.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-leviathan-the-deep'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 60:7 — *And on that day were two monsters parted, a female monster whose name is Leviathan, dwelling in the abysses of the ocean over the fountains of the waters.* The Leviathan in his deep camping-ground that Abraham beholds is Enoch''s Leviathan dwelling in the abysses of the waters.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-leviathan-the-deep'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-21-garden-of-eden
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The Garden of Eden Abraham is shown is the very garden Yahuah planted eastward and set the man within.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-garden-of-eden'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:10 — *And a river went out of Eden to water the garden; and from thence it was parted, and became into four heads.* The source of the stream issuing from Eden that Abraham sees is the river that went out to water the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-garden-of-eden'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:9 — *And out of the ground made Yahuah Elohim (the LORD God) to grow every tree that is pleasant to the sight, and good for food; the tree of life also in the midst of the garden, and the tree of knowledge of good and evil.* The trees and their bloom and fruits Abraham beholds are the garden''s trees pleasant to the sight and good for food.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-garden-of-eden'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-21-two-peoples-right-left
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The multitude halved on the right and the left in Abraham''s vision is the two peoples Yahuah separated from the womb.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-two-peoples-right-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The two halves of the great multitude Abraham beholds are the nations the Son of Adam gathers and divides at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-two-peoples-right-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The right side and the left side of Abraham''s picture are the sheep on the right hand and the goats on the left at the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa21_lookup sv, _session253_aoa21_lookup tv
 WHERE t.slug='apocalypse-of-abraham-21-two-peoples-right-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_22.sql (session253 apocalypse-of-abraham 22) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa22 (view _session253_aoa22_lookup). Sort band base 67525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-22-the-word-planned-beforehand
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The commandment given to creation *through my Word* in Apocalypse of Abraham 22:3 is the same Word who was with Elohim in the beginning.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 3, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* That the creatures were commanded into being *through my Word* (Apocalypse of Abraham 22:3) is John''s confession that all things were made by Him.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 3, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Word through whom all is commanded in Apocalypse of Abraham 22:3 is He by whom all things were created and for whom they exist.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 4, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* What was *planned beforehand... ere it was created* (Apocalypse of Abraham 22:4) is the work of the Son by whom He made the worlds.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 4, 'canon', 'ephesians', 1, 4, 'free', E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* The picture that *stood before me ere it was created* (Apocalypse of Abraham 22:4) holds the elect chosen before the foundation of the world.'),
  -- thread: apocalypse-of-abraham-22-two-peoples-left-and-right
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side and right side of Apocalypse of Abraham 22:7-8 are the two manner of people separated from the bowels of Abraham''s own seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The destiny of judgement or restoration in Apocalypse of Abraham 22:7 is the same life-and-death set before the people in the Torah.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'matthew', 25, 33, 'free', E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The left for vengeance and the right set apart in Apocalypse of Abraham 22:7-8 is the very separation of the sheep and the goats at the end of the world.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 7, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two destinies of the multitude in Apocalypse of Abraham 22:7 are the broad way to destruction and the strait way to life.'),
  -- thread: apocalypse-of-abraham-22-azazel-bound
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 8, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The *peoples with Azazel* of Apocalypse of Abraham 22:8 are the multitude under the corruption that Enoch lays at the fallen Watcher''s feet.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 8, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel named in Apocalypse of Abraham 22:8 is the same fallen one Enoch sees bound and cast into the darkness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 8, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* That Abraham''s people are set apart out from *the peoples with Azazel* (Apocalypse of Abraham 22:8) is the deliverance from the one whose end is the fire of the great judgement.'),
  -- thread: apocalypse-of-abraham-22-called-my-people
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The seed *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) is the everlasting covenant seed promised to Abraham.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* To be *called My People* in Apocalypse of Abraham 22:9 is to be the special, chosen people of the Torah.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'hosea', 2, 23, 'free', E'Hosea 2:23 — *And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* The naming *called My People* in Apocalypse of Abraham 22:9 is the very word the Eternal speaks over His seed through Hosea.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', 'romans', 9, 25, 'free', E'Romans 9:25 — *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved.* That the seed is *ordained... to be called My People* (Apocalypse of Abraham 22:9) is the calling Paul confesses over the vessels of mercy afore prepared unto glory.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 22, 9, 'canon', '1-peter', 2, 9, 'free', E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The people *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) are the chosen generation called out of darkness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-the-word-planned-beforehand',
       E'Through My Word — all planned before it was made',
       E'Abraham, beholding the picture of the creatures, asks its meaning, and the Eternal answers: *This is my will with regard to those who exist in the divine world-counsel, and it seemed well-pleasing before my sight, and then afterwards I gave commandment to them through my Word.* (Apocalypse of Abraham 22:3) — *And it came to pass, whatever I had determined to be, was already planned beforehand in this picture, and it stood before me ere it was created, as thou hast seen.* (Apocalypse of Abraham 22:4). It ain''t new: the world is made by the Word, and nothing exists that He did not first determine. *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *All things were made by him; and without him was not any thing made that was made.* (John 1:3). The Son is *the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15), *For by him were all things created* (Colossians 1:16); and by Him the worlds were framed: *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds* (Hebrews 1:2). And the elect were *planned beforehand* — chosen *before the foundation of the world* (Ephesians 1:4). The picture is the Word''s eternal counsel; the same Word stood before Abraham as it stands before us.',
       sv.verse_id, ev.verse_id, 'extras', 67525
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-two-peoples-left-and-right',
       E'The two peoples — the left and the right hand',
       E'Abraham asks who the people in the picture are *on this side and on that*, and the Eternal divides them: *These which are on the left side are the multitude of the peoples which have formerly been in existence, and which are after thee destined, some for judgement and restoration, and others for vengeance and destruction at the end of the world.* (Apocalypse of Abraham 22:7) — *But these which are on the right side of the picture — they are the people set apart for me of the peoples with Azazel.* (Apocalypse of Abraham 22:8). It ain''t new: two manner of people were separated from the beginning. *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* (Genesis 25:23). The Torah sets the two before every soul: *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). And the Son of Adam divides them at the end as a shepherd divides his flock: *And he shall set the sheep on his right hand, but the goats on the left.* (Matthew 25:33) — the strait and the wide gate, *which leadeth unto life, and few there be that find it* (Matthew 7:14). The right hand is the set-apart seed; election precedes confession, and no church replaces the people set apart for Him.',
       sv.verse_id, ev.verse_id, 'extras', 67528
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-azazel-bound',
       E'The peoples with Azazel — the fallen one bound',
       E'The right-hand people are gathered *of the peoples with Azazel* (Apocalypse of Abraham 22:8) — set apart out from under the dominion of the fallen Watcher. It ain''t new: the live witness of the Watchers names Azazel and his end. To him the whole earth''s corruption is laid: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* (1 Enoch 10:8) — and his sentence is sealed: *Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4), *And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:6). Azazel is the system, the adversary who corrupts; the elect are drawn out from among the peoples he holds. The dismantling of his works, not the cursing of the seed, is the deliverance.',
       sv.verse_id, ev.verse_id, 'extras', 67531
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-22-called-my-people',
       E'Ordained to be born of thee and called My People',
       E'Of the right-hand seed the Eternal says: *These are they whom I have ordained to be born of thee and to be called My People.* (Apocalypse of Abraham 22:9). It ain''t new: the covenant with Abraham is to be Elohim to him and to his seed forever, the seed called by His Name. *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* (Genesis 17:7). They are the chosen, set-apart people: *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). And the Most High names them His own even from among them which were not a people: *And I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* (Hosea 2:23) — *I will call them my people, which were not my people; and her beloved, which was not beloved.* (Romans 9:25). The seed ordained before the picture was made is the *chosen generation, a royal priesthood, an holy nation* (1 Peter 2:9). My People — the seed kept, the covenant standing.',
       sv.verse_id, ev.verse_id, 'extras', 67534
  FROM _session253_aoa22_lookup sv, _session253_aoa22_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=22 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-22-the-word-planned-beforehand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The commandment given to creation *through my Word* in Apocalypse of Abraham 22:3 is the same Word who was with Elohim in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* That the creatures were commanded into being *through my Word* (Apocalypse of Abraham 22:3) is John''s confession that all things were made by Him.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Word through whom all is commanded in Apocalypse of Abraham 22:3 is He by whom all things were created and for whom they exist.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds;* What was *planned beforehand... ere it was created* (Apocalypse of Abraham 22:4) is the work of the Son by whom He made the worlds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 1:4 — *According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* The picture that *stood before me ere it was created* (Apocalypse of Abraham 22:4) holds the elect chosen before the foundation of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-the-word-planned-beforehand'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-22-two-peoples-left-and-right
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side and right side of Apocalypse of Abraham 22:7-8 are the two manner of people separated from the bowels of Abraham''s own seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The destiny of judgement or restoration in Apocalypse of Abraham 22:7 is the same life-and-death set before the people in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:33 — *And he shall set the sheep on his right hand, but the goats on the left.* The left for vengeance and the right set apart in Apocalypse of Abraham 22:7-8 is the very separation of the sheep and the goats at the end of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two destinies of the multitude in Apocalypse of Abraham 22:7 are the broad way to destruction and the strait way to life.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-two-peoples-left-and-right'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-22-azazel-bound
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The *peoples with Azazel* of Apocalypse of Abraham 22:8 are the multitude under the corruption that Enoch lays at the fallen Watcher''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-azazel-bound'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ’Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel named in Apocalypse of Abraham 22:8 is the same fallen one Enoch sees bound and cast into the darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-azazel-bound'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* That Abraham''s people are set apart out from *the peoples with Azazel* (Apocalypse of Abraham 22:8) is the deliverance from the one whose end is the fire of the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-azazel-bound'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-22-called-my-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The seed *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) is the everlasting covenant seed promised to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* To be *called My People* in Apocalypse of Abraham 22:9 is to be the special, chosen people of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 2:23 — *And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God).* The naming *called My People* in Apocalypse of Abraham 22:9 is the very word the Eternal speaks over His seed through Hosea.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 9:25 — *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved.* That the seed is *ordained... to be called My People* (Apocalypse of Abraham 22:9) is the calling Paul confesses over the vessels of mercy afore prepared unto glory.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The people *ordained to be born of thee and to be called My People* (Apocalypse of Abraham 22:9) are the chosen generation called out of darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa22_lookup sv, _session253_aoa22_lookup tv
 WHERE t.slug='apocalypse-of-abraham-22-called-my-people'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=22 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_23.sql (session253 apocalypse-of-abraham 23) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa23 (view _session253_aoa23_lookup). Sort band base 67550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-23-tree-eve-serpent
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 3, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent in form behind the tree in Abraham''s vision is this same subtil beast that questioned the woman in the Garden.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 4, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Abraham sees the very eating Moses recorded — both the man and the woman taking the fruit of the tree.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 4, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The serpent beguiling Eve under the tree is the same deception Sha''ul warns is still at work on the mind.'),
  -- thread: apocalypse-of-abraham-23-azazel-between-them
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel standing between Adam and Eve in Abraham''s vision is the same fallen Watcher whom Enoch saw bound and cast into the darkness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* Abraham''s word that Azazel is ''the beginning on the way to perdition'' matches Enoch''s verdict that to Azazel is ascribed all the corruption of the earth.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent-formed Azazel between the pair is unveiled by John as that old serpent who deceiveth the whole world.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'canon', 'leviticus', 16, 8, 'free', E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The name Azazel is no invention of Abraham''s vision — Torah set it as the lot opposed to Yahuah on the Day of Atonement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel the ungodly one belongs to the fallen angels Jude says are reserved in chains under darkness for the judgment.'),
  -- thread: apocalypse-of-abraham-23-evil-chosen-not-forced
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 9, 'canon', 'james', 1, 13, 'free', E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man:* The Eternal''s word that He gives the tempter power only over them who will to do evil keeps the same line Ya''akov draws — Elohim tempts no man.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 9, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Abraham hears that the power falls upon those who will the evil — the man drawn away of his own lust, just as Ya''akov teaches.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 11, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Abraham''s struggle over why evil should be desired meets Moses'' charge that life and death, good and evil, are set before man to choose.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 11, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The desire of evil that angers the Eternal is answered by the covenant call to choose life, that the seed may live.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-23-tree-eve-serpent',
       E'The Man, the Woman, and the Serpent Under the Tree',
       E'Abraham is shown the fall as a living picture: *And I saw there a man very great in height and fearful in breadth, incomparable in aspect, embracing a woman, who likewise approximated to the aspect and shape of the man.* (Apocalypse of Abraham 23:3) — *And they were standing under a tree of the Garden of Eden, and the fruit of this tree was like the appearance of a bunch of grapes of the vine, and behind the tree was standing as it were a serpent in form... and both were eating it whom I had seen embracing.* (Apocalypse of Abraham 23:4) It ain''t new — this is Eden retold. *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1) The eating that undid the pair: *And when the woman saw that the tree was good for food... she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6) Sha''ul reads the same scene as a present peril: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* (2 Corinthians 11:3)',
       sv.verse_id, ev.verse_id, 'extras', 67550
  FROM _session253_aoa23_lookup sv, _session253_aoa23_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-23-azazel-between-them',
       E'Azazel Between Them — the Old Serpent, the Fallen Watcher',
       E'The figure between the embracing pair is named: *but he who is between them representeth ungodliness, their beginning on the way to perdition, even Azazel.* (Apocalypse of Abraham 23:6) The serpent of Eden is unmasked as the rebel spirit — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9) This Azazel is no new villain; the Watchers'' chief is bound by the very name in the live witness of Enoch: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness... and let him abide there for ever.* (1 Enoch 10:4) *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* (1 Enoch 10:8) Torah already set his name and his lot apart: *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* (Leviticus 16:8) And the apostate angels await the same judgment: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6)',
       sv.verse_id, ev.verse_id, 'extras', 67553
  FROM _session253_aoa23_lookup sv, _session253_aoa23_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-23-evil-chosen-not-forced',
       E'Power Over Them That Will to Do Evil',
       E'Abraham presses the hard question of why such power was given, and the answer guards the freedom of the will: *And He said to me: "They who will to do evil — and how much I hated it in those who do it! — over them I gave him power, and to be beloved of them."* (Apocalypse of Abraham 23:9) Evil is not laid upon a man from above but is chosen by his own desire — it ain''t new. *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man:* (James 1:13) *But every man is tempted, when he is drawn away of his own lust, and enticed.* (James 1:14) And Moses set the same choice before the seed at the threshold of the land: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15) *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19)',
       sv.verse_id, ev.verse_id, 'extras', 67556
  FROM _session253_aoa23_lookup sv, _session253_aoa23_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=23 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-23-tree-eve-serpent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent in form behind the tree in Abraham''s vision is this same subtil beast that questioned the woman in the Garden.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-tree-eve-serpent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Abraham sees the very eating Moses recorded — both the man and the woman taking the fruit of the tree.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-tree-eve-serpent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The serpent beguiling Eve under the tree is the same deception Sha''ul warns is still at work on the mind.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-tree-eve-serpent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-23-azazel-between-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel standing between Adam and Eve in Abraham''s vision is the same fallen Watcher whom Enoch saw bound and cast into the darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* Abraham''s word that Azazel is ''the beginning on the way to perdition'' matches Enoch''s verdict that to Azazel is ascribed all the corruption of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent-formed Azazel between the pair is unveiled by John as that old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The name Azazel is no invention of Abraham''s vision — Torah set it as the lot opposed to Yahuah on the Day of Atonement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel the ungodly one belongs to the fallen angels Jude says are reserved in chains under darkness for the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-23-evil-chosen-not-forced
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man:* The Eternal''s word that He gives the tempter power only over them who will to do evil keeps the same line Ya''akov draws — Elohim tempts no man.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Abraham hears that the power falls upon those who will the evil — the man drawn away of his own lust, just as Ya''akov teaches.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Abraham''s struggle over why evil should be desired meets Moses'' charge that life and death, good and evil, are set before man to choose.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The desire of evil that angers the Eternal is answered by the covenant call to choose life, that the seed may live.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_24.sql (session253 apocalypse-of-abraham 24) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa24 (view _session253_aoa24_lookup). Sort band base 67575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-24-the-cunning-adversary
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Abraham''s "cunning Adversary" beside Adam and Eve is the subtil serpent of the garden, the same fallen one.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Yahusha names the Adversary "a murderer from the beginning" — exactly the one through whom Cain "acted lawlessly" in Abraham''s vision.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The apostle reads Cain just as Abraham sees him: slaughtering Abel "through the Adversary," the works of the wicked one against the righteous.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 3, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The destruction Abraham sees brought upon Abel through the lawless one is the one death that, entering in Eden, "passed upon all men."'),
  -- thread: apocalypse-of-abraham-24-impurity-and-desire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 7, 'canon', 'james', 1, 15, 'free', E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Abraham''s Desire holding "the head of every kind of lawlessness" and her "waste assigned to perdition" is exactly lust conceiving and bringing forth death.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 4, 'canon', 'romans', 1, 24, 'free', E'Romans 1:24 — *Wherefore Elohim (God) also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves.* The "Impurity, and those who lust after it, and its pollution" that Abraham sees is the same uncleanness men are given up to through the lust of their hearts.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 4, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* The now-restored Watchers'' corruption of the earth is the same fountain of "Impurity" and "the fire of their corruption" Abraham beholds laid up in the lowest parts of the earth.'),
  -- thread: apocalypse-of-abraham-24-theft-and-the-broken-law
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 5, 'canon', 'exodus', 20, 15, 'free', E'Exodus 20:15 — *Thou shalt not steal.* The "Theft, and those who hasten after it" that Abraham sees set for the Great Assize is the open breach of the eighth word spoken at Sinai.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 6, 'canon', 'exodus', 20, 14, 'free', E'Exodus 20:14 — *Thou shalt not commit adultery.* The "naked men... and their passion which they had against each other" arrayed for retribution are the trespass of the seventh word; Torah stands and the breaking of it is judged.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 24, 5, 'canon', 'matthew', 15, 19, 'free', E'Matthew 15:19 — *For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies.* Yahusha''s catalogue of what defiles a man is the same roll of Theft and lawless passion Abraham sees handed to the Great Assize.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-24-the-cunning-adversary',
       E'The Cunning Adversary in the Picture of Creation',
       E'Abraham, lifted to the throne, is shown the whole sweep of the ages in one picture: *And I looked and saw there what was before me in creation: I saw Adam, and Eve existing with him, and with them the cunning Adversary, and Cain who acted lawlessly through the Adversary, and the slaughtered Abel, and the destruction brought and caused upon him through the lawless one.* (Apocalypse of Abraham 24:3). It ain''t new — this is Eden itself unrolled. The cunning Adversary is the serpent of the garden: *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made* (Genesis 3:1). Yahusha named that same one the father of the first murder: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth* (John 8:44). And the apostle reads Cain exactly as Abraham sees him — slaying through the wicked one: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). The one death loosed in Eden is the death loosed on all: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12).',
       sv.verse_id, ev.verse_id, 'extras', 67575
  FROM _session253_aoa24_lookup sv, _session253_aoa24_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=24 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-24-impurity-and-desire',
       E'Impurity, Lust, and the Daughter Desire',
       E'The picture turns to the powers that breed in men: *I saw there also Impurity, and those who lust after it, and its pollution, and their jealousy, and the fire of their corruption in the lowest parts of the earth* (Apocalypse of Abraham 24:4); and at the end of the catalogue, *I saw there Desire, and in her hand the head of every kind of lawlessness, and her scorn and her waste assigned to perdition* (Apocalypse of Abraham 24:7). Desire holding "the head of every kind of lawlessness" is the very anatomy James draws of sin''s birth: *But every man is tempted, when he is drawn away of his own lust, and enticed. Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:14-15). It ain''t new — Sha''ul saw the same handing-over to uncleanness: *Wherefore Elohim (God) also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves* (Romans 1:24). And the Watchers'' lesson in lawlessness, now restored, names the root: *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways* (1 Enoch 8:2).',
       sv.verse_id, ev.verse_id, 'extras', 67578
  FROM _session253_aoa24_lookup sv, _session253_aoa24_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=24 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-24-theft-and-the-broken-law',
       E'Theft, Nakedness, and the Great Assize',
       E'Abraham sees the breaches of Torah arrayed for judgment: *I saw there Theft, and those who hasten after it, and the arrangement of their retribution, the judgement of the Great Assize* (Apocalypse of Abraham 24:5); *I saw there naked men, the foreheads against each other, and their disgrace, and their passion which they had against each other, and their retribution* (Apocalypse of Abraham 24:6). These are not abstractions — they are the very words spoken from Sinai: *Thou shalt not commit adultery* (Exodus 20:14) and *Thou shalt not steal* (Exodus 20:15). Torah stands; what Abraham sees catalogued is the breaking of it, set for the Great Assize. It ain''t new — Yahusha located the same flood in the heart: *For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies* (Matthew 15:19). The retribution Abraham sees "arranged" is the just recompense of a covenant defied.',
       sv.verse_id, ev.verse_id, 'extras', 67581
  FROM _session253_aoa24_lookup sv, _session253_aoa24_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=24 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-24-the-cunning-adversary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Abraham''s "cunning Adversary" beside Adam and Eve is the subtil serpent of the garden, the same fallen one.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Yahusha names the Adversary "a murderer from the beginning" — exactly the one through whom Cain "acted lawlessly" in Abraham''s vision.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The apostle reads Cain just as Abraham sees him: slaughtering Abel "through the Adversary," the works of the wicked one against the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* The destruction Abraham sees brought upon Abel through the lawless one is the one death that, entering in Eden, "passed upon all men."'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-the-cunning-adversary'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-24-impurity-and-desire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Abraham''s Desire holding "the head of every kind of lawlessness" and her "waste assigned to perdition" is exactly lust conceiving and bringing forth death.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-impurity-and-desire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:24 — *Wherefore Elohim (God) also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves.* The "Impurity, and those who lust after it, and its pollution" that Abraham sees is the same uncleanness men are given up to through the lust of their hearts.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-impurity-and-desire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways.* The now-restored Watchers'' corruption of the earth is the same fountain of "Impurity" and "the fire of their corruption" Abraham beholds laid up in the lowest parts of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-impurity-and-desire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-24-theft-and-the-broken-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:15 — *Thou shalt not steal.* The "Theft, and those who hasten after it" that Abraham sees set for the Great Assize is the open breach of the eighth word spoken at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-theft-and-the-broken-law'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:14 — *Thou shalt not commit adultery.* The "naked men... and their passion which they had against each other" arrayed for retribution are the trespass of the seventh word; Torah stands and the breaking of it is judged.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-theft-and-the-broken-law'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 15:19 — *For out of the heart proceed evil thoughts, murders, adulteries, fornications, thefts, false witness, blasphemies.* Yahusha''s catalogue of what defiles a man is the same roll of Theft and lawless passion Abraham sees handed to the Great Assize.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa24_lookup sv, _session253_aoa24_lookup tv
 WHERE t.slug='apocalypse-of-abraham-24-theft-and-the-broken-law'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_25.sql (session253 apocalypse-of-abraham 25) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa25 (view _session253_aoa25_lookup). Sort band base 67600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-25-idol-of-jealousy
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 1, 'canon', 'ezekiel', 8, 3, 'free', E'Ezekiel 8:3 — *And he put forth the form of an hand, and took me by a lock of mine head; and the spirit lifted me up between the earth and the heaven, and brought me in the visions of Elohim (God) to Jerusalem, to the door of the inner gate that looketh toward the north; where was the seat of the image of jealousy, which provoketh to jealousy.* Ezekiel, like Abraham, is carried up in vision to behold the very idol of jealousy set within the sanctuary.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'ezekiel', 8, 6, 'free', E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The idol is the anger whereby the people, proceeding from Abraham''s own generation, drive the glory far off — the statue that is His anger (25:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 1, 'canon', 'exodus', 20, 4, 'free', E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* The bronze statue of woodwork before which a man bows is the broken second word, the graven image forbidden at Sinai.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'exodus', 20, 5, 'free', E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very name ''idol of jealousy'' names the jealous Elohim provoked by it — the statue is His anger against a people who bow where they should not.'),
  -- thread: apocalypse-of-abraham-25-temple-beneath-the-throne
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 3, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Temple''s beauty ''like the glory that lieth beneath Thy throne'' is the earthly shadow of the heavenly glory that sits at the right hand on high.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 5, 'canon', 'exodus', 30, 8, 'free', E'Exodus 30:8 — *And when Aaron lighteth the lamps at even, he shall burn incense upon it, a perpetual incense before Yahuah (LORD) throughout your generations.* The Temple in which ''dwelleth every single prayer of man'' is the altar of perpetual incense, prayer rising before the Name throughout the generations.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 5, 'canon', 'ezekiel', 8, 16, 'free', E'Ezekiel 8:16 — *And he brought me into the inner court of the LORD''S house, and, behold, at the door of the temple of Yahuah (LORD), between the porch and the altar, were about five and twenty men, with their backs toward the temple of Yahuah (LORD), and their faces toward the east; and they worshipped the sun toward the east.* The priesthood ordained for the glorious Name is the very thing inverted when men turn their backs on the sanctuary to worship the sun.'),
  -- thread: apocalypse-of-abraham-25-desolation-foreseen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'daniel', 9, 27, 'free', E'Daniel 9:27 — *And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate.* The statue that is His anger against Abraham''s seed is the abomination that brings the sanctuary to desolation.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 6, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The idol of jealousy Abraham beheld in the holy place is the abomination of desolation Yahusha warns His disciples to recognize.'),
  -- thread: apocalypse-of-abraham-25-blood-witness-final-judgement
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 1, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The boy slain before the idol is innocent blood that, like Abel''s from the beginning, cries up to heaven as a witness for judgement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 7, 'canon', 'matthew', 24, 13, 'free', E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The murderous sacrifices witness to the final judgement; the elect who endure unto that end are saved through it.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 25, 7, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* As the doom of Azazel the corrupter was decreed from of old, so the inciter of murderous sacrifices is held over for the final judgement appointed even at the beginning of creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-idol-of-jealousy',
       E'The idol of jealousy in the holy place',
       E'Abraham, borne up to the throne, is shown what his own seed will do: *I saw there the likeness of the idol of jealousy, having the likeness of woodwork such as my father was wont to make, and its statue was of glittering bronze; and before it a man, and he worshipped it; and in front of him an altar, and upon it a boy slain in the presence of the idol.* (Apocalypse of Abraham 25:1). It ain''t new — Ezekiel sees the very same thing set in the LORD''s house: *And he put forth the form of an hand, and took me by a lock of mine head; and the spirit lifted me up between the earth and the heaven, and brought me in the visions of Elohim (God) to Jerusalem, to the door of the inner gate that looketh toward the north; where was the seat of the image of jealousy, which provoketh to jealousy.* (Ezekiel 8:3), the great abominations *that I should go far off from my sanctuary* (Ezekiel 8:6). And the idol of jealousy is jealousy against the second word given at Sinai: *Thou shalt not make unto thee any graven image* (Exodus 20:4), *for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:5). The statue is the anger of a covenant people who break the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67600
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-temple-beneath-the-throne',
       E'The Temple, beautiful as the glory beneath the throne',
       E'Abraham marvels at the sanctuary''s beauty: *Or what is the Temple which I see that is beautiful in art, and its beauty being like the glory that lieth beneath Thy throne?* (Apocalypse of Abraham 25:3), and is told it is the priesthood of the glorious Name, *in which dwelleth every single prayer of man, and the rise of kings and prophets, and whatever sacrifice I ordain to be offered to me among my people who are to come out of thy generation* (Apocalypse of Abraham 25:5). It ain''t new — the earthly house is patterned on the heavenly: the express image of His glory upholds all things, *the brightness of his glory, and the express image of his person* (Hebrews 1:3). At that altar prayer ascends continually as ordained incense, *a perpetual incense before Yahuah (LORD) throughout your generations* (Exodus 30:8). And its desecration is the same Ezekiel saw — backs to the temple, faces to the sun (Ezekiel 8:16) — the inversion of the priesthood of the Name.',
       sv.verse_id, ev.verse_id, 'extras', 67603
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-desolation-foreseen',
       E'The people''s anger and the desolation foreseen',
       E'The statue is named as judgement upon the seed: *But the statue which thou sawest is mine anger, wherewith the people anger me who are to proceed for me from thee* (Apocalypse of Abraham 25:6). This is the abomination that makes desolate, shown to Abraham long before it stood. It ain''t new — Daniel sets the same idol in the same place: *and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate* (Daniel 9:27); and Yahusha reads Daniel forward to the last day: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). The idol of jealousy, the desolation, the abomination — one witness across Abraham, Ezekiel, Daniel, and the Messiah''s own mouth.',
       sv.verse_id, ev.verse_id, 'extras', 67606
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-25-blood-witness-final-judgement',
       E'The slain witness and the final judgement at the beginning',
       E'The man slaughtering is interpreted: *But the man whom thou sawest slaughtering — that is he who inciteth murderous sacrifices, which are a witness to me of the final judgement, even at the beginning of creation* (Apocalypse of Abraham 25:7) — the boy slain before the idol (Apocalypse of Abraham 25:1) is innocent blood that cries to heaven. It ain''t new — from the beginning the first slain brother''s blood is the standing witness: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). The endurance unto the end is the answer to it: *But he that shall endure unto the end, the same shall be saved* (Matthew 24:13). And the appointed day for the inciter of corruption is already set, as it was set over Azazel — *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6) — the final judgement decreed even at the beginning of creation.',
       sv.verse_id, ev.verse_id, 'extras', 67609
  FROM _session253_aoa25_lookup sv, _session253_aoa25_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=25 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-25-idol-of-jealousy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 8:3 — *And he put forth the form of an hand, and took me by a lock of mine head; and the spirit lifted me up between the earth and the heaven, and brought me in the visions of Elohim (God) to Jerusalem, to the door of the inner gate that looketh toward the north; where was the seat of the image of jealousy, which provoketh to jealousy.* Ezekiel, like Abraham, is carried up in vision to behold the very idol of jealousy set within the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The idol is the anger whereby the people, proceeding from Abraham''s own generation, drive the glory far off — the statue that is His anger (25:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* The bronze statue of woodwork before which a man bows is the broken second word, the graven image forbidden at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 20:5 — *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me;* The very name ''idol of jealousy'' names the jealous Elohim provoked by it — the statue is His anger against a people who bow where they should not.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-idol-of-jealousy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-25-temple-beneath-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Temple''s beauty ''like the glory that lieth beneath Thy throne'' is the earthly shadow of the heavenly glory that sits at the right hand on high.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-temple-beneath-the-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 30:8 — *And when Aaron lighteth the lamps at even, he shall burn incense upon it, a perpetual incense before Yahuah (LORD) throughout your generations.* The Temple in which ''dwelleth every single prayer of man'' is the altar of perpetual incense, prayer rising before the Name throughout the generations.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-temple-beneath-the-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 8:16 — *And he brought me into the inner court of the LORD''S house, and, behold, at the door of the temple of Yahuah (LORD), between the porch and the altar, were about five and twenty men, with their backs toward the temple of Yahuah (LORD), and their faces toward the east; and they worshipped the sun toward the east.* The priesthood ordained for the glorious Name is the very thing inverted when men turn their backs on the sanctuary to worship the sun.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-temple-beneath-the-throne'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-25-desolation-foreseen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:27 — *And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate, even until the consummation, and that determined shall be poured upon the desolate.* The statue that is His anger against Abraham''s seed is the abomination that brings the sanctuary to desolation.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-desolation-foreseen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The idol of jealousy Abraham beheld in the holy place is the abomination of desolation Yahusha warns His disciples to recognize.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-desolation-foreseen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-25-blood-witness-final-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The boy slain before the idol is innocent blood that, like Abel''s from the beginning, cries up to heaven as a witness for judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-blood-witness-final-judgement'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The murderous sacrifices witness to the final judgement; the elect who endure unto that end are saved through it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-blood-witness-final-judgement'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* As the doom of Azazel the corrupter was decreed from of old, so the inciter of murderous sacrifices is held over for the final judgement appointed even at the beginning of creation.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa25_lookup sv, _session253_aoa25_lookup tv
 WHERE t.slug='apocalypse-of-abraham-25-blood-witness-final-judgement'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_26.sql (session253 apocalypse-of-abraham 26) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa26 (view _session253_aoa26_lookup). Sort band base 67625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-26-terah-perished-idols
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 4, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very Terah whose unceasing idolatry the Eternal lays before Abraham in 26:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 4, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven vanity Terah served and perished by is the same blindness the prophet unmasks, the idol that cannot save the one who makes it.'),
  -- thread: apocalypse-of-abraham-26-two-counsels-choose
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 6, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Terah''s not choosing to listen is exactly the death-and-evil that 26:6 says he chose, while Abraham chose the life set before him.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 6, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the very ''choose to listen'' of 26:6 — Terah refused the choosing of life that Moses lays on every hearer.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 6, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the broad way of Terah''s idols against Abraham''s refusal to follow his works in 26:6 — the same two-ways the Messiah preaches.'),
  -- thread: apocalypse-of-abraham-26-counsel-of-my-will-foreknown
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 8, 'canon', 'isaiah', 46, 9, 'free', E'Isaiah 46:9 — *Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me,* the One whose counsel of will in 26:8 is set against the dead idols of Terah, for there is none else.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 8, 'canon', 'isaiah', 46, 10, 'free', E'Isaiah 46:10 — *Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure:* the very counsel of the Eternal''s will, ready for the coming days before Abraham can see it, in 26:8.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 8, 'canon', 'romans', 8, 29, 'free', E'Romans 8:29 — *For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren.* The counsel ready in Him before Abraham''s knowledge (26:8) is the same foreknowing purpose that goes before the elect.'),
  -- thread: apocalypse-of-abraham-26-seed-in-the-picture
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 9, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''look in the picture'' of the seed in 26:9 is the same showing of Abraham''s innumerable seed, here pictured rather than told in stars.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 9, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The two peoples Abraham beholds in the picture (26:9) are foretold from the womb — election dividing the seed before any work is done.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 9, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* the seed shown in the picture (26:9) is chosen by the standing purpose of election, not of works, the elect of Abraham kept.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-terah-perished-idols',
       E'Terah''s devilish idolatry, and his perishing',
       E'The Eternal answers Abraham concerning his father: *"Why did thy father Terah not listen to thy voice, and why did he not cease from the devilish idolatry until he perished, and his whole household with him?"* (Apocalypse of Abraham 26:4). It ain''t new — this is the very testimony Joshua set before the tribes at Shechem: *"Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods"* (Joshua 24:2). The idols Abraham fled were the same vanity the prophet exposed: *"They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed"* (Isaiah 44:9). Terah''s household perishes with the gods that cannot save — the system, not the man''s seed, is what is dismantled.',
       sv.verse_id, ev.verse_id, 'extras', 67625
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-two-counsels-choose',
       E'He did not choose to listen — the two counsels set before a man',
       E'Abraham answers that Terah''s ruin was no decree but a refusal: *"It was entirely because he did not choose to listen to me; but I, too, did not follow his works"* (Apocalypse of Abraham 26:6). This is the Torah''s own setting of life and death before every man: *"See, I have set before thee this day life and good, and death and evil"* (Deuteronomy 30:15), *"I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live"* (Deuteronomy 30:19). The Messiah set the same fork in the road: *"Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat"* (Matthew 7:13). Terah took the broad way of his idols; Abraham did not follow his father''s works — two ways, two ends, the choice honest and the Torah standing.',
       sv.verse_id, ev.verse_id, 'extras', 67628
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-counsel-of-my-will-foreknown',
       E'The counsel of My will, ready before thou hast knowledge',
       E'The Eternal lifts Abraham past the riddle of Terah to the surer ground of His own purpose: *"As the counsel of thy father is in him, and as thy counsel is in thee, so also is the counsel of my will in me ready for the coming days, before thou hast knowledge of these, or canst see with thine eyes what is future in them"* (Apocalypse of Abraham 26:8). It ain''t new — this is the prophet''s God who alone declares the end from the beginning: *"Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me"* (Isaiah 46:9), *"Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure"* (Isaiah 46:10). Paul carries the same standing counsel of election: *"For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren"* (Romans 8:29). The counsel of His will is ready before Abraham knows it — the purpose stands of Him that calleth.',
       sv.verse_id, ev.verse_id, 'extras', 67631
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-seed-in-the-picture',
       E'Look in the picture — those of thy seed',
       E'The chapter closes with the showing of the seed: *"How those of thy seed will be, look in the picture"* (Apocalypse of Abraham 26:9). This is the night the Eternal first brought Abraham out to number the seed: *"And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be"* (Genesis 15:5) — there he was bidden look up, here bidden look in the picture. And the seed shown is the two peoples already promised in the womb: *"And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger"* (Genesis 25:23). The election precedes the doing: *"(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)"* (Romans 9:11). What Abraham beholds in the picture is the chosen seed — Israel kept, not a people replacing it.',
       sv.verse_id, ev.verse_id, 'extras', 67634
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-26-terah-perished-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very Terah whose unceasing idolatry the Eternal lays before Abraham in 26:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-terah-perished-idols'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven vanity Terah served and perished by is the same blindness the prophet unmasks, the idol that cannot save the one who makes it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-terah-perished-idols'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-26-two-counsels-choose
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Terah''s not choosing to listen is exactly the death-and-evil that 26:6 says he chose, while Abraham chose the life set before him.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-two-counsels-choose'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the very ''choose to listen'' of 26:6 — Terah refused the choosing of life that Moses lays on every hearer.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-two-counsels-choose'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the broad way of Terah''s idols against Abraham''s refusal to follow his works in 26:6 — the same two-ways the Messiah preaches.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-two-counsels-choose'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-26-counsel-of-my-will-foreknown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 46:9 — *Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me,* the One whose counsel of will in 26:8 is set against the dead idols of Terah, for there is none else.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-counsel-of-my-will-foreknown'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 46:10 — *Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure:* the very counsel of the Eternal''s will, ready for the coming days before Abraham can see it, in 26:8.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-counsel-of-my-will-foreknown'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:29 — *For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren.* The counsel ready in Him before Abraham''s knowledge (26:8) is the same foreknowing purpose that goes before the elect.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-counsel-of-my-will-foreknown'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-26-seed-in-the-picture
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''look in the picture'' of the seed in 26:9 is the same showing of Abraham''s innumerable seed, here pictured rather than told in stars.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-seed-in-the-picture'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The two peoples Abraham beholds in the picture (26:9) are foretold from the womb — election dividing the seed before any work is done.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-seed-in-the-picture'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* the seed shown in the picture (26:9) is chosen by the standing purpose of election, not of works, the elect of Abraham kept.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-seed-in-the-picture'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_27.sql (session253 apocalypse-of-abraham 27) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa27 (view _session253_aoa27_lookup). Sort band base 67650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-27-temple-burnt-with-fire
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 2, 'canon', '2-kings', 25, 9, 'free', E'2 Kings 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire.* The history fulfils to the letter what Abraham was shown of the Temple burnt with fire in Apocalypse of Abraham 27:2.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 2, 'canon', 'lamentations', 1, 10, 'free', E'Lamentations 1:10 — *The adversary hath spread out his hand upon all her pleasant things: for she hath seen that the heathen entered into her sanctuary, whom thou didst command that they should not enter into thy congregation.* The plundering of the holy things in Apocalypse of Abraham 27:2 is the heathen spreading his hand on her pleasant things.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'psalms', 79, 1, 'free', E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s lament that the hordes plunder and rob the beautiful things in Apocalypse of Abraham 27:4 is the psalmist''s cry over the defiled temple.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The desolation Abraham foresaw in Apocalypse of Abraham 27:4 the Messiah carries forward as the sign yet to be watched for.'),
  -- thread: apocalypse-of-abraham-27-people-that-spring-from-me
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'psalms', 79, 1, 'free', E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s grief that the heathen plunder the people that spring from him in Apocalypse of Abraham 27:4 is the psalmist''s grief over the inheritance overrun.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 6, 'canon', 'lamentations', 1, 9, 'free', E'Lamentations 1:9 — *Her filthiness is in her skirts; she remembereth not her last end; therefore she came down wonderfully: she had no comforter. O Yahuah (LORD), behold my affliction: for the enemy hath magnified himself.* Abraham''s lacerated heart in Apocalypse of Abraham 27:6 is the same cry that the enemy has magnified himself over the city.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 4, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The people Yahuah accepted in Apocalypse of Abraham 27:4 are the elect seed marked out by election from the womb, not a people replacing them.'),
  -- thread: apocalypse-of-abraham-27-statue-of-jealousy-and-blood
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'ezekiel', 8, 5, 'free', E'Ezekiel 8:5 — *Then said he unto me, Son of Adam, lift up thine eyes now the way toward the north. So I lifted up mine eyes the way toward the north, and behold northward at the gate of the altar this image of jealousy in the entry.* The statue Abraham saw that angers Yahuah in Apocalypse of Abraham 27:8 is Ezekiel''s image of jealousy set in the sanctuary.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'ezekiel', 8, 6, 'free', E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The seed''s provoking by the statue in Apocalypse of Abraham 27:8 is the abomination that drives Yahuah from His sanctuary.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'psalms', 106, 38, 'free', E'Psalm 106:38 — *And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood.* The human slaughter in the Temple in Apocalypse of Abraham 27:8 is the innocent blood poured out to idols that pollutes the land.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 8, 'canon', 'jeremiah', 7, 14, 'free', E'Jeremiah 7:14 — *Therefore will I do unto this house, which is called by my name, wherein ye trust, and unto the place which I gave to you and to your fathers, as I have done to Shiloh.* Because of the idol and the blood in Apocalypse of Abraham 27:8 the house called by Yahuah''s name is given over, as Shiloh was.'),
  -- thread: apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 10, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Abraham''s plea to be shown those who fulfilled the commandments in Apocalypse of Abraham 27:10 is the choice of life Moses set before the seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 10, 'canon', 'psalms', 15, 2, 'free', E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The ones who fulfilled the commandments and the works of righteousness in Apocalypse of Abraham 27:10 are the ones who walk uprightly and work righteousness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 13, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The split between the righteous and the men who care for their interests in Apocalypse of Abraham 27:12-13 is the narrow way the few find against the broad way.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 27, 13, 'canon', 'malachi', 3, 18, 'free', E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The two issues Yahuah names to Abraham in Apocalypse of Abraham 27:12-13 are the very discernment between him that serveth Elohim and him that serveth not.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-temple-burnt-with-fire',
       E'The heathen burn the Temple — it ain''t new',
       E'Abraham beholds it long before it falls: *Lo, I saw them run towards them through four entrances, and they burnt the Temple with fire, and the holy things that were therein they plundered* (Apocalypse of Abraham 27:2), *and the Temple they have burnt with fire, and the beautiful things therein they do rob and destroy* (Apocalypse of Abraham 27:4). The vision is the very thing Scripture records and forewarns. Nebuzar-adan does exactly this: *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire* (2 Kings 25:9). The psalmist mourns the plunder of the holy things: *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps* (Psalm 79:1). Jeremiah of the lament sees the same hand: *The adversary hath spread out his hand upon all her pleasant things: for she hath seen that the heathen entered into her sanctuary, whom thou didst command that they should not enter into thy congregation* (Lamentations 1:10). And the Messiah carries it forward to the abomination that desolates: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Abraham was shown the whole pattern.',
       sv.verse_id, ev.verse_id, 'extras', 67650
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-people-that-spring-from-me',
       E'Abraham pleads for the people that spring from him',
       E'Seeing his own seed slaughtered and held as aliens, Abraham cries: *Lo, the people that spring from me, whom Thou hast accepted, the hordes of the heathen do plunder, and some they kill, while others they hold fast as aliens* (Apocalypse of Abraham 27:4), and again, *wherefore hast Thou now lacerated my heart, and why should this be so?* (Apocalypse of Abraham 27:6). It is the intercessor''s same wounded plea that runs through the prophets. The psalmist over the defiled inheritance speaks for him: *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps* (Psalm 79:1). Jeremiah''s lament owns the affliction: *O Yahuah (LORD), behold my affliction: for the enemy hath magnified himself* (Lamentations 1:9). Yet the covenant with this people is never revoked — Yahuah accepted Abraham''s seed by election, as He told Rebekah: *Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). Abraham grieves precisely because the accepted seed is held fast as aliens.',
       sv.verse_id, ev.verse_id, 'extras', 67653
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-statue-of-jealousy-and-blood',
       E'The statue, the bloodshed, the zeal in the Temple',
       E'The reason of the desolation is named: *What thou hast seen shall happen on account of thy seed who anger me by reason of the statue which thou sawest, and on account of the human slaughter in the picture, through zeal in the Temple* (Apocalypse of Abraham 27:8). This is the very charge Ezekiel was carried to see in the visions of Elohim: *behold northward at the gate of the altar this image of jealousy in the entry* (Ezekiel 8:5), the idol that provokes Yahuah to fury — *even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary?* (Ezekiel 8:6). And the human slaughter is the innocent blood the prophets indict: *And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood* (Psalm 106:38). When the idol stands and the blood is shed, the sanctuary is given over: *Therefore will I do unto this house, which is called by my name, wherein ye trust, and unto the place which I gave to you and to your fathers, as I have done to Shiloh* (Jeremiah 7:14). It ain''t new — Abraham was shown the cause before the cause was committed.',
       sv.verse_id, ev.verse_id, 'extras', 67656
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking',
       E'The two ways — those who keep the commandments and those who seek their own',
       E'Abraham turns from the works of evil and asks to be shown the other people: *show me those who fulfilled the commandments, even the works of his righteousness* (Apocalypse of Abraham 27:10), and the answer divides the times by holiness and by self-seeking — *The time of the righteous meeteth them first through the holiness flowing from kings and righteous-dealing rulers* (Apocalypse of Abraham 27:12), *But from these issue men who care for their interests* (Apocalypse of Abraham 27:13). This is the two ways laid down from the beginning. Moses set them before Yashar''el: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The righteous Abraham seeks are those who do the commandments: *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart* (Psalm 15:2). The Messiah set the same narrow and broad before the multitudes: *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). And the day comes that divides them visibly: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). Election precedes confession; the commandments stand.',
       sv.verse_id, ev.verse_id, 'extras', 67659
  FROM _session253_aoa27_lookup sv, _session253_aoa27_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=10
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=27 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-27-temple-burnt-with-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem, and every great man''s house burnt he with fire.* The history fulfils to the letter what Abraham was shown of the Temple burnt with fire in Apocalypse of Abraham 27:2.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:10 — *The adversary hath spread out his hand upon all her pleasant things: for she hath seen that the heathen entered into her sanctuary, whom thou didst command that they should not enter into thy congregation.* The plundering of the holy things in Apocalypse of Abraham 27:2 is the heathen spreading his hand on her pleasant things.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s lament that the hordes plunder and rob the beautiful things in Apocalypse of Abraham 27:4 is the psalmist''s cry over the defiled temple.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The desolation Abraham foresaw in Apocalypse of Abraham 27:4 the Messiah carries forward as the sign yet to be watched for.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-temple-burnt-with-fire'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-27-people-that-spring-from-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:1 — *O Elohim (God), the heathen are come into thine inheritance; thy holy temple have they defiled; they have laid Jerusalem on heaps.* Abraham''s grief that the heathen plunder the people that spring from him in Apocalypse of Abraham 27:4 is the psalmist''s grief over the inheritance overrun.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-people-that-spring-from-me'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:9 — *Her filthiness is in her skirts; she remembereth not her last end; therefore she came down wonderfully: she had no comforter. O Yahuah (LORD), behold my affliction: for the enemy hath magnified himself.* Abraham''s lacerated heart in Apocalypse of Abraham 27:6 is the same cry that the enemy has magnified himself over the city.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-people-that-spring-from-me'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The people Yahuah accepted in Apocalypse of Abraham 27:4 are the elect seed marked out by election from the womb, not a people replacing them.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-people-that-spring-from-me'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-27-statue-of-jealousy-and-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 8:5 — *Then said he unto me, Son of Adam, lift up thine eyes now the way toward the north. So I lifted up mine eyes the way toward the north, and behold northward at the gate of the altar this image of jealousy in the entry.* The statue Abraham saw that angers Yahuah in Apocalypse of Abraham 27:8 is Ezekiel''s image of jealousy set in the sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 8:6 — *He said furthermore unto me, Son of Adam, seest thou what they do? even the great abominations that the house of Yashar''el (Israel) committeth here, that I should go far off from my sanctuary? but turn thee yet again, and thou shalt see greater abominations.* The seed''s provoking by the statue in Apocalypse of Abraham 27:8 is the abomination that drives Yahuah from His sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 106:38 — *And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood.* The human slaughter in the Temple in Apocalypse of Abraham 27:8 is the innocent blood poured out to idols that pollutes the land.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 7:14 — *Therefore will I do unto this house, which is called by my name, wherein ye trust, and unto the place which I gave to you and to your fathers, as I have done to Shiloh.* Because of the idol and the blood in Apocalypse of Abraham 27:8 the house called by Yahuah''s name is given over, as Shiloh was.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-statue-of-jealousy-and-blood'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Abraham''s plea to be shown those who fulfilled the commandments in Apocalypse of Abraham 27:10 is the choice of life Moses set before the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The ones who fulfilled the commandments and the works of righteousness in Apocalypse of Abraham 27:10 are the ones who walk uprightly and work righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The split between the righteous and the men who care for their interests in Apocalypse of Abraham 27:12-13 is the narrow way the few find against the broad way.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The two issues Yahuah names to Abraham in Apocalypse of Abraham 27:12-13 are the very discernment between him that serveth Elohim and him that serveth not.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa27_lookup sv, _session253_aoa27_lookup tv
 WHERE t.slug='apocalypse-of-abraham-27-two-ways-righteous-and-self-seeking'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_28.sql (session253 apocalypse-of-abraham 28) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa28 (view _session253_aoa28_lookup). Sort band base 67675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-28-the-measured-term
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 3, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* In the very vision Abraham here recalls, the term of his seed''s affliction was spoken in numbers, exactly the "how long" he asks in Apocalypse of Abraham 28:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 3, 'canon', 'genesis', 15, 14, 'free', E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The measured affliction of Apocalypse of Abraham 28:3 closes in the LORD''s judgment on the oppressor and the coming-out of the seed.'),
  -- thread: apocalypse-of-abraham-28-scattered-among-the-heathen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 4, 'canon', 'leviticus', 26, 33, 'free', E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* The retribution "accomplished" upon the multitude in Apocalypse of Abraham 28:4 is the Torah-foretold scattering among the heathen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 4, 'canon', 'leviticus', 26, 42, 'free', E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenant with Abraham — whose vision this is — is what survives the retribution of Apocalypse of Abraham 28:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 4, 'canon', 'leviticus', 26, 44, 'free', E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* Even in the retribution of Apocalypse of Abraham 28:4, the people are disciplined, not cast away — election holds.'),
  -- thread: apocalypse-of-abraham-28-one-hour-in-mercy
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The "one hour in mercy" of Apocalypse of Abraham 28:5 is Torah''s promise to gather the scattered after the misfortune among the heathen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'isaiah', 27, 13, 'free', E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The hour of mercy in Apocalypse of Abraham 28:5 is the great-trumpet ingathering of the outcasts.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The mercy after the heathen-misfortune of Apocalypse of Abraham 28:5 is the second-time, two-house recovery of Abraham''s own seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 28, 5, 'canon', 'romans', 11, 26, 'free', E'Romans 11:26 — *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob:* Sha''ul confirms the hour of mercy in Apocalypse of Abraham 28:5 — the scattered seed is saved, not replaced.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-28-the-measured-term',
       E'The measured term foretold to Abraham',
       E'Abraham, lifted up, presses the One he has found: *As Thou hast brought me up to Thy height, so make this known to me, Thy beloved one, as much as I ask whether what I saw shall happen to them for long?* (Apocalypse of Abraham 28:3). It ain''t new — this is the same Abraham, in the same vision, who watched the deep sleep and the horror of great darkness fall over the covenant sacrifice, and there heard the term of his seed spoken aloud: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). The affliction is never open-ended; it is measured. And it ends in judgment upon the oppressor and deliverance for the seed: *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14). The question of "how long" is answered before it is asked — Yahuah set the bound of it at the furnace and the stars.',
       sv.verse_id, ev.verse_id, 'extras', 67675
  FROM _session253_aoa28_lookup sv, _session253_aoa28_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=28 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-28-scattered-among-the-heathen',
       E'The multitude provoked, scattered, and yet not cast away',
       E'He showed Abraham *a multitude of His people*, and said: *On their account, through four issues, as thou sawest, I shall be provoked by them, and in these my retribution for their deeds shall be accomplished* (Apocalypse of Abraham 28:4). This is no new sentence. Torah set it down in advance — the provoking, the retribution, the scattering: *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). Yet the same Torah binds the scattering to a covenant that cannot break, retribution that ends in remembrance: *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land* (Leviticus 26:42). And the closing word of that chapter is the very floor the Apocalypse stands on — judgment, but never abandonment: *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44). The retribution of 28:4 is covenant-discipline, not divorce; the seed of Abraham is kept.',
       sv.verse_id, ev.verse_id, 'extras', 67678
  FROM _session253_aoa28_lookup sv, _session253_aoa28_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=28 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-28-one-hour-in-mercy',
       E'Misfortune among the heathen, then one hour of mercy',
       E'The sentence ends not in misfortune but in mercy: *But in the fourth outgoing of a hundred years and one hour of the age — the same is a hundred years — it shall be in misfortune among the heathen, but one hour in mercy and contumely, as among the heathen* (Apocalypse of Abraham 28:5). The misfortune is real, but it is bounded, and the "hour of mercy" turns toward the gathering Torah promised the scattered: *And shalt return unto Yahuah Elohayka (the LORD thy God)... That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:2-3). The prophets name the hour: *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13). It is the two-house recovery, the seed of Abraham regathered — not a new people supplanting the old, but the *remnant* of his people: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* (Isaiah 11:11). And Sha''ul says the same mercy is no parenthesis: *And so all Yashar''el (Israel) shall be saved* (Romans 11:26). The "one hour in mercy" of Apocalypse of Abraham 28:5 is the trumpet of the ingathering.',
       sv.verse_id, ev.verse_id, 'extras', 67681
  FROM _session253_aoa28_lookup sv, _session253_aoa28_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=28 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-28-the-measured-term
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* In the very vision Abraham here recalls, the term of his seed''s affliction was spoken in numbers, exactly the "how long" he asks in Apocalypse of Abraham 28:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-the-measured-term'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The measured affliction of Apocalypse of Abraham 28:3 closes in the LORD''s judgment on the oppressor and the coming-out of the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-the-measured-term'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-28-scattered-among-the-heathen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* The retribution "accomplished" upon the multitude in Apocalypse of Abraham 28:4 is the Torah-foretold scattering among the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-scattered-among-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:42 — *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* The very covenant with Abraham — whose vision this is — is what survives the retribution of Apocalypse of Abraham 28:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-scattered-among-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:44 — *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* Even in the retribution of Apocalypse of Abraham 28:4, the people are disciplined, not cast away — election holds.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-scattered-among-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-28-one-hour-in-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* The "one hour in mercy" of Apocalypse of Abraham 28:5 is Torah''s promise to gather the scattered after the misfortune among the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The hour of mercy in Apocalypse of Abraham 28:5 is the great-trumpet ingathering of the outcasts.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The mercy after the heathen-misfortune of Apocalypse of Abraham 28:5 is the second-time, two-house recovery of Abraham''s own seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:26 — *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob:* Sha''ul confirms the hour of mercy in Apocalypse of Abraham 28:5 — the scattered seed is saved, not replaced.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa28_lookup sv, _session253_aoa28_lookup tv
 WHERE t.slug='apocalypse-of-abraham-28-one-hour-in-mercy'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_29.sql (session253 apocalypse-of-abraham 29) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa29 (view _session253_aoa29_lookup). Sort band base 67700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-29-the-twelfth-hour-of-the-age
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 3, 'canon', 'daniel', 7, 12, 'free', E'Daniel 7:12 — *As concerning the rest of the beasts, they had their dominion taken away: yet their lives were prolonged for a season and time.* As the ungodly Age is ordained to rule only for a measured span among the heathen, so Daniel''s beasts hold dominion only for a season and time before it is taken away (apocalypse-of-abraham 29:3).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 3, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The end of the twelve-hour Age is the handing of the everlasting, indestructible kingdom to the Son of Adam, the rule the heathen Age could only counterfeit for a season (apocalypse-of-abraham 29:3).'),
  -- thread: apocalypse-of-abraham-29-the-man-insulted-and-worshipped
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 6, 'canon', 'isaiah', 53, 3, 'free', E'Isaiah 53:3 — *He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* Abraham''s vision of the man insulted and struck by his own is the same despised and rejected one Isaiah set before Israel''s seed (apocalypse-of-abraham 29:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 6, 'canon', 'psalms', 22, 7, 'free', E'Psalm 22:7 — *All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying.* The insulting and striking that Abraham watches fall on the man is the very scorn of the watching crowd in the Psalm of the pierced one (apocalypse-of-abraham 29:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 13, 'canon', 'matthew', 24, 10, 'free', E'Matthew 24:10 — *And then shall many be offended, and shall betray one another, and shall hate one another.* That many of Abraham''s own seed shall be offended at the man matches Messiah''s word that in the last days many shall be offended (apocalypse-of-abraham 29:13).'),
  -- thread: apocalypse-of-abraham-29-azazel-bows-down
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel who runs and kisses the man''s face in Abraham''s vision is the same fallen chief whom the LORD bound and cast into the desert-darkness for judgment (apocalypse-of-abraham 29:7).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The Azazel whose false homage Abraham sees is the one to whom all sin is ascribed, the corrupter of the whole earth (apocalypse-of-abraham 29:7).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* Azazel, who turns and stands behind the man, bears the name of the scapegoat-lot sent out into the wilderness on the Day of Atonement (apocalypse-of-abraham 29:7).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 7, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel''s false worship is the homage of a fallen angel already reserved in chains of darkness for the great day of judgment (apocalypse-of-abraham 29:7).'),
  -- thread: apocalypse-of-abraham-29-the-right-side-and-the-left
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 13, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side of the heathen and the right side of Abraham''s seed are the two manner of people divided since the womb of Rebekah (apocalypse-of-abraham 29:13).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 13, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The vision''s two sides, the right and the left, set the same two ways before the seed that Moses set before Israel (apocalypse-of-abraham 29:13).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 12, 'canon', 'isaiah', 11, 10, 'free', E'Isaiah 11:10 — *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* The man set up from Abraham''s generation whom many of the heathen follow is the ensign of Jesse to whom the Gentiles seek (apocalypse-of-abraham 29:12).'),
  -- thread: apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 14, 'canon', 'matthew', 24, 22, 'free', E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening of the Age of ungodliness for the sake of those who worshipped of Abraham''s seed is the very shortening of days for the elect''s sake (apocalypse-of-abraham 29:14).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 15, 'canon', 'joel', 3, 2, 'free', E'Joel 3:2 — *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land.* The judgment that comes upon the lawless heathen through the separated seed is the LORD''s pleading with the nations for His scattered heritage (apocalypse-of-abraham 29:15).'),
  -- thread: apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 18, 'canon', 'isaiah', 27, 13, 'free', E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The righteous of Abraham''s seed left and hastening to the prepared place are the outcasts gathered at the great trumpet to worship in the holy mount (apocalypse-of-abraham 29:18).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 18, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The righteous of the seed left in the secret number are the two-house remnant the LORD recovers the second time (apocalypse-of-abraham 29:18).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 29, 18, 'canon', 'matthew', 24, 31, 'free', E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The hastening of the kept seed to the prepared place is the gathering of the elect by the angels at the great trumpet (apocalypse-of-abraham 29:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-twelfth-hour-of-the-age',
       E'The Twelfth Hour of the Age of Ungodliness',
       E'Abraham asks the measure of the times, and the Eternal answers: *Twelve years have I ordained of this ungodly Age to rule among the heathen and in thy seed; and until the end of the times it shall be as thou sawest.* It ain''t new — the apportioned hours of the Age, the rule of the heathen suffered for a season before judgment, is the same reckoning Daniel beheld: *As concerning the rest of the beasts, they had their dominion taken away: yet their lives were prolonged for a season and time* (Daniel 7:12). And the End that the hour points toward is the Son of Adam taking the everlasting kingdom: *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The twelfth hour is not the heathen''s triumph but the boundary of the appointed time.',
       sv.verse_id, ev.verse_id, 'extras', 67700
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-man-insulted-and-worshipped',
       E'The Man Insulted and Beaten and Worshipped',
       E'Abraham sees a man who is at once reviled and adored: *And while I still looked, there came out from the right side many, and some insulted that man, while some struck him; others, however, worshipped him.* It ain''t new — Isaiah long before set this very figure before the eyes of the seed: *He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not* (Isaiah 53:3). And the Psalm of the pierced one shows the same scorn from the watching crowd: *All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying* (Psalm 22:7). The man set up from Abraham''s generation, *whom thou sawest issue from my people*, is the despised-yet-followed one — and many of his own seed are *offended at him*, even as Messiah foretold: *And then shall many be offended, and shall betray one another, and shall hate one another* (Matthew 24:10).',
       sv.verse_id, ev.verse_id, 'extras', 67703
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-azazel-bows-down',
       E'Azazel Runs and Worships',
       E'The vision turns sinister: *And I saw how these worshipped him, and Azazel ran and worshipped him, and, having kissed his face, he turned and stood behind him.* It ain''t new — Azazel is the chief of the fallen Watchers whom the LORD bound at the dawn of judgment: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein* (1 Enoch 10:4), the one to whom all sin is ascribed: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* (1 Enoch 10:8). He is the goat sent out in the Day of Atonement, separated unto the wilderness: *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness* (Leviticus 16:10). His kiss and false worship is the homage of the fallen one reserved for judgment: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6).',
       sv.verse_id, ev.verse_id, 'extras', 67706
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-right-side-and-the-left',
       E'The Two Peoples, the Right and the Left',
       E'The picture is divided: a man going out *from the left side of the heathen* drawing the hosts of the nations, and the seed of Abraham *on the right side*. The Eternal interprets: *And those whom thou sawest emerge from the left side of the picture — the meaning is: there shall be many from the heathen who set their hopes upon him.* It ain''t new — the two peoples were divided in Rebekah''s womb: *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger* (Genesis 25:23). The right hand is the place of the elect at the gathering: the Son of Adam *shall set the sheep on his right hand, but the goats on the left* is Yoshi''s same two-ways set before the seed by Moses — *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15). This is election of Abraham''s seed, the heathen brought in to set their hope upon the one issued from that seed — not a people replacing Israel, but the nations grafted to the right side.',
       sv.verse_id, ev.verse_id, 'extras', 67709
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen',
       E'The Ten Plagues and Judgment on the Lawless Heathen',
       E'Before the Age of the righteous can grow, judgment falls: *Before the Age of the righteous beginneth to grow, my judgement shall come upon the lawless heathen through the people of thy seed who have been separated for me.* And the means is plagues: *In those days I will bring upon all creatures of the earth ten plagues, through misfortune and disease and sighing of the grief of their soul.* It ain''t new — the days are shortened for the elect''s sake, just as Messiah foretold: *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened* (Matthew 24:22). The judgment is upon all nations gathered, pled for the sake of the scattered seed: *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land* (Joel 3:2). The separated seed, kept secret in number, is the channel of the LORD''s reckoning upon the lawless.',
       sv.verse_id, ev.verse_id, 'extras', 67712
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=14
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place',
       E'The Righteous Remnant Gathered to the Place Prepared',
       E'The vision closes with the kept seed: *And then shall righteous men of thy seed be left, in the number which is kept secret by me, hastening in the glory of My Name to the place prepared beforehand for them, which thou sawest devastated in the picture; and they shall live and be established through sacrifices and gifts of righteousness and truth in the Age of the righteous.* It ain''t new — the remnant left, gathered one by one at the trumpet, is the prophets'' own hope: *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13). It is the second-time recovery of the two-house remnant: *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* (Isaiah 11:11). The Son of Adam gathers His elect from the four winds at the great trumpet: *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). The devastated place is restored, the seed established with the sacrifices of righteousness.',
       sv.verse_id, ev.verse_id, 'extras', 67715
  FROM _session253_aoa29_lookup sv, _session253_aoa29_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=29 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-29-the-twelfth-hour-of-the-age
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:12 — *As concerning the rest of the beasts, they had their dominion taken away: yet their lives were prolonged for a season and time.* As the ungodly Age is ordained to rule only for a measured span among the heathen, so Daniel''s beasts hold dominion only for a season and time before it is taken away (apocalypse-of-abraham 29:3).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-twelfth-hour-of-the-age'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The end of the twelve-hour Age is the handing of the everlasting, indestructible kingdom to the Son of Adam, the rule the heathen Age could only counterfeit for a season (apocalypse-of-abraham 29:3).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-twelfth-hour-of-the-age'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-the-man-insulted-and-worshipped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:3 — *He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.* Abraham''s vision of the man insulted and struck by his own is the same despised and rejected one Isaiah set before Israel''s seed (apocalypse-of-abraham 29:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-man-insulted-and-worshipped'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:7 — *All they that see me laugh me to scorn: they shoot out the lip, they shake the head, saying.* The insulting and striking that Abraham watches fall on the man is the very scorn of the watching crowd in the Psalm of the pierced one (apocalypse-of-abraham 29:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-man-insulted-and-worshipped'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:10 — *And then shall many be offended, and shall betray one another, and shall hate one another.* That many of Abraham''s own seed shall be offended at the man matches Messiah''s word that in the last days many shall be offended (apocalypse-of-abraham 29:13).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-man-insulted-and-worshipped'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-azazel-bows-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel who runs and kisses the man''s face in Abraham''s vision is the same fallen chief whom the LORD bound and cast into the desert-darkness for judgment (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* The Azazel whose false homage Abraham sees is the one to whom all sin is ascribed, the corrupter of the whole earth (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* Azazel, who turns and stands behind the man, bears the name of the scapegoat-lot sent out into the wilderness on the Day of Atonement (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel''s false worship is the homage of a fallen angel already reserved in chains of darkness for the great day of judgment (apocalypse-of-abraham 29:7).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-azazel-bows-down'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-the-right-side-and-the-left
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The left side of the heathen and the right side of Abraham''s seed are the two manner of people divided since the womb of Rebekah (apocalypse-of-abraham 29:13).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-right-side-and-the-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The vision''s two sides, the right and the left, set the same two ways before the seed that Moses set before Israel (apocalypse-of-abraham 29:13).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-right-side-and-the-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:10 — *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* The man set up from Abraham''s generation whom many of the heathen follow is the ensign of Jesse to whom the Gentiles seek (apocalypse-of-abraham 29:12).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-right-side-and-the-left'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The shortening of the Age of ungodliness for the sake of those who worshipped of Abraham''s seed is the very shortening of days for the elect''s sake (apocalypse-of-abraham 29:14).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 3:2 — *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land.* The judgment that comes upon the lawless heathen through the separated seed is the LORD''s pleading with the nations for His scattered heritage (apocalypse-of-abraham 29:15).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-ten-plagues-judgment-on-the-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The righteous of Abraham''s seed left and hastening to the prepared place are the outcasts gathered at the great trumpet to worship in the holy mount (apocalypse-of-abraham 29:18).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The righteous of the seed left in the secret number are the two-house remnant the LORD recovers the second time (apocalypse-of-abraham 29:18).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The hastening of the kept seed to the prepared place is the gathering of the elect by the angels at the great trumpet (apocalypse-of-abraham 29:18).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa29_lookup sv, _session253_aoa29_lookup tv
 WHERE t.slug='apocalypse-of-abraham-29-the-remnant-gathered-to-the-prepared-place'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=29 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_30.sql (session253 apocalypse-of-abraham 30) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa30 (view _session253_aoa30_lookup). Sort band base 67725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-30-ten-plagues
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'exodus', 9, 14, 'free', E'Exodus 9:14 — *For I will at this time send all my plagues upon thine heart, and upon thy servants, and upon thy people; that thou mayest know that there is none like me in all the earth.* The Egyptian plagues are the template for the ten plagues God says He has prepared beforehand against the heathen in Apocalypse of Abraham 30:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'deuteronomy', 28, 60, 'free', E'Deuteronomy 28:60 — *Moreover he will bring upon thee all the diseases of Egypt, which thou wast afraid of; and they shall cleave unto thee.* The covenant curses carry the same plague-recompense that Apocalypse of Abraham 30:3 reserves for the heathen at the last hour.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'revelation', 16, 1, 'free', E'Revelation 16:1 — *And I heard a great voice out of the temple saying to the seven angels, Go your ways, and pour out the vials of the wrath of Elohim (God) upon the earth.* John''s vials of wrath are the same end-time recompense Abraham is shown prepared beforehand for the heathen in Apocalypse of Abraham 30:3.'),
  -- thread: apocalypse-of-abraham-30-sword-famine-pestilence
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The Messiah''s signs of the end name the very plagues — famine, pestilence, earthquake — that Apocalypse of Abraham 30:4 lists among the ten.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'exodus', 9, 3, 'free', E'Exodus 9:3 — *Behold, the hand of Yahuah (LORD) is upon thy cattle which is in the field, upon the horses, upon the asses, upon the camels, upon the oxen, and upon the sheep: there shall be a very grievous murrain.* The pestilence of animals that Apocalypse of Abraham 30:4 lists as the third plague repeats the murrain of Egypt.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'deuteronomy', 28, 22, 'free', E'Deuteronomy 28:22 — *Yahuah (LORD) shall smite thee with a consumption, and with a fever, and with an inflammation, and with an extreme burning, and with the sword, and with blasting, and with mildew; and they shall pursue thee until thou perish.* The hunger, sword, and pestilence of Apocalypse of Abraham 30:4 are gathered already in the covenant-curse catalogue.'),
  -- thread: apocalypse-of-abraham-30-hail-thunder-earthquake
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'exodus', 9, 23, 'free', E'Exodus 9:23 — *And Moses stretched forth his rod toward heaven: and Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt.* The hail and thunder of Apocalypse of Abraham 30:4 repeat the seventh plague of Egypt.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'revelation', 16, 18, 'free', E'Revelation 16:18 — *And there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great.* The tenth plague''s thunder, voices, and destructive earthquake in Apocalypse of Abraham 30:4 match the seventh vial exactly.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 4, 'canon', 'revelation', 16, 21, 'free', E'Revelation 16:21 — *And there fell upon men a great hail out of heaven, every stone about the weight of a talent: and men blasphemed Elohim (God) because of the plague of the hail; for the plague thereof was exceeding great.* The hail of Apocalypse of Abraham 30:4 falls again as the final vial-plague upon the heathen.'),
  -- thread: apocalypse-of-abraham-30-day-of-wrath-heathen
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'canon', 'joel', 2, 1, 'free', E'Joel 2:1 — *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* The appointed twelfth hour of Apocalypse of Abraham 30:3 is the prophets'' day of Yahuah, nigh at hand.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 30, 3, 'enoch', '1-enoch', 1, 9, 'extras', E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* The plagues prepared for the heathen in Apocalypse of Abraham 30:3 are this same judgment Enoch foresaw upon all the ungodly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-ten-plagues',
       E'The ten plagues prepared for the heathen',
       E'Back upon the earth, Abraham is shown the end-time recompense: *thou hast sought to see the ten plagues which I have prepared for the heathen, and have prepared beforehand at the passing over of the twelfth hour of the earth* (Apocalypse of Abraham 30:3). It ain''t new — the pattern was set in Egypt, where Yahuah loosed His plagues so that *thou mayest know that there is none like me in all the earth* (Exodus 9:14), and the covenant-witness warned that the unfaithful would meet *all the diseases of Egypt, which thou wast afraid of; and they shall cleave unto thee* (Deuteronomy 28:60). The number ten and the measured *hours* of the earth answer to John''s seven vials of wrath: *Go your ways, and pour out the vials of the wrath of Elohim (God) upon the earth* (Revelation 16:1) — the same cup, *prepared beforehand*, against the heathen at the last hour.',
       sv.verse_id, ev.verse_id, 'extras', 67725
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-sword-famine-pestilence',
       E'Pestilence, famine, and the sword on the nations',
       E'The catalogue itself is drawn from the prophets'' own woes: *the third, destruction and pestilence of animals; the fourth, hunger of the whole world and of its people... the ninth, punishment by the sword and flight in distress* (Apocalypse of Abraham 30:4). The Messiah named the same triad over the end of the age: *there shall be famines, and pestilences, and earthquakes, in divers places* (Matthew 24:7). The murrain among the beasts repeats Egypt, where Yahuah declared upon the cattle *there shall be a very grievous murrain* (Exodus 9:3). And the covenant-witness had already gathered consumption, fever, *and... the sword* into one sentence: *Yahuah (LORD) shall smite thee with a consumption, and with a fever, and with an inflammation, and with an extreme burning, and with the sword* (Deuteronomy 28:22). It ain''t new — the woes Abraham foresaw are the woes Torah and the prophets had already spoken.',
       sv.verse_id, ev.verse_id, 'extras', 67728
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-hail-thunder-earthquake',
       E'Hail, thunder, and destructive earthquake',
       E'The last plagues are sky and ground in upheaval: *the sixth, multiplication of hail and snow... the tenth, thunder and voices and destructive earthquake* (Apocalypse of Abraham 30:4). This is the seventh Egyptian plague, when Yahuah *sent thunder and hail, and the fire ran along upon the ground* (Exodus 9:23). John''s seventh vial loosed the same trio against the heathen city: *there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth* (Revelation 16:18), and *there fell upon men a great hail out of heaven, every stone about the weight of a talent* (Revelation 16:21). It ain''t new — the thunder, hail, and earthquake that close Abraham''s ten are the thunder, hail, and earthquake that close the prophets'' day of wrath.',
       sv.verse_id, ev.verse_id, 'extras', 67731
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-30-day-of-wrath-heathen',
       E'The appointed hour of judgment on the ungodly',
       E'The plagues are not random but timed — *prepared beforehand at the passing over of the twelfth hour of the earth* (Apocalypse of Abraham 30:3). The prophets call this fixed term the day of Yahuah: *for the day of Yahuah (LORD) cometh, for it is nigh at hand; A day of darkness and of gloominess* (Joel 2:1-2). Enoch saw the same coming with His hosts *To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9). It ain''t new — the measured hour at which the heathen are recompensed is the long-foretold day when the Holy One comes forth to judge the earth.',
       sv.verse_id, ev.verse_id, 'extras', 67734
  FROM _session253_aoa30_lookup sv, _session253_aoa30_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=30 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-30-ten-plagues
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:14 — *For I will at this time send all my plagues upon thine heart, and upon thy servants, and upon thy people; that thou mayest know that there is none like me in all the earth.* The Egyptian plagues are the template for the ten plagues God says He has prepared beforehand against the heathen in Apocalypse of Abraham 30:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-ten-plagues'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:60 — *Moreover he will bring upon thee all the diseases of Egypt, which thou wast afraid of; and they shall cleave unto thee.* The covenant curses carry the same plague-recompense that Apocalypse of Abraham 30:3 reserves for the heathen at the last hour.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-ten-plagues'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 16:1 — *And I heard a great voice out of the temple saying to the seven angels, Go your ways, and pour out the vials of the wrath of Elohim (God) upon the earth.* John''s vials of wrath are the same end-time recompense Abraham is shown prepared beforehand for the heathen in Apocalypse of Abraham 30:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-ten-plagues'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-30-sword-famine-pestilence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The Messiah''s signs of the end name the very plagues — famine, pestilence, earthquake — that Apocalypse of Abraham 30:4 lists among the ten.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-sword-famine-pestilence'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 9:3 — *Behold, the hand of Yahuah (LORD) is upon thy cattle which is in the field, upon the horses, upon the asses, upon the camels, upon the oxen, and upon the sheep: there shall be a very grievous murrain.* The pestilence of animals that Apocalypse of Abraham 30:4 lists as the third plague repeats the murrain of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-sword-famine-pestilence'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 28:22 — *Yahuah (LORD) shall smite thee with a consumption, and with a fever, and with an inflammation, and with an extreme burning, and with the sword, and with blasting, and with mildew; and they shall pursue thee until thou perish.* The hunger, sword, and pestilence of Apocalypse of Abraham 30:4 are gathered already in the covenant-curse catalogue.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-sword-famine-pestilence'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-30-hail-thunder-earthquake
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:23 — *And Moses stretched forth his rod toward heaven: and Yahuah (LORD) sent thunder and hail, and the fire ran along upon the ground; and Yahuah (LORD) rained hail upon the land of Egypt.* The hail and thunder of Apocalypse of Abraham 30:4 repeat the seventh plague of Egypt.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-hail-thunder-earthquake'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 16:18 — *And there were voices, and thunders, and lightnings; and there was a great earthquake, such as was not since men were upon the earth, so mighty an earthquake, and so great.* The tenth plague''s thunder, voices, and destructive earthquake in Apocalypse of Abraham 30:4 match the seventh vial exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-hail-thunder-earthquake'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 16:21 — *And there fell upon men a great hail out of heaven, every stone about the weight of a talent: and men blasphemed Elohim (God) because of the plague of the hail; for the plague thereof was exceeding great.* The hail of Apocalypse of Abraham 30:4 falls again as the final vial-plague upon the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-hail-thunder-earthquake'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-30-day-of-wrath-heathen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:1 — *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* The appointed twelfth hour of Apocalypse of Abraham 30:3 is the prophets'' day of Yahuah, nigh at hand.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-day-of-wrath-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 1:9 — *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly: And to convict all flesh Of all the works of their ungodliness which they have ungodly committed, And of all the hard things which ungodly sinners have spoken against Him.* The plagues prepared for the heathen in Apocalypse of Abraham 30:3 are this same judgment Enoch foresaw upon all the ungodly.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa30_lookup sv, _session253_aoa30_lookup tv
 WHERE t.slug='apocalypse-of-abraham-30-day-of-wrath-heathen'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_31.sql (session253 apocalypse-of-abraham 31) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa31 (view _session253_aoa31_lookup). Sort band base 67750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-31-trumpet-elect-one-gathering
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 1, 'canon', 'isaiah', 27, 13, 'free', E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The same trumpet that summons Abraham''s despised people from the nations in Apocalypse of Abraham 31:1 gathers the outcasts of Israel home.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 1, 'canon', 'matthew', 24, 31, 'free', E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The Messiah''s trumpet-gathering of the elect is the very scene of the Elect One summoning the despised people in Apocalypse of Abraham 31:1.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 1, 'canon', 'isaiah', 11, 11, 'free', E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The summoning of the despised people from the nations in Apocalypse of Abraham 31:1 is this second-time recovery of the scattered remnant — the two-house gathering, not a replacement.'),
  -- thread: apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 2, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The fire prepared for the mockers in Apocalypse of Abraham 31:2 is Malachi''s oven-day that burns up the proud who scorned the righteous.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 2, 'canon', 'revelation', 20, 14, 'free', E'Revelation 20:14 — *And death and hell were cast into the lake of fire. This is the second death.* The fire of Hades and the ceaseless underworld torment of Apocalypse of Abraham 31:2 is the second death — death and hell themselves cast in.'),
  -- thread: apocalypse-of-abraham-31-two-peoples-kept-commandments
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 3, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The two peoples of Apocalypse of Abraham 31:3 — those who kept the commandments and those who followed the idols — are the two ways Moses set before Israel.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 3, 'canon', 'deuteronomy', 30, 16, 'free', E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Those who *openly kept my commandments* in Apocalypse of Abraham 31:3 walk the commanded way of life that Moses set out — Torah stands, never as a curse.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 3, 'canon', 'matthew', 25, 32, 'free', E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The downfall of the idol-followers and the joy of the commandment-keepers in Apocalypse of Abraham 31:3 is the Messiah''s final separation of the sheep from the goats.'),
  -- thread: apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The evil worm Azazel whose fire devours the idolaters in Apocalypse of Abraham 31:4 is the bound Watcher of Enoch''s vision.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The fire of Azazel''s tongue in Apocalypse of Abraham 31:4 answers Enoch''s word that Azazel himself is cast into the fire at the great judgment.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'canon', 'leviticus', 16, 8, 'free', E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* Azazel by name in Apocalypse of Abraham 31:4 is the scapegoat''s lot of the Torah, the one set apart from Yahuah''s — the adversary''s portion.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 31, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The fallen Azazel devouring the idolaters in Apocalypse of Abraham 31:4 is among the angels reserved in chains for the judgment of the great day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-trumpet-elect-one-gathering',
       E'The trumpet, the Elect One, and the despised people summoned',
       E'The vision ends where Yahuah''s word always ends — with a trumpet and a gathering: *"And then I will sound the trumpet out of the air, and will send mine Elect One, having in him all my power, one measure; and this one shall summon my despised people from the nations, and I will burn with fire those who have insulted them and who have ruled among them in this Age."* (Apocalypse of Abraham 31:1). It ain''t new. The prophets blew this same trumpet over Abraham''s scattered seed: *"And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem."* (Isaiah 27:13). The Messiah names the same Elect One and the same sound: *"And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other."* (Matthew 24:31). This is the two-house regathering, not a church replacing Israel — *"that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt..."* (Isaiah 11:11). The despised people are summoned home; the seed kept by promise is not lost.',
       sv.verse_id, ev.verse_id, 'extras', 67750
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors',
       E'The day that burns as an oven on those who mocked',
       E'Those who insulted and ruled over Abraham''s people are appointed to the fire: *"And I will give those who have covered me with mockery to the scorn of the coming Age; and I have prepared them to be food for the fire of Hades, and for ceaseless flight to and fro through the air in the underworld beneath the earth, the body filled with worms."* (Apocalypse of Abraham 31:2). It ain''t new. Malachi saw the same furnace-day: *"For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch."* (Malachi 4:1). The Revelation seals it: *"And death and hell were cast into the lake of fire. This is the second death."* (Revelation 20:14). The fire of Hades that swallows the mockers is the second death of the prophets — judgment falling on the system that ruled over and scorned the elect, not the cancelling of Yahuah''s covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67753
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-two-peoples-kept-commandments',
       E'Those who kept the commandments and those who chose the idols',
       E'The line is drawn between two peoples by what they chose to do: *"For on them shall they see the righteousness of the Creator — those, namely, who have chosen to do my will, and those who have openly kept my commandments; and they shall rejoice with joy over the downfall of the men who still remain, who have followed the idols and their murders."* (Apocalypse of Abraham 31:3). It ain''t new. Moses set the same two ways before the people: *"See, I have set before thee this day life and good, and death and evil;"* (Deuteronomy 30:15). The Messiah divides the same two flocks at the end: *"And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:"* (Matthew 25:32). Election precedes confession, and Torah stands — the righteous are known by having *openly kept my commandments*, the wicked by following the idols. The keeping of the commandments was never the curse; it is the mark of those who see the righteousness of the Creator.',
       sv.verse_id, ev.verse_id, 'extras', 67756
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah',
       E'The worm and fire of Azazel, and the strange god forsaken for Yahuah',
       E'The fallen one rebuked through the whole vision is named as the destroyer of the idolaters: *"For they shall putrefy in the body of the evil worm Azazel, and be burnt with the fire of Azazel''s tongue; for I hoped that they would come to me, and not have loved and praised the strange god, and not have adhered to him for whom they were not allotted, but instead they have forsaken the mighty Yahuah (Lord)."* (Apocalypse of Abraham 31:4). It ain''t new. Azazel is the Watcher to whom all sin is ascribed, bound for the fire: *"And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein."* (1 Enoch 10:4); *"And on the day of the great judgement he shall be cast into the fire."* (1 Enoch 10:6). The Torah already set his lot apart by name: *"And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat."* (Leviticus 16:8). And the apostle keeps the same reservation: *"And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day."* (Jude 1:6). Those who adhered to the strange god — to him for whom they were not allotted — share Azazel''s fire; they forsook the mighty Yahuah for the system of the adversary.',
       sv.verse_id, ev.verse_id, 'extras', 67759
  FROM _session253_aoa31_lookup sv, _session253_aoa31_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=31 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-31-trumpet-elect-one-gathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* The same trumpet that summons Abraham''s despised people from the nations in Apocalypse of Abraham 31:1 gathers the outcasts of Israel home.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-trumpet-elect-one-gathering'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:31 — *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* The Messiah''s trumpet-gathering of the elect is the very scene of the Elect One summoning the despised people in Apocalypse of Abraham 31:1.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-trumpet-elect-one-gathering'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:11 — *And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea.* The summoning of the despised people from the nations in Apocalypse of Abraham 31:1 is this second-time recovery of the scattered remnant — the two-house gathering, not a replacement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-trumpet-elect-one-gathering'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The fire prepared for the mockers in Apocalypse of Abraham 31:2 is Malachi''s oven-day that burns up the proud who scorned the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:14 — *And death and hell were cast into the lake of fire. This is the second death.* The fire of Hades and the ceaseless underworld torment of Apocalypse of Abraham 31:2 is the second death — death and hell themselves cast in.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-fire-of-judgment-on-the-oppressors'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-31-two-peoples-kept-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The two peoples of Apocalypse of Abraham 31:3 — those who kept the commandments and those who followed the idols — are the two ways Moses set before Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-two-peoples-kept-commandments'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Those who *openly kept my commandments* in Apocalypse of Abraham 31:3 walk the commanded way of life that Moses set out — Torah stands, never as a curse.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-two-peoples-kept-commandments'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:32 — *And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats:* The downfall of the idol-followers and the joy of the commandment-keepers in Apocalypse of Abraham 31:3 is the Messiah''s final separation of the sheep from the goats.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-two-peoples-kept-commandments'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The evil worm Azazel whose fire devours the idolaters in Apocalypse of Abraham 31:4 is the bound Watcher of Enoch''s vision.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The fire of Azazel''s tongue in Apocalypse of Abraham 31:4 answers Enoch''s word that Azazel himself is cast into the fire at the great judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* Azazel by name in Apocalypse of Abraham 31:4 is the scapegoat''s lot of the Torah, the one set apart from Yahuah''s — the adversary''s portion.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The fallen Azazel devouring the idolaters in Apocalypse of Abraham 31:4 is among the angels reserved in chains for the judgment of the great day.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa31_lookup sv, _session253_aoa31_lookup tv
 WHERE t.slug='apocalypse-of-abraham-31-azazel-worm-fire-forsaken-yahuah'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_apocalypseofabraham_32.sql (session253 apocalypse-of-abraham 32) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa32 (view _session253_aoa32_lookup). Sort band base 67775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-32-seed-stranger-covenant
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* Apocalypse of Abraham 32:1 sets this Genesis-15 covenant word inside the heavenly vision, the same prophecy of the strange land and the bondage now heard from the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'acts', 7, 6, 'free', E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen recites to the council the same sojourn-and-bondage word that closes Abraham''s vision in 32:1, the covenant carried unbroken from the patriarch to the assembly.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The enslaving and evil-intreating foretold in 32:1 ends precisely because the covenant spoken to Abraham is remembered, the seed kept through the affliction.'),
  -- thread: apocalypse-of-abraham-32-nation-they-serve-i-will-judge
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'genesis', 15, 14, 'free', E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* Apocalypse of Abraham 32:1 quotes this judgment-clause almost word for word — the nation that enslaves the seed is itself brought to account, the deliverance assured.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'exodus', 12, 12, 'free', E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The promised judging of the serving-nation in 32:1 lands on Egypt''s gods on Passover night, the covenant word made deed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'joel', 3, 12, 'free', E'Joel 3:12 — *Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about.* The same Judge who sentenced Egypt in 32:1 gathers all the nations to judgment at the end, the heathen judged and Abraham''s heritage pleaded for.'),
  -- thread: apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The "Age of ungodliness" whose hour the seed endures in 32:1 has a fixed terminus: Azazel and the corrupters are bound now and reserved for the great judgment by fire.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'enoch', '1-enoch', 10, 16, 'extras', E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth’ shall be planted in truth and joy for evermore.* The brief hour of ungodliness in 32:1 gives way to the uprooting of all wrong and the planting of the righteous seed — the end Abraham was shown.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 32, 1, 'canon', 'exodus', 12, 41, 'free', E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The "hour" of affliction in 32:1 is a measured term that ends on its appointed day, the hosts brought out exactly when the time was full.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-32-seed-stranger-covenant',
       E'Thy seed a stranger in a land not theirs — the covenant told before the throne',
       E'The vision closes where Genesis began. *Therefore hear, O Abraham, and see; lo, thy seventh generation shall go with thee, and they shall go out into a strange land, and they shall enslave them, and evil-intreat them as it were an hour of the Age of ungodliness; but the nation whom they shall serve I will judge.* (Apocalypse of Abraham 32:1). It ain''t new — this is the very word spoken over the divided sacrifice in Genesis 15, only now heard from the throne above: *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years* (Genesis 15:13). The horror of great darkness that fell on Abram is the same darkness folded into the heavenly vision. And Stephen, standing before the council, rehearses the selfsame promise: *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years* (Acts 7:6). One covenant, one seed, told at the altar, told before the chariot, told in the synagogue — the election of Abraham''s house standing fast through bondage.',
       sv.verse_id, ev.verse_id, 'extras', 67775
  FROM _session253_aoa32_lookup sv, _session253_aoa32_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-32-nation-they-serve-i-will-judge',
       E'The nation whom they shall serve I will judge',
       E'The oppressor does not have the last word. *but the nation whom they shall serve I will judge* (Apocalypse of Abraham 32:1). This clause is lifted whole from the covenant: *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance* (Genesis 15:14). It is fulfilled the night judgment falls on Egypt''s gods: *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12). And it ain''t new — the same Judge sits over all the heathen at the end: *Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about* (Joel 3:12). The judging of Egypt is a pattern of the judging of the nations; the gathering of Abraham''s people stands on the other side of it.',
       sv.verse_id, ev.verse_id, 'extras', 67778
  FROM _session253_aoa32_lookup sv, _session253_aoa32_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness',
       E'An hour of the Age of ungodliness — and its appointed end',
       E'The bondage is measured against a clock that is running out. *they shall enslave them, and evil-intreat them as it were an hour of the Age of ungodliness* (Apocalypse of Abraham 32:1). The affliction is but "an hour" — bounded, weighed, and headed for the day of reckoning that Abraham has just seen in the vision of the two peoples and the heathen judged. It ain''t new: the age of ungodliness has its sentence already written. *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6) — Azazel, the head of the corrupting Watchers, is bound now and reserved for that day, the same end toward which the oppressing nations are bound. The seed afflicted for "an hour" is the seed kept until that consummation, when the wrong is destroyed from the face of the earth and the plant of righteousness appears (1 Enoch 10:16).',
       sv.verse_id, ev.verse_id, 'extras', 67781
  FROM _session253_aoa32_lookup sv, _session253_aoa32_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-32-seed-stranger-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* Apocalypse of Abraham 32:1 sets this Genesis-15 covenant word inside the heavenly vision, the same prophecy of the strange land and the bondage now heard from the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-seed-stranger-covenant'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:6 — *And Elohim (God) spake on this wise, That his seed should sojourn in a strange land; and that they should bring them into bondage, and entreat them evil four hundred years.* Stephen recites to the council the same sojourn-and-bondage word that closes Abraham''s vision in 32:1, the covenant carried unbroken from the patriarch to the assembly.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-seed-stranger-covenant'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The enslaving and evil-intreating foretold in 32:1 ends precisely because the covenant spoken to Abraham is remembered, the seed kept through the affliction.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-seed-stranger-covenant'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-32-nation-they-serve-i-will-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* Apocalypse of Abraham 32:1 quotes this judgment-clause almost word for word — the nation that enslaves the seed is itself brought to account, the deliverance assured.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-nation-they-serve-i-will-judge'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:12 — *For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD).* The promised judging of the serving-nation in 32:1 lands on Egypt''s gods on Passover night, the covenant word made deed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-nation-they-serve-i-will-judge'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 3:12 — *Let the heathen be wakened, and come up to the valley of Jehoshaphat: for there will I sit to judge all the heathen round about.* The same Judge who sentenced Egypt in 32:1 gathers all the nations to judgment at the end, the heathen judged and Abraham''s heritage pleaded for.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-nation-they-serve-i-will-judge'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The "Age of ungodliness" whose hour the seed endures in 32:1 has a fixed terminus: Azazel and the corrupters are bound now and reserved for the great judgment by fire.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth’ shall be planted in truth and joy for evermore.* The brief hour of ungodliness in 32:1 gives way to the uprooting of all wrong and the planting of the righteous seed — the end Abraham was shown.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The "hour" of affliction in 32:1 is a measured term that ends on its appointed day, the hosts brought out exactly when the time was full.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa32_lookup sv, _session253_aoa32_lookup tv
 WHERE t.slug='apocalypse-of-abraham-32-hour-of-the-age-of-ungodliness'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Apocalypse of Abraham cross-references complete.'
