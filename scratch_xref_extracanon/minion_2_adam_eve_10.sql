-- ----- fragment: minion_2adameve_10.sql (session253 2-adam-eve 10) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae10 (view _session253_2ae10_lookup). Sort band base 66225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-10-word-comforts
  ('adam-eve-conflict', '2-adam-eve', 10, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The very Word of Elohim who comes and comforts Adam''s children in 2 Adam & Eve 10:1 is the eternal Logos who was with Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who speaks to Seth and dwells with the holy line in 2 Adam & Eve 10:3 is the same Word who would be made flesh and tabernacle among men.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 1, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word coming to comfort Adam in 2 Adam & Eve 10:1 is Elohim speaking to the fathers, the first of those divers manners before the prophets.'),
  -- thread: 2-adam-eve-10-i-will-send-my-word-and-save
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise to save Seth and his seed in 2 Adam & Eve 10:3 is the seed-promise of Eden, the deliverer who would crush the serpent''s head.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word''s pledge to send and save in 2 Adam & Eve 10:3 is fulfilled when the fulness of time came and the Son was sent forth, made of a woman.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 3, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour promised to Seth in 2 Adam & Eve 10:3 was foreordained before the foundation of the world, awaiting the appointed manifestation.'),
  -- thread: 2-adam-eve-10-sever-thy-seed-from-cain
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The command to sever Seth''s seed from Cain''s in 2 Adam & Eve 10:4 guards the appointed seed given in Abel''s place.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The separation of Seth''s seed from Cain''s in 2 Adam & Eve 10:4 is the line drawn between the children of the wicked one and the righteous.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The Word commands Seth to keep clear of Cain''s line in 2 Adam & Eve 10:4, the way of Cain that still ends in woe.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* The same primeval witness as 2 Adam & Eve 10:4 — Seth raised up as the second, holy seed after Cain slew Abel.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 4, 'jasher', 'jasher', 2, 1, 'extras', E'Jasher 2:1 — *And it was in the hundred and thirtieth year of the life of Adam upon the earth, that he again knew Eve his wife, and she conceived and bare a son in his likeness and in his image, and she called his name Seth, saying, Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him.* Jasher tells the same appointing that 2 Adam & Eve 10:4 commands Seth to guard — the seed set in Abel''s place, kept apart from Cain.'),
  -- thread: 2-adam-eve-10-the-first-whose-soul-died
  ('adam-eve-conflict', '2-adam-eve', 10, 7, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The note that Adam was the first whose soul died in 2 Adam & Eve 10:7 records the falling of the Edenic sentence Genesis seals with "and he died."'),
  ('adam-eve-conflict', '2-adam-eve', 10, 7, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Abel who "died murdered" in 2 Adam & Eve 10:7 is the righteous brother slain by the seed of the wicked one.'),
  ('adam-eve-conflict', '2-adam-eve', 10, 7, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Though Abel "died murdered" in 2 Adam & Eve 10:7, his righteous faith yet speaks.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-word-comforts',
       E'The Word of Elohim comes and comforts',
       E'When the mourners end their prayer, *AND when they had ended their prayer, the Word of Elohim (God) came and comforted them concerning their father Adam* (2 Adam & Eve 10:1), and again *the Word of Elohim (God) came to Seth, the eldest among them* (2 Adam & Eve 10:3). This Comforter who comes, speaks, and dwells with the seed is the Logos: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), the Word who *was made flesh, and dwelt among us* (John 1:14). He is the One *who at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1). It ain''t new — from the very day outside the garden the seed is kept by the speaking Word.',
       sv.verse_id, ev.verse_id, 'extras', 66225
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-i-will-send-my-word-and-save',
       E'I will send My Word and save thee and thy seed',
       E'To Seth the Word renews the promise made to Adam: *I will send My Word and save thee and thy seed* (2 Adam & Eve 10:3) — the same enmity-and-deliverance set in Eden, *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The sending is appointed to its hour: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4), the Son *who verily was foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20). The five-and-a-half days are the appointed clock of that one promise, foreordained before the world and kept down the line of the seed.',
       sv.verse_id, ev.verse_id, 'extras', 66228
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-sever-thy-seed-from-cain',
       E'Sever thy seed from that of Cain',
       E'The Word''s charge to Seth divides the two lines: *keep thou the commandment he gave thee; and sever thy seed from that of Cain thy brother* (2 Adam & Eve 10:4). This is the appointing of the holy seed in place of Abel, *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). John marks the fault-line: be *Not as Cain, who was of that wicked one, and slew his brother... Because his own works were evil, and his brother''s righteous* (1 John 3:12), and Jude warns of those who *have gone in the way of Cain* (Jude 1:11). The same severing is told in the parallel primeval record: *Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him* (Jubilees 4:7) and *Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him* (Jasher 2:1). Not race but the paternal covenant line — election before confession.',
       sv.verse_id, ev.verse_id, 'extras', 66231
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-10-the-first-whose-soul-died',
       E'Adam the first whose soul died, Abel murdered',
       E'The chapter closes on death: *But Adam was the first whose soul died in the land of Eden, in the Cave of Treasures; for no one died before him, but his son Abel, who died murdered* (2 Adam & Eve 10:7). Genesis seals the sentence first passed in Eden, *And all the days that Adam lived were nine hundred and thirty years: and he died* (Genesis 5:5). Yet Abel died first, by his brother''s hand, *Because his own works were evil, and his brother''s righteous* (1 John 3:12) — and though slain, the righteous one is not silenced, for *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4). Death entered, but the seed and its witness were kept.',
       sv.verse_id, ev.verse_id, 'extras', 66234
  FROM _session253_2ae10_lookup sv, _session253_2ae10_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-10-word-comforts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The very Word of Elohim who comes and comforts Adam''s children in 2 Adam & Eve 10:1 is the eternal Logos who was with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-word-comforts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who speaks to Seth and dwells with the holy line in 2 Adam & Eve 10:3 is the same Word who would be made flesh and tabernacle among men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-word-comforts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word coming to comfort Adam in 2 Adam & Eve 10:1 is Elohim speaking to the fathers, the first of those divers manners before the prophets.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-word-comforts'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-10-i-will-send-my-word-and-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The promise to save Seth and his seed in 2 Adam & Eve 10:3 is the seed-promise of Eden, the deliverer who would crush the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-i-will-send-my-word-and-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The Word''s pledge to send and save in 2 Adam & Eve 10:3 is fulfilled when the fulness of time came and the Son was sent forth, made of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-i-will-send-my-word-and-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The Saviour promised to Seth in 2 Adam & Eve 10:3 was foreordained before the foundation of the world, awaiting the appointed manifestation.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-i-will-send-my-word-and-save'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-10-sever-thy-seed-from-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The command to sever Seth''s seed from Cain''s in 2 Adam & Eve 10:4 guards the appointed seed given in Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The separation of Seth''s seed from Cain''s in 2 Adam & Eve 10:4 is the line drawn between the children of the wicked one and the righteous.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* The Word commands Seth to keep clear of Cain''s line in 2 Adam & Eve 10:4, the way of Cain that still ends in woe.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* The same primeval witness as 2 Adam & Eve 10:4 — Seth raised up as the second, holy seed after Cain slew Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 2:1 — *And it was in the hundred and thirtieth year of the life of Adam upon the earth, that he again knew Eve his wife, and she conceived and bare a son in his likeness and in his image, and she called his name Seth, saying, Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him.* Jasher tells the same appointing that 2 Adam & Eve 10:4 commands Seth to guard — the seed set in Abel''s place, kept apart from Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-sever-thy-seed-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-10-the-first-whose-soul-died
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* The note that Adam was the first whose soul died in 2 Adam & Eve 10:7 records the falling of the Edenic sentence Genesis seals with "and he died."'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-the-first-whose-soul-died'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Abel who "died murdered" in 2 Adam & Eve 10:7 is the righteous brother slain by the seed of the wicked one.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-the-first-whose-soul-died'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Though Abel "died murdered" in 2 Adam & Eve 10:7, his righteous faith yet speaks.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae10_lookup sv, _session253_2ae10_lookup tv
 WHERE t.slug='2-adam-eve-10-the-first-whose-soul-died'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

