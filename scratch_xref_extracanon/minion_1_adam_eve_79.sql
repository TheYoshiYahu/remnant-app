-- ----- fragment: minion_1adameve_79.sql (session253 1-adam-eve 79) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch79. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae79 (view _session253_1ae79_lookup). Sort band base 65950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae79_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-79-cain-slays-righteous-abel
  ('adam-eve-conflict', '1-adam-eve', 79, 7, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* The Torah''s bare record of the murder that 1 Adam & Eve 79:5-7 retells in full, blow by blow, with the stone.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 7, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John names the seed behind the staff of 1 Adam & Eve 79:7 — Cain was of the wicked one, the serpent striking at the righteous seed.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 7, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The same murder dated in the older witness, naming the rejected offering that drove Cain''s hand in 1 Adam & Eve 79:7.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 7, 'jasher', 'jasher', 1, 25, 'extras', E'Jasher 1:25 — *And Cain hastened and rose up, and took the iron part of his ploughing instrument, with which he suddenly smote his brother and he slew him, and Cain spilt the blood of his brother Abel upon the earth...* Jasher keeps the weapon and the spilt blood that 1 Adam & Eve 79:7 shows oozing before Cain.'),
  -- thread: 1-adam-eve-79-blood-cries-from-the-ground
  ('adam-eve-conflict', '1-adam-eve', 79, 10, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The Torah''s word for the crying blood that 1 Adam & Eve 79:10 says cried mysteriously to Elohim to avenge the murder.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 10, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Yahusha names Abel''s blood as the head of all the martyred righteous, the crying of 1 Adam & Eve 79:10 reaching to His own generation.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 10, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The souls under the altar take up Abel''s same plea for vengeance heard in 1 Adam & Eve 79:10 — the righteous seed still crying.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 9, 'jubilees', 'jubilees', 4, 3, 'extras', E'Jubilees 4:3 — *And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him.* The older witness keeps the crying blood that 1 Adam & Eve 79:9 shows the trembling earth refusing to swallow.'),
  -- thread: 1-adam-eve-79-where-is-thy-brother
  ('adam-eve-conflict', '1-adam-eve', 79, 17, 'canon', 'genesis', 4, 9, 'free', E'Genesis 4:9 — *And Yahuah (LORD) said unto Cain, Where is Abel thy brother? And he said, I know not: Am I my brother’s keeper?* The Torah''s exact exchange that 1 Adam & Eve 79:16-17 expands, the proud keeper''s answer unchanged.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 16, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Yahuah who comes from heaven to Cain in 1 Adam & Eve 79:16 is the same Logos who was in the beginning, by whom all things were made.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 16, 'jubilees', 'jubilees', 4, 4, 'extras', E'Jubilees 4:4 — *And Yahuah (God) reproved Cain because of Abel, because he had slain him, and he made him a fugitive on the earth because of the blood of his brother, and he cursed him upon the earth...* The older witness''s reproof matching the Word''s coming to question Cain in 1 Adam & Eve 79:16.'),
  -- thread: 1-adam-eve-79-mercy-curse-and-sevenfold
  ('adam-eve-conflict', '1-adam-eve', 79, 26, 'canon', 'genesis', 4, 15, 'free', E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* The Torah''s sevenfold word and protecting mark that 1 Adam & Eve 79:26 reads as Yahuah''s mercy holding back the sword to call Cain to repentance.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 22, 'canon', 'genesis', 4, 11, 'free', E'Genesis 4:11 — *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother’s blood from thy hand;* the curse on the ground that 1 Adam & Eve 79:22 hears as mercy — Elohim cursing the soil, not the murderer himself.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 18, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The cursed and trembling Cain of 1 Adam & Eve 79:18 becomes the New Testament''s name for the way of the apostate seed.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 26, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Behind Cain''s restraint in 1 Adam & Eve 79:26 stands the seed-promise of Genesis 3:15 — the serpent who struck through Cain will himself be crushed.'),
  -- thread: 1-adam-eve-79-abel-righteous-witness
  ('adam-eve-conflict', '1-adam-eve', 79, 14, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The witness the ground preserves in 1 Adam & Eve 79:14 is the very witness of faith that the New Testament says yet speaks though Abel is dead.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 14, 'canon', '1-john', 3, 10, 'free', E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* John sets the two brothers as the two seed-lines, the righteous-and-good Abel of 1 Adam & Eve 79:14 against the children of the devil.'),
  ('adam-eve-conflict', '1-adam-eve', 79, 14, 'jasher', 'jasher', 1, 22, 'extras', E'Jasher 1:22 — *And Abel answered Cain, saying, Surely Elohim who has made us in the earth, he will avenge my cause, and he will require my blood from you should you slay me, for Yahuah (the Lord) is the judge and arbiter...* Jasher gives righteous Abel''s own confession of the avenging Judge, the same righteousness for which the ground would not receive him in 1 Adam & Eve 79:14.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae79_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae79_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-79-cain-slays-righteous-abel',
       E'Cain Slays Righteous Abel — the First Striking at the Seed',
       E'Cain lures his brother to a lonely place and beats him down: *"Then Cain, the hard-hearted, and cruel murderer, took a large stone, and beat his brother''s head with it, until his brains oozed out, and he wallowed in his blood, before him."* (1 Adam & Eve 79:7). This is the seed-war shown on the very first day outside the garden — the serpent striking through one brother at the other. Genesis names the deed without the cave-narrative detail: *"And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him."* (Genesis 4:8). It ain''t new — the same scene stands in the older witnesses: *"And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain."* (Jubilees 4:2); and Jasher keeps the very instrument: *"And Cain hastened and rose up, and took the iron part of his ploughing instrument, with which he suddenly smote his brother and he slew him..."* (Jasher 1:25). John tells us whose seed Cain carried: *"Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous."* (1 John 3:12).',
       sv.verse_id, ev.verse_id, 'extras', 65950
  FROM _session253_1ae79_lookup sv, _session253_1ae79_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=79 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-79-blood-cries-from-the-ground',
       E'The Blood of Righteous Abel Cries from the Ground',
       E'The earth itself recoils at the murder: *"But the earth, when the blood of righteous Abel fell on it, trembled, as it drank his blood, and would have destroyed Cain because of it."* (1 Adam & Eve 79:9), and the blood *"cried mysteriously to Elohim (God), to avenge him of his murderer."* (1 Adam & Eve 79:10). Genesis records the same crying voice: *"And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground."* (Genesis 4:10); Jubilees too: *"And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him."* (Jubilees 4:3). The New Testament gathers Abel''s blood as the first of all the martyred righteous — the suffering seed crying out across the ages: *"That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel..."* (Matthew 23:35); and under the altar that same cry still rises: *"And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?"* (Revelation 6:10). Yet there is a better blood that answers Abel''s: *"And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel."* (Hebrews 12:24).',
       sv.verse_id, ev.verse_id, 'extras', 65953
  FROM _session253_1ae79_lookup sv, _session253_1ae79_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=79 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-79-where-is-thy-brother',
       E'The Word of Yahuah: Where Is Abel Thy Brother?',
       E'It is the Word of Yahuah who comes — the same Logos who comforted Adam outside the garden — thundering from heaven to call Cain to account: *"and the Word of Yahuah Elohim (the LORD God) came from heaven to Cain, and said to him, ''Where is Abel your brother?''"* (1 Adam & Eve 79:16), and Cain answers with a proud heart, *"How, O Elohim (God)? Am I my brother''s keeper?"* (1 Adam & Eve 79:17). Genesis sets the same exchange word for word: *"And Yahuah (LORD) said unto Cain, Where is Abel thy brother? And he said, I know not: Am I my brother’s keeper?"* (Genesis 4:9). Jubilees keeps the reproof and the curse: *"And Yahuah (God) reproved Cain because of Abel, because he had slain him, and he made him a fugitive on the earth because of the blood of his brother..."* (Jubilees 4:4). And the One who comes as the Word is the One John says was in the beginning, by whom all things were made: *"In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)."* (John 1:1).',
       sv.verse_id, ev.verse_id, 'extras', 65956
  FROM _session253_1ae79_lookup sv, _session253_1ae79_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=16
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=79 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-79-mercy-curse-and-sevenfold',
       E'Yahuah''s Mercy in the Curse — the Sevenfold Restraint on Cain',
       E'The book unfolds the mercy hidden inside the judgment: Yahuah curses the ground rather than the man, *"For Elohim (God) did not curse him, but He cursed the ground"* (1 Adam & Eve 79:22), and sets the sevenfold restraint not to slay Cain but to draw him to repentance — *"I will put seven punishments on anyone who kills Cain,"* yet *"He sought to make him die of fasting, and praying and crying by hard rule, until the time that he was delivered from his sin."* (1 Adam & Eve 79:26). Genesis gives the curse and the mark of restraint: *"And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him."* (Genesis 4:15). The way of Cain becomes a byword for the apostate seed: *"Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward..."* (Jude 1:11). Yet even here the seed-promise holds: the Elohim of peace will crush the serpent at last — *"And the Elohim (God) of peace shall bruise Satan under your feet shortly."* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65959
  FROM _session253_1ae79_lookup sv, _session253_1ae79_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=79 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-79-abel-righteous-witness',
       E'Abel the Righteous, Killed Without a Cause — a Witness That Yet Speaketh',
       E'The ground refuses Abel''s body three times, *"because he was righteous and good, and was killed without a cause; and the ground threw him up the third time and would not receive him, that there might remain before his brother a witness against him."* (1 Adam & Eve 79:14). Abel is the first righteous one, and the New Testament will not let his witness die: *"By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh."* (Hebrews 11:4). John sets the two brothers as the two seeds, and warns the world will hate the righteous as Cain hated Abel: *"In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother."* (1 John 3:10). And Jasher records Abel''s own faith that Yahuah would avenge him: *"And Abel answered Cain, saying, Surely Elohim who has made us in the earth, he will avenge my cause, and he will require my blood from you should you slay me..."* (Jasher 1:22).',
       sv.verse_id, ev.verse_id, 'extras', 65962
  FROM _session253_1ae79_lookup sv, _session253_1ae79_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=79 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-79-cain-slays-righteous-abel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* The Torah''s bare record of the murder that 1 Adam & Eve 79:5-7 retells in full, blow by blow, with the stone.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-cain-slays-righteous-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother’s righteous.* John names the seed behind the staff of 1 Adam & Eve 79:7 — Cain was of the wicked one, the serpent striking at the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-cain-slays-righteous-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The same murder dated in the older witness, naming the rejected offering that drove Cain''s hand in 1 Adam & Eve 79:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-cain-slays-righteous-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 1:25 — *And Cain hastened and rose up, and took the iron part of his ploughing instrument, with which he suddenly smote his brother and he slew him, and Cain spilt the blood of his brother Abel upon the earth...* Jasher keeps the weapon and the spilt blood that 1 Adam & Eve 79:7 shows oozing before Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-cain-slays-righteous-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=7
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-79-blood-cries-from-the-ground
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The Torah''s word for the crying blood that 1 Adam & Eve 79:10 says cried mysteriously to Elohim to avenge the murder.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-blood-cries-from-the-ground'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* Yahusha names Abel''s blood as the head of all the martyred righteous, the crying of 1 Adam & Eve 79:10 reaching to His own generation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-blood-cries-from-the-ground'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The souls under the altar take up Abel''s same plea for vengeance heard in 1 Adam & Eve 79:10 — the righteous seed still crying.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-blood-cries-from-the-ground'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:3 — *And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him.* The older witness keeps the crying blood that 1 Adam & Eve 79:9 shows the trembling earth refusing to swallow.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-blood-cries-from-the-ground'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-79-where-is-thy-brother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:9 — *And Yahuah (LORD) said unto Cain, Where is Abel thy brother? And he said, I know not: Am I my brother’s keeper?* The Torah''s exact exchange that 1 Adam & Eve 79:16-17 expands, the proud keeper''s answer unchanged.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-where-is-thy-brother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Yahuah who comes from heaven to Cain in 1 Adam & Eve 79:16 is the same Logos who was in the beginning, by whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-where-is-thy-brother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:4 — *And Yahuah (God) reproved Cain because of Abel, because he had slain him, and he made him a fugitive on the earth because of the blood of his brother, and he cursed him upon the earth...* The older witness''s reproof matching the Word''s coming to question Cain in 1 Adam & Eve 79:16.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-where-is-thy-brother'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-79-mercy-curse-and-sevenfold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* The Torah''s sevenfold word and protecting mark that 1 Adam & Eve 79:26 reads as Yahuah''s mercy holding back the sword to call Cain to repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-mercy-curse-and-sevenfold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:11 — *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother’s blood from thy hand;* the curse on the ground that 1 Adam & Eve 79:22 hears as mercy — Elohim cursing the soil, not the murderer himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-mercy-curse-and-sevenfold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The cursed and trembling Cain of 1 Adam & Eve 79:18 becomes the New Testament''s name for the way of the apostate seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-mercy-curse-and-sevenfold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Behind Cain''s restraint in 1 Adam & Eve 79:26 stands the seed-promise of Genesis 3:15 — the serpent who struck through Cain will himself be crushed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-mercy-curse-and-sevenfold'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-79-abel-righteous-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The witness the ground preserves in 1 Adam & Eve 79:14 is the very witness of faith that the New Testament says yet speaks though Abel is dead.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-abel-righteous-witness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* John sets the two brothers as the two seed-lines, the righteous-and-good Abel of 1 Adam & Eve 79:14 against the children of the devil.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-abel-righteous-witness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jasher 1:22 — *And Abel answered Cain, saying, Surely Elohim who has made us in the earth, he will avenge my cause, and he will require my blood from you should you slay me, for Yahuah (the Lord) is the judge and arbiter...* Jasher gives righteous Abel''s own confession of the avenging Judge, the same righteousness for which the ground would not receive him in 1 Adam & Eve 79:14.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae79_lookup sv, _session253_1ae79_lookup tv
 WHERE t.slug='1-adam-eve-79-abel-righteous-witness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=79 AND sv.verse_number=14
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

