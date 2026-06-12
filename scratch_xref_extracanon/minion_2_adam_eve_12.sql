-- ----- fragment: minion_2adameve_12.sql (session253 2-adam-eve 12) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae12 (view _session253_2ae12_lookup). Sort band base 66275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-12-the-word-shall-save-thy-seed
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Yahuah promises to send to Seth is no mere message but the eternal Logos, with Elohim before the world.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* "The great five days and a half" reckons to the incarnation, when the promised Word took flesh to save the seed.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* — the appointed term of Seth''s promise is the same fulness of time at which the Son was sent.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The "seed" Yahuah pledges to save through Seth is the very seed of the woman set against the serpent from the first day outside Eden.'),
  -- thread: 2-adam-eve-12-two-seed-lines-seth-and-cain
  ('adam-eve-conflict', '2-adam-eve', 12, 11, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Seth names Cain "the murderer" of his brother precisely as John marks him the seed of the wicked one — the line to be fled.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 10, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The "Holy and pure Mountain" Seth guards is the appointed seed-line given in Abel''s place.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 11, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To make fellowship with Cain''s children is to go "in the way of Cain" — the very apostasy Seth forbids.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 11, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same two houses stand in Jubilees — Seth the raised-up second seed over against Cain the slayer.'),
  -- thread: 2-adam-eve-12-altar-offerings-kept-from-satan
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth''s altar and intercession are the calling on the Name that Scripture says began in his very line.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Seth''s accepted offering continues the faith of Abel, whose blood he later swears his sons by.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Seth prays to be kept "from the hand of Satan"; the manifested Son is the answer that breaks Satan''s works.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 5, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Seth begs is the crushing of the serpent promised to the whole seed of the woman.'),
  -- thread: 2-adam-eve-12-the-blessing-passes-down-the-line
  ('adam-eve-conflict', '2-adam-eve', 12, 12, 'canon', 'genesis', 5, 6, 'free', E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* The first-born Seth blesses and sets over the people is the same Enos of the scriptural seed-genealogy.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 9, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* The very names gathered to Seth''s blessing — Enos, Cainan, Mahalaleel, Jared, Enoch — march in order down the holy line Scripture records.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 15, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Enos feeding his people "in righteousness and judgment" is the line that began to call on the Name carried forward.'),
  ('adam-eve-conflict', '2-adam-eve', 12, 9, 'jubilees', 'jubilees', 4, 9, 'extras', E'Jubilees 4:9 — *And Cain took ''Âwân his sister to be his wife and she bare him Enoch at the close of the fourth jubilee. And in the first year of the first week of the fifth jubilee, houses were built on the earth, and Cain built a city, and called its name after the name of his son Enoch.* Against Seth''s blessed line on the mountain, Jubilees sets Cain''s line building its city below — the same two seed-houses this chapter divides.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-the-word-shall-save-thy-seed',
       E'I will send My Word and save thee and thy seed',
       E'Elohim renews to Seth the very promise made to Adam in the cave: *And Elohim (God) accepted his offering, and sent His blessing upon him and upon his children. And then Elohim (God) made a promise to Seth, saying, "At the end of the great five days and a half, concerning which I have made a promise to thee and to thy father, I will send My Word and save thee and thy seed."* (2-adam-eve 12:6). It ain''t new — this is the Logos foretold from the second generation outside Eden. The Word who is promised is the same who *was in the beginning... and the Word was Elohim (God)* (John 1:1), and who *was made flesh, and dwelt among us* (John 1:14) when *the fulness of the time was come* (Galatians 4:4). And the seed He comes to save is the seed of the woman of the first promise: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66275
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-two-seed-lines-seth-and-cain',
       E'Make no fellowship with the children of Cain',
       E'Dying Seth adjures his sons by the blood of Abel to keep the holy mountain and never mingle with Cain''s line: *I beg of you my children, not to let one of you go down from this Holy and pure Mountain. Make no fellowship with the children of Cain the murderer and the sinner, who killed his brother; for ye know, 0 my children, that we flee from him, and from all his sin with all our might because he killed his brother Abel.* (2-adam-eve 12:10-11). This is the two-seed war set in the genealogy: Seth himself was given as the appointed seed in Abel''s room — *Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). The line below is the serpent''s: *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12); they who follow it *have gone in the way of Cain* (Jude 1:11). Jubilees carries the same two houses — *Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him* (Jubilees 4:7) — while Cain built his city below.',
       sv.verse_id, ev.verse_id, 'extras', 66278
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-altar-offerings-kept-from-satan',
       E'The altar, the offering, and mercy from the hand of Satan',
       E'Before his death Seth roofs the altar and offers for his children, that the seed be kept: *he took them and offered them upon the altar; and prayed Elohim (God) to accept their offerings, to have mercy on the souls of his children, and to keep them from the hand of Satan.* (2-adam-eve 12:5). The way of acceptable offering was kept from the first generations — *to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). It is the faith of righteous Abel before him: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous* (Hebrews 11:4). And the prayer "to keep them from the hand of Satan" is answered in the seed-promise itself — *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8); *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66281
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-12-the-blessing-passes-down-the-line',
       E'Enos fed his people in righteousness — the line kept to Enoch',
       E'The covenant blessing passes by hand down the holy generations: Enos, Cainan, Mahalaleel, Jared and Enoch come to receive it, and Seth commits the priesthood and the rule to Enos — *Then Seth blessed Enos, his first - born son, and commanded him habitually to minister in purity before the body of our father Adam... And he commanded him to feed his people in righteousness, in judgment and purity all the days of his life.* (2-adam-eve 12:12); *After the death of Seth, Enos rose at the head of his people, whom he fed in righteousness, and judgment, as his father had commanded him.* (2-adam-eve 12:15). This is the very genealogy of the kept seed in Scripture: *Seth lived an hundred and five years, and begat Enos* (Genesis 5:6); *Enos lived ninety years, and begat Cainan* (Genesis 5:9). It is the line that began to call on the Name — *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — and that runs on to the translated Enoch named here at twenty years old.',
       sv.verse_id, ev.verse_id, 'extras', 66284
  FROM _session253_2ae12_lookup sv, _session253_2ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-12-the-word-shall-save-thy-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word Yahuah promises to send to Seth is no mere message but the eternal Logos, with Elohim before the world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* "The great five days and a half" reckons to the incarnation, when the promised Word took flesh to save the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* — the appointed term of Seth''s promise is the same fulness of time at which the Son was sent.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The "seed" Yahuah pledges to save through Seth is the very seed of the woman set against the serpent from the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-word-shall-save-thy-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-12-two-seed-lines-seth-and-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Seth names Cain "the murderer" of his brother precisely as John marks him the seed of the wicked one — the line to be fled.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The "Holy and pure Mountain" Seth guards is the appointed seed-line given in Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* To make fellowship with Cain''s children is to go "in the way of Cain" — the very apostasy Seth forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same two houses stand in Jubilees — Seth the raised-up second seed over against Cain the slayer.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-two-seed-lines-seth-and-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-12-altar-offerings-kept-from-satan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Seth''s altar and intercession are the calling on the Name that Scripture says began in his very line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* Seth''s accepted offering continues the faith of Abel, whose blood he later swears his sons by.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Seth prays to be kept "from the hand of Satan"; the manifested Son is the answer that breaks Satan''s works.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The deliverance Seth begs is the crushing of the serpent promised to the whole seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-altar-offerings-kept-from-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-12-the-blessing-passes-down-the-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* The first-born Seth blesses and sets over the people is the same Enos of the scriptural seed-genealogy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* The very names gathered to Seth''s blessing — Enos, Cainan, Mahalaleel, Jared, Enoch — march in order down the holy line Scripture records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Enos feeding his people "in righteousness and judgment" is the line that began to call on the Name carried forward.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:9 — *And Cain took ''Âwân his sister to be his wife and she bare him Enoch at the close of the fourth jubilee. And in the first year of the first week of the fifth jubilee, houses were built on the earth, and Cain built a city, and called its name after the name of his son Enoch.* Against Seth''s blessed line on the mountain, Jubilees sets Cain''s line building its city below — the same two seed-houses this chapter divides.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae12_lookup sv, _session253_2ae12_lookup tv
 WHERE t.slug='2-adam-eve-12-the-blessing-passes-down-the-line'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

