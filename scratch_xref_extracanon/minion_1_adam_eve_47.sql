-- ----- fragment: minion_1adameve_47.sql (session253 1-adam-eve 47) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae47 (view _session253_1ae47_lookup). Sort band base 65150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-47-fear-of-death-and-the-promise
  ('adam-eve-conflict', '1-adam-eve', 47, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The "promise" Adam begs Elohim to fulfil is this seed-word, the only deliverance from the Satan he fears in 1 Adam and Eve 47:2.'),
  ('adam-eve-conflict', '1-adam-eve', 47, 2, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Paul traces the very death Adam dreads in 1 Adam and Eve 47:2 back to the one man''s fall outside whose cave this scene is set.'),
  ('adam-eve-conflict', '1-adam-eve', 47, 2, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* This is the answer to Adam''s "unless Elohim come" in 1 Adam and Eve 47:2 — the promised coming made flesh in due time.'),
  ('adam-eve-conflict', '1-adam-eve', 47, 2, 'canon', 'hebrews', 2, 14, 'free', E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* The deliverance Adam awaits in 1 Adam and Eve 47:2 is the breaking of the death-power he fears Satan will wield over his soul.'),
  -- thread: 1-adam-eve-47-prayer-for-forgiveness
  ('adam-eve-conflict', '1-adam-eve', 47, 6, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s praying for forgiveness in 1 Adam and Eve 47:6 is the first keeping of this same calling-on-the-Name that runs down the holy seed-line.'),
  ('adam-eve-conflict', '1-adam-eve', 47, 6, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Adam''s plea for forgiven sin in 1 Adam and Eve 47:6 leans on the manifested Son who undoes the devil''s works.'),
  -- thread: 1-adam-eve-47-satans-envy-of-the-covenant
  ('adam-eve-conflict', '1-adam-eve', 47, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to kill Adam and cut off his descendants in 1 Adam and Eve 47:7-8 is the serpent striking at the seed of the woman, the war declared at the fall.'),
  ('adam-eve-conflict', '1-adam-eve', 47, 7, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Messiah names the very murderous beginning that 1 Adam and Eve 47:7 shows from within — "I will kill Adam."'),
  ('adam-eve-conflict', '1-adam-eve', 47, 8, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Satan''s design to leave no seed to inherit the kingdom (1 Adam and Eve 47:8) is first carried out through Cain, who murders the righteous brother.'),
  ('adam-eve-conflict', '1-adam-eve', 47, 7, 'canon', 'ezekiel', 28, 15, 'free', E'Ezekiel 28:15 — *Thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee.* Satan''s grievance over "the kingdom in which I once was" in 1 Adam and Eve 47:7 echoes this fall of the once-perfect anointed one.'),
  ('adam-eve-conflict', '1-adam-eve', 47, 7, 'enoch', '1-enoch', 69, 10, 'extras', E'1 Enoch 69:10 — *And the third was named Gâdreêl: he it is who showed the children of men all the blows of death, and he led astray Eve, and showed [the weapons of death to the sons of men] the shield and the coat of mail, and the sword for battle, and all the weapons of death to the children of men.* The same envy that now plots Adam''s death in 1 Adam and Eve 47:7 first led Eve astray and brought the blows of death into the world.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-47-fear-of-death-and-the-promise',
       E'The fire, the fear of death, and the longing for the promise',
       E'Scorched by the fire, Adam stares past this world into the next and cries for the only deliverance there is — that Elohim should come and keep His word: *"Look, the fire has burnt our flesh in this world; but how will it be when we are dead, and Satan shall punish our souls? Is not our deliverance long and far off, unless Elohim (God) come, and in mercy to us fulfil His promise?"* (1 Adam and Eve 47:2). It ain''t new: the dread of death and the hope hung on a single Promise is the spine of the whole Book. The promise Adam clings to is the seed-promise spoken over the serpent the day they fell — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). Death is the reign Adam fears, and Paul names how it came and how it ends — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* (Romans 5:12). And the "unless Elohim come" is answered in the fulness of time — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* (Galatians 4:4) — the very One who came to break the power Adam dreads — *that through death he might destroy him that had the power of death, that is, the devil;* (Hebrews 2:14).',
       sv.verse_id, ev.verse_id, 'extras', 65150
  FROM _session253_1ae47_lookup sv, _session253_1ae47_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=47 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-47-prayer-for-forgiveness',
       E'Calling on Elohim under the mountain — the way kept before Sinai',
       E'Driven from the cave by the fire, Adam and Eve go to their accustomed place and do what the holy seed does — they pray: *And they stood and prayed Elohim (God) to forgive them their sins, and then fell asleep under the summit of the mountain.* (1 Adam and Eve 47:6). The repentant calling on the Name is the Torah-way kept long before Sinai; it begins in Seth''s line in the very next generation — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). It is mercy, not law-as-curse — the confidence that Elohim hears the contrite and pardons sin — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65153
  FROM _session253_1ae47_lookup sv, _session253_1ae47_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=47 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-47-satans-envy-of-the-covenant',
       E'Satan''s murderous envy — no covenant for him, so he plots to kill the seed',
       E'Now the chapter shows the seed-war from inside the enemy''s heart. Because Adam has a covenant of salvation and a kingdom-inheritance, and Satan has none, the hater of all good resolves on murder to empty the earth of the seed: *"Whereas Elohim (God) has promised salvation to Adam by covenant... but has not promised me by covenant... no, since He has promised him that He should make him and his descendants live in the kingdom in which I once was--I will kill Adam."* (1 Adam and Eve 47:7), *"so that when he is dead he may not have any descendants left to inherit the kingdom..."* (1 Adam and Eve 47:8). It ain''t new: this is the serpent striking at her seed — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) — and Messiah unmasks the murderer at the root — *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* (John 8:44). The first man to do the devil''s bidding is the firstborn son, who slays the holy seed — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* (Genesis 4:8). And the phrase "the kingdom in which I once was" names the fallen one''s lost estate — *Thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee.* (Ezekiel 28:15) — the same envy that struck Eve in the garden — *And the third was named Gâdreêl: he it is who showed the children of men all the blows of death, and he led astray Eve...* (1 Enoch 69:10).',
       sv.verse_id, ev.verse_id, 'extras', 65156
  FROM _session253_1ae47_lookup sv, _session253_1ae47_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=47 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-47-fear-of-death-and-the-promise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The "promise" Adam begs Elohim to fulfil is this seed-word, the only deliverance from the Satan he fears in 1 Adam and Eve 47:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-fear-of-death-and-the-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Paul traces the very death Adam dreads in 1 Adam and Eve 47:2 back to the one man''s fall outside whose cave this scene is set.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-fear-of-death-and-the-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* This is the answer to Adam''s "unless Elohim come" in 1 Adam and Eve 47:2 — the promised coming made flesh in due time.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-fear-of-death-and-the-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* The deliverance Adam awaits in 1 Adam and Eve 47:2 is the breaking of the death-power he fears Satan will wield over his soul.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-fear-of-death-and-the-promise'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-47-prayer-for-forgiveness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s praying for forgiveness in 1 Adam and Eve 47:6 is the first keeping of this same calling-on-the-Name that runs down the holy seed-line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-prayer-for-forgiveness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Adam''s plea for forgiven sin in 1 Adam and Eve 47:6 leans on the manifested Son who undoes the devil''s works.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-prayer-for-forgiveness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-47-satans-envy-of-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to kill Adam and cut off his descendants in 1 Adam and Eve 47:7-8 is the serpent striking at the seed of the woman, the war declared at the fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-satans-envy-of-the-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Messiah names the very murderous beginning that 1 Adam and Eve 47:7 shows from within — "I will kill Adam."'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-satans-envy-of-the-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Satan''s design to leave no seed to inherit the kingdom (1 Adam and Eve 47:8) is first carried out through Cain, who murders the righteous brother.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-satans-envy-of-the-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 28:15 — *Thou wast perfect in thy ways from the day that thou wast created, till iniquity was found in thee.* Satan''s grievance over "the kingdom in which I once was" in 1 Adam and Eve 47:7 echoes this fall of the once-perfect anointed one.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-satans-envy-of-the-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 69:10 — *And the third was named Gâdreêl: he it is who showed the children of men all the blows of death, and he led astray Eve, and showed [the weapons of death to the sons of men] the shield and the coat of mail, and the sword for battle, and all the weapons of death to the children of men.* The same envy that now plots Adam''s death in 1 Adam and Eve 47:7 first led Eve astray and brought the blows of death into the world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae47_lookup sv, _session253_1ae47_lookup tv
 WHERE t.slug='1-adam-eve-47-satans-envy-of-the-covenant'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=47 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=69 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

