-- ----- fragment: minion_1adameve_39.sql (session253 1-adam-eve 39) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae39 (view _session253_1ae39_lookup). Sort band base 64950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-39-afraid-of-the-fruit
  ('adam-eve-conflict', '1-adam-eve', 39, 3, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Adam''s terror to eat the fig in 1 Adam and Eve 39:3 is the death-sentence of the one forbidden tree haunting every fruit thereafter.'),
  ('adam-eve-conflict', '1-adam-eve', 39, 5, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The first eating ruined them, so in 1 Adam and Eve 39:5 Adam fears what will befall him through this fruit too — the scar of the fall.'),
  ('adam-eve-conflict', '1-adam-eve', 39, 3, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The curse on eating still presses on Adam in 1 Adam and Eve 39:3, who now eats his bread in sorrow and dread outside the garden.'),
  -- thread: 1-adam-eve-39-satisfy-my-hunger-prayer
  ('adam-eve-conflict', '1-adam-eve', 39, 4, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam standing in prayer before Elohim in 1 Adam and Eve 39:4 is the calling on the Name the holy line of Seth would carry down toward Noah.'),
  ('adam-eve-conflict', '1-adam-eve', 39, 4, 'canon', 'psalms', 145, 16, 'free', E'Psalm 145:16 — *Thou openest thine hand, and satisfiest the desire of every living thing.* Adam''s plea to have his hunger satisfied in 1 Adam and Eve 39:4 looks to the open hand of Yahuah who feeds every living thing, not to the fruit.'),
  ('adam-eve-conflict', '1-adam-eve', 39, 4, 'canon', 'psalms', 145, 19, 'free', E'Psalm 145:19 — *He will fulfil the desire of them that fear him: he also will hear their cry, and will save them.* Adam who cries and prays in fear before Elohim in 1 Adam and Eve 39:4 is exactly the one whose cry Yahuah promises to hear and save.'),
  ('adam-eve-conflict', '1-adam-eve', 39, 4, 'canon', 'matthew', 6, 11, 'free', E'Matthew 6:11 — *Give us this day our daily bread.* The Messiah''s pattern prayer is already Adam''s heart in 1 Adam and Eve 39:4, asking the Father for daily sustenance instead of seizing it.'),
  -- thread: 1-adam-eve-39-bread-not-the-tempters-fruit
  ('adam-eve-conflict', '1-adam-eve', 39, 4, 'canon', 'matthew', 4, 4, 'free', E'Matthew 4:4 — *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God).* Adam asking what the fig will profit him in 1 Adam and Eve 39:4 anticipates the Last Adam who refused the tempter''s bread for the word of Elohim.'),
  ('adam-eve-conflict', '1-adam-eve', 39, 4, 'canon', 'matthew', 6, 33, 'free', E'Matthew 6:33 — *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you.* In 1 Adam and Eve 39:4 Adam seeks Elohim before the fruit, the very order the Messiah commands for those who would be fed.'),
  ('adam-eve-conflict', '1-adam-eve', 39, 4, 'canon', 'proverbs', 30, 8, 'free', E'Proverbs 30:8 — *Remove far from me vanity and lies: give me neither poverty nor riches; feed me with food convenient for me:* Adam''s prayer to have his hunger met by Elohim''s measure in 1 Adam and Eve 39:4 is the wise man''s plea for food convenient, not the fruit that profits nothing.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-39-afraid-of-the-fruit',
       E'Afraid to eat the fruit — the fall remembered',
       E'Adam takes the fig but cannot bring it to his mouth: *But Adam said to Eve, "I am afraid to eat of this fig. I know not what may come over me from it."* (1 Adam and Eve 39:3), and again *"I am afraid to eat of it; for I know not what will befall me through it."* (1 Adam and Eve 39:5). The dread is not new — it is the wound of the garden. Once *Yahuah Elohim (the LORD God) commanded the man, saying, Of every tree of the garden thou mayest freely eat:* (Genesis 2:16), *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* (Genesis 2:17) — and the eating slew them: *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6). Now the very hand that once reached out trembles to reach again; the fruit-fear is the scar of the serpent''s first deceit, the seed-war shown from the first day outside Eden.',
       sv.verse_id, ev.verse_id, 'extras', 64950
  FROM _session253_1ae39_lookup sv, _session253_1ae39_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=39 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-39-satisfy-my-hunger-prayer',
       E'Satisfy my hunger without the fruit — prayer before Elohim',
       E'Rather than trust the fruit, Adam turns to the One who feeds: *So Adam cried, and stood praying before Elohim (God), saying, "Satisfy my hunger, without my having to eat this fig..."* (1 Adam and Eve 39:4). This is the calling on the Name kept before Sinai — for *to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). And Yahuah is the Feeder of all flesh: *The eyes of all wait upon thee; and thou givest them their meat in due season.* (Psalm 145:15), *Thou openest thine hand, and satisfiest the desire of every living thing.* (Psalm 145:16). He hears the cry of the hungry who fear Him: *He will fulfil the desire of them that fear him: he also will hear their cry, and will save them.* (Psalm 145:19). The Saviour would teach this very prayer — *Give us this day our daily bread.* (Matthew 6:11) — for *your heavenly Father knoweth that ye have need of all these things.* (Matthew 6:32). It ain''t new: from the first day outside Eden Adam asked his bread of Yahuah, not of the tree.',
       sv.verse_id, ev.verse_id, 'extras', 64953
  FROM _session253_1ae39_lookup sv, _session253_1ae39_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=39 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-39-bread-not-the-tempters-fruit',
       E'Man shall not live by bread alone — the tempter''s fruit refused',
       E'Adam weighs the fig and finds it empty: *"...for after I have eaten it, what will it profit me? And what shall I desire and ask of you, O Elohim (God), when it is gone?"* (1 Adam and Eve 39:4). The fruit that fails to profit is the bread the tempter would press — and the Last Adam answered the serpent on the same ground: *And when the tempter came to him, he said, If thou be the Son of Elohim (God), command that these stones be made bread.* (Matthew 4:3), *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God).* (Matthew 4:4). So Adam is told to seek the Giver before the gift — *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you.* (Matthew 6:33) — and the wise prayer is *give me neither poverty nor riches; feed me with food convenient for me:* (Proverbs 30:8). Where the first Adam reached for the fruit, here he hesitates and asks of Elohim: the seed of the woman learning to overcome the serpent''s bread (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 64956
  FROM _session253_1ae39_lookup sv, _session253_1ae39_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=39 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-39-afraid-of-the-fruit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* Adam''s terror to eat the fig in 1 Adam and Eve 39:3 is the death-sentence of the one forbidden tree haunting every fruit thereafter.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-afraid-of-the-fruit'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* The first eating ruined them, so in 1 Adam and Eve 39:5 Adam fears what will befall him through this fruit too — the scar of the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-afraid-of-the-fruit'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The curse on eating still presses on Adam in 1 Adam and Eve 39:3, who now eats his bread in sorrow and dread outside the garden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-afraid-of-the-fruit'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-39-satisfy-my-hunger-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam standing in prayer before Elohim in 1 Adam and Eve 39:4 is the calling on the Name the holy line of Seth would carry down toward Noah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-satisfy-my-hunger-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 145:16 — *Thou openest thine hand, and satisfiest the desire of every living thing.* Adam''s plea to have his hunger satisfied in 1 Adam and Eve 39:4 looks to the open hand of Yahuah who feeds every living thing, not to the fruit.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-satisfy-my-hunger-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 145:19 — *He will fulfil the desire of them that fear him: he also will hear their cry, and will save them.* Adam who cries and prays in fear before Elohim in 1 Adam and Eve 39:4 is exactly the one whose cry Yahuah promises to hear and save.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-satisfy-my-hunger-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 6:11 — *Give us this day our daily bread.* The Messiah''s pattern prayer is already Adam''s heart in 1 Adam and Eve 39:4, asking the Father for daily sustenance instead of seizing it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-satisfy-my-hunger-prayer'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-39-bread-not-the-tempters-fruit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 4:4 — *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God).* Adam asking what the fig will profit him in 1 Adam and Eve 39:4 anticipates the Last Adam who refused the tempter''s bread for the word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-bread-not-the-tempters-fruit'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:33 — *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you.* In 1 Adam and Eve 39:4 Adam seeks Elohim before the fruit, the very order the Messiah commands for those who would be fed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-bread-not-the-tempters-fruit'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 30:8 — *Remove far from me vanity and lies: give me neither poverty nor riches; feed me with food convenient for me:* Adam''s prayer to have his hunger met by Elohim''s measure in 1 Adam and Eve 39:4 is the wise man''s plea for food convenient, not the fruit that profits nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae39_lookup sv, _session253_1ae39_lookup tv
 WHERE t.slug='1-adam-eve-39-bread-not-the-tempters-fruit'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

