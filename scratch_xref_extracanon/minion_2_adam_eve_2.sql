-- ----- fragment: minion_2adameve_02.sql (session253 2-adam-eve 2) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae2 (view _session253_2ae2_lookup). Sort band base 66025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-2-another-seed-seth
  ('adam-eve-conflict', '2-adam-eve', 2, 3, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The Conflict''s naming of Seth in comfort for Abel is the same scene Moses records, the appointed seed kept after the murder.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 1, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* The beautiful son who is "like that of his father Adam" in 2:1 is the Seth begotten in Adam''s own likeness who heads the book of the generations.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 3, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees carries the identical word over Seth''s name — the raised-up second seed — confirming the Conflict''s account.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 3, 'canon', 'luke', 3, 38, 'free', E'Luke 3:38 — *Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* The child Adam names in his affliction stands at the head of the genealogy that runs down to the Messiah, the kept seed of the woman.'),
  -- thread: 2-adam-eve-2-offering-accepted-seth
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The offering Elohim accepts and blesses over Seth is the same respected sacrifice of the holy line, the altar kept before the Law.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The accepted offering for the babe Seth is the faith-offering Hebrews names, Elohim testifying over the righteous seed.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The Elohim who accepts the offering over Seth is the same who weighed Abel''s and Cain''s, the holy line distinguished by the accepted sacrifice.'),
  -- thread: 2-adam-eve-2-seth-line-against-cain
  ('adam-eve-conflict', '2-adam-eve', 2, 8, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The Conflict names Cain among the five but keeps Seth holy alone — the two seed-lines John divides, Cain of the wicked one against the righteous seed.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 9, 'canon', '1-john', 3, 10, 'free', E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Seth waxing in strength to fast and pray is the child of Elohim made manifest, the holy seed distinguished from the line of Cain.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 8, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The two lines that remain of Adam''s children are the very enmity of seed against seed, the serpent''s offspring against the woman''s kept seed.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 9, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Seth fasting and praying fervently is the kept seed pressing toward the promised bruising of Satan''s head, the seed-war begun in Genesis 3:15 finished in the Messiah.'),
  -- thread: 2-adam-eve-2-calling-on-the-name
  ('adam-eve-conflict', '2-adam-eve', 2, 6, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The washing for purification and the offering in the line of Seth open the way that becomes the calling on the Name of Yahuah in Seth''s own house.'),
  ('adam-eve-conflict', '2-adam-eve', 2, 7, 'jubilees', 'jubilees', 4, 12, 'extras', E'Jubilees 4:12 — *He began to call on the name of Yahuah (God) on the earth. And in the seventh jubilee in the third week Enos took Nôâm his sister to be his wife, and she bare him a son in the third year of the fifth week, and he called his name Kenan.* Jubilees keeps the same memory — the calling on the Name begun in Seth''s line — the worship the Conflict shows in Adam''s accepted offering for Seth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-another-seed-seth',
       E'Seth — another seed appointed instead of Abel',
       E'Eve brings forth a son after the murder of Abel, and Adam names him with thanksgiving: *Then he named the child Seth, that means, "that Elohim (God) has heard my prayer, and has delivered me out of my affliction." But it means also "power and strength."* (2 Adam and Eve 2:3). This is the very naming Moses records — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* (Genesis 4:25) — and the head of the holy generations: *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3). Jubilees keeps the same word: *and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* (Jubilees 4:7). It ain''t new — the seed of the woman is kept alive against the serpent, and the line runs unbroken to the very Son of Elohim: *which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* (Luke 3:38).',
       sv.verse_id, ev.verse_id, 'extras', 66025
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-offering-accepted-seth',
       E'The offering accepted and the blessing on Seth',
       E'Adam and Eve come to the river to wash, then bring an offering for the babe: *Then they returned, and took an offering, and went to the mountain and offered it up, for the babe; and Elohim (God) accepted their offering, and sent His blessing upon them, and upon their son Seth* (2 Adam and Eve 2:6-7). This is the way of the altar kept before Sinai — the offering Yahuah RESPECTS, as He had respected Abel: *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* (Genesis 4:4). Hebrews names it faith: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* (Hebrews 11:4). The acceptance over Seth is the same Yahuah who weighs the two offerings in Jubilees: *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* (Jubilees 4:2). Mercy, not law-as-curse — the covenant kept from the first day outside the garden.',
       sv.verse_id, ev.verse_id, 'extras', 66028
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-seth-line-against-cain',
       E'The holy line of Seth against the line of the wicked one',
       E'Of all Adam''s children only one holy son remains to carry the promise: *but only those five, Cain, Luluwa, Abel, Aklia, and Seth alone. But Seth waxed in stature and in strength; and began to fast and pray, fervently.* (2 Adam and Eve 2:8-9). The book sets two seed-lines side by side from the start — the murderer and the kept seed — exactly as John divides them: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* (1 John 3:12). The whole household of Elohim is manifest against the children of the devil: *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* (1 John 3:10). This is the seed-war of Genesis 3:15 worked out in two families — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). Seth fasting and praying is the seed of the woman holding the line; the bruising of the serpent''s head is promised to be finished — *And the Elohim (God) of peace shall bruise Satan under your feet shortly.* (Romans 16:20). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 66031
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-2-calling-on-the-name',
       E'Purification and calling on the Name before Sinai',
       E'Eve and the babe wash for purification while Adam and his daughter wash for their sorrow, and the household returns to offer and to be blessed: *but Eve and the babe washed for purification.* (2 Adam and Eve 2:6) ... *and Elohim (God) accepted their offering, and sent His blessing upon them* (2 Adam and Eve 2:7). The way of cleansing and the calling on the Name is kept from the line of Seth onward — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). Jubilees binds the same: *He began to call on the name of Yahuah (God) on the earth.* (Jubilees 4:12). This is Torah-as-the-way kept before Sinai, the offerings and the Name called upon — never law-as-curse, but the covenant mercy of Yahuah keeping His people from the first generations.',
       sv.verse_id, ev.verse_id, 'extras', 66034
  FROM _session253_2ae2_lookup sv, _session253_2ae2_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-2-another-seed-seth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* The Conflict''s naming of Seth in comfort for Abel is the same scene Moses records, the appointed seed kept after the murder.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* The beautiful son who is "like that of his father Adam" in 2:1 is the Seth begotten in Adam''s own likeness who heads the book of the generations.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:7 — *And Adam and his wife mourned for Abel four weeks of years, and in the fourth year of the fifth week they became joyful, and Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees carries the identical word over Seth''s name — the raised-up second seed — confirming the Conflict''s account.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 3:38 — *Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God).* The child Adam names in his affliction stands at the head of the genealogy that runs down to the Messiah, the kept seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-another-seed-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-2-offering-accepted-seth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The offering Elohim accepts and blesses over Seth is the same respected sacrifice of the holy line, the altar kept before the Law.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-offering-accepted-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The accepted offering for the babe Seth is the faith-offering Hebrews names, Elohim testifying over the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-offering-accepted-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* The Elohim who accepts the offering over Seth is the same who weighed Abel''s and Cain''s, the holy line distinguished by the accepted sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-offering-accepted-seth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-2-seth-line-against-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* The Conflict names Cain among the five but keeps Seth holy alone — the two seed-lines John divides, Cain of the wicked one against the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:10 — *In this the children of Elohim (God) are manifest, and the children of the devil: whosoever doeth not righteousness is not of Elohim (God), neither he that loveth not his brother.* Seth waxing in strength to fast and pray is the child of Elohim made manifest, the holy seed distinguished from the line of Cain.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The two lines that remain of Adam''s children are the very enmity of seed against seed, the serpent''s offspring against the woman''s kept seed.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Seth fasting and praying fervently is the kept seed pressing toward the promised bruising of Satan''s head, the seed-war begun in Genesis 3:15 finished in the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-seth-line-against-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-2-calling-on-the-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The washing for purification and the offering in the line of Seth open the way that becomes the calling on the Name of Yahuah in Seth''s own house.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-calling-on-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:12 — *He began to call on the name of Yahuah (God) on the earth. And in the seventh jubilee in the third week Enos took Nôâm his sister to be his wife, and she bare him a son in the third year of the fifth week, and he called his name Kenan.* Jubilees keeps the same memory — the calling on the Name begun in Seth''s line — the worship the Conflict shows in Adam''s accepted offering for Seth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae2_lookup sv, _session253_2ae2_lookup tv
 WHERE t.slug='2-adam-eve-2-calling-on-the-name'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

