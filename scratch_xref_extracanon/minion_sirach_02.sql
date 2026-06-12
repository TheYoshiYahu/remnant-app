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

