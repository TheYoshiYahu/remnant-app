-- ----- fragment: minion_2adameve_11.sql (session253 2-adam-eve 11) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae11 (view _session253_2ae11_lookup). Sort band base 66250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-11-two-seed-lines
  ('adam-eve-conflict', '2-adam-eve', 11, 1, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The severing of Seth''s children from Cain''s in 11:1 begins from this appointed-seed that replaces slain Abel.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 1, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain''s seed going down westward below Abel''s blood (11:1) is the wicked-one''s line the apostle names.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 3, 'canon', 'jude', 1, 11, 'free', E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Seth refusing to let one child go down to Cain''s people (11:3) is the line that does not walk the way of Cain.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 1, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same primeval record sets Seth''s line apart from Cain''s as 2 Adam and Eve 11:1 does.'),
  -- thread: 2-adam-eve-11-children-of-elohim
  ('adam-eve-conflict', '2-adam-eve', 11, 4, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The pure line named "Children of Elohim" in 11:4 is the very phrase whose corruption Genesis records at the flood''s threshold.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 4, 'canon', 'john', 1, 12, 'free', E'John 1:12 — *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name.* The sonship Seth''s children hold by purity in 11:4 is given anew in the Word to all who receive Him.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 4, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* Seth''s sons stand "instead of the hosts of angels who fell" (11:4) — these are the very watchers who fell.'),
  -- thread: 2-adam-eve-11-heavenly-praises-offerings
  ('adam-eve-conflict', '2-adam-eve', 11, 10, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The offerings and unceasing praises of Seth''s children in 11:6-10 are this calling on the Name begun in Seth''s own line.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 10, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering.* The cave-dwellers who bring "only offerings" (11:10) keep the accepted worship of righteous Abel.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 6, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* Enoch of Seth''s line keeps the same heavenly offering-worship that Seth''s children give themselves to in 11:6.'),
  -- thread: 2-adam-eve-11-blood-of-abel
  ('adam-eve-conflict', '2-adam-eve', 11, 12, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The blood of Abel the just sworn by in 11:12 is the blood that first cried from the ground.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 12, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The oath by Abel''s blood in 11:12 reaches toward the better blood it foreshadows.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 12, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Swearing by Abel the just (11:12) confesses the righteous seed against the wicked one''s line.'),
  -- thread: 2-adam-eve-11-blessing-in-adam-seed-kept
  ('adam-eve-conflict', '2-adam-eve', 11, 13, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The daily worship and blessing in Adam''s body in 11:13 is the kept seed of the woman guarded against the serpent.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 14, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* Seth''s holy line kept in the cave until his end (11:14) is the generations of Adam through Seth that carry the seed onward.'),
  ('adam-eve-conflict', '2-adam-eve', 11, 13, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The cave''s worship guarding the seed (11:13) looks to the promised crushing of the serpent that the woman''s seed will accomplish.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-two-seed-lines',
       E'Seth severs the holy line from Cain',
       E'The very first day''s history outside the garden is already the seed-war. *AFTER the death of Adam and of Eve, Seth severed his children, and his children''s children, from Cain''s children. Cain and his seed went down and dwelt westward, below the place where he had killed his brother Abel* (2 Adam and Eve 11:1), while *Seth and his children, dwelt northwards upon the mountain of the Cave of Treasures* (2 Adam and Eve 11:2), and Seth *did not allow one of them to go down to Cain''s children* (2 Adam and Eve 11:3). This is not race but the paternal-seed separation of the covenant line — Yahuah Himself appointed the line: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25), and *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The NT names the wicked seed plainly: *Not as Cain, who was of that wicked one, and slew his brother* (1 John 3:12), and warns of those who *have gone in the way of Cain* (Jude 1:11). Jubilees keeps the same record — *Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him* (Jubilees 4:7). It ain''t new: from the first generation the two seeds are kept apart, the woman''s seed guarded against the serpent''s (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66250
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-children-of-elohim',
       E'Children of Elohim in the room of the fallen angels',
       E'The holy line of Seth is given the very name the watchers forfeited. *But because of their own purity, they were named "Children of Elohim (God)," and they were with Elohim (God), instead of the hosts of angels who fell; for they continued in praises to Elohim (God), and in singing psalms unto Him, in their cave - the Cave of Treasures* (2 Adam and Eve 11:4). This is the same phrase Genesis sets at the brink of the flood — *That the sons of Elohim (God) saw the daughters of men that they were fair* (Genesis 6:2) — and the later mingling of Seth''s purity with Cain''s valley is the corruption that follows. Enoch shows the angels who fell, leaving the rooms now filled by the sons of Seth: *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men''* (1 Enoch 6:2). And the gospel turns the title forward — *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name* (John 1:12). The name belongs to the kept seed, never to the fallen.',
       sv.verse_id, ev.verse_id, 'extras', 66253
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-heavenly-praises-offerings',
       E'The cave-dwellers gave themselves to heavenly things',
       E'Seth''s children kept the worship of the Most High before ever Sinai was given. *But Seth and his children did not like earthly work, but gave themselves to heavenly things; for they had no other thought than praises, doxologies, and psalms unto Elohim (God)* (2 Adam and Eve 11:6), and *therefore did they at all times hear the voices of angels, praising and glorifying Elohim (God)* (2 Adam and Eve 11:7). They *sowed not, neither did they reap... but only offerings* (2 Adam and Eve 11:10). This is the way kept from the beginning — *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26) — the offerings of the righteous reaching back to Abel, of whom *Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4). Jubilees names Enoch of this same line burning incense on the mount: *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25). The Name was called upon, the offerings were brought, generations before the law — never law-as-curse, but the way of mercy kept.',
       sv.verse_id, ev.verse_id, 'extras', 66256
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-blood-of-abel',
       E'They swore by the blood of Abel the just',
       E'The holiness of the cave is sealed by the most solemn oath the first world knew. *For the men of that time never swore, but under hard circumstances, when men must swear, they swore by the blood of Abel the just* (2 Adam and Eve 11:12) — among them *no jealousy, no evil action, no hatred... neither evil counsel nor fraud*. That blood already cried from the ground: *the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). And the apostle holds Abel''s righteous blood up to a greater — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24). The swearing by Abel''s blood marks which seed they belong to, for Cain *was of that wicked one, and slew his brother... Because his own works were evil, and his brother''s righteous* (1 John 3:12). The oath itself confesses the seed-war and which side is theirs.',
       sv.verse_id, ev.verse_id, 'extras', 66259
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-11-blessing-in-adam-seed-kept',
       E'Blessed in the body of Adam — the seed kept',
       E'The cave devotion turns ever toward the kept seed and the promise. *But they constrained their children and their women every day in the cave to fast and pray, and to worship the most High Elohim (God). They blessed themselves in the body of their father Adam, and anointed themselves with it* (2 Adam and Eve 11:13), keeping the line holy *until the end of Seth drew near* (2 Adam and Eve 11:14). This guarding of the line is the keeping of the seed promised in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The kept seed runs on through the generations of Adam toward Noah — *This is the book of the generations of Adam... and called his name Seth* (Genesis 5:1, 3) — and the whole line of the cave is the seed Yahuah preserves against the serpent until the Saviour comes (Genesis 3:15; Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66262
  FROM _session253_2ae11_lookup sv, _session253_2ae11_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=13
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=11 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-11-two-seed-lines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The severing of Seth''s children from Cain''s in 11:1 begins from this appointed-seed that replaces slain Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Cain''s seed going down westward below Abel''s blood (11:1) is the wicked-one''s line the apostle names.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:11 — *Woe unto them! for they have gone in the way of Cain, and ran greedily after the error of Balaam for reward, and perished in the gainsaying of Core.* Seth refusing to let one child go down to Cain''s people (11:3) is the line that does not walk the way of Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* The same primeval record sets Seth''s line apart from Cain''s as 2 Adam and Eve 11:1 does.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-two-seed-lines'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-children-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The pure line named "Children of Elohim" in 11:4 is the very phrase whose corruption Genesis records at the flood''s threshold.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-children-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:12 — *But as many as received him, to them gave he power to become the sons of Elohim (God), even to them that believe on his name.* The sonship Seth''s children hold by purity in 11:4 is given anew in the Word to all who receive Him.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-children-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* Seth''s sons stand "instead of the hosts of angels who fell" (11:4) — these are the very watchers who fell.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-children-of-elohim'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-heavenly-praises-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The offerings and unceasing praises of Seth''s children in 11:6-10 are this calling on the Name begun in Seth''s own line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-heavenly-praises-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering.* The cave-dwellers who bring "only offerings" (11:10) keep the accepted worship of righteous Abel.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-heavenly-praises-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount.* Enoch of Seth''s line keeps the same heavenly offering-worship that Seth''s children give themselves to in 11:6.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-heavenly-praises-offerings'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-blood-of-abel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The blood of Abel the just sworn by in 11:12 is the blood that first cried from the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* The oath by Abel''s blood in 11:12 reaches toward the better blood it foreshadows.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Swearing by Abel the just (11:12) confesses the righteous seed against the wicked one''s line.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blood-of-abel'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-11-blessing-in-adam-seed-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The daily worship and blessing in Adam''s body in 11:13 is the kept seed of the woman guarded against the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blessing-in-adam-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* Seth''s holy line kept in the cave until his end (11:14) is the generations of Adam through Seth that carry the seed onward.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blessing-in-adam-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The cave''s worship guarding the seed (11:13) looks to the promised crushing of the serpent that the woman''s seed will accomplish.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae11_lookup sv, _session253_2ae11_lookup tv
 WHERE t.slug='2-adam-eve-11-blessing-in-adam-seed-kept'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

