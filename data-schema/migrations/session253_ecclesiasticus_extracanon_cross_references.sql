-- =====================================================================
-- Session 253 — Sirach (Ecclesiasticus) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_ecclesiasticus_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — Sirach (Ecclesiasticus) cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_ecclesiasticus_02.sql (session253 ecclesiasticus 2) -----
-- Source anchor: apocrypha/ecclesiasticus ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir02 (view _session253_sir02_lookup). Sort band base 58325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-2-prepare-soul-for-temptation
  ('apocrypha', 'ecclesiasticus', 2, 1, 'canon', 'james', 1, 2, 'free', E'James 1:2 — *My brethren, count it all joy when ye fall into divers temptations;* James, the closest NT sibling to Sirach, echoes ben Sira''s call to brace the soul for trial as joy.'),
  ('apocrypha', 'ecclesiasticus', 2, 1, 'canon', 'james', 1, 3, 'free', E'James 1:3 — *Knowing this, that the trying of your faith worketh patience.* The serving of Yahuah is met with testing that, as in Sirach 2:1-4, produces patient endurance.'),
  ('apocrypha', 'ecclesiasticus', 2, 5, 'canon', '1-peter', 1, 7, 'free', E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* Peter''s gold-tried-with-fire is ben Sira''s furnace of adversity verbatim in figure (Sirach 2:5).'),
  ('apocrypha', 'ecclesiasticus', 2, 5, 'canon', 'job', 23, 10, 'free', E'Job 23:10 — *But he knoweth the way that I take: when he hath tried me, I shall come forth as gold.* Job is the Tanakh root of the acceptable man coming forth as gold from the furnace (Sirach 2:5).'),
  ('apocrypha', 'ecclesiasticus', 2, 5, 'apocrypha', 'the-wisdom-of-solomon', 3, 6, 'extras', E'Wisdom of Solomon 3:6 — *As gold in the furnace has he tried them, and received them as a burnt offering.* The companion wisdom book self-links the very gold-in-the-furnace proving of the righteous that Sirach 2:5 declares.'),
  -- thread: ecclesiasticus-2-cleave-endure-trust
  ('apocrypha', 'ecclesiasticus', 2, 2, 'canon', 'james', 1, 4, 'free', E'James 1:4 — *But let patience have her perfect work, that ye may be perfect and entire, wanting nothing.* The constant endurance ben Sira commands (Sirach 2:2) is James''s perfecting patience.'),
  ('apocrypha', 'ecclesiasticus', 2, 1, 'canon', 'matthew', 4, 1, 'free', E'Matthew 4:1 — *Then was Yahusha (Jesus) led up of the Spirit into the wilderness to be tempted of the devil.* The Messiah Himself enters the prepared-for temptation of Sirach 2:1 and answers it by the word.'),
  ('apocrypha', 'ecclesiasticus', 2, 4, 'canon', 'deuteronomy', 8, 2, 'free', E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* The low estate borne patiently (Sirach 2:4) is Israel proved in the wilderness.'),
  ('apocrypha', 'ecclesiasticus', 2, 6, 'canon', 'romans', 5, 3, 'free', E'Romans 5:3 — *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;* Sha''ul''s glorying in tribulation is ben Sira''s ''trust in him'' through the time of trouble (Sirach 2:6).'),
  -- thread: ecclesiasticus-2-fear-yahuah-wait-for-mercy
  ('apocrypha', 'ecclesiasticus', 2, 7, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Ben Sira''s triple ''ye that fear Yahuah'' (Sirach 2:7-9) rests on the wisdom foundation of Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 2, 7, 'canon', 'psalms', 34, 9, 'free', E'Psalm 34:9 — *O fear Yahuah (LORD), ye his saints: for there is no want to them that fear him.* The fearer of Yahuah who waits for mercy (Sirach 2:7) lacks no good thing.'),
  ('apocrypha', 'ecclesiasticus', 2, 7, 'canon', 'psalms', 25, 3, 'free', E'Psalm 25:3 — *Yea, let none that wait on thee be ashamed: let them be ashamed which transgress without cause.* To wait for His mercy and not go aside (Sirach 2:7) is to be kept from shame.'),
  ('apocrypha', 'ecclesiasticus', 2, 8, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The reward that shall not fail (Sirach 2:8) is the crown of life to the faithful-unto-death.'),
  -- thread: ecclesiasticus-2-generations-of-old-full-of-compassion
  ('apocrypha', 'ecclesiasticus', 2, 10, 'canon', 'psalms', 22, 4, 'free', E'Psalm 22:4 — *Our fathers trusted in thee: they trusted, and thou didst deliver them.* The generations of old who trusted and were not confounded (Sirach 2:10) are the delivered fathers of the Psalm.'),
  ('apocrypha', 'ecclesiasticus', 2, 10, 'canon', 'psalms', 22, 5, 'free', E'Psalm 22:5 — *They cried unto thee, and were delivered: they trusted in thee, and were not confounded.* The exact ''trusted and was not confounded'' that ben Sira asks of the generations (Sirach 2:10).'),
  ('apocrypha', 'ecclesiasticus', 2, 11, 'canon', 'exodus', 34, 6, 'free', E'Exodus 34:6 — *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* The Sinai proclamation of the Name is the source of ben Sira''s ''full of compassion and mercy, longsuffering'' (Sirach 2:11).'),
  ('apocrypha', 'ecclesiasticus', 2, 11, 'canon', 'lamentations', 3, 22, 'free', E'Lamentations 3:22 — *It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* The compassions that fail not are ben Sira''s mercy that saves in time of affliction (Sirach 2:11).'),
  -- thread: ecclesiasticus-2-woe-to-the-fainthearted
  ('apocrypha', 'ecclesiasticus', 2, 12, 'canon', 'james', 1, 8, 'free', E'James 1:8 — *A double minded man is unstable in all his ways.* James''s double-minded man is precisely ben Sira''s ''sinner that goes two ways'' (Sirach 2:12).'),
  ('apocrypha', 'ecclesiasticus', 2, 13, 'canon', 'james', 1, 12, 'free', E'James 1:12 — *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him.* The blessing on the endurer answers ben Sira''s woe on the fainthearted who believes not (Sirach 2:13).'),
  ('apocrypha', 'ecclesiasticus', 2, 14, 'canon', 'hebrews', 12, 5, 'free', E'Hebrews 12:5 — *And ye have forgotten the exhortation which speaketh unto you as unto children, My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him:* The lost-patience and faint hands of Sirach 2:14 are the fainting under chastening Hebrews warns against.'),
  -- thread: ecclesiasticus-2-they-that-love-keep-his-ways
  ('apocrypha', 'ecclesiasticus', 2, 15, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The Messiah''s measure of love is ben Sira''s ''they that love him will keep his ways'' (Sirach 2:15).'),
  ('apocrypha', 'ecclesiasticus', 2, 16, 'apocrypha', 'the-wisdom-of-solomon', 3, 9, 'extras', E'Wisdom of Solomon 3:9 — *They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* The companion wisdom book joins the truth-seeking, law-filled fearers of Sirach 2:16 to the faithful-in-love elect.'),
  ('apocrypha', 'ecclesiasticus', 2, 18, 'canon', '2-samuel', 24, 14, 'free', E'2 Samuel 24:14 — *And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (LORD); for his mercies are great: and let me not fall into the hand of man.* David''s choice is ben Sira''s closing word verbatim in figure — to fall into the hands of Yahuah, not men (Sirach 2:18).'),
  ('apocrypha', 'ecclesiasticus', 2, 18, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* Because His mercy matches His majesty, all that is brought upon the lovers of Yahuah works to good (Sirach 2:18).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-2-prepare-soul-for-temptation',
       E'Prepare thy soul for temptation — the gold tried in the fire',
       E'Ben Sira opens the school of the faithful: *My son, if you come to serve Yahuah (God), prepare your soul for temptation.* (Ecclesiasticus 2:1) — the very wisdom James restored when he wrote *My brethren, count it all joy when ye fall into divers temptations;* (James 1:2), *Knowing this, that the trying of your faith worketh patience.* (James 1:3). The trial is not the law as curse but the proving of the seed: *For gold is tried in the fire, and acceptable men in the furnace of adversity.* (Ecclesiasticus 2:5) — the same furnace Peter knew, *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* (1 Peter 1:7), and Job confessed, *But he knoweth the way that I take: when he hath tried me, I shall come forth as gold.* (Job 23:10). Wisdom of Solomon carries the identical figure for the elect — *As gold in the furnace has he tried them, and received them as a burnt offering.* (Wisdom of Solomon 3:6). And Sha''ul tells the same: *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;* (Romans 5:3). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58325
  FROM _session253_sir02_lookup sv, _session253_sir02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-2-cleave-endure-trust',
       E'Cleave to him, endure, and trust — patience in the low estate',
       E'The trial calls for steadfastness, not flight: *Set your heart aright, and constantly endure, and make not haste in time of trouble.* (Ecclesiasticus 2:2), *Cleave to him, and depart not away, that you may be increased at your last end.* (Ecclesiasticus 2:3), *Whatsoever is brought upon you take cheerfully, and be patient when you are changed to a low estate.* (Ecclesiasticus 2:4), *Believe in him, and he will help you; order your way aright, and trust in him.* (Ecclesiasticus 2:6). This is James again — *But let patience have her perfect work, that ye may be perfect and entire, wanting nothing.* (James 1:4) — and the Messiah''s own wilderness, where He answered every trial by the word, *Then was Yahusha (Jesus) led up of the Spirit into the wilderness to be tempted of the devil.* (Matthew 4:1). Moses gave Israel the same reckoning of the furnace forty years before: *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* (Deuteronomy 8:2). Cleave, endure, trust — Torah, wisdom, and the gospel speak one tongue.',
       sv.verse_id, ev.verse_id, 'extras', 58328
  FROM _session253_sir02_lookup sv, _session253_sir02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=2 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-2-fear-yahuah-wait-for-mercy',
       E'Ye that fear Yahuah, wait for his mercy — the reward shall not fail',
       E'Three times the fear of Yahuah is set as the ground of hope: *You that fear Yahuah (God), wait for his mercy; and go not aside, lest you fall.* (Ecclesiasticus 2:7), *You that fear Yahuah (God), believe him; and your reward shall not fail.* (Ecclesiasticus 2:8), *You that fear Yahuah (God), hope for good, and for everlasting joy and mercy.* (Ecclesiasticus 2:9). The fear of Yahuah is wisdom''s beginning — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7) — and the Psalter promises the very want-no-good ben Sira names: *O fear Yahuah (LORD), ye his saints: for there is no want to them that fear him.* (Psalm 34:9). To wait on Him is never to be ashamed: *Yea, let none that wait on thee be ashamed: let them be ashamed which transgress without cause.* (Psalm 25:3). And the reward that shall not fail is the Messiah''s own word to the tried — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* (Revelation 2:10).',
       sv.verse_id, ev.verse_id, 'extras', 58331
  FROM _session253_sir02_lookup sv, _session253_sir02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-2-generations-of-old-full-of-compassion',
       E'Look at the generations of old — none that trusted was confounded',
       E'Ben Sira summons the witness of the fathers: *Look at the generations of old, and see; did ever any trust in Yahuah (God), and was confounded? or did any abide in his fear, and was forsaken? or whom did he ever despise, that called upon him?* (Ecclesiasticus 2:10), and answers it with the name proclaimed on Sinai: *For Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction.* (Ecclesiasticus 2:11). The fathers are exactly the testimony of the Psalter — *Our fathers trusted in thee: they trusted, and thou didst deliver them.* (Psalm 22:4), *They cried unto thee, and were delivered: they trusted in thee, and were not confounded.* (Psalm 22:5). And the compassion he names is the very self-revelation of the Name: *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* (Exodus 34:6) — mercies that, Jeremiah sang, *It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* (Lamentations 3:22).',
       sv.verse_id, ev.verse_id, 'extras', 58334
  FROM _session253_sir02_lookup sv, _session253_sir02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-2-woe-to-the-fainthearted',
       E'Woe to fearful hearts — the double-minded that goes two ways',
       E'Against the patient endurer ben Sira sets the divided heart: *Woe be to fearful hearts, and faint hands, and the sinner that goes two ways!* (Ecclesiasticus 2:12), *Woe to him that is fainthearted! for he believes not; therefore shall he not be defended.* (Ecclesiasticus 2:13), *Woe to you that have lost patience! and what will you do when Yahuah (God) shall visit you?* (Ecclesiasticus 2:14). The sinner that goes two ways is James''s wavering man — *A double minded man is unstable in all his ways.* (James 1:8) — set over against the one who endures: *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him.* (James 1:12). The faint hands and lost patience are what Hebrews exhorts against in the day of chastening: *And ye have forgotten the exhortation which speaketh unto you as unto children, My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him:* (Hebrews 12:5).',
       sv.verse_id, ev.verse_id, 'extras', 58337
  FROM _session253_sir02_lookup sv, _session253_sir02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-2-they-that-love-keep-his-ways',
       E'They that love him keep his ways — let us fall into the hands of Yahuah',
       E'The chapter closes on the obedient, Torah-loving fearer: *They that fear Yahuah (God) will not disobey his Word; and they that love him will keep his ways.* (Ecclesiasticus 2:15), *They that fear Yahuah (God) will seek that which is well, pleasing to him; and they that love him shall be filled with the law.* (Ecclesiasticus 2:16), *They that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight,* (Ecclesiasticus 2:17), *Saying, We will fall into the hands of Yahuah (God), and not into the hands of men: for as his majesty is, so is his mercy.* (Ecclesiasticus 2:18). To love and keep His ways is the Messiah''s own measure — *If ye love me, keep my commandments.* (John 14:15) — and the trusting that abides in love is Wisdom of Solomon''s elect: *They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* (Wisdom of Solomon 3:9). The final ''fall into the hands of Yahuah, not men'' is David''s own choice — *And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (LORD); for his mercies are great: and let me not fall into the hand of man.* (2 Samuel 24:14) — for all things work to the good of them that love Him: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* (Romans 8:28).',
       sv.verse_id, ev.verse_id, 'extras', 58340
  FROM _session253_sir02_lookup sv, _session253_sir02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=2 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-2-prepare-soul-for-temptation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:2 — *My brethren, count it all joy when ye fall into divers temptations;* James, the closest NT sibling to Sirach, echoes ben Sira''s call to brace the soul for trial as joy.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-prepare-soul-for-temptation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:3 — *Knowing this, that the trying of your faith worketh patience.* The serving of Yahuah is met with testing that, as in Sirach 2:1-4, produces patient endurance.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-prepare-soul-for-temptation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* Peter''s gold-tried-with-fire is ben Sira''s furnace of adversity verbatim in figure (Sirach 2:5).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-prepare-soul-for-temptation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 23:10 — *But he knoweth the way that I take: when he hath tried me, I shall come forth as gold.* Job is the Tanakh root of the acceptable man coming forth as gold from the furnace (Sirach 2:5).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-prepare-soul-for-temptation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=23 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 3:6 — *As gold in the furnace has he tried them, and received them as a burnt offering.* The companion wisdom book self-links the very gold-in-the-furnace proving of the righteous that Sirach 2:5 declares.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-prepare-soul-for-temptation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-2-cleave-endure-trust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:4 — *But let patience have her perfect work, that ye may be perfect and entire, wanting nothing.* The constant endurance ben Sira commands (Sirach 2:2) is James''s perfecting patience.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-cleave-endure-trust'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 4:1 — *Then was Yahusha (Jesus) led up of the Spirit into the wilderness to be tempted of the devil.* The Messiah Himself enters the prepared-for temptation of Sirach 2:1 and answers it by the word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-cleave-endure-trust'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* The low estate borne patiently (Sirach 2:4) is Israel proved in the wilderness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-cleave-endure-trust'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:3 — *And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;* Sha''ul''s glorying in tribulation is ben Sira''s ''trust in him'' through the time of trouble (Sirach 2:6).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-cleave-endure-trust'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-2-fear-yahuah-wait-for-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Ben Sira''s triple ''ye that fear Yahuah'' (Sirach 2:7-9) rests on the wisdom foundation of Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-fear-yahuah-wait-for-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:9 — *O fear Yahuah (LORD), ye his saints: for there is no want to them that fear him.* The fearer of Yahuah who waits for mercy (Sirach 2:7) lacks no good thing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-fear-yahuah-wait-for-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 25:3 — *Yea, let none that wait on thee be ashamed: let them be ashamed which transgress without cause.* To wait for His mercy and not go aside (Sirach 2:7) is to be kept from shame.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-fear-yahuah-wait-for-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The reward that shall not fail (Sirach 2:8) is the crown of life to the faithful-unto-death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-fear-yahuah-wait-for-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-2-generations-of-old-full-of-compassion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:4 — *Our fathers trusted in thee: they trusted, and thou didst deliver them.* The generations of old who trusted and were not confounded (Sirach 2:10) are the delivered fathers of the Psalm.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-generations-of-old-full-of-compassion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:5 — *They cried unto thee, and were delivered: they trusted in thee, and were not confounded.* The exact ''trusted and was not confounded'' that ben Sira asks of the generations (Sirach 2:10).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-generations-of-old-full-of-compassion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:6 — *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth,* The Sinai proclamation of the Name is the source of ben Sira''s ''full of compassion and mercy, longsuffering'' (Sirach 2:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-generations-of-old-full-of-compassion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Lamentations 3:22 — *It is of the LORD''S mercies that we are not consumed, because his compassions fail not.* The compassions that fail not are ben Sira''s mercy that saves in time of affliction (Sirach 2:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-generations-of-old-full-of-compassion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-2-woe-to-the-fainthearted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:8 — *A double minded man is unstable in all his ways.* James''s double-minded man is precisely ben Sira''s ''sinner that goes two ways'' (Sirach 2:12).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-woe-to-the-fainthearted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:12 — *Blessed is the man that endureth temptation: for when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him.* The blessing on the endurer answers ben Sira''s woe on the fainthearted who believes not (Sirach 2:13).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-woe-to-the-fainthearted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:5 — *And ye have forgotten the exhortation which speaketh unto you as unto children, My son, despise not thou the chastening of Yahuah (Lord), nor faint when thou art rebuked of him:* The lost-patience and faint hands of Sirach 2:14 are the fainting under chastening Hebrews warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-woe-to-the-fainthearted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-2-they-that-love-keep-his-ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:15 — *If ye love me, keep my commandments.* The Messiah''s measure of love is ben Sira''s ''they that love him will keep his ways'' (Sirach 2:15).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-they-that-love-keep-his-ways'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:9 — *They that put their trust in him shall understand the truth: and such as be faithful in love shall abide with him: for grace and mercy is to his saints, and he has care for his elect.* The companion wisdom book joins the truth-seeking, law-filled fearers of Sirach 2:16 to the faithful-in-love elect.'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-they-that-love-keep-his-ways'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 24:14 — *And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (LORD); for his mercies are great: and let me not fall into the hand of man.* David''s choice is ben Sira''s closing word verbatim in figure — to fall into the hands of Yahuah, not men (Sirach 2:18).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-they-that-love-keep-his-ways'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* Because His mercy matches His majesty, all that is brought upon the lovers of Yahuah works to good (Sirach 2:18).'
  FROM cross_reference_threads t, cross_references x, _session253_sir02_lookup sv, _session253_sir02_lookup tv
 WHERE t.slug='ecclesiasticus-2-they-that-love-keep-his-ways'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_03.sql (session253 ecclesiasticus 3) -----
-- Source anchor: apocrypha/ecclesiasticus ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir03 (view _session253_sir03_lookup). Sort band base 58350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-3-honour-father-mother
  ('apocrypha', 'ecclesiasticus', 3, 2, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Sinai command Ben Sira unfolds when he says Yahuah has given the father honour over the children (Ecclesiasticus 3:2).'),
  ('apocrypha', 'ecclesiasticus', 3, 6, 'canon', 'deuteronomy', 5, 16, 'free', E'Deuteronomy 5:16 — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The same long-life promise Ben Sira repeats: he that honoureth his father shall have a long life (Ecclesiasticus 3:6).'),
  ('apocrypha', 'ecclesiasticus', 3, 8, 'canon', 'ephesians', 6, 2, 'free', E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names as the first commandment with promise the very duty Ben Sira urges in word and deed (Ecclesiasticus 3:8).'),
  ('apocrypha', 'ecclesiasticus', 3, 5, 'canon', 'matthew', 15, 4, 'free', E'Matthew 15:4 — *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death.* The Messiah holds the same commandment Ben Sira presses, rebuking the tradition that voided it (Ecclesiasticus 3:5).'),
  -- thread: ecclesiasticus-3-corban-tradition-rebuked
  ('apocrypha', 'ecclesiasticus', 3, 16, 'canon', 'matthew', 15, 6, 'free', E'Matthew 15:6 — *And honour not his father or his mother, he shall be free. Thus have ye made the commandment of Elohim (God) of none effect by your tradition.* The corban loophole is precisely the forsaking of the father Ben Sira likens to blasphemy (Ecclesiasticus 3:16).'),
  ('apocrypha', 'ecclesiasticus', 3, 14, 'apocrypha', 'tobit', 12, 9, 'extras', E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* The sister wisdom-book confirms that the relief of one''s father, counted instead of sins to build a man up, is an almsdeed (Ecclesiasticus 3:14).'),
  ('apocrypha', 'ecclesiasticus', 3, 13, 'canon', 'ephesians', 6, 3, 'free', E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents reaches into their old age, where Ben Sira bids the strong have patience (Ecclesiasticus 3:13).'),
  -- thread: ecclesiasticus-3-humble-thyself-exalted
  ('apocrypha', 'ecclesiasticus', 3, 18, 'canon', 'luke', 14, 11, 'free', E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The Messiah''s law of the Kingdom is Ben Sira''s counsel that the greater one is, the more he should humble himself (Ecclesiasticus 3:18).'),
  ('apocrypha', 'ecclesiasticus', 3, 18, 'canon', 'luke', 18, 14, 'free', E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The publican who humbled himself found the favour before Yahuah that Ben Sira promises the lowly (Ecclesiasticus 3:18).'),
  ('apocrypha', 'ecclesiasticus', 3, 20, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* Ya''aqob, the closest NT sibling of this book, echoes that Yahuah is honoured of the lowly (Ecclesiasticus 3:20).'),
  ('apocrypha', 'ecclesiasticus', 3, 20, 'canon', 'proverbs', 3, 34, 'free', E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh''s wisdom that grace goes to the lowly underwrites Ben Sira''s word that the lowly honour the great power of Yahuah (Ecclesiasticus 3:20).'),
  -- thread: ecclesiasticus-3-seek-not-secret-things
  ('apocrypha', 'ecclesiasticus', 3, 22, 'canon', 'deuteronomy', 29, 29, 'free', E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses'' division of secret and revealed is exactly Ben Sira''s: think on what is commanded, not on the things in secret (Ecclesiasticus 3:22).'),
  ('apocrypha', 'ecclesiasticus', 3, 22, 'canon', 'micah', 6, 8, 'free', E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* The modest, reverent walk Micah requires is Ben Sira''s mind set on what is commanded rather than the hidden (Ecclesiasticus 3:22).'),
  ('apocrypha', 'ecclesiasticus', 3, 24, 'canon', 'daniel', 12, 10, 'free', E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* As Ben Sira warns that many are deceived by vain opinion, Daniel divides the wise who understand from the wicked who never will (Ecclesiasticus 3:24).'),
  -- thread: ecclesiasticus-3-proud-heart-alms-atones
  ('apocrypha', 'ecclesiasticus', 3, 28, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-saying behind Ben Sira''s verdict that for the punishment of the proud there is no remedy (Ecclesiasticus 3:28).'),
  ('apocrypha', 'ecclesiasticus', 3, 26, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The king who learned that the stubborn heart fares evil at the last is living proof of Ben Sira''s word (Ecclesiasticus 3:26).'),
  ('apocrypha', 'ecclesiasticus', 3, 30, 'canon', 'matthew', 6, 4, 'free', E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Sermon takes up Ben Sira''s almsdeed that maketh atonement and hides it from man''s eye (Ecclesiasticus 3:30).'),
  ('apocrypha', 'ecclesiasticus', 3, 30, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The sister apocryphal wisdom-book teaches the same: alms quench sin as water quencheth fire (Ecclesiasticus 3:30).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-honour-father-mother',
       E'Honour thy father and mother — the fifth commandment unfolded',
       E'Ben Sira opens chapter 3 by taking the fifth word of the Decalogue and unfolding it as wisdom: *For Yahuah (God) has given the father honour over the children, and has confirmed the authority of the mother over the sons.* (Ecclesiasticus 3:2). To honour is no light thing — *Whoso honoureth his father makes an atonement for his sins* (Ecclesiasticus 3:3), and *Whoso honoureth his father shall have joy of his own children; and when he makes his prayer, he shall be heard* (Ecclesiasticus 3:5). This is the very commandment graven at Sinai: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Exodus 20:12), repeated in Moses'' rehearsal — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee* (Deuteronomy 5:16). Sha''ul knows it as the hinge of the household: *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). It ain''t new — the apparatus Ben Sira raises on the commandment is the same covenant honour, the same long-life promise, the same blessing that *establishes the houses of children* (Ecclesiasticus 3:9).',
       sv.verse_id, ev.verse_id, 'extras', 58350
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-corban-tradition-rebuked',
       E'Help thy father in his age — against the corban evasion',
       E'Ben Sira presses the commandment into old age, where it costs: *My son, help your father in his age, and grieve him not as long as he lives.* (Ecclesiasticus 3:12), and *if his understanding fail, have patience with him; and despise him not when you are in your full strength* (Ecclesiasticus 3:13). The man who shirks it is no neutral — *He that forsaketh his father is as a blasphemer; and he that angereth his mother is cursed: of Yahuah (God).* (Ecclesiasticus 3:16). Centuries on, the Messiah indicts the scribes for inventing a loophole around this very duty: *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death.* (Matthew 15:4) — *Thus have ye made the commandment of Elohim (God) of none effect by your tradition* (Matthew 15:6). The corban evasion is exactly the forsaking Ben Sira called blasphemy. And the relief of an aged father is not lost: *For the relieving of your father shall not be forgotten: and instead of sins it shall be added to build you up.* (Ecclesiasticus 3:14) — an almsdeed within the house, which Tobit calls deliverance: *For alms does deliver from death, and shall purge away all sin.* (Tobit 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 58353
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-humble-thyself-exalted',
       E'The greater thou art, the more humble thyself',
       E'From honour Ben Sira turns to its root, lowliness: *My son, go on with your business in meekness; so shall you be beloved of him that is approved.* (Ecclesiasticus 3:17), and the great wisdom-saying — *The greater you are, the more humble thyself, and you shall find favour before Yahuah (God).* (Ecclesiasticus 3:18). This is the law of the Kingdom the Messiah twice declared: *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* (Luke 14:11), and again at the temple — *for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* (Luke 18:14). Ben Sira''s *the power of Yahuah (God) is great, and he is honoured of the lowly* (Ecclesiasticus 3:20) is the same word Proverbs and Ya''aqob carry: *Surely he scorneth the scorners: but he giveth grace unto the lowly.* (Proverbs 3:34) — *Elohim (God) resisteth the proud, but giveth grace unto the humble.* (James 4:6). It ain''t new: the Sermon''s blessing on the meek, and James — the closest NT sibling to this whole book — draw the identical line from lowliness to favour.',
       sv.verse_id, ev.verse_id, 'extras', 58356
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-seek-not-secret-things',
       E'Seek not things too hard — the secret and the revealed',
       E'Humility governs the mind as well as the heart: *Seek not out things that are too hard for you, neither search the things that are above your strength.* (Ecclesiasticus 3:21), but rather — *what is commanded you, think thereupon with reverence, for it is not needful for you to see with your eyes the things that are in secret.* (Ecclesiasticus 3:22). This is Moses'' own division of secret and revealed: *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* (Deuteronomy 29:29) — the revealed thing being the commandment to do. Ben Sira warns *many are deceived by their own vain opinion* (Ecclesiasticus 3:24); the prudent walk modestly, for as Daniel was told, *none of the wicked shall understand; but the wise shall understand* (Daniel 12:10). Micah names the same reverent, modest walk: *to do justly, and to love mercy, and to walk humbly with thy Elohim (God)* (Micah 6:8). It ain''t new — wisdom keeps to what is commanded and leaves the secret things with Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 58359
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-3-proud-heart-alms-atones',
       E'The proud heart, and alms that maketh atonement',
       E'Ben Sira ends the chapter on the heart that will not bow: *A stubborn heart shall fare evil at the last; and he that loves danger shall perish in it.* (Ecclesiasticus 3:26), and *In the punishment of the proud there is no remedy; for the plant of wickedness has taken root in him.* (Ecclesiasticus 3:28). The Tanakh says it plainly — *Pride goeth before destruction, and an haughty spirit before a fall.* (Proverbs 16:18) — and Nebuchadnezzar learned it on his knees: *those that walk in pride he is able to abase* (Daniel 4:37). Against the proud heart Ben Sira sets the humble deed: *Water will quench a flaming fire; and alms makes an atonement for sins.* (Ecclesiasticus 3:30). This is Tobit''s gospel of mercy — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor* (Tobit 4:7) — and the Sermon on the Mount, where the Messiah hides the almsdeed from human praise: *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* (Matthew 6:4). It ain''t new — the proud heart has no remedy, but the lowly hand that gives finds atonement and a stay.',
       sv.verse_id, ev.verse_id, 'extras', 58362
  FROM _session253_sir03_lookup sv, _session253_sir03_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-3-honour-father-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The Sinai command Ben Sira unfolds when he says Yahuah has given the father honour over the children (Ecclesiasticus 3:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 5:16 — *Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee.* The same long-life promise Ben Sira repeats: he that honoureth his father shall have a long life (Ecclesiasticus 3:6).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* Sha''ul names as the first commandment with promise the very duty Ben Sira urges in word and deed (Ecclesiasticus 3:8).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 15:4 — *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death.* The Messiah holds the same commandment Ben Sira presses, rebuking the tradition that voided it (Ecclesiasticus 3:5).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-honour-father-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-corban-tradition-rebuked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 15:6 — *And honour not his father or his mother, he shall be free. Thus have ye made the commandment of Elohim (God) of none effect by your tradition.* The corban loophole is precisely the forsaking of the father Ben Sira likens to blasphemy (Ecclesiasticus 3:16).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-corban-tradition-rebuked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 12:9 — *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* The sister wisdom-book confirms that the relief of one''s father, counted instead of sins to build a man up, is an almsdeed (Ecclesiasticus 3:14).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-corban-tradition-rebuked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:3 — *That it may be well with thee, and thou mayest live long on the earth.* The promise attached to honouring parents reaches into their old age, where Ben Sira bids the strong have patience (Ecclesiasticus 3:13).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-corban-tradition-rebuked'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-humble-thyself-exalted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The Messiah''s law of the Kingdom is Ben Sira''s counsel that the greater one is, the more he should humble himself (Ecclesiasticus 3:18).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 18:14 — *I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* The publican who humbled himself found the favour before Yahuah that Ben Sira promises the lowly (Ecclesiasticus 3:18).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* Ya''aqob, the closest NT sibling of this book, echoes that Yahuah is honoured of the lowly (Ecclesiasticus 3:20).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh''s wisdom that grace goes to the lowly underwrites Ben Sira''s word that the lowly honour the great power of Yahuah (Ecclesiasticus 3:20).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-humble-thyself-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-seek-not-secret-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law.* Moses'' division of secret and revealed is exactly Ben Sira''s: think on what is commanded, not on the things in secret (Ecclesiasticus 3:22).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-seek-not-secret-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 6:8 — *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* The modest, reverent walk Micah requires is Ben Sira''s mind set on what is commanded rather than the hidden (Ecclesiasticus 3:22).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-seek-not-secret-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* As Ben Sira warns that many are deceived by vain opinion, Daniel divides the wise who understand from the wicked who never will (Ecclesiasticus 3:24).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-seek-not-secret-things'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-3-proud-heart-alms-atones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-saying behind Ben Sira''s verdict that for the punishment of the proud there is no remedy (Ecclesiasticus 3:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The king who learned that the stubborn heart fares evil at the last is living proof of Ben Sira''s word (Ecclesiasticus 3:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:4 — *That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly.* The Sermon takes up Ben Sira''s almsdeed that maketh atonement and hides it from man''s eye (Ecclesiasticus 3:30).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* The sister apocryphal wisdom-book teaches the same: alms quench sin as water quencheth fire (Ecclesiasticus 3:30).'
  FROM cross_reference_threads t, cross_references x, _session253_sir03_lookup sv, _session253_sir03_lookup tv
 WHERE t.slug='ecclesiasticus-3-proud-heart-alms-atones'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_04.sql (session253 ecclesiasticus 4) -----
-- Source anchor: apocrypha/ecclesiasticus ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir04 (view _session253_sir04_lookup). Sort band base 58375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-4-defraud-not-the-poor
  ('apocrypha', 'ecclesiasticus', 4, 1, 'canon', 'deuteronomy', 15, 7, 'free', E'Deuteronomy 15:7 — *If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother:* The Torah forbids the very hardening Ben Sira warns against when he says defraud not the poor of his living.'),
  ('apocrypha', 'ecclesiasticus', 4, 1, 'canon', 'deuteronomy', 15, 8, 'free', E'Deuteronomy 15:8 — *But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth.* The open hand of Deuteronomy is the answer to Sirach''s needy eyes that must not be made to wait long.'),
  ('apocrypha', 'ecclesiasticus', 4, 6, 'canon', 'deuteronomy', 15, 9, 'free', E'Deuteronomy 15:9 — *Beware that there be not a thought in thy wicked heart, saying, The seventh year, the year of release, is at hand; and thine eye be evil against thy poor brother, and thou givest him nought; and he cry unto Yahuah (LORD) against thee, and it be sin unto thee.* The very curse Sirach 4:6 dreads — the poor man''s cry reaching his Maker as sin against the giver — is Moses'' own warning.'),
  ('apocrypha', 'ecclesiasticus', 4, 1, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Sirach''s plea not to defraud the poor rests on the same accounting: mercy to the needy is a loan made to Yahuah Himself.'),
  -- thread: ecclesiasticus-4-hungry-soul-i-was-an-hungred
  ('apocrypha', 'ecclesiasticus', 4, 2, 'canon', 'matthew', 25, 35, 'free', E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The Messiah identifies with the hungry soul Ben Sira forbids us to make sorrowful, counting mercy to the least as mercy to Himself.'),
  ('apocrypha', 'ecclesiasticus', 4, 4, 'canon', 'isaiah', 58, 7, 'free', E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* Isaiah''s chosen fast is the opposite of turning the face away from a poor man that Sirach 4:4 condemns.'),
  ('apocrypha', 'ecclesiasticus', 4, 2, 'canon', 'james', 2, 15, 'free', E'James 2:15 — *If a brother or sister be naked, and destitute of daily food,* James, the wisdom-book of the New Testament nearest to Sirach, sets the same hungry brother before us whom Ben Sira says we must not provoke in his distress.'),
  ('apocrypha', 'ecclesiasticus', 4, 2, 'canon', 'james', 2, 16, 'free', E'James 2:16 — *And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* The hollow word that leaves the hungry sorrowful is exactly what Sirach 4:2 forbids.'),
  -- thread: ecclesiasticus-4-father-to-the-fatherless
  ('apocrypha', 'ecclesiasticus', 4, 10, 'canon', 'psalms', 68, 5, 'free', E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* To be a father to the fatherless, as Sirach 4:10 urges, is to mirror Yahuah Himself, who is the orphan''s Father and the widow''s Judge.'),
  ('apocrypha', 'ecclesiasticus', 4, 10, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* James, Sirach''s nearest NT kin, makes care for the fatherless and widow the mark of pure religion, just as Sirach 4:10 makes it the mark of the son of the Most High.'),
  ('apocrypha', 'ecclesiasticus', 4, 9, 'canon', 'isaiah', 58, 6, 'free', E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* Delivering the one who suffers wrong from the oppressor, the charge of Sirach 4:9, is the very fast Yahuah declares He has chosen.'),
  -- thread: ecclesiasticus-4-wisdom-exalteth-her-children
  ('apocrypha', 'ecclesiasticus', 4, 12, 'canon', 'proverbs', 8, 17, 'free', E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Lady Wisdom''s own promise stands behind Sirach 4:12: he that loves her loves life, and they that seek her early are filled with joy.'),
  ('apocrypha', 'ecclesiasticus', 4, 13, 'canon', 'proverbs', 8, 21, 'free', E'Proverbs 8:21 — *That I may cause those that love me to inherit substance; and I will fill their treasures.* Wisdom''s inheritance for those who love her is the glory Sirach 4:13 says he that holdeth her fast shall inherit.'),
  ('apocrypha', 'ecclesiasticus', 4, 11, 'canon', 'proverbs', 4, 6, 'free', E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* The mutual hold of Sirach 4:11, where wisdom layeth hold of them that seek her, is Proverbs'' counsel to love her and be kept.'),
  ('apocrypha', 'ecclesiasticus', 4, 12, 'apocrypha', 'the-wisdom-of-solomon', 6, 12, 'extras', E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* Sirach''s apocryphal sister-book speaks the same lady Wisdom whom to love is to love life, found of all who seek her early.'),
  -- thread: ecclesiasticus-4-strive-for-the-truth-to-death
  ('apocrypha', 'ecclesiasticus', 4, 17, 'canon', 'proverbs', 3, 11, 'free', E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* Wisdom''s tormenting discipline in Sirach 4:17, which tries the soul by her laws, is the loving correction Proverbs tells the son not to despise.'),
  ('apocrypha', 'ecclesiasticus', 4, 17, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The fear, dread, and discipline by which wisdom proves him in Sirach 4:17 is the scourging Hebrews reads as the proof of sonship, not rejection.'),
  ('apocrypha', 'ecclesiasticus', 4, 26, 'canon', 'proverbs', 28, 13, 'free', E'Proverbs 28:13 — *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy.* Ben Sira''s charge not to be ashamed to confess your sins (Sirach 4:26) is the Proverb''s open road to mercy through confession and forsaking.'),
  ('apocrypha', 'ecclesiasticus', 4, 26, 'canon', '1-john', 1, 9, 'free', E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The unashamed confession Sirach 4:26 commands meets the gospel''s pledge of a faithful and just forgiveness.'),
  ('apocrypha', 'ecclesiasticus', 4, 28, 'canon', 'matthew', 10, 32, 'free', E'Matthew 10:32 — *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* To strive for the truth to death (Sirach 4:28) with Yahuah fighting for thee is the confessing-unto-the-end the Messiah crowns before the Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-defraud-not-the-poor',
       E'Defraud not the poor — his cry is heard of Him that made him',
       E'Ben Sira opens with the cry of the needy laid on the conscience: *My son, defraud not the poor of his living, and make not the needy eyes to wait long.* (Ecclesiasticus 4:1), so that *if he curse you in the bitterness of his soul, his prayer shall be heard of him that made him.* (Ecclesiasticus 4:6). This is no new ethic but the Torah''s own wide-open hand: *If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother:* (Deuteronomy 15:7) — *But thou shalt open thine hand wide unto him* (Deuteronomy 15:8), lest *he cry unto Yahuah (LORD) against thee, and it be sin unto thee.* (Deuteronomy 15:9). The Proverb makes the loan a covenant transaction: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* (Proverbs 19:17). Ben Sira''s wisdom and the Law are one tongue.',
       sv.verse_id, ev.verse_id, 'extras', 58375
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-hungry-soul-i-was-an-hungred',
       E'Make not an hungry soul sorrowful — I was an hungred and ye gave me meat',
       E'Ben Sira charges: *Make not an hungry soul sorrowful; neither provoke a man in his distress.* (Ecclesiasticus 4:2), and *Reject not the supplication of the afflicted; neither turn away your face from a poor man.* (Ecclesiasticus 4:4). The Messiah will fold this very mercy into the judgment of the nations: *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* (Matthew 25:35) — done to the least, done to the King. Isaiah had already named it the fast Yahuah chooses: *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house?* (Isaiah 58:7), with the promise *Then shall thy light break forth as the morning* (Isaiah 58:8). And James, the closest NT sibling of Sirach, exposes the empty word that feeds no one: *If a brother or sister be naked, and destitute of daily food* (James 2:15), *And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* (James 2:16). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58378
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-father-to-the-fatherless',
       E'Be as a father to the fatherless — so shalt thou be as the son of the Most High',
       E'Ben Sira lifts mercy to the orphan into kinship with Heaven: *Be as a father to the fatherless, and instead of an husband to their mother: so shall you be as the son of the Most High, and he shall love you more than your mother does.* (Ecclesiasticus 4:10), having first urged: *Deliver him that suffers wrong from the hand of the oppressor; and be not fainthearted when you sittest in judgment.* (Ecclesiasticus 4:9). This is the very portrait of Yahuah Himself: *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* (Psalm 68:5) — so to father the fatherless is to bear His own image. James names this the heart of true worship: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* (James 1:27). And the Sermon promises the peacemaking, merciful son the Father''s likeness, as Sirach promises the orphan''s defender shall be called the son of the Most High.',
       sv.verse_id, ev.verse_id, 'extras', 58381
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-wisdom-exalteth-her-children',
       E'Whoso loveth her loveth life — wisdom exalteth her children',
       E'Sirach turns from mercy to the lady Wisdom herself: *Wisdom exalteth her children, and layeth hold of them that seek her.* (Ecclesiasticus 4:11), *He that loves her loves life; and they that seek to her early shall be filled with joy.* (Ecclesiasticus 4:12), *He that holdeth her fast shall inherit glory; and wherever she entereth, Yahuah (God) will bless.* (Ecclesiasticus 4:13). This is Proverbs 8 made plain — the formed Wisdom of Yahuah declaring *I love them that love me; and those that seek me early shall find me.* (Proverbs 8:17), whose gift is *Riches and honour are with me; yea, durable riches and righteousness.* (Proverbs 8:18), and *That I may cause those that love me to inherit substance; and I will fill their treasures.* (Proverbs 8:21). Proverbs 4 commands the same fast embrace: *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* (Proverbs 4:6). And the live Wisdom of Solomon, Sirach''s apocryphal sister, echoes it: *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* (Wisdom of Solomon 6:12).',
       sv.verse_id, ev.verse_id, 'extras', 58384
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-4-strive-for-the-truth-to-death',
       E'Strive for the truth to death — and Yahuah shall fight for thee',
       E'The chapter''s summit binds discipline, confession, and faithfulness unto death. Wisdom first proves her own: *For at the first she will walk with him by crooked ways, and bring fear and dread upon him, and torment him with her discipline, until she may trust his soul, and try him by her laws.* (Ecclesiasticus 4:17) — the very chastening Proverbs names love: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* (Proverbs 3:11), which Hebrews seals, *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6). Then Ben Sira: *Be not ashamed to confess your sins; and force not the course of the river.* (Ecclesiasticus 4:26) — *whoso confesseth and forsaketh them shall have mercy.* (Proverbs 28:13), and the gospel''s own pledge, *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* (1 John 1:9). And the crown: *Strive for the truth to death, and Yahuah (God) shall fight for you.* (Ecclesiasticus 4:28) — Torah-faithfulness unto the end, with the promise that he who confesses Him is confessed: *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* (Matthew 10:32).',
       sv.verse_id, ev.verse_id, 'extras', 58387
  FROM _session253_sir04_lookup sv, _session253_sir04_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=4 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-4-defraud-not-the-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:7 — *If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother:* The Torah forbids the very hardening Ben Sira warns against when he says defraud not the poor of his living.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:8 — *But thou shalt open thine hand wide unto him, and shalt surely lend him sufficient for his need, in that which he wanteth.* The open hand of Deuteronomy is the answer to Sirach''s needy eyes that must not be made to wait long.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 15:9 — *Beware that there be not a thought in thy wicked heart, saying, The seventh year, the year of release, is at hand; and thine eye be evil against thy poor brother, and thou givest him nought; and he cry unto Yahuah (LORD) against thee, and it be sin unto thee.* The very curse Sirach 4:6 dreads — the poor man''s cry reaching his Maker as sin against the giver — is Moses'' own warning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* Sirach''s plea not to defraud the poor rests on the same accounting: mercy to the needy is a loan made to Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-defraud-not-the-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-hungry-soul-i-was-an-hungred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 25:35 — *For I was an hungred, and ye gave me meat: I was thirsty, and ye gave me drink: I was a stranger, and ye took me in:* The Messiah identifies with the hungry soul Ben Sira forbids us to make sorrowful, counting mercy to the least as mercy to Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* Isaiah''s chosen fast is the opposite of turning the face away from a poor man that Sirach 4:4 condemns.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 2:15 — *If a brother or sister be naked, and destitute of daily food,* James, the wisdom-book of the New Testament nearest to Sirach, sets the same hungry brother before us whom Ben Sira says we must not provoke in his distress.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 2:16 — *And one of you say unto them, Depart in peace, be ye warmed and filled; notwithstanding ye give them not those things which are needful to the body; what doth it profit?* The hollow word that leaves the hungry sorrowful is exactly what Sirach 4:2 forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-hungry-soul-i-was-an-hungred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-father-to-the-fatherless
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 68:5 — *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation.* To be a father to the fatherless, as Sirach 4:10 urges, is to mirror Yahuah Himself, who is the orphan''s Father and the widow''s Judge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-father-to-the-fatherless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world.* James, Sirach''s nearest NT kin, makes care for the fatherless and widow the mark of pure religion, just as Sirach 4:10 makes it the mark of the son of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-father-to-the-fatherless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* Delivering the one who suffers wrong from the oppressor, the charge of Sirach 4:9, is the very fast Yahuah declares He has chosen.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-father-to-the-fatherless'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-wisdom-exalteth-her-children
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Lady Wisdom''s own promise stands behind Sirach 4:12: he that loves her loves life, and they that seek her early are filled with joy.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:21 — *That I may cause those that love me to inherit substance; and I will fill their treasures.* Wisdom''s inheritance for those who love her is the glory Sirach 4:13 says he that holdeth her fast shall inherit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* The mutual hold of Sirach 4:11, where wisdom layeth hold of them that seek her, is Proverbs'' counsel to love her and be kept.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* Sirach''s apocryphal sister-book speaks the same lady Wisdom whom to love is to love life, found of all who seek her early.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-wisdom-exalteth-her-children'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-4-strive-for-the-truth-to-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* Wisdom''s tormenting discipline in Sirach 4:17, which tries the soul by her laws, is the loving correction Proverbs tells the son not to despise.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The fear, dread, and discipline by which wisdom proves him in Sirach 4:17 is the scourging Hebrews reads as the proof of sonship, not rejection.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 28:13 — *He that covereth his sins shall not prosper: but whoso confesseth and forsaketh them shall have mercy.* Ben Sira''s charge not to be ashamed to confess your sins (Sirach 4:26) is the Proverb''s open road to mercy through confession and forsaking.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 1:9 — *If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.* The unashamed confession Sirach 4:26 commands meets the gospel''s pledge of a faithful and just forgiveness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 10:32 — *Whosoever therefore shall confess me before men, him will I confess also before my Father which is in heaven.* To strive for the truth to death (Sirach 4:28) with Yahuah fighting for thee is the confessing-unto-the-end the Messiah crowns before the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_sir04_lookup sv, _session253_sir04_lookup tv
 WHERE t.slug='ecclesiasticus-4-strive-for-the-truth-to-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=4 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_05.sql (session253 ecclesiasticus 5) -----
-- Source anchor: apocrypha/ecclesiasticus ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir05 (view _session253_sir05_lookup). Sort band base 58400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-5-trust-not-in-riches
  ('apocrypha', 'ecclesiasticus', 5, 1, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool who said "I have enough for my life" is the very man Ecclesiasticus 5:1 warns against.'),
  ('apocrypha', 'ecclesiasticus', 5, 1, 'canon', 'matthew', 6, 19, 'free', E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Master forbids the heart set on goods that Ecclesiasticus 5:1 calls vain.'),
  ('apocrypha', 'ecclesiasticus', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The companion wisdom-book voices the dead man''s regret over the goods that did not profit in the day of calamity (Ecclesiasticus 5:8).'),
  -- thread: ecclesiasticus-5-say-not-i-have-sinned-what-harm
  ('apocrypha', 'ecclesiasticus', 5, 4, 'canon', 'ecclesiastes', 8, 11, 'free', E'Ecclesiastes 8:11 — *Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil.* The Preacher names the very self-deceit of "I have sinned, and what harm" in Ecclesiasticus 5:4.'),
  ('apocrypha', 'ecclesiasticus', 5, 4, 'canon', 'romans', 2, 4, 'free', E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Sha''ul shows the longsuffering of Ecclesiasticus 5:4 is mercy unto repentance, not permission to add sin.'),
  ('apocrypha', 'ecclesiasticus', 5, 4, 'canon', 'romans', 2, 5, 'free', E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* The man who says "what harm" (Ecclesiasticus 5:4) is in fact treasuring up wrath against the day of vengeance.'),
  -- thread: ecclesiasticus-5-mercy-and-wrath-presume-not
  ('apocrypha', 'ecclesiasticus', 5, 6, 'apocrypha', 'the-wisdom-of-solomon', 11, 23, 'extras', E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* The companion book confirms the mercy of Ecclesiasticus 5:6 is real, but given that men should amend — not that they may add sin to sin.'),
  ('apocrypha', 'ecclesiasticus', 5, 5, 'apocrypha', 'the-wisdom-of-solomon', 12, 10, 'extras', E'Wisdom of Solomon 12:10 — *But executing your judgments upon them by little and little, you gavest them place of repentance, not being ignorant that they were a naughty generation, and that their malice was bred in them, and that their cogitation would never be changed.* The space for repentance is the very propitiation Ecclesiasticus 5:5 says to fear adding sin against.'),
  ('apocrypha', 'ecclesiasticus', 5, 6, 'canon', 'romans', 2, 5, 'free', E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* He who presumes "His mercy is great" (Ecclesiasticus 5:6) forgets that wrath also rests on the impenitent.'),
  -- thread: ecclesiasticus-5-make-no-tarrying-to-turn
  ('apocrypha', 'ecclesiasticus', 5, 7, 'canon', 'proverbs', 27, 1, 'free', E'Proverbs 27:1 — *Boast not thyself of to morrow; for thou knowest not what a day may bring forth.* The proverb against presuming on tomorrow undergirds Ben Sira''s "put not off from day to day" (Ecclesiasticus 5:7).'),
  ('apocrypha', 'ecclesiasticus', 5, 7, 'canon', '2-corinthians', 6, 2, 'free', E'2 Corinthians 6:2 — *For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.* Sha''ul presses the same "make no tarrying" of Ecclesiasticus 5:7 — the day to turn is now.'),
  ('apocrypha', 'ecclesiasticus', 5, 7, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* He who is at ease "in your security" (Ecclesiasticus 5:7) is the fool whose soul is suddenly required.'),
  -- thread: ecclesiasticus-5-double-tongue-winnow-not
  ('apocrypha', 'ecclesiasticus', 5, 9, 'canon', 'james', 3, 5, 'free', E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* Ya''aqov, Sirach''s nearest sibling, takes up the same peril of the double tongue named in Ecclesiasticus 5:9.'),
  ('apocrypha', 'ecclesiasticus', 5, 10, 'canon', 'proverbs', 10, 19, 'free', E'Proverbs 10:19 — *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* The proverb commends the steadfast, single word Ben Sira urges in Ecclesiasticus 5:10.'),
  -- thread: ecclesiasticus-5-swift-to-hear-slow-to-answer
  ('apocrypha', 'ecclesiasticus', 5, 11, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* Ya''aqov all but quotes Ecclesiasticus 5:11 — "be swift to hear... with patience give answer" — the closest NT echo of ben Sira.'),
  ('apocrypha', 'ecclesiasticus', 5, 12, 'canon', 'proverbs', 17, 28, 'free', E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The proverb commends the "lay thy hand upon thy mouth" restraint of Ecclesiasticus 5:12.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-trust-not-in-riches',
       E'Set not thine heart upon goods — thou fool, this night',
       E'Ben Sira opens against the lie of self-sufficiency: *Set your heart upon your goods; and say not, I have enough for my life.* (Ecclesiasticus 5:1) — and warns *Set not yours heart upon goods unjustly gotten, for they shall not profit you in the day of calamity.* (Ecclesiasticus 5:8). It ain''t new — this is the rich fool of the Master''s parable, the barns torn down to build greater: *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). The Sermon on the Mount says the same: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* (Matthew 6:19). And the sibling apocryphal wisdom-book asks the very question over the grave: *What has pride profited us? or what good has riches with our vaunting brought us?* (Wisdom of Solomon 5:8) — for the goods cannot answer in the day of calamity.',
       sv.verse_id, ev.verse_id, 'extras', 58400
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-say-not-i-have-sinned-what-harm',
       E'Say not, I have sinned, and what harm — presume not on delayed judgment',
       E'*And say not, I have sinned, and what harm has happened to me? for Yahuah (God) is longsuffering, he will in no wise let you go.* (Ecclesiasticus 5:4) — the sinner reads the silence of God as license. It ain''t new: the Preacher diagnosed the same self-deceit, *Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil.* (Ecclesiastes 8:11). And Sha''ul presses it into a warning — the delay is goodness meant to lead to repentance, not a verdict of acquittal: *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4), *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* (Romans 2:5). The longsuffering Ben Sira names is the same forbearance that the impenitent abuse.',
       sv.verse_id, ev.verse_id, 'extras', 58403
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-mercy-and-wrath-presume-not',
       E'His mercy is great — yet mercy and wrath both come from him',
       E'Against presumption on grace: *And say not His mercy is great; he will be pacified for the multitude of my sins: for mercy and wrath come from him, and his indignation resteth upon sinners.* (Ecclesiasticus 5:6), *Concerning propitiation, be not without fear to add sin to sin:* (Ecclesiasticus 5:5). The wisdom is held in tension — the sibling apocryphal book affirms the mercy is real, *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* (Wisdom of Solomon 11:23), and that judgment itself opens a door, *But executing your judgments upon them by little and little, you gavest them place of repentance...* (Wisdom of Solomon 12:10) — yet the space is given that they *should amend*, not that they may presume. Hence Sha''ul''s verdict on the man who despises that forbearance: *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath...* (Romans 2:5). Mercy and wrath both come from the one hand.',
       sv.verse_id, ev.verse_id, 'extras', 58406
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-make-no-tarrying-to-turn',
       E'Make no tarrying to turn to Yahuah — now is the accepted time',
       E'The urgency of repentance: *Make no tarrying to turn to Yahuah (God), and put not off from day to day: for suddenly shall the wrath of Yahuah (God) come forth, and in your security you shall be destroyed, and perish in the day of vengeance.* (Ecclesiasticus 5:7). It ain''t new — wisdom forbids deferring even a boast: *Boast not thyself of to morrow; for thou knowest not what a day may bring forth.* (Proverbs 27:1). And the gospel seals the hour: *...behold, now is the accepted time; behold, now is the day of salvation.* (2 Corinthians 6:2). The man at ease in his security is the rich fool whose soul is required *this night* — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee...* (Luke 12:20). Turn now; the day of vengeance keeps no appointment with the procrastinator.',
       sv.verse_id, ev.verse_id, 'extras', 58409
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-double-tongue-winnow-not',
       E'Winnow not with every wind — the double tongue',
       E'Against duplicity of speech: *Winnow not with every wind, and go not into every way: for so does the sinner that has a double tongue.* (Ecclesiasticus 5:9), and the call to single-minded steadfastness, *Be stedfast in your understanding; and let your word be the same.* (Ecclesiasticus 5:10). It ain''t new — wisdom warns of the slander and the betraying tongue: *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* (Proverbs 10:19). And Ya''aqov, Sirach''s nearest NT sibling, names the divided man and the untamed tongue: *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* (James 3:5). The sinner who winnows with every wind is the double-minded man, unstable in all his ways.',
       sv.verse_id, ev.verse_id, 'extras', 58412
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-5-swift-to-hear-slow-to-answer',
       E'Be swift to hear, slow to answer — lay thy hand on thy mouth',
       E'The chapter''s most famous line, all but quoted by Ya''aqov: *Be swift to hear; and let your life be sincere; and with patience give answer.* (Ecclesiasticus 5:11), *If you have understanding, answer your neighbour; if not, lay your hand upon your mouth.* (Ecclesiasticus 5:12). It ain''t new — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* (James 1:19) is the same wisdom in NT dress, the Epistle of Ya''aqov leaning on the Wisdom of ben Sira. And the Tanakh wisdom-book commends the very restraint of "lay thy hand on thy mouth": *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* (Proverbs 17:28). Swift to hear, slow to answer — and the tongue of man is his fall (Ecclesiasticus 5:13).',
       sv.verse_id, ev.verse_id, 'extras', 58415
  FROM _session253_sir05_lookup sv, _session253_sir05_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-5-trust-not-in-riches
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool who said "I have enough for my life" is the very man Ecclesiasticus 5:1 warns against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-trust-not-in-riches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:19 — *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt, and where thieves break through and steal:* The Master forbids the heart set on goods that Ecclesiasticus 5:1 calls vain.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-trust-not-in-riches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The companion wisdom-book voices the dead man''s regret over the goods that did not profit in the day of calamity (Ecclesiasticus 5:8).'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-trust-not-in-riches'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-say-not-i-have-sinned-what-harm
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 8:11 — *Because sentence against an evil work is not executed speedily, therefore the heart of the sons of men is fully set in them to do evil.* The Preacher names the very self-deceit of "I have sinned, and what harm" in Ecclesiasticus 5:4.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-say-not-i-have-sinned-what-harm'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Sha''ul shows the longsuffering of Ecclesiasticus 5:4 is mercy unto repentance, not permission to add sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-say-not-i-have-sinned-what-harm'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* The man who says "what harm" (Ecclesiasticus 5:4) is in fact treasuring up wrath against the day of vengeance.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-say-not-i-have-sinned-what-harm'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-mercy-and-wrath-presume-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* The companion book confirms the mercy of Ecclesiasticus 5:6 is real, but given that men should amend — not that they may add sin to sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-mercy-and-wrath-presume-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 12:10 — *But executing your judgments upon them by little and little, you gavest them place of repentance, not being ignorant that they were a naughty generation, and that their malice was bred in them, and that their cogitation would never be changed.* The space for repentance is the very propitiation Ecclesiasticus 5:5 says to fear adding sin against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-mercy-and-wrath-presume-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God);* He who presumes "His mercy is great" (Ecclesiasticus 5:6) forgets that wrath also rests on the impenitent.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-mercy-and-wrath-presume-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-make-no-tarrying-to-turn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:1 — *Boast not thyself of to morrow; for thou knowest not what a day may bring forth.* The proverb against presuming on tomorrow undergirds Ben Sira''s "put not off from day to day" (Ecclesiasticus 5:7).'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-make-no-tarrying-to-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 6:2 — *For he saith, I have heard thee in a time accepted, and in the day of salvation have I succoured thee: behold, now is the accepted time; behold, now is the day of salvation.* Sha''ul presses the same "make no tarrying" of Ecclesiasticus 5:7 — the day to turn is now.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-make-no-tarrying-to-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* He who is at ease "in your security" (Ecclesiasticus 5:7) is the fool whose soul is suddenly required.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-make-no-tarrying-to-turn'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-double-tongue-winnow-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* Ya''aqov, Sirach''s nearest sibling, takes up the same peril of the double tongue named in Ecclesiasticus 5:9.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-double-tongue-winnow-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 10:19 — *In the multitude of words there wanteth not sin: but he that refraineth his lips is wise.* The proverb commends the steadfast, single word Ben Sira urges in Ecclesiasticus 5:10.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-double-tongue-winnow-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-5-swift-to-hear-slow-to-answer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath:* Ya''aqov all but quotes Ecclesiasticus 5:11 — "be swift to hear... with patience give answer" — the closest NT echo of ben Sira.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-swift-to-hear-slow-to-answer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The proverb commends the "lay thy hand upon thy mouth" restraint of Ecclesiasticus 5:12.'
  FROM cross_reference_threads t, cross_references x, _session253_sir05_lookup sv, _session253_sir05_lookup tv
 WHERE t.slug='ecclesiasticus-5-swift-to-hear-slow-to-answer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_06.sql (session253 ecclesiasticus 6) -----
-- Source anchor: apocrypha/ecclesiasticus ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir06 (view _session253_sir06_lookup). Sort band base 58425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-6-double-tongue
  ('apocrypha', 'ecclesiasticus', 6, 1, 'canon', 'psalms', 12, 2, 'free', E'Psalm 12:2 — *They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* The double heart of David''s psalm is Ben Sira''s "double tongue" that turns a friend into an enemy in Sirach 6:1.'),
  ('apocrypha', 'ecclesiasticus', 6, 1, 'canon', 'james', 3, 8, 'free', E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* The Messiah''s brother frames the untamed tongue exactly as Ben Sira does in Sirach 6:1 — the instrument that breeds shame and reproach.'),
  ('apocrypha', 'ecclesiasticus', 6, 1, 'canon', 'james', 3, 10, 'free', E'James 3:10 — *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* James names the very double-mouthedness of the "double tongue" of Sirach 6:1 — blessing and cursing cannot share one tongue.'),
  ('apocrypha', 'ecclesiasticus', 6, 5, 'canon', 'matthew', 12, 35, 'free', E'Matthew 12:35 — *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* The Messiah roots the "sweet language" of Sirach 6:5 where Ben Sira does — in the treasure of the heart that the tongue spends.'),
  -- thread: ecclesiasticus-6-prove-a-friend
  ('apocrypha', 'ecclesiasticus', 6, 6, 'canon', 'proverbs', 18, 24, 'free', E'Proverbs 18:24 — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* The proverb''s "friend that sticketh closer than a brother" is the rare one-of-a-thousand counsellor Ben Sira tells you to seek in Sirach 6:6.'),
  ('apocrypha', 'ecclesiasticus', 6, 7, 'canon', 'proverbs', 27, 6, 'free', E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Proverbs gives the test Ben Sira commands in Sirach 6:7 — prove a friend by whether his honest wounds outlast a flatterer''s kisses.'),
  ('apocrypha', 'ecclesiasticus', 6, 8, 'canon', 'proverbs', 13, 20, 'free', E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The fair-weather "friend for his own occasion" of Sirach 6:8 is the companion of fools who is destroyed in the day of trouble.'),
  -- thread: ecclesiasticus-6-faithful-friend
  ('apocrypha', 'ecclesiasticus', 6, 14, 'canon', 'proverbs', 17, 17, 'free', E'Proverbs 17:17 — *A friend loveth at all times, and a brother is born for adversity.* Solomon''s friend who loves at all times is Ben Sira''s "strong defence" and "treasure" — the faithful friend of Sirach 6:14.'),
  ('apocrypha', 'ecclesiasticus', 6, 16, 'canon', 'john', 15, 13, 'free', E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The Messiah''s laid-down life is the medicine-of-life friendship of Sirach 6:16 carried to its fullest measure.'),
  ('apocrypha', 'ecclesiasticus', 6, 16, 'canon', 'john', 15, 15, 'free', E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* He who fears the Father names His own as friends — the faithful friend that those who fear Yahuah shall find in Sirach 6:16.'),
  ('apocrypha', 'ecclesiasticus', 6, 17, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Ben Sira anchors right friendship in the fear of Yahuah in Sirach 6:17 — the same fear Proverbs calls the beginning of wisdom.'),
  -- thread: ecclesiasticus-6-plow-and-seek-wisdom
  ('apocrypha', 'ecclesiasticus', 6, 19, 'canon', 'proverbs', 8, 17, 'free', E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Wisdom herself answers the plower and sower of Sirach 6:19 — those who seek her early eat of her fruits soon.'),
  ('apocrypha', 'ecclesiasticus', 6, 27, 'canon', 'proverbs', 2, 4, 'free', E'Proverbs 2:4 — *If thou seekest her as silver, and searchest for her as for hid treasures;* Solomon''s command to search for wisdom as for hid treasure is Ben Sira''s "Search, and seek" and "let her not go" of Sirach 6:27.'),
  ('apocrypha', 'ecclesiasticus', 6, 19, 'apocrypha', 'the-wisdom-of-solomon', 6, 14, 'extras', E'Wisdom of Solomon 6:14 — *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* The sibling wisdom book echoes Sirach 6:19 verse for verse — the early seeker toils little and finds her near at hand.'),
  ('apocrypha', 'ecclesiasticus', 6, 18, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* James makes the youthful gathering of instruction in Sirach 6:18 a matter of asking the Giver who upbraids not.'),
  -- thread: ecclesiasticus-6-yoke-of-wisdom
  ('apocrypha', 'ecclesiasticus', 6, 25, 'canon', 'matthew', 11, 29, 'free', E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* The bowed shoulder bearing Wisdom''s bonds in Sirach 6:25 is the Messiah''s yoke that gives rest to the soul.'),
  ('apocrypha', 'ecclesiasticus', 6, 25, 'canon', 'matthew', 11, 30, 'free', E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* Ben Sira''s promise that Wisdom''s bonds need not grieve you in Sirach 6:25 is the Messiah''s easy yoke and light burden.'),
  ('apocrypha', 'ecclesiasticus', 6, 29, 'apocrypha', 'the-wisdom-of-solomon', 7, 14, 'extras', E'Wisdom of Solomon 7:14 — *For she is a treasure to men that never fails: which they that use become the friends of Yahuah (God), being commended for the gifts that come from learning.* The sibling book turns Wisdom''s chains into the same treasure and robe of glory as Sirach 6:29 — and back to the friendship theme of the chapter.'),
  -- thread: ecclesiasticus-6-elders-and-commandments
  ('apocrypha', 'ecclesiasticus', 6, 37, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Ben Sira''s command to meditate continually in His commandments in Sirach 6:37 is the delight and day-and-night meditation of the blessed man.'),
  ('apocrypha', 'ecclesiasticus', 6, 37, 'canon', 'deuteronomy', 6, 6, 'free', E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* The Shema''s charge to carry Yahuah''s words in the heart is the established heart Ben Sira promises in Sirach 6:37.'),
  ('apocrypha', 'ecclesiasticus', 6, 37, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The mind fixed on Yahuah''s ordinances in Sirach 6:37 receives wisdom because the fear of Yahuah is where all knowledge begins.'),
  ('apocrypha', 'ecclesiasticus', 6, 34, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* He who cleaves to the wise elders of Sirach 6:34 becomes the fruitful, unwithering tree — the opposite of the dry tree of Sirach 6:3.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-double-tongue',
       E'The double tongue and the sweet word',
       E'Ben Sira opens the chapter weighing the power of the tongue to make either an enemy or a friend: *Instead of a friend become not an enemy; for thereby you shall inherit an ill name, shame, and reproach: even so shall a sinner that has a double tongue.* (Ecclesiasticus 6:1), where instead *Sweet language will multiply friends: and a fairspeaking tongue will increase kind greetings.* (Ecclesiasticus 6:5). This is the same wisdom David sang against — *They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* (Psalm 12:2) — and the same the half-brother of the Messiah would carry into the assembly: *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* (James 3:8), and *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* (James 3:10). It ain''t new — the Messiah Himself measured a man by the treasure of his words: *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* (Matthew 12:35).',
       sv.verse_id, ev.verse_id, 'extras', 58425
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-prove-a-friend',
       E'Prove a friend before you trust',
       E'Ben Sira counsels patience before trust: *Be in peace with many: nevertheless have but one counsellor of a thousand.* (Ecclesiasticus 6:6), and *If you would get a friend, prove him first and be not hasty to credit him.* (Ecclesiasticus 6:7), for *some man is a friend for his own occasion, and will not abide in the day of your trouble.* (Ecclesiasticus 6:8). This is Proverbs'' own warning that crowds are not company — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* (Proverbs 18:24) — and that the wounds of a true friend are to be preferred to a false one''s flattery: *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* (Proverbs 27:6). The wise are known by their walking partners: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 13:20) — the iron that proves and sharpens.',
       sv.verse_id, ev.verse_id, 'extras', 58428
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-faithful-friend',
       E'A faithful friend is the medicine of life',
       E'The chapter''s crown: *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* (Ecclesiasticus 6:14), *Nothing does countervail a faithful friend, and his excellency is invaluable.* (Ecclesiasticus 6:15), and *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him.* (Ecclesiasticus 6:16). This is Solomon''s friend that does not turn with the seasons — *A friend loveth at all times, and a brother is born for adversity.* (Proverbs 17:17) — and it is the very love the Messiah named the greatest, the love that lays itself down: *Greater love hath no man than this, that a man lay down his life for his friends.* (John 15:13). He who is the faithful Friend then names His own: *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* (John 15:15). It ain''t new — and notice Ben Sira binds the true friend to the fear of Yahuah, the beginning of all wisdom: *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* (Proverbs 9:10).',
       sv.verse_id, ev.verse_id, 'extras', 58431
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-plow-and-seek-wisdom',
       E'Come to her as one that ploweth and sows',
       E'Ben Sira turns from friendship to Wisdom herself, the labour that bears fruit: *Come to her as one that ploweth and sows, and wait for her good fruits: for you shall not toil much in labouring about her, but you shall eat of her fruits right soon.* (Ecclesiasticus 6:19), and *Search, and seek, and she shall be made known to you: and when you have got hold of her, let her not go.* (Ecclesiasticus 6:27). This is Solomon''s command to dig for her as for buried treasure — *If thou seekest her as silver, and searchest for her as for hid treasures;* (Proverbs 2:4) — with the promise that she answers the early seeker: *I love them that love me; and those that seek me early shall find me.* (Proverbs 8:17). The deuterocanon''s own Wisdom of Solomon sings the same — that she meets the seeker at his door: *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* (Wisdom of Solomon 6:14) — and the Messiah''s brother makes the asking simple: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* (James 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 58434
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-yoke-of-wisdom',
       E'Her fetters a robe of glory',
       E'Ben Sira''s great paradox: the bonds of Wisdom become a crown. *And put your feet into her fetters, and your neck into her chain.* (Ecclesiasticus 6:24), *Bow down your shoulder, and bear her, and be not grieved with her bonds.* (Ecclesiasticus 6:25), until *Then shall her fetters be a strong defence for you, and her chains a robe of glory.* (Ecclesiasticus 6:29). This is the Messiah''s own yoke that does not crush but rests — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* (Matthew 11:29), *For my yoke is easy, and my burden is light.* (Matthew 11:30) — the bonds that turn out light. And the deuterocanon''s Wisdom of Solomon binds wisdom to friendship with Yahuah and treasure that never fails: *For she is a treasure to men that never fails: which they that use become the friends of Yahuah (God), being commended for the gifts that come from learning.* (Wisdom of Solomon 7:14). It ain''t new — submit the neck, and the chain becomes a robe.',
       sv.verse_id, ev.verse_id, 'extras', 58437
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-6-elders-and-commandments',
       E'Stand with the elders, meditate on His commandments',
       E'The chapter closes in the school of the wise and the law of Yahuah: *Stand in the multitude of the elders; and cleave to him that is wise.* (Ecclesiasticus 6:34), and the capstone, *Let your mind be upon the ordinances of Yahuah (God) and meditate continually in his commandments: he shall establish yours heart, and give you wisdom at your owns desire.* (Ecclesiasticus 6:37). This is the first Psalm''s blessed man — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* (Psalm 1:2) — who becomes *like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* (Psalm 1:3), the very opposite of the dry tree of Sirach 6:3. It is the Shema''s charge to keep the words in the heart — *And these words, which I command thee this day, shall be in thine heart:* (Deuteronomy 6:6) — for Torah stands, and the fear of Yahuah is the beginning of knowledge: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* (Proverbs 1:7).',
       sv.verse_id, ev.verse_id, 'extras', 58440
  FROM _session253_sir06_lookup sv, _session253_sir06_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=6 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-6-double-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 12:2 — *They speak vanity every one with his neighbour: with flattering lips and with a double heart do they speak.* The double heart of David''s psalm is Ben Sira''s "double tongue" that turns a friend into an enemy in Sirach 6:1.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* The Messiah''s brother frames the untamed tongue exactly as Ben Sira does in Sirach 6:1 — the instrument that breeds shame and reproach.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 3:10 — *Out of the same mouth proceedeth blessing and cursing. My brethren, these things ought not so to be.* James names the very double-mouthedness of the "double tongue" of Sirach 6:1 — blessing and cursing cannot share one tongue.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 12:35 — *A good man out of the good treasure of the heart bringeth forth good things: and an evil man out of the evil treasure bringeth forth evil things.* The Messiah roots the "sweet language" of Sirach 6:5 where Ben Sira does — in the treasure of the heart that the tongue spends.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-double-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-prove-a-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:24 — *A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother.* The proverb''s "friend that sticketh closer than a brother" is the rare one-of-a-thousand counsellor Ben Sira tells you to seek in Sirach 6:6.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-prove-a-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Proverbs gives the test Ben Sira commands in Sirach 6:7 — prove a friend by whether his honest wounds outlast a flatterer''s kisses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-prove-a-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The fair-weather "friend for his own occasion" of Sirach 6:8 is the companion of fools who is destroyed in the day of trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-prove-a-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-faithful-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 17:17 — *A friend loveth at all times, and a brother is born for adversity.* Solomon''s friend who loves at all times is Ben Sira''s "strong defence" and "treasure" — the faithful friend of Sirach 6:14.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends.* The Messiah''s laid-down life is the medicine-of-life friendship of Sirach 6:16 carried to its fullest measure.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* He who fears the Father names His own as friends — the faithful friend that those who fear Yahuah shall find in Sirach 6:16.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Ben Sira anchors right friendship in the fear of Yahuah in Sirach 6:17 — the same fear Proverbs calls the beginning of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-faithful-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-plow-and-seek-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:17 — *I love them that love me; and those that seek me early shall find me.* Wisdom herself answers the plower and sower of Sirach 6:19 — those who seek her early eat of her fruits soon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 2:4 — *If thou seekest her as silver, and searchest for her as for hid treasures;* Solomon''s command to search for wisdom as for hid treasure is Ben Sira''s "Search, and seek" and "let her not go" of Sirach 6:27.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 6:14 — *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors.* The sibling wisdom book echoes Sirach 6:19 verse for verse — the early seeker toils little and finds her near at hand.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* James makes the youthful gathering of instruction in Sirach 6:18 a matter of asking the Giver who upbraids not.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-plow-and-seek-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-yoke-of-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 11:29 — *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.* The bowed shoulder bearing Wisdom''s bonds in Sirach 6:25 is the Messiah''s yoke that gives rest to the soul.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-yoke-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 11:30 — *For my yoke is easy, and my burden is light.* Ben Sira''s promise that Wisdom''s bonds need not grieve you in Sirach 6:25 is the Messiah''s easy yoke and light burden.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-yoke-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 7:14 — *For she is a treasure to men that never fails: which they that use become the friends of Yahuah (God), being commended for the gifts that come from learning.* The sibling book turns Wisdom''s chains into the same treasure and robe of glory as Sirach 6:29 — and back to the friendship theme of the chapter.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-yoke-of-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-6-elders-and-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Ben Sira''s command to meditate continually in His commandments in Sirach 6:37 is the delight and day-and-night meditation of the blessed man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:6 — *And these words, which I command thee this day, shall be in thine heart:* The Shema''s charge to carry Yahuah''s words in the heart is the established heart Ben Sira promises in Sirach 6:37.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The mind fixed on Yahuah''s ordinances in Sirach 6:37 receives wisdom because the fear of Yahuah is where all knowledge begins.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* He who cleaves to the wise elders of Sirach 6:34 becomes the fruitful, unwithering tree — the opposite of the dry tree of Sirach 6:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir06_lookup sv, _session253_sir06_lookup tv
 WHERE t.slug='ecclesiasticus-6-elders-and-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=6 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_07.sql (session253 ecclesiasticus 7) -----
-- Source anchor: apocrypha/ecclesiasticus ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir07 (view _session253_sir07_lookup). Sort band base 58450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-7-do-no-evil-flee-iniquity
  ('apocrypha', 'ecclesiasticus', 7, 1, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* — the wisdom of which Sirach 7:1''s "do no evil" is the first lived obedience.'),
  ('apocrypha', 'ecclesiasticus', 7, 2, 'canon', 'james', 1, 27, 'free', E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* — the same departing-from-iniquity that Sirach 7:2 urges, framed as undefiled religion.'),
  -- thread: ecclesiasticus-7-humble-thyself
  ('apocrypha', 'ecclesiasticus', 7, 17, 'canon', 'proverbs', 3, 34, 'free', E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly* — the same exalting of the lowly that Sirach 7:17''s "humble thyself greatly" commands.'),
  ('apocrypha', 'ecclesiasticus', 7, 17, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* — James draws the very Proverb Sirach 7:17 dramatizes with "the vengeance of the ungodly."'),
  ('apocrypha', 'ecclesiasticus', 7, 17, 'canon', 'james', 4, 10, 'free', E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the command form of Sirach 7:17''s "Humble thyself greatly."'),
  ('apocrypha', 'ecclesiasticus', 7, 11, 'canon', 'james', 4, 10, 'free', E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the One who "humbleth and exalteth" of Sirach 7:11 is the same Yahuah who lifts up the humble.'),
  -- thread: ecclesiasticus-7-lie-not-bridle-the-tongue
  ('apocrypha', 'ecclesiasticus', 7, 13, 'canon', 'james', 1, 26, 'free', E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* — the same bridling of lying speech Sirach 7:13 calls for, for "the custom thereof is not good."'),
  ('apocrypha', 'ecclesiasticus', 7, 14, 'canon', 'james', 1, 19, 'free', E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath* — the slow-to-speak restraint Sirach 7:14 urges against "much babbling."'),
  -- thread: ecclesiasticus-7-honour-father-and-mother
  ('apocrypha', 'ecclesiasticus', 7, 27, 'canon', 'exodus', 20, 12, 'free', E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* — the Decalogue word Sirach 7:27 expounds "with your whole heart."'),
  ('apocrypha', 'ecclesiasticus', 7, 27, 'canon', 'ephesians', 6, 2, 'free', E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* — Paul names as covenant-promise the very honour Sirach 7:27 commands.'),
  ('apocrypha', 'ecclesiasticus', 7, 23, 'canon', 'proverbs', 22, 6, 'free', E'Proverbs 22:6 — *Train up a child in the way he should go: and when he is old, he will not depart from it* — the instructing of children Sirach 7:23 commands: "instruct them, and bow down their neck from their youth."'),
  -- thread: ecclesiasticus-7-fear-yahuah-honour-the-priest
  ('apocrypha', 'ecclesiasticus', 7, 29, 'canon', 'hebrews', 13, 7, 'free', E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — the reverencing of Yahuah''s ministers that Sirach 7:29 commands.'),
  ('apocrypha', 'ecclesiasticus', 7, 31, 'canon', 'hebrews', 13, 17, 'free', E'Hebrews 13:17 — *Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account, that they may do it with joy, and not with grief: for that is unprofitable for you* — the honouring of the priest "as it is commanded you" that Sirach 7:31 details.'),
  ('apocrypha', 'ecclesiasticus', 7, 31, 'canon', 'proverbs', 3, 9, 'free', E'Proverbs 3:9 — *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* — the firstfruits-portion Sirach 7:31 names among the priest''s due.'),
  -- thread: ecclesiasticus-7-alms-the-poor-the-sick-the-mourner
  ('apocrypha', 'ecclesiasticus', 7, 32, 'canon', 'proverbs', 19, 17, 'free', E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* — the perfected blessing of the open hand Sirach 7:32 promises.'),
  ('apocrypha', 'ecclesiasticus', 7, 35, 'canon', 'matthew', 25, 36, 'free', E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me* — the King names visiting the sick, the very work Sirach 7:35 commands: "Be not slow to visit the sick."'),
  ('apocrypha', 'ecclesiasticus', 7, 32, 'apocrypha', 'tobit', 4, 7, 'extras', E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* — Tobit''s almsgiving charge, the apocryphal sibling to Sirach 7:32''s hand stretched to the poor.'),
  -- thread: ecclesiasticus-7-remember-the-end
  ('apocrypha', 'ecclesiasticus', 7, 36, 'canon', 'deuteronomy', 32, 29, 'free', E'Deuteronomy 32:29 — *O that they were wise, that they understood this, that they would consider their latter end!* — the considered "end" of Sirach 7:36 is Moses'' very plea, the wisdom of the latter end.'),
  ('apocrypha', 'ecclesiasticus', 7, 36, 'canon', 'psalms', 90, 12, 'free', E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom* — numbering our days is to "remember the end" of Sirach 7:36, that we never do amiss.'),
  ('apocrypha', 'ecclesiasticus', 7, 36, 'canon', 'hebrews', 13, 7, 'free', E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — Hebrews bids us follow the faithful "considering the end," the same remembrance Sirach 7:36 commands.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-do-no-evil-flee-iniquity',
       E'Do no evil — depart from the unjust',
       E'Ben Sira opens the chapter with the plainest wisdom of the two ways: *Do no evil, so shall no harm come to you* (Ecclesiasticus 7:1), *Depart from the unjust, and iniquity shall turn away from you* (Ecclesiasticus 7:2). It ain''t new — this is the Tanakh''s call to turn from evil and do good, the very posture of the righteous. *Depart from evil, and do good; seek peace, and pursue it* (Psalm 34:14), and the Proverb''s word that the fear of Yahuah is the hinge of it all: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). James, Sirach''s closest NT sibling, carries the same fruit of a life turned from evil: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). The same covenant witness, library to library.',
       sv.verse_id, ev.verse_id, 'extras', 58450
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-humble-thyself',
       E'Humble thyself greatly',
       E'Against pride and self-justification Ben Sira sets humility: *justify not thyself before Yahuah (God); and boast not of your wisdom before the king* (Ecclesiasticus 7:5), and the chapter''s sharpest charge, *Humble thyself greatly: for the vengeance of the ungodly is fire and worms* (Ecclesiasticus 7:17). It ain''t new — the Proverb the apostles quote is here already: *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34), echoed in *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6), and made a command in *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). The fear of the ungodly''s end — *fire and worms* — is the same warning Yeshua would later draw on. Humility is the soil of wisdom in every library.',
       sv.verse_id, ev.verse_id, 'extras', 58453
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-lie-not-bridle-the-tongue',
       E'Devise not a lie — use not many words',
       E'Ben Sira turns to the tongue: *Devise not a lie against your brother; neither do the like to your friend* (Ecclesiasticus 7:12), *Use not to make any manner of lie: for the custom thereof is not good* (Ecclesiasticus 7:13), and *Use not many words in a multitude of elders, and make not much babbling when you prayest* (Ecclesiasticus 7:14). It ain''t new — this is the wisdom James presses on the swift tongue. *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath* (James 1:19), and the warning against an unbridled tongue: *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* (James 1:26). The Sermon on the Mount likewise warns against vain babbling in prayer (Matthew 6:7). Sirach and James draw from one well.',
       sv.verse_id, ev.verse_id, 'extras', 58456
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-honour-father-and-mother',
       E'Honour your father — forget not your mother',
       E'Ben Sira preaches the fifth word of the Decalogue in full: *Honour your father with your whole heart, and forget not the sorrows of your mother* (Ecclesiasticus 7:27), *Remember that you were begotten of them; and how can you recompense them the things that they have done for you?* (Ecclesiasticus 7:28). It ain''t new — this is Sinai itself: *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12), the one Paul calls *the first commandment with promise*: *Honour thy father and mother; (which is the first commandment with promise;)* (Ephesians 6:2). And the instruction of children that follows in the chapter is the Proverb itself: *Train up a child in the way he should go: and when he is old, he will not depart from it* (Proverbs 22:6). The Torah stands; ben Sira only unfolds it.',
       sv.verse_id, ev.verse_id, 'extras', 58459
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-fear-yahuah-honour-the-priest',
       E'Fear Yahuah — honour the priest, his portion',
       E'Ben Sira binds reverence for Yahuah to the Torah''s provision for His ministers: *Fear Yahuah (God) with all your soul, and reverence his priests* (Ecclesiasticus 7:29), and the detailed offering-law of the priesthood: *Fear Yahuah (God), and honor the priest; and give him his portion, as it is commanded you; the firstfruits, and the trespass offering, and the gift of the shoulders, and the sacrifice of sanctification, and the firstfruits of the holy things* (Ecclesiasticus 7:31). It ain''t new — this is Numbers and Deuteronomy''s priestly portion lived out. And the Letter to the Hebrews carries the same honour to those who lead: *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* (Hebrews 13:7), *Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account* (Hebrews 13:17). The fear of Yahuah and the firstfruits stand together.',
       sv.verse_id, ev.verse_id, 'extras', 58462
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-alms-the-poor-the-sick-the-mourner',
       E'Stretch thine hand to the poor — visit the sick',
       E'The chapter''s mercy-cluster: *And stretch yours hand to the poor, that your blessing may be perfected* (Ecclesiasticus 7:32), *Fail not to be with them that weep, and mourn with them that mourn* (Ecclesiasticus 7:34), *Be not slow to visit the sick: for that shall make you to be beloved* (Ecclesiasticus 7:35). It ain''t new — this is the Proverb the NT folds into the gospel: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17), and it is precisely the works the King names at the judgment: *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me* (Matthew 25:36). And the restored Tobit, ben Sira''s apocryphal sibling, sounds the same note: *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7). Almsgiving perfects the blessing, library to library.',
       sv.verse_id, ev.verse_id, 'extras', 58465
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-7-remember-the-end',
       E'Whatsoever thou takest in hand — remember the end',
       E'Ben Sira seals the chapter with its golden maxim: *Whatsoever you take in hand, remember the end, and you shall never do amiss* (Ecclesiasticus 7:36). It ain''t new — it is the Song of Moses'' lament over the foolish who will not consider their last things: *O that they were wise, that they understood this, that they would consider their latter end!* (Deuteronomy 32:29), and the Psalmist''s prayer for a wisdom-bearing reckoning of our days: *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12). The Letter to the Hebrews bids us follow the faithful "considering the end of their conversation" — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* (Hebrews 13:7). Remember the end, and thou shalt never sin.',
       sv.verse_id, ev.verse_id, 'extras', 58468
  FROM _session253_sir07_lookup sv, _session253_sir07_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=7 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-7-do-no-evil-flee-iniquity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* — the wisdom of which Sirach 7:1''s "do no evil" is the first lived obedience.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-do-no-evil-flee-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:27 — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* — the same departing-from-iniquity that Sirach 7:2 urges, framed as undefiled religion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-do-no-evil-flee-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-humble-thyself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly* — the same exalting of the lowly that Sirach 7:17''s "humble thyself greatly" commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* — James draws the very Proverb Sirach 7:17 dramatizes with "the vengeance of the ungodly."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the command form of Sirach 7:17''s "Humble thyself greatly."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:10 — *Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* — the One who "humbleth and exalteth" of Sirach 7:11 is the same Yahuah who lifts up the humble.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-humble-thyself'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-lie-not-bridle-the-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* — the same bridling of lying speech Sirach 7:13 calls for, for "the custom thereof is not good."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-lie-not-bridle-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:19 — *Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath* — the slow-to-speak restraint Sirach 7:14 urges against "much babbling."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-lie-not-bridle-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-honour-father-and-mother
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:12 — *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* — the Decalogue word Sirach 7:27 expounds "with your whole heart."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 6:2 — *Honour thy father and mother; (which is the first commandment with promise;)* — Paul names as covenant-promise the very honour Sirach 7:27 commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 22:6 — *Train up a child in the way he should go: and when he is old, he will not depart from it* — the instructing of children Sirach 7:23 commands: "instruct them, and bow down their neck from their youth."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-honour-father-and-mother'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-fear-yahuah-honour-the-priest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — the reverencing of Yahuah''s ministers that Sirach 7:29 commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-fear-yahuah-honour-the-priest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 13:17 — *Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account, that they may do it with joy, and not with grief: for that is unprofitable for you* — the honouring of the priest "as it is commanded you" that Sirach 7:31 details.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-fear-yahuah-honour-the-priest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:9 — *Honour Yahuah (LORD) with thy substance, and with the firstfruits of all thine increase* — the firstfruits-portion Sirach 7:31 names among the priest''s due.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-fear-yahuah-honour-the-priest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-alms-the-poor-the-sick-the-mourner
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* — the perfected blessing of the open hand Sirach 7:32 promises.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-alms-the-poor-the-sick-the-mourner'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 25:36 — *Naked, and ye clothed me: I was sick, and ye visited me: I was in prison, and ye came unto me* — the King names visiting the sick, the very work Sirach 7:35 commands: "Be not slow to visit the sick."'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-alms-the-poor-the-sick-the-mourner'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:7 — *Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you* — Tobit''s almsgiving charge, the apocryphal sibling to Sirach 7:32''s hand stretched to the poor.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-alms-the-poor-the-sick-the-mourner'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-7-remember-the-end
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:29 — *O that they were wise, that they understood this, that they would consider their latter end!* — the considered "end" of Sirach 7:36 is Moses'' very plea, the wisdom of the latter end.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-remember-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom* — numbering our days is to "remember the end" of Sirach 7:36, that we never do amiss.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-remember-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 13:7 — *Remember them which have the rule over you, who have spoken unto you the word of Elohim (God): whose faith follow, considering the end of their conversation* — Hebrews bids us follow the faithful "considering the end," the same remembrance Sirach 7:36 commands.'
  FROM cross_reference_threads t, cross_references x, _session253_sir07_lookup sv, _session253_sir07_lookup tv
 WHERE t.slug='ecclesiasticus-7-remember-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_08.sql (session253 ecclesiasticus 8) -----
-- Source anchor: apocrypha/ecclesiasticus ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir08 (view _session253_sir08_lookup). Sort band base 58475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-8-strive-not-with-the-angry
  ('apocrypha', 'ecclesiasticus', 8, 1, 'canon', 'proverbs', 22, 24, 'free', E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* The same charge Ben Sira gives in Sirach 8:1,16 — keep no fellowship with the violent or the powerful who will overpower you.'),
  ('apocrypha', 'ecclesiasticus', 8, 16, 'canon', 'proverbs', 22, 25, 'free', E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* Why not walk into a solitary place with the angry man of Sirach 8:16 — his ways become a snare and overthrow you where there is no help.'),
  ('apocrypha', 'ecclesiasticus', 8, 16, 'canon', 'proverbs', 13, 20, 'free', E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The traveling-companion warning of Sirach 8:15-16 is the same: walk with the bold and angry and you perish with them through their folly.'),
  -- thread: ecclesiasticus-8-contend-not-with-the-loud
  ('apocrypha', 'ecclesiasticus', 8, 3, 'canon', 'proverbs', 26, 20, 'free', E'Proverbs 26:20 — *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* The very image of Sirach 8:3,10 — withhold the wood, refuse to kindle the coals, and the sinner''s fire dies down.'),
  ('apocrypha', 'ecclesiasticus', 8, 11, 'canon', 'matthew', 5, 25, 'free', E'Matthew 5:25 — *Agree with thine adversary quickly, whiles thou art in the way with him; lest at any time the adversary deliver thee to the judge, and the judge deliver thee to the officer, and thou be cast into prison.* The Sermon on the Mount carries Sirach 8:11''s wisdom — do not rise up to be entrapped in words; settle quickly before judgment falls.'),
  -- thread: ecclesiasticus-8-reproach-not-we-are-all-worthy
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'ecclesiastes', 7, 20, 'free', E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The ground of Sirach 8:5 — do not reproach the one turning from sin, for there is no sinless man to cast the stone.'),
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'romans', 3, 23, 'free', E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul states Sirach 8:5''s "we are all worthy of punishment" as the gospel premise — all alike need mercy, so none may despise the penitent.'),
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'matthew', 7, 1, 'free', E'Matthew 7:1 — *Judge not, that ye be not judged.* The Messiah commands what Sirach 8:5 counsels — refuse the reproach that forgets you too stand under judgment.'),
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'galatians', 6, 1, 'free', E'Galatians 6:1 — *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.* The restoring meekness of Sirach 8:5 — handle the one who turns from sin gently, remembering your own frailty.'),
  -- thread: ecclesiasticus-8-honour-the-old-and-the-dead
  ('apocrypha', 'ecclesiasticus', 8, 6, 'canon', 'leviticus', 19, 32, 'free', E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* Torah itself underwrites Sirach 8:6 — honour the aged, for the fear of Yahuah binds it.'),
  ('apocrypha', 'ecclesiasticus', 8, 6, 'canon', 'proverbs', 16, 31, 'free', E'Proverbs 16:31 — *The hoary head is a crown of glory, if it be found in the way of righteousness.* Why dishonour not old age (Sirach 8:6) — the grey head is a crown, not a thing to be despised.'),
  ('apocrypha', 'ecclesiasticus', 8, 7, 'canon', 'proverbs', 24, 17, 'free', E'Proverbs 24:17 — *Rejoice not when thine enemy falleth, and let not thine heart be glad when he stumbleth:* The exact restraint of Sirach 8:7 — no gloating over the fallen foe, for we die all.'),
  -- thread: ecclesiasticus-8-despise-not-the-wise-and-the-elders
  ('apocrypha', 'ecclesiasticus', 8, 8, 'canon', 'proverbs', 1, 5, 'free', E'Proverbs 1:5 — *A wise man will hear, and will increase learning; and a man of understanding shall attain unto wise counsels:* The teachableness Sirach 8:8 commands — acquaint yourself with the proverbs of the wise and your learning increases.'),
  ('apocrypha', 'ecclesiasticus', 8, 9, 'canon', 'job', 12, 12, 'free', E'Job 12:12 — *With the ancient is wisdom; and in length of days understanding.* Why miss not the discourse of the elders (Sirach 8:9) — they learned of their fathers, and length of days carries understanding.'),
  ('apocrypha', 'ecclesiasticus', 8, 8, 'apocrypha', 'ecclesiasticus', 6, 34, 'extras', E'Ecclesiasticus 6:34 — *Stand in the multitude of the elders; and cleave to him that is wise.* Ben Sira''s own earlier charge, repeated here in Sirach 8:8-9 — keep company with the wise and the elders and learn.'),
  ('apocrypha', 'ecclesiasticus', 8, 8, 'apocrypha', 'the-wisdom-of-solomon', 6, 11, 'extras', E'Wisdom of Solomon 6:11 — *Wherefore set your affection upon my words; desire them, and you shall be instructed.* The sister wisdom-book echoes Sirach 8:8 — do not despise the discourse of the wise but set your affection on it and be instructed.'),
  -- thread: ecclesiasticus-8-keep-counsel-and-secrets
  ('apocrypha', 'ecclesiasticus', 8, 19, 'canon', 'proverbs', 11, 13, 'free', E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Why open not your heart to every man (Sirach 8:19) — the talebearer reveals what the faithful conceal.'),
  ('apocrypha', 'ecclesiasticus', 8, 18, 'canon', 'proverbs', 25, 9, 'free', E'Proverbs 25:9 — *Debate thy cause with thy neighbour himself; and discover not a secret to another:* The exact caution of Sirach 8:18 — do no secret thing before a stranger; keep the matter between the two concerned.'),
  ('apocrypha', 'ecclesiasticus', 8, 17, 'canon', 'proverbs', 11, 14, 'free', E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* Sirach 8:17 says consult not with a fool who cannot keep counsel — but Proverbs keeps the door open to the safety found in many wise counsellors.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-strive-not-with-the-angry',
       E'Strive not with a mighty or an angry man',
       E'Ben Sira opens the chapter with the wisdom of choosing one''s battles: *Strive not with a mighty man’ lest you fall into his hands.* (Ecclesiasticus 8:1), and again, *Strive not with an angry man, and go not with him into a solitary place: for blood is as nothing in his sight, and where there is no help, he will overthrow you.* (Ecclesiasticus 8:16). It ain''t new — this is Proverbs'' counsel almost word for word: *Make no friendship with an angry man; and with a furious man thou shalt not go:* (Proverbs 22:24), *Lest thou learn his ways, and get a snare to thy soul.* (Proverbs 22:25). The company a man keeps shapes his soul, so the wise weigh whom they walk beside: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 13:20).',
       sv.verse_id, ev.verse_id, 'extras', 58475
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-contend-not-with-the-loud',
       E'Heap not wood upon his fire',
       E'Against the loud and the inflaming Ben Sira counsels silence: *Strive not with a man that is full of tongue, and heap not wood upon his fire.* (Ecclesiasticus 8:3), and *Kindle not the coals of a sinner, lest you be burnt with the flame of his fire.* (Ecclesiasticus 8:10). The strife is starved when its fuel is withheld — exactly Solomon''s proverb: *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* (Proverbs 26:20). And the angry man''s quarrel is not a place to linger but to leave: *Rise not up in anger at the presence of an injurious person, lest he lie in wait to entrap you in your words* (Ecclesiasticus 8:11) — Yeshua of Nazareth would say it as a kingdom command, *Agree with thine adversary quickly, whiles thou art in the way with him; lest at any time the adversary deliver thee to the judge, and the judge deliver thee to the officer, and thou be cast into prison.* (Matthew 5:25).',
       sv.verse_id, ev.verse_id, 'extras', 58478
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-reproach-not-we-are-all-worthy',
       E'Reproach not — we are all worthy of punishment',
       E'Ben Sira tempers every rebuke with a mirror: *Reproach not a man that turns from sin, but remember that we are all worthy of punishment.* (Ecclesiasticus 8:5). None stands clean enough to despise the penitent — *For there is not a just man upon earth, that doeth good, and sinneth not.* (Ecclesiastes 7:20), and Sha''ul gathers it into the gospel: *For all have sinned, and come short of the glory of Elohim (God);* (Romans 3:23). The Messiah forbids the contemptuous judgment that forgets its own debt — *Judge not, that ye be not judged.* (Matthew 7:1) — and Sha''ul shows the gentle way to restore the one who turns: *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.* (Galatians 6:1).',
       sv.verse_id, ev.verse_id, 'extras', 58481
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-honour-the-old-and-the-dead',
       E'Dishonour not old age; rejoice not over the dead',
       E'The fear of Yahuah teaches reverence for grey hairs and restraint at a fallen enemy: *Dishonour not a man in his old age: for even some of us wax old.* (Ecclesiasticus 8:6), and *Rejoice not over your greatest enemy being dead, but remember that we die all.* (Ecclesiasticus 8:7). Torah wrote the honour of age into the covenant: *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* (Leviticus 19:32), and the proverb crowns it — *The hoary head is a crown of glory, if it be found in the way of righteousness.* (Proverbs 16:31). As for the dead foe, Solomon forbids the glad heart that Ben Sira forbids: *Rejoice not when thine enemy falleth, and let not thine heart be glad when he stumbleth:* (Proverbs 24:17).',
       sv.verse_id, ev.verse_id, 'extras', 58484
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-despise-not-the-wise-and-the-elders',
       E'Despise not the discourse of the wise and the elders',
       E'The heart of the chapter is the counsel to sit and learn: *Despise not the discourse of the wise, but acquaint thyself with their proverbs: for of them you shall learn instruction, and how to serve great men with ease.* (Ecclesiasticus 8:8), and *Miss not the discourse of the elders: for they also learned of their fathers, and of them you shall learn understanding, and to give answer as need requires.* (Ecclesiasticus 8:9). It ain''t new — Proverbs makes the teachable man wise: *A wise man will hear, and will increase learning; and a man of understanding shall attain unto wise counsels:* (Proverbs 1:5), and Job sets wisdom with the aged: *With the ancient is wisdom; and in length of days understanding.* (Job 12:12). Ben Sira had already pressed it in his own book — *Stand in the multitude of the elders; and cleave to him that is wise.* (Ecclesiasticus 6:34) — and Wisdom of Solomon answers with the same affection: *Wherefore set your affection upon my words; desire them, and you shall be instructed.* (Wisdom of Solomon 6:11).',
       sv.verse_id, ev.verse_id, 'extras', 58487
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-keep-counsel-and-secrets',
       E'Open not your heart to every man',
       E'Ben Sira closes with prudence in speech and trust: *Consult not with a fool; for he cannot keep counsel.* (Ecclesiasticus 8:17), *Do no secret thing before a stranger; for you know not what he will bring forth.* (Ecclesiasticus 8:18), and *Open not yours heart to every man, lest he requite you with a shrewd turn.* (Ecclesiasticus 8:19). Solomon''s wisdom is the same — guard the matter, and keep the dispute close: *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* (Proverbs 11:13), *Debate thy cause with thy neighbour himself; and discover not a secret to another:* (Proverbs 25:9). Yet counsel itself is not abandoned, only rightly placed: *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* (Proverbs 11:14).',
       sv.verse_id, ev.verse_id, 'extras', 58490
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-8-strive-not-with-the-angry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* The same charge Ben Sira gives in Sirach 8:1,16 — keep no fellowship with the violent or the powerful who will overpower you.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-strive-not-with-the-angry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* Why not walk into a solitary place with the angry man of Sirach 8:16 — his ways become a snare and overthrow you where there is no help.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-strive-not-with-the-angry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The traveling-companion warning of Sirach 8:15-16 is the same: walk with the bold and angry and you perish with them through their folly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-strive-not-with-the-angry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-contend-not-with-the-loud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:20 — *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* The very image of Sirach 8:3,10 — withhold the wood, refuse to kindle the coals, and the sinner''s fire dies down.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-contend-not-with-the-loud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:25 — *Agree with thine adversary quickly, whiles thou art in the way with him; lest at any time the adversary deliver thee to the judge, and the judge deliver thee to the officer, and thou be cast into prison.* The Sermon on the Mount carries Sirach 8:11''s wisdom — do not rise up to be entrapped in words; settle quickly before judgment falls.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-contend-not-with-the-loud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-reproach-not-we-are-all-worthy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The ground of Sirach 8:5 — do not reproach the one turning from sin, for there is no sinless man to cast the stone.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul states Sirach 8:5''s "we are all worthy of punishment" as the gospel premise — all alike need mercy, so none may despise the penitent.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:1 — *Judge not, that ye be not judged.* The Messiah commands what Sirach 8:5 counsels — refuse the reproach that forgets you too stand under judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 6:1 — *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.* The restoring meekness of Sirach 8:5 — handle the one who turns from sin gently, remembering your own frailty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-honour-the-old-and-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* Torah itself underwrites Sirach 8:6 — honour the aged, for the fear of Yahuah binds it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-honour-the-old-and-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:31 — *The hoary head is a crown of glory, if it be found in the way of righteousness.* Why dishonour not old age (Sirach 8:6) — the grey head is a crown, not a thing to be despised.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-honour-the-old-and-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 24:17 — *Rejoice not when thine enemy falleth, and let not thine heart be glad when he stumbleth:* The exact restraint of Sirach 8:7 — no gloating over the fallen foe, for we die all.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-honour-the-old-and-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-despise-not-the-wise-and-the-elders
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:5 — *A wise man will hear, and will increase learning; and a man of understanding shall attain unto wise counsels:* The teachableness Sirach 8:8 commands — acquaint yourself with the proverbs of the wise and your learning increases.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 12:12 — *With the ancient is wisdom; and in length of days understanding.* Why miss not the discourse of the elders (Sirach 8:9) — they learned of their fathers, and length of days carries understanding.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 6:34 — *Stand in the multitude of the elders; and cleave to him that is wise.* Ben Sira''s own earlier charge, repeated here in Sirach 8:8-9 — keep company with the wise and the elders and learn.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:11 — *Wherefore set your affection upon my words; desire them, and you shall be instructed.* The sister wisdom-book echoes Sirach 8:8 — do not despise the discourse of the wise but set your affection on it and be instructed.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-keep-counsel-and-secrets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Why open not your heart to every man (Sirach 8:19) — the talebearer reveals what the faithful conceal.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-keep-counsel-and-secrets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 25:9 — *Debate thy cause with thy neighbour himself; and discover not a secret to another:* The exact caution of Sirach 8:18 — do no secret thing before a stranger; keep the matter between the two concerned.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-keep-counsel-and-secrets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* Sirach 8:17 says consult not with a fool who cannot keep counsel — but Proverbs keeps the door open to the safety found in many wise counsellors.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-keep-counsel-and-secrets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Sirach (Ecclesiasticus) cross-references complete.'
