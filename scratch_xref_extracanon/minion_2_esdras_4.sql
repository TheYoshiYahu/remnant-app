-- ----- fragment: minion_2esdras_04.sql (session253 2-esdras 4) -----
-- Source anchor: apocrypha/2-esdras ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd4 (view _session253_2esd4_lookup). Sort band base 63075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-4-weigh-the-fire
  ('apocrypha', '2-esdras', 4, 5, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Most High answers Ezra exactly as He answered Job — by the unanswerable question that exposes the creature''s limit.'),
  ('apocrypha', '2-esdras', 4, 5, 'canon', 'job', 38, 5, 'free', E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* The challenge to measure is Yahuah''s own test of the dust that would weigh the fire of 2 Esdras 4:5.'),
  ('apocrypha', '2-esdras', 4, 5, 'canon', 'isaiah', 40, 12, 'free', E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* What Uriel asks Ezra to do, only the Creator does — He alone weighs wind and water.'),
  ('apocrypha', '2-esdras', 4, 9, 'canon', 'proverbs', 30, 4, 'free', E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* Agur''s riddle of the gathered wind names the same unscalable height Ezra confesses he cannot reach — and points past it to the Father and the Son.'),
  -- thread: 2-esdras-4-ways-past-finding-out
  ('apocrypha', '2-esdras', 4, 21, 'canon', 'isaiah', 55, 8, 'free', E'Isaiah 55:8 — *For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD).* The gulf Uriel marks between earth-dweller and Heaven-dweller is exactly the gulf Yahuah names between His ways and ours.'),
  ('apocrypha', '2-esdras', 4, 21, 'canon', 'isaiah', 55, 9, 'free', E'Isaiah 55:9 — *For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts.* The literal height of the heavens above the earth is Uriel''s very measure of what the creature cannot reach in 2 Esdras 4:21.'),
  ('apocrypha', '2-esdras', 4, 21, 'canon', 'deuteronomy', 29, 29, 'free', E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses already drew Uriel''s line: the secret things stay above the heavens, the revealed Torah is given the earth-dweller to keep.'),
  -- thread: 2-esdras-4-evil-seed-in-adam
  ('apocrypha', '2-esdras', 4, 30, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The evil seed sown in the heart of Adam is the same evil imagination Yahuah names from man''s youth.'),
  ('apocrypha', '2-esdras', 4, 30, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Paul reads Adam''s heart exactly as Uriel does — one man''s seed bringing forth ungodliness and death upon all.'),
  ('apocrypha', '2-esdras', 4, 30, 'canon', 'matthew', 13, 30, 'free', E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* Yahusha''s harvest of the tares is Uriel''s awaited time of threshing when the ears of wickedness are cut down.'),
  ('apocrypha', '2-esdras', 4, 32, 'canon', 'matthew', 13, 39, 'free', E'Matthew 13:39 — *The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels.* The evil sower and the end-time reaping Yahusha explains are the same seed and floor Uriel sets before Ezra.'),
  -- thread: 2-esdras-4-souls-in-their-chambers
  ('apocrypha', '2-esdras', 4, 35, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* John''s souls under the altar are Uriel''s souls of the righteous waiting in their chambers.'),
  ('apocrypha', '2-esdras', 4, 35, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* Their ''How long'' is word for word the question the righteous souls ask in 2 Esdras 4:35.'),
  ('apocrypha', '2-esdras', 4, 36, 'canon', 'revelation', 6, 11, 'free', E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The answer to wait ''until the number is filled'' is exactly Uriel''s reply that the seeds must first be complete.'),
  -- thread: 2-esdras-4-womb-and-the-grave
  ('apocrypha', '2-esdras', 4, 41, 'canon', 'john', 16, 21, 'free', E'John 16:21 — *A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world.* Yahusha''s travailing woman delivered into joy is Uriel''s womb of the grave hasting to deliver the souls committed to it.'),
  ('apocrypha', '2-esdras', 4, 42, 'canon', 'romans', 8, 22, 'free', E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Paul names the same birth-travail of creation that Uriel makes the sign of the grave''s coming deliverance.'),
  ('apocrypha', '2-esdras', 4, 42, 'canon', '1-corinthians', 15, 36, 'free', E'1 Corinthians 15:36 — *Thou fool, that which thou sowest is not quickened, except it die:* Paul''s seed that must die to be raised is the same harvest the grave-womb of 2 Esdras 4:42 hastes to bring forth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-weigh-the-fire',
       E'Weigh me the weight of the fire',
       E'Uriel hands Ezra three impossibilities: *Go your way, weigh me the weight of the fire, or measure me the blast of the wind, or call me again the day that is past* (2 Esdras 4:5) — *Nevertheless now have I asked you but only of the fire and wind, and of the day wherethrough you have passed, and of things from which you can not be separated, and yet can you give me no answer of them* (2 Esdras 4:9). The same Voice silenced Job from the whirlwind: *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* (Job 38:4); *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* (Job 38:5). It is the Most High''s own measuring hand: *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* (Isaiah 40:12). And the wind He gathers belongs to a Name and a Son: *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* (Proverbs 30:4). It ain''t new — the creature cannot weigh the fire of the One who weighs the worlds.',
       sv.verse_id, ev.verse_id, 'extras', 63075
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-ways-past-finding-out',
       E'The ways of the Most High past finding out',
       E'When Ezra cannot answer, Uriel draws the lesson: *If you were judge now between these two, whom wouldest you begin to justify?* (2 Esdras 4:18) — *even so they that dwell upon the earth may understand nothing but that which is upon the earth: and he that dwells above the heavens may only understand the things that are above the height of the heavens* (2 Esdras 4:21). This is no novelty: Yahuah said the same through Isaiah — *For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD)* (Isaiah 55:8); *For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts* (Isaiah 55:9). And Moses set the boundary at Moab: *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law* (Deuteronomy 29:29). The earth-bound mind keeps the revealed Torah; it does not climb to weigh the secret counsel of the heavens.',
       sv.verse_id, ev.verse_id, 'extras', 63078
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-evil-seed-in-adam',
       E'The grain of evil seed sown in the heart of Adam',
       E'Uriel names the root of the corruption Ezra mourns: *For the grain of evil seed has been sown in the heart of Adam from the beginning, and how much ungodliness has it brought up to this time? and how much shall it yet bring forth until the time of threshing come?* (2 Esdras 4:30). This is the very diagnosis Yahuah gave after the flood — *the imagination of man''s heart is evil from his youth* (Genesis 8:21) — and the apostle''s reckoning of the one man through whom it spread: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). And the time of threshing Uriel awaits is the Messiah''s own harvest: *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn* (Matthew 13:30); *The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39). The evil seed in Adam, the wheat and tares, the threshing-floor — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63081
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-souls-in-their-chambers',
       E'How long? — the souls of the righteous in their chambers',
       E'Ezra is shown the cry of the waiting dead: *Did not the souls also of the righteous ask question of these things in their chambers, saying, How long shall I hope on this fashion? when comes the fruit of the floor of our reward?* (2 Esdras 4:35) — *And to these things Uriel the archangel gave them answer, and said, Even when the number of seeds is filled in you: for he has weighed the world in the balance* (2 Esdras 4:36). John sees the very same souls and hears the very same cry: *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9); *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). And the answer is identical — wait until the full number is complete: *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled* (Revelation 6:11). The chambers of the souls, the ''how long,'' the fixed number to be filled — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63084
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-4-womb-and-the-grave',
       E'The grave as the womb travailing to deliver',
       E'Uriel gives the resurrection its sign in the birth-pang: *Go your way to a woman with child, and ask of her when she has fulfilled her nine months, if her womb may keep the birth any longer within her* (2 Esdras 4:40) — *In the grave the chambers of souls are like the womb of a woman: For like as a woman that travaileth makes haste to escape the necessity of the travail: even so do these places haste to deliver those things that are committed to them* (2 Esdras 4:41-42). Yahusha gave the same figure of the travailing woman delivered into joy: *A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world* (John 16:21). Creation itself groans in that labour: *For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). And the seed that must die before it is quickened is Paul''s own picture of the grave''s harvest: *Thou fool, that which thou sowest is not quickened, except it die* (1 Corinthians 15:36). The grave a womb, the dead a seed waiting to be born — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63087
  FROM _session253_2esd4_lookup sv, _session253_2esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=4 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-4-weigh-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The Most High answers Ezra exactly as He answered Job — by the unanswerable question that exposes the creature''s limit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* The challenge to measure is Yahuah''s own test of the dust that would weigh the fire of 2 Esdras 4:5.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 40:12 — *Who hath measured the waters in the hollow of his hand, and meted out heaven with the span, and comprehended the dust of the earth in a measure, and weighed the mountains in scales, and the hills in a balance?* What Uriel asks Ezra to do, only the Creator does — He alone weighs wind and water.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* Agur''s riddle of the gathered wind names the same unscalable height Ezra confesses he cannot reach — and points past it to the Father and the Son.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-weigh-the-fire'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-ways-past-finding-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:8 — *For my thoughts are not your thoughts, neither are your ways my ways, saith Yahuah (LORD).* The gulf Uriel marks between earth-dweller and Heaven-dweller is exactly the gulf Yahuah names between His ways and ours.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-ways-past-finding-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 55:9 — *For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts.* The literal height of the heavens above the earth is Uriel''s very measure of what the creature cannot reach in 2 Esdras 4:21.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-ways-past-finding-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses already drew Uriel''s line: the secret things stay above the heavens, the revealed Torah is given the earth-dweller to keep.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-ways-past-finding-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-evil-seed-in-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The evil seed sown in the heart of Adam is the same evil imagination Yahuah names from man''s youth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Paul reads Adam''s heart exactly as Uriel does — one man''s seed bringing forth ungodliness and death upon all.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:30 — *Let both grow together until the harvest: and in the time of harvest I will say to the reapers, Gather ye together first the tares, and bind them in bundles to burn them: but gather the wheat into my barn.* Yahusha''s harvest of the tares is Uriel''s awaited time of threshing when the ears of wickedness are cut down.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 13:39 — *The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels.* The evil sower and the end-time reaping Yahusha explains are the same seed and floor Uriel sets before Ezra.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-evil-seed-in-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-souls-in-their-chambers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:9 — *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held:* John''s souls under the altar are Uriel''s souls of the righteous waiting in their chambers.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-souls-in-their-chambers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* Their ''How long'' is word for word the question the righteous souls ask in 2 Esdras 4:35.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-souls-in-their-chambers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:11 — *And white robes were given unto every one of them; and it was said unto them, that they should rest yet for a little season, until their fellowservants also and their brethren, that should be killed as they were, should be fulfilled.* The answer to wait ''until the number is filled'' is exactly Uriel''s reply that the seeds must first be complete.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-souls-in-their-chambers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-4-womb-and-the-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 16:21 — *A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world.* Yahusha''s travailing woman delivered into joy is Uriel''s womb of the grave hasting to deliver the souls committed to it.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-womb-and-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Paul names the same birth-travail of creation that Uriel makes the sign of the grave''s coming deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-womb-and-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 15:36 — *Thou fool, that which thou sowest is not quickened, except it die:* Paul''s seed that must die to be raised is the same harvest the grave-womb of 2 Esdras 4:42 hastes to bring forth.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd4_lookup sv, _session253_2esd4_lookup tv
 WHERE t.slug='2-esdras-4-womb-and-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=4 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

