-- ----- fragment: minion_therestofesther_12.sql (session253 the-rest-of-esther 12) -----
-- Source anchor: apocrypha/the-rest-of-esther ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe12 (view _session253_roe12_lookup). Sort band base 60450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-12-the-plot-uncovered
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'esther', 2, 21, 'free', E'Esther 2:21 — *In those days, while Mordecai sat in the king’s gate, two of the king’s chamberlains, Bigthan and Teresh, of those which kept the door, were wroth, and sought to lay hand on the king Ahasuerus.* The canonical book names the same two door-keepers whose plot Mordecai overhears in Rest of Esther 12:2.'),
  ('apocrypha', 'the-rest-of-esther', 12, 3, 'canon', 'esther', 2, 23, 'free', E'Esther 2:23 — *And when inquisition was made of the matter, it was found out; therefore they were both hanged on a tree: and it was written in the book of the chronicles before the king.* The strangling and the chronicling of Rest of Esther 12:3-4 is this same examination and record set down in the Hebrew.'),
  ('apocrypha', 'the-rest-of-esther', 12, 4, 'canon', 'esther', 6, 2, 'free', E'Esther 6:2 — *And it was found written, that Mordecai had told of Bigthana and Teresh, two of the king’s chamberlains, the keepers of the door, who sought to lay hand on the king Ahasuerus.* The record Mordecai writes in Rest of Esther 12:4 is the very page read on the sleepless night that begins his deliverance.'),
  -- thread: rest-of-esther-12-watchman-of-the-king
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'proverbs', 24, 11, 'free', E'Proverbs 24:11 — *If thou forbear to deliver them that are drawn unto death, and those that are ready to be slain;* Mordecai''s certifying of the king in Rest of Esther 12:2 is exactly the deliverance from death the proverb forbids the righteous to withhold.'),
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'proverbs', 24, 12, 'free', E'Proverbs 24:12 — *If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* The plot Mordecai searches out in Rest of Esther 12:2 cannot be feigned-ignorant, for the One who ponders the heart renders to each according to his works.'),
  ('apocrypha', 'the-rest-of-esther', 12, 2, 'canon', 'ecclesiastes', 10, 20, 'free', E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* The eunuchs'' devices in Rest of Esther 12:2 are the hidden voice that wings its way to the king''s ear through the watchman who heard.'),
  -- thread: rest-of-esther-12-the-servant-rewarded
  ('apocrypha', 'the-rest-of-esther', 12, 5, 'canon', 'esther', 6, 11, 'free', E'Esther 6:11 — *Then took Haman the apparel and the horse, and arrayed Mordecai, and brought him on horseback through the street of the city, and proclaimed before him, Thus shall it be done unto the man whom the king delighteth to honour.* The reward promised in Rest of Esther 12:5 is paid by Haman''s own hand in the Hebrew, the enemy parading the man he hated.'),
  ('apocrypha', 'the-rest-of-esther', 12, 5, 'canon', 'esther', 10, 3, 'free', E'Esther 10:3 — *For Mordecai the Yahudi (Jew) was next unto king Ahasuerus, and great among the Yahudim (Jews), and accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed.* Mordecai''s service-and-reward in Rest of Esther 12:5 ripens into the second seat of the kingdom and peace for his whole people.'),
  -- thread: rest-of-esther-12-haman-the-agagite
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', 'esther', 3, 6, 'free', E'Esther 3:6 — *And he thought scorn to lay hands on Mordecai alone; for they had shewed him the people of Mordecai: wherefore Haman sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom of Ahasuerus, even the people of Mordecai.* The grudge that begins against Mordecai''s people in Rest of Esther 12:6 swells in the Hebrew into a decree to destroy the whole nation.'),
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', '1-samuel', 15, 2, 'free', E'1 Samuel 15:2 — *Thus saith Yahuah Tseva''ot (LORD of hosts), I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt.* Haman the Agagite of Rest of Esther 12:6 is the line of Agag king of Amalek, carrying forward the ancient enmity Yahuah remembers.'),
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', 'deuteronomy', 25, 17, 'free', E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the Agagite''s grudge in Rest of Esther 12:6 is the standing Torah-charge against Amalek breaking out again in Persia.'),
  ('apocrypha', 'the-rest-of-esther', 12, 6, 'canon', 'exodus', 17, 14, 'free', E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* The seed-war Haman renews in Rest of Esther 12:6 is the very Amalek whose remembrance Yahuah swore to blot out.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-the-plot-uncovered',
       E'Mordecai uncovers the plot and is written into the book',
       E'The Greek additions retell, in their own hand, the scene the Hebrew already knows: *And he heard their devices, and searched out their purposes, and learned that they were about to lay hands upon Artexerxes the king; and so he certified the king of them* (Rest of Esther 12:2), and *the king made a record of these things, and Mardocheus also wrote thereof* (Rest of Esther 12:4). It is the very door-keepers'' conspiracy of the canonical book: *In those days, while Mordecai sat in the king’s gate, two of the king’s chamberlains, Bigthan and Teresh, of those which kept the door, were wroth, and sought to lay hand on the king Ahasuerus* (Esther 2:21), and when inquisition was made *they were both hanged on a tree: and it was written in the book of the chronicles before the king* (Esther 2:23). The writing is no idle detail — on the sleepless night it is read back, *and it was found written, that Mordecai had told of Bigthana and Teresh* (Esther 6:2), and the unforgotten record begins to turn the wheel of deliverance. It ain''t new: the righteous watchman speaks, and Yahuah keeps the books.',
       sv.verse_id, ev.verse_id, 'extras', 60450
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-watchman-of-the-king',
       E'The watchful righteous who delivers from death',
       E'*And he heard their devices, and searched out their purposes... and so he certified the king of them* (Rest of Esther 12:2). Mordecai is the watchman who will not be silent, and Wisdom binds his act to a charge laid on every righteous one: *If thou forbear to deliver them that are drawn unto death, and those that are ready to be slain; If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* (Proverbs 24:11-12). What he overhears in secret does not stay secret, for the proverb warns *Curse not the king, no not in thy thought... for a bird of the air shall carry the voice, and that which hath wings shall tell the matter* (Ecclesiastes 10:20) — the eunuchs'' whispered treason is carried to the throne by the one who heard it. The just man speaks; the King of all the earth keeps account.',
       sv.verse_id, ev.verse_id, 'extras', 60453
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-the-servant-rewarded',
       E'The faithful servant set in the court and rewarded',
       E'*So the king commanded, Mardocheus to serve in the court, and for this he rewarded him* (Rest of Esther 12:5). The reward foreshadowed here is paid out in full in the canonical scene, when the very enemy is made to honour him: *Then took Haman the apparel and the horse, and arrayed Mordecai, and brought him on horseback through the street of the city, and proclaimed before him, Thus shall it be done unto the man whom the king delighteth to honour* (Esther 6:11). And the reward ripens into greatness for the sake of his people, *For Mordecai the Yahudi (Jew) was next unto king Ahasuerus, and great among the Yahudim (Jews), and accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed* (Esther 10:3). The watchman of chapter 12 becomes the second of the kingdom — faithfulness in the small certified word lifted to peace for the whole seed.',
       sv.verse_id, ev.verse_id, 'extras', 60456
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-12-haman-the-agagite',
       E'Haman the Agagite — the old seed-war begins again',
       E'*Howbeit Aman the son of Amadathus the Agagite, who was in great honour with the king, sought to molest Mardocheus and his people because of the two eunuchs of the king* (Rest of Esther 12:6). The grudge is no private quarrel — the title *Agagite* names the ancient seed-war, for Haman is reckoned of Agag the Amalekite, whom the prophet rebuked Saul for sparing: *Thus saith Yahuah Tseva''ot (LORD of hosts), I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt* (1 Samuel 15:2). It is the standing charge of the Torah, *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt* (Deuteronomy 25:17), the foe of whom Yahuah swore *I will utterly put out the remembrance of Amalek from under heaven* (Exodus 17:14). And so in the canonical book the enmity flares against the whole people: *he thought scorn to lay hands on Mordecai alone... wherefore Haman sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom* (Esther 3:6). It ain''t new: the serpent''s old hatred of the seed, raised up once more in a court of Persia — and once more brought to nothing.',
       sv.verse_id, ev.verse_id, 'extras', 60459
  FROM _session253_roe12_lookup sv, _session253_roe12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-12-the-plot-uncovered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 2:21 — *In those days, while Mordecai sat in the king’s gate, two of the king’s chamberlains, Bigthan and Teresh, of those which kept the door, were wroth, and sought to lay hand on the king Ahasuerus.* The canonical book names the same two door-keepers whose plot Mordecai overhears in Rest of Esther 12:2.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-plot-uncovered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 2:23 — *And when inquisition was made of the matter, it was found out; therefore they were both hanged on a tree: and it was written in the book of the chronicles before the king.* The strangling and the chronicling of Rest of Esther 12:3-4 is this same examination and record set down in the Hebrew.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-plot-uncovered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Esther 6:2 — *And it was found written, that Mordecai had told of Bigthana and Teresh, two of the king’s chamberlains, the keepers of the door, who sought to lay hand on the king Ahasuerus.* The record Mordecai writes in Rest of Esther 12:4 is the very page read on the sleepless night that begins his deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-plot-uncovered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-12-watchman-of-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 24:11 — *If thou forbear to deliver them that are drawn unto death, and those that are ready to be slain;* Mordecai''s certifying of the king in Rest of Esther 12:2 is exactly the deliverance from death the proverb forbids the righteous to withhold.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-watchman-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:12 — *If thou sayest, Behold, we knew it not; doth not he that pondereth the heart consider it? and he that keepeth thy soul, doth not he know it? and shall not he render to every man according to his works?* The plot Mordecai searches out in Rest of Esther 12:2 cannot be feigned-ignorant, for the One who ponders the heart renders to each according to his works.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-watchman-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* The eunuchs'' devices in Rest of Esther 12:2 are the hidden voice that wings its way to the king''s ear through the watchman who heard.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-watchman-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-12-the-servant-rewarded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 6:11 — *Then took Haman the apparel and the horse, and arrayed Mordecai, and brought him on horseback through the street of the city, and proclaimed before him, Thus shall it be done unto the man whom the king delighteth to honour.* The reward promised in Rest of Esther 12:5 is paid by Haman''s own hand in the Hebrew, the enemy parading the man he hated.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-servant-rewarded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 10:3 — *For Mordecai the Yahudi (Jew) was next unto king Ahasuerus, and great among the Yahudim (Jews), and accepted of the multitude of his brethren, seeking the wealth of his people, and speaking peace to all his seed.* Mordecai''s service-and-reward in Rest of Esther 12:5 ripens into the second seat of the kingdom and peace for his whole people.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-the-servant-rewarded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-12-haman-the-agagite
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 3:6 — *And he thought scorn to lay hands on Mordecai alone; for they had shewed him the people of Mordecai: wherefore Haman sought to destroy all the Yahudim (Jews) that were throughout the whole kingdom of Ahasuerus, even the people of Mordecai.* The grudge that begins against Mordecai''s people in Rest of Esther 12:6 swells in the Hebrew into a decree to destroy the whole nation.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 15:2 — *Thus saith Yahuah Tseva''ot (LORD of hosts), I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt.* Haman the Agagite of Rest of Esther 12:6 is the line of Agag king of Amalek, carrying forward the ancient enmity Yahuah remembers.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt;* the Agagite''s grudge in Rest of Esther 12:6 is the standing Torah-charge against Amalek breaking out again in Persia.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 17:14 — *And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven.* The seed-war Haman renews in Rest of Esther 12:6 is the very Amalek whose remembrance Yahuah swore to blot out.'
  FROM cross_reference_threads t, cross_references x, _session253_roe12_lookup sv, _session253_roe12_lookup tv
 WHERE t.slug='rest-of-esther-12-haman-the-agagite'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

