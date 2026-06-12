-- ----- fragment: minion_judith_15.sql (session253 judith 15) -----
-- Source anchor: apocrypha/judith ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt15 (view _session253_jdt15_lookup). Sort band base 60350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-15-the-enemy-flees
  ('apocrypha', 'judith', 15, 2, 'canon', 'exodus', 15, 16, 'free', E'Exodus 15:16 — *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD), till the people pass over, which thou hast purchased.* The same supernatural dread that paralyzed Egypt and Canaan now scatters Assur, so that no man durst abide in his neighbour''s sight (Judith 15:2).'),
  ('apocrypha', 'judith', 15, 1, 'canon', 'exodus', 14, 13, 'free', E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The astonishment in the tents is Israel beholding a salvation it did not fight for, the enemy seen no more (Judith 15:1).'),
  -- thread: judith-15-israel-pursues-and-spoils
  ('apocrypha', 'judith', 15, 7, 'canon', 'exodus', 15, 9, 'free', E'Exodus 15:9 — *The enemy said, I will pursue, I will overtake, I will divide the spoil; my lust shall be satisfied upon them; I will draw my sword, my hand shall destroy them.* The tyrant who meant to spoil Israel is spoiled instead, the great multitude''s goods falling to the villages that had been besieged (Judith 15:7).'),
  ('apocrypha', 'judith', 15, 5, 'canon', 'judges', 4, 23, 'free', E'Judges 4:23 — *So Elohim (God) subdued on that day Jabin the king of Canaan before the children of Yashar''el (Israel).* As Yahuah subdued Canaan''s king after a woman drove the nail, so He breaks Assur before Israel after a woman takes the head (Judith 15:5).'),
  -- thread: judith-15-blessed-of-the-almighty
  ('apocrypha', 'judith', 15, 9, 'canon', 'luke', 1, 42, 'free', E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Elisabeth''s cry over Mary unfolds the elders'' acclamation of Judith as Jerusalem''s exaltation and Israel''s glory (Judith 15:9).'),
  ('apocrypha', 'judith', 15, 10, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the elders bless in Judith, the Almighty pleased to overthrow the mighty by a lowly hand (Judith 15:10).'),
  ('apocrypha', 'judith', 15, 10, 'apocrypha', 'judith', 13, 18, 'extras', E'Judith 13:18 — *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies.* The blessing first spoken in the gate is now ratified by priest and people, blessed of the Almighty for evermore (Judith 15:10).'),
  -- thread: judith-15-the-women-dance
  ('apocrypha', 'judith', 15, 13, 'canon', 'exodus', 15, 20, 'free', E'Exodus 15:20 — *And Miriam the prophetess, the sister of Aaron, took a timbrel in her hand; and all the women went out after her with timbrels and with dances.* As Miriam led the women in dance after the Sea, so Judith leads the women of Israel in the dance after Assur is broken (Judith 15:13).'),
  ('apocrypha', 'judith', 15, 12, 'canon', '1-samuel', 18, 6, 'free', E'1 Samuel 18:6 — *And it came to pass as they came, when David was returned from the slaughter of the Philistine, that the women came out of all cities of Yashar''el (Israel), singing and dancing, to meet king Saul, with tabrets, with joy, and with instruments of musick.* The women running together with dance to honor the one who slew the enemy''s champion is the same answering-song that hails Judith (Judith 15:12).'),
  -- thread: judith-15-by-the-hand-of-a-woman
  ('apocrypha', 'judith', 15, 10, 'canon', 'judges', 5, 24, 'free', E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Deborah''s song over Jael, who felled the captain by her hand, is the very pattern of Israel blessing Judith for what her hand wrought (Judith 15:10).'),
  ('apocrypha', 'judith', 15, 10, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The ancient enmity in which the head of the enemy is bruised through the woman echoes in Israel''s praise of a deliverance wrought by a woman''s hand (Judith 15:10).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-the-enemy-flees',
       E'Fear fell upon them, and they fled',
       E'When the head of the tyrant was lifted up, the kingdom-of-man collapsed without a battle: *And fear and trembling fell upon them, so that there was no man that durst abide in the sight of his neighbour, but rushing out all together, they fled into every way of the plain, and of the hill country* (Judith 15:2). The host of Assur that had demanded Nebuchadnezzar be worshipped as god melts the instant Yahuah strikes its head — the proud system dismantled by His hand, not Israel''s sword. It ain''t new: the same dread fell at the Sea, *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD)* (Exodus 15:16), and Israel was told only to *stand still, and see the salvation of Yahuah (LORD)* (Exodus 14:13). The weak confound the mighty; the deliverance is His.',
       sv.verse_id, ev.verse_id, 'extras', 60350
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-israel-pursues-and-spoils',
       E'Israel pursued, and the spoil was very great',
       E'Once the head was struck, every warrior poured out: *Then the children of Yashar''el (Israel), every one that was a warrior among them, rushed out upon them* (Judith 15:3), chasing them *with a great slaughter, until they were past Damascus* (Judith 15:5), and *the villages and the cities... got many spoils: for the multitude was very great* (Judith 15:7). The pattern is the rout at the Sea, where the boasting enemy who said *I will pursue, I will overtake, I will divide the spoil* (Exodus 15:9) is himself overthrown, and the plundered are made the plunderers — the proud put down, the low estate enriched.',
       sv.verse_id, ev.verse_id, 'extras', 60353
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-blessed-of-the-almighty',
       E'Blessed be thou of the Almighty for evermore',
       E'The high priest and the elders came down from Jerusalem to bless her: *blessed be you of the Almighty Yahuah (God) for evermore. And all the people said, So be it* (Judith 15:10), naming her *the exaltation of Jerusalem... the great glory of Yashar''el (Israel)* (Judith 15:9). It ain''t new — the elders only echo the blessing already spoken over her in the gate: *blessed art you of the most high Yahuah (God) above all the women upon the earth* (Judith 13:18). And the words reach forward to another lowly woman who carried the Deliverer, greeted *Blessed art thou among women, and blessed is the fruit of thy womb* (Luke 1:42), whose song magnifies the One who *hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). The woman blessed, the tyrant cast down.',
       sv.verse_id, ev.verse_id, 'extras', 60356
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-the-women-dance',
       E'The women ran together and made a dance',
       E'The victory becomes a song led by a woman: *Then all the women of Yashar''el (Israel) ran together to see her, and blessed her, and made a dance among them for her: and she took branches in her hand* (Judith 15:12), and she *went before all the people in the dance, leading all the women* (Judith 15:13). This is the oldest shape of Israel''s deliverance-praise. After the Sea, *Miriam the prophetess, the sister of Aaron, took a timbrel in her hand; and all the women went out after her with timbrels and with dances* (Exodus 15:20); after the slaughter of the Philistine, *the women came out of all cities of Yashar''el (Israel), singing and dancing, to meet king Saul, with tabrets, with joy* (1 Samuel 18:6). The hand of Yahuah delivered, and the daughters of Israel sing it.',
       sv.verse_id, ev.verse_id, 'extras', 60359
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-15-by-the-hand-of-a-woman',
       E'Thou hast done all these things by thine hand',
       E'The elders trace the whole deliverance to a single hand: *You have done all these things by yours hand: you have done much good to Yashar''el (Israel), and Yahuah (God) is pleased with it* (Judith 15:10). Yet it is Yahuah''s hand that worked through hers, the weak confounding the mighty. It ain''t new: another woman in a tent took *a nail of the tent, and... an hammer in her hand* and smote the captain (Judges 4:21), so that the song could declare her *Blessed above women shall Jael the wife of Heber the Kenite be* (Judges 5:24). From Eden the promise stood that the bruising of the serpent''s head would come *between thy seed and her seed; it shall bruise thy head* (Genesis 3:15) — the woman''s hand against the head of the enemy, honestly foreshadowing, never replacing, the Seed Himself.',
       sv.verse_id, ev.verse_id, 'extras', 60362
  FROM _session253_jdt15_lookup sv, _session253_jdt15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=15 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-15-the-enemy-flees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:16 — *Fear and dread shall fall upon them; by the greatness of thine arm they shall be as still as a stone; till thy people pass over, O Yahuah (LORD), till the people pass over, which thou hast purchased.* The same supernatural dread that paralyzed Egypt and Canaan now scatters Assur, so that no man durst abide in his neighbour''s sight (Judith 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-enemy-flees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:13 — *And Moses said unto the people, Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever.* The astonishment in the tents is Israel beholding a salvation it did not fight for, the enemy seen no more (Judith 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-enemy-flees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-israel-pursues-and-spoils
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:9 — *The enemy said, I will pursue, I will overtake, I will divide the spoil; my lust shall be satisfied upon them; I will draw my sword, my hand shall destroy them.* The tyrant who meant to spoil Israel is spoiled instead, the great multitude''s goods falling to the villages that had been besieged (Judith 15:7).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-israel-pursues-and-spoils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:23 — *So Elohim (God) subdued on that day Jabin the king of Canaan before the children of Yashar''el (Israel).* As Yahuah subdued Canaan''s king after a woman drove the nail, so He breaks Assur before Israel after a woman takes the head (Judith 15:5).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-israel-pursues-and-spoils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-blessed-of-the-almighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:42 — *And she spake out with a loud voice, and said, Blessed art thou among women, and blessed is the fruit of thy womb.* Elisabeth''s cry over Mary unfolds the elders'' acclamation of Judith as Jerusalem''s exaltation and Israel''s glory (Judith 15:9).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-blessed-of-the-almighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* The Magnificat names the very reversal the elders bless in Judith, the Almighty pleased to overthrow the mighty by a lowly hand (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-blessed-of-the-almighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 13:18 — *Then said Ozias to her, O daughter, blessed art you of the most high Yahuah (God) above all the women upon the earth; and blessed be Yahuah (God), which has created the heavens and the earth, which has directed you to the cutting off of the head of the chief of our enemies.* The blessing first spoken in the gate is now ratified by priest and people, blessed of the Almighty for evermore (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-blessed-of-the-almighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-the-women-dance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:20 — *And Miriam the prophetess, the sister of Aaron, took a timbrel in her hand; and all the women went out after her with timbrels and with dances.* As Miriam led the women in dance after the Sea, so Judith leads the women of Israel in the dance after Assur is broken (Judith 15:13).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-women-dance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 18:6 — *And it came to pass as they came, when David was returned from the slaughter of the Philistine, that the women came out of all cities of Yashar''el (Israel), singing and dancing, to meet king Saul, with tabrets, with joy, and with instruments of musick.* The women running together with dance to honor the one who slew the enemy''s champion is the same answering-song that hails Judith (Judith 15:12).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-the-women-dance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-15-by-the-hand-of-a-woman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 5:24 — *Blessed above women shall Jael the wife of Heber the Kenite be, blessed shall she be above women in the tent.* Deborah''s song over Jael, who felled the captain by her hand, is the very pattern of Israel blessing Judith for what her hand wrought (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-by-the-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The ancient enmity in which the head of the enemy is bruised through the woman echoes in Israel''s praise of a deliverance wrought by a woman''s hand (Judith 15:10).'
  FROM cross_reference_threads t, cross_references x, _session253_jdt15_lookup sv, _session253_jdt15_lookup tv
 WHERE t.slug='judith-15-by-the-hand-of-a-woman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

