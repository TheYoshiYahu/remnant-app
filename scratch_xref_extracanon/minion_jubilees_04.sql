-- ----- fragment: minion_jubilees_04.sql (session251 jubilees 4) -----
-- Source anchor: jubilees/jubilees ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju04 (view _session251_ju04_lookup). Sort band base 53075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-4-cain-abel-blood
  ('jubilees', 'jubilees', 4, 2, 'canon', 'genesis', 4, 3, 'free', E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Jubilees 4:2 retells the rejected ground-offering exactly as Genesis frames it.'),
  ('jubilees', 'jubilees', 4, 2, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* This is the accepted sacrifice Jubilees 4:2 names as the reason Cain rose up.'),
  ('jubilees', 'jubilees', 4, 3, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The Genesis source of the blood that, in Jubilees 4:3, cried from the ground to heaven.'),
  ('jubilees', 'jubilees', 4, 2, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The Renewed Covenant names Abel''s accepted offering of Jubilees 4:2 as faith that still speaks.'),
  ('jubilees', 'jubilees', 4, 3, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Abel''s crying blood in Jubilees 4:3 becomes the very type the blood of Messiah surpasses.'),
  -- thread: jubilees-4-heavenly-tablets-judgment
  ('jubilees', 'jubilees', 4, 32, 'canon', 'leviticus', 24, 20, 'free', E'Leviticus 24:20 — *Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again.* The Torah carries the same measure-for-measure law Jubilees 4:32 says was ordained on the heavenly tablets.'),
  ('jubilees', 'jubilees', 4, 31, 'canon', 'leviticus', 24, 17, 'free', E'Leviticus 24:17 — *And he that killeth any man shall surely be put to death.* Cain killed by stones in Jubilees 4:31 is the life-for-life sentence Torah lays down.'),
  ('jubilees', 'jubilees', 4, 4, 'canon', 'genesis', 4, 15, 'free', E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* The Genesis judgment on Cain matches the heavenly-tablet curse of Jubilees 4:4.'),
  -- thread: jubilees-4-seth-second-seed
  ('jubilees', 'jubilees', 4, 7, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jubilees 4:7 retells the raising up of the second seed almost word for word.'),
  ('jubilees', 'jubilees', 4, 12, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The calling on the Name Jubilees 4:12 attributes to Enos is the Genesis source.'),
  ('jubilees', 'jubilees', 4, 7, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed that Jubilees 4:7 is unrolling jubilee by jubilee.'),
  -- thread: jubilees-4-enoch-scribe-witness
  ('jubilees', 'jubilees', 4, 17, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Torah''s terse note is what Jubilees 4:23 expands into Enoch being conducted into the Garden of Eden.'),
  ('jubilees', 'jubilees', 4, 23, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The Renewed Covenant confirms the taking-alive Jubilees 4:23 narrates.'),
  ('jubilees', 'jubilees', 4, 17, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The canon itself names Enoch the testifying prophet Jubilees 4:17 calls the first to write a testimony.'),
  ('jubilees', 'jubilees', 4, 17, 'enoch', '1-enoch', 12, 3, 'extras', E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* The living 1 Enoch text shows the scribe-of-righteousness office Jubilees 4:17 ascribes to him.'),
  ('jubilees', 'jubilees', 4, 23, 'enoch', '1-enoch', 13, 8, 'extras', E'1 Enoch 13:8 — *And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* The vision-and-witness commission of Jubilees 4:23 unfolds in the parallel Enoch apparatus.'),
  -- thread: jubilees-4-watchers-descended-jared
  ('jubilees', 'jubilees', 4, 22, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Genesis source of the Watchers defiling themselves with the daughters of men that Enoch testifies against in Jubilees 4:22.'),
  ('jubilees', 'jubilees', 4, 15, 'enoch', '1-enoch', 6, 6, 'extras', E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The 1 Enoch apparatus fixes the Watchers'' descent to the same generation of Jared that Jubilees 4:15 names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-cain-abel-blood',
       E'Cain and Abel — the blood that cries from the ground',
       E'Jubilees opens Adam''s line with the first murder and the first martyr''s blood: *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2), *And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him* (Jubilees 4:3). This is the Genesis source retold word for word: *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD)* (Genesis 4:3) and *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). It ain''t new — the Renewed Covenant reads the same scene back: Abel''s accepted sacrifice was faith, *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4), and his crying blood becomes the type that the blood of Messiah surpasses, *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24).',
       sv.verse_id, ev.verse_id, 'extras', 53075
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-heavenly-tablets-judgment',
       E'Written on the heavenly tablets — life for life, measure for measure',
       E'Jubilees grounds the law of bloodguilt not in Sinai-as-novelty but in the heavenly tablets engraved before the deed: *And on this account it is written on the heavenly tables, “Cursed is he who smites his neighbour treacherously, and let all who have seen and heard say, So be it; and the man who has seen and not declared (it), let him be accursed as the other.”* (Jubilees 4:4). Cain''s own end seals it — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment* (Jubilees 4:31) — *For this reason it was ordained on the heavenly tables: “With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him.”* (Jubilees 4:32). It ain''t new: the same measure-for-measure justice stands in the Torah, *Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again* (Leviticus 24:20) and *And he that killeth any man shall surely be put to death* (Leviticus 24:17) — Torah and the heavenly tablets agree, the covenant''s justice eternal, never abolished. Even Cain''s protective mark belongs to the same ordered judgment, *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him* (Genesis 4:15).',
       sv.verse_id, ev.verse_id, 'extras', 53078
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-seth-second-seed',
       E'Seth — the second seed raised up, the line kept',
       E'Where Cain''s line is cursed, Jubilees keeps the elect seed alive through Seth: *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* (Jubilees 4:7), and through his son the worship begins, *He began to call on the name of Yahuah (God) on the earth* (Jubilees 4:12). This is Genesis 5 and the close of Genesis 4 retold: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25) and *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The genealogy that carries the seed forward is the very book Jubilees is unrolling, *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3) — the seed kept separate and called by the Name, election running through the chosen line. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53081
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-enoch-scribe-witness',
       E'Enoch — the first scribe, the witness, taken to the Garden',
       E'Jubilees gives Enoch his fullest portrait: the first to learn writing and to read the heavens, the scribe and witness who recounted the appointed times. *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months. And he was the first to write a testimony, and he testified to the sons of men among the generations of the earth, and recounted the weeks of the jubilees, and made known to them the days of the years, and set in order the months and recounted the Sabbaths of the years as we made (them) known to him* (Jubilees 4:17). He was taken alive — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men* (Jubilees 4:23). The Torah genealogy says the same in fewer words, *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), and the Renewed Covenant confirms the translation, *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). His office as the prophet of judgment is quoted in the canon itself, *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). And the live 1 Enoch apparatus shows the very scribe Jubilees describes: *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* (1 Enoch 12:3) and *And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* (1 Enoch 13:8). It ain''t new — the calendar of the heavenly tablets, the months and Sabbaths of the years, is the same Appointed Times engraved before the patriarchs ever kept them.',
       sv.verse_id, ev.verse_id, 'extras', 53084
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-watchers-descended-jared',
       E'The Watchers descended in the days of Jared',
       E'Jubilees fixes the descent of the Watchers to a generation in Adam''s line: *and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men, and that they should do judgment and uprightness on the earth* (Jubilees 4:15) — and what they became is what Enoch testified against, *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all* (Jubilees 4:22). This is the Genesis 6 corruption read alongside its source, *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). The live 1 Enoch apparatus ties the descent to the very name Jared, *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it* (1 Enoch 6:6). The seed-war is one story across the witnesses — the defilement of the daughters of men, the Watchers'' sin, and the Flood that answers it, all engraved on the heavenly tablets long before Genesis was written down. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53087
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-4-cain-abel-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Jubilees 4:2 retells the rejected ground-offering exactly as Genesis frames it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* This is the accepted sacrifice Jubilees 4:2 names as the reason Cain rose up.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The Genesis source of the blood that, in Jubilees 4:3, cried from the ground to heaven.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The Renewed Covenant names Abel''s accepted offering of Jubilees 4:2 as faith that still speaks.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Abel''s crying blood in Jubilees 4:3 becomes the very type the blood of Messiah surpasses.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-heavenly-tablets-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 24:20 — *Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again.* The Torah carries the same measure-for-measure law Jubilees 4:32 says was ordained on the heavenly tablets.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-heavenly-tablets-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 24:17 — *And he that killeth any man shall surely be put to death.* Cain killed by stones in Jubilees 4:31 is the life-for-life sentence Torah lays down.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-heavenly-tablets-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* The Genesis judgment on Cain matches the heavenly-tablet curse of Jubilees 4:4.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-heavenly-tablets-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-seth-second-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jubilees 4:7 retells the raising up of the second seed almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-seth-second-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The calling on the Name Jubilees 4:12 attributes to Enos is the Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-seth-second-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed that Jubilees 4:7 is unrolling jubilee by jubilee.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-seth-second-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-enoch-scribe-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Torah''s terse note is what Jubilees 4:23 expands into Enoch being conducted into the Garden of Eden.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The Renewed Covenant confirms the taking-alive Jubilees 4:23 narrates.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The canon itself names Enoch the testifying prophet Jubilees 4:17 calls the first to write a testimony.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* The living 1 Enoch text shows the scribe-of-righteousness office Jubilees 4:17 ascribes to him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 13:8 — *And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* The vision-and-witness commission of Jubilees 4:23 unfolds in the parallel Enoch apparatus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-watchers-descended-jared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Genesis source of the Watchers defiling themselves with the daughters of men that Enoch testifies against in Jubilees 4:22.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-watchers-descended-jared'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The 1 Enoch apparatus fixes the Watchers'' descent to the same generation of Jared that Jubilees 4:15 names.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-watchers-descended-jared'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

