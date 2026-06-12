-- ----- fragment: minion_2adameve_20.sql (session253 2-adam-eve 20) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae20 (view _session253_2ae20_lookup). Sort band base 66475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-20-genun-arts-of-cain
  ('adam-eve-conflict', '2-adam-eve', 20, 2, 'canon', 'genesis', 4, 21, 'free', E'Genesis 4:21 — *And his brother’s name was Jubal: he was the father of all such as handle the harp and organ.* The Torah''s own genealogy already names Cain''s line as the fathers of the instruments Genun multiplies in 2 Adam & Eve 20:2.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 7, 'canon', 'genesis', 4, 22, 'free', E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Cain''s house births the worker of brass and iron, exactly as Satan increases Genun''s understanding to take iron and make weapons of war in 2 Adam & Eve 20:7.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 2, 'enoch', '1-enoch', 8, 1, 'extras', E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* The Watcher Azazel''s curriculum — weaponry, ornament, dyes, painted eyes — is Genun''s curriculum verbatim, the same seed-war wearing a new name.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 3, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The sweet, heart-ravishing sounds that Satan plays through Genun''s instruments in 2 Adam & Eve 20:3 are the adversary disguising death as delight.'),
  -- thread: 2-adam-eve-20-two-seed-lines
  ('adam-eve-conflict', '2-adam-eve', 20, 14, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The sons of Cain who shine in beauty and abomination at the foot of the mountain in 2 Adam & Eve 20:14 are the line of him who was of that wicked one.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 17, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The children of Cain calling up to the holy mountain in 2 Adam & Eve 20:17 are walking — and beckoning others into — the way of Cain that Jude condemns.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 15, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The praying, praising children of Seth on the Holy Mountain in 2 Adam & Eve 20:15 are the very line of which Genesis says men began to call on the Name.'),
  -- thread: 2-adam-eve-20-satan-shows-the-way-down
  ('adam-eve-conflict', '2-adam-eve', 20, 19, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Satan''s night-counsel showing the way down the western stream in 2 Adam & Eve 20:19 is the serpent''s same subtilty that beguiled Eve.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 18, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Genun bethinking himself how to bring the sons of Seth down in 2 Adam & Eve 20:18 is the adversary walking about, seeking whom he may devour.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 19, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lie Satan whispers to Genun in 2 Adam & Eve 20:19 is the father of lies speaking of his own from the beginning.'),
  -- thread: 2-adam-eve-20-sons-of-seth-descend
  ('adam-eve-conflict', '2-adam-eve', 20, 32, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The sons of Seth lusting after the daughters of Cain until they committed abomination in 2 Adam & Eve 20:32 is the very sons-of-God / daughters-of-men mingling of Genesis 6.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 33, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The defilement that bars the sons of Seth from the holy mountain in 2 Adam & Eve 20:33 is the flood-bringing wickedness Genesis names.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 31, 'enoch', '1-enoch', 7, 1, 'extras', E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The fire of sin kindled by the painted daughters of Cain in 2 Adam & Eve 20:31 is the same defiling descent the Watchers made in Enoch.'),
  -- thread: 2-adam-eve-20-word-to-jared-children-of-devil
  ('adam-eve-conflict', '2-adam-eve', 20, 35, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Jared in 2 Adam & Eve 20:35 is the eternal Logos who was in the beginning with Elohim.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 27, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Jared''s warning that the descenders shall be called ''children of the devil'' in 2 Adam & Eve 20:27 is John''s same verdict on those of the devil who sins from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 20, 27, 'canon', '1-john', 3, 10, 'free', E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Jared''s two names — ''children of Elohim'' or ''children of the devil'' — in 2 Adam & Eve 20:27 are the two manifest seeds John sets side by side.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-genun-arts-of-cain',
       E'Genun and the arts of Cain — it ain''t new',
       E'Down in the valley of Cain''s line rises Genun, and Satan is his teacher: *But as to this Genun, Satan came into him in his childhood; and he made sundry trumpets and horns, and string instruments, cymbals and psalteries, and lyres and harps, and flutes; and he played on them at all times and at every hour* (2 Adam & Eve 20:2). Music, strong drink, weapons of war — the very catalogue Yahuah''s own record already kept of Cain''s house: *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ* (Genesis 4:21), and *Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron* (Genesis 4:22). And it ain''t new even there — the Watchers'' apostasy is the same script: *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures* (1 Enoch 8:1). The fallen one ever transforms a gift into a snare: *And no marvel; for Satan himself is transformed into an angel of light* (2 Corinthians 11:14).',
       sv.verse_id, ev.verse_id, 'extras', 66475
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-two-seed-lines',
       E'The two seed-lines: Cain below, Seth on the mountain',
       E'The whole drama is the parting of two seeds — the children of Cain in the valley of iniquity and the children of Seth kept on the Holy Mountain: *Meanwhile the children of Seth, who were on the Holy Mountain, prayed and praised Elohim (God), in the place of the hosts of angels who had fallen; wherefore Elohim (God) had called them ''angels,'' because He rejoiced over them greatly* (2 Adam & Eve 20:15). John names the two lines exactly: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12), and Jude pronounces the woe: *Woe unto them! for they have gone in the way of Cain* (Jude 1:11). And the mingling that follows is the very crisis Genesis records before the flood: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). It ain''t new — the seed-war of Genesis 3:15 is the same war, told from the first generations outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 66478
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-satan-shows-the-way-down',
       E'Satan shows the way down — the serpent''s subtilty',
       E'When the sons of Seth plead ignorance of the descent, the deceiver supplies the path: *Then Satan appeared to him by night, saying, "There is no way for them to come down from the mountain on which they dwell; but when they come to-morrow, say to them, ''Come ye to the western side of the mountain; there you will find the way of a stream of water, that comes down to the foot of the mountain, between two hills; come down that way to us"* (2 Adam & Eve 20:19). This is the same subtilty Paul fears: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). The adversary prowls for the descent: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8) — and he is, from the first, the murderer who lies: *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44).',
       sv.verse_id, ev.verse_id, 'extras', 66481
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-sons-of-seth-descend',
       E'The sons of Seth descend — sons of God, daughters of men',
       E'The hundred go down, the fire of lust is kindled, and the holy mountain shuts behind them: *But after they had thus fallen into this defilement, they returned by the way they had come, and tried to ascend the Holy Mountain. But they could not, because the stones of that holy mountain were of fire flashing before them, by reason of which they could not go up again* (2 Adam & Eve 20:33). This is the pre-flood crisis Genesis records: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and the corruption that follows: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5). The other restored witness tells the same descent: *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments* (1 Enoch 7:1). One seed-war, many tongues.',
       sv.verse_id, ev.verse_id, 'extras', 66484
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=31
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-20-word-to-jared-children-of-devil',
       E'The Word to Jared — children of Elohim or children of the devil',
       E'Jared''s warning sets the two destinies in the plainest terms: *He again adjured them, saying... for the moment you leave it, you will be reft of life and of mercy; and you shall no longer be called ''children of Elohim (God),'' but ''children of the devil''* (2 Adam & Eve 20:27). And when they fall, it is the Word of Elohim who comes to Jared: *Then Elohim (God) sent His Word to Jared, saying, "These thy children, whom thou didst call ''My children,'' - behold they have transgressed My commandment"* (2 Adam & Eve 20:35). That sent Word is the Logos: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1). And Jared''s two names are John''s two lines exactly: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8); *In this the children of Elohim (God) are manifest, and the children of the devil* (1 John 3:10). Election before confession — the seed kept, the seed lost.',
       sv.verse_id, ev.verse_id, 'extras', 66487
  FROM _session253_2ae20_lookup sv, _session253_2ae20_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=27
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=20 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-20-genun-arts-of-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:21 — *And his brother’s name was Jubal: he was the father of all such as handle the harp and organ.* The Torah''s own genealogy already names Cain''s line as the fathers of the instruments Genun multiplies in 2 Adam & Eve 20:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Cain''s house births the worker of brass and iron, exactly as Satan increases Genun''s understanding to take iron and make weapons of war in 2 Adam & Eve 20:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* The Watcher Azazel''s curriculum — weaponry, ornament, dyes, painted eyes — is Genun''s curriculum verbatim, the same seed-war wearing a new name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The sweet, heart-ravishing sounds that Satan plays through Genun''s instruments in 2 Adam & Eve 20:3 are the adversary disguising death as delight.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-genun-arts-of-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The sons of Cain who shine in beauty and abomination at the foot of the mountain in 2 Adam & Eve 20:14 are the line of him who was of that wicked one.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The children of Cain calling up to the holy mountain in 2 Adam & Eve 20:17 are walking — and beckoning others into — the way of Cain that Jude condemns.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The praying, praising children of Seth on the Holy Mountain in 2 Adam & Eve 20:15 are the very line of which Genesis says men began to call on the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-satan-shows-the-way-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Satan''s night-counsel showing the way down the western stream in 2 Adam & Eve 20:19 is the serpent''s same subtilty that beguiled Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-satan-shows-the-way-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Genun bethinking himself how to bring the sons of Seth down in 2 Adam & Eve 20:18 is the adversary walking about, seeking whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-satan-shows-the-way-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The lie Satan whispers to Genun in 2 Adam & Eve 20:19 is the father of lies speaking of his own from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-satan-shows-the-way-down'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-sons-of-seth-descend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The sons of Seth lusting after the daughters of Cain until they committed abomination in 2 Adam & Eve 20:32 is the very sons-of-God / daughters-of-men mingling of Genesis 6.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-sons-of-seth-descend'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The defilement that bars the sons of Seth from the holy mountain in 2 Adam & Eve 20:33 is the flood-bringing wickedness Genesis names.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-sons-of-seth-descend'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 7:1 — *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* The fire of sin kindled by the painted daughters of Cain in 2 Adam & Eve 20:31 is the same defiling descent the Watchers made in Enoch.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-sons-of-seth-descend'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=31
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-20-word-to-jared-children-of-devil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that Elohim sends to Jared in 2 Adam & Eve 20:35 is the eternal Logos who was in the beginning with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-word-to-jared-children-of-devil'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Jared''s warning that the descenders shall be called ''children of the devil'' in 2 Adam & Eve 20:27 is John''s same verdict on those of the devil who sins from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-word-to-jared-children-of-devil'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Jared''s two names — ''children of Elohim'' or ''children of the devil'' — in 2 Adam & Eve 20:27 are the two manifest seeds John sets side by side.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae20_lookup sv, _session253_2ae20_lookup tv
 WHERE t.slug='2-adam-eve-20-word-to-jared-children-of-devil'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

