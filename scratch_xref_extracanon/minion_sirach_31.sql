-- ----- fragment: minion_ecclesiasticus_31.sql (session253 ecclesiasticus 31) -----
-- Source anchor: apocrypha/ecclesiasticus ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir31 (view _session253_sir31_lookup). Sort band base 59050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-31-love-of-gold
  ('apocrypha', 'ecclesiasticus', 31, 5, 'canon', '1-timothy', 6, 10, 'free', E'1 Timothy 6:10 — *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.* Paul''s most-quoted line on greed is Ben Sira''s verdict on him that loves gold in Sirach 31:5.'),
  ('apocrypha', 'ecclesiasticus', 31, 1, 'canon', '1-timothy', 6, 9, 'free', E'1 Timothy 6:9 — *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition.* The snare that drowns men echoes the riches-care that consumeth the flesh in Sirach 31:1.'),
  ('apocrypha', 'ecclesiasticus', 31, 1, 'canon', 'ecclesiastes', 5, 12, 'free', E'Ecclesiastes 5:12 — *The sleep of a labouring man is sweet, whether he eat little or much: but the abundance of the rich will not suffer him to sleep.* The Preacher''s sleepless rich man is exactly the watching care that drives away sleep in Sirach 31:1.'),
  ('apocrypha', 'ecclesiasticus', 31, 5, 'canon', 'ecclesiastes', 5, 10, 'free', E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* The never-satisfied lover of silver is Ben Sira''s man who loves gold and shall not be justified in Sirach 31:5.'),
  ('apocrypha', 'ecclesiasticus', 31, 6, 'apocrypha', 'ecclesiasticus', 8, 2, 'extras', E'Ecclesiasticus 8:2 — *Be not at variance with a rich man, lest he overweigh you: for gold has destroyed many, and perverted the hearts of kings.* Ben Sira''s own self-witness — gold has destroyed many — doubles the ruin of many in Sirach 31:6.'),
  -- thread: ecclesiasticus-31-blessed-rich-without-blemish
  ('apocrypha', 'ecclesiasticus', 31, 8, 'canon', 'deuteronomy', 8, 14, 'free', E'Deuteronomy 8:14 — *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage.* The forgetting heart lifted up by wealth is the blemish Sira''s blessed rich man has escaped in Sirach 31:8.'),
  ('apocrypha', 'ecclesiasticus', 31, 8, 'canon', '1-timothy', 6, 17, 'free', E'1 Timothy 6:17 — *Charge them that are rich in this world, that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy.* Paul''s charge to the rich is Ben Sira''s blessing on the rich found without blemish in Sirach 31:8.'),
  ('apocrypha', 'ecclesiasticus', 31, 10, 'canon', 'job', 1, 1, 'free', E'Job 1:1 — *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* Job is the wealthy man tried thereby and found perfect that Sirach 31:10 asks after.'),
  ('apocrypha', 'ecclesiasticus', 31, 10, 'canon', 'job', 31, 24, 'free', E'Job 31:24 — *If I have made gold my hope, or have said to the fine gold, Thou art my confidence.* Job''s oath that he never made gold his hope is the proof of the rich man who has not gone after gold in Sirach 31:10.'),
  -- thread: ecclesiasticus-31-table-manners-gluttony
  ('apocrypha', 'ecclesiasticus', 31, 12, 'canon', 'proverbs', 23, 2, 'free', E'Proverbs 23:2 — *And put a knife to thy throat, if thou be a man given to appetite.* Solomon''s knife-to-the-throat at the ruler''s table is Ben Sira''s be not greedy at the bountiful table in Sirach 31:12.'),
  ('apocrypha', 'ecclesiasticus', 31, 16, 'canon', 'proverbs', 25, 16, 'free', E'Proverbs 25:16 — *Hast thou found honey? eat so much as is sufficient for thee, lest thou be filled therewith, and vomit it.* Eat only what is sufficient, lest you vomit, is exactly Sira''s eat as becometh a man, and devour not in Sirach 31:16.'),
  ('apocrypha', 'ecclesiasticus', 31, 17, 'canon', 'proverbs', 23, 21, 'free', E'Proverbs 23:21 — *For the drunkard and the glutton shall come to poverty: and drowsiness shall clothe a man with rags.* The glutton''s poverty is the unsatiable man Sira warns will give offence in Sirach 31:17.'),
  -- thread: ecclesiasticus-31-wine-maketh-glad
  ('apocrypha', 'ecclesiasticus', 31, 27, 'canon', 'psalms', 104, 15, 'free', E'Psalm 104:15 — *And wine that maketh glad the heart of man, and oil to make his face to shine, and bread which strengtheneth man’s heart.* The wine that maketh glad the heart is the very gladness of the heart Sira names in Sirach 31:27-28, wine made to make men glad.'),
  ('apocrypha', 'ecclesiasticus', 31, 27, 'canon', 'proverbs', 21, 17, 'free', E'Proverbs 21:17 — *He that loveth pleasure shall be a poor man: he that loveth wine and oil shall not be rich.* Solomon''s counterweight to the cup balances Ben Sira''s if it be drunk moderately in Sirach 31:27.'),
  -- thread: ecclesiasticus-31-drunkenness-excess
  ('apocrypha', 'ecclesiasticus', 31, 29, 'canon', 'proverbs', 23, 29, 'free', E'Proverbs 23:29 — *Who hath woe? who hath sorrow? who hath contentions? who hath babbling? who hath wounds without cause? who hath redness of eyes?* Solomon''s catalogue of woe is the bitterness, brawling and quarrelling of excess in Sirach 31:29.'),
  ('apocrypha', 'ecclesiasticus', 31, 30, 'canon', 'proverbs', 23, 32, 'free', E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* The serpent''s sting at the cup''s bottom is the wounds drunkenness makes in Sirach 31:30.'),
  ('apocrypha', 'ecclesiasticus', 31, 30, 'canon', '1-corinthians', 6, 10, 'free', E'1 Corinthians 6:10 — *Nor thieves, nor covetous, nor drunkards, nor revilers, nor extortioners, shall inherit the kingdom of Elohim (God).* Paul shuts the drunkard out of the kingdom, the fool whose rage drunkenness increaseth in Sirach 31:30.'),
  ('apocrypha', 'ecclesiasticus', 31, 29, 'canon', 'ephesians', 5, 18, 'free', E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit.* Paul names the very wine drunken with excess Sira warns of in Sirach 31:29 and points past it to the fuller cup.'),
  ('apocrypha', 'ecclesiasticus', 31, 30, 'canon', 'luke', 21, 34, 'free', E'Luke 21:34 — *And take heed to yourselves, lest at any time your hearts be overcharged with surfeiting, and drunkenness, and cares of this life, and so that day come upon you unawares.* The Master''s warning against the overcharged heart is Ben Sira''s drunkenness that diminisheth strength in Sirach 31:30.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-31-love-of-gold',
       E'Watching for riches consumeth the flesh — gold the ruin of many',
       E'Ben Sira opens the chapter with the sleepless burden of wealth: *Watching for riches consumeth the flesh, and the care thereof drives away sleep* (Ecclesiasticus 31:1), and he names its peril plainly — *He that loves gold shall not be justified, and he that followeth corruption shall have enough thereof* (Ecclesiasticus 31:5), for *Gold has been the ruin of many, and their destruction was present* (Ecclesiasticus 31:6). It ain''t new — this is Paul to Timothy: *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition* (1 Timothy 6:9), and *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows* (1 Timothy 6:10). The Preacher already knew the empty chase — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity* (Ecclesiastes 5:10) — and the sleeplessness Sira describes — *the abundance of the rich will not suffer him to sleep* (Ecclesiastes 5:12). Solomon warned against the same vanishing prize, and James saw the rich man fade like grass. Ben Sira himself doubles the witness elsewhere: *Be not at variance with a rich man, lest he overweigh you: for gold has destroyed many, and perverted the hearts of kings* (Ecclesiasticus 8:2). The wisdom-stream is one.',
       sv.verse_id, ev.verse_id, 'extras', 59050
  FROM _session253_sir31_lookup sv, _session253_sir31_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=31 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-31-blessed-rich-without-blemish',
       E'Blessed is the rich found without blemish — tried and found perfect',
       E'Sira does not curse wealth outright; he pronounces a rare beatitude on the man who holds it without idolatry: *Blessed is the rich that is found without blemish, and has not gone after gold* (Ecclesiasticus 31:8), *Who has been tried thereby, and found perfect? then let him glory* (Ecclesiasticus 31:10). This is the Torah test of the heart not lifted up by wealth: *And when thy herds and thy flocks multiply, and thy silver and thy gold is multiplied, and all that thou hast is multiplied; Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God)* (Deuteronomy 8:13-14). It is the man Paul charges — *that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God)* (1 Timothy 6:17). And it is Job, the wealthy man tried and found perfect: *that man was perfect and upright, and one that feared Elohim (God), and eschewed evil* (Job 1:1), who could swear *If I have made gold my hope, or have said to the fine gold, Thou art my confidence* (Job 31:24) he had not. The blessing is for the heart, not the purse.',
       sv.verse_id, ev.verse_id, 'extras', 59053
  FROM _session253_sir31_lookup sv, _session253_sir31_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=31 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-31-table-manners-gluttony',
       E'At the bountiful table — be not greedy, eat as becometh a man',
       E'Ben Sira turns from riches to the rich man''s table and gives wisdom on restraint: *If you sit at a bountiful table, be not greedy upon it, and say not, There is much meat on it* (Ecclesiasticus 31:12), *Eat as it becometh a man, those things which are set before you; and devour not, lest you be hated* (Ecclesiasticus 31:16), *Leave off first for manners’ sake; and be not unsatiable, lest you offend* (Ecclesiasticus 31:17). Word for word this is Proverbs at the ruler''s feast: *When thou sittest to eat with a ruler, consider diligently what is before thee: And put a knife to thy throat, if thou be a man given to appetite* (Proverbs 23:1-2). Solomon set the same measure on sweetness — *Hast thou found honey? eat so much as is sufficient for thee, lest thou be filled therewith, and vomit it* (Proverbs 25:16) — the very surfeit Sira warns will force a man to *arise, go forth, vomit* (Ecclesiasticus 31:21). And the glutton''s end is poverty: *For the drunkard and the glutton shall come to poverty: and drowsiness shall clothe a man with rags* (Proverbs 23:21). The same Torah-bred temperance, mouth to mouth.',
       sv.verse_id, ev.verse_id, 'extras', 59056
  FROM _session253_sir31_lookup sv, _session253_sir31_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=31 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-31-wine-maketh-glad',
       E'Wine measurably drunk bringeth gladness of the heart',
       E'Ben Sira does not condemn the cup; he weighs it: *Wine is as good as life to a man, if it be drunk moderately... for it was made to make men glad* (Ecclesiasticus 31:27), and *Wine measurably drunk and in season brings gladness of the heart, and cheerfulness of the mind* (Ecclesiasticus 31:28). This is the Psalmist''s gift from the Maker''s hand: *And wine that maketh glad the heart of man, and oil to make his face to shine, and bread which strengtheneth man’s heart* (Psalm 104:15) — wine, oil, and bread, the same triad. Yet the warning rides with the gift, for the love of pleasure beggars a man: *He that loveth pleasure shall be a poor man: he that loveth wine and oil shall not be rich* (Proverbs 21:17). The measure is everything; in season and moderate it gladdens, in excess it destroys.',
       sv.verse_id, ev.verse_id, 'extras', 59059
  FROM _session253_sir31_lookup sv, _session253_sir31_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=31 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-31-drunkenness-excess',
       E'Wine drunken with excess — drunkenness increaseth the rage of a fool',
       E'The same wine, taken without measure, turns to ruin: *But wine drunken with excess makes bitterness of the mind, with brawling and quarrelling* (Ecclesiasticus 31:29), *Drunkenness increaseth the rage of a fool till he offend: it diminisheth strength, and makes wounds* (Ecclesiasticus 31:30). It ain''t new — Solomon drew the whole portrait of the wine-tarrier: *Who hath woe? who hath sorrow? who hath contentions? who hath babbling? who hath wounds without cause? who hath redness of eyes? They that tarry long at the wine* (Proverbs 23:29-30), and the serpent''s sting at the bottom of the cup: *At the last it biteth like a serpent, and stingeth like an adder* (Proverbs 23:32). Paul puts drunkards among those shut out of the kingdom — *Nor thieves, nor covetous, nor drunkards, nor revilers, nor extortioners, shall inherit the kingdom of Elohim (God)* (1 Corinthians 6:10) — and points the redeemed to the fuller cup: *And be not drunk with wine, wherein is excess; but be filled with the Spirit* (Ephesians 5:18). Even the Master warns the heart not be overcharged with surfeiting and drunkenness lest the Day come unawares (Luke 21:34). Sira''s measured cup stands inside one unbroken counsel.',
       sv.verse_id, ev.verse_id, 'extras', 59062
  FROM _session253_sir31_lookup sv, _session253_sir31_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=31 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-31-love-of-gold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Timothy 6:10 — *For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.* Paul''s most-quoted line on greed is Ben Sira''s verdict on him that loves gold in Sirach 31:5.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-love-of-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 6:9 — *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition.* The snare that drowns men echoes the riches-care that consumeth the flesh in Sirach 31:1.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-love-of-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 5:12 — *The sleep of a labouring man is sweet, whether he eat little or much: but the abundance of the rich will not suffer him to sleep.* The Preacher''s sleepless rich man is exactly the watching care that drives away sleep in Sirach 31:1.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-love-of-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* The never-satisfied lover of silver is Ben Sira''s man who loves gold and shall not be justified in Sirach 31:5.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-love-of-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 8:2 — *Be not at variance with a rich man, lest he overweigh you: for gold has destroyed many, and perverted the hearts of kings.* Ben Sira''s own self-witness — gold has destroyed many — doubles the ruin of many in Sirach 31:6.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-love-of-gold'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-31-blessed-rich-without-blemish
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:14 — *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage.* The forgetting heart lifted up by wealth is the blemish Sira''s blessed rich man has escaped in Sirach 31:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-blessed-rich-without-blemish'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 6:17 — *Charge them that are rich in this world, that they be not highminded, nor trust in uncertain riches, but in the living Elohim (God), who giveth us richly all things to enjoy.* Paul''s charge to the rich is Ben Sira''s blessing on the rich found without blemish in Sirach 31:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-blessed-rich-without-blemish'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 1:1 — *There was a man in the land of Uz, whose name was Job; and that man was perfect and upright, and one that feared Elohim (God), and eschewed evil.* Job is the wealthy man tried thereby and found perfect that Sirach 31:10 asks after.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-blessed-rich-without-blemish'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 31:24 — *If I have made gold my hope, or have said to the fine gold, Thou art my confidence.* Job''s oath that he never made gold his hope is the proof of the rich man who has not gone after gold in Sirach 31:10.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-blessed-rich-without-blemish'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-31-table-manners-gluttony
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:2 — *And put a knife to thy throat, if thou be a man given to appetite.* Solomon''s knife-to-the-throat at the ruler''s table is Ben Sira''s be not greedy at the bountiful table in Sirach 31:12.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-table-manners-gluttony'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 25:16 — *Hast thou found honey? eat so much as is sufficient for thee, lest thou be filled therewith, and vomit it.* Eat only what is sufficient, lest you vomit, is exactly Sira''s eat as becometh a man, and devour not in Sirach 31:16.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-table-manners-gluttony'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 23:21 — *For the drunkard and the glutton shall come to poverty: and drowsiness shall clothe a man with rags.* The glutton''s poverty is the unsatiable man Sira warns will give offence in Sirach 31:17.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-table-manners-gluttony'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-31-wine-maketh-glad
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:15 — *And wine that maketh glad the heart of man, and oil to make his face to shine, and bread which strengtheneth man’s heart.* The wine that maketh glad the heart is the very gladness of the heart Sira names in Sirach 31:27-28, wine made to make men glad.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-wine-maketh-glad'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 21:17 — *He that loveth pleasure shall be a poor man: he that loveth wine and oil shall not be rich.* Solomon''s counterweight to the cup balances Ben Sira''s if it be drunk moderately in Sirach 31:27.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-wine-maketh-glad'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-31-drunkenness-excess
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:29 — *Who hath woe? who hath sorrow? who hath contentions? who hath babbling? who hath wounds without cause? who hath redness of eyes?* Solomon''s catalogue of woe is the bitterness, brawling and quarrelling of excess in Sirach 31:29.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-drunkenness-excess'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* The serpent''s sting at the cup''s bottom is the wounds drunkenness makes in Sirach 31:30.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-drunkenness-excess'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 6:10 — *Nor thieves, nor covetous, nor drunkards, nor revilers, nor extortioners, shall inherit the kingdom of Elohim (God).* Paul shuts the drunkard out of the kingdom, the fool whose rage drunkenness increaseth in Sirach 31:30.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-drunkenness-excess'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit.* Paul names the very wine drunken with excess Sira warns of in Sirach 31:29 and points past it to the fuller cup.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-drunkenness-excess'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 21:34 — *And take heed to yourselves, lest at any time your hearts be overcharged with surfeiting, and drunkenness, and cares of this life, and so that day come upon you unawares.* The Master''s warning against the overcharged heart is Ben Sira''s drunkenness that diminisheth strength in Sirach 31:30.'
  FROM cross_reference_threads t, cross_references x, _session253_sir31_lookup sv, _session253_sir31_lookup tv
 WHERE t.slug='ecclesiasticus-31-drunkenness-excess'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=31 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

