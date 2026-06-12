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

