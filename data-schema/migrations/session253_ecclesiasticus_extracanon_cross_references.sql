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

-- ----- fragment: minion_ecclesiasticus_09.sql (session253 ecclesiasticus 9) -----
-- Source anchor: apocrypha/ecclesiasticus ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir09 (view _session253_sir09_lookup). Sort band base 58500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-9-strange-woman-snares
  ('apocrypha', 'ecclesiasticus', 9, 3, 'canon', 'proverbs', 5, 3, 'free', E'Proverbs 5:3 — *For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil:* the honeyed lure Ben Sira calls a snare in Sirach 9:3.'),
  ('apocrypha', 'ecclesiasticus', 9, 3, 'canon', 'proverbs', 5, 5, 'free', E'Proverbs 5:5 — *Her feet go down to death; her steps take hold on hell.* the end of the harlot''s path that makes Sirach 9:3''s snare deadly.'),
  ('apocrypha', 'ecclesiasticus', 9, 6, 'canon', 'proverbs', 6, 26, 'free', E'Proverbs 6:26 — *For by means of a whorish woman a man is brought to a piece of bread: and the adulteress will hunt for the precious life.* the lost inheritance Ben Sira warns of in Sirach 9:6.'),
  ('apocrypha', 'ecclesiasticus', 9, 6, 'canon', 'proverbs', 7, 26, 'free', E'Proverbs 7:26 — *For she hath cast down many wounded: yea, many strong men have been slain by her.* the toll of the strange woman that Sirach 9:6 would have the wise escape.'),
  ('apocrypha', 'ecclesiasticus', 9, 3, 'canon', 'proverbs', 6, 24, 'free', E'Proverbs 6:24 — *To keep thee from the evil woman, from the flattery of the tongue of a strange woman.* the Torah-light that does what Sirach 9:3 commands the prudent to do.'),
  -- thread: ecclesiasticus-9-turn-away-the-eye
  ('apocrypha', 'ecclesiasticus', 9, 8, 'canon', 'job', 31, 1, 'free', E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* the eye-covenant Ben Sira enjoins when he says turn away the eye in Sirach 9:8.'),
  ('apocrypha', 'ecclesiasticus', 9, 5, 'canon', 'proverbs', 6, 25, 'free', E'Proverbs 6:25 — *Lust not after her beauty in thine heart; neither let her take thee with her eyelids.* the inward guard against the beauty Sirach 9:5 says not to gaze upon.'),
  ('apocrypha', 'ecclesiasticus', 9, 8, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* the Messiah taking Sirach 9:8''s turn-away-the-eye to the heart''s root.'),
  ('apocrypha', 'ecclesiasticus', 9, 8, 'canon', '2-peter', 2, 14, 'free', E'2 Peter 2:14 — *Having eyes full of adultery, and that cannot cease from sin; beguiling unstable souls: an heart they have exercised with covetous practices; cursed children:* the very deception by beauty Sirach 9:8 warns has deceived many.'),
  -- thread: ecclesiasticus-9-another-mans-wife-wine
  ('apocrypha', 'ecclesiasticus', 9, 9, 'canon', 'proverbs', 6, 29, 'free', E'Proverbs 6:29 — *So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent.* the guilt Ben Sira would have a man avoid by not sitting with another man''s wife in Sirach 9:9.'),
  ('apocrypha', 'ecclesiasticus', 9, 9, 'canon', 'proverbs', 23, 31, 'free', E'Proverbs 23:31 — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright.* the deceiving cup Sirach 9:9 says not to share with another man''s wife.'),
  ('apocrypha', 'ecclesiasticus', 9, 9, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* the inclined desire by which Sirach 9:9 says a man falls into destruction.'),
  -- thread: ecclesiasticus-9-forsake-not-old-friend
  ('apocrypha', 'ecclesiasticus', 9, 10, 'canon', 'proverbs', 27, 10, 'free', E'Proverbs 27:10 — *Thine own friend, and thy father''s friend, forsake not; neither go into thy brother''s house in the day of thy calamity: for better is a neighbour that is near than a brother far off.* the same command Sirach 9:10 gives not to forsake the old friend.'),
  ('apocrypha', 'ecclesiasticus', 9, 10, 'apocrypha', 'ecclesiasticus', 6, 16, 'extras', E'Ecclesiasticus 6:16 — *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him.* Ben Sira''s own praise of the tried friend that Sirach 9:10 says not to forsake.'),
  ('apocrypha', 'ecclesiasticus', 9, 10, 'apocrypha', 'ecclesiasticus', 6, 14, 'extras', E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* the treasure of the old friend Sirach 9:10 ranks above the new.'),
  -- thread: ecclesiasticus-9-envy-not-talk-with-wise
  ('apocrypha', 'ecclesiasticus', 9, 11, 'canon', 'psalms', 37, 1, 'free', E'Psalm 37:1 — *Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity.* the very envy of the sinner''s glory Sirach 9:11 forbids.'),
  ('apocrypha', 'ecclesiasticus', 9, 11, 'canon', 'proverbs', 23, 17, 'free', E'Proverbs 23:17 — *Let not thine heart envy sinners: but be thou in the fear of Yahuah (LORD) all the day long.* the same pairing Sirach 9:11-16 makes — no envy of sinners, but the fear of Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 9, 15, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* the law-of-the-Most-High talk Sirach 9:15 says fills the wise man''s communication.'),
  ('apocrypha', 'ecclesiasticus', 9, 14, 'canon', 'proverbs', 13, 20, 'free', E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* the consult-with-the-wise counsel of Sirach 9:14-15.'),
  ('apocrypha', 'ecclesiasticus', 9, 15, 'apocrypha', 'ecclesiasticus', 37, 12, 'extras', E'Ecclesiasticus 37:12 — *But be continually with a godly man, whom you know to keep the commandments of Yahuah (God), whose, mind is according to your mind, and will sorrow with you, if you shall miscarry.* Ben Sira''s own counsel to keep company with the law-keeping wise, as in Sirach 9:15-16.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-strange-woman-snares',
       E'Meet not with the harlot — the snares of the strange woman',
       E'Ben Sira sets the wise man''s guard against the seductress: *Meet not with an harlot, lest you fall into her snares* (Ecclesiasticus 9:3), and *Give not your soul to harlots, that you lose not your inheritance* (Ecclesiasticus 9:6). It ain''t new — this is Proverbs'' own warning, where *the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil: But her end is bitter as wormwood, sharp as a twoedged sword* (Proverbs 5:3-4), and *Her feet go down to death; her steps take hold on hell* (Proverbs 5:5). The Torah-light keeps a man *from the evil woman, from the flattery of the tongue of a strange woman* (Proverbs 6:24), for *by means of a whorish woman a man is brought to a piece of bread* (Proverbs 6:26) — the very inheritance Ben Sira would not lose. Wisdom personified is set as the guard: *That they may keep thee from the strange woman, from the stranger which flattereth with her words* (Proverbs 7:5), who *hath cast down many wounded: yea, many strong men have been slain by her* (Proverbs 7:26).',
       sv.verse_id, ev.verse_id, 'extras', 58500
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-turn-away-the-eye',
       E'Turn away the eye from the beauty that kindles as fire',
       E'Ben Sira aims at the heart through the eye: *Gaze not on a maid, that you fall not by those things that are precious in her* (Ecclesiasticus 9:5), and *Turn away your eye from a beautiful woman, and look not upon another''s beauty; for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire* (Ecclesiasticus 9:8). Job already made the covenant: *I made a covenant with mine eyes; why then should I think upon a maid?* (Job 31:1), and Proverbs warns *Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:25). The Messiah carries this same teaching to its root in the Sermon on the Mount — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28) — and Peter rebukes those *Having eyes full of adultery, and that cannot cease from sin* (2 Peter 2:14). The wisdom of the eye-covenant is one witness across the library.',
       sv.verse_id, ev.verse_id, 'extras', 58503
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-another-mans-wife-wine',
       E'Sit not with another man''s wife at the wine — desire to destruction',
       E'Ben Sira''s sharpest counsel against adultery joins the table, the cup, and the heart: *Sit not at all with another man''s wife, nor sit down with her in your arms, and spend not your money with her at the wine; lest yours heart incline to her, and so through your desire you fall into destruction* (Ecclesiasticus 9:9). Proverbs sets the same fence around the neighbour''s wife: *So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent* (Proverbs 6:29), and binds it to the deceiving cup — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright* (Proverbs 23:31). James names the mechanism of the fall: *But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14) — the very desire that Ben Sira says ends in destruction. The wisdom is one: guard the heart at the table before the desire inclines.',
       sv.verse_id, ev.verse_id, 'extras', 58506
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-forsake-not-old-friend',
       E'Forsake not an old friend — the seasoned wine',
       E'Against the lure of the new, Ben Sira pleads for the tried bond: *Forsake not an old friend; for the new is not comparable to him: a new friend is as new wine; when it is old, you shall drink it with pleasure* (Ecclesiasticus 9:10). Proverbs says it plainly: *Thine own friend, and thy father''s friend, forsake not; neither go into thy brother''s house in the day of thy calamity: for better is a neighbour that is near than a brother far off* (Proverbs 27:10). Ben Sira self-witnesses elsewhere that *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him* (Ecclesiasticus 6:16) — for *he that has found such an one has found a treasure* (Ecclesiasticus 6:14). It ain''t new: the value of the seasoned, faithful friend runs straight through the wisdom-witness of the library.',
       sv.verse_id, ev.verse_id, 'extras', 58509
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-envy-not-talk-with-wise',
       E'Envy not the sinner; let your talk be with the wise in the law',
       E'Ben Sira turns from women to company and counsel: *Envy not the glory of a sinner: for you know not what shall be his end* (Ecclesiasticus 9:11), and *Let your talk be with the wise, and all your communication in the law of the Most High* (Ecclesiasticus 9:15), with glorying *in the fear of Yahuah (God)* (Ecclesiasticus 9:16). The Psalter opens the same way: *Blessed is the man that walketh not in the counsel of the ungodly... But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:1-2), and warns *Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity* (Psalm 37:1). Proverbs commands *Let not thine heart envy sinners: but be thou in the fear of Yahuah (LORD) all the day long* (Proverbs 23:17), and *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed* (Proverbs 13:20). Ben Sira''s own counsel-witness adds: *be continually with a godly man, whom you know to keep the commandments of Yahuah (God)* (Ecclesiasticus 37:12). The wise man''s table, talk, and glorying all rest in the fear of Yahuah and the law of the Most High.',
       sv.verse_id, ev.verse_id, 'extras', 58512
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-9-strange-woman-snares
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 5:3 — *For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil:* the honeyed lure Ben Sira calls a snare in Sirach 9:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 5:5 — *Her feet go down to death; her steps take hold on hell.* the end of the harlot''s path that makes Sirach 9:3''s snare deadly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 6:26 — *For by means of a whorish woman a man is brought to a piece of bread: and the adulteress will hunt for the precious life.* the lost inheritance Ben Sira warns of in Sirach 9:6.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 7:26 — *For she hath cast down many wounded: yea, many strong men have been slain by her.* the toll of the strange woman that Sirach 9:6 would have the wise escape.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 6:24 — *To keep thee from the evil woman, from the flattery of the tongue of a strange woman.* the Torah-light that does what Sirach 9:3 commands the prudent to do.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-turn-away-the-eye
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* the eye-covenant Ben Sira enjoins when he says turn away the eye in Sirach 9:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 6:25 — *Lust not after her beauty in thine heart; neither let her take thee with her eyelids.* the inward guard against the beauty Sirach 9:5 says not to gaze upon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* the Messiah taking Sirach 9:8''s turn-away-the-eye to the heart''s root.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:14 — *Having eyes full of adultery, and that cannot cease from sin; beguiling unstable souls: an heart they have exercised with covetous practices; cursed children:* the very deception by beauty Sirach 9:8 warns has deceived many.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-another-mans-wife-wine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 6:29 — *So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent.* the guilt Ben Sira would have a man avoid by not sitting with another man''s wife in Sirach 9:9.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-another-mans-wife-wine'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 23:31 — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright.* the deceiving cup Sirach 9:9 says not to share with another man''s wife.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-another-mans-wife-wine'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* the inclined desire by which Sirach 9:9 says a man falls into destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-another-mans-wife-wine'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-forsake-not-old-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:10 — *Thine own friend, and thy father''s friend, forsake not; neither go into thy brother''s house in the day of thy calamity: for better is a neighbour that is near than a brother far off.* the same command Sirach 9:10 gives not to forsake the old friend.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-forsake-not-old-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 6:16 — *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him.* Ben Sira''s own praise of the tried friend that Sirach 9:10 says not to forsake.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-forsake-not-old-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* the treasure of the old friend Sirach 9:10 ranks above the new.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-forsake-not-old-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-envy-not-talk-with-wise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 37:1 — *Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity.* the very envy of the sinner''s glory Sirach 9:11 forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 23:17 — *Let not thine heart envy sinners: but be thou in the fear of Yahuah (LORD) all the day long.* the same pairing Sirach 9:11-16 makes — no envy of sinners, but the fear of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* the law-of-the-Most-High talk Sirach 9:15 says fills the wise man''s communication.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* the consult-with-the-wise counsel of Sirach 9:14-15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 37:12 — *But be continually with a godly man, whom you know to keep the commandments of Yahuah (God), whose, mind is according to your mind, and will sorrow with you, if you shall miscarry.* Ben Sira''s own counsel to keep company with the law-keeping wise, as in Sirach 9:15-16.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_10.sql (session253 ecclesiasticus 10) -----
-- Source anchor: apocrypha/ecclesiasticus ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir10 (view _session253_sir10_lookup). Sort band base 58525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-10-pride-beginning-of-sin
  ('apocrypha', 'ecclesiasticus', 10, 13, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-axiom Ben Sira distills: pride is the head that drags down everything after it, as in Sirach 10:13.'),
  ('apocrypha', 'ecclesiasticus', 10, 13, 'canon', 'proverbs', 11, 2, 'free', E'Proverbs 11:2 — *When pride cometh, then cometh shame: but with the lowly is wisdom.* Pride breeds the abomination Sirach 10:13 warns of, while lowliness is wisdom''s home.'),
  ('apocrypha', 'ecclesiasticus', 10, 12, 'canon', 'proverbs', 8, 13, 'free', E'Proverbs 8:13 — *The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate.* The heart turned from its Maker (Sirach 10:12) is exactly the pride Yahuah names as hateful.'),
  ('apocrypha', 'ecclesiasticus', 10, 12, 'canon', 'deuteronomy', 8, 14, 'free', E'Deuteronomy 8:14 — *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage;* the lifted-up heart forgetting its Maker is the very departure Sirach 10:12 calls the beginning of pride.'),
  -- thread: ecclesiasticus-10-thrones-cast-down-meek-exalted
  ('apocrypha', 'ecclesiasticus', 10, 14, 'canon', 'isaiah', 14, 14, 'free', E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The self-exalting throne Isaiah taunts is precisely the proud throne Yahuah casts down in Sirach 10:14.'),
  ('apocrypha', 'ecclesiasticus', 10, 14, 'canon', 'daniel', 4, 37, 'free', E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The abased king''s confession is Sirach 10:14 enacted in history.'),
  ('apocrypha', 'ecclesiasticus', 10, 14, 'canon', 'luke', 1, 52, 'free', E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mariam''s song is the very reversal of Sirach 10:14 — proud thrones down, the meek up.'),
  ('apocrypha', 'ecclesiasticus', 10, 18, 'canon', 'luke', 14, 11, 'free', E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Pride was not made for the born-of-woman (Sirach 10:18); the Master makes its undoing a law of the kingdom.'),
  -- thread: ecclesiasticus-10-elohim-resists-the-proud
  ('apocrypha', 'ecclesiasticus', 10, 7, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* James, Sirach''s closest NT sibling, turns 10:7''s pride-is-hateful into the gospel of grace for the lowly.'),
  ('apocrypha', 'ecclesiasticus', 10, 7, 'canon', '1-peter', 5, 5, 'free', E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* The same proverb the apostles knew: the pride Sirach 10:7 calls hateful is what heaven sets itself against.'),
  ('apocrypha', 'ecclesiasticus', 10, 7, 'canon', 'matthew', 23, 12, 'free', E'Matthew 23:12 — *And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted.* The Master''s verdict on the proud matches Sirach 10:7 — pride is hateful, and it ends abased.'),
  -- thread: ecclesiasticus-10-earth-and-ashes-covetous
  ('apocrypha', 'ecclesiasticus', 10, 9, 'canon', 'genesis', 18, 27, 'free', E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes:* Abraham owns the very lowliness Sirach 10:9 asks the proud to remember — why is earth and ashes proud?'),
  ('apocrypha', 'ecclesiasticus', 10, 11, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The Eden sentence is why the dead man inherits worms in Sirach 10:11 — ashes have no ground for pride.'),
  ('apocrypha', 'ecclesiasticus', 10, 9, 'canon', '1-timothy', 6, 7, 'free', E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* The covetous man Sirach 10:9 sells his soul for what he cannot keep — Paul names the same emptiness.'),
  ('apocrypha', 'ecclesiasticus', 10, 9, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool is Sirach 10:9''s covetous man — he sets his soul to sale and loses it overnight.'),
  ('apocrypha', 'ecclesiasticus', 10, 9, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The ungodly''s too-late confession answers Sirach 10:9''s question — pride and riches profit the earth-and-ashes man nothing.'),
  -- thread: ecclesiasticus-10-fear-of-yahuah-the-glory
  ('apocrypha', 'ecclesiasticus', 10, 22, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The glory Sirach 10:22 grants rich and poor alike is the reverence Proverbs makes the head of all knowledge.'),
  ('apocrypha', 'ecclesiasticus', 10, 24, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* None is greater than the man who fears Yahuah (Sirach 10:24) because that fear is wisdom''s very beginning.'),
  ('apocrypha', 'ecclesiasticus', 10, 22, 'canon', 'proverbs', 22, 2, 'free', E'Proverbs 22:2 — *The rich and poor meet together: Yahuah (LORD) is the maker of them all.* Rich, noble, or poor (Sirach 10:22) share one glory because they share one Maker.'),
  ('apocrypha', 'ecclesiasticus', 10, 22, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening thesis grounds 10:22 — the fear of Yahuah is the glory of every estate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-pride-beginning-of-sin',
       E'Pride is the beginning of sin',
       E'Ben Sira names the root and traces its fruit: *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker* (Ecclesiasticus 10:12), *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* (Ecclesiasticus 10:13). It ain''t new — Proverbs sets the same axiom: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18); *When pride cometh, then cometh shame: but with the lowly is wisdom* (Proverbs 11:2); and Yahuah Himself declares *pride, and arrogancy, and the evil way, and the froward mouth, do I hate* (Proverbs 8:13). Pride is not a private flaw but a departure from the Maker — the first turning-away — and so the head of every other sin.',
       sv.verse_id, ev.verse_id, 'extras', 58525
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-thrones-cast-down-meek-exalted',
       E'He casts down proud thrones, lifts the meek',
       E'The same hand that hates pride overturns it in history: *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Ecclesiasticus 10:14); *Pride was not made for men, nor furious anger for them that are born of a woman* (Ecclesiasticus 10:18). Isaiah''s taunt over the fallen king is the archetype — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* ... *I will be like the El Elyon (most High)* ... *Yet thou shalt be brought down to hell, to the sides of the pit* (Isaiah 14:13-15). Nebuchadnezzar lives the parable: *Is not this great Babylon, that I have built ... for the honour of my majesty?* (Daniel 4:30) is answered by the abasing voice, until the humbled king confesses *those that walk in pride he is able to abase* (Daniel 4:37). Hannah and Mariam sing the reversal — *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52) — and the Master seals it: *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11).',
       sv.verse_id, ev.verse_id, 'extras', 58528
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-elohim-resists-the-proud',
       E'Elohim resists the proud, gives grace to the humble',
       E'Pride stands hateful before heaven and man alike: *Pride is hateful before Yahuah (God) and man: and by both does one commit iniquity* (Ecclesiasticus 10:7). The whole counsel of the Tanakh and the apostles answers in one voice. James lifts the wisdom-teaching straight into the assembly — *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — and Kepha (Peter) repeats it word for word: *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Yeshua ben Sira''s near sibling James is the closest NT echo of this whole chapter; the humble heart is the one heaven will not war against.',
       sv.verse_id, ev.verse_id, 'extras', 58531
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-earth-and-ashes-covetous',
       E'Why is earth and ashes proud?',
       E'Ben Sira shames the swelling heart with the dust it came from: *Why is earth and ashes proud? There is not a more wicked thing than a covetous man: for such an one sets his own soul to sale; because while he lives he casteth away his bowels* (Ecclesiasticus 10:9), for *when a man is dead, he shall inherit creeping things, beasts, and worms* (Ecclesiasticus 10:11). Abraham knew the posture — *I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes* (Genesis 18:27) — under the sentence of Eden: *dust thou art, and unto dust shalt thou return* (Genesis 3:19). And the covetousness Sirach couples with pride the apostle exposes: *we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7) — the rich fool of Luke 12:20 learns it the hard way. Earth and ashes have nothing to be proud of, and grasping for more only sells the soul.',
       sv.verse_id, ev.verse_id, 'extras', 58534
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-10-fear-of-yahuah-the-glory',
       E'The fear of Yahuah is the true glory',
       E'Against pride Ben Sira sets the one honour that holds: *The fear of Yahuah (God) goes before the obtaining of authority: but roughness and pride is the losing thereof* (Ecclesiasticus 10:21); *Whether he be rich, noble, or poor, their glory is the fear of Yahuah (God)* (Ecclesiasticus 10:22); *Great men, and judges, and potentates, shall be honoured; yet is there none of them greater than he that fears Yahuah (God)* (Ecclesiasticus 10:24). This is the spine of all wisdom literature — *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7); *The fear of Yahuah (LORD) is the beginning of wisdom* (Proverbs 9:10). Ben Sira himself opens the book the same way (Ecclesiasticus 1:14). And the rich and poor whom Sirach levels under one glory meet as one before their Maker: *The rich and poor meet together: Yahuah (LORD) is the maker of them all* (Proverbs 22:2). It ain''t new — reverence, not rank, is a man''s true greatness.',
       sv.verse_id, ev.verse_id, 'extras', 58537
  FROM _session253_sir10_lookup sv, _session253_sir10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=10 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-10-pride-beginning-of-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The wisdom-axiom Ben Sira distills: pride is the head that drags down everything after it, as in Sirach 10:13.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:2 — *When pride cometh, then cometh shame: but with the lowly is wisdom.* Pride breeds the abomination Sirach 10:13 warns of, while lowliness is wisdom''s home.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:13 — *The fear of Yahuah (LORD) is to hate evil: pride, and arrogancy, and the evil way, and the froward mouth, do I hate.* The heart turned from its Maker (Sirach 10:12) is exactly the pride Yahuah names as hateful.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 8:14 — *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage;* the lifted-up heart forgetting its Maker is the very departure Sirach 10:12 calls the beginning of pride.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-thrones-cast-down-meek-exalted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* The self-exalting throne Isaiah taunts is precisely the proud throne Yahuah casts down in Sirach 10:14.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 4:37 — *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase.* The abased king''s confession is Sirach 10:14 enacted in history.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:52 — *He hath put down the mighty from their seats, and exalted them of low degree.* Mariam''s song is the very reversal of Sirach 10:14 — proud thrones down, the meek up.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 14:11 — *For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted.* Pride was not made for the born-of-woman (Sirach 10:18); the Master makes its undoing a law of the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-thrones-cast-down-meek-exalted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-elohim-resists-the-proud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* James, Sirach''s closest NT sibling, turns 10:7''s pride-is-hateful into the gospel of grace for the lowly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-elohim-resists-the-proud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* The same proverb the apostles knew: the pride Sirach 10:7 calls hateful is what heaven sets itself against.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-elohim-resists-the-proud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 23:12 — *And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted.* The Master''s verdict on the proud matches Sirach 10:7 — pride is hateful, and it ends abased.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-elohim-resists-the-proud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-earth-and-ashes-covetous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:27 — *And Abraham answered and said, Behold now, I have taken upon me to speak unto Yahuah (Lord), which am but dust and ashes:* Abraham owns the very lowliness Sirach 10:9 asks the proud to remember — why is earth and ashes proud?'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The Eden sentence is why the dead man inherits worms in Sirach 10:11 — ashes have no ground for pride.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* The covetous man Sirach 10:9 sells his soul for what he cannot keep — Paul names the same emptiness.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The rich fool is Sirach 10:9''s covetous man — he sets his soul to sale and loses it overnight.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The ungodly''s too-late confession answers Sirach 10:9''s question — pride and riches profit the earth-and-ashes man nothing.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-earth-and-ashes-covetous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-10-fear-of-yahuah-the-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The glory Sirach 10:22 grants rich and poor alike is the reverence Proverbs makes the head of all knowledge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* None is greater than the man who fears Yahuah (Sirach 10:24) because that fear is wisdom''s very beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 22:2 — *The rich and poor meet together: Yahuah (LORD) is the maker of them all.* Rich, noble, or poor (Sirach 10:22) share one glory because they share one Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Ben Sira''s own opening thesis grounds 10:22 — the fear of Yahuah is the glory of every estate.'
  FROM cross_reference_threads t, cross_references x, _session253_sir10_lookup sv, _session253_sir10_lookup tv
 WHERE t.slug='ecclesiasticus-10-fear-of-yahuah-the-glory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_11.sql (session253 ecclesiasticus 11) -----
-- Source anchor: apocrypha/ecclesiasticus ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir11 (view _session253_sir11_lookup). Sort band base 58550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-11-judge-not-by-appearance
  ('apocrypha', 'ecclesiasticus', 11, 2, 'canon', '1-samuel', 16, 7, 'free', E'1 Samuel 16:7 — *But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* The Tanakh''s anchor for Sirach 11:2 — abhor not a man by his outward appearance, for Yahuah weighs the heart.'),
  ('apocrypha', 'ecclesiasticus', 11, 5, 'canon', 'james', 1, 9, 'free', E'James 1:9 — *Let the brother of low degree rejoice in that he is exalted:* James echoes Sirach 11:5''s reversal — the unregarded man wears the crown, the brother of low degree is the one exalted.'),
  ('apocrypha', 'ecclesiasticus', 11, 6, 'canon', 'james', 1, 10, 'free', E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* The mighty greatly disgraced and the honourable delivered up (Sirach 11:6) is James''s fading flower of the rich.'),
  -- thread: ecclesiasticus-11-pride-beginning-of-sin
  ('apocrypha', 'ecclesiasticus', 11, 4, 'apocrypha', 'ecclesiasticus', 10, 13, 'extras', E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira self-links: the warning not to exalt thyself in the day of honour (11:4) rests on his own root-diagnosis that pride is the beginning of sin.'),
  ('apocrypha', 'ecclesiasticus', 11, 30, 'apocrypha', 'ecclesiasticus', 10, 12, 'extras', E'Ecclesiasticus 10:12 — *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* The proud heart that watcheth for your fall (11:30) is the heart already turned away from its Maker.'),
  ('apocrypha', 'ecclesiasticus', 11, 4, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Proverbs gives the proverb behind Sirach 11:4''s warning not to exalt thyself in the day of honour.'),
  -- thread: ecclesiasticus-11-answer-not-before-hearing
  ('apocrypha', 'ecclesiasticus', 11, 8, 'canon', 'proverbs', 18, 13, 'free', E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* The exact proverb Sirach 11:8 expands — answer not before you have heard the cause.'),
  ('apocrypha', 'ecclesiasticus', 11, 9, 'canon', 'luke', 12, 14, 'free', E'Luke 12:14 — *And he said unto him, Man, who made me a judge or a divider over you?* Yahusha himself keeps Sirach 11:9''s rule — strive not in a matter that concerneth you not, sit not in judgment uninvited.'),
  -- thread: ecclesiasticus-11-labour-not-to-be-rich
  ('apocrypha', 'ecclesiasticus', 11, 11, 'canon', 'proverbs', 23, 4, 'free', E'Proverbs 23:4 — *Labour not to be rich: cease from thine own wisdom.* The Tanakh command Sirach 11:11 dramatizes — he that makes haste is the more behind.'),
  ('apocrypha', 'ecclesiasticus', 11, 11, 'canon', 'ecclesiastes', 9, 11, 'free', E'Ecclesiastes 9:11 — *I returned, and saw under the sun, that the race is not to the swift, nor the battle to the strong, neither yet bread to the wise, nor yet riches to men of understanding, nor yet favour to men of skill; but time and chance happeneth to them all.* Qoheleth''s word for Sirach 11:11 — the one who makes haste is so much the more behind, for the race is not to the swift.'),
  ('apocrypha', 'ecclesiasticus', 11, 10, 'canon', 'proverbs', 28, 20, 'free', E'Proverbs 28:20 — *A faithful man shall abound with blessings: but he that maketh haste to be rich shall not be innocent.* Meddle much and you shall not be innocent (Sirach 11:10) is Proverbs'' own verdict on the hasty.'),
  ('apocrypha', 'ecclesiasticus', 11, 12, 'canon', 'psalms', 127, 1, 'free', E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The eye of Yahuah that sets a man up from low estate (Sirach 11:12) — apart from that building hand all the labour is vain.'),
  -- thread: ecclesiasticus-11-promotion-from-yahuah
  ('apocrypha', 'ecclesiasticus', 11, 14, 'canon', 'psalms', 75, 7, 'free', E'Psalm 75:7 — *But Elohim (God) is the judge: he putteth down one, and setteth up another.* The Psalm''s word for Sirach 11:14 — prosperity and adversity, poverty and riches, all come of Yahuah who alone sets up and casts down.'),
  ('apocrypha', 'ecclesiasticus', 11, 14, 'canon', 'psalms', 75, 6, 'free', E'Psalm 75:6 — *For promotion cometh neither from the east, nor from the west, nor from the south.* Life and death and riches come of Yahuah (Sirach 11:14), not from any quarter of the earth.'),
  ('apocrypha', 'ecclesiasticus', 11, 21, 'canon', 'deuteronomy', 8, 18, 'free', E'Deuteronomy 8:18 — *But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers, as it is this day.* Yahuah makes a poor man rich on the sudden (Sirach 11:21) — Moses anchors it: it is He that giveth power to get wealth.'),
  ('apocrypha', 'ecclesiasticus', 11, 17, 'canon', 'james', 1, 17, 'free', E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The gift and favour of Yahuah (Sirach 11:17) is James''s every good and perfect gift from the Father of lights.'),
  -- thread: ecclesiasticus-11-rich-fool-remember-death
  ('apocrypha', 'ecclesiasticus', 11, 19, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s rich fool is Sirach 11:19 verbatim — he says he will eat continually of his goods, yet must leave them to others and die.'),
  ('apocrypha', 'ecclesiasticus', 11, 24, 'canon', 'luke', 12, 21, 'free', E'Luke 12:21 — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* The man who says ''I have enough, and possess many things'' (Sirach 11:24) is the one not rich toward Elohim.'),
  ('apocrypha', 'ecclesiasticus', 11, 24, 'canon', '1-timothy', 6, 9, 'free', E'1 Timothy 6:9 — *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition.* Say not ''I have enough'' presuming on the hereafter (Sirach 11:24) — Paul names the snare that swallows those who will be rich.'),
  ('apocrypha', 'ecclesiasticus', 11, 26, 'canon', 'hebrews', 9, 27, 'free', E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment:* In the day of death Yahuah rewards a man according to his ways (Sirach 11:26) — appointed once to die, and after, the judgment.'),
  ('apocrypha', 'ecclesiasticus', 11, 28, 'canon', 'ecclesiastes', 7, 1, 'free', E'Ecclesiastes 7:1 — *A good name is better than precious ointment; and the day of death than the day of one’s birth.* Judge none blessed before his death (Sirach 11:28) — Qoheleth too weighs a life by its end, not its outward beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-judge-not-by-appearance',
       E'Yahuah seeth not as man seeth — judge not by the outward',
       E'Ben Sira opens the wisdom of the lowly head lifted up and warns against the surface of things: *Commend not a man for his beauty; neither abhor a man for his outward appearance.* (Ecclesiasticus 11:2) — *for the works of Yahuah (God) are wonderful, and his works among men are hidden.* (Ecclesiasticus 11:4) This is the very lesson Samuel learns at the anointing of David: *for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* (1 Samuel 16:7) The honour the world reads off clothing and crowns is reversed in the eyes of Yahuah — *Many kings have sat down upon the ground; and one that was never thought of has worn the crown.* (Ecclesiasticus 11:5) James, the closest NT sibling to this wisdom, sets the same paradox: *Let the brother of low degree rejoice in that he is exalted* (James 1:9), *But the rich, in that he is made low.* (James 1:10) It ain''t new — the Tanakh, the deuterocanon, and the brother of the Messiah all read the heart, not the raiment.',
       sv.verse_id, ev.verse_id, 'extras', 58550
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-pride-beginning-of-sin',
       E'Exalt not thyself — pride is the beginning of sin',
       E'*Boast not of your clothing and raiment, and exalt not thyself in the day of honour* (Ecclesiasticus 11:4) — and the partridge in the cage names the danger: *so is the heart of the proud; and like as a spy, watcheth he for your fall.* (Ecclesiasticus 11:30) Ben Sira had already laid the root one chapter back: *For pride is the beginning of sin, and he that has it shall pour out abomination* (Ecclesiasticus 10:13), *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* (Ecclesiasticus 10:12) The whole library agrees — *Pride goeth before destruction, and an haughty spirit before a fall.* (Proverbs 16:18) Self-link the live apocrypha: Sirach 11 is leaning on Sirach 10''s own diagnosis. It ain''t new: from Proverbs to ben Sira, the exalted self is the first stumble.',
       sv.verse_id, ev.verse_id, 'extras', 58553
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-answer-not-before-hearing',
       E'Understand first, and then rebuke — answer not before you hear',
       E'Ben Sira''s counsel of the tongue: *Blame not before you have examined the truth: understand first, and then rebuke.* (Ecclesiasticus 11:7) — *Answer not before you have heard the cause: neither interrupt men in the midst of their talk.* (Ecclesiasticus 11:8) Proverbs cuts it to the bone: *He that answereth a matter before he heareth it, it is folly and shame unto him.* (Proverbs 18:13) And James, the wisdom-book of the NT, sets the same rule as the mark of a life that hears Elohim: this is the *swift to hear, slow to speak* posture in narrative form. It ain''t new — the discipline of hearing before judging runs Proverbs → Sirach → the Epistle of James unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 58556
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-labour-not-to-be-rich',
       E'Travail not to be rich — the swift do not win the race',
       E'Against the frantic merchant: *There is one that laboureth, and takes pains, and makes haste, and is so much the more behind.* (Ecclesiasticus 11:11) — for *the eye of Yahuah (God) looked upon him for good, and set him up from his low estate.* (Ecclesiasticus 11:12) Proverbs commands it plainly: *Labour not to be rich: cease from thine own wisdom* (Proverbs 23:4), and warns *he that maketh haste to be rich shall not be innocent.* (Proverbs 28:20) Qoheleth saw the same under the sun: *the race is not to the swift, nor the battle to the strong... but time and chance happeneth to them all.* (Ecclesiastes 9:11) And the gathering of the increase is not the strong arm but the building hand of Yahuah: *Except Yahuah (LORD) build the house, they labour in vain that build it.* (Psalm 127:1) It ain''t new — the wisdom books refuse the cult of hustle.',
       sv.verse_id, ev.verse_id, 'extras', 58559
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-promotion-from-yahuah',
       E'Life and death come of Yahuah — promotion is His to give',
       E'The hinge of the chapter: *Prosperity and adversity, life and death, poverty and riches, come of Yahuah (God).* (Ecclesiasticus 11:14) — *for it is an easy thing in the sight of Yahuah (God) on the sudden to make a poor man rich.* (Ecclesiasticus 11:21) The Psalm names the same Judge who alone promotes: *For promotion cometh neither from the east, nor from the west, nor from the south.* (Psalm 75:6), *But Elohim (God) is the judge: he putteth down one, and setteth up another.* (Psalm 75:7) Moses had warned the wealthy heart against forgetting it: *thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth.* (Deuteronomy 8:18) And James, the Sirach of the NT, traces every good thing to the same source: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights.* (James 1:17) It ain''t new — the lifting up and casting down is Yahuah''s alone.',
       sv.verse_id, ev.verse_id, 'extras', 58562
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-11-rich-fool-remember-death',
       E'Say not, I have enough — remember the day of death',
       E'Ben Sira draws the rich man who has stored up and never reckons his end: *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* (Ecclesiasticus 11:19) — *Again, say not, I have enough, and possess many things, and what evil shall I have hereafter?* (Ecclesiasticus 11:24) Yahusha tells this exact parable: *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee.* (Luke 12:20), *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* (Luke 12:21) James fires the same warning: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* (James 5:1) For the end is appointed — *it is an easy thing to Yahuah (God) in the day of death to reward a man according to his ways* (Ecclesiasticus 11:26) — *And as it is appointed unto men once to die, but after this the judgment.* (Hebrews 9:27) Judge none blessed before his death. It ain''t new — the rich fool of Luke 12 was already standing in Sirach 11.',
       sv.verse_id, ev.verse_id, 'extras', 58565
  FROM _session253_sir11_lookup sv, _session253_sir11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=11 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-11-judge-not-by-appearance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 16:7 — *But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart.* The Tanakh''s anchor for Sirach 11:2 — abhor not a man by his outward appearance, for Yahuah weighs the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-judge-not-by-appearance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:9 — *Let the brother of low degree rejoice in that he is exalted:* James echoes Sirach 11:5''s reversal — the unregarded man wears the crown, the brother of low degree is the one exalted.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-judge-not-by-appearance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* The mighty greatly disgraced and the honourable delivered up (Sirach 11:6) is James''s fading flower of the rich.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-judge-not-by-appearance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-pride-beginning-of-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira self-links: the warning not to exalt thyself in the day of honour (11:4) rests on his own root-diagnosis that pride is the beginning of sin.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 10:12 — *The beginning of pride is when one departs from Yahuah (God), and his heart is turned away from his Maker.* The proud heart that watcheth for your fall (11:30) is the heart already turned away from its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Proverbs gives the proverb behind Sirach 11:4''s warning not to exalt thyself in the day of honour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-pride-beginning-of-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-answer-not-before-hearing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:13 — *He that answereth a matter before he heareth it, it is folly and shame unto him.* The exact proverb Sirach 11:8 expands — answer not before you have heard the cause.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-answer-not-before-hearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:14 — *And he said unto him, Man, who made me a judge or a divider over you?* Yahusha himself keeps Sirach 11:9''s rule — strive not in a matter that concerneth you not, sit not in judgment uninvited.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-answer-not-before-hearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-labour-not-to-be-rich
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:4 — *Labour not to be rich: cease from thine own wisdom.* The Tanakh command Sirach 11:11 dramatizes — he that makes haste is the more behind.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 9:11 — *I returned, and saw under the sun, that the race is not to the swift, nor the battle to the strong, neither yet bread to the wise, nor yet riches to men of understanding, nor yet favour to men of skill; but time and chance happeneth to them all.* Qoheleth''s word for Sirach 11:11 — the one who makes haste is so much the more behind, for the race is not to the swift.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 28:20 — *A faithful man shall abound with blessings: but he that maketh haste to be rich shall not be innocent.* Meddle much and you shall not be innocent (Sirach 11:10) is Proverbs'' own verdict on the hasty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 127:1 — *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* The eye of Yahuah that sets a man up from low estate (Sirach 11:12) — apart from that building hand all the labour is vain.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-labour-not-to-be-rich'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-promotion-from-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 75:7 — *But Elohim (God) is the judge: he putteth down one, and setteth up another.* The Psalm''s word for Sirach 11:14 — prosperity and adversity, poverty and riches, all come of Yahuah who alone sets up and casts down.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 75:6 — *For promotion cometh neither from the east, nor from the west, nor from the south.* Life and death and riches come of Yahuah (Sirach 11:14), not from any quarter of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 8:18 — *But thou shalt remember Yahuah Elohayka (the LORD thy God): for it is he that giveth thee power to get wealth, that he may establish his covenant which he sware unto thy fathers, as it is this day.* Yahuah makes a poor man rich on the sudden (Sirach 11:21) — Moses anchors it: it is He that giveth power to get wealth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* The gift and favour of Yahuah (Sirach 11:17) is James''s every good and perfect gift from the Father of lights.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-promotion-from-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-11-rich-fool-remember-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s rich fool is Sirach 11:19 verbatim — he says he will eat continually of his goods, yet must leave them to others and die.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:21 — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* The man who says ''I have enough, and possess many things'' (Sirach 11:24) is the one not rich toward Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:9 — *But they that will be rich fall into temptation and a snare, and into many foolish and hurtful lusts, which drown men in destruction and perdition.* Say not ''I have enough'' presuming on the hereafter (Sirach 11:24) — Paul names the snare that swallows those who will be rich.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 9:27 — *And as it is appointed unto men once to die, but after this the judgment:* In the day of death Yahuah rewards a man according to his ways (Sirach 11:26) — appointed once to die, and after, the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiastes 7:1 — *A good name is better than precious ointment; and the day of death than the day of one’s birth.* Judge none blessed before his death (Sirach 11:28) — Qoheleth too weighs a life by its end, not its outward beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir11_lookup sv, _session253_sir11_lookup tv
 WHERE t.slug='ecclesiasticus-11-rich-fool-remember-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_12.sql (session253 ecclesiasticus 12) -----
-- Source anchor: apocrypha/ecclesiasticus ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir12 (view _session253_sir12_lookup). Sort band base 58575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-12-do-good-to-the-worthy
  ('apocrypha', 'ecclesiasticus', 12, 1, 'canon', 'proverbs', 25, 21, 'free', E'Proverbs 25:21 — *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* the Tanakh root of beneficence that Sirach 12:1 frames with discernment of the recipient.'),
  ('apocrypha', 'ecclesiasticus', 12, 2, 'canon', 'matthew', 5, 44, 'free', E'Matthew 5:44 — *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;* the Sermon presses doing-good outward to the enemy where Sirach 12:2 anchors the recompence in the Most High.'),
  ('apocrypha', 'ecclesiasticus', 12, 4, 'canon', 'romans', 12, 20, 'free', E'Romans 12:20 — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head.* Sha''ul commands feeding the enemy; Sirach 12:4 is the guarded counterpart, ''Give to the godly man, and help not a sinner.'''),
  ('apocrypha', 'ecclesiasticus', 12, 6, 'apocrypha', 'ecclesiasticus', 6, 7, 'extras', E'Ecclesiasticus 6:7 — *If you would get a friend, prove him first and be not hasty to credit him.* the same wisdom prudence ben Sira applies to charity in Sirach 12:6, that the Most High repays the ungodly, calls for proving a man before trusting him.'),
  -- thread: ecclesiasticus-12-never-trust-thine-enemy
  ('apocrypha', 'ecclesiasticus', 12, 16, 'canon', 'proverbs', 26, 24, 'free', E'Proverbs 26:24 — *He that hateth dissembleth with his lips, and layeth up deceit within him;* the exact portrait of Sirach 12:16''s enemy who speaks sweetly while imagining the pit.'),
  ('apocrypha', 'ecclesiasticus', 12, 11, 'canon', 'proverbs', 26, 25, 'free', E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* answers Sirach 12:11''s warning that the crouching, humbled enemy''s rust ''has not been altogether wiped away.'''),
  ('apocrypha', 'ecclesiasticus', 12, 10, 'canon', 'proverbs', 27, 6, 'free', E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* the proverbial blade behind Sirach 12:10''s ''Never trust your enemy: for like as iron rusteth, so is his wickedness.'''),
  ('apocrypha', 'ecclesiasticus', 12, 12, 'canon', 'micah', 7, 5, 'free', E'Micah 7:5 — *Trust ye not in a friend, put ye not confidence in a guide: keep the doors of thy mouth from her that lieth in thy bosom.* the prophet''s last-days discernment matching Sirach 12:12''s caution not to seat the enemy at your right hand.'),
  -- thread: ecclesiasticus-12-the-feigned-friend-lifts-the-heel
  ('apocrypha', 'ecclesiasticus', 12, 9, 'canon', 'psalms', 41, 9, 'free', E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* David''s table-betrayer is the archetype of Sirach 12:9''s friend who departs in the day of adversity.'),
  ('apocrypha', 'ecclesiasticus', 12, 17, 'canon', 'matthew', 26, 49, 'free', E'Matthew 26:49 — *And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him.* the feigned friend of Sirach 12:17 who ''pretends to help'' yet undermines, fulfilled in the betrayer''s kiss.'),
  ('apocrypha', 'ecclesiasticus', 12, 15, 'apocrypha', 'ecclesiasticus', 6, 8, 'extras', E'Ecclesiasticus 6:8 — *For some man is a friend for his own occasion, and will not abide in the day of your trouble.* ben Sira''s own friendship-pack naming the companion of Sirach 12:15 who will not tarry once you begin to fall.'),
  ('apocrypha', 'ecclesiasticus', 12, 8, 'apocrypha', 'ecclesiasticus', 6, 10, 'extras', E'Ecclesiasticus 6:10 — *Again, some friend is a companion at the table, and will not continue in the day of your affliction.* the table-friend exposed by adversity, the very test Sirach 12:8 sets for knowing friend from enemy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-12-do-good-to-the-worthy',
       E'Do good — and to whom: the wisdom of discerning charity',
       E'Ben Sira opens with a wisdom counsel on charity: *When you will do good know to whom you do it; so shall you be thanked for your benefits* (Ecclesiasticus 12:1), *Do good to the godly man, and you shall find a recompence; and if not from him, yet from the Most High* (Ecclesiasticus 12:2). This is the Proverbs ethic of the open hand turned toward the worthy — *Give to the godly man, and help not a sinner* (Ecclesiasticus 12:4). The Sermon on the Mount pushes the same root deeper toward the enemy: *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;* (Matthew 5:44). And the Tanakh already carried the coal: *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* (Proverbs 25:21), which Sha''ul gathers up — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head.* (Romans 12:20). It ain''t new: Sirach is the same covenant ethic, only more guarded — where the Tanakh and the NT press feeding the enemy, ben Sira warns that kindness to the unrepentant sinner can return as harm, *lest you shall receive twice as much evil for all the good you shall have done to him*. The same wisdom stream, weighing mercy against discernment.',
       sv.verse_id, ev.verse_id, 'extras', 58575
  FROM _session253_sir12_lookup sv, _session253_sir12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-12-never-trust-thine-enemy',
       E'Never trust thine enemy, though he speak fair',
       E'The chapter turns to the heart of its warning: *Never trust your enemy: for like as iron rusteth, so is his wickedness* (Ecclesiasticus 12:10), *Though he humble himself, and go crouching, yet take good heed and beware of him... you shall know that his rust has not been altogether wiped away* (Ecclesiasticus 12:11). The smooth speech hides the pit: *An enemy speaks sweetly with his lips, but in his heart he imagineth how to throw you into a pit* (Ecclesiasticus 12:16). This is pure Proverbs: *He that hateth dissembleth with his lips, and layeth up deceit within him;* (Proverbs 26:24), *When he speaketh fair, believe him not: for there are seven abominations in his heart.* (Proverbs 26:25), *Whose hatred is covered by deceit, his wickedness shall be shewed before the whole congregation.* (Proverbs 26:26) — and the famous *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* (Proverbs 27:6). The prophet Micah carries the same hard discernment into the last-days remnant: *Trust ye not in a friend, put ye not confidence in a guide: keep the doors of thy mouth from her that lieth in thy bosom.* (Micah 7:5). It ain''t new — Sirach''s ''beware the crouching enemy'' is the wisdom tradition''s settled testimony that fair words conceal a covered heart.',
       sv.verse_id, ev.verse_id, 'extras', 58578
  FROM _session253_sir12_lookup sv, _session253_sir12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=12 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-12-the-feigned-friend-lifts-the-heel',
       E'The feigned friend who departs in adversity and lifts up the heel',
       E'Ben Sira measures friendship by the day of trouble: *A friend cannot be known in prosperity: and an enemy cannot be hidden in adversity* (Ecclesiasticus 12:8), *In the prosperity of a man enemies will be grieved: but in his adversity even a friend will depart* (Ecclesiasticus 12:9), and *For a while he will abide with you, but if you begin to fall, he will not tarry* (Ecclesiasticus 12:15). The feigned helper turns saboteur — *though he pretend to help you, yet shall he undermine you* (Ecclesiasticus 12:17). This is David''s lament over the betrayer at his own table: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* (Psalm 41:9) — the very word Yahusha sealed at the Last Supper, fulfilled in the kiss: *And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him.* (Matthew 26:49). Ben Sira''s own wisdom-pack on friendship names the same false companion: *For some man is a friend for his own occasion, and will not abide in the day of your trouble* (Ecclesiasticus 6:8), *some friend is a companion at the table, and will not continue in the day of your affliction* (Ecclesiasticus 6:10). It ain''t new: the table-fellow who lifts the heel runs from the Psalter through ben Sira to the betrayal of the Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 58581
  FROM _session253_sir12_lookup sv, _session253_sir12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=12 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-12-do-good-to-the-worthy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 25:21 — *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* the Tanakh root of beneficence that Sirach 12:1 frames with discernment of the recipient.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:44 — *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;* the Sermon presses doing-good outward to the enemy where Sirach 12:2 anchors the recompence in the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:20 — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head.* Sha''ul commands feeding the enemy; Sirach 12:4 is the guarded counterpart, ''Give to the godly man, and help not a sinner.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 6:7 — *If you would get a friend, prove him first and be not hasty to credit him.* the same wisdom prudence ben Sira applies to charity in Sirach 12:6, that the Most High repays the ungodly, calls for proving a man before trusting him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-12-never-trust-thine-enemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:24 — *He that hateth dissembleth with his lips, and layeth up deceit within him;* the exact portrait of Sirach 12:16''s enemy who speaks sweetly while imagining the pit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* answers Sirach 12:11''s warning that the crouching, humbled enemy''s rust ''has not been altogether wiped away.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* the proverbial blade behind Sirach 12:10''s ''Never trust your enemy: for like as iron rusteth, so is his wickedness.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Micah 7:5 — *Trust ye not in a friend, put ye not confidence in a guide: keep the doors of thy mouth from her that lieth in thy bosom.* the prophet''s last-days discernment matching Sirach 12:12''s caution not to seat the enemy at your right hand.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-12-the-feigned-friend-lifts-the-heel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* David''s table-betrayer is the archetype of Sirach 12:9''s friend who departs in the day of adversity.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 26:49 — *And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him.* the feigned friend of Sirach 12:17 who ''pretends to help'' yet undermines, fulfilled in the betrayer''s kiss.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 6:8 — *For some man is a friend for his own occasion, and will not abide in the day of your trouble.* ben Sira''s own friendship-pack naming the companion of Sirach 12:15 who will not tarry once you begin to fall.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 6:10 — *Again, some friend is a companion at the table, and will not continue in the day of your affliction.* the table-friend exposed by adversity, the very test Sirach 12:8 sets for knowing friend from enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_13.sql (session253 ecclesiasticus 13) -----
-- Source anchor: apocrypha/ecclesiasticus ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir13 (view _session253_sir13_lookup). Sort band base 58600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-13-touch-pitch
  ('apocrypha', 'ecclesiasticus', 13, 1, 'canon', '1-corinthians', 15, 33, 'free', E'1 Corinthians 15:33 — *Be not deceived: evil communications corrupt good manners.* Paul''s one-line proverb is Ben Sira''s pitch by another name — bad fellowship corrupts, so Sirach 13:1 warns it defiles.'),
  ('apocrypha', 'ecclesiasticus', 13, 1, 'canon', 'proverbs', 22, 24, 'free', E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* the Torah-wisdom Ben Sira inherits — avoid the proud and furious man''s fellowship lest Sirach 13:1''s defilement take hold.'),
  ('apocrypha', 'ecclesiasticus', 13, 1, 'canon', 'psalms', 1, 1, 'free', E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The blessing for the man who keeps clear of the scornful''s seat — the positive of Sirach 13:1''s warning against fellowship with the proud.'),
  ('apocrypha', 'ecclesiasticus', 13, 1, 'apocrypha', 'ecclesiasticus', 27, 9, 'extras', E'Ecclesiasticus 27:9 — *The birds will resort to their like; so will truth return to them that practise in her.* Ben Sira''s own like-to-like principle elsewhere in his book — the same law of company that makes touching pitch (Sirach 13:1) defile.'),
  -- thread: ecclesiasticus-13-rich-wrongs-poor
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'proverbs', 22, 7, 'free', E'Proverbs 22:7 — *The rich ruleth over the poor, and the borrower is servant to the lender.* The bare wisdom-fact behind Sirach 13:3 — the rich man rules, so he can wrong and still threaten while the poor must entreat.'),
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'james', 2, 6, 'free', E'James 2:6 — *But ye have despised the poor. Do not rich men oppress you, and draw you before the judgment seats?* James, the NT''s closest sibling to Sirach, indicts the very oppression Sirach 13:3 describes — the rich wrong and drag, the poor must plead.'),
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'amos', 5, 11, 'free', E'Amos 5:11 — *Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat: ye have built houses of hewn stone, but ye shall not dwell in them; ye have planted pleasant vineyards, but ye shall not drink wine of them.* The prophetic sentence on the rich who tread the poor — the wrong of Sirach 13:3 does not go unjudged.'),
  ('apocrypha', 'ecclesiasticus', 13, 3, 'canon', 'isaiah', 3, 14, 'free', E'Isaiah 3:14 — *Yahuah (LORD) will enter into judgment with the ancients of his people, and the princes thereof: for ye have eaten up the vineyard; the spoil of the poor is in your houses.* Yahuah himself enters into judgment for the spoil of the poor — the answer to the rich man''s wrong in Sirach 13:3.'),
  -- thread: ecclesiasticus-13-flattery-snare
  ('apocrypha', 'ecclesiasticus', 13, 11, 'canon', 'proverbs', 22, 25, 'free', E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* The snare of the powerful man''s company in Proverbs is exactly the trap Sirach 13:11 names — his much communication is set to tempt and ensnare.'),
  ('apocrypha', 'ecclesiasticus', 13, 12, 'canon', 'habakkuk', 2, 6, 'free', E'Habakkuk 2:6 — *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long? and to him that ladeth himself with thick clay!* The oppressor who lays up the poor man''s words to hurt him (Sirach 13:12) has a woe laid up against his own increase.'),
  -- thread: ecclesiasticus-13-love-yahuah-like-to-like
  ('apocrypha', 'ecclesiasticus', 13, 14, 'canon', 'deuteronomy', 6, 5, 'free', E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Shema''s first commandment stands behind Sirach 13:14 — love Yahuah all thy life, the one bond that never betrays.'),
  ('apocrypha', 'ecclesiasticus', 13, 17, 'canon', 'isaiah', 11, 6, 'free', E'Isaiah 11:6 — *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* The wolf-and-lamb enmity Sirach 13:17 takes as fixed is exactly what the messianic mountain reverses.'),
  ('apocrypha', 'ecclesiasticus', 13, 17, 'canon', 'isaiah', 65, 25, 'free', E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent’s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* In the new creation the wolf and lamb of Sirach 13:17 finally have fellowship — Yahuah undoes the law of predatory kind.'),
  -- thread: ecclesiasticus-13-rich-poor-favored
  ('apocrypha', 'ecclesiasticus', 13, 22, 'canon', 'proverbs', 19, 4, 'free', E'Proverbs 19:4 — *Wealth maketh many friends; but the poor is separated from his neighbour.* The proverb behind Sirach 13:22 — the fallen rich man finds many helpers, the poor man is left alone.'),
  ('apocrypha', 'ecclesiasticus', 13, 22, 'canon', 'proverbs', 19, 7, 'free', E'Proverbs 19:7 — *All the brethren of the poor do hate him: how much more do his friends go far from him? he pursueth them with words, yet they are wanting to him.* The poor man rebuked and friendless in Sirach 13:22 is the very figure Proverbs describes — pursued with words, given no place.'),
  ('apocrypha', 'ecclesiasticus', 13, 23, 'canon', 'proverbs', 14, 20, 'free', E'Proverbs 14:20 — *The poor is hated even of his own neighbour: but the rich hath many friends.* When the rich man speaks all extol it but the poor man is dismissed (Sirach 13:23) — Proverbs already weighed this partiality of wealth.'),
  ('apocrypha', 'ecclesiasticus', 13, 19, 'canon', 'isaiah', 3, 15, 'free', E'Isaiah 3:15 — *What mean ye that ye beat my people to pieces, and grind the faces of the poor? saith Adonai Yahuah (the Lord GOD) of hosts.* The rich eating up the poor in Sirach 13:19 is what Yahuah of hosts calls grinding the faces of the poor — and he enters judgment for it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-touch-pitch',
       E'He that toucheth pitch shall be defiled',
       E'Ben Sira opens chapter 13 with the wisdom-law of contagion: *He that toucheth pitch shall be defiled with it; and he that has fellowship with a proud man shall be like to him.* (Ecclesiasticus 13:1) — the company you keep stamps itself on you. Paul says the same to the Corinthians: *Be not deceived: evil communications corrupt good manners.* (1 Corinthians 15:33) — it ain''t new. Proverbs had already laid it down: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 22:24) is the warning against the angry man''s snare, and the psalmist blesses the one who refuses the seat: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* (Psalms 1:1) Ben Sira''s own image returns elsewhere in his book — *The birds will resort to their like; so will truth return to them that practise in her.* (Ecclesiasticus 27:9) — like cleaves to like, for good or ill.',
       sv.verse_id, ev.verse_id, 'extras', 58600
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-rich-wrongs-poor',
       E'The rich man hath done wrong, and yet he threateneth',
       E'Ben Sira names the upside-down justice of the powerful: *The rich man has done wrong, and yet he threateneth withal: the poor is wronged, and he must intreat also.* (Ecclesiasticus 13:3) The oppressor wrongs and still threatens; the victim must come begging. The Torah and the prophets thundered this long before. *The rich ruleth over the poor, and the borrower is servant to the lender.* (Proverbs 22:7) James asks the same in the assembly: *But ye have despised the poor. Do not rich men oppress you, and draw you before the judgment seats?* (James 2:6) Amos sees Yahuah''s verdict on it: *Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat: ye have built houses of hewn stone, but ye shall not dwell in them...* (Amos 5:11) And Isaiah brings the LORD himself into court: *Yahuah (LORD) will enter into judgment with the ancients of his people, and the princes thereof: for ye have eaten up the vineyard; the spoil of the poor is in your houses.* (Isaiah 3:14) — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58603
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-flattery-snare',
       E'With much communication will he tempt thee',
       E'Ben Sira warns that the great man''s friendliness is a baited trap: *Affect not to be made equal to him in talk, and believe not his many words: for with much communication will he tempt you, and smiling upon you will get out your secrets:* (Ecclesiasticus 13:11) — and then *cruelly he will lay up your words, and will not spare to do you hurt, and to put you in prison.* (Ecclesiasticus 13:12) His smile is reconnaissance; his many words are a net. Proverbs gives the rule for such company: *Make no friendship with an angry man; and with a furious man thou shalt not go: Lest thou learn his ways, and get a snare to thy soul.* (Proverbs 22:25) And Habakkuk turns the tables — the day comes when the spoiled raise the proverb against the spoiler: *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long?...* (Habakkuk 2:6) The oppressor''s words are laid up against the weak; Yahuah lays up a woe against the oppressor.',
       sv.verse_id, ev.verse_id, 'extras', 58606
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-love-yahuah-like-to-like',
       E'Love Yahuah all thy life; like will cleave to like',
       E'Against the seduction of the great, Ben Sira plants the one safe fellowship: *Love Yahuah (God) all your life, and call upon him for your salvation.* (Ecclesiasticus 13:14) — the Shema in wisdom dress: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5) Then the law of kind: *Every beast loves his like, and every man loves his neighbor.* (Ecclesiasticus 13:15) and *What fellowship has the wolf with the lamb? so the sinner with the godly.* (Ecclesiasticus 13:17) The wolf and the lamb cannot agree — until the mountain is made new. *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid...* (Isaiah 11:6) and *The wolf and the lamb shall feed together... They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* (Isaiah 65:25) — the enmity of kinds Ben Sira observes is the very thing the kingdom undoes. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58609
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-13-rich-poor-favored',
       E'When a rich man is fallen, he hath many helpers',
       E'Ben Sira lays bare the world''s partiality: *As the wild ass is the lion’s prey in the wilderness: so the rich eat up the poor.* (Ecclesiasticus 13:19) and *When a rich man is fallen, he has many helpers... the poor man slipped, and yet they rebuked him too; he spoke wisely, and could have no place.* (Ecclesiasticus 13:22) The same wisdom Israel knew: *Wealth maketh many friends; but the poor is separated from his neighbour.* (Proverbs 19:4) and *All the brethren of the poor do hate him: how much more do his friends go far from him?...* (Proverbs 19:7) and *The poor is hated even of his own neighbour: but the rich hath many friends.* (Proverbs 14:20) But Yahuah''s court overturns the world''s favoritism: *What mean ye that ye beat my people to pieces, and grind the faces of the poor? saith Adonai Yahuah (the Lord GOD) of hosts.* (Isaiah 3:15) — the poor man who could find no place has a Judge who takes up his cause.',
       sv.verse_id, ev.verse_id, 'extras', 58612
  FROM _session253_sir13_lookup sv, _session253_sir13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=13 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-13-touch-pitch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:33 — *Be not deceived: evil communications corrupt good manners.* Paul''s one-line proverb is Ben Sira''s pitch by another name — bad fellowship corrupts, so Sirach 13:1 warns it defiles.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* the Torah-wisdom Ben Sira inherits — avoid the proud and furious man''s fellowship lest Sirach 13:1''s defilement take hold.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The blessing for the man who keeps clear of the scornful''s seat — the positive of Sirach 13:1''s warning against fellowship with the proud.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 27:9 — *The birds will resort to their like; so will truth return to them that practise in her.* Ben Sira''s own like-to-like principle elsewhere in his book — the same law of company that makes touching pitch (Sirach 13:1) defile.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-touch-pitch'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=27 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-rich-wrongs-poor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:7 — *The rich ruleth over the poor, and the borrower is servant to the lender.* The bare wisdom-fact behind Sirach 13:3 — the rich man rules, so he can wrong and still threaten while the poor must entreat.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 2:6 — *But ye have despised the poor. Do not rich men oppress you, and draw you before the judgment seats?* James, the NT''s closest sibling to Sirach, indicts the very oppression Sirach 13:3 describes — the rich wrong and drag, the poor must plead.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 5:11 — *Forasmuch therefore as your treading is upon the poor, and ye take from him burdens of wheat: ye have built houses of hewn stone, but ye shall not dwell in them; ye have planted pleasant vineyards, but ye shall not drink wine of them.* The prophetic sentence on the rich who tread the poor — the wrong of Sirach 13:3 does not go unjudged.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 3:14 — *Yahuah (LORD) will enter into judgment with the ancients of his people, and the princes thereof: for ye have eaten up the vineyard; the spoil of the poor is in your houses.* Yahuah himself enters into judgment for the spoil of the poor — the answer to the rich man''s wrong in Sirach 13:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-wrongs-poor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-flattery-snare
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* The snare of the powerful man''s company in Proverbs is exactly the trap Sirach 13:11 names — his much communication is set to tempt and ensnare.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-flattery-snare'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:6 — *Shall not all these take up a parable against him, and a taunting proverb against him, and say, Woe to him that increaseth that which is not his! how long? and to him that ladeth himself with thick clay!* The oppressor who lays up the poor man''s words to hurt him (Sirach 13:12) has a woe laid up against his own increase.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-flattery-snare'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-love-yahuah-like-to-like
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* The Shema''s first commandment stands behind Sirach 13:14 — love Yahuah all thy life, the one bond that never betrays.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-love-yahuah-like-to-like'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:6 — *The wolf also shall dwell with the lamb, and the leopard shall lie down with the kid; and the calf and the young lion and the fatling together; and a little child shall lead them.* The wolf-and-lamb enmity Sirach 13:17 takes as fixed is exactly what the messianic mountain reverses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-love-yahuah-like-to-like'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock: and dust shall be the serpent’s meat. They shall not hurt nor destroy in all my holy mountain, saith Yahuah (LORD).* In the new creation the wolf and lamb of Sirach 13:17 finally have fellowship — Yahuah undoes the law of predatory kind.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-love-yahuah-like-to-like'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-13-rich-poor-favored
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 19:4 — *Wealth maketh many friends; but the poor is separated from his neighbour.* The proverb behind Sirach 13:22 — the fallen rich man finds many helpers, the poor man is left alone.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 19:7 — *All the brethren of the poor do hate him: how much more do his friends go far from him? he pursueth them with words, yet they are wanting to him.* The poor man rebuked and friendless in Sirach 13:22 is the very figure Proverbs describes — pursued with words, given no place.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 14:20 — *The poor is hated even of his own neighbour: but the rich hath many friends.* When the rich man speaks all extol it but the poor man is dismissed (Sirach 13:23) — Proverbs already weighed this partiality of wealth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 3:15 — *What mean ye that ye beat my people to pieces, and grind the faces of the poor? saith Adonai Yahuah (the Lord GOD) of hosts.* The rich eating up the poor in Sirach 13:19 is what Yahuah of hosts calls grinding the faces of the poor — and he enters judgment for it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir13_lookup sv, _session253_sir13_lookup tv
 WHERE t.slug='ecclesiasticus-13-rich-poor-favored'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=13 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_14.sql (session253 ecclesiasticus 14) -----
-- Source anchor: apocrypha/ecclesiasticus ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir14 (view _session253_sir14_lookup). Sort band base 58625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-14-blessed-the-guarded-mouth
  ('apocrypha', 'ecclesiasticus', 14, 1, 'canon', 'proverbs', 13, 3, 'free', E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* The same wisdom Ben Sira blesses in Sirach 14:1, the guarded mouth that does not slip into the multitude of sins.'),
  ('apocrypha', 'ecclesiasticus', 14, 1, 'canon', 'james', 3, 2, 'free', E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James, Sirach''s nearest NT kin, makes the un-slipped tongue of Sirach 14:1 the mark of the perfect man.'),
  ('apocrypha', 'ecclesiasticus', 14, 2, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s opening beatitude on the man of clear conscience answers Ben Sira''s blessing in Sirach 14:2.'),
  -- thread: ecclesiasticus-14-the-covetous-eye-riches-in-vain
  ('apocrypha', 'ecclesiasticus', 14, 3, 'canon', 'ecclesiastes', 5, 10, 'free', E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* Qoheleth names the same unsatisfied covetous eye Ben Sira condemns in Sirach 14:3,9.'),
  ('apocrypha', 'ecclesiasticus', 14, 4, 'canon', 'luke', 12, 19, 'free', E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool gathers for others to spend, exactly the self-defrauding hoarder of Sirach 14:4.'),
  ('apocrypha', 'ecclesiasticus', 14, 4, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The wealth gathered by defrauding the soul (Sirach 14:4) passes to another the very night the hoarder dies.'),
  ('apocrypha', 'ecclesiasticus', 14, 9, 'canon', 'psalms', 49, 6, 'free', E'Psalm 49:6 — *They that trust in their wealth, and boast themselves in the multitude of their riches;* the never-satisfied covetous eye of Sirach 14:9 is the soul that trusts in wealth that cannot redeem it.'),
  ('apocrypha', 'ecclesiasticus', 14, 4, 'canon', 'proverbs', 11, 24, 'free', E'Proverbs 11:24 — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty.* The generous opposite of the niggard who gathers only for others in Sirach 14:4.'),
  -- thread: ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave
  ('apocrypha', 'ecclesiasticus', 14, 16, 'canon', 'ecclesiastes', 5, 15, 'free', E'Ecclesiastes 5:15 — *As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand.* Because nothing follows into the grave, Sirach 14:16 urges giving and sanctifying the soul now.'),
  ('apocrypha', 'ecclesiasticus', 14, 16, 'canon', '1-timothy', 6, 7, 'free', E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* Paul states the very ground of Sirach 14:16 — there is no seeking of dainties in the grave.'),
  ('apocrypha', 'ecclesiasticus', 14, 11, 'canon', 'job', 1, 21, 'free', E'Job 1:21 — *And said, Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Job''s surrender frames the do-good-to-thyself-and-give-Yahuah-his-due of Sirach 14:11.'),
  ('apocrypha', 'ecclesiasticus', 14, 13, 'canon', 'proverbs', 11, 25, 'free', E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself.* The blessing on the outstretched hand of Sirach 14:13.'),
  ('apocrypha', 'ecclesiasticus', 14, 13, 'canon', 'matthew', 6, 20, 'free', E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* the Sermon turns Sirach 14:13''s almsgiving-before-death into treasure stored past the grave.'),
  -- thread: ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment
  ('apocrypha', 'ecclesiasticus', 14, 17, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* This is the covenant from the beginning Ben Sira cites in Sirach 14:17 — you shall die the death.'),
  ('apocrypha', 'ecclesiasticus', 14, 18, 'canon', 'isaiah', 40, 6, 'free', E'Isaiah 40:6 — *The voice said, Cry. And he said, What shall I cry? All flesh is grass, and all the goodliness thereof is as the flower of the field:* the prophet''s fading-flower of flesh matches the falling leaves of Sirach 14:18.'),
  ('apocrypha', 'ecclesiasticus', 14, 18, 'canon', '1-peter', 1, 24, 'free', E'1 Peter 1:24 — *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away:* Peter echoes the same generation-of-flesh that comes to an end in Sirach 14:18.'),
  ('apocrypha', 'ecclesiasticus', 14, 17, 'canon', 'james', 1, 10, 'free', E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* Sirach''s nearest NT kin turns the waxing-old of all flesh (Sirach 14:17) on the rich man who hoards.'),
  -- thread: ecclesiasticus-14-blessed-who-meditates-in-wisdom
  ('apocrypha', 'ecclesiasticus', 14, 20, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* The blessed meditation in wisdom of Sirach 14:20 is the Torah-delight of the Psalter''s blessed man.'),
  ('apocrypha', 'ecclesiasticus', 14, 23, 'canon', 'proverbs', 8, 34, 'free', E'Proverbs 8:34 — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors.* Wisdom''s own beatitude on the watcher at her doors mirrors Sirach 14:23, who hearkens at her doors.'),
  ('apocrypha', 'ecclesiasticus', 14, 26, 'canon', 'proverbs', 3, 18, 'free', E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The branches under which the seeker lodges in Sirach 14:26 are the tree of life that is Wisdom.'),
  ('apocrypha', 'ecclesiasticus', 14, 27, 'apocrypha', 'ecclesiasticus', 24, 19, 'extras', E'Ecclesiasticus 24:19 — *Come to me, all you that be desirous of me, and fill yourselves with my fruits.* Ben Sira''s own personified Wisdom completes Sirach 14:27 — the man covered in her glory is welcomed to her fruits.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-blessed-the-guarded-mouth',
       E'Blessed the man who has not slipped with his mouth',
       E'Ben Sira opens the chapter with a beatitude on the disciplined tongue and the clear conscience: *Blessed is the man that has not slipped with his mouth, and is not pricked with the multitude of sins* (Ecclesiasticus 14:1), *Blessed is he whose conscience has not condemned him, and who is not fallen from his hope in Yahuah (God)* (Ecclesiasticus 14:2). This is the wisdom tradition''s own "It ain''t new": Solomon had already taught *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction* (Proverbs 13:3), and the Psalter''s first beatitude crowns the man who shuns the scornful and delights in Torah — *Blessed is the man that walketh not in the counsel of the ungodly* (Psalm 1:1). James, the closest NT sibling to Sirach, carries the same measure of the tongue into the gospel: *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2).',
       sv.verse_id, ev.verse_id, 'extras', 58625
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-the-covetous-eye-riches-in-vain',
       E'The envious eye and the niggard who hoards in vain',
       E'Ben Sira pronounces a withering judgment on the miser: *Riches are not comely for a niggard: and what should an envious man do with money?* (Ecclesiasticus 14:3), *He that gathers by defrauding his own soul gathers for others, that shall spend his goods riotously* (Ecclesiasticus 14:4), *A covetous man''s eye is not satisfied with his portion; and the iniquity of the wicked drieth up his soul* (Ecclesiasticus 14:9). Solomon had seen the same vanity: *He that loveth silver shall not be satisfied with silver* (Ecclesiastes 5:10), *riches kept for the owners thereof to their hurt* (Ecclesiastes 5:13). The Psalmist marks *They that trust in their wealth, and boast themselves in the multitude of their riches* (Psalm 49:6). And Yahusha''s parable of the rich fool gives the hoarder''s end — he gathers for others who spend it: *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19), to which Elohim answers *Thou fool, this night thy soul shall be required of thee* (Luke 12:20). Against this stands the open hand — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty* (Proverbs 11:24).',
       sv.verse_id, ev.verse_id, 'extras', 58628
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave',
       E'Use thy good things, for in the grave is no seeking of dainties',
       E'Against the hoarder Ben Sira sets the open and generous hand, mindful of death: *My son, according to your ability do good to thyself, and give Yahuah (God) his due offering* (Ecclesiasticus 14:11), *Do good to your friend before you die, and according to your ability stretch out your hand and give to him* (Ecclesiasticus 14:13), *Give, and take, and sanctify your soul; for there is no seeking of dainties in the grave* (Ecclesiasticus 14:16). The naked-came, naked-goes truth that drives this generosity is the wisdom of Job and Qoheleth: *Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21), *naked shall he return to go as he came, and shall take nothing of his labour* (Ecclesiastes 5:15), which Paul presses on Timothy — *For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). And the Sermon''s command to transfer wealth past the grave answers Sirach''s plea to spend it now in mercy: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt... But lay up for yourselves treasures in heaven* (Matthew 6:19-20).',
       sv.verse_id, ev.verse_id, 'extras', 58631
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment',
       E'All flesh waxeth old as a garment — the covenant from the beginning',
       E'Ben Sira grounds the urgency of mercy in mortality, citing the Edenic sentence as a standing covenant: *All flesh waxeth old as a garment: for the covenant from the beginning is, You shall die the death* (Ecclesiasticus 14:17), and the image of fading leaves — *As of the green leaves on a thick tree, some fall, and some grow; so is the generation of flesh and blood, one comes to an end, and another is born* (Ecclesiasticus 14:18). The covenant from the beginning is Genesis: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The grass-and-flower figure is the prophets'' and apostles'' shared refrain — *All flesh is grass, and all the goodliness thereof is as the flower of the field* (Isaiah 40:6), *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24). James, Sirach''s NT sibling, aims it straight at the rich man: *But the rich, in that he is made low: because as the flower of the grass he shall pass away* (James 1:10).',
       sv.verse_id, ev.verse_id, 'extras', 58634
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-blessed-who-meditates-in-wisdom',
       E'Blessed the man that meditates in wisdom and dwells under her branches',
       E'The chapter closes with a beatitude on the seeker of wisdom, drawn in the figure of a hunter who camps at her gates and at last dwells beneath her: *Blessed is the man that does meditate good things in wisdom, and that reasoneth of holy things by his understanding* (Ecclesiasticus 14:20), *He that does lodge near her house shall also fasten a pin in her walls* (Ecclesiasticus 14:24), *He shall set his children under her shelter, and shall lodge under her branches* (Ecclesiasticus 14:26). The Psalter''s blessed man meditates the same way — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). Solomon''s personified Wisdom blesses the watcher at her doors — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors* (Proverbs 8:34) — and calls her a tree of life: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). Ben Sira himself, later in his own book, will have this same Wisdom invite the seeker home — *Come to me, all you that be desirous of me, and fill yourselves with my fruits* (Ecclesiasticus 24:19) — the dwelling-under-her-branches of Sirach 14 fulfilled at her table.',
       sv.verse_id, ev.verse_id, 'extras', 58637
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-14-blessed-the-guarded-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* The same wisdom Ben Sira blesses in Sirach 14:1, the guarded mouth that does not slip into the multitude of sins.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-the-guarded-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James, Sirach''s nearest NT kin, makes the un-slipped tongue of Sirach 14:1 the mark of the perfect man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-the-guarded-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s opening beatitude on the man of clear conscience answers Ben Sira''s blessing in Sirach 14:2.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-the-guarded-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-the-covetous-eye-riches-in-vain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* Qoheleth names the same unsatisfied covetous eye Ben Sira condemns in Sirach 14:3,9.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool gathers for others to spend, exactly the self-defrauding hoarder of Sirach 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The wealth gathered by defrauding the soul (Sirach 14:4) passes to another the very night the hoarder dies.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 49:6 — *They that trust in their wealth, and boast themselves in the multitude of their riches;* the never-satisfied covetous eye of Sirach 14:9 is the soul that trusts in wealth that cannot redeem it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 11:24 — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty.* The generous opposite of the niggard who gathers only for others in Sirach 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 5:15 — *As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand.* Because nothing follows into the grave, Sirach 14:16 urges giving and sanctifying the soul now.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* Paul states the very ground of Sirach 14:16 — there is no seeking of dainties in the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 1:21 — *And said, Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Job''s surrender frames the do-good-to-thyself-and-give-Yahuah-his-due of Sirach 14:11.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself.* The blessing on the outstretched hand of Sirach 14:13.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* the Sermon turns Sirach 14:13''s almsgiving-before-death into treasure stored past the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* This is the covenant from the beginning Ben Sira cites in Sirach 14:17 — you shall die the death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:6 — *The voice said, Cry. And he said, What shall I cry? All flesh is grass, and all the goodliness thereof is as the flower of the field:* the prophet''s fading-flower of flesh matches the falling leaves of Sirach 14:18.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:24 — *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away:* Peter echoes the same generation-of-flesh that comes to an end in Sirach 14:18.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* Sirach''s nearest NT kin turns the waxing-old of all flesh (Sirach 14:17) on the rich man who hoards.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-blessed-who-meditates-in-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* The blessed meditation in wisdom of Sirach 14:20 is the Torah-delight of the Psalter''s blessed man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:34 — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors.* Wisdom''s own beatitude on the watcher at her doors mirrors Sirach 14:23, who hearkens at her doors.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The branches under which the seeker lodges in Sirach 14:26 are the tree of life that is Wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 24:19 — *Come to me, all you that be desirous of me, and fill yourselves with my fruits.* Ben Sira''s own personified Wisdom completes Sirach 14:27 — the man covered in her glory is welcomed to her fruits.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_15.sql (session253 ecclesiasticus 15) -----
-- Source anchor: apocrypha/ecclesiasticus ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir15 (view _session253_sir15_lookup). Sort band base 58650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-15-fear-of-yahuah-obtains-wisdom
  ('apocrypha', 'ecclesiasticus', 15, 1, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Ben Sira''s opening — he that fears Yahuah and knows the law obtains wisdom — is Solomon''s own first principle (Sirach 15:1).'),
  ('apocrypha', 'ecclesiasticus', 15, 1, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear of Yahuah that ''will do good'' and obtains wisdom in Sirach 15:1 is the very beginning of wisdom in Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 15, 1, 'canon', 'proverbs', 2, 5, 'free', E'Proverbs 2:5 — *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God).* Knowledge of the law in Sirach 15:1 yields the fear of Yahuah and the knowledge of Elohim.'),
  ('apocrypha', 'ecclesiasticus', 15, 3, 'canon', 'proverbs', 3, 13, 'free', E'Proverbs 3:13 — *Happy is the man that findeth wisdom, and the man that getteth understanding.* The man fed *the bread of understanding* in Sirach 15:3 is the happy man who finds wisdom in Proverbs.'),
  ('apocrypha', 'ecclesiasticus', 15, 3, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* Sirach''s nursing-mother wisdom who feeds the seeker (Sirach 15:3) is James''s wisdom freely given to whoever asks — Sirach''s closest NT sibling.'),
  -- thread: ecclesiasticus-15-wisdom-far-from-pride-and-sinners
  ('apocrypha', 'ecclesiasticus', 15, 8, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Wisdom is *far from pride* in Sirach 15:8 because pride is the very road to ruin Proverbs charts.'),
  ('apocrypha', 'ecclesiasticus', 15, 8, 'canon', 'proverbs', 13, 10, 'free', E'Proverbs 13:10 — *Only by pride cometh contention: but with the well advised is wisdom.* That the proud and the liars cannot remember her (Sirach 15:8) is Solomon''s pairing of pride against wisdom.'),
  ('apocrypha', 'ecclesiasticus', 15, 9, 'canon', 'matthew', 15, 8, 'free', E'Matthew 15:8 — *This people draweth nigh unto me with their mouth, and honoureth me with their lips; but their heart is far from me.* Praise unseemly in a sinner''s mouth (Sirach 15:9) is the lip-honour without the heart that the Messiah rebukes.'),
  -- thread: ecclesiasticus-15-say-not-yahuah-made-me-fall
  ('apocrypha', 'ecclesiasticus', 15, 11, 'canon', 'james', 1, 13, 'free', E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man.* James''s ''let no man say'' is Ben Sira''s ''Say not... it is through Yahuah that I fell away'' (Sirach 15:11) — almost word for word.'),
  ('apocrypha', 'ecclesiasticus', 15, 12, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Against Sirach''s ''He has caused me to err'' (Sirach 15:12), James names the true cause: a man''s own lust, not Elohim.'),
  ('apocrypha', 'ecclesiasticus', 15, 11, 'apocrypha', 'the-wisdom-of-solomon', 1, 13, 'extras', E'Wisdom of Solomon 1:13 — *For Yahuah (God) made not death: neither has he pleasure in the destruction of the living.* The companion wisdom book on the same restored shelf seals Sirach 15:11 — Yahuah is no author of the fall or of death.'),
  ('apocrypha', 'ecclesiasticus', 15, 13, 'canon', 'psalms', 5, 4, 'free', E'Psalms 5:4 — *For thou art not a Elohim (God) that hath pleasure in wickedness: neither shall evil dwell with thee.* Yahuah *hates all abomination* in Sirach 15:13 because no evil can dwell with him.'),
  -- thread: ecclesiasticus-15-the-freedom-of-the-will
  ('apocrypha', 'ecclesiasticus', 15, 17, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Sirach''s ''Before man is life and death'' (Sirach 15:17) is Moses'' charge set before Israel verbatim in theme.'),
  ('apocrypha', 'ecclesiasticus', 15, 17, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* ''whether him liketh shall be given him'' (Sirach 15:17) is Moses'' ''therefore choose life'' — the will set free to choose.'),
  ('apocrypha', 'ecclesiasticus', 15, 14, 'canon', 'genesis', 4, 7, 'free', E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* Man left *in the hand of his counsel* (Sirach 15:14) is Cain told he can yet rule over sin — the will is his.'),
  ('apocrypha', 'ecclesiasticus', 15, 16, 'canon', 'joshua', 24, 15, 'free', E'Joshua 24:15 — *And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD).* ''stretch forth your hand to whether you will'' (Sirach 15:16) is Joshua''s ''choose you this day'' — fire and water before the will.'),
  ('apocrypha', 'ecclesiasticus', 15, 15, 'canon', 'deuteronomy', 11, 26, 'free', E'Deuteronomy 11:26 — *Behold, I set before you this day a blessing and a curse.* ''If you will, to keep the commandments'' (Sirach 15:15) is the blessing-and-curse Moses sets before the keeper of the law.'),
  -- thread: ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin
  ('apocrypha', 'ecclesiasticus', 15, 18, 'canon', 'psalms', 139, 1, 'free', E'Psalms 139:1 — *O Yahuah (LORD), thou hast searched me, and known me.* The Yahuah who *beholds all things* (Sirach 15:18) is David''s God who has searched and known him.'),
  ('apocrypha', 'ecclesiasticus', 15, 18, 'canon', 'proverbs', 15, 3, 'free', E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* Sirach''s all-beholding Yahuah (Sirach 15:18) is the proverb''s eyes-in-every-place.'),
  ('apocrypha', 'ecclesiasticus', 15, 19, 'canon', 'romans', 2, 6, 'free', E'Romans 2:6 — *Who will render to every man according to his deeds.* Because Yahuah *knoweth every work of man* (Sirach 15:19), Paul says he renders to every man by those works.'),
  ('apocrypha', 'ecclesiasticus', 15, 20, 'canon', 'james', 1, 15, 'free', E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Yahuah gave *no man licence to sin* (Sirach 15:20); sin is born of a man''s own conceived lust, not of any divine warrant.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-fear-of-yahuah-obtains-wisdom',
       E'The fear of Yahuah, the knowledge of the law, obtains wisdom',
       E'Ben Sira opens the chapter binding wisdom to Torah: *He that fears Yahuah (God) will do good, and he that has the knowledge of the law shall obtain her* (Ecclesiasticus 15:1). Wisdom is not abstract — she comes to the law-keeper as a nursing mother: *And as a mother shall she meet him, and receive him as a wife married of a virgin* (Ecclesiasticus 15:2), feeding him *the bread of understanding* and *the water of wisdom* (Ecclesiasticus 15:3). This is the proverb''s own doctrine: *The fear of Yahuah (LORD) is the beginning of knowledge* (Proverbs 1:7) and *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). Whoso fears Yahuah is *stayed upon her, and shall not be moved* (Ecclesiasticus 15:4) — *Happy is the man that findeth wisdom, and the man that getteth understanding* (Proverbs 3:13). And the door stands open to the one who simply asks: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). It ain''t new — the same wisdom-out-of-Torah witness.',
       sv.verse_id, ev.verse_id, 'extras', 58650
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-wisdom-far-from-pride-and-sinners',
       E'Wisdom is far from pride; praise unseemly in a sinner''s mouth',
       E'The flip side of the fear of Yahuah: *But foolish men shall not attain to her, and sinners shall not see her* (Ecclesiasticus 15:7), *For she is far from pride, and men that are liars cannot remember her* (Ecclesiasticus 15:8). Wisdom and pride cannot share a house — and pride is the very root the next chapters call the beginning of sin. The proverb seals it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18), and *Only by pride cometh contention: but with the well advised is wisdom* (Proverbs 13:10). Ben Sira adds that worship itself is hollow from an unclean mouth: *Praise is not seemly in the mouth of a sinner, for it was not sent him of Yahuah (God)* (Ecclesiasticus 15:9) — the heart, not the lip, is the offering Yahuah seeks. The Messiah says the same of the Isaiah-quoted hypocrites: *This people draweth nigh unto me with their mouth, and honoureth me with their lips; but their heart is far from me* (Matthew 15:8). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58653
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-say-not-yahuah-made-me-fall',
       E'Say not, it is through Yahuah that I fell away',
       E'Here is the heart of the chapter — the ★ no-author-of-evil verse: *Say not you, It is through Yahuah (God) that I fell away: for you oughtest not to do the things that he hates* (Ecclesiasticus 15:11), *Say not you, He has caused me to err: for he has no need of the sinful man* (Ecclesiasticus 15:12). Ben Sira slams the door on every excuse that lays sin at the Creator''s feet. James, Sirach''s closest NT sibling, repeats it almost verbatim: *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man* (James 1:13) — *But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14). Wisdom of Solomon confirms it from the other restored shelf: *For Yahuah (God) made not death: neither has he pleasure in the destruction of the living* (Wisdom of Solomon 1:13). Yahuah *hates all abomination* (Ecclesiasticus 15:13) — he is no tempter, no cause of the fall. It ain''t new: the same anti-fatalism, the same clean Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 58656
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-the-freedom-of-the-will',
       E'He left man in the hand of his counsel — before man is life and death',
       E'The grand free-will declaration: *He himself made man from the beginning, and left him in the hand of his counsel* (Ecclesiasticus 15:14); *He has set fire and water before you: stretch forth your hand to whether you will* (Ecclesiasticus 15:16); *Before man is life and death; and whether him liketh shall be given him* (Ecclesiasticus 15:17). This is Moses'' choose-life charge made a doctrine: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), and *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). It is Yahuah''s word to Cain before the first murder: *if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). It is Joshua''s altar-call: *choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD)* (Joshua 24:15). Ben Sira''s ''if you will, to keep the commandments'' (Sirach 15:15) — the Torah set before the will, life and death in the hand. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58659
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin',
       E'The all-seeing Elohim: he commanded no man to do wickedly',
       E'Ben Sira closes by grounding the freedom of the will in the omniscience of the Judge: *For the wisdom of Yahuah (God) is great, and he is mighty in power, and beholds all things* (Ecclesiasticus 15:18); *And his eyes are upon them that fear him, and he knoweth every work of man* (Ecclesiasticus 15:19). The all-seeing Yahuah is David''s confession: *O Yahuah (LORD), thou hast searched me, and known me. Thou knowest my downsitting and mine uprising, thou understandest my thought afar off* (Psalms 139:1-2). Because he sees every work, he judges every work: *Who will render to every man according to his deeds* (Romans 2:6). And the final word slams every excuse shut forever: *He has commanded no man to do wickedly, neither has he given any man licence to sin* (Ecclesiasticus 15:20) — there is no decree of Yahuah that authors a single sin. *His eyes are in every place, beholding the evil and the good* (Proverbs 15:3). It ain''t new: the seeing Elohim, the righteous render, the clean command.',
       sv.verse_id, ev.verse_id, 'extras', 58662
  FROM _session253_sir15_lookup sv, _session253_sir15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=15 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-15-fear-of-yahuah-obtains-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Ben Sira''s opening — he that fears Yahuah and knows the law obtains wisdom — is Solomon''s own first principle (Sirach 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear of Yahuah that ''will do good'' and obtains wisdom in Sirach 15:1 is the very beginning of wisdom in Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 2:5 — *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God).* Knowledge of the law in Sirach 15:1 yields the fear of Yahuah and the knowledge of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 3:13 — *Happy is the man that findeth wisdom, and the man that getteth understanding.* The man fed *the bread of understanding* in Sirach 15:3 is the happy man who finds wisdom in Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* Sirach''s nursing-mother wisdom who feeds the seeker (Sirach 15:3) is James''s wisdom freely given to whoever asks — Sirach''s closest NT sibling.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-fear-of-yahuah-obtains-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-wisdom-far-from-pride-and-sinners
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Wisdom is *far from pride* in Sirach 15:8 because pride is the very road to ruin Proverbs charts.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-wisdom-far-from-pride-and-sinners'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 13:10 — *Only by pride cometh contention: but with the well advised is wisdom.* That the proud and the liars cannot remember her (Sirach 15:8) is Solomon''s pairing of pride against wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-wisdom-far-from-pride-and-sinners'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 15:8 — *This people draweth nigh unto me with their mouth, and honoureth me with their lips; but their heart is far from me.* Praise unseemly in a sinner''s mouth (Sirach 15:9) is the lip-honour without the heart that the Messiah rebukes.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-wisdom-far-from-pride-and-sinners'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-say-not-yahuah-made-me-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man.* James''s ''let no man say'' is Ben Sira''s ''Say not... it is through Yahuah that I fell away'' (Sirach 15:11) — almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Against Sirach''s ''He has caused me to err'' (Sirach 15:12), James names the true cause: a man''s own lust, not Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 1:13 — *For Yahuah (God) made not death: neither has he pleasure in the destruction of the living.* The companion wisdom book on the same restored shelf seals Sirach 15:11 — Yahuah is no author of the fall or of death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 5:4 — *For thou art not a Elohim (God) that hath pleasure in wickedness: neither shall evil dwell with thee.* Yahuah *hates all abomination* in Sirach 15:13 because no evil can dwell with him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-say-not-yahuah-made-me-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-the-freedom-of-the-will
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Sirach''s ''Before man is life and death'' (Sirach 15:17) is Moses'' charge set before Israel verbatim in theme.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* ''whether him liketh shall be given him'' (Sirach 15:17) is Moses'' ''therefore choose life'' — the will set free to choose.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* Man left *in the hand of his counsel* (Sirach 15:14) is Cain told he can yet rule over sin — the will is his.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:15 — *And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD).* ''stretch forth your hand to whether you will'' (Sirach 15:16) is Joshua''s ''choose you this day'' — fire and water before the will.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 11:26 — *Behold, I set before you this day a blessing and a curse.* ''If you will, to keep the commandments'' (Sirach 15:15) is the blessing-and-curse Moses sets before the keeper of the law.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-the-freedom-of-the-will'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 139:1 — *O Yahuah (LORD), thou hast searched me, and known me.* The Yahuah who *beholds all things* (Sirach 15:18) is David''s God who has searched and known him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* Sirach''s all-beholding Yahuah (Sirach 15:18) is the proverb''s eyes-in-every-place.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:6 — *Who will render to every man according to his deeds.* Because Yahuah *knoweth every work of man* (Sirach 15:19), Paul says he renders to every man by those works.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Yahuah gave *no man licence to sin* (Sirach 15:20); sin is born of a man''s own conceived lust, not of any divine warrant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir15_lookup sv, _session253_sir15_lookup tv
 WHERE t.slug='ecclesiasticus-15-all-seeing-elohim-no-licence-to-sin'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=15 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_16.sql (session253 ecclesiasticus 16) -----
-- Source anchor: apocrypha/ecclesiasticus ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir16 (view _session253_sir16_lookup). Sort band base 58675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-16-judgments-of-old
  ('apocrypha', 'ecclesiasticus', 16, 7, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* These are the old giants Sirach 16:7 says Yahuah was not pacified toward.'),
  ('apocrypha', 'ecclesiasticus', 16, 8, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* this is the place where Lot sojourned, abhorred for its pride in Sirach 16:8.'),
  ('apocrypha', 'ecclesiasticus', 16, 10, 'canon', 'numbers', 16, 32, 'free', E'Numbers 16:32 — *And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* The hard-hearted multitude of Sirach 16:10 that perished in the wilderness rebellion.'),
  ('apocrypha', 'ecclesiasticus', 16, 7, 'enoch', '1-enoch', 7, 2, 'extras', E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the now-live Watchers account naming the very old giants whose foolish strength Sirach 16:7 invokes.'),
  ('apocrypha', 'ecclesiasticus', 16, 6, 'canon', 'deuteronomy', 32, 7, 'free', E'Deuteronomy 32:7 — *Remember the days of old, consider the years of many generations: ask thy father, and he will shew thee; thy elders, and they will tell thee.* The Mosaic charge to recall the old judgments that Sirach 16:6 puts to use against the ungodly congregation.'),
  -- thread: sirach-16-old-giants-watchers
  ('apocrypha', 'ecclesiasticus', 16, 7, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The canonical root of Sirach 16:7''s old giants.'),
  ('apocrypha', 'ecclesiasticus', 16, 7, 'enoch', '1-enoch', 7, 2, 'extras', E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Watchers narrative supplying the begetting of the giants Sirach 16:7 names.'),
  ('apocrypha', 'ecclesiasticus', 16, 7, 'enoch', '1-enoch', 10, 15, 'extras', E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The decree of judgment behind Sirach 16:7''s giants who fell away unpacified.'),
  -- thread: sirach-16-none-can-hide
  ('apocrypha', 'ecclesiasticus', 16, 17, 'canon', 'psalms', 139, 7, 'free', E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David''s question is exactly the conceit Sirach 16:17 forbids — there is no hiding from Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 16, 17, 'canon', 'psalms', 139, 11, 'free', E'Psalm 139:11 — *If I say, Surely the darkness shall cover me; even the night shall be light about me.* No darkness conceals the man who imagines himself forgotten in Sirach 16:17.'),
  ('apocrypha', 'ecclesiasticus', 16, 17, 'canon', 'romans', 1, 20, 'free', E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* the creation that makes Sirach 16:17''s hiding impossible and leaves none excused.'),
  ('apocrypha', 'ecclesiasticus', 16, 17, 'apocrypha', 'the-wisdom-of-solomon', 12, 12, 'extras', E'Wisdom of Solomon 12:12 — *For who shall say, What have you done? or who shall withstand your judgment? or who shall accuse you for the nations that perish, whom you made? or who shall come to stand against you, to be revenged for the unrighteous men?* The live wisdom sibling pressing the same inescapable judgment Sirach 16:17 sets before the hidden soul.'),
  -- thread: sirach-16-pharaoh-hardened-power-known
  ('apocrypha', 'ecclesiasticus', 16, 15, 'canon', 'exodus', 9, 16, 'free', E'Exodus 9:16 — *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth.* The Torah purpose behind Sirach 16:15''s hardening of Pharaoh that his works be known.'),
  ('apocrypha', 'ecclesiasticus', 16, 15, 'canon', 'romans', 9, 17, 'free', E'Romans 9:17 — *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* Paul quoting the same purpose Sirach 16:15 reads in the hardening of Pharaoh.'),
  ('apocrypha', 'ecclesiasticus', 16, 15, 'canon', 'romans', 9, 18, 'free', E'Romans 9:18 — *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.* Paul''s conclusion matching Sirach 16:15''s claim that Yahuah hardened Pharaoh to make his power known.'),
  -- thread: sirach-16-every-man-according-to-his-works
  ('apocrypha', 'ecclesiasticus', 16, 14, 'canon', 'galatians', 6, 7, 'free', E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Paul''s sowing-and-reaping matches Sirach 16:14: every man finds according to his works.'),
  ('apocrypha', 'ecclesiasticus', 16, 12, 'canon', 'matthew', 16, 27, 'free', E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* Yahusha names the same judgment-by-works that Sirach 16:12 ascribes to Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 16, 14, 'canon', 'revelation', 22, 12, 'free', E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The returning King rewards as Sirach 16:14 promises: every man according to his works.'),
  -- thread: sirach-16-pride-and-the-desolate-kindred
  ('apocrypha', 'ecclesiasticus', 16, 8, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Solomon''s law of pride is precisely why Sodom was abhorred for its pride in Sirach 16:8.'),
  ('apocrypha', 'ecclesiasticus', 16, 8, 'apocrypha', 'ecclesiasticus', 10, 13, 'extras', E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira''s own diagnosis self-linking pride=the-beginning-of-sin to the proud abhorred in Sirach 16:8.'),
  ('apocrypha', 'ecclesiasticus', 16, 4, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The ancient ordering of peoples whose proud breakers, like the wicked kindred of Sirach 16:4, become desolate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-judgments-of-old',
       E'The judgments of old — giants, Sodom, the wilderness',
       E'Ben Sira rehearses the great judgments to warn the proud: *He was not pacified toward the old giants, who fell away in the strength of their foolishness. Neither spared he the place where Lot sojourned, but abhorred them for their pride. He pitied not the people of perdition, who were taken away in their sins: Nor the six hundred thousand footmen, who were gathered together in the hardness of their hearts.* (Ecclesiasticus 16:7-10). It ain''t new — every clause is a Torah memorial. The giants are the antediluvian *mighty men which were of old, men of renown* (Genesis 6:4); the place where Lot sojourned is where *Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire* (Genesis 19:24); the hard-hearted footmen are the carcasses that *fell away* in the wilderness when *the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah* (Numbers 16:32). The whole catalog is Moses'' own charge to *Remember the days of old, consider the years of many generations* (Deuteronomy 32:7) — the wisdom teacher simply reads the covenant history back as warning.',
       sv.verse_id, ev.verse_id, 'extras', 58675
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-old-giants-watchers',
       E'The old giants who fell away — the Watchers self-link',
       E'The hinge of the chapter''s first judgment is a single line: *He was not pacified toward the old giants, who fell away in the strength of their foolishness* (Ecclesiasticus 16:7). Ben Sira assumes the reader knows the whole story — and the restored library now holds it intact. The giants are Genesis'' *mighty men which were of old, men of renown* (Genesis 6:4), born when *they bare great giants, whose height was three thousand ells* (1 Enoch 7:2), and judged when Yahuah commanded *destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind* (1 Enoch 10:15). The wisdom book, Genesis, and the live Book of the Watchers are one witness: the giants fell away by their own foolish strength, and the Judge was not pacified.',
       sv.verse_id, ev.verse_id, 'extras', 58678
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-none-can-hide',
       E'Say not I will hide myself — the all-seeing Elohim',
       E'Against the soul that thinks itself lost in the crowd, Ben Sira answers: *Say not you, I will hide myself from Yahuah (God): shall any remember me from above? I shall not be remembered among so many people: for what is my soul among such an infinite number of creatures?* (Ecclesiasticus 16:17). It is David''s psalm in prose: *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7), and *If I say, Surely the darkness shall cover me; even the night shall be light about me* (Psalm 139:11). The works of creation themselves leave no man a hiding place, *for the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse* (Romans 1:20). Wisdom of Solomon, the live sibling book, presses the same plea: *who shall withstand your judgment?* (Wisdom of Solomon 12:12).',
       sv.verse_id, ev.verse_id, 'extras', 58681
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-pharaoh-hardened-power-known',
       E'Yahuah hardened Pharaoh, that his power be known',
       E'Among the works of judgment Ben Sira numbers the exodus: *Yahuah (God) hardened Pharaoh, that he should not know him, that his powerful works might be known to the world* (Ecclesiasticus 16:15). This is the Torah''s own stated purpose — *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth* (Exodus 9:16) — and Paul cites the very verse: *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth* (Romans 9:17), concluding *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth* (Romans 9:18). The wisdom teacher, Moses, and the apostle agree: the hardening served the revealing of Yahuah''s power to the world.',
       sv.verse_id, ev.verse_id, 'extras', 58684
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-every-man-according-to-his-works',
       E'He judges a man according to his works',
       E'Ben Sira sets the just scale at the center of the chapter: *As his mercy is great, so is his correction also: he judges a man according to his works* (Ecclesiasticus 16:12), and *Make way for every work of mercy: for every man shall find according to his works* (Ecclesiasticus 16:14). It ain''t new — it is the Torah-ethic the apostles carry whole. *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7); the Son of Adam *shall reward every man according to his works* (Matthew 16:27); and the returning King declares *my reward is with me, to give every man according as his work shall be* (Revelation 22:12). The wisdom of Sirach and the gospel speak one verdict.',
       sv.verse_id, ev.verse_id, 'extras', 58687
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-16-pride-and-the-desolate-kindred',
       E'Abhorred for their pride — the desolate kindred',
       E'The judgment-list turns on a single sin: the cities of the plain were *abhorred... for their pride* (Ecclesiasticus 16:8), even as the wicked household is the one whose *kindred... shall speedily become desolate* (Ecclesiasticus 16:4). Solomon''s proverb names the law of it: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). Sirach itself elsewhere teaches the same root — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly* (Ecclesiasticus 10:13) — the self-link binding chapter 10''s diagnosis to chapter 16''s case-law. And the bounds of nations were set from of old, *when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8): the proud who break those bounds become desolate.',
       sv.verse_id, ev.verse_id, 'extras', 58690
  FROM _session253_sir16_lookup sv, _session253_sir16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-16-judgments-of-old
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* These are the old giants Sirach 16:7 says Yahuah was not pacified toward.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* this is the place where Lot sojourned, abhorred for its pride in Sirach 16:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 16:32 — *And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* The hard-hearted multitude of Sirach 16:10 that perished in the wilderness rebellion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the now-live Watchers account naming the very old giants whose foolish strength Sirach 16:7 invokes.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 32:7 — *Remember the days of old, consider the years of many generations: ask thy father, and he will shew thee; thy elders, and they will tell thee.* The Mosaic charge to recall the old judgments that Sirach 16:6 puts to use against the ungodly congregation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-judgments-of-old'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-old-giants-watchers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The canonical root of Sirach 16:7''s old giants.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-old-giants-watchers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Watchers narrative supplying the begetting of the giants Sirach 16:7 names.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-old-giants-watchers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The decree of judgment behind Sirach 16:7''s giants who fell away unpacified.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-old-giants-watchers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-none-can-hide
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David''s question is exactly the conceit Sirach 16:17 forbids — there is no hiding from Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:11 — *If I say, Surely the darkness shall cover me; even the night shall be light about me.* No darkness conceals the man who imagines himself forgotten in Sirach 16:17.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:20 — *For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead; so that they are without excuse:* the creation that makes Sirach 16:17''s hiding impossible and leaves none excused.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 12:12 — *For who shall say, What have you done? or who shall withstand your judgment? or who shall accuse you for the nations that perish, whom you made? or who shall come to stand against you, to be revenged for the unrighteous men?* The live wisdom sibling pressing the same inescapable judgment Sirach 16:17 sets before the hidden soul.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-none-can-hide'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-pharaoh-hardened-power-known
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 9:16 — *And in very deed for this cause have I raised thee up, for to shew in thee my power; and that my name may be declared throughout all the earth.* The Torah purpose behind Sirach 16:15''s hardening of Pharaoh that his works be known.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pharaoh-hardened-power-known'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:17 — *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* Paul quoting the same purpose Sirach 16:15 reads in the hardening of Pharaoh.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pharaoh-hardened-power-known'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:18 — *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.* Paul''s conclusion matching Sirach 16:15''s claim that Yahuah hardened Pharaoh to make his power known.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pharaoh-hardened-power-known'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-every-man-according-to-his-works
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Paul''s sowing-and-reaping matches Sirach 16:14: every man finds according to his works.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-every-man-according-to-his-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* Yahusha names the same judgment-by-works that Sirach 16:12 ascribes to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-every-man-according-to-his-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The returning King rewards as Sirach 16:14 promises: every man according to his works.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-every-man-according-to-his-works'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-16-pride-and-the-desolate-kindred
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* Solomon''s law of pride is precisely why Sodom was abhorred for its pride in Sirach 16:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pride-and-the-desolate-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 10:13 — *For pride is the beginning of sin, and he that has it shall pour out abomination: and therefore Yahuah (God) brought upon them strange calamities, and overthrew them utterly.* Ben Sira''s own diagnosis self-linking pride=the-beginning-of-sin to the proud abhorred in Sirach 16:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pride-and-the-desolate-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The ancient ordering of peoples whose proud breakers, like the wicked kindred of Sirach 16:4, become desolate.'
  FROM cross_reference_threads t, cross_references x, _session253_sir16_lookup sv, _session253_sir16_lookup tv
 WHERE t.slug='sirach-16-pride-and-the-desolate-kindred'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_17.sql (session253 ecclesiasticus 17) -----
-- Source anchor: apocrypha/ecclesiasticus ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir17 (view _session253_sir17_lookup). Sort band base 58700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-17-man-in-the-image
  ('apocrypha', 'ecclesiasticus', 17, 3, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Sirach 17:3-4 names the very image-and-dominion grant of the sixth day.'),
  ('apocrypha', 'ecclesiasticus', 17, 1, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Sirach 17:1 ''created man of the earth, and turned him into it again'' is Genesis 2:7 read with Genesis 3:19.'),
  ('apocrypha', 'ecclesiasticus', 17, 4, 'canon', 'genesis', 9, 2, 'free', E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Sirach 17:4 ''put the fear of man upon all flesh'' is the Noahic dominion-grant verbatim.'),
  ('apocrypha', 'ecclesiasticus', 17, 4, 'canon', 'psalms', 8, 6, 'free', E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* the dominion Sirach 17:4 gives over beasts and fowls is the dominion David sings.'),
  ('apocrypha', 'ecclesiasticus', 17, 3, 'canon', 'psalms', 8, 5, 'free', E'Psalms 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The man made ''according to his image'' (Sirach 17:3) is the man crowned with glory and honour.'),
  -- thread: ecclesiasticus-17-the-law-of-life-everlasting-covenant
  ('apocrypha', 'ecclesiasticus', 17, 12, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the ''everlasting covenant'' of Sirach 17:12 is the Sinai covenant offered to Israel.'),
  ('apocrypha', 'ecclesiasticus', 17, 12, 'canon', 'exodus', 24, 8, 'free', E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The covenant Sirach 17:12 calls everlasting is the blood-ratified covenant of Sinai.'),
  ('apocrypha', 'ecclesiasticus', 17, 11, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the ''law of life'' of Sirach 17:11 is Moses'' choose-life Torah.'),
  ('apocrypha', 'ecclesiasticus', 17, 12, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The everlasting covenant of Sirach 17:12 is the law written on the heart — same Torah, kept inwardly.'),
  ('apocrypha', 'ecclesiasticus', 17, 11, 'apocrypha', 'ecclesiasticus', 24, 23, 'extras', E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown-chapter identifies the ''law of life for an heritage'' (Sirach 17:11) as the Torah and the book of the covenant.'),
  -- thread: ecclesiasticus-17-law-written-in-the-heart
  ('apocrypha', 'ecclesiasticus', 17, 7, 'canon', 'romans', 2, 14, 'free', E'Romans 2:14 — *For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves:* the heart ''shewed... good and evil'' in Sirach 17:7 is Paul''s law written in the conscience.'),
  ('apocrypha', 'ecclesiasticus', 17, 11, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'extras', E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch names the ''law of life for an heritage'' (Sirach 17:11) the enduring commandment by which one lives.'),
  ('apocrypha', 'ecclesiasticus', 17, 6, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the heart and counsel given to understand good and evil (Sirach 17:6) equip man for Moses'' life-and-death choice.'),
  -- thread: ecclesiasticus-17-israel-the-portion-bounds-of-nations
  ('apocrypha', 'ecclesiasticus', 17, 17, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Sirach 17:17''s division of the nations with Israel kept apart is the Song of Moses verbatim.'),
  ('apocrypha', 'ecclesiasticus', 17, 17, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* ''Israel is the portion of Yahuah'' (Sirach 17:17) repeats Moses'' word for word.'),
  ('apocrypha', 'ecclesiasticus', 17, 17, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same set bounds of the nations Sirach 17:17 names.'),
  -- thread: ecclesiasticus-17-all-works-before-him-recompense
  ('apocrypha', 'ecclesiasticus', 17, 15, 'canon', 'hebrews', 4, 13, 'free', E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Sirach 17:15 ''their ways... shall not be hid from his eyes'' is the same all-seeing scrutiny.'),
  ('apocrypha', 'ecclesiasticus', 17, 23, 'canon', 'matthew', 16, 27, 'free', E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The Messiah''s coming recompense matches Sirach 17:23, ''render their recompence upon their heads.'''),
  ('apocrypha', 'ecclesiasticus', 17, 23, 'canon', 'revelation', 22, 12, 'free', E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The reward rendered upon every head in Sirach 17:23 is the reward carried at the Coming.'),
  -- thread: ecclesiasticus-17-call-to-repentance-turn-and-live
  ('apocrypha', 'ecclesiasticus', 17, 26, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* Sirach 17:26 ''turn away from iniquity'' is Ezekiel''s turn-and-be-saved call.'),
  ('apocrypha', 'ecclesiasticus', 17, 24, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The mercy granting return in Sirach 17:24 is Yahuah''s no-pleasure-in-death heart.'),
  ('apocrypha', 'ecclesiasticus', 17, 29, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The great lovingkindness toward those that turn (Sirach 17:29) is Peter''s longsuffering unto repentance.'),
  ('apocrypha', 'ecclesiasticus', 17, 25, 'canon', 'james', 4, 8, 'free', E'James 4:8 — *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* ''Make your prayer before his face, and offend less'' (Sirach 17:25) is James'' draw-nigh-and-cleanse summons.'),
  ('apocrypha', 'ecclesiasticus', 17, 24, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The return granted to them that repent (Sirach 17:24) is the heaven-joy over one sinner turning.'),
  -- thread: ecclesiasticus-17-no-praise-in-the-grave
  ('apocrypha', 'ecclesiasticus', 17, 27, 'canon', 'psalms', 6, 5, 'free', E'Psalms 6:5 — *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* Sirach 17:27 ''who shall praise the Most High in the grave'' is David''s question word for word.'),
  ('apocrypha', 'ecclesiasticus', 17, 28, 'canon', 'psalms', 115, 17, 'free', E'Psalms 115:17 — *The dead praise not Yahuah (LORD), neither any that go down into silence.* Sirach 17:28 ''thanksgiving perishes from the dead'' is the same silence of the grave.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-man-in-the-image',
       E'Man created of the earth, made after his image, given dominion',
       E'Ben Sira opens with the making of Adam — *Yahuah (God) created man of the earth, and turned him into it again* (Ecclesiasticus 17:1), *and made them according to his image* (Ecclesiasticus 17:3), and *put the fear of man upon all flesh, and gave him dominion over beasts and fowls* (Ecclesiasticus 17:4). It ain''t new: he is retelling Genesis. *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air* (Genesis 1:26); *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). The fear set upon the beasts is the Noahic grant — *And the fear of you and the dread of you shall be upon every beast of the earth* (Genesis 9:2), *Every moving thing that liveth shall be meat for you* (Genesis 9:3). And the crown of dominion is sung in Psalm 8: *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour* (Psalms 8:5); *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet* (Psalms 8:6).',
       sv.verse_id, ev.verse_id, 'extras', 58700
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-the-law-of-life-everlasting-covenant',
       E'The law of life for an heritage, the everlasting covenant',
       E'The heart of the chapter: *Beside this he gave them knowledge, and the law of life for an heritage* (Ecclesiasticus 17:11); *He made an everlasting covenant with them, and shewed them his judgments* (Ecclesiasticus 17:12); *Their eyes saw the majesty of his glory, and their ears heard his glorious voice* (Ecclesiasticus 17:13). This is Sinai — the law given as life, not as curse. *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5); the covenant ratified in blood, *Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). Moses set the same choice Ben Sira sets: *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). And the everlasting covenant is the law written within — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33). Ben Sira''s own crown-chapter names it plainly: the law that endureth IS Wisdom — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23).',
       sv.verse_id, ev.verse_id, 'extras', 58703
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-law-written-in-the-heart',
       E'Counsel, a heart to understand, good and evil shewn — the law in the heart',
       E'Before Sinai''s tablets, Yahuah wrote on the man himself: *Counsel, and a tongue, and eyes, ears, and a heart, gave he them to understand* (Ecclesiasticus 17:6); *Withal he filled them with the knowledge of understanding, and shewed them good and evil* (Ecclesiasticus 17:7). The faculty to know good and evil and the heart that discerns is the law written within — exactly Paul''s argument: *For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves* (Romans 2:14). This is why even the heathen are without excuse — the law of life (Sirach 17:11) is first inscribed in the conscience. Ben Sira''s Wisdom-chapter and Baruch both seal it: Wisdom is the enduring law — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1).',
       sv.verse_id, ev.verse_id, 'extras', 58706
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-israel-the-portion-bounds-of-nations',
       E'Israel the portion of Yahuah, the bounds of the nations set',
       E'*For in the division of the nations of the whole earth he set a ruler over every people; but Yashar''el (Israel) is the portion of Yahuah (God)* (Ecclesiasticus 17:17). It ain''t new — this is the Song of Moses: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8); *For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9). Paul preaches the same allotment on Mars'' Hill — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The nations get rulers; Israel is kept as Yahuah''s own portion. Election stands.',
       sv.verse_id, ev.verse_id, 'extras', 58709
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-all-works-before-him-recompense',
       E'Their ways ever before him; he renders recompence upon their heads',
       E'Nothing is hidden, and every work is repaid: *Their ways are ever before him, and shall not be hid from his eyes* (Ecclesiasticus 17:15); *Therefore all their works are as the sun before him, and his eyes are continually upon their ways* (Ecclesiasticus 17:19); *Afterwards he will rise up and reward them, and render their recompence upon their heads* (Ecclesiasticus 17:23). The all-seeing eye is Hebrews'' word — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). And the recompense is the Messiah''s own promise: *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works* (Matthew 16:27); *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be* (Revelation 22:12).',
       sv.verse_id, ev.verse_id, 'extras', 58712
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-call-to-repentance-turn-and-live',
       E'Return to Yahuah, forsake your sins, turn and live',
       E'The chapter turns to the altar call: *But to them that repent, he granted them return, and comforted those that failed in patience* (Ecclesiasticus 17:24); *Return to Yahuah (God), and forsake your sins, make your prayer before his face, and offend less* (Ecclesiasticus 17:25); *Turn again to the Most High, and turn away from iniquity* (Ecclesiasticus 17:26); *How great is the lovingkindness of Yahuah (God), our Elohim (God), and his compassion to such as turn to him in holiness!* (Ecclesiasticus 17:29). This is Ezekiel''s plea — *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30); *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye* (Ezekiel 18:32). Peter carries the same patience — *is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9) — James the same nearness — *Draw nigh to Elohim (God), and he will draw nigh to you* (James 4:8) — and heaven the same joy — *joy shall be in heaven over one sinner that repenteth* (Luke 15:7).',
       sv.verse_id, ev.verse_id, 'extras', 58715
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-17-no-praise-in-the-grave',
       E'The dead praise not; the living and sound in heart give thanks',
       E'Ben Sira presses repentance now, for the grave is silent: *Who shall praise the Most High in the grave, instead of them which live and give thanks?* (Ecclesiasticus 17:27); *Thanksgiving perishes from the dead, as from one that is not: the living and sound in heart shall praise Yahuah (God)* (Ecclesiasticus 17:28). This is David''s plea verbatim — *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* (Psalms 6:5); *The dead praise not Yahuah (LORD), neither any that go down into silence* (Psalms 115:17). The urgency is the same: turn while you live, for praise belongs to the living.',
       sv.verse_id, ev.verse_id, 'extras', 58718
  FROM _session253_sir17_lookup sv, _session253_sir17_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=17 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-17-man-in-the-image
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Sirach 17:3-4 names the very image-and-dominion grant of the sixth day.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Sirach 17:1 ''created man of the earth, and turned him into it again'' is Genesis 2:7 read with Genesis 3:19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Sirach 17:4 ''put the fear of man upon all flesh'' is the Noahic dominion-grant verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 8:6 — *Thou madest him to have dominion over the works of thy hands; thou hast put all things under his feet:* the dominion Sirach 17:4 gives over beasts and fowls is the dominion David sings.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalms 8:5 — *For thou hast made him a little lower than the angels, and hast crowned him with glory and honour.* The man made ''according to his image'' (Sirach 17:3) is the man crowned with glory and honour.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-man-in-the-image'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-the-law-of-life-everlasting-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the ''everlasting covenant'' of Sirach 17:12 is the Sinai covenant offered to Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The covenant Sirach 17:12 calls everlasting is the blood-ratified covenant of Sinai.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the ''law of life'' of Sirach 17:11 is Moses'' choose-life Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The everlasting covenant of Sirach 17:12 is the law written on the heart — same Torah, kept inwardly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown-chapter identifies the ''law of life for an heritage'' (Sirach 17:11) as the Torah and the book of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-the-law-of-life-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-law-written-in-the-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 2:14 — *For when the Gentiles, which have not the law, do by nature the things contained in the law, these, having not the law, are a law unto themselves:* the heart ''shewed... good and evil'' in Sirach 17:7 is Paul''s law written in the conscience.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-law-written-in-the-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch names the ''law of life for an heritage'' (Sirach 17:11) the enduring commandment by which one lives.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-law-written-in-the-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the heart and counsel given to understand good and evil (Sirach 17:6) equip man for Moses'' life-and-death choice.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-law-written-in-the-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-israel-the-portion-bounds-of-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Sirach 17:17''s division of the nations with Israel kept apart is the Song of Moses verbatim.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-israel-the-portion-bounds-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* ''Israel is the portion of Yahuah'' (Sirach 17:17) repeats Moses'' word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-israel-the-portion-bounds-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same set bounds of the nations Sirach 17:17 names.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-israel-the-portion-bounds-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-all-works-before-him-recompense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Sirach 17:15 ''their ways... shall not be hid from his eyes'' is the same all-seeing scrutiny.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-all-works-before-him-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 16:27 — *For the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works.* The Messiah''s coming recompense matches Sirach 17:23, ''render their recompence upon their heads.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-all-works-before-him-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:12 — *And, behold, I come quickly; and my reward is with me, to give every man according as his work shall be.* The reward rendered upon every head in Sirach 17:23 is the reward carried at the Coming.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-all-works-before-him-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-call-to-repentance-turn-and-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* Sirach 17:26 ''turn away from iniquity'' is Ezekiel''s turn-and-be-saved call.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The mercy granting return in Sirach 17:24 is Yahuah''s no-pleasure-in-death heart.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The great lovingkindness toward those that turn (Sirach 17:29) is Peter''s longsuffering unto repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 4:8 — *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded.* ''Make your prayer before his face, and offend less'' (Sirach 17:25) is James'' draw-nigh-and-cleanse summons.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The return granted to them that repent (Sirach 17:24) is the heaven-joy over one sinner turning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-call-to-repentance-turn-and-live'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-17-no-praise-in-the-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 6:5 — *For in death there is no remembrance of thee: in the grave who shall give thee thanks?* Sirach 17:27 ''who shall praise the Most High in the grave'' is David''s question word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-no-praise-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 115:17 — *The dead praise not Yahuah (LORD), neither any that go down into silence.* Sirach 17:28 ''thanksgiving perishes from the dead'' is the same silence of the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_sir17_lookup sv, _session253_sir17_lookup tv
 WHERE t.slug='ecclesiasticus-17-no-praise-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=17 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

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

-- ----- fragment: minion_ecclesiasticus_19.sql (session253 ecclesiasticus 19) -----
-- Source anchor: apocrypha/ecclesiasticus ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir19 (view _session253_sir19_lookup). Sort band base 58750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-19-rule-the-tongue
  ('apocrypha', 'ecclesiasticus', 19, 6, 'canon', 'proverbs', 18, 21, 'free', E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The same weight Sira puts on ruling the tongue, Solomon hangs life and death upon.'),
  ('apocrypha', 'ecclesiasticus', 19, 6, 'canon', 'ecclesiastes', 10, 12, 'free', E'Ecclesiastes 10:12 — *The words of a wise man’s mouth are gracious; but the lips of a fool will swallow up himself.* Babbling devours its own speaker, exactly the ''less evil'' Sira promises the man who hates it.'),
  ('apocrypha', 'ecclesiasticus', 19, 10, 'canon', 'matthew', 12, 36, 'free', E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Why let a word die with you? Because each idle one is answered for — Yeshua raises Sira''s discretion to a day of reckoning.'),
  ('apocrypha', 'ecclesiasticus', 19, 6, 'canon', 'james', 1, 26, 'free', E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man’s religion is vain.* James names the unbridled tongue as Sira does, making rule of the mouth the test of true religion.'),
  -- thread: sirach-19-whisperer-separates-friends
  ('apocrypha', 'ecclesiasticus', 19, 7, 'canon', 'proverbs', 16, 28, 'free', E'Proverbs 16:28 — *A froward man soweth strife: and a whisperer separateth chief friends.* The very harm Sira heads off by ''rehearse not'' — the rehearsed tale that cleaves friend from friend.'),
  ('apocrypha', 'ecclesiasticus', 19, 8, 'canon', 'proverbs', 11, 13, 'free', E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Sira''s ''reveal them not'' is Solomon''s faithful spirit that conceals.'),
  ('apocrypha', 'ecclesiasticus', 19, 8, 'canon', 'leviticus', 19, 16, 'free', E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah-command behind Sira''s counsel not to talk of other men''s lives.'),
  ('apocrypha', 'ecclesiasticus', 19, 9, 'canon', 'ecclesiastes', 10, 20, 'free', E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* As Sira warns ''he heard and observed you,'' Qoheleth warns that even secret speech is carried back.'),
  -- thread: sirach-19-admonish-friend-first
  ('apocrypha', 'ecclesiasticus', 19, 17, 'canon', 'leviticus', 19, 17, 'free', E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The ''law of the Most High'' Sira sends you back to: rebuke the neighbour rather than harbour the grudge.'),
  ('apocrypha', 'ecclesiasticus', 19, 13, 'canon', 'matthew', 18, 15, 'free', E'Matthew 18:15 — *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* Yeshua''s order of reproof is Sira''s ''admonish a friend'' — go to him first, privately.'),
  ('apocrypha', 'ecclesiasticus', 19, 15, 'canon', 'proverbs', 17, 9, 'free', E'Proverbs 17:9 — *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends.* Sira''s ''believe not every tale'' and private admonition is Solomon''s covering, not repeating, of a matter.'),
  -- thread: sirach-19-fear-of-yahuah-doctrine-of-life
  ('apocrypha', 'ecclesiasticus', 19, 18, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sira''s ''first step to be accepted of him'' is Solomon''s ''beginning of knowledge'' — the fear of Yahuah as the door.'),
  ('apocrypha', 'ecclesiasticus', 19, 20, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Word for word the maxim Sira states as ''the fear of Yahuah (God) is all wisdom.'''),
  ('apocrypha', 'ecclesiasticus', 19, 19, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* Sira''s ''doctrine of life'' and ''tree of immortality'' are Moses'' choose-life: keeping the commandments IS choosing life.'),
  ('apocrypha', 'ecclesiasticus', 19, 18, 'apocrypha', 'ecclesiasticus', 1, 14, 'extras', E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Sira''s own prologue self-witnesses the maxim he repeats here in chapter 19.'),
  ('apocrypha', 'ecclesiasticus', 19, 20, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'extras', E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Sira''s ''performance of the law'' as all wisdom is Baruch''s enduring law that brings life to all who keep it.'),
  -- thread: sirach-19-exquisite-subtilty-known-by-fruit
  ('apocrypha', 'ecclesiasticus', 19, 29, 'canon', 'matthew', 7, 16, 'free', E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* Sira''s ''a man may be known by his look'' is Yeshua''s know-them-by-fruits: the inward deceit shows itself outwardly.'),
  ('apocrypha', 'ecclesiasticus', 19, 25, 'canon', 'james', 3, 6, 'free', E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* James names the ''exquisite subtilty that is unjust'' for what it is — the unbridled tongue set on fire of hell, not wisdom.'),
  ('apocrypha', 'ecclesiasticus', 19, 22, 'canon', 'matthew', 12, 34, 'free', E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Sira''s ''knowledge of wickedness is not wisdom'' meets Yeshua''s verdict: the evil heart cannot counterfeit good speech for long.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-rule-the-tongue',
       E'He that can rule his tongue shall live without strife',
       E'Ben Sira sets the bridled tongue at the head of wisdom: *He that can rule his tongue shall live without strife; and he that hates babbling shall have less evil* (Ecclesiasticus 19:6), and *If you have heard a word, let it die with you; and be bold, it will not burst you* (Ecclesiasticus 19:10). It ain''t new — the Tanakh already weighed every word: *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof* (Proverbs 18:21), and *The words of a wise man’s mouth are gracious; but the lips of a fool will swallow up himself* (Ecclesiastes 10:12). The Messiah seals the doctrine: *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36). And James takes up Sira''s very theme of the unbridled mouth: *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man’s religion is vain* (James 1:26). One witness, one tongue, one law.',
       sv.verse_id, ev.verse_id, 'extras', 58750
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-whisperer-separates-friends',
       E'Rehearse not a tale: the whisperer separates chief friends',
       E'Sira warns against carrying speech abroad: *Rehearse not to another that which is told to you, and you shall fare never the worse* (Ecclesiasticus 19:7), *Whether it be to friend or foe, talk not of other men’s lives; and if you can without offence, reveal them not* (Ecclesiasticus 19:8), *For he heard and observed you, and when time comes he will hate you* (Ecclesiasticus 19:9). It ain''t new — the proverb-fathers said the same: *A froward man soweth strife: and a whisperer separateth chief friends* (Proverbs 16:28); *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter* (Proverbs 11:13). And Torah set the wall first: *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD)* (Leviticus 19:16). Even the king is not safe from a carried word: *for a bird of the air shall carry the voice, and that which hath wings shall tell the matter* (Ecclesiastes 10:20). Torah stands; the tongue is governed by it.',
       sv.verse_id, ev.verse_id, 'extras', 58753
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-admonish-friend-first',
       E'Admonish your neighbour before you threaten him',
       E'Sira lays out the discipline of correction before condemnation: *Admonish a friend, it may be he has not done it: and if he have done it, that he do it no more* (Ecclesiasticus 19:13), *Admonish a friend: for many times it is a slander, and believe not every tale* (Ecclesiasticus 19:15), and the hinge — *Admonish your neighbour before you threaten him; and not being angry, give place to the law of the Most High* (Ecclesiasticus 19:17). It ain''t new — Torah commanded exactly this order: *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The Messiah gives the procedure word for word: *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother* (Matthew 18:15). And the proverb names the fruit of the private word: *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends* (Proverbs 17:9). Sira''s ''law of the Most High'' is the same Torah Yeshua administered.',
       sv.verse_id, ev.verse_id, 'extras', 58756
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-fear-of-yahuah-doctrine-of-life',
       E'The commandments of Yahuah are the doctrine of life',
       E'Sira anchors all wisdom in the fear of Yahuah and the keeping of His commandments: *The fear of Yahuah (God) is the first step to be accepted of him, and wisdom obtaineth his love* (Ecclesiasticus 19:18); *The knowledge of the commandments of Yahuah (God) is the doctrine of life: and they that do things that please him shall receive the fruit of the tree of immortality* (Ecclesiasticus 19:19); *The fear of Yahuah (God) is all wisdom; and in all wisdom is the performance of the law, and the knowledge of his omnipotency* (Ecclesiasticus 19:20). It ain''t new — this is the bone of the whole wisdom tradition: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7), *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10). And the commandments as the ''doctrine of life'' is Moses'' own choice set before Israel: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). Sira self-witnesses from his own opening — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb* (Ecclesiasticus 1:14) — and Baruch crowns it: the commandments ARE the law that endureth. The performance of the law IS wisdom; Torah stands.',
       sv.verse_id, ev.verse_id, 'extras', 58759
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-19-exquisite-subtilty-known-by-fruit',
       E'An exquisite subtilty that is unjust — known by his look',
       E'Sira unmasks counterfeit wisdom: *The knowledge of wickedness is not wisdom, neither at any time the counsel of sinners prudence* (Ecclesiasticus 19:22); *There is an exquisite subtilty, and the same is unjust; and there is one that turns aside to make judgment appear; and there is a wise man that justifies in judgment* (Ecclesiasticus 19:25); and the discernment of it — *A man may be known by his look, and one that has understanding by his countenance, when you meetest him* (Ecclesiasticus 19:29). It ain''t new — Yeshua taught the same test for false prophets: *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* (Matthew 7:16), *Wherefore by their fruits ye shall know them* (Matthew 7:20). And James draws the very line Sira draws between true and counterfeit wisdom, naming the unjust subtilty as earthly: *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). And the heart betrays itself through the mouth: *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh* (Matthew 12:34). Crafty subtilty is not wisdom; it is known by its fruit.',
       sv.verse_id, ev.verse_id, 'extras', 58762
  FROM _session253_sir19_lookup sv, _session253_sir19_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=19 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-19-rule-the-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The same weight Sira puts on ruling the tongue, Solomon hangs life and death upon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 10:12 — *The words of a wise man’s mouth are gracious; but the lips of a fool will swallow up himself.* Babbling devours its own speaker, exactly the ''less evil'' Sira promises the man who hates it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* Why let a word die with you? Because each idle one is answered for — Yeshua raises Sira''s discretion to a day of reckoning.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man’s religion is vain.* James names the unbridled tongue as Sira does, making rule of the mouth the test of true religion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-rule-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-whisperer-separates-friends
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 16:28 — *A froward man soweth strife: and a whisperer separateth chief friends.* The very harm Sira heads off by ''rehearse not'' — the rehearsed tale that cleaves friend from friend.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Sira''s ''reveal them not'' is Solomon''s faithful spirit that conceals.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah-command behind Sira''s counsel not to talk of other men''s lives.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 10:20 — *Curse not the king, no not in thy thought; and curse not the rich in thy bedchamber: for a bird of the air shall carry the voice, and that which hath wings shall tell the matter.* As Sira warns ''he heard and observed you,'' Qoheleth warns that even secret speech is carried back.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-whisperer-separates-friends'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-admonish-friend-first
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him.* The ''law of the Most High'' Sira sends you back to: rebuke the neighbour rather than harbour the grudge.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-admonish-friend-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 18:15 — *Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother.* Yeshua''s order of reproof is Sira''s ''admonish a friend'' — go to him first, privately.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-admonish-friend-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 17:9 — *He that covereth a transgression seeketh love; but he that repeateth a matter separateth very friends.* Sira''s ''believe not every tale'' and private admonition is Solomon''s covering, not repeating, of a matter.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-admonish-friend-first'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-fear-of-yahuah-doctrine-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* Sira''s ''first step to be accepted of him'' is Solomon''s ''beginning of knowledge'' — the fear of Yahuah as the door.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* Word for word the maxim Sira states as ''the fear of Yahuah (God) is all wisdom.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* Sira''s ''doctrine of life'' and ''tree of immortality'' are Moses'' choose-life: keeping the commandments IS choosing life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 1:14 — *To fear Yahuah (God) is the beginning of wisdom: and it was created with the faithful in the womb.* Sira''s own prologue self-witnesses the maxim he repeats here in chapter 19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Sira''s ''performance of the law'' as all wisdom is Baruch''s enduring law that brings life to all who keep it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-fear-of-yahuah-doctrine-of-life'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-19-exquisite-subtilty-known-by-fruit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:16 — *Ye shall know them by their fruits. Do men gather grapes of thorns, or figs of thistles?* Sira''s ''a man may be known by his look'' is Yeshua''s know-them-by-fruits: the inward deceit shows itself outwardly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-exquisite-subtilty-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* James names the ''exquisite subtilty that is unjust'' for what it is — the unbridled tongue set on fire of hell, not wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-exquisite-subtilty-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Sira''s ''knowledge of wickedness is not wisdom'' meets Yeshua''s verdict: the evil heart cannot counterfeit good speech for long.'
  FROM cross_reference_threads t, cross_references x, _session253_sir19_lookup sv, _session253_sir19_lookup tv
 WHERE t.slug='sirach-19-exquisite-subtilty-known-by-fruit'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=19 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

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

-- ----- fragment: minion_ecclesiasticus_21.sql (session253 ecclesiasticus 21) -----
-- Source anchor: apocrypha/ecclesiasticus ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir21 (view _session253_sir21_lookup). Sort band base 58800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-21-flee-sin-as-a-serpent
  ('apocrypha', 'ecclesiasticus', 21, 2, 'canon', 'proverbs', 23, 32, 'free', E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* The same serpent-bite figure Ben Sira uses for sin (Ecclesiasticus 21:2).'),
  ('apocrypha', 'ecclesiasticus', 21, 2, 'canon', 'genesis', 4, 7, 'free', E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The crouching sin Ben Sira bids us flee is the very beast the LORD set Cain to master (Ecclesiasticus 21:2).'),
  ('apocrypha', 'ecclesiasticus', 21, 2, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The way to flee the serpent Ben Sira describes (Ecclesiasticus 21:2).'),
  ('apocrypha', 'ecclesiasticus', 21, 1, 'canon', 'proverbs', 9, 6, 'free', E'Proverbs 9:6 — *Forsake the foolish, and live; and go in the way of understanding.* The turn-and-sin-no-more wisdom of Ben Sira''s opening call (Ecclesiasticus 21:1).'),
  -- thread: ecclesiasticus-21-fear-of-the-lord-is-wisdom
  ('apocrypha', 'ecclesiasticus', 21, 11, 'canon', 'proverbs', 9, 10, 'free', E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear-of-Yahuah-is-wisdom refrain Ben Sira makes the crown of law-keeping (Ecclesiasticus 21:11).'),
  ('apocrypha', 'ecclesiasticus', 21, 11, 'canon', 'psalms', 111, 10, 'free', E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* Wisdom bound to doing the commandments, exactly as Ben Sira binds it to keeping the law (Ecclesiasticus 21:11).'),
  ('apocrypha', 'ecclesiasticus', 21, 11, 'canon', 'proverbs', 1, 7, 'free', E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fear-of-Yahuah foundation Ben Sira sets under understanding (Ecclesiasticus 21:11).'),
  ('apocrypha', 'ecclesiasticus', 21, 11, 'apocrypha', 'ecclesiasticus', 24, 23, 'extras', E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown chapter names Wisdom as the Torah of Moses — the very law whose keeping is wisdom in 21:11.'),
  -- thread: ecclesiasticus-21-the-two-ways-pit-of-hell
  ('apocrypha', 'ecclesiasticus', 21, 10, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The two ways Moses set before Yashar''el, which Ben Sira draws as the smooth road to the pit versus the fountain of life (Ecclesiasticus 21:10,13).'),
  ('apocrypha', 'ecclesiasticus', 21, 10, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The way of sinners Ben Sira says ends in the pit of hell (Ecclesiasticus 21:10).'),
  ('apocrypha', 'ecclesiasticus', 21, 10, 'canon', 'proverbs', 15, 24, 'free', E'Proverbs 15:24 — *The way of life is above to the wise, that he may depart from hell beneath.* The wise man''s upward road against the sinner''s pit, the same contrast Ben Sira draws (Ecclesiasticus 21:10).'),
  -- thread: ecclesiasticus-21-heart-of-fools-in-their-mouth
  ('apocrypha', 'ecclesiasticus', 21, 26, 'canon', 'matthew', 12, 34, 'free', E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Yahusha''s word that the mouth pours out the heart, the very turn of Ben Sira''s proverb (Ecclesiasticus 21:26).'),
  ('apocrypha', 'ecclesiasticus', 21, 26, 'canon', 'proverbs', 29, 11, 'free', E'Proverbs 29:11 — *A fool uttereth all his mind: but a wise man keepeth it in till afterwards.* The fool whose heart is all in his mouth, where the wise keeps it in his heart (Ecclesiasticus 21:26).'),
  ('apocrypha', 'ecclesiasticus', 21, 26, 'canon', 'proverbs', 16, 23, 'free', E'Proverbs 16:23 — *The heart of the wise teacheth his mouth, and addeth learning to his lips.* The wise man whose mouth is governed from within his heart, as Ben Sira frames it (Ecclesiasticus 21:26).'),
  ('apocrypha', 'ecclesiasticus', 21, 16, 'canon', 'proverbs', 10, 14, 'free', E'Proverbs 10:14 — *Wise men lay up knowledge: but the mouth of the foolish is near destruction.* The laid-up wisdom against the fool''s burdensome talk Ben Sira contrasts (Ecclesiasticus 21:16).'),
  ('apocrypha', 'ecclesiasticus', 21, 17, 'canon', 'proverbs', 17, 28, 'free', E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The weighed restraint that makes men seek the wise man''s words in the congregation (Ecclesiasticus 21:17).'),
  -- thread: ecclesiasticus-21-the-whisperer-and-the-tongue
  ('apocrypha', 'ecclesiasticus', 21, 28, 'canon', 'leviticus', 19, 16, 'free', E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah command against the very whisperer Ben Sira condemns (Ecclesiasticus 21:28).'),
  ('apocrypha', 'ecclesiasticus', 21, 28, 'canon', 'proverbs', 26, 22, 'free', E'Proverbs 26:22 — *The words of a talebearer are as wounds, and they go down into the innermost parts of the belly.* The whisperer whose words wound, as Ben Sira says he defiles his own soul (Ecclesiasticus 21:28).'),
  ('apocrypha', 'ecclesiasticus', 21, 28, 'canon', 'james', 3, 6, 'free', E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* The defiling fire of the tongue, the same self-defilement Ben Sira warns of (Ecclesiasticus 21:28).'),
  ('apocrypha', 'ecclesiasticus', 21, 25, 'canon', 'proverbs', 11, 13, 'free', E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* The babbling lips against the weighed words of the understanding (Ecclesiasticus 21:25).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-flee-sin-as-a-serpent',
       E'Flee from sin as from a serpent',
       E'Ben Sira opens with the call to turn: *My son, have you sinned? do so no more, but ask pardon for your former sins* (Ecclesiasticus 21:1), and then paints sin as a venomous beast — *Flee from sin as from the face of a serpent: for if you come too near it, it will bite you: the teeth thereof are as the teeth of a lion, slaying the souls of men* (Ecclesiasticus 21:2). It ain''t new: the same serpent-bite warns off the cup of folly in Proverbs — *At the last it biteth like a serpent, and stingeth like an adder* (Proverbs 23:32) — and the figure goes back to the door of the heart where the LORD told Cain *sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). The wound is mortal because *All iniquity is as a two edged sword, the wounds of which cannot be healed* (Ecclesiasticus 21:3); but the way of escape is the way the brother James commands — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you* (James 4:7). Flee the serpent; the LORD set the rule over it from the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 58800
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-fear-of-the-lord-is-wisdom',
       E'Keep the law, fear Yahuah, get wisdom',
       E'The poor man''s prayer is heard above the proud — *A prayer out of a poor man’s mouth reacheth to the ears of Yahuah (God), and his judgment comes speedily* (Ecclesiasticus 21:5) — and the one who *fears Yahuah (God) will repent from his heart* (Ecclesiasticus 21:6). Then Ben Sira gives the whole sum of the matter: *He that keepeth the law of Yahuah (God) getteth the understanding thereof: and the perfection of the fear of Yahuah (God) is wisdom* (Ecclesiasticus 21:11). This is the refrain of all the wisdom books — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding* (Proverbs 9:10); *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7); *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever* (Psalm 111:10). Wisdom is not a feeling but Torah-keeping: it ain''t new, and the law stands.',
       sv.verse_id, ev.verse_id, 'extras', 58803
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-the-two-ways-pit-of-hell',
       E'The two ways: the pit of hell or the way of life',
       E'Ben Sira lays the road of the wicked and the road of the wise side by side. *The way of sinners is made plain with stones, but at the end thereof is the pit of hell* (Ecclesiasticus 21:10), while the wise man''s *counsel is like a pure fountain of life* (Ecclesiasticus 21:13). It ain''t new — this is the two-ways teaching of the Torah and the Psalter: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15); *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalm 1:1); *The way of life is above to the wise, that he may depart from hell beneath* (Proverbs 15:24). The smooth-paved road and the fountain of life are the two ends Moses set before Yashar''el.',
       sv.verse_id, ev.verse_id, 'extras', 58806
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-heart-of-fools-in-their-mouth',
       E'The heart of fools is in their mouth',
       E'Ben Sira''s sharpest proverb turns the inward man inside out: *The heart of fools is in their mouth: but the mouth of the wise is in their heart* (Ecclesiasticus 21:26). The fool blurts all he is; the wise keeps counsel and *grace shall be found in the lips of the wise* (Ecclesiasticus 21:16). It ain''t new: *A fool uttereth all his mind: but a wise man keepeth it in till afterwards* (Proverbs 29:11); *Wise men lay up knowledge: but the mouth of the foolish is near destruction* (Proverbs 10:14); *The heart of the wise teacheth his mouth, and addeth learning to his lips* (Proverbs 16:23). And the Messiah Yahusha sealed the whole figure — the mouth is the heart''s overflow: *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh* (Matthew 12:34). The tongue tells what the heart is.',
       sv.verse_id, ev.verse_id, 'extras', 58809
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-21-the-whisperer-and-the-tongue',
       E'The whisperer defiles his own soul',
       E'The chapter ends on the sin of the tongue: *The lips of talkers will be telling such things as pertain not to them: but the words of such as have understanding are weighed in the balance* (Ecclesiasticus 21:25), and last of all the slanderer — *A whisperer defiles his own soul, and is hated wherever he dwells* (Ecclesiasticus 21:28). It ain''t new: the Torah forbids it outright — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD)* (Leviticus 19:16); the wisdom of the fathers warns *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter* (Proverbs 11:13), and *The words of a talebearer are as wounds, and they go down into the innermost parts of the belly* (Proverbs 26:22). The brother James names the fire of it: *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell* (James 3:6). The whisperer''s poison defiles the whisperer first.',
       sv.verse_id, ev.verse_id, 'extras', 58812
  FROM _session253_sir21_lookup sv, _session253_sir21_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=21 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-21-flee-sin-as-a-serpent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:32 — *At the last it biteth like a serpent, and stingeth like an adder.* The same serpent-bite figure Ben Sira uses for sin (Ecclesiasticus 21:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:7 — *If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The crouching sin Ben Sira bids us flee is the very beast the LORD set Cain to master (Ecclesiasticus 21:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The way to flee the serpent Ben Sira describes (Ecclesiasticus 21:2).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 9:6 — *Forsake the foolish, and live; and go in the way of understanding.* The turn-and-sin-no-more wisdom of Ben Sira''s opening call (Ecclesiasticus 21:1).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-flee-sin-as-a-serpent'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-fear-of-the-lord-is-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 9:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: and the knowledge of the holy is understanding.* The fear-of-Yahuah-is-wisdom refrain Ben Sira makes the crown of law-keeping (Ecclesiasticus 21:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 111:10 — *The fear of Yahuah (LORD) is the beginning of wisdom: a good understanding have all they that do his commandments: his praise endureth for ever.* Wisdom bound to doing the commandments, exactly as Ben Sira binds it to keeping the law (Ecclesiasticus 21:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 1:7 — *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction.* The fear-of-Yahuah foundation Ben Sira sets under understanding (Ecclesiasticus 21:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ben Sira''s own crown chapter names Wisdom as the Torah of Moses — the very law whose keeping is wisdom in 21:11.'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-fear-of-the-lord-is-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-the-two-ways-pit-of-hell
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* The two ways Moses set before Yashar''el, which Ben Sira draws as the smooth road to the pit versus the fountain of life (Ecclesiasticus 21:10,13).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-two-ways-pit-of-hell'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The way of sinners Ben Sira says ends in the pit of hell (Ecclesiasticus 21:10).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-two-ways-pit-of-hell'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 15:24 — *The way of life is above to the wise, that he may depart from hell beneath.* The wise man''s upward road against the sinner''s pit, the same contrast Ben Sira draws (Ecclesiasticus 21:10).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-two-ways-pit-of-hell'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-heart-of-fools-in-their-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:34 — *O generation of vipers, how can ye, being evil, speak good things? for out of the abundance of the heart the mouth speaketh.* Yahusha''s word that the mouth pours out the heart, the very turn of Ben Sira''s proverb (Ecclesiasticus 21:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 29:11 — *A fool uttereth all his mind: but a wise man keepeth it in till afterwards.* The fool whose heart is all in his mouth, where the wise keeps it in his heart (Ecclesiasticus 21:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=29 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:23 — *The heart of the wise teacheth his mouth, and addeth learning to his lips.* The wise man whose mouth is governed from within his heart, as Ben Sira frames it (Ecclesiasticus 21:26).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 10:14 — *Wise men lay up knowledge: but the mouth of the foolish is near destruction.* The laid-up wisdom against the fool''s burdensome talk Ben Sira contrasts (Ecclesiasticus 21:16).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 17:28 — *Even a fool, when he holdeth his peace, is counted wise: and he that shutteth his lips is esteemed a man of understanding.* The weighed restraint that makes men seek the wise man''s words in the congregation (Ecclesiasticus 21:17).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-heart-of-fools-in-their-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-21-the-whisperer-and-the-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:16 — *Thou shalt not go up and down as a talebearer among thy people: neither shalt thou stand against the blood of thy neighbour: I am Yahuah (LORD).* The Torah command against the very whisperer Ben Sira condemns (Ecclesiasticus 21:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 26:22 — *The words of a talebearer are as wounds, and they go down into the innermost parts of the belly.* The whisperer whose words wound, as Ben Sira says he defiles his own soul (Ecclesiasticus 21:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 3:6 — *And the tongue is a fire, a world of iniquity: so is the tongue among our members, that it defileth the whole body, and setteth on fire the course of nature; and it is set on fire of hell.* The defiling fire of the tongue, the same self-defilement Ben Sira warns of (Ecclesiasticus 21:28).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* The babbling lips against the weighed words of the understanding (Ecclesiasticus 21:25).'
  FROM cross_reference_threads t, cross_references x, _session253_sir21_lookup sv, _session253_sir21_lookup tv
 WHERE t.slug='ecclesiasticus-21-the-whisperer-and-the-tongue'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=21 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_22.sql (session253 ecclesiasticus 22) -----
-- Source anchor: apocrypha/ecclesiasticus ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir22 (view _session253_sir22_lookup). Sort band base 58825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-22-the-fool
  ('apocrypha', 'ecclesiasticus', 22, 11, 'canon', 'proverbs', 26, 1, 'free', E'Proverbs 26:1 — *As snow in summer, and as rain in harvest, so honour is not seemly for a fool.* Solomon and Ben Sira agree that the fool is past honour, his life worse than death (Sirach 22:11).'),
  ('apocrypha', 'ecclesiasticus', 22, 13, 'canon', 'proverbs', 26, 11, 'free', E'Proverbs 26:11 — *As a dog returneth to his vomit, so a fool returneth to his folly.* The fool is incorrigible, so Sirach 22:13 counsels: talk not much with him and depart from him.'),
  ('apocrypha', 'ecclesiasticus', 22, 13, 'canon', 'proverbs', 26, 12, 'free', E'Proverbs 26:12 — *Seest thou a man wise in his own conceit? there is more hope of a fool than of him.* The same wisdom that bids Sirach 22:13 beware of the fool measures the deeper folly of self-conceit.'),
  ('apocrypha', 'ecclesiasticus', 22, 15, 'canon', 'proverbs', 27, 3, 'free', E'Proverbs 27:3 — *A stone is heavy, and the sand weighty; but a fool''s wrath is heavier than them both.* The same scales of stone and sand weigh the unbearable fool of Sirach 22:15.'),
  -- thread: ecclesiasticus-22-the-slothful
  ('apocrypha', 'ecclesiasticus', 22, 1, 'canon', 'proverbs', 6, 6, 'free', E'Proverbs 6:6 — *Go to the ant, thou sluggard; consider her ways, and be wise.* The slothful man hissed out as a filthy stone (Sirach 22:1) is sent to the ant to learn diligence.'),
  ('apocrypha', 'ecclesiasticus', 22, 2, 'canon', 'proverbs', 6, 11, 'free', E'Proverbs 6:11 — *So shall thy poverty come as one that travelleth, and thy want as an armed man.* The dunghill-filth of the sluggard in Sirach 22:2 ends in this ambush of want.'),
  ('apocrypha', 'ecclesiasticus', 22, 1, 'canon', 'proverbs', 26, 14, 'free', E'Proverbs 26:14 — *As the door turneth upon his hinges, so doth the slothful upon his bed.* The same disgraced sluggard of Sirach 22:1 turns idly on his bed in Solomon''s proverb.'),
  -- thread: ecclesiasticus-22-the-wounded-friend
  ('apocrypha', 'ecclesiasticus', 22, 20, 'canon', 'proverbs', 27, 6, 'free', E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Where Sirach 22:20 warns that upbraiding breaks friendship, Solomon distinguishes the faithful wound from the treacherous kiss.'),
  ('apocrypha', 'ecclesiasticus', 22, 22, 'canon', 'proverbs', 18, 19, 'free', E'Proverbs 18:19 — *A brother offended is harder to be won than a strong city: and their contentions are like the bars of a castle.* The treacherous wound past which every friend departs (Sirach 22:22) is Solomon''s offended brother, harder to win than a walled city.'),
  ('apocrypha', 'ecclesiasticus', 22, 21, 'canon', 'matthew', 5, 24, 'free', E'Matthew 5:24 — *Leave there thy gift before the altar, and go thy way; first be reconciled to thy brother, and then come and offer thy gift.* The returning to favour Ben Sira urges in Sirach 22:21 the Master sets before the very altar.'),
  ('apocrypha', 'ecclesiasticus', 22, 20, 'apocrypha', 'ecclesiasticus', 6, 14, 'extras', E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* Ben Sira had already named the treasure that the upbraiding of Sirach 22:20 puts at risk.'),
  -- thread: ecclesiasticus-22-watch-the-mouth
  ('apocrypha', 'ecclesiasticus', 22, 27, 'canon', 'psalms', 141, 3, 'free', E'Psalm 141:3 — *Set a watch, O Yahuah (LORD), before my mouth; keep the door of my lips.* Ben Sira''s prayer in Sirach 22:27 is David''s same plea for a guard set over the mouth.'),
  ('apocrypha', 'ecclesiasticus', 22, 27, 'canon', 'james', 3, 5, 'free', E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* The tongue Ben Sira fears will destroy him (Sirach 22:27) is James''s little member that kindles a great fire.'),
  ('apocrypha', 'ecclesiasticus', 22, 27, 'canon', 'james', 3, 8, 'free', E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* Because no man can tame the tongue, Sirach 22:27 prays for a watch and a seal of wisdom from above.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-the-fool',
       E'The fool that wanteth understanding',
       E'Ben Sira draws the fool to the life: *Weep for the dead, for he has lost the light: and weep for the fool, for he wanteth understanding: make little weeping for the dead, for he is at rest: but the life of the fool is worse than death* (Ecclesiasticus 22:11), and *Sand, and salt, and a mass of iron, is easier to bear, than a man without understanding* (Ecclesiasticus 22:15). It ain''t new — this is the whole gallery of Proverbs 26, where honour fits the fool as poorly as snow in summer: *As snow in summer, and as rain in harvest, so honour is not seemly for a fool* (Proverbs 26:1), and the fool cannot be cured of his folly, *As a dog returneth to his vomit, so a fool returneth to his folly* (Proverbs 26:11). Solomon''s counsel to give the fool a wide berth — *there is more hope of a fool than of him* (Proverbs 26:12) — is Ben Sira''s same wisdom: *Talk not much with a fool* (Ecclesiasticus 22:13). The two books speak with one tongue.',
       sv.verse_id, ev.verse_id, 'extras', 58825
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-the-slothful',
       E'The slothful man and the filthy stone',
       E'The chapter opens on the sluggard: *A slothful man is compared to a filthy stone, and every one will hiss him out to his disgrace* (Ecclesiasticus 22:1), and *A slothful man is compared to the filth of a dunghill: every man that takes it up will shake his hand* (Ecclesiasticus 22:2). It ain''t new — Solomon sends the sluggard to the ant: *Go to the ant, thou sluggard; consider her ways, and be wise* (Proverbs 6:6), warning that *Yet a little sleep, a little slumber, a little folding of the hands to sleep* (Proverbs 6:10) ends in ruin: *So shall thy poverty come as one that travelleth, and thy want as an armed man* (Proverbs 6:11). In Proverbs 26 the same sluggard rolls upon his bed and is disgraced — *As the door turneth upon his hinges, so doth the slothful upon his bed* (Proverbs 26:14). The filthy stone of Sirach 22 is the door-hinge sluggard of the canon.',
       sv.verse_id, ev.verse_id, 'extras', 58828
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-the-wounded-friend',
       E'A friend wounded, yet a returning to favour',
       E'Ben Sira measures the breaking and the mending of friendship: *Whoso casteth a stone at the birds frayeth them away: and he that upbraideth his friend breaks friendship* (Ecclesiasticus 22:20); yet *Though you drewest a sword at your friend, yet despair not: for there may be a returning to favour* (Ecclesiasticus 22:21) — *except for upbraiding, or pride, or disclosing of secrets, or a treacherous wound: for for these things every friend will depart* (Ecclesiasticus 22:22). It ain''t new — Solomon honours the open wound of a true friend, *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful* (Proverbs 27:6), and grieves the harder breach: *A brother offended is harder to be won than a strong city* (Proverbs 18:19). The Master folds the same counsel into the altar itself: *first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). And Ben Sira had already weighed the treasure being risked — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure* (Ecclesiasticus 6:14). The returning to favour is the heart of Torah-wisdom, fulfilled at the altar.',
       sv.verse_id, ev.verse_id, 'extras', 58831
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-22-watch-the-mouth',
       E'A watch before my mouth, a seal upon my lips',
       E'The chapter closes with a prayer that crowns the whole tongue-discourse of Sirach 19-23: *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* (Ecclesiasticus 22:27). It ain''t new — this is David''s own evening cry: *Set a watch, O Yahuah (LORD), before my mouth; keep the door of my lips* (Psalm 141:3). And it is the doctrine James unfolds, that the tongue is the untameable fire — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* (James 3:5) — *But the tongue can no man tame; it is an unruly evil, full of deadly poison* (James 3:8). Ben Sira knows what David and James know: only a watch from Yahuah seals the lips that no man can tame. Torah stands, and the bridled tongue is its fruit.',
       sv.verse_id, ev.verse_id, 'extras', 58834
  FROM _session253_sir22_lookup sv, _session253_sir22_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=22 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-22-the-fool
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:1 — *As snow in summer, and as rain in harvest, so honour is not seemly for a fool.* Solomon and Ben Sira agree that the fool is past honour, his life worse than death (Sirach 22:11).'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 26:11 — *As a dog returneth to his vomit, so a fool returneth to his folly.* The fool is incorrigible, so Sirach 22:13 counsels: talk not much with him and depart from him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:12 — *Seest thou a man wise in his own conceit? there is more hope of a fool than of him.* The same wisdom that bids Sirach 22:13 beware of the fool measures the deeper folly of self-conceit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 27:3 — *A stone is heavy, and the sand weighty; but a fool''s wrath is heavier than them both.* The same scales of stone and sand weigh the unbearable fool of Sirach 22:15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-fool'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-22-the-slothful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 6:6 — *Go to the ant, thou sluggard; consider her ways, and be wise.* The slothful man hissed out as a filthy stone (Sirach 22:1) is sent to the ant to learn diligence.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-slothful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 6:11 — *So shall thy poverty come as one that travelleth, and thy want as an armed man.* The dunghill-filth of the sluggard in Sirach 22:2 ends in this ambush of want.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-slothful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:14 — *As the door turneth upon his hinges, so doth the slothful upon his bed.* The same disgraced sluggard of Sirach 22:1 turns idly on his bed in Solomon''s proverb.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-slothful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-22-the-wounded-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* Where Sirach 22:20 warns that upbraiding breaks friendship, Solomon distinguishes the faithful wound from the treacherous kiss.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:19 — *A brother offended is harder to be won than a strong city: and their contentions are like the bars of a castle.* The treacherous wound past which every friend departs (Sirach 22:22) is Solomon''s offended brother, harder to win than a walled city.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:24 — *Leave there thy gift before the altar, and go thy way; first be reconciled to thy brother, and then come and offer thy gift.* The returning to favour Ben Sira urges in Sirach 22:21 the Master sets before the very altar.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* Ben Sira had already named the treasure that the upbraiding of Sirach 22:20 puts at risk.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-the-wounded-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=20
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-22-watch-the-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 141:3 — *Set a watch, O Yahuah (LORD), before my mouth; keep the door of my lips.* Ben Sira''s prayer in Sirach 22:27 is David''s same plea for a guard set over the mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-watch-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:5 — *Even so the tongue is a little member, and boasteth great things. Behold, how great a matter a little fire kindleth!* The tongue Ben Sira fears will destroy him (Sirach 22:27) is James''s little member that kindles a great fire.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-watch-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 3:8 — *But the tongue can no man tame; it is an unruly evil, full of deadly poison.* Because no man can tame the tongue, Sirach 22:27 prays for a watch and a seal of wisdom from above.'
  FROM cross_reference_threads t, cross_references x, _session253_sir22_lookup sv, _session253_sir22_lookup tv
 WHERE t.slug='ecclesiasticus-22-watch-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=22 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_23.sql (session253 ecclesiasticus 23) -----
-- Source anchor: apocrypha/ecclesiasticus ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir23 (view _session253_sir23_lookup). Sort band base 58850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-23-set-a-watch-before-my-mouth
  ('apocrypha', 'ecclesiasticus', 23, 2, 'apocrypha', 'ecclesiasticus', 22, 27, 'extras', E'Ecclesiasticus 22:27 — *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* The chapter before voices the very prayer Sirach 23:2 opens with — a seal upon the lips.'),
  ('apocrypha', 'ecclesiasticus', 23, 2, 'canon', 'psalms', 139, 4, 'free', E'Psalm 139:4 — *For there is not a word in my tongue, but, lo, O Yahuah (LORD), thou knowest it altogether.* David''s psalm answers the plea of Sirach 23:2: the One who would discipline the heart already knows the word before it is uttered.'),
  ('apocrypha', 'ecclesiasticus', 23, 1, 'canon', 'james', 1, 26, 'free', E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain.* James echoes Sirach 23:1''s prayer not to be left to one''s own counsels — the unbridled tongue undoes all religion.'),
  -- thread: sirach-23-accustom-not-thy-mouth-to-swearing
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'exodus', 20, 7, 'free', E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* Sinai''s third word stands behind Sirach 23:9''s charge not to accustom the mouth to naming the Holy One.'),
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'leviticus', 19, 12, 'free', E'Leviticus 19:12 — *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD).* The holiness code names the false oath as a profaning of the Name — exactly the swearing Sirach 23:9 forbids.'),
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'matthew', 5, 34, 'free', E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne.* On the mount Yahusha presses Sirach 23:9 to its root: not careless swearing tempered, but the oath forsworn altogether.'),
  ('apocrypha', 'ecclesiasticus', 23, 9, 'canon', 'matthew', 5, 37, 'free', E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* The plain speech that needs no oath is the mouth Sirach 23:9 sought to discipline.'),
  ('apocrypha', 'ecclesiasticus', 23, 11, 'canon', 'james', 5, 12, 'free', E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* James warns of the condemnation that Sirach 23:11 calls the plague that never departs the swearer''s house.'),
  -- thread: sirach-23-discipline-of-the-mouth
  ('apocrypha', 'ecclesiasticus', 23, 7, 'canon', 'proverbs', 13, 3, 'free', E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* Proverbs says in a line what Sirach 23:7 names the discipline of the mouth — to keep it is to keep one''s life.'),
  ('apocrypha', 'ecclesiasticus', 23, 7, 'canon', 'proverbs', 18, 21, 'free', E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The stakes of Sirach 23:7''s discipline: the tongue holds death and life.'),
  ('apocrypha', 'ecclesiasticus', 23, 15, 'apocrypha', 'ecclesiasticus', 28, 17, 'extras', E'Ecclesiasticus 28:17 — *The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones.* Ben Sira''s own later word measures the ruin of the opprobrious mouth of Sirach 23:15 — the tongue wounds deeper than the whip.'),
  ('apocrypha', 'ecclesiasticus', 23, 7, 'canon', 'james', 3, 2, 'free', E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James makes Sirach 23:7''s kept mouth the measure of the perfect man.'),
  ('apocrypha', 'ecclesiasticus', 23, 8, 'canon', 'matthew', 12, 36, 'free', E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* The sinner taken in his own speech of Sirach 23:8 stands before the reckoning Yahusha names for every idle word.'),
  -- thread: sirach-23-who-seeth-me-all-seeing-eyes
  ('apocrypha', 'ecclesiasticus', 23, 19, 'canon', 'proverbs', 5, 21, 'free', E'Proverbs 5:21 — *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings.* Solomon sets the all-seeing eye in his own chapter against the strange woman — the very ground of Sirach 23:19.'),
  ('apocrypha', 'ecclesiasticus', 23, 19, 'canon', 'proverbs', 15, 3, 'free', E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* No wall hides from the eye that Sirach 23:19 calls brighter than the sun.'),
  ('apocrypha', 'ecclesiasticus', 23, 18, 'canon', 'psalms', 139, 7, 'free', E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David knows there is no darkness to compass oneself about, against the adulterer''s boast of Sirach 23:18.'),
  ('apocrypha', 'ecclesiasticus', 23, 18, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* Yahusha sees the secret thought of Sirach 23:18 itself as the act — the heart is never hidden.'),
  ('apocrypha', 'ecclesiasticus', 23, 18, 'canon', 'job', 31, 1, 'free', E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Job is the man who refuses the adulterer''s reasoning of Sirach 23:18 — guarding the eye before the heart ever thinks.'),
  -- thread: sirach-23-fear-of-yahuah-the-commandments
  ('apocrypha', 'ecclesiasticus', 23, 23, 'canon', 'job', 34, 21, 'free', E'Job 34:21 — *For his eyes are upon the ways of man, and he seeth all his goings.* The same beholding eye brings the secret adulteress of Sirach 23:23, who disobeyed the law of the Most High, into the congregation for inquisition.'),
  ('apocrypha', 'ecclesiasticus', 23, 25, 'canon', 'proverbs', 12, 3, 'free', E'Proverbs 12:3 — *A man shall not be established by wickedness: but the root of the righteous shall not be moved.* Solomon names the very contrast of Sirach 23:25: the wicked take no root, but the righteous cannot be moved.'),
  ('apocrypha', 'ecclesiasticus', 23, 28, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* Moses names the obedient cleaving as life and length of days — the same long life Sirach 23:28 promises the one received of Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-set-a-watch-before-my-mouth',
       E'Set scourges over my thoughts: the prayer to govern the heart',
       E'Ben Sira opens with a prayer for the governance of the inner man — that the discipline of wisdom would stand guard over both heart and tongue: *Who will set scourges over my thoughts, and the discipline of wisdom over my heart? that they spare me not for my ignorances, and it pass not by my sins* (Ecclesiasticus 23:2). It is the same cry he raised a chapter earlier: *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* (Ecclesiasticus 22:27) — the live deuterocanon answering itself. David prayed it in the Psalter: *For there is not a word in my tongue, but, lo, O Yahuah (LORD), thou knowest it altogether* (Psalm 139:4) — the all-knowing One who searches the thought before it is spoken. And James names the man who never learned this watch: *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain* (James 1:26). It ain''t new — the bridled tongue is the wisdom of the whole covenant.',
       sv.verse_id, ev.verse_id, 'extras', 58850
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-accustom-not-thy-mouth-to-swearing',
       E'Swear not at all: the naming of the Holy One',
       E'Ben Sira warns against the careless oath and the careless use of the divine Name: *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One* (Ecclesiasticus 23:9), for *A man that useth much swearing shall be filled with iniquity, and the plague shall never depart from his house* (Ecclesiasticus 23:11). This is Sinai''s third word: *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7), and the holiness code: *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12). On the mountain Yahusha gathers it all into one word: *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne* (Matthew 5:34), and *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* (Matthew 5:37). James, the Sermon''s truest heir, says it again: *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). The Sermon on the Mount did not invent the guarded oath — it carried the Torah and the wisdom of ben Sira forward whole.',
       sv.verse_id, ev.verse_id, 'extras', 58853
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-discipline-of-the-mouth',
       E'The discipline of the mouth: death and life in the tongue',
       E'*Hear, O you children, the discipline of the mouth: he that keepeth it shall never be taken in his lips* (Ecclesiasticus 23:7) — and its opposite, *The man that is accustomed to opprobrious words will never be reformed all the days of his life* (Ecclesiasticus 23:15). This is the running theme of Proverbs: *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction* (Proverbs 13:3), and *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof* (Proverbs 18:21). Ben Sira will return to it with a hammer in his own next breath — *The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones* (Ecclesiasticus 28:17) — and James makes the bridled tongue the measure of the whole man: *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2). Yahusha sets the standard at judgment: *every idle word that men shall speak, they shall give account thereof in the day of judgment* (Matthew 12:36). The wisdom of the guarded mouth runs unbroken from Proverbs through ben Sira to the Sermon.',
       sv.verse_id, ev.verse_id, 'extras', 58856
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-who-seeth-me-all-seeing-eyes',
       E'Who seeth me? The eyes of Yahuah brighter than the sun',
       E'The adulterer hides in the dark and reasons in his heart: *Who seeth me? I am compassed about with darkness, the walls cover me, and no body seeth me; what need I to fear? the Most High will not remember my sins* (Ecclesiasticus 23:18). Ben Sira answers him with the all-seeing eye: *Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Ecclesiasticus 23:19). Solomon said it plainly: *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings* (Proverbs 5:21) — set, as in Sirach, in the very chapter against the strange woman — and *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good* (Proverbs 15:3). David found no darkness to hide in: *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7). And on the mount Yahusha drives the all-seeing eye inward, to the heart that thinks itself unseen: *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28). The walls never covered anyone — the secret place was never secret.',
       sv.verse_id, ev.verse_id, 'extras', 58859
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-23-fear-of-yahuah-the-commandments',
       E'Nothing better than the fear of Yahuah, nothing sweeter than His commandments',
       E'Ben Sira closes the chapter not on judgment but on the covenant''s sweetest end: *And they that remain shall know that there is nothing better than the fear of Yahuah (God), and that there is nothing sweeter than to take heed to the commandments of Yahuah (God)* (Ecclesiasticus 23:27), and *It is great glory to follow Yahuah (God), and to be received of him is long life* (Ecclesiasticus 23:28). The adulteress had despised exactly this: *first, she has disobeyed the law of the Most High* (Ecclesiasticus 23:23), and so *Her children shall not take root, and her branches shall bring forth no fruit* (Ecclesiasticus 23:25). The covenant''s whole verdict turns on the law kept or spurned. The Psalmist sings the kept commandment as sweetness — and ben Sira ends the tongue-and-heart chapter the same place Torah ends every matter: the fear of Yahuah and His commandments are the long life of the one received. Torah stands; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58862
  FROM _session253_sir23_lookup sv, _session253_sir23_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=23 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-23-set-a-watch-before-my-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 22:27 — *Who shall set a watch before my mouth, and a seal of wisdom upon my lips, that I fall not suddenly by them, and that my tongue destroy me not?* The chapter before voices the very prayer Sirach 23:2 opens with — a seal upon the lips.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-set-a-watch-before-my-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:4 — *For there is not a word in my tongue, but, lo, O Yahuah (LORD), thou knowest it altogether.* David''s psalm answers the plea of Sirach 23:2: the One who would discipline the heart already knows the word before it is uttered.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-set-a-watch-before-my-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:26 — *If any man among you seem to be religious, and bridleth not his tongue, but deceiveth his own heart, this man''s religion is vain.* James echoes Sirach 23:1''s prayer not to be left to one''s own counsels — the unbridled tongue undoes all religion.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-set-a-watch-before-my-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-accustom-not-thy-mouth-to-swearing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:7 — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain.* Sinai''s third word stands behind Sirach 23:9''s charge not to accustom the mouth to naming the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:12 — *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD).* The holiness code names the false oath as a profaning of the Name — exactly the swearing Sirach 23:9 forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:34 — *But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne.* On the mount Yahusha presses Sirach 23:9 to its root: not careless swearing tempered, but the oath forsworn altogether.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 5:37 — *But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil.* The plain speech that needs no oath is the mouth Sirach 23:9 sought to discipline.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 5:12 — *But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* James warns of the condemnation that Sirach 23:11 calls the plague that never departs the swearer''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-accustom-not-thy-mouth-to-swearing'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-discipline-of-the-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* Proverbs says in a line what Sirach 23:7 names the discipline of the mouth — to keep it is to keep one''s life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 18:21 — *Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof.* The stakes of Sirach 23:7''s discipline: the tongue holds death and life.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 28:17 — *The stroke of the whip makes marks in the flesh: but the stroke of the tongue breaks the bones.* Ben Sira''s own later word measures the ruin of the opprobrious mouth of Sirach 23:15 — the tongue wounds deeper than the whip.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James makes Sirach 23:7''s kept mouth the measure of the perfect man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 12:36 — *But I say unto you, That every idle word that men shall speak, they shall give account thereof in the day of judgment.* The sinner taken in his own speech of Sirach 23:8 stands before the reckoning Yahusha names for every idle word.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-discipline-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-who-seeth-me-all-seeing-eyes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 5:21 — *For the ways of man are before the eyes of Yahuah (LORD), and he pondereth all his goings.* Solomon sets the all-seeing eye in his own chapter against the strange woman — the very ground of Sirach 23:19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:3 — *The eyes of Yahuah (LORD) are in every place, beholding the evil and the good.* No wall hides from the eye that Sirach 23:19 calls brighter than the sun.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 139:7 — *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* David knows there is no darkness to compass oneself about, against the adulterer''s boast of Sirach 23:18.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* Yahusha sees the secret thought of Sirach 23:18 itself as the act — the heart is never hidden.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Job is the man who refuses the adulterer''s reasoning of Sirach 23:18 — guarding the eye before the heart ever thinks.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-who-seeth-me-all-seeing-eyes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-23-fear-of-yahuah-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 34:21 — *For his eyes are upon the ways of man, and he seeth all his goings.* The same beholding eye brings the secret adulteress of Sirach 23:23, who disobeyed the law of the Most High, into the congregation for inquisition.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-fear-of-yahuah-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=34 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 12:3 — *A man shall not be established by wickedness: but the root of the righteous shall not be moved.* Solomon names the very contrast of Sirach 23:25: the wicked take no root, but the righteous cannot be moved.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-fear-of-yahuah-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days: that thou mayest dwell in the land which Yahuah (LORD) sware unto thy fathers, to Abraham, to Isaac, and to Jacob, to give them.* Moses names the obedient cleaving as life and length of days — the same long life Sirach 23:28 promises the one received of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir23_lookup sv, _session253_sir23_lookup tv
 WHERE t.slug='sirach-23-fear-of-yahuah-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=23 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ecclesiasticus_24.sql (session253 ecclesiasticus 24) -----
-- Source anchor: apocrypha/ecclesiasticus ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir24 (view _session253_sir24_lookup). Sort band base 58875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-24-wisdom-came-out-of-the-mouth
  ('apocrypha', 'ecclesiasticus', 24, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that was with Elohim is the Wisdom that came out of the mouth of the Most High in Sirach 24:3.'),
  ('apocrypha', 'ecclesiasticus', 24, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Wisdom whose throne is in the cloudy pillar (Sirach 24:4) is the Word that tabernacled among us.'),
  ('apocrypha', 'ecclesiasticus', 24, 9, 'canon', 'proverbs', 8, 22, 'free', E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Wisdom created from the beginning before the world (Sirach 24:9) is the same Wisdom possessed before his works of old.'),
  ('apocrypha', 'ecclesiasticus', 24, 9, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom that shall never fail (Sirach 24:9) is the One brought up with Yahuah before the world was.'),
  ('apocrypha', 'ecclesiasticus', 24, 5, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* Wisdom that alone compassed the circuit of heaven (Sirach 24:5) is the One by whom all things were created.'),
  -- thread: ecclesiasticus-24-the-book-of-the-covenant-the-law
  ('apocrypha', 'ecclesiasticus', 24, 23, 'canon', 'deuteronomy', 33, 4, 'free', E'Deuteronomy 33:4 — *Moses commanded us a law, even the inheritance of the congregation of Jacob.* This is the very phrase Wisdom claims for herself in Sirach 24:23 — the law which Moses commanded for an heritage to the congregations of Jacob.'),
  ('apocrypha', 'ecclesiasticus', 24, 23, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'extras', E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch matches Sirach 24:23: Wisdom is the book of the covenant, the law that endureth.'),
  ('apocrypha', 'ecclesiasticus', 24, 23, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 9, 'extras', E'Baruch 3:9 — *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom.* Baruch equates the commandments of life with wisdom, the same identity Sirach 24:23 makes between Wisdom and the law of Moses.'),
  ('apocrypha', 'ecclesiasticus', 24, 8, 'apocrypha', 'ecclesiasticus', 1, 1, 'extras', E'Ecclesiasticus 1:1 — *All wisdom comes from Yahuah (God), and is with him for ever.* Sirach''s own opening confession undergirds 24:8, where the Creator commands Wisdom to dwell in Jacob.'),
  -- thread: ecclesiasticus-24-come-to-me-eat-never-hungry
  ('apocrypha', 'ecclesiasticus', 24, 21, 'canon', 'john', 6, 35, 'free', E'John 6:35 — *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* Yahusha answers the hunger and thirst Wisdom stirs up in Sirach 24:21 — in him alone is it filled.'),
  ('apocrypha', 'ecclesiasticus', 24, 19, 'canon', 'matthew', 11, 28, 'free', E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* Yahusha''s call repeats Wisdom''s own — Come to me, all you that be desirous of me (Sirach 24:19).'),
  ('apocrypha', 'ecclesiasticus', 24, 19, 'canon', 'isaiah', 55, 1, 'free', E'Isaiah 55:1 — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* Isaiah''s free invitation to eat and drink stands behind Wisdom''s Come to me and fill yourselves in Sirach 24:19.'),
  ('apocrypha', 'ecclesiasticus', 24, 21, 'canon', 'revelation', 22, 17, 'free', E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The canon''s last call to the thirsty answers the thirst Wisdom awakens in Sirach 24:21.'),
  -- thread: ecclesiasticus-24-let-your-dwelling-be-in-jacob
  ('apocrypha', 'ecclesiasticus', 24, 8, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine.* The covenant-election that makes Jacob the peculiar treasure is why Wisdom is told to dwell in Jacob in Sirach 24:8.'),
  ('apocrypha', 'ecclesiasticus', 24, 12, 'canon', 'deuteronomy', 33, 3, 'free', E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words.* Wisdom rooting in the honourable people, the portion of Yahuah''s inheritance (Sirach 24:12), is the people Yahuah loved and holds in his hand.'),
  -- thread: ecclesiasticus-24-covered-the-earth-as-a-cloud
  ('apocrypha', 'ecclesiasticus', 24, 10, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Wisdom serving in the holy tabernacle (Sirach 24:10) is the Word who pitched his tabernacle in flesh and showed his glory.'),
  ('apocrypha', 'ecclesiasticus', 24, 4, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Wisdom enthroned in the cloudy pillar (Sirach 24:4) is the Son who is the brightness of the Father''s glory, upholding all things.'),
  ('apocrypha', 'ecclesiasticus', 24, 5, 'canon', 'colossians', 1, 15, 'free', E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature.* Wisdom who alone compassed the circuit of heaven (Sirach 24:5) is the image of the invisible Elohim, the firstborn of all creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-wisdom-came-out-of-the-mouth',
       E'I came out of the mouth of the Most High — Wisdom the Formed Logos',
       E'Sirach''s crown: Wisdom herself speaks, *I came out of the mouth of the Most High, and covered the earth as a cloud* (Ecclesiasticus 24:3), and *He created me from the beginning before the world, and I shall never fail* (Ecclesiasticus 24:9). This is no abstraction — it is the Word brought forth out of the Father before all things. John opens with the same eternity: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and then makes it flesh that tabernacles among us — *And the Word was made flesh, and dwelt among us... full of grace and truth* (John 1:14), the very dwelling Wisdom seeks. Proverbs personifies the same: *Yahuah (LORD) possessed me in the beginning of his way, before his works of old* (Proverbs 8:22), Wisdom *by him, as one brought up with him* (Proverbs 8:30). Paul names the One in whom this is fulfilled — *Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15), *For by him were all things created* (Colossians 1:16). It ain''t new: the deuterocanon already confessed the Logos by whom all was made.',
       sv.verse_id, ev.verse_id, 'extras', 58875
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-the-book-of-the-covenant-the-law',
       E'The book of the covenant, the law which Moses commanded — Wisdom is the Torah',
       E'Then Wisdom names herself outright as the Torah: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23). The Formed Logos and the Law are one thing — Wisdom is the Torah given to Jacob. Moses said exactly this: *Moses commanded us a law, even the inheritance of the congregation of Jacob* (Deuteronomy 33:4). Baruch confesses the same identity — Wisdom is the commandments, the law that endureth: *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom* (Baruch 3:9), *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). Sirach 1 grounds it: *All wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus 1:1). Torah stands — it is not a curse cast off but the very Wisdom of Elohim, the heritage of the congregations of Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 58878
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-come-to-me-eat-never-hungry',
       E'Come to me, fill yourselves — they that eat me shall yet be hungry',
       E'Wisdom holds out an open invitation and a paradox: *Come to me, all you that be desirous of me, and fill yourselves with my fruits* (Ecclesiasticus 24:19), yet *They that eat me shall yet be hungry, and they that drink me shall yet be thirsty* (Ecclesiasticus 24:21) — the deeper the feeding, the deeper the longing. Yahusha takes up the same self-offer and resolves the hunger in himself: *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). He echoes Wisdom''s very call — *Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28). Isaiah issued the invitation first: *Ho, every one that thirsteth, come ye to the waters... come, buy wine and milk without money and without price* (Isaiah 55:1), and Revelation closes the canon with it — *And let him that is athirst come. And whosoever will, let him take the water of life freely* (Revelation 22:17). It ain''t new: the gospel call to come and eat is Wisdom''s ancient cry.',
       sv.verse_id, ev.verse_id, 'extras', 58881
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-let-your-dwelling-be-in-jacob',
       E'Let your dwelling be in Jacob — Wisdom takes root in the chosen people',
       E'The Creator assigns Wisdom a home in the elect nation: *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (Ecclesiasticus 24:8); she takes root *even in the portion of the inheritance of Yahuah (God)* (Ecclesiasticus 24:12). This is the same election Yahuah declared at Sinai: *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). Wisdom dwelling in Jacob is Wisdom dwelling where the Torah was given — the people loved and held in the Father''s hand: *Yea, he loved the people; all his saints are in thy hand* (Deuteronomy 33:3). Not a church displacing Israel: Wisdom''s inheritance is Yashar''el, the congregations of Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 58884
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-24-covered-the-earth-as-a-cloud',
       E'Covered the earth as a cloud — Wisdom in the holy tabernacle',
       E'Wisdom''s dwelling is glory-cloud and sanctuary: *I dwelt in high places, and my throne is in a cloudy pillar* (Ecclesiasticus 24:4), and *In the holy tabernacle I served before him; and so was I established in Sion* (Ecclesiasticus 24:10). The cloudy pillar and the tabernacle are the Shekinah imagery of the Exodus and the temple — the same glory the Logos carried when he tabernacled in flesh: *And the Word was made flesh, and dwelt among us... full of grace and truth* (John 1:14), the visible glory of the One *being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power* (Hebrews 1:3). Wisdom in the holy tabernacle is the One in whom *all things consist* — *For by him were all things created* (Colossians 1:16). The cloud, the pillar, the tabernacle: Wisdom was never far off; she dwelt where Yahuah''s glory rested.',
       sv.verse_id, ev.verse_id, 'extras', 58887
  FROM _session253_sir24_lookup sv, _session253_sir24_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=24 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-24-wisdom-came-out-of-the-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word that was with Elohim is the Wisdom that came out of the mouth of the Most High in Sirach 24:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Wisdom whose throne is in the cloudy pillar (Sirach 24:4) is the Word that tabernacled among us.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:22 — *Yahuah (LORD) possessed me in the beginning of his way, before his works of old.* Wisdom created from the beginning before the world (Sirach 24:9) is the same Wisdom possessed before his works of old.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom that shall never fail (Sirach 24:9) is the One brought up with Yahuah before the world was.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* Wisdom that alone compassed the circuit of heaven (Sirach 24:5) is the One by whom all things were created.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-wisdom-came-out-of-the-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-the-book-of-the-covenant-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:4 — *Moses commanded us a law, even the inheritance of the congregation of Jacob.* This is the very phrase Wisdom claims for herself in Sirach 24:23 — the law which Moses commanded for an heritage to the congregations of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* Baruch matches Sirach 24:23: Wisdom is the book of the covenant, the law that endureth.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 3:9 — *Hear, Yashar''el (Israel), the commandments of life: give ear to understand wisdom.* Baruch equates the commandments of life with wisdom, the same identity Sirach 24:23 makes between Wisdom and the law of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 1:1 — *All wisdom comes from Yahuah (God), and is with him for ever.* Sirach''s own opening confession undergirds 24:8, where the Creator commands Wisdom to dwell in Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-the-book-of-the-covenant-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-come-to-me-eat-never-hungry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 6:35 — *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* Yahusha answers the hunger and thirst Wisdom stirs up in Sirach 24:21 — in him alone is it filled.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* Yahusha''s call repeats Wisdom''s own — Come to me, all you that be desirous of me (Sirach 24:19).'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:1 — *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* Isaiah''s free invitation to eat and drink stands behind Wisdom''s Come to me and fill yourselves in Sirach 24:19.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The canon''s last call to the thirsty answers the thirst Wisdom awakens in Sirach 24:21.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-come-to-me-eat-never-hungry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-let-your-dwelling-be-in-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine.* The covenant-election that makes Jacob the peculiar treasure is why Wisdom is told to dwell in Jacob in Sirach 24:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-let-your-dwelling-be-in-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 33:3 — *Yea, he loved the people; all his saints are in thy hand: and they sat down at thy feet; every one shall receive of thy words.* Wisdom rooting in the honourable people, the portion of Yahuah''s inheritance (Sirach 24:12), is the people Yahuah loved and holds in his hand.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-let-your-dwelling-be-in-jacob'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-24-covered-the-earth-as-a-cloud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Wisdom serving in the holy tabernacle (Sirach 24:10) is the Word who pitched his tabernacle in flesh and showed his glory.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-covered-the-earth-as-a-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Wisdom enthroned in the cloudy pillar (Sirach 24:4) is the Son who is the brightness of the Father''s glory, upholding all things.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-covered-the-earth-as-a-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:15 — *Who is the image of the invisible Elohim (God), the firstborn of every creature.* Wisdom who alone compassed the circuit of heaven (Sirach 24:5) is the image of the invisible Elohim, the firstborn of all creation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir24_lookup sv, _session253_sir24_lookup tv
 WHERE t.slug='ecclesiasticus-24-covered-the-earth-as-a-cloud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=24 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — Sirach (Ecclesiasticus) cross-references complete.'
