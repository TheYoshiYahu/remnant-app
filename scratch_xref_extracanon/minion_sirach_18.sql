-- ----- fragment: minion_ecclesiasticus_18.sql (session253 ecclesiasticus 18) -----
-- Source anchor: apocrypha/ecclesiasticus ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir18 (view _session253_sir18_lookup). Sort band base 58725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-18-a-thousand-years
  ('apocrypha', 'ecclesiasticus', 18, 10, 'canon', 'psalms', 90, 4, 'free', E'Psalm 90:4 — *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night.* The Psalmist measures a thousand years against the Eternal exactly as Sirach 18:10 measures it a drop to the sea.'),
  ('apocrypha', 'ecclesiasticus', 18, 10, 'canon', '2-peter', 3, 8, 'free', E'2 Peter 3:8 — *But, beloved, be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day.* Kepha carries Sirach 18:10''s eternity-scale into the patience of the LORD before the day of judgment.'),
  ('apocrypha', 'ecclesiasticus', 18, 9, 'canon', 'psalms', 103, 15, 'free', E'Psalm 103:15 — *As for man, his days are as grass: as a flower of the field, so he flourisheth.* The hundred-year span of Sirach 18:9 is the same flower-of-the-field brevity the Psalmist sings.'),
  ('apocrypha', 'ecclesiasticus', 18, 9, 'canon', 'psalms', 103, 16, 'free', E'Psalm 103:16 — *For the wind passeth over it, and it is gone; and the place thereof shall know it no more.* Man''s few days in Sirach 18:9 pass like grass over which the wind blows and is gone.'),
  -- thread: ecclesiasticus-18-mercy-on-all-flesh
  ('apocrypha', 'ecclesiasticus', 18, 13, 'canon', 'psalms', 145, 9, 'free', E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* This is the mercy-upon-all-flesh of Sirach 18:13 word for word — tender mercies over all His works.'),
  ('apocrypha', 'ecclesiasticus', 18, 13, 'canon', 'psalms', 103, 13, 'free', E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The shepherd-mercy of Sirach 18:13 is the Father''s pity the Psalmist sings.'),
  ('apocrypha', 'ecclesiasticus', 18, 14, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The discipline received in Sirach 18:14 is the Father''s loving chastening, not curse — He has mercy on them that receive it.'),
  ('apocrypha', 'ecclesiasticus', 18, 14, 'canon', 'proverbs', 3, 12, 'free', E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* Mishle is the wellspring of Sirach 18:14''s mercy on them that receive discipline.'),
  ('apocrypha', 'ecclesiasticus', 18, 13, 'canon', 'lamentations', 3, 22, 'free', E'Lamentations 3:22 — *It is of the LORD’S mercies that we are not consumed, because his compassions fail not.* The mercy upon all flesh in Sirach 18:13 is the unfailing compassion that keeps Yashar''el from being consumed.'),
  -- thread: ecclesiasticus-18-word-better-than-gift
  ('apocrypha', 'ecclesiasticus', 18, 15, 'canon', 'matthew', 6, 2, 'free', E'Matthew 6:2 — *Therefore when thou doest thine alms, do not sound a trumpet before thee, as the hypocrites do in the synagogues and in the streets, that they may have glory of men.* The trumpeted alms is the blemished good deed Sirach 18:15 warns against.'),
  ('apocrypha', 'ecclesiasticus', 18, 15, 'canon', 'matthew', 6, 3, 'free', E'Matthew 6:3 — *But when thou doest alms, let not thy left hand know what thy right hand doeth.* Yahusha''s hidden alms is Sirach 18:15''s unblemished giving without uncomfortable words.'),
  ('apocrypha', 'ecclesiasticus', 18, 17, 'canon', 'proverbs', 18, 21, 'free', E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* A gracious word better than a gift in Sirach 18:17 trades on the tongue''s life-and-death power Mishle weighs.'),
  ('apocrypha', 'ecclesiasticus', 18, 15, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The same restored-library wisdom: give without the envious eye that blemishes the deed in Sirach 18:15.'),
  -- thread: ecclesiasticus-18-vow-prayer
  ('apocrypha', 'ecclesiasticus', 18, 22, 'canon', 'ecclesiastes', 5, 4, 'free', E'Ecclesiastes 5:4 — *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed.* Qoheleth''s defer-not-thy-vow is the very law Sirach 18:22 echoes — pay in due time, defer not till death.'),
  ('apocrypha', 'ecclesiasticus', 18, 22, 'canon', 'ecclesiastes', 5, 5, 'free', E'Ecclesiastes 5:5 — *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay.* The unpaid vow Sirach 18:22 forbids is the very fault Qoheleth names worse than never vowing.'),
  ('apocrypha', 'ecclesiasticus', 18, 19, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath.* Ya''akov''s swift-to-hear is Sirach 18:19''s learn-before-you-speak in the same wisdom stream.'),
  ('apocrypha', 'ecclesiasticus', 18, 19, 'canon', 'proverbs', 18, 13, 'free', E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* Mishle is the source of Sirach 18:19''s counsel to learn before you speak.'),
  ('apocrypha', 'ecclesiasticus', 18, 23, 'canon', 'matthew', 26, 41, 'free', E'Matthew 26:41 — *Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak.* Preparing before prayer in Sirach 18:23 is Yahusha''s watch-and-pray, not the presumption that tempts the LORD.'),
  -- thread: ecclesiasticus-18-remember-hunger-refrain-lusts
  ('apocrypha', 'ecclesiasticus', 18, 25, 'canon', 'luke', 12, 19, 'free', E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool''s ease is the very forgetfulness Sirach 18:25 warns against — when full, remember the time of hunger.'),
  ('apocrypha', 'ecclesiasticus', 18, 25, 'canon', 'luke', 12, 21, 'free', E'Luke 12:21 — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* Yahusha''s verdict on the fool is Sirach 18:25''s counsel: in riches think upon poverty and need.'),
  ('apocrypha', 'ecclesiasticus', 18, 30, 'canon', 'galatians', 5, 16, 'free', E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* Sha''ul''s Spirit-walk is Sirach 18:30''s refrain-thyself-from-thy-appetites.'),
  ('apocrypha', 'ecclesiasticus', 18, 33, 'canon', 'romans', 13, 14, 'free', E'Romans 13:14 — *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* The borrowed banqueting that ensnares the soul in Sirach 18:33 is the flesh-provision Sha''ul forbids.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-18-a-thousand-years',
       E'A drop to the sea — a thousand years to eternity',
       E'Yeshua ben Sira measures man against the Everlasting: *He that lives for ever Has created all things in general* (Ecclesiasticus 18:1), and *The number of a man’s days at the most are an hundred years* (Ecclesiasticus 18:9), so that *As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity* (Ecclesiasticus 18:10). It ain''t new — the Psalmist sang it first: *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night* (Psalm 90:4), and Kepha carries the same scale into the day of the LORD: *But, beloved, be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* (2 Peter 3:8). Against eternity our days are grass: *As for man, his days are as grass: as a flower of the field, so he flourisheth* (Psalm 103:15) — *For the wind passeth over it, and it is gone; and the place thereof shall know it no more* (Psalm 103:16). The same Wisdom that frames creation here frames time.',
       sv.verse_id, ev.verse_id, 'extras', 58725
  FROM _session253_sir18_lookup sv, _session253_sir18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=18 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-18-mercy-on-all-flesh',
       E'The mercy of Yahuah is upon all flesh',
       E'The crown of the chapter: *The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock* (Ecclesiasticus 18:13) — *He has mercy on them that receive discipline, and that diligently seek after his judgments* (Ecclesiasticus 18:14). This is the measureless mercy of the Psalms: *Yahuah (LORD) is good to all: and his tender mercies are over all his works* (Psalm 145:9), and *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him* (Psalm 103:13). And the reproof Sira names is no curse but a Father''s love — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth* (Hebrews 12:6), the very word Mishle gave: *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:12). The same shepherd who reproveth gathers His flock again.',
       sv.verse_id, ev.verse_id, 'extras', 58728
  FROM _session253_sir18_lookup sv, _session253_sir18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-18-word-better-than-gift',
       E'A word better than a gift — alms without blemish',
       E'Sira''s wisdom on giving anticipates the Sermon: *My son, blemish not your good deeds, neither use uncomfortable words when you give any thing* (Ecclesiasticus 18:15), for *Lo, is not a word better than a gift? but both are with a gracious man* (Ecclesiasticus 18:17). Yahusha would say the alms that is trumpeted is blemished: *Therefore when thou doest thine alms, do not sound a trumpet before thee, as the hypocrites do in the synagogues and in the streets, that they may have glory of men* (Matthew 6:2) — *But when thou doest alms, let not thy left hand know what thy right hand doeth* (Matthew 6:3). And a word better than a gift is the tongue''s life-power Mishle weighs: *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof* (Proverbs 18:21). The same almsgiving-wisdom runs through the restored library — Tobit teaches his son: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7).',
       sv.verse_id, ev.verse_id, 'extras', 58731
  FROM _session253_sir18_lookup sv, _session253_sir18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=18 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-18-vow-prayer',
       E'Pay thy vow, prepare before prayer',
       E'Sira binds the vow and the prayer: *Let nothing hinder you to pay your vow in due time, and defer not until death to be justified* (Ecclesiasticus 18:22), and *Before you prayest, prepare thyself; and be not as one that tempteth Yahuah (God)* (Ecclesiasticus 18:23). Qoheleth gave the law of the vow first: *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed* (Ecclesiastes 5:4) — *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5). And to learn before you speak (18:19) and prepare before prayer is the Sermon''s caution and Ya''akov''s word: *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath* (James 1:19); *He that answereth a matter before he heareth it, it is folly and shame unto him* (Proverbs 18:13). Watchfulness, not presumption, comes before the throne — *Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak* (Matthew 26:41).',
       sv.verse_id, ev.verse_id, 'extras', 58734
  FROM _session253_sir18_lookup sv, _session253_sir18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=18 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-18-remember-hunger-refrain-lusts',
       E'Remember the time of hunger; refrain thy lusts',
       E'Sira closes against the fool''s false security and the flesh''s appetite: *When you have enough, remember the time of hunger: and when you are rich, think upon poverty and need* (Ecclesiasticus 18:25), and *Go not after your lusts, but refrain thyself from your appetites* (Ecclesiasticus 18:30). This is the rich fool whom Yahusha unmasked, who said to his soul, *take thine ease, eat, drink, and be merry* (Luke 12:19), of whom Elohim said, *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20) — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21). And to refrain the appetite is the Spirit-walk Sha''ul names: *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh* (Galatians 5:16). The wise man fears in every thing (18:27) and remembers that all his goods are soon spent before the LORD.',
       sv.verse_id, ev.verse_id, 'extras', 58737
  FROM _session253_sir18_lookup sv, _session253_sir18_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=18 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-18-a-thousand-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 90:4 — *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night.* The Psalmist measures a thousand years against the Eternal exactly as Sirach 18:10 measures it a drop to the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-a-thousand-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:8 — *But, beloved, be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day.* Kepha carries Sirach 18:10''s eternity-scale into the patience of the LORD before the day of judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-a-thousand-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 103:15 — *As for man, his days are as grass: as a flower of the field, so he flourisheth.* The hundred-year span of Sirach 18:9 is the same flower-of-the-field brevity the Psalmist sings.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-a-thousand-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 103:16 — *For the wind passeth over it, and it is gone; and the place thereof shall know it no more.* Man''s few days in Sirach 18:9 pass like grass over which the wind blows and is gone.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-a-thousand-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-18-mercy-on-all-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* This is the mercy-upon-all-flesh of Sirach 18:13 word for word — tender mercies over all His works.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-mercy-on-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:13 — *Like as a father pitieth his children, so Yahuah (LORD) pitieth them that fear him.* The shepherd-mercy of Sirach 18:13 is the Father''s pity the Psalmist sings.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-mercy-on-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The discipline received in Sirach 18:14 is the Father''s loving chastening, not curse — He has mercy on them that receive it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-mercy-on-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* Mishle is the wellspring of Sirach 18:14''s mercy on them that receive discipline.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-mercy-on-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Lamentations 3:22 — *It is of the LORD’S mercies that we are not consumed, because his compassions fail not.* The mercy upon all flesh in Sirach 18:13 is the unfailing compassion that keeps Yashar''el from being consumed.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-mercy-on-all-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-18-word-better-than-gift
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:2 — *Therefore when thou doest thine alms, do not sound a trumpet before thee, as the hypocrites do in the synagogues and in the streets, that they may have glory of men.* The trumpeted alms is the blemished good deed Sirach 18:15 warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-word-better-than-gift'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:3 — *But when thou doest alms, let not thy left hand know what thy right hand doeth.* Yahusha''s hidden alms is Sirach 18:15''s unblemished giving without uncomfortable words.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-word-better-than-gift'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* A gracious word better than a gift in Sirach 18:17 trades on the tongue''s life-and-death power Mishle weighs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-word-better-than-gift'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The same restored-library wisdom: give without the envious eye that blemishes the deed in Sirach 18:15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-word-better-than-gift'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-18-vow-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 5:4 — *When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed.* Qoheleth''s defer-not-thy-vow is the very law Sirach 18:22 echoes — pay in due time, defer not till death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-vow-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 5:5 — *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay.* The unpaid vow Sirach 18:22 forbids is the very fault Qoheleth names worse than never vowing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-vow-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath.* Ya''akov''s swift-to-hear is Sirach 18:19''s learn-before-you-speak in the same wisdom stream.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-vow-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* Mishle is the source of Sirach 18:19''s counsel to learn before you speak.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-vow-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 26:41 — *Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak.* Preparing before prayer in Sirach 18:23 is Yahusha''s watch-and-pray, not the presumption that tempts the LORD.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-vow-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-18-remember-hunger-refrain-lusts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool''s ease is the very forgetfulness Sirach 18:25 warns against — when full, remember the time of hunger.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-remember-hunger-refrain-lusts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:21 — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* Yahusha''s verdict on the fool is Sirach 18:25''s counsel: in riches think upon poverty and need.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-remember-hunger-refrain-lusts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 5:16 — *This I say then, Walk in the Spirit, and ye shall not fulfil the lust of the flesh.* Sha''ul''s Spirit-walk is Sirach 18:30''s refrain-thyself-from-thy-appetites.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-remember-hunger-refrain-lusts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 13:14 — *But put ye on the Lord Yahusha HaMashiach (Lord Jesus Christ), and make not provision for the flesh, to fulfil the lusts thereof.* The borrowed banqueting that ensnares the soul in Sirach 18:33 is the flesh-provision Sha''ul forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir18_lookup sv, _session253_sir18_lookup tv
 WHERE t.slug='ecclesiasticus-18-remember-hunger-refrain-lusts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=18 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

