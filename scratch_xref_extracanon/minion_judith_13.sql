-- ----- fragment: minion_judith_13.sql (session253 judith 13) -----
-- Source anchor: apocrypha/judith ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt13 (view _session253_jdt13_lookup). Sort band base 60300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-13-head-of-the-enemy-struck-off
  ('apocrypha', 'judith', 13, 7, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* As Jael struck the sleeping Sisera, so Judith approaches the wine-heavy Holofernes to do Yahuah''s deliverance by a woman''s hand.'),
  ('apocrypha', 'judith', 13, 8, 'canon', 'judges', 5, 26, 'free', E'Judges 5:26 — *She put her hand to the nail, and her right hand to the workmen''s hammer; and with the hammer she smote Sisera, she smote off his head, when she had pierced and stricken through his temples.* Deborah''s song already sings of a woman smiting off the oppressor''s head, the very stroke Judith makes twice upon Holofernes'' neck.'),
  ('apocrypha', 'judith', 13, 8, 'canon', '1-samuel', 17, 51, 'free', E'1 Samuel 17:51 — *Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith. And when the Philistines saw their champion was dead, they fled.* David cuts off Goliath''s head with the giant''s own sword as Judith takes Holofernes'' head with his own fauchion — the enemy undone by his own weapon.'),
  -- thread: judith-13-the-proud-head-and-the-womans-seed
  ('apocrypha', 'judith', 13, 15, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s striking of the enemy''s head *by the hand of a woman* sounds the first promise that the serpent''s head is bruised through the woman.'),
  ('apocrypha', 'judith', 13, 15, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The tyrant''s head struck off in Judith foreshadows the final crushing of the adversary under the feet of Yahuah''s people.'),
  -- thread: judith-13-blessed-above-women
  ('apocrypha', 'judith', 13, 18, 'canon', 'judges', 5, 24, 'free', E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Ozias'' word over Judith, *blessed art you... above all the women upon the earth*, repeats verbatim the blessing already spoken over Jael the deliverer.'),
  ('apocrypha', 'judith', 13, 18, 'canon', 'luke', 1, 42, 'free', E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* The same benediction over Judith is heard again over Miriam (Mary), gathering the deliverer-women into one blessed line.'),
  -- thread: judith-13-the-weak-confound-the-mighty
  ('apocrypha', 'judith', 13, 14, 'canon', 'psalms', 44, 3, 'free', E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Judith disclaims her own strength, naming Yahuah who destroyed the enemy by her hand, exactly as the psalm credits not Israel''s sword but Yahuah''s right hand.'),
  ('apocrypha', 'judith', 13, 15, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* That Yahuah struck the great captain *by the hand of a woman* is the very pattern Paul names — the weak chosen to confound the mighty.'),
  -- thread: judith-13-strengthen-me-this-day
  ('apocrypha', 'judith', 13, 7, 'canon', '1-samuel', 17, 45, 'free', E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* Judith''s plea, *Strengthen me, O Yahuah... this day*, leans on the same name of Yahuah of hosts in which David met Goliath.'),
  ('apocrypha', 'judith', 13, 4, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Judith asks Yahuah of all power to look on *the works of my hands*, owning as David did that the battle and the deliverance belong to Yahuah, not the weapon.'),
  -- thread: judith-13-they-worshipped-and-praised
  ('apocrypha', 'judith', 13, 17, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* As Israel sang to Yahuah at the overthrow of Pharaoh, so the people worship Yahuah who has brought the enemies of His people to nought.'),
  ('apocrypha', 'judith', 13, 17, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the people praise — the mighty captain cast down and the lowly widow exalted as Yahuah''s instrument.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-head-of-the-enemy-struck-off',
       E'The head of the enemy struck off by a woman''s hand',
       E'Judith stands over the drunken tyrant and prays, *And approached to his bed, and took hold of the hair of his head, and said, Strengthen me, O Yahuah (God) of Yashar''el (Israel), this day* (Judith 13:7), *And she struck twice upon his neck with all her might, and she took away his head from him* (Judith 13:8). The deed is not new. When Sisera oppressed Israel, *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died* (Judges 4:21); and the song says she *smote off his head, when she had pierced and stricken through his temples* (Judges 5:26). So too the shepherd-boy over the giant: *Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith* (1 Samuel 17:51). The proud captain is felled by his own fauchion as the giant was felled by his own sword — the enemy''s strength turned against his own head.',
       sv.verse_id, ev.verse_id, 'extras', 60300
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-the-proud-head-and-the-womans-seed',
       E'The proud head crushed and the seed of the woman',
       E'Judith shows the trophy to the city: *So she took the head out of the bag, and shewed it, and said to them, behold the head of Holofernes, the chief captain of the army of Assur, and behold the canopy, in which he did lie in his drunkenness; and Yahuah (God) has struck him by the hand of a woman* (Judith 13:15). The pattern was set at the gate of Eden, where Yahuah told the serpent, *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The head of the enemy is the appointed place of the blow, and it is *by the hand of a woman* that the proud head falls. The apostle carries the same promise forward: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20) — every striking-down of the tyrant is an echo of the one promised bruising of the serpent''s head.',
       sv.verse_id, ev.verse_id, 'extras', 60303
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-blessed-above-women',
       E'Blessed art thou above all the women upon the earth',
       E'Ozias meets Judith at the gate: *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies* (Judith 13:18). This blessing is itself a quotation. Of Jael the song sang, *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent* (Judges 5:24). And the Spirit puts the same words on Elisabeth''s lips at the visitation: *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb* (Luke 1:42). The deliverer-woman, blessed above women, stands in a single line from Jael to Judith to the mother of the promised Seed.',
       sv.verse_id, ev.verse_id, 'extras', 60306
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-the-weak-confound-the-mighty',
       E'Yahuah strikes the mighty by the hand of the weak',
       E'Judith confesses where the victory came from: *Then she said to them with a loud voice, Praise, praise Yahuah (God), praise Yahuah (God), I say, for he has not taken away his mercy from the house of Yashar''el (Israel), but has destroyed our enemies by my hands this night* (Judith 13:14); the deed is *by the hand of a woman* (Judith 13:15). This is Yahuah''s settled way — He does not save by the strong arm of man but confounds the mighty by the weak. *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them* (Psalm 44:3). The apostle names the principle: *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27). The kingdom-of-man captain, demanding the world bow to Nebuchadnezzar, is dismantled by a lone widow''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 60309
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-strengthen-me-this-day',
       E'Strengthen me, O Yahuah, this day',
       E'Before the stroke Judith prays, *O Yahuah (God) of all power, look at this present upon the works of my hands for the exaltation of Jerusalem* (Judith 13:4), and at the bed, *Strengthen me, O Yahuah (God) of Yashar''el (Israel), this day* (Judith 13:7). The deliverer''s strength is borrowed, not native. So David answered the giant: *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied* (1 Samuel 17:45), *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). The hand that strikes is a woman''s, but the power is Yahuah of hosts''.',
       sv.verse_id, ev.verse_id, 'extras', 60312
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-13-they-worshipped-and-praised',
       E'All the people worshipped Yahuah who brought the proud to nought',
       E'When the head is shown, the city falls down in worship: *Then all the people were wonderfully astonished, and bowed themselves and worshipped Yahuah (God), and said with one accord, Blessed be you, O our Elohim (God), which have this day brought to nought the enemies of your people* (Judith 13:17). This is Israel''s ancient response to deliverance from the kingdom-of-man tyrant. After the sea, *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1). And Miriam''s song over the proud says, *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The drunken captain who would have all the earth worship Nebuchadnezzar is brought to nought, and the worship is given to Yahuah alone.',
       sv.verse_id, ev.verse_id, 'extras', 60315
  FROM _session253_jdt13_lookup sv, _session253_jdt13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-13-head-of-the-enemy-struck-off
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* As Jael struck the sleeping Sisera, so Judith approaches the wine-heavy Holofernes to do Yahuah''s deliverance by a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-head-of-the-enemy-struck-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 5:26 — *She put her hand to the nail, and her right hand to the workmen''s hammer; and with the hammer she smote Sisera, she smote off his head, when she had pierced and stricken through his temples.* Deborah''s song already sings of a woman smiting off the oppressor''s head, the very stroke Judith makes twice upon Holofernes'' neck.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-head-of-the-enemy-struck-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 17:51 — *Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith. And when the Philistines saw their champion was dead, they fled.* David cuts off Goliath''s head with the giant''s own sword as Judith takes Holofernes'' head with his own fauchion — the enemy undone by his own weapon.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-head-of-the-enemy-struck-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-the-proud-head-and-the-womans-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s striking of the enemy''s head *by the hand of a woman* sounds the first promise that the serpent''s head is bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-proud-head-and-the-womans-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The tyrant''s head struck off in Judith foreshadows the final crushing of the adversary under the feet of Yahuah''s people.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-proud-head-and-the-womans-seed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-blessed-above-women
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Ozias'' word over Judith, *blessed art you... above all the women upon the earth*, repeats verbatim the blessing already spoken over Jael the deliverer.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-blessed-above-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* The same benediction over Judith is heard again over Miriam (Mary), gathering the deliverer-women into one blessed line.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-blessed-above-women'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-the-weak-confound-the-mighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 44:3 — *For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them.* Judith disclaims her own strength, naming Yahuah who destroyed the enemy by her hand, exactly as the psalm credits not Israel''s sword but Yahuah''s right hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty.* That Yahuah struck the great captain *by the hand of a woman* is the very pattern Paul names — the weak chosen to confound the mighty.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-strengthen-me-this-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 17:45 — *Then said David to the Philistine, Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied.* Judith''s plea, *Strengthen me, O Yahuah... this day*, leans on the same name of Yahuah of hosts in which David met Goliath.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-strengthen-me-this-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Judith asks Yahuah of all power to look on *the works of my hands*, owning as David did that the battle and the deliverance belong to Yahuah, not the weapon.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-strengthen-me-this-day'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-13-they-worshipped-and-praised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* As Israel sang to Yahuah at the overthrow of Pharaoh, so the people worship Yahuah who has brought the enemies of His people to nought.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-they-worshipped-and-praised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the people praise — the mighty captain cast down and the lowly widow exalted as Yahuah''s instrument.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt13_lookup sv, _session253_jdt13_lookup tv
 WHERE t.slug='judith-13-they-worshipped-and-praised'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

