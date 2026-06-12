-- ----- fragment: minion_therestofesther_16.sql (session253 the-rest-of-esther 16) -----
-- Source anchor: apocrypha/the-rest-of-esther ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe16 (view _session253_roe16_lookup). Sort band base 60550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-16-hanged-on-his-own-gallows
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'esther', 7, 10, 'free', E'Esther 7:10 — *So they hanged Haman on the gallows that he had prepared for Mordecai. Then was the king’s wrath pacified.* The letter''s report that the worker is hanged at the gates of Susa is the king''s own account of the gallows Haman built for Mordecai turned back on himself.'),
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'psalms', 7, 15, 'free', E'Psalms 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Haman hanged on his own gallows is the very pattern the Psalm sets: the trap made for another swallows its maker.'),
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'psalms', 7, 16, 'free', E'Psalms 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* Yahuah rendering vengeance to Haman according to his deserts is mischief returning upon the head of the one who devised it.'),
  ('apocrypha', 'the-rest-of-esther', 16, 18, 'canon', 'proverbs', 11, 8, 'free', E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Mordecai delivered while Haman hangs in his place is the proverb made history at the gates of Susa.'),
  -- thread: rest-of-esther-16-amalek-blotted-out
  ('apocrypha', 'the-rest-of-esther', 16, 10, 'canon', 'deuteronomy', 25, 19, 'free', E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* Haman the stranger-plotter is the Amalekite seed under the standing decree of erasure.'),
  ('apocrypha', 'the-rest-of-esther', 16, 10, 'canon', 'deuteronomy', 25, 17, 'free', E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the king''s exposure of the foreign plotter who waylaid the people echoes the command never to forget what Amalek did on the way.'),
  ('apocrypha', 'the-rest-of-esther', 16, 13, 'canon', 'exodus', 17, 14, 'free', E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* Haman''s plot against Mordecai and Esther with their whole nation is the latest assault in the war Yahuah swore to wage against Amalek from generation to generation.'),
  ('apocrypha', 'the-rest-of-esther', 16, 13, 'canon', '1-samuel', 15, 33, 'free', E'1 Samuel 15:33 — *And Samuel said, As thy sword hath made women childless, so shall thy mother be childless among women. And Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal.* Haman the Agagite seeking the destruction of the whole nation falls where Agag his forefather fell, the seed-war carried to its end.'),
  -- thread: rest-of-esther-16-pride-translates-the-kingdom
  ('apocrypha', 'the-rest-of-esther', 16, 4, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proud who think to escape the justice of Yahuah that seeth all things fall by the very haughtiness the letter exposes.'),
  ('apocrypha', 'the-rest-of-esther', 16, 4, 'canon', 'proverbs', 16, 5, 'free', E'Proverbs 16:5 — *Every one that is proud in heart is an abomination to Yahuah (LORD): though hand join in hand, he shall not be unpunished.* The lifted-up who imagine they can escape the all-seeing justice of Yahuah are the proud-in-heart who shall not go unpunished.'),
  ('apocrypha', 'the-rest-of-esther', 16, 2, 'apocrypha', 'ecclesiasticus', 10, 7, 'extras', E'Ecclesiasticus 10:7 — *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity.* The honoured who wax proud and turn on their benefactors are exactly the pride Ben Sira names as hateful before Yahuah and man.'),
  ('apocrypha', 'the-rest-of-esther', 16, 2, 'apocrypha', 'ecclesiasticus', 10, 8, 'extras', E'Ecclesiasticus 10:8 — *Because of unrighteous dealings, injuries, and riches got by deceit, the kingdom is translated from one people to another.* Haman''s plot to translate the Persian kingdom to the Macedonians by deceit falls under Ben Sira''s law that injustice removes a kingdom from one people to another.'),
  -- thread: rest-of-esther-16-children-of-the-most-high
  ('apocrypha', 'the-rest-of-esther', 16, 16, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* the king''s confession that the living Yahuah ordered his kingdom is the truth Daniel pressed on Nebuchadnezzar, that Elohim removes and sets up kings.'),
  ('apocrypha', 'the-rest-of-esther', 16, 16, 'canon', 'daniel', 2, 20, 'free', E'Daniel 2:20 — *Daniel answered and said, Blessed be the name of Elohim (God) for ever and ever: for wisdom and might are his:* the king naming the most high and most mighty living Yahuah who orders kingdoms echoes Daniel''s blessing of the Elohim to whom wisdom and might belong.'),
  ('apocrypha', 'the-rest-of-esther', 16, 15, 'apocrypha', 'ecclesiasticus', 10, 19, 'extras', E'Ecclesiasticus 10:19 — *They that fear Yahuah (God) are a sure seed, and they that love him an honourable plant: they that regard not the law are a dishonourable seed; they that transgress the commandments are a deceivable seed.* The Yahudim who live by most just laws are Ben Sira''s sure seed, the people who keep the commandments and so are no evildoers.'),
  -- thread: rest-of-esther-16-turned-to-joy-the-feast
  ('apocrypha', 'the-rest-of-esther', 16, 21, 'canon', 'esther', 9, 22, 'free', E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The letter''s turning of the day of destruction to joy is the founding charter of Purim Mordecai wrote into the calendar.'),
  ('apocrypha', 'the-rest-of-esther', 16, 20, 'apocrypha', '2-maccabees', 15, 36, 'extras', E'2 Maccabees 15:36 — *And they ordained all with a common decree in no case to let that day pass without solemnity, but to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus’ day.* The thirteenth of Adar named in the king''s decree is the very date the Maccabees keep, reckoned as the eve of Mordecai''s day.'),
  ('apocrypha', 'the-rest-of-esther', 16, 21, 'canon', 'psalms', 9, 15, 'free', E'Psalms 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* The day on which the chosen people should have perished turned to joy is the Psalmist''s reversal: the snare-setter caught in his own net.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-hanged-on-his-own-gallows',
       E'He digged a pit and is fallen in: Haman on his own gallows',
       E'The king''s vindicating letter announces the reversal: *For he that was the worker of these things, is hanged at the gates of Susa with all his family: Yahuah (God), who ruleth all things, speedily rendering vengeance to him according to his deserts.* (Rest of Esther 16:18) The plotter is caught in his own plot. *So they hanged Haman on the gallows that he had prepared for Mordecai. Then was the king''s wrath pacified.* (Esther 7:10) The gallows fifty cubits high was Haman''s own work. The Psalmist had already sung the law of it: *He made a pit, and digged it, and is fallen into the ditch which he made.* (Psalms 7:15) And *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* (Psalms 7:16) Solomon names the same reversal: *The righteous is delivered out of trouble, and the wicked cometh in his stead.* (Proverbs 11:8) It ain''t new — the snare set for the just snaps shut on the one who set it.',
       sv.verse_id, ev.verse_id, 'extras', 60550
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-amalek-blotted-out',
       E'The Agagite stranger: blotting out the seed of Amalek',
       E'The king unmasks the enemy by his lineage: *For Aman, a Macedonian, the son of Amadatha, being indeed a stranger from the Persian blood, and far distant from our goodness, and as a stranger received of us,* (Rest of Esther 16:10) — the perennial outsider who plots the destruction of the chosen people. Behind the Macedonian gloss stands the old seed-war: Haman the Agagite, of the house Yahuah swore to erase. *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* (Deuteronomy 25:17) and the standing decree: *thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* (Deuteronomy 25:19) Moses had already written it as memorial: *Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* (Exodus 17:14) Saul spared Agag and lost a kingdom; *And Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal.* (1 Samuel 15:33) The gallows at Susa finishes the unforgotten war.',
       sv.verse_id, ev.verse_id, 'extras', 60553
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-pride-translates-the-kingdom',
       E'Lifted up to escape justice: pride and the translated kingdom',
       E'The letter diagnoses the disease at the root: *And take not only thankfulness away from among men, but also lifted up with the glorious words of lewd persons, that were never good, they think to escape the justice of Yahuah (God), that seeth all things and hates evil.* (Rest of Esther 16:4) Honoured beyond bearing, the proud turn on their benefactors: *Many, the more often they are honoured with the great bounty of their gracious princes, the more proud they are waxen,* (Rest of Esther 16:2). Yeshua ben Sira had taught the law of it: *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity.* (Ecclesiasticus 10:7) And the very mechanism of Haman''s downfall — *Because of unrighteous dealings, injuries, and riches got by deceit, the kingdom is translated from one people to another.* (Ecclesiasticus 10:8) Solomon seals it: *Pride goeth before destruction, and an haughty spirit before a fall.* (Proverbs 16:18) Yahuah *that seeth all things* is not mocked.',
       sv.verse_id, ev.verse_id, 'extras', 60556
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-children-of-the-most-high',
       E'Children of the living Elohim: the people who live by just laws',
       E'The king clears the accused and names them rightly: *But we find that the Yahudim (Jews), whom this wicked wretch has delivered to utter destruction, are no evildoers, but live by most just laws:* (Rest of Esther 16:15) — *And that they be children of the most high and most mighty, living Yahuah (God), who has ordered the kingdom both to us and to our progenitors in the most excellent manner.* (Rest of Esther 16:16) The pagan king confesses the covenant election the scriptures proclaim. They that fear Yahuah are the kept seed: *They that fear Yahuah (God) are a sure seed, and they that love him an honourable plant: they that regard not the law are a dishonourable seed; they that transgress the commandments are a deceivable seed.* (Ecclesiasticus 10:19) Daniel had taught a Babylon king the same — *Blessed be the name of Elohim (God) for ever and ever: for wisdom and might are his... he removeth kings, and setteth up kings.* (Daniel 2:20-21) The One who orders kingdoms keeps His people who live by His law.',
       sv.verse_id, ev.verse_id, 'extras', 60559
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-16-turned-to-joy-the-feast',
       E'Turned to joy: the high day of deliverance kept among the feasts',
       E'The reversal becomes a perpetual festival: *For Almighty Yahuah (God) has turned to joy to them the day, in which the chosen people should have perished.* (Rest of Esther 16:21) — *You shall therefore among your solemn feasts keep it an high day with all feasting:* (Rest of Esther 16:22). The day of intended destruction, the thirteenth of Adar, becomes Purim. Mordecai wrote it into Israel''s calendar: *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* (Esther 9:22) And the deuterocanon itself remembers the very date — when Judas struck down the blasphemer Nicanor — *to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus'' day.* (2 Maccabees 15:36) The Psalmist sings the pattern of every such reversal: *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* (Psalms 9:15)',
       sv.verse_id, ev.verse_id, 'extras', 60562
  FROM _session253_roe16_lookup sv, _session253_roe16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=16 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-16-hanged-on-his-own-gallows
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 7:10 — *So they hanged Haman on the gallows that he had prepared for Mordecai. Then was the king’s wrath pacified.* The letter''s report that the worker is hanged at the gates of Susa is the king''s own account of the gallows Haman built for Mordecai turned back on himself.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 7:15 — *He made a pit, and digged it, and is fallen into the ditch which he made.* Haman hanged on his own gallows is the very pattern the Psalm sets: the trap made for another swallows its maker.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 7:16 — *His mischief shall return upon his own head, and his violent dealing shall come down upon his own pate.* Yahuah rendering vengeance to Haman according to his deserts is mischief returning upon the head of the one who devised it.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Mordecai delivered while Haman hangs in his place is the proverb made history at the gates of Susa.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-hanged-on-his-own-gallows'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-amalek-blotted-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 25:19 — *Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about, in the land which Yahuah Elohayka (the LORD thy God) giveth thee for an inheritance to possess it, that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it.* Haman the stranger-plotter is the Amalekite seed under the standing decree of erasure.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the king''s exposure of the foreign plotter who waylaid the people echoes the command never to forget what Amalek did on the way.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* Haman''s plot against Mordecai and Esther with their whole nation is the latest assault in the war Yahuah swore to wage against Amalek from generation to generation.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Samuel 15:33 — *And Samuel said, As thy sword hath made women childless, so shall thy mother be childless among women. And Samuel hewed Agag in pieces before Yahuah (LORD) in Gilgal.* Haman the Agagite seeking the destruction of the whole nation falls where Agag his forefather fell, the seed-war carried to its end.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-amalek-blotted-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-pride-translates-the-kingdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proud who think to escape the justice of Yahuah that seeth all things fall by the very haughtiness the letter exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:5 — *Every one that is proud in heart is an abomination to Yahuah (LORD): though hand join in hand, he shall not be unpunished.* The lifted-up who imagine they can escape the all-seeing justice of Yahuah are the proud-in-heart who shall not go unpunished.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 10:7 — *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity.* The honoured who wax proud and turn on their benefactors are exactly the pride Ben Sira names as hateful before Yahuah and man.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 10:8 — *Because of unrighteous dealings, injuries, and riches got by deceit, the kingdom is translated from one people to another.* Haman''s plot to translate the Persian kingdom to the Macedonians by deceit falls under Ben Sira''s law that injustice removes a kingdom from one people to another.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-pride-translates-the-kingdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-children-of-the-most-high
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* the king''s confession that the living Yahuah ordered his kingdom is the truth Daniel pressed on Nebuchadnezzar, that Elohim removes and sets up kings.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-children-of-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:20 — *Daniel answered and said, Blessed be the name of Elohim (God) for ever and ever: for wisdom and might are his:* the king naming the most high and most mighty living Yahuah who orders kingdoms echoes Daniel''s blessing of the Elohim to whom wisdom and might belong.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-children-of-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 10:19 — *They that fear Yahuah (God) are a sure seed, and they that love him an honourable plant: they that regard not the law are a dishonourable seed; they that transgress the commandments are a deceivable seed.* The Yahudim who live by most just laws are Ben Sira''s sure seed, the people who keep the commandments and so are no evildoers.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-children-of-the-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-16-turned-to-joy-the-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 9:22 — *As the days wherein the Yahudim (Jews) rested from their enemies, and the month which was turned unto them from sorrow to joy, and from mourning into a good day: that they should make them days of feasting and joy, and of sending portions one to another, and gifts to the poor.* The letter''s turning of the day of destruction to joy is the founding charter of Purim Mordecai wrote into the calendar.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-turned-to-joy-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 15:36 — *And they ordained all with a common decree in no case to let that day pass without solemnity, but to celebrate the thirteenth day of the twelfth month, which in the Syrian tongue is called Adar, the day before Mardocheus’ day.* The thirteenth of Adar named in the king''s decree is the very date the Maccabees keep, reckoned as the eve of Mordecai''s day.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-turned-to-joy-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 9:15 — *The heathen are sunk down in the pit that they made: in the net which they hid is their own foot taken.* The day on which the chosen people should have perished turned to joy is the Psalmist''s reversal: the snare-setter caught in his own net.'
  FROM cross_reference_threads t, cross_references x, _session253_roe16_lookup sv, _session253_roe16_lookup tv
 WHERE t.slug='rest-of-esther-16-turned-to-joy-the-feast'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

