-- ----- fragment: minion_1adameve_75.sql (session253 1-adam-eve 75) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch75. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae75 (view _session253_1ae75_lookup). Sort band base 65850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae75_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-75-offering-accepted-fire
  ('adam-eve-conflict', '1-adam-eve', 75, 3, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The respect Yahuah shows Abel''s flock is the same accepting light that shines on Adam''s altar in 1 Adam & Eve 75:3.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 3, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The witness Elohim gives to a righteous offering is the very light from heaven Adam''s offering receives in 1 Adam & Eve 75:3.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 5, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The same covenant mercy that accepts Adam and Eve''s offering in 1 Adam & Eve 75:5 will rest on Noah''s altar at the far end of the line.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 2, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees remembers the divided answer at this same altar where Adam asks Elohim to accept his offering in 1 Adam & Eve 75:2.'),
  -- thread: 1-adam-eve-75-purification-forty-eighty
  ('adam-eve-conflict', '1-adam-eve', 75, 12, 'canon', 'leviticus', 12, 4, 'free', E'Leviticus 12:4 — *And she shall then continue in the blood of her purifying three and thirty days; she shall touch no hallowed thing, nor come into the sanctuary, until the days of her purifying be fulfilled.* The shorter reckoning for a son matches Adam''s forty-day offering for the son in 1 Adam & Eve 75:12.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 12, 'canon', 'leviticus', 12, 5, 'free', E'Leviticus 12:5 — *But if she bear a maid child, then she shall be unclean two weeks, as in her separation: and she shall continue in the blood of her purifying threescore and six days.* The doubled reckoning for a daughter is exactly the eighty-day offering Adam makes for the daughter in 1 Adam & Eve 75:4 and 75:12.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 4, 'canon', 'leviticus', 12, 6, 'free', E'Leviticus 12:6 — *And when the days of her purifying are fulfilled, for a son, or for a daughter, she shall bring a lamb of the first year for a burnt offering, and a young pigeon, or a turtledove, for a sin offering, unto the door of the tabernacle of the congregation, unto the priest:* The offering brought when the days are fulfilled is the very offering Adam carries to the altar for Eve and the children in 1 Adam & Eve 75:4.'),
  -- thread: 1-adam-eve-75-abel-born-the-seed
  ('adam-eve-conflict', '1-adam-eve', 75, 11, 'canon', 'genesis', 4, 2, 'free', E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The birth of Abel named in 1 Adam & Eve 75:11 is the same second son Eve bears in Genesis.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 11, 'jubilees', 'jubilees', 4, 1, 'extras', E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân.* Jubilees, like 1 Adam & Eve 75:11, counts the daughters with the sons in this same primeval household.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 13, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* After the children of 1 Adam & Eve 75:13, the kept seed of the woman runs not through Abel but through the appointed Seth.'),
  -- thread: 1-adam-eve-75-cave-treasures-blessing
  ('adam-eve-conflict', '1-adam-eve', 75, 6, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh of the Cave of Treasures whose tokens bless the children in 1 Adam & Eve 75:6 are the very gifts kept for the promised Saviour.'),
  ('adam-eve-conflict', '1-adam-eve', 75, 10, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The constant offerings and blessings of Adam''s house in 1 Adam & Eve 75:10 are the same calling on the Name of Yahuah kept from the first generations.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae75_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae75_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-75-offering-accepted-fire',
       E'The offering accepted — light from heaven upon the altar',
       E'Adam builds his altar and Yahuah answers with fire: *And Elohim (God) accepted Adam''s offering, and sent a light from heaven that shown on the offering* (1 Adam & Eve 75:3), *And Yahuah (Lord) accepted the offering of Adam and Eve* (75:5). It ain''t new — this is the first page of the whole sacrificial witness Genesis records of the same family: *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering* (Genesis 4:4). The Spirit names it for what it was, faith: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous* (Hebrews 11:4). And the same sweet-savour mercy that crowned Adam''s altar will crown Noah''s at the other end of this book: *And Noah builded an altar unto Yahuah (LORD)... And Yahuah (LORD) smelled a sweet savour* (Genesis 8:20-21). The restored Jubilees keeps the memory of the divided answer: *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2).',
       sv.verse_id, ev.verse_id, 'extras', 65850
  FROM _session253_1ae75_lookup sv, _session253_1ae75_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=75 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-75-purification-forty-eighty',
       E'The Torah of the womb kept before Sinai — forty days, fourscore days',
       E'Watch the rhythm: Adam waits *until the daughter was eighty days old* before her offering (1 Adam & Eve 75:4), and for the next children, *at the end of forty days, Adam made an offering for the son, and at the end of eighty days he made another offering for the daughter* (75:12). This is no invention of the book — it is the very law of the purifying womb that Yahuah will write at Sinai, here already kept by the first father: for a son the days are reckoned shorter, *And she shall then continue in the blood of her purifying three and thirty days* (Leviticus 12:4); for a daughter doubled, *But if she bear a maid child, then she shall be unclean two weeks, as in her separation: and she shall continue in the blood of her purifying threescore and six days* (Leviticus 12:5); and at the end an offering is brought, *And when the days of her purifying are fulfilled, for a son, or for a daughter, she shall bring a lamb of the first year for a burnt offering* (Leviticus 12:6). The way was kept long before the tablets — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 65853
  FROM _session253_1ae75_lookup sv, _session253_1ae75_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=75 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-75-abel-born-the-seed',
       E'Abel and Aklia born — the seed appointed and named',
       E'*Eve again conceived... she gave birth to another son and daughter. They named the son Abel and the daughter Aklia* (1 Adam & Eve 75:11). Genesis tells the same birth: *And she again bare his brother Abel. And Abel was a keeper of sheep* (Genesis 4:2). The restored Jubilees gives the whole household by name, the sisters included: *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân* (Jubilees 4:1). And though Abel is named here, the seed of the woman is not in Abel — it runs on past Cain''s violence to the appointed son: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25). The serpent strikes (Genesis 3:15), Yahuah keeps the seed.',
       sv.verse_id, ev.verse_id, 'extras', 65856
  FROM _session253_1ae75_lookup sv, _session253_1ae75_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=75 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-75-cave-treasures-blessing',
       E'The Cave of Treasures — blessed with the tokens of the garden',
       E'The children are carried not to their birth-cave but up to the holy place: *they came to the Cave of Treasures, in order that the children should go around in it, and be blessed with the tokens brought from the garden* (1 Adam & Eve 75:6). These tokens kept against the Saviour''s coming are the gold, the incense, and the myrrh of the cave, which Yahuah''s wise men will one day lay before the child He promised Adam: *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). And the household''s whole life is a calling on the Name, the way kept from the first generation: *then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26).',
       sv.verse_id, ev.verse_id, 'extras', 65859
  FROM _session253_1ae75_lookup sv, _session253_1ae75_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=75 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-75-offering-accepted-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* The respect Yahuah shows Abel''s flock is the same accepting light that shines on Adam''s altar in 1 Adam & Eve 75:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-offering-accepted-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The witness Elohim gives to a righteous offering is the very light from heaven Adam''s offering receives in 1 Adam & Eve 75:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-offering-accepted-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The same covenant mercy that accepts Adam and Eve''s offering in 1 Adam & Eve 75:5 will rest on Noah''s altar at the far end of the line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-offering-accepted-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees remembers the divided answer at this same altar where Adam asks Elohim to accept his offering in 1 Adam & Eve 75:2.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-offering-accepted-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-75-purification-forty-eighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 12:4 — *And she shall then continue in the blood of her purifying three and thirty days; she shall touch no hallowed thing, nor come into the sanctuary, until the days of her purifying be fulfilled.* The shorter reckoning for a son matches Adam''s forty-day offering for the son in 1 Adam & Eve 75:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-purification-forty-eighty'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 12:5 — *But if she bear a maid child, then she shall be unclean two weeks, as in her separation: and she shall continue in the blood of her purifying threescore and six days.* The doubled reckoning for a daughter is exactly the eighty-day offering Adam makes for the daughter in 1 Adam & Eve 75:4 and 75:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-purification-forty-eighty'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 12:6 — *And when the days of her purifying are fulfilled, for a son, or for a daughter, she shall bring a lamb of the first year for a burnt offering, and a young pigeon, or a turtledove, for a sin offering, unto the door of the tabernacle of the congregation, unto the priest:* The offering brought when the days are fulfilled is the very offering Adam carries to the altar for Eve and the children in 1 Adam & Eve 75:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-purification-forty-eighty'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-75-abel-born-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* The birth of Abel named in 1 Adam & Eve 75:11 is the same second son Eve bears in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-abel-born-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân.* Jubilees, like 1 Adam & Eve 75:11, counts the daughters with the sons in this same primeval household.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-abel-born-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=11
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* After the children of 1 Adam & Eve 75:13, the kept seed of the woman runs not through Abel but through the appointed Seth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-abel-born-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-75-cave-treasures-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh of the Cave of Treasures whose tokens bless the children in 1 Adam & Eve 75:6 are the very gifts kept for the promised Saviour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-cave-treasures-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The constant offerings and blessings of Adam''s house in 1 Adam & Eve 75:10 are the same calling on the Name of Yahuah kept from the first generations.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae75_lookup sv, _session253_1ae75_lookup tv
 WHERE t.slug='1-adam-eve-75-cave-treasures-blessing'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=75 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

