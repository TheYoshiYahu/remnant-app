-- ----- fragment: minion_ecclesiasticus_01.sql (session253 ecclesiasticus 1) -----
-- Source anchor: apocrypha/ecclesiasticus ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir01 (view _session253_sir01_lookup). Sort band base 58300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-1-all-wisdom-from-yahuah
  ('apocrypha', 'ecclesiasticus', 1, 1, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* James, Sirach''s closest NT sibling, echoes 1:1: all wisdom comes down from Yahuah, freely, to those who ask.'),
  ('apocrypha', 'ecclesiasticus', 1, 1, 'canon', '1-corinthians', 1, 30, 'free', E'1 Corinthians 1:30 — *But of him are ye in HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption:* The wisdom that is with Yahuah for ever (Sir 1:1) is made ours in the Messiah.'),
  ('apocrypha', 'ecclesiasticus', 1, 5, 'apocrypha', 'the-wisdom-of-solomon', 1, 7, 'extras', E'Wisdom of Solomon 1:7 — *For the Spirit of Yahuah (God) filleth the world: and that which containeth all things has knowledge of the voice.* The sister wisdom-book names the same fountain: the Spirit of Yahuah filling the world is the fountain of wisdom of Sir 1:5.'),
  -- thread: ecclesiasticus-1-wisdom-created-before-all
  ('apocrypha', 'ecclesiasticus', 1, 4, 'canon', 'proverbs', 8, 22, 'free', E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Sir 1:4''s wisdom created before all things is the Wisdom of Proverbs 8, possessed from the beginning.'),
  ('apocrypha', 'ecclesiasticus', 1, 4, 'canon', 'proverbs', 8, 23, 'free', E'Proverbs 8:23 — *I was set up from everlasting, from the beginning, or ever the earth was.* The understanding from everlasting (Sir 1:4) is Wisdom set up before the earth.'),
  ('apocrypha', 'ecclesiasticus', 1, 9, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Wisdom poured out upon all his works (Sir 1:9) is the Word by whom all things were made.'),
  ('apocrypha', 'ecclesiasticus', 1, 4, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The sister-book frames the same pre-created Wisdom of Sir 1:4 as the brightness of the everlasting light.'),
  -- thread: ecclesiasticus-1-fear-beginning-of-wisdom
  ('apocrypha', 'ecclesiasticus', 1, 14, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sir 1:14 quotes the spine of Proverbs: the fear of Yahuah is the beginning.'),
  ('apocrypha', 'ecclesiasticus', 1, 14, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Word for word the maxim Ben Sira builds on in Sir 1:14.'),
  ('apocrypha', 'ecclesiasticus', 1, 16, 'canon', 'psalms', 111, 10, 'free', E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The Psalter ties the fear-of-Yahuah wisdom of Sir 1:16 to doing his commandments — Torah stands.'),
  ('apocrypha', 'ecclesiasticus', 1, 18, 'canon', 'job', 28, 28, 'free', E'Job 28:28 — *And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* The crown of wisdom of Sir 1:18 is Job''s verdict: the fear of Yahuah, that is wisdom.'),
  -- thread: ecclesiasticus-1-root-and-tree-of-wisdom
  ('apocrypha', 'ecclesiasticus', 1, 20, 'canon', 'proverbs', 3, 18, 'free', E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The root-and-branches of Sir 1:20 is Wisdom as the tree of life.'),
  ('apocrypha', 'ecclesiasticus', 1, 20, 'canon', 'deuteronomy', 6, 2, 'free', E'Deuteronomy 6:2 — *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments, which I command thee, thou, and thy son, and thy son’s son, all the days of thy life; and that thy days may be prolonged.* The long-life branches of Sir 1:20 are the Torah promise: the fear of Yahuah prolongs days.'),
  ('apocrypha', 'ecclesiasticus', 1, 15, 'apocrypha', 'the-wisdom-of-solomon', 6, 18, 'extras', E'Wisdom of Solomon 6:18 — *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* The sister-book grounds Wisdom''s everlasting foundation (Sir 1:15) in the keeping of her laws — Torah stands.'),
  -- thread: ecclesiasticus-1-keep-the-commandments-for-wisdom
  ('apocrypha', 'ecclesiasticus', 1, 26, 'canon', 'ecclesiastes', 12, 13, 'free', E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* The fear-plus-keep-the-commandments of Sir 1:26 is the whole duty of man.'),
  ('apocrypha', 'ecclesiasticus', 1, 26, 'canon', 'matthew', 6, 33, 'free', E'Matthew 6:33 — *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you.* The Sermon''s order matches Sir 1:26: seek the kingdom first, and what you desire is added.'),
  ('apocrypha', 'ecclesiasticus', 1, 27, 'canon', 'matthew', 5, 5, 'free', E'Matthew 5:5 — *Blessed are the meek: for they shall inherit the earth.* The faith and meekness that are Yahuah''s delight (Sir 1:27) are the Beatitude''s meek who inherit.'),
  -- thread: ecclesiasticus-1-double-heart-hypocrisy
  ('apocrypha', 'ecclesiasticus', 1, 28, 'canon', 'james', 1, 12, 'free', E'James 1:12 — *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him.* James, the closest NT sibling, crowns the undivided heart that Sir 1:28 demands when poor and tried.'),
  ('apocrypha', 'ecclesiasticus', 1, 29, 'canon', 'matthew', 23, 28, 'free', E'Matthew 23:28 — *Even so ye also outwardly appear righteous unto men, but within ye are full of hypocrisy and iniquity.* The Messiah indicts exactly the hypocrite-in-the-sight-of-men of Sir 1:29.'),
  ('apocrypha', 'ecclesiasticus', 1, 30, 'apocrypha', 'the-wisdom-of-solomon', 1, 4, 'extras', E'Wisdom of Solomon 1:4 — *For into a malicious soul wisdom shall not enter; nor dwell in the body that is subject to sin.* The sister-book seals Sir 1:30: the deceitful, secret-laden heart cannot house wisdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-1-all-wisdom-from-yahuah',
       E'All wisdom comes from Yahuah',
       E'Ben Sira opens his whole book with the headwater of all wisdom: *All wisdom comes from Yahuah (God), and is with him for ever.* (Ecclesiasticus 1:1) — and *The word of Yahuah (God) most high is the fountain of wisdom; and her ways are everlasting commandments.* (Ecclesiasticus 1:5). It ain''t new: James says the same — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* (James 1:5). Paul gathers it into the Messiah, *who of Elohim (God) is made unto us wisdom* (1 Corinthians 1:30), and the sister-book of Wisdom names the same Spirit who *filleth the world* (Wisdom of Solomon 1:7). Wisdom is no human achievement; she pours down from the throne and her ways are the everlasting commandments — Torah stands.',
       sv.verse_id, ev.verse_id, 'extras', 58300
  FROM _session253_sir01_lookup sv, _session253_sir01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-1-wisdom-created-before-all',
       E'Wisdom created before all things',
       E'*Wisdom has been created before all things, and the understanding of prudence from everlasting.* (Ecclesiasticus 1:4); *He created her, and saw her, and numbered her, and poured her out upon all his works.* (Ecclesiasticus 1:9). This is the Wisdom of Proverbs 8 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22), *I was set up from everlasting, from the beginning, or ever the earth was* (Proverbs 8:23). The sister-book sings her as *the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God)* (Wisdom of Solomon 7:26). And John lifts the same Wisdom to her face: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* — *All things were made by him* (John 1:1, John 1:3). The formed Wisdom by whom all was made.',
       sv.verse_id, ev.verse_id, 'extras', 58303
  FROM _session253_sir01_lookup sv, _session253_sir01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-1-fear-beginning-of-wisdom',
       E'The fear of Yahuah, the beginning of wisdom',
       E'The heart of the chapter: *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* (Ecclesiasticus 1:14); *To fear Yahuah (God) is fulness of wisdom* (Ecclesiasticus 1:16); *The fear of Yahuah (God) is a crown of wisdom* (Ecclesiasticus 1:18). This is the spine of all Tanakh wisdom. Solomon: *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7); again, *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10); the Psalter, *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments* (Psalm 111:10); and Job, *Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding* (Job 28:28). It ain''t new — Ben Sira is singing the oldest song.',
       sv.verse_id, ev.verse_id, 'extras', 58306
  FROM _session253_sir01_lookup sv, _session253_sir01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-1-root-and-tree-of-wisdom',
       E'The root of wisdom, the tree of long life',
       E'*The root of wisdom is to fear Yahuah (God), and the branches thereof are long life.* (Ecclesiasticus 1:20); *She has built an everlasting foundation with men, and she shall continue with their seed.* (Ecclesiasticus 1:15). The image is the tree of life of Eden''s wisdom: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). And the long life of the branches is the Torah promise of the fear that prolongs days — *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments... that thy days may be prolonged* (Deuteronomy 6:2). The root is the fear of Yahuah; the fruit is covenant life kept in the seed.',
       sv.verse_id, ev.verse_id, 'extras', 58309
  FROM _session253_sir01_lookup sv, _session253_sir01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-1-keep-the-commandments-for-wisdom',
       E'Desire wisdom? Keep the commandments',
       E'Ben Sira makes the way to wisdom plain and Torah-shaped: *If you desire wisdom, keep the commandments, and Yahuah (God) shall give her to you.* (Ecclesiasticus 1:26); *For the fear of Yahuah (God) is wisdom and instruction: and faith and meekness are his delight.* (Ecclesiasticus 1:27). This is Solomon''s own conclusion — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* (Ecclesiastes 12:13) — and the Sermon on the Mount''s order of seeking: *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). The meekness that is Yahuah''s delight is the meek who inherit: *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). Keep the commandments; wisdom is given.',
       sv.verse_id, ev.verse_id, 'extras', 58312
  FROM _session253_sir01_lookup sv, _session253_sir01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=1 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-1-double-heart-hypocrisy',
       E'No double heart, no hypocrisy',
       E'The chapter closes against the divided soul: *Distrust not the fear of Yahuah (God) when you are poor: and come not to him with a double heart.* (Ecclesiasticus 1:28); *Be not an hypocrite in the sight of men, and take good heed what you speak.* (Ecclesiasticus 1:29). It ain''t new — James, Sirach''s NT twin, warns the *double minded man* and crowns the man who endures the trial: *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him* (James 1:12). The Messiah names the hypocrite plainly: *ye also outwardly appear righteous unto men, but within ye are full of hypocrisy and iniquity* (Matthew 23:28). The sister-book seals it: *into a malicious soul wisdom shall not enter; nor dwell in the body that is subject to sin* (Wisdom of Solomon 1:4). Come in truth, with a whole heart.',
       sv.verse_id, ev.verse_id, 'extras', 58315
  FROM _session253_sir01_lookup sv, _session253_sir01_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=1 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-1-all-wisdom-from-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* James, Sirach''s closest NT sibling, echoes 1:1: all wisdom comes down from Yahuah, freely, to those who ask.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-all-wisdom-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 1:30 — *But of him are ye in HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption:* The wisdom that is with Yahuah for ever (Sir 1:1) is made ours in the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-all-wisdom-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 1:7 — *For the Spirit of Yahuah (God) filleth the world: and that which containeth all things has knowledge of the voice.* The sister wisdom-book names the same fountain: the Spirit of Yahuah filling the world is the fountain of wisdom of Sir 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-all-wisdom-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-1-wisdom-created-before-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Sir 1:4''s wisdom created before all things is the Wisdom of Proverbs 8, possessed from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-wisdom-created-before-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:23 — *I was set up from everlasting, from the beginning, or ever the earth was.* The understanding from everlasting (Sir 1:4) is Wisdom set up before the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-wisdom-created-before-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* The Wisdom poured out upon all his works (Sir 1:9) is the Word by whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-wisdom-created-before-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The sister-book frames the same pre-created Wisdom of Sir 1:4 as the brightness of the everlasting light.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-wisdom-created-before-all'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-1-fear-beginning-of-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sir 1:14 quotes the spine of Proverbs: the fear of Yahuah is the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-fear-beginning-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Word for word the maxim Ben Sira builds on in Sir 1:14.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-fear-beginning-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* The Psalter ties the fear-of-Yahuah wisdom of Sir 1:16 to doing his commandments — Torah stands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-fear-beginning-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 28:28 — *And unto man he said, Behold, the fear of Yahuah (Lord), that is wisdom; and to depart from evil is understanding.* The crown of wisdom of Sir 1:18 is Job''s verdict: the fear of Yahuah, that is wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-fear-beginning-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-1-root-and-tree-of-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The root-and-branches of Sir 1:20 is Wisdom as the tree of life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-root-and-tree-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:2 — *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments, which I command thee, thou, and thy son, and thy son’s son, all the days of thy life; and that thy days may be prolonged.* The long-life branches of Sir 1:20 are the Torah promise: the fear of Yahuah prolongs days.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-root-and-tree-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 6:18 — *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* The sister-book grounds Wisdom''s everlasting foundation (Sir 1:15) in the keeping of her laws — Torah stands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-root-and-tree-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-1-keep-the-commandments-for-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 12:13 — *Let us hear the conclusion of the whole matter: Fear Elohim (God), and keep his commandments: for this is the whole duty of man.* The fear-plus-keep-the-commandments of Sir 1:26 is the whole duty of man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-keep-the-commandments-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:33 — *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you.* The Sermon''s order matches Sir 1:26: seek the kingdom first, and what you desire is added.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-keep-the-commandments-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:5 — *Blessed are the meek: for they shall inherit the earth.* The faith and meekness that are Yahuah''s delight (Sir 1:27) are the Beatitude''s meek who inherit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-keep-the-commandments-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-1-double-heart-hypocrisy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:12 — *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him.* James, the closest NT sibling, crowns the undivided heart that Sir 1:28 demands when poor and tried.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-double-heart-hypocrisy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:28 — *Even so ye also outwardly appear righteous unto men, but within ye are full of hypocrisy and iniquity.* The Messiah indicts exactly the hypocrite-in-the-sight-of-men of Sir 1:29.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-double-heart-hypocrisy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 1:4 — *For into a malicious soul wisdom shall not enter; nor dwell in the body that is subject to sin.* The sister-book seals Sir 1:30: the deceitful, secret-laden heart cannot house wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir01_lookup sv, _session253_sir01_lookup tv
 WHERE t.slug='ecclesiasticus-1-double-heart-hypocrisy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=1 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

