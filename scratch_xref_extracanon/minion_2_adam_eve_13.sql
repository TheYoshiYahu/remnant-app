-- ----- fragment: minion_2adameve_13.sql (session253 2-adam-eve 13) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae13 (view _session253_2ae13_lookup). Sort band base 66300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-13-cain-of-the-wicked-one
  ('adam-eve-conflict', '2-adam-eve', 13, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The blind Lamech is reckoned of the sons of Cain, the seed of the wicked one whose mark is murder, exactly as 2 Adam & Eve 13:1 frames his whole house.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The valley of robbery, murder and sin in 2 Adam & Eve 13:2 is the serpent''s seed living out the enmity Yahuah pronounced at the gate of Eden.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 1, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Scripture names "the way of Cain" a path of woe, and 2 Adam & Eve 13:1 sets Lamech the blind squarely on it as one of the sons of Cain.'),
  -- thread: 2-adam-eve-13-cain-the-fugitive-slain
  ('adam-eve-conflict', '2-adam-eve', 13, 5, 'canon', 'genesis', 4, 12, 'free', E'Genesis 4:12 — *When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth.* Cain''s restless wandering with trembling and terror in 2 Adam & Eve 13:5 is precisely the fugitive-and-vagabond curse Yahuah laid on him over Abel''s blood.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'canon', 'genesis', 4, 14, 'free', E'Genesis 4:14 — *Behold, thou hast driven me out this day from the face of the earth; and from thy face shall I be hid; and I shall be a fugitive and a vagabond in the earth; and it shall come to pass, that every one that findeth me shall slay me.* Cain''s own dread that whoever found him would slay him is fulfilled when Lamech''s stone fells him in 2 Adam & Eve 13:11.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'jubilees', 'jubilees', 4, 31, 'extras', E'Jubilees 4:31 — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* The restored libraries share one memory: Cain dies by a stone, the same instrument he used on Abel, matching the stone that fells him in 2 Adam & Eve 13:11.'),
  -- thread: 2-adam-eve-13-blood-required-stone-for-stone
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man’s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The stone that fells Cain in 2 Adam & Eve 13:11 enacts the blood-for-blood ordinance Yahuah set over all flesh.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'canon', 'numbers', 35, 17, 'free', E'Numbers 35:17 — *And if he smite him with throwing a stone, wherewith he may die, and he die, he is a murderer: the murderer shall surely be put to death.* The Torah names the very weapon — a thrown stone — that kills Cain in 2 Adam & Eve 13:11 as the mark of a murderer worthy of death.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 11, 'jubilees', 'jubilees', 4, 32, 'extras', E'Jubilees 4:32 — *With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him.* The heavenly-tables law of like-for-like is exactly what the stone in 2 Adam & Eve 13:11 carries out upon Cain.'),
  -- thread: 2-adam-eve-13-lamech-two-slain-perish-by-sword
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'genesis', 4, 23, 'free', E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Lamech''s two killings — Cain the man and the young shepherd — in 2 Adam & Eve 13:11-13 are the very "man" and "young man" his own ancient song confesses.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'genesis', 4, 24, 'free', E'Genesis 4:24 — *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold.* The escalating bloodguilt of Cain''s house, swelling sevenfold to seventy-sevenfold, is the spirit of the double slaying Lamech commits in 2 Adam & Eve 13:13.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'numbers', 35, 19, 'free', E'Numbers 35:19 — *The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him.* The Torah''s avenger of blood stands against the very kind of slaying Lamech works upon the young shepherd in 2 Adam & Eve 13:13.'),
  ('adam-eve-conflict', '2-adam-eve', 13, 13, 'canon', 'matthew', 26, 52, 'free', E'Matthew 26:52 — *Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* The Messiah''s word on those who live by violence reads the doom of Lamech''s stone-wielding hands in 2 Adam & Eve 13:13.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-cain-of-the-wicked-one',
       E'The line of Cain, sons of the wicked one',
       E'The scene opens deep in the cursed seed-line: *IN those days lived Lamech the blind, who was of the sons of Cain* (2 Adam & Eve 13:1), a valley of cattle and bloodshed where *among the children of Cain, there was much robbery, murder and sin* (2 Adam & Eve 13:2). This is the other seed shown from its root. Yochanan names it plainly: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous* (1 John 3:12) — the murder bred in the father is bred in the sons. The fountainhead is in the garden-word itself, the enmity sown between two seeds: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new — the seed-war was running in Lamech''s valley before ever Sinai. And the way of Cain is named a curse to walk in: *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core* (Jude 1:11).',
       sv.verse_id, ev.verse_id, 'extras', 66300
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-cain-the-fugitive-slain',
       E'Cain the cursed fugitive, found and felled',
       E'Here the curse pronounced in the field comes home. From the day of Abel''s blood, *Cain, ever since Elohim (God) had cast him off, and had cursed him with trembling and terror, could neither settle nor find rest in any one place; but wandered from place to place* (2 Adam & Eve 13:5) — until a stone from Lamech''s sling finds him: *And Lamech struck him with a stone from his sling, that fell upon his face, and knocked out both his eyes; then Cain fell at once and died* (2 Adam & Eve 13:11). This is the very sentence Genesis records over Cain: *a fugitive and a vagabond shalt thou be in the earth* (Genesis 4:12), and his own dread, *every one that findeth me shall slay me* (Genesis 4:14). The book of Jubilees keeps the same memory and reads the manner of his death as measured judgment: *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment* (Jubilees 4:31). Stone for stone — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 66303
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-blood-required-stone-for-stone',
       E'Blood for blood: the measure a man metes',
       E'Lamech''s stone is no accident in the larger reckoning — it is the measure Cain meted returning on his own head: *Then Lamech shot at Cain with his arrow and hit him in his side. And Lamech struck him with a stone from his sling, that fell upon his face, and knocked out both his eyes; then Cain fell at once and died* (2 Adam & Eve 13:11). Yahuah set this standard for the sons of Noah: *Whoso sheddeth man’s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6), and made the stone itself a token of murder in the Torah given through Mosheh: *And if he smite him with throwing a stone, wherewith he may die, and he die, he is a murderer: the murderer shall surely be put to death* (Numbers 35:17). The heavenly tables in Jubilees pronounce the very law dramatized in this cave-and-valley episode: *With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him* (Jubilees 4:32). The seed-war runs, but Yahuah''s justice runs through it.',
       sv.verse_id, ev.verse_id, 'extras', 66306
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-13-lamech-two-slain-perish-by-sword',
       E'Lamech''s two slain, and the avenger of blood',
       E'In the bitterness of his deed Lamech strikes again and a second man falls: *Then was Lamech sorry for it, and from the bitterness of his regret, he clapped his hands together, and struck with his flat palm the head of the youth, who fell as if dead... so he took up a stone and smote him, and smashed his head until he died* (2 Adam & Eve 13:13). This is the man and the young man of Lamech''s own song in Genesis: *for I have slain a man to my wounding, and a young man to my hurt* (Genesis 4:23) — the violence of Cain multiplied in his line: *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold* (Genesis 4:24). The Torah sets the avenger of blood against such a deed: *The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him* (Numbers 35:19), and the Messiah seals the law of the violent: *for all they that take the sword shall perish with the sword* (Matthew 26:52). Sin breeds death down the seed of the serpent until the heel-bruised Seed treads it: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66309
  FROM _session253_2ae13_lookup sv, _session253_2ae13_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-13-cain-of-the-wicked-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* The blind Lamech is reckoned of the sons of Cain, the seed of the wicked one whose mark is murder, exactly as 2 Adam & Eve 13:1 frames his whole house.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-of-the-wicked-one'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The valley of robbery, murder and sin in 2 Adam & Eve 13:2 is the serpent''s seed living out the enmity Yahuah pronounced at the gate of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-of-the-wicked-one'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Scripture names "the way of Cain" a path of woe, and 2 Adam & Eve 13:1 sets Lamech the blind squarely on it as one of the sons of Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-of-the-wicked-one'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-13-cain-the-fugitive-slain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:12 — *When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth.* Cain''s restless wandering with trembling and terror in 2 Adam & Eve 13:5 is precisely the fugitive-and-vagabond curse Yahuah laid on him over Abel''s blood.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-the-fugitive-slain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:14 — *Behold, thou hast driven me out this day from the face of the earth; and from thy face shall I be hid; and I shall be a fugitive and a vagabond in the earth; and it shall come to pass, that every one that findeth me shall slay me.* Cain''s own dread that whoever found him would slay him is fulfilled when Lamech''s stone fells him in 2 Adam & Eve 13:11.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-the-fugitive-slain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:31 — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* The restored libraries share one memory: Cain dies by a stone, the same instrument he used on Abel, matching the stone that fells him in 2 Adam & Eve 13:11.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-cain-the-fugitive-slain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-13-blood-required-stone-for-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:6 — *Whoso sheddeth man’s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The stone that fells Cain in 2 Adam & Eve 13:11 enacts the blood-for-blood ordinance Yahuah set over all flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-blood-required-stone-for-stone'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 35:17 — *And if he smite him with throwing a stone, wherewith he may die, and he die, he is a murderer: the murderer shall surely be put to death.* The Torah names the very weapon — a thrown stone — that kills Cain in 2 Adam & Eve 13:11 as the mark of a murderer worthy of death.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-blood-required-stone-for-stone'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:32 — *With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him.* The heavenly-tables law of like-for-like is exactly what the stone in 2 Adam & Eve 13:11 carries out upon Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-blood-required-stone-for-stone'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-13-lamech-two-slain-perish-by-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Lamech''s two killings — Cain the man and the young shepherd — in 2 Adam & Eve 13:11-13 are the very "man" and "young man" his own ancient song confesses.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:24 — *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold.* The escalating bloodguilt of Cain''s house, swelling sevenfold to seventy-sevenfold, is the spirit of the double slaying Lamech commits in 2 Adam & Eve 13:13.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 35:19 — *The revenger of blood himself shall slay the murderer: when he meeteth him, he shall slay him.* The Torah''s avenger of blood stands against the very kind of slaying Lamech works upon the young shepherd in 2 Adam & Eve 13:13.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 26:52 — *Then said Yahusha (Jesus) unto him, Put up again thy sword into his place: for all they that take the sword shall perish with the sword.* The Messiah''s word on those who live by violence reads the doom of Lamech''s stone-wielding hands in 2 Adam & Eve 13:13.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae13_lookup sv, _session253_2ae13_lookup tv
 WHERE t.slug='2-adam-eve-13-lamech-two-slain-perish-by-sword'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

