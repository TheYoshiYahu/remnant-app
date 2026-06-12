-- ----- fragment: minion_ecclesiasticus_20.sql (session253 ecclesiasticus 20) -----
-- Source anchor: apocrypha/ecclesiasticus ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir20 (view _session253_sir20_lookup). Sort band base 58775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-20-silence-found-wise
  ('apocrypha', 'ecclesiasticus', 20, 5, 'canon', 'proverbs', 17, 28, 'free', E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The same paradox Ben Sira sets down in Sirach 20:5 — silence itself confers the appearance, and the substance, of wisdom.'),
  ('apocrypha', 'ecclesiasticus', 20, 6, 'canon', 'ecclesiastes', 3, 7, 'free', E'Ecclesiastes 3:7 — *A time to rend, and a time to sew; a time to keep silence, and a time to speak;* the Preacher''s appointed season for silence is exactly the man who in Sirach 20:6 keepeth silence, knowing his time.'),
  ('apocrypha', 'ecclesiasticus', 20, 5, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* James inherits Ben Sira''s wisdom of the bridled tongue against the much babbling that becometh hateful in Sirach 20:5.'),
  -- thread: ecclesiasticus-20-word-in-season
  ('apocrypha', 'ecclesiasticus', 20, 7, 'canon', 'proverbs', 15, 23, 'free', E'Proverbs 15:23 — *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* Solomon''s praise of the timely word is Ben Sira''s wise man of Sirach 20:7 who holds his tongue till he see opportunity.'),
  ('apocrypha', 'ecclesiasticus', 20, 20, 'canon', 'proverbs', 25, 11, 'free', E'Proverbs 25:11 — *A word fitly spoken is like apples of gold in pictures of silver.* The fitness of speech that Solomon prizes is the due season Ben Sira''s fool fails in Sirach 20:20, rejecting even a wise sentence by speaking it untimely.'),
  ('apocrypha', 'ecclesiasticus', 20, 8, 'canon', 'proverbs', 10, 19, 'free', E'Proverbs 10:19 — *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* The man who useth many words and is abhorred in Sirach 20:8 is the multitude-of-words wherein sin is not wanting.'),
  -- thread: ecclesiasticus-20-lie-foul-blot
  ('apocrypha', 'ecclesiasticus', 20, 24, 'canon', 'leviticus', 19, 11, 'free', E'Leviticus 19:11 — *Ye shall not steal, neither deal falsely, neither lie one to another.* The foul blot of the lie in Sirach 20:24 is forbidden in the same Holiness Code that frames Ben Sira''s whole ethic of the tongue.'),
  ('apocrypha', 'ecclesiasticus', 20, 26, 'canon', 'proverbs', 12, 22, 'free', E'Proverbs 12:22 — *Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight.* The liar''s dishonourable disposition and ever-present shame in Sirach 20:26 is the abomination Solomon sets against Yahuah''s delight in the truthful.'),
  ('apocrypha', 'ecclesiasticus', 20, 25, 'canon', 'revelation', 21, 27, 'free', E'Revelation 21:27 — *And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb’s book of life.* The thief and the liar who in Sirach 20:25 have destruction to heritage are barred from the New Jerusalem, where no maker of a lie enters.'),
  -- thread: ecclesiasticus-20-gift-of-a-fool
  ('apocrypha', 'ecclesiasticus', 20, 14, 'canon', 'proverbs', 23, 6, 'free', E'Proverbs 23:6 — *Eat thou not the bread of him that hath an evil eye, neither desire thou his dainty meats:* the envious giver of Sirach 20:14, who looketh to receive many things for one, is Solomon''s man of the evil eye whose gift profits nothing.'),
  ('apocrypha', 'ecclesiasticus', 20, 15, 'canon', '2-corinthians', 9, 7, 'free', E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Against the grudging giver of Sirach 20:15 who gives little and upbraideth much, Paul sets the cheerful giver Yahuah loves.'),
  -- thread: ecclesiasticus-20-wisdom-hid-treasure-hoarded
  ('apocrypha', 'ecclesiasticus', 20, 30, 'canon', 'matthew', 5, 15, 'free', E'Matthew 5:15 — *Neither do men light a candle, and put it under a bushel, but on a candlestick; and it giveth light unto all that are in the house.* The hidden wisdom that yields no profit in Sirach 20:30 is the Messiah''s candle that must not be put under a bushel.'),
  ('apocrypha', 'ecclesiasticus', 20, 30, 'canon', 'matthew', 25, 18, 'free', E'Matthew 25:18 — *But he that had received one went and digged in the earth, and hid his lord’s money.* The treasure hoarded up to no profit in Sirach 20:30 is the buried talent of the slothful servant in the Messiah''s parable.'),
  ('apocrypha', 'ecclesiasticus', 20, 32, 'canon', 'proverbs', 3, 5, 'free', E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The necessary patience in seeking Yahuah that Ben Sira commends in Sirach 20:32, over the man without a guide, is Solomon''s trust in Yahuah rather than one''s own understanding.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-20-silence-found-wise',
       E'He that holdeth his tongue, and is found wise',
       E'Ben Sira opens the chapter on the discipline of the closed mouth: *There is one that keepeth silence, and is found wise: and another by much babbling becometh hateful.* (Ecclesiasticus 20:5), and again, *Some man holdeth his tongue, because he has not to answer: and some keepeth silence, knowing his time.* (Ecclesiasticus 20:6). This is the very proverb of Solomon: *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* (Proverbs 17:28). The Preacher knew the season of it — *A time to keep silence, and a time to speak* (Ecclesiastes 3:7) — and James gathered the whole wisdom stream into one command: *let every man be swift to hear, slow to speak, slow to wrath* (James 1:19). It ain''t new: the restraint of the tongue is the old covenant wisdom unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 58775
  FROM _session253_sir20_lookup sv, _session253_sir20_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-20-word-in-season',
       E'A wise man will hold his tongue till he see opportunity',
       E'The wise man waits for the fit moment to speak: *A wise man will hold his tongue till he see opportunity: but a babbler and a fool will regard no time.* (Ecclesiasticus 20:7), for *A wise sentence shall be rejected when it comes out of a fool''s mouth; for he will not speak it in due season.* (Ecclesiasticus 20:20). Solomon weighed the same scale: *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* (Proverbs 15:23), and *A word fitly spoken is like apples of gold in pictures of silver.* (Proverbs 25:11). The worth of speech is not in its quantity but in its timing — the gold set in its proper silver. It ain''t new: seasonable speech is the wisdom of the Tanakh.',
       sv.verse_id, ev.verse_id, 'extras', 58778
  FROM _session253_sir20_lookup sv, _session253_sir20_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=20 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-20-lie-foul-blot',
       E'A lie is a foul blot in a man',
       E'Ben Sira marks the liar''s shame: *A lie is a foul blot in a man, yet it is continually in the mouth of the untaught.* (Ecclesiasticus 20:24), and *The disposition of a liar is dishonourable, and his shame is ever with him.* (Ecclesiasticus 20:26). The Torah forbids it at the root — *Ye shall not steal, neither deal falsely, neither lie one to another.* (Leviticus 19:11) — and Solomon names it an abomination: *Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight.* (Proverbs 12:22). The deceitful tongue is no light thing but a blot upon the man and a thing abhorred of Yahuah. It ain''t new: truth-telling is the old commandment kept.',
       sv.verse_id, ev.verse_id, 'extras', 58781
  FROM _session253_sir20_lookup sv, _session253_sir20_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=20 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-20-gift-of-a-fool',
       E'The gift of a fool shall do you no good',
       E'Ben Sira weighs giving by the heart behind it: *The gift of a fool shall do you no good when you have it; neither yet of the envious for his necessity: for he looketh to receive many things for one.* (Ecclesiasticus 20:14), and the grudging giver *gives little, and upbraideth much* (Ecclesiasticus 20:15). Solomon warns of the same begrudged bread: *Eat thou not the bread of him that hath an evil eye, neither desire thou his dainty meats* (Proverbs 23:6). Paul gathers the wisdom to its head — *God loveth a cheerful giver* (2 Corinthians 9:7) — for the worth of a gift is the eye that gives it, not the thing given. It ain''t new: the cheerful, single eye in giving is the old wisdom.',
       sv.verse_id, ev.verse_id, 'extras', 58784
  FROM _session253_sir20_lookup sv, _session253_sir20_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=20 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-20-wisdom-hid-treasure-hoarded',
       E'Wisdom that is hid — what profit is in it?',
       E'Ben Sira closes the chapter on hidden wisdom and necessary patience: *Wisdom that is hid, and treasure that is hoarded up, what profit is in them both?* (Ecclesiasticus 20:30), and *Necessary patience in seeking Yahuah (God) is better than he that leadeth his life without a guide.* (Ecclesiasticus 20:32). The Messiah taught the same in His parables of the light not to be hid and the talent not to be buried: *Neither do men light a candle, and put it under a bushel, but on a candlestick; and it giveth light unto all that are in the house.* (Matthew 5:15), and the wicked servant who *went and digged in the earth, and hid his lord’s money* (Matthew 25:18) is condemned for the hoarding Ben Sira names unprofitable. Wisdom is given to be spent in the seeking of Yahuah. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58787
  FROM _session253_sir20_lookup sv, _session253_sir20_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=20 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-20-silence-found-wise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The same paradox Ben Sira sets down in Sirach 20:5 — silence itself confers the appearance, and the substance, of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-silence-found-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 3:7 — *A time to rend, and a time to sew; a time to keep silence, and a time to speak;* the Preacher''s appointed season for silence is exactly the man who in Sirach 20:6 keepeth silence, knowing his time.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-silence-found-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* James inherits Ben Sira''s wisdom of the bridled tongue against the much babbling that becometh hateful in Sirach 20:5.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-silence-found-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-20-word-in-season
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 15:23 — *A man hath joy by the answer of his mouth: and a word spoken in due season, how good is it!* Solomon''s praise of the timely word is Ben Sira''s wise man of Sirach 20:7 who holds his tongue till he see opportunity.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-word-in-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 25:11 — *A word fitly spoken is like apples of gold in pictures of silver.* The fitness of speech that Solomon prizes is the due season Ben Sira''s fool fails in Sirach 20:20, rejecting even a wise sentence by speaking it untimely.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-word-in-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 10:19 — *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* The man who useth many words and is abhorred in Sirach 20:8 is the multitude-of-words wherein sin is not wanting.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-word-in-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-20-lie-foul-blot
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:11 — *Ye shall not steal, neither deal falsely, neither lie one to another.* The foul blot of the lie in Sirach 20:24 is forbidden in the same Holiness Code that frames Ben Sira''s whole ethic of the tongue.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-lie-foul-blot'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 12:22 — *Lying lips are abomination to Yahuah (LORD): but they that deal truly are his delight.* The liar''s dishonourable disposition and ever-present shame in Sirach 20:26 is the abomination Solomon sets against Yahuah''s delight in the truthful.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-lie-foul-blot'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:27 — *And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb’s book of life.* The thief and the liar who in Sirach 20:25 have destruction to heritage are barred from the New Jerusalem, where no maker of a lie enters.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-lie-foul-blot'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-20-gift-of-a-fool
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:6 — *Eat thou not the bread of him that hath an evil eye, neither desire thou his dainty meats:* the envious giver of Sirach 20:14, who looketh to receive many things for one, is Solomon''s man of the evil eye whose gift profits nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-gift-of-a-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 9:7 — *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver.* Against the grudging giver of Sirach 20:15 who gives little and upbraideth much, Paul sets the cheerful giver Yahuah loves.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-gift-of-a-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-20-wisdom-hid-treasure-hoarded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:15 — *Neither do men light a candle, and put it under a bushel, but on a candlestick; and it giveth light unto all that are in the house.* The hidden wisdom that yields no profit in Sirach 20:30 is the Messiah''s candle that must not be put under a bushel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-wisdom-hid-treasure-hoarded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:18 — *But he that had received one went and digged in the earth, and hid his lord’s money.* The treasure hoarded up to no profit in Sirach 20:30 is the buried talent of the slothful servant in the Messiah''s parable.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-wisdom-hid-treasure-hoarded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The necessary patience in seeking Yahuah that Ben Sira commends in Sirach 20:32, over the man without a guide, is Solomon''s trust in Yahuah rather than one''s own understanding.'
  FROM cross_reference_threads t, cross_references x, _session253_sir20_lookup sv, _session253_sir20_lookup tv
 WHERE t.slug='ecclesiasticus-20-wisdom-hid-treasure-hoarded'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=20 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

