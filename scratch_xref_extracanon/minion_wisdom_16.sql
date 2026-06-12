-- ----- fragment: minion_thewisdomofsolomon_16.sql (session253 the-wisdom-of-solomon 16) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis16 (view _session253_wis16_lookup). Sort band base 58375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-16-brazen-serpent-healing-look
  ('apocrypha', 'the-wisdom-of-solomon', 16, 6, 'canon', 'numbers', 21, 8, 'free', E'Numbers 21:8 — *And the LORD said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live.* This is the very ''sign of salvation'' Wisdom of Solomon 16:6 says was set up to put Yashar''el in remembrance of the commandment of the law.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 7, 'canon', 'numbers', 21, 9, 'free', E'Numbers 21:9 — *And Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived.* Wisdom of Solomon 16:7 reads this scene precisely: the beholder ''was not saved by the thing that he saw, but by thee, that art the Saviour of all.'''),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 7, 'canon', 'john', 3, 14, 'free', E'John 3:14 — *And as Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up.* Yahusha names the type Wisdom of Solomon 16:7 already saw — the look toward the lifted-up One, not the bronze, is what saves.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 7, 'canon', 'john', 3, 15, 'free', E'John 3:15 — *That whosoever believeth in him should not perish, but have eternal life.* The believing look of Wisdom of Solomon 16:7 — saved ''by thee, that art the Saviour of all'' — finds its fullness in the lifted-up Messiah.'),
  -- thread: wisdom-16-word-that-healeth-all-things
  ('apocrypha', 'the-wisdom-of-solomon', 16, 12, 'canon', 'psalms', 107, 20, 'free', E'Psalm 107:20 — *He sent his word, and healed them, and delivered them from their destructions.* This is the same confession as Wisdom of Solomon 16:12 — not herb nor plaister but the sent word of Yahuah heals all things.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 13, 'canon', 'deuteronomy', 32, 39, 'free', E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The song of Moses says exactly what Wisdom of Solomon 16:13 says — power of life and death, none escaping His hand (Wisdom 16:15).'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 13, 'canon', '1-samuel', 2, 6, 'free', E'1 Samuel 2:6 — *The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up.* Hannah''s song is Wisdom of Solomon 16:13 word for word: He ''leadest to the gates of hell, and bringest up again.'''),
  -- thread: wisdom-16-angels-food-bread-from-heaven
  ('apocrypha', 'the-wisdom-of-solomon', 16, 20, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said the LORD unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* This is the manna Wisdom of Solomon 16:20 calls ''bread prepared without their labour'' sent from heaven.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 20, 'canon', 'psalms', 78, 25, 'free', E'Psalm 78:25 — *Man did eat angels'' food: he sent them meat to the full.* The Psalm and Wisdom of Solomon 16:20 use the same phrase — ''angels'' food'' — for the manna that filled every taste.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 21, 'canon', 'john', 6, 32, 'free', E'John 6:32 — *Then Jesus said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* The manna ''tempered itself to every man''s liking'' (Wisdom of Solomon 16:21) was the shadow; Yahusha is the true bread from heaven.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 21, 'canon', 'john', 6, 33, 'free', E'John 6:33 — *For the bread of God is he which cometh down from heaven, and giveth life unto the world.* The sweetness of the heavenly sustenance in Wisdom of Solomon 16:21 finds its substance in the Bread that gives life to the world.'),
  -- thread: wisdom-16-man-lives-by-the-word
  ('apocrypha', 'the-wisdom-of-solomon', 16, 26, 'canon', 'deuteronomy', 8, 3, 'free', E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of the LORD doth man live.* Wisdom of Solomon 16:26 distils this Torah lesson: not fruits but His word nourisheth and preserveth.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 26, 'canon', 'matthew', 4, 4, 'free', E'Matthew 4:4 — *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.* Yahusha wields the truth Wisdom of Solomon 16:26 confesses — the word, not the growing of fruits, sustains the children of Yahuah.'),
  -- thread: wisdom-16-quails-and-the-stinging-serpents
  ('apocrypha', 'the-wisdom-of-solomon', 16, 2, 'canon', 'numbers', 11, 31, 'free', E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp, as it were a day''s journey on this side, and as it were a day''s journey on the other side, round about the camp, and as it were two cubits high upon the face of the earth.* These are the ''quails to stir up their appetite'' of Wisdom of Solomon 16:2.'),
  ('apocrypha', 'the-wisdom-of-solomon', 16, 10, 'canon', 'numbers', 21, 6, 'free', E'Numbers 21:6 — *And the LORD sent fiery serpents among the people, and they bit the people; and much people of Israel died.* These are the ''venomous dragons'' Wisdom of Solomon 16:10 says could not overcome Yahuah''s sons, for His mercy healed them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-brazen-serpent-healing-look',
       E'The sign of salvation — the look that healed',
       E'When the serpents stung Yashar''el in the wilderness, the cure was not the bronze on the pole but the One it pointed to: *But they were troubled for a small season, that they might be admonished, having a sign of salvation, to put them in remembrance of the commandment of thy law* (Wisdom of Solomon 16:6), *For he that turned himself toward it was not saved by the thing that he saw, but by thee, that art the Saviour of all* (Wisdom of Solomon 16:7). Wisdom reads Moses'' serpent exactly as the Tanakh sets it — *And the LORD said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live* (Numbers 21:8) — and Yahusha makes the type explicit: *And as Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up* (John 3:14). The look of faith toward the lifted-up One is the sign of salvation; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58375
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-word-that-healeth-all-things',
       E'Not herb nor plaister, but thy word',
       E'Wisdom presses past the means to the Healer Himself: *For it was neither herb, nor mollifying plaister, that restored them to health: but thy word, O Yahuah (God), which healeth all things* (Wisdom of Solomon 16:12). This is the Psalmist''s confession — *He sent his word, and healed them, and delivered them from their destructions* (Psalm 107:20) — the spoken word of the Maker as the true medicine. And the next breath of Wisdom presses to the deepest power: *For thou hast power of life and death: thou leadest to the gates of hell, and bringest up again* (Wisdom of Solomon 16:13), echoing the song of Moses — *I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand* (Deuteronomy 32:39) — and Hannah''s — *The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up* (1 Samuel 2:6). The Word that heals and raises is the same Word made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 58378
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-angels-food-bread-from-heaven',
       E'Angels'' food — the bread from heaven',
       E'Against Egypt''s plagued harvest, Yahuah fed His people the bread of heaven: *Instead of which thou feddest thine own people with angels'' food, and didst send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste* (Wisdom of Solomon 16:20); *For thy sustenance declared thy sweetness unto thy children, and serving to the appetite of the eater, tempered itself to every man''s liking* (Wisdom of Solomon 16:21). This is the manna of Exodus — *Then said the LORD unto Moses, Behold, I will rain bread from heaven for you* (Exodus 16:4) — sung in the Psalms as *the corn of heaven* and *angels'' food* — *And had rained down manna upon them to eat, and had given them of the corn of heaven. Man did eat angels'' food: he sent them meat to the full* (Psalm 78:24-25). Yahusha gathers the whole figure: *Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32). The manna was a shadow; the Bread of Life is the substance.',
       sv.verse_id, ev.verse_id, 'extras', 58381
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-man-lives-by-the-word',
       E'Not fruits but thy word nourisheth man',
       E'Wisdom draws the manna to its lesson: *That thy children, O Yahuah (God), whom thou lovest, might know, that it is not the growing of fruits that nourisheth man: but that it is thy word, which preserveth them that put their trust in thee* (Wisdom of Solomon 16:26). This is Moses'' own teaching from the manna — *And he humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of the LORD doth man live* (Deuteronomy 8:3) — and it is the sword Yahusha drew in the wilderness against the tempter: *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God* (Matthew 4:4). The bread feeds the body for a day; the word of Yahuah preserves the trusting forever.',
       sv.verse_id, ev.verse_id, 'extras', 58384
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-16-quails-and-the-stinging-serpents',
       E'Quails to the appetite, serpents to the sting',
       E'Wisdom contrasts the two wilderness tables: mercy gave Yashar''el quails, while the venomous creatures that stung them were turned to a discipline, not a death — *Instead of which punishment, dealing graciously with thine own people, thou preparedst for them meat of a strange taste, even quails to stir up their appetite* (Wisdom of Solomon 16:2); *But thy sons not the very teeth of venomous dragons overcame: for thy mercy was ever by them, and healed them* (Wisdom of Solomon 16:10). The quails are from Numbers — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp* (Numbers 11:31) — and the serpents from the same wandering — *And the LORD sent fiery serpents among the people, and they bit the people; and much people of Israel died* (Numbers 21:6). The same wilderness held both the gift and the rod; mercy ran through the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 58387
  FROM _session253_wis16_lookup sv, _session253_wis16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-16-brazen-serpent-healing-look
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 21:8 — *And the LORD said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live.* This is the very ''sign of salvation'' Wisdom of Solomon 16:6 says was set up to put Yashar''el in remembrance of the commandment of the law.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:9 — *And Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived.* Wisdom of Solomon 16:7 reads this scene precisely: the beholder ''was not saved by the thing that he saw, but by thee, that art the Saviour of all.'''
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 3:14 — *And as Moses lifted up the serpent in the wilderness, even so must the Son of man be lifted up.* Yahusha names the type Wisdom of Solomon 16:7 already saw — the look toward the lifted-up One, not the bronze, is what saves.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 3:15 — *That whosoever believeth in him should not perish, but have eternal life.* The believing look of Wisdom of Solomon 16:7 — saved ''by thee, that art the Saviour of all'' — finds its fullness in the lifted-up Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-brazen-serpent-healing-look'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-word-that-healeth-all-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 107:20 — *He sent his word, and healed them, and delivered them from their destructions.* This is the same confession as Wisdom of Solomon 16:12 — not herb nor plaister but the sent word of Yahuah heals all things.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-word-that-healeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:39 — *See now that I, even I, am he, and there is no god with me: I kill, and I make alive; I wound, and I heal: neither is there any that can deliver out of my hand.* The song of Moses says exactly what Wisdom of Solomon 16:13 says — power of life and death, none escaping His hand (Wisdom 16:15).'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-word-that-healeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:6 — *The LORD killeth, and maketh alive: he bringeth down to the grave, and bringeth up.* Hannah''s song is Wisdom of Solomon 16:13 word for word: He ''leadest to the gates of hell, and bringest up again.'''
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-word-that-healeth-all-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-angels-food-bread-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:4 — *Then said the LORD unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* This is the manna Wisdom of Solomon 16:20 calls ''bread prepared without their labour'' sent from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 78:25 — *Man did eat angels'' food: he sent them meat to the full.* The Psalm and Wisdom of Solomon 16:20 use the same phrase — ''angels'' food'' — for the manna that filled every taste.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:32 — *Then Jesus said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven.* The manna ''tempered itself to every man''s liking'' (Wisdom of Solomon 16:21) was the shadow; Yahusha is the true bread from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 6:33 — *For the bread of God is he which cometh down from heaven, and giveth life unto the world.* The sweetness of the heavenly sustenance in Wisdom of Solomon 16:21 finds its substance in the Bread that gives life to the world.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-angels-food-bread-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-man-lives-by-the-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of the LORD doth man live.* Wisdom of Solomon 16:26 distils this Torah lesson: not fruits but His word nourisheth and preserveth.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-man-lives-by-the-word'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:4 — *But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.* Yahusha wields the truth Wisdom of Solomon 16:26 confesses — the word, not the growing of fruits, sustains the children of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-man-lives-by-the-word'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-16-quails-and-the-stinging-serpents
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 11:31 — *And there went forth a wind from the LORD, and brought quails from the sea, and let them fall by the camp, as it were a day''s journey on this side, and as it were a day''s journey on the other side, round about the camp, and as it were two cubits high upon the face of the earth.* These are the ''quails to stir up their appetite'' of Wisdom of Solomon 16:2.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-quails-and-the-stinging-serpents'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:6 — *And the LORD sent fiery serpents among the people, and they bit the people; and much people of Israel died.* These are the ''venomous dragons'' Wisdom of Solomon 16:10 says could not overcome Yahuah''s sons, for His mercy healed them.'
  FROM cross_reference_threads t, cross_references x, _session253_wis16_lookup sv, _session253_wis16_lookup tv
 WHERE t.slug='wisdom-16-quails-and-the-stinging-serpents'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

