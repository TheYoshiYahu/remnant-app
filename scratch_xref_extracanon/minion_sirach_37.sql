-- ----- fragment: minion_ecclesiasticus_37.sql (session253 ecclesiasticus 37) -----
-- Source anchor: apocrypha/ecclesiasticus ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir37 (view _session253_sir37_lookup). Sort band base 59200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-37-friend-in-name-only
  ('apocrypha', 'ecclesiasticus', 37, 4, 'canon', 'proverbs', 17, 17, 'free', E'Proverbs 17:17 — *A friend loveth at all times, and a brother is born for adversity.* The true friend Sirach 37:4 contrasts with the companion who turns against you in the time of trouble.'),
  ('apocrypha', 'ecclesiasticus', 37, 1, 'canon', 'proverbs', 18, 24, 'free', E'Proverbs 18:24 — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* The proverb names the friend who is more than the name-only friend of Sirach 37:1.'),
  ('apocrypha', 'ecclesiasticus', 37, 1, 'apocrypha', 'ecclesiasticus', 6, 14, 'extras', E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* Ben Sira''s own earlier weighing of the faithful friend against the friend in name only of Sirach 37:1.'),
  ('apocrypha', 'ecclesiasticus', 37, 4, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The friend who does not turn in the time of trouble (Sirach 37:4) but lays down His life is the Messiah.'),
  -- thread: sirach-37-take-counsel-of-the-godly
  ('apocrypha', 'ecclesiasticus', 37, 12, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalm''s line between godly and ungodly counsel is exactly Ben Sira''s choice of the Torah-keeping counsellor in Sirach 37:12.'),
  ('apocrypha', 'ecclesiasticus', 37, 7, 'canon', 'proverbs', 11, 14, 'free', E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* The safety Sirach 37:7 seeks past the self-serving counsellor lies in the multitude of faithful counsel.'),
  ('apocrypha', 'ecclesiasticus', 37, 7, 'canon', 'proverbs', 15, 22, 'free', E'Proverbs 15:22 — *Without counsel purposes are disappointed: but in the multitude of counsellors they are established.* The established purpose Sirach 37:7 commends rests on sound, many-voiced counsel.'),
  ('apocrypha', 'ecclesiasticus', 37, 12, 'apocrypha', 'ecclesiasticus', 9, 14, 'extras', E'Ecclesiasticus 9:14 — *As near as you can, guess at your neighbour, and consult with the wise.* Ben Sira''s own earlier charge to consult the wise, repeated in the godly counsellor of Sirach 37:12.'),
  ('apocrypha', 'ecclesiasticus', 37, 8, 'apocrypha', 'tobit', 4, 18, 'extras', E'Tobit 4:18 — *Ask counsel of all that are wise, and despise not any counsel that is profitable.* Tobit''s wisdom-ethic matches Ben Sira''s warning to weigh the counsellor in Sirach 37:8.'),
  -- thread: sirach-37-counsel-of-the-heart-pray-most-high
  ('apocrypha', 'ecclesiasticus', 37, 13, 'canon', 'proverbs', 20, 5, 'free', E'Proverbs 20:5 — *Counsel in the heart of man is like deep water; but a man of understanding will draw it out.* The faithful counsel of the heart Ben Sira tells you to let stand in Sirach 37:13.'),
  ('apocrypha', 'ecclesiasticus', 37, 15, 'canon', 'proverbs', 16, 9, 'free', E'Proverbs 16:9 — *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps.* The heart counsels, but it is the Most High who directs the way — the prayer of Sirach 37:15.'),
  ('apocrypha', 'ecclesiasticus', 37, 15, 'canon', 'proverbs', 3, 6, 'free', E'Proverbs 3:6 — *In all thy ways acknowledge him, and he shall direct thy paths.* The directing of the way that Sirach 37:15 prays the Most High to grant.'),
  ('apocrypha', 'ecclesiasticus', 37, 13, 'canon', 'proverbs', 3, 5, 'free', E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The trusting heart set above (Sirach 37:13-15) under Yahuah''s direction, not its own understanding.'),
  ('apocrypha', 'ecclesiasticus', 37, 15, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The New Testament answer to Ben Sira''s charge to pray the Most High in Sirach 37:15.'),
  -- thread: sirach-37-wise-instructs-his-people
  ('apocrypha', 'ecclesiasticus', 37, 23, 'canon', 'james', 3, 13, 'free', E'James 3:13 — *Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom.* The wise man whose fruits fail not (Sirach 37:23) shows wisdom in works, not bare words.'),
  ('apocrypha', 'ecclesiasticus', 37, 23, 'canon', 'matthew', 12, 35, 'free', E'Matthew 12:35 — *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* The fruitful understanding of the wise teacher in Sirach 37:23 brings forth good treasure.'),
  ('apocrypha', 'ecclesiasticus', 37, 23, 'canon', 'matthew', 13, 52, 'free', E'Matthew 13:52 — *Then said he unto them, Therefore every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old.* — the instructed scribe who brings forth treasure new and old, the very figure of the wise man who instructs his people in Sirach 37:23.'),
  ('apocrypha', 'ecclesiasticus', 37, 24, 'canon', 'proverbs', 3, 5, 'free', E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The blessing that fills the wise man counted happy (Sirach 37:24) flows from trust in Yahuah above his own understanding.'),
  -- thread: sirach-37-days-of-israel-innumerable
  ('apocrypha', 'ecclesiasticus', 37, 25, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The Abrahamic promise behind the innumerable days of Israel in Sirach 37:25.'),
  ('apocrypha', 'ecclesiasticus', 37, 25, 'canon', 'deuteronomy', 1, 10, 'free', E'Deuteronomy 1:10 — *Yahuah Elohaychem (The LORD your God) hath multiplied you, and, behold, ye are this day as the stars of heaven for multitude.* The promise of Sirach 37:25 seen fulfilled in Israel multiplied at Sinai.'),
  ('apocrypha', 'ecclesiasticus', 37, 25, 'canon', 'jeremiah', 33, 21, 'free', E'Jeremiah 33:21 — *Then may also my covenant be broken with David my servant, that he should not have a son to reign upon his throne; and with the Levites the priests, my ministers.* The unbreakable covenant standing behind the innumerable days of Israel in Sirach 37:25 — election kept, not replaced.'),
  -- thread: sirach-37-temperance-surfeiting-shortens-life
  ('apocrypha', 'ecclesiasticus', 37, 29, 'canon', 'proverbs', 23, 20, 'free', E'Proverbs 23:20 — *Be not among winebibbers; among riotous eaters of flesh.* The proverb''s warning against gluttony stands behind Ben Sira''s charge not to be greedy upon meats in Sirach 37:29.'),
  ('apocrypha', 'ecclesiasticus', 37, 31, 'canon', 'luke', 21, 34, 'free', E'Luke 21:34 — *And take heed to yourselves, lest at any time your hearts be overcharged with surfeiting, and drunkenness, and cares of this life, and so that day come upon you unawares.* The Messiah binds the surfeiting that shortens life (Sirach 37:31) to watchfulness for the Day.'),
  ('apocrypha', 'ecclesiasticus', 37, 31, 'apocrypha', 'ecclesiasticus', 31, 20, 'extras', E'Ecclesiasticus 31:20 — *Sound sleep comes of moderate eating: he rises early, and his wits are with him: but the pain of watching, and choler, and pangs of the belly, are with an unsatiable man.* Ben Sira''s own earlier temperance teaching, repeated in Sirach 37:31.'),
  ('apocrypha', 'ecclesiasticus', 37, 30, 'canon', 'ecclesiastes', 5, 18, 'free', E'Ecclesiastes 5:18 — *Behold that which I have seen: it is good and comely for one to eat and to drink, and to enjoy the good of all his labour that he taketh under the sun all the days of his life, which Elohim (God) giveth him: for it is his portion.* The good portion received in moderation, the right use of the meats that in excess bring sickness in Sirach 37:30.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-37-friend-in-name-only',
       E'A friend in name only — the friend who fails in trouble',
       E'Ben Sira opens with the test of friendship: *Every friend says, I am his friend also: but there is a friend, which is only a friend in name* (Ecclesiasticus 37:1), and worse, *There is a companion, which rejoices in the prosperity of a friend, but in the time of trouble will be against him* (Ecclesiasticus 37:4). It ain''t new — the proverbs already sift the true friend from the flatterer. *A friend loveth at all times, and a brother is born for adversity* (Proverbs 17:17) sets the standard the name-only friend cannot meet, and *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother* (Proverbs 18:24) names the rare bond Ben Sira prizes. Sirach''s own earlier word seals it: *A faithfull friend is a strong defence: and he that has found such an one has found a treasure* (Ecclesiasticus 6:14). And the Messiah Himself sets the seal of the faithful friend who does not turn in the time of trouble but lays His life down: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13).',
       sv.verse_id, ev.verse_id, 'extras', 59200
  FROM _session253_sir37_lookup sv, _session253_sir37_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=37 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-37-take-counsel-of-the-godly',
       E'Take counsel of the godly, not of the self-serving',
       E'Ben Sira warns against the counsellor who counsels for himself: *Every counsellor extolleth counsel; but there is some that counselleth for himself* (Ecclesiasticus 37:7), and directs you instead to *be continually with a godly man, whom you know to keep the commandments of Yahuah (God), whose, mind is according to your mind* (Ecclesiasticus 37:12). It ain''t new — the first Psalm draws the same line: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalm 1:1). Wisdom is found in the multitude of the faithful: *Where no counsel is, the people fall: but in the multitude of counsellors there is safety* (Proverbs 11:14), and *Without counsel purposes are disappointed: but in the multitude of counsellors they are established* (Proverbs 15:22). The mark of the godly counsellor Ben Sira commends is Torah-keeping — *whom you know to keep the commandments of Yahuah* — never law-as-curse but the law that stands. Sirach''s neighbour-chapter says the same: *consult with the wise* (Ecclesiasticus 9:14).',
       sv.verse_id, ev.verse_id, 'extras', 59203
  FROM _session253_sir37_lookup sv, _session253_sir37_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=37 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-37-counsel-of-the-heart-pray-most-high',
       E'The counsel of the heart, and pray the Most High direct thy way',
       E'Ben Sira turns inward and upward: *let the counsel of your own heart stand: for there is no man more faithful to you than it* (Ecclesiasticus 37:13), yet — *above all this* — *pray to the Most High, that he will direct your way in truth* (Ecclesiasticus 37:15). It ain''t new: the heart deliberates, but Yahuah directs. *Counsel in the heart of man is like deep water; but a man of understanding will draw it out* (Proverbs 20:5) — the faithful counsel of the heart Ben Sira trusts. *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9) — the deviser plans, but the Most High orders the way. The whole posture is Proverbs 3: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5); *In all thy ways acknowledge him, and he shall direct thy paths* (Proverbs 3:6). And the New Testament answers Ben Sira''s prayer for wisdom directly: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 59206
  FROM _session253_sir37_lookup sv, _session253_sir37_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=37 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-37-wise-instructs-his-people',
       E'The wise man who instructs his people is blessed',
       E'Ben Sira praises the wise teacher whose wisdom is not barren: *A wise man instructs his people; and the fruits of his understanding fail not* (Ecclesiasticus 37:23), so that *A wise man shall be filled with blessing; and all they that see him shall count him happy* (Ecclesiasticus 37:24). It ain''t new — true wisdom is shown in works, not words. *Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom* (James 3:13). The fruit that fails not is the wisdom that bears: *out of the abundance of the heart the mouth speaketh* (Matthew 12:34), and *A good man out of the good treasure of the heart bringeth forth good things* (Matthew 12:35). The instructed scribe who brings forth this treasure is the very figure of Sirach''s next chapter on the law-meditating scribe — *every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old* (Matthew 13:52).',
       sv.verse_id, ev.verse_id, 'extras', 59209
  FROM _session253_sir37_lookup sv, _session253_sir37_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=37 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-37-days-of-israel-innumerable',
       E'The days of man are numbered, but the days of Israel are innumerable',
       E'In the midst of the wise-man passage Ben Sira sets a covenant marker: *The days of the life of man may be numbered: but the days of Yashar''el (Israel) are innumerable* (Ecclesiasticus 37:25). It ain''t new — this is the Abrahamic promise itself, the seed that cannot be counted. *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17). At Sinai it is fulfilled in sight: *Yahuah Elohaychem (The LORD your God) hath multiplied you, and, behold, ye are this day as the stars of heaven for multitude* (Deuteronomy 1:10). And the host of David and Levi is bound to the same uncountable seed: *As the host of heaven cannot be numbered, neither the sand of the sea measured: so will I multiply the seed of David my servant, and the Levites that minister unto me* (Jeremiah 33:22). The days of Israel are innumerable because election stands — the covenant seed is kept, never replaced.',
       sv.verse_id, ev.verse_id, 'extras', 59212
  FROM _session253_sir37_lookup sv, _session253_sir37_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=37 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-37-temperance-surfeiting-shortens-life',
       E'Temperance — surfeiting shortens life, the heedful prolongs it',
       E'Ben Sira closes with the wisdom of the table: *Be not unsatiable in any dainty thing, nor too greedy upon meats* (Ecclesiasticus 37:29), for *By surfeiting have many perished; but he that takes heed prolongeth his life* (Ecclesiasticus 37:31). It ain''t new — the proverbs warn the glutton: *Be not among winebibbers; among riotous eaters of flesh* (Proverbs 23:20). The Messiah Himself gives the same charge against surfeiting, and binds it to watchfulness for the Day: *And take heed to yourselves, lest at any time your hearts be overcharged with surfeiting, and drunkenness, and cares of this life, and so that day come upon you unawares* (Luke 21:34). The portion of meat and drink is good when received in moderation and as Elohim''s gift: *it is good and comely for one to eat and to drink, and to enjoy the good of all his labour... for it is his portion* (Ecclesiastes 5:18). Ben Sira''s own earlier table-wisdom says it plainly: *Sound sleep comes of moderate eating* (Ecclesiasticus 31:20).',
       sv.verse_id, ev.verse_id, 'extras', 59215
  FROM _session253_sir37_lookup sv, _session253_sir37_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=37 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-37-friend-in-name-only
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:17 — *A friend loveth at all times, and a brother is born for adversity.* The true friend Sirach 37:4 contrasts with the companion who turns against you in the time of trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-friend-in-name-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:24 — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* The proverb names the friend who is more than the name-only friend of Sirach 37:1.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-friend-in-name-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* Ben Sira''s own earlier weighing of the faithful friend against the friend in name only of Sirach 37:1.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-friend-in-name-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The friend who does not turn in the time of trouble (Sirach 37:4) but lays down His life is the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-friend-in-name-only'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-37-take-counsel-of-the-godly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalm''s line between godly and ungodly counsel is exactly Ben Sira''s choice of the Torah-keeping counsellor in Sirach 37:12.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-take-counsel-of-the-godly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* The safety Sirach 37:7 seeks past the self-serving counsellor lies in the multitude of faithful counsel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-take-counsel-of-the-godly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 15:22 — *Without counsel purposes are disappointed: but in the multitude of counsellors they are established.* The established purpose Sirach 37:7 commends rests on sound, many-voiced counsel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-take-counsel-of-the-godly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 9:14 — *As near as you can, guess at your neighbour, and consult with the wise.* Ben Sira''s own earlier charge to consult the wise, repeated in the godly counsellor of Sirach 37:12.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-take-counsel-of-the-godly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 4:18 — *Ask counsel of all that are wise, and despise not any counsel that is profitable.* Tobit''s wisdom-ethic matches Ben Sira''s warning to weigh the counsellor in Sirach 37:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-take-counsel-of-the-godly'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-37-counsel-of-the-heart-pray-most-high
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 20:5 — *Counsel in the heart of man is like deep water; but a man of understanding will draw it out.* The faithful counsel of the heart Ben Sira tells you to let stand in Sirach 37:13.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-counsel-of-the-heart-pray-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:9 — *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps.* The heart counsels, but it is the Most High who directs the way — the prayer of Sirach 37:15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-counsel-of-the-heart-pray-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:6 — *In all thy ways acknowledge him, and he shall direct thy paths.* The directing of the way that Sirach 37:15 prays the Most High to grant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-counsel-of-the-heart-pray-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The trusting heart set above (Sirach 37:13-15) under Yahuah''s direction, not its own understanding.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-counsel-of-the-heart-pray-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The New Testament answer to Ben Sira''s charge to pray the Most High in Sirach 37:15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-counsel-of-the-heart-pray-most-high'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-37-wise-instructs-his-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 3:13 — *Who is a wise man and endued with knowledge among you? let him shew out of a good conversation his works with meekness of wisdom.* The wise man whose fruits fail not (Sirach 37:23) shows wisdom in works, not bare words.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-wise-instructs-his-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 12:35 — *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* The fruitful understanding of the wise teacher in Sirach 37:23 brings forth good treasure.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-wise-instructs-his-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:52 — *Then said he unto them, Therefore every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old.* — the instructed scribe who brings forth treasure new and old, the very figure of the wise man who instructs his people in Sirach 37:23.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-wise-instructs-his-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 3:5 — *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding.* The blessing that fills the wise man counted happy (Sirach 37:24) flows from trust in Yahuah above his own understanding.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-wise-instructs-his-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-37-days-of-israel-innumerable
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The Abrahamic promise behind the innumerable days of Israel in Sirach 37:25.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-days-of-israel-innumerable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 1:10 — *Yahuah Elohaychem (The LORD your God) hath multiplied you, and, behold, ye are this day as the stars of heaven for multitude.* The promise of Sirach 37:25 seen fulfilled in Israel multiplied at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-days-of-israel-innumerable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 33:21 — *Then may also my covenant be broken with David my servant, that he should not have a son to reign upon his throne; and with the Levites the priests, my ministers.* The unbreakable covenant standing behind the innumerable days of Israel in Sirach 37:25 — election kept, not replaced.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-days-of-israel-innumerable'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-37-temperance-surfeiting-shortens-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:20 — *Be not among winebibbers; among riotous eaters of flesh.* The proverb''s warning against gluttony stands behind Ben Sira''s charge not to be greedy upon meats in Sirach 37:29.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-temperance-surfeiting-shortens-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 21:34 — *And take heed to yourselves, lest at any time your hearts be overcharged with surfeiting, and drunkenness, and cares of this life, and so that day come upon you unawares.* The Messiah binds the surfeiting that shortens life (Sirach 37:31) to watchfulness for the Day.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-temperance-surfeiting-shortens-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 31:20 — *Sound sleep comes of moderate eating: he rises early, and his wits are with him: but the pain of watching, and choler, and pangs of the belly, are with an unsatiable man.* Ben Sira''s own earlier temperance teaching, repeated in Sirach 37:31.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-temperance-surfeiting-shortens-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=31 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 5:18 — *Behold that which I have seen: it is good and comely for one to eat and to drink, and to enjoy the good of all his labour that he taketh under the sun all the days of his life, which Elohim (God) giveth him: for it is his portion.* The good portion received in moderation, the right use of the meats that in excess bring sickness in Sirach 37:30.'
  FROM cross_reference_threads t, cross_references x, _session253_sir37_lookup sv, _session253_sir37_lookup tv
 WHERE t.slug='sirach-37-temperance-surfeiting-shortens-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=37 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

