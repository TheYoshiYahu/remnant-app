-- ----- fragment: minion_ecclesiasticus_39.sql (session253 ecclesiasticus 39) -----
-- Source anchor: apocrypha/ecclesiasticus ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir39 (view _session253_sir39_lookup). Sort band base 59250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-39-scribe-meditates-law
  ('apocrypha', 'ecclesiasticus', 39, 1, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Sirach 39:1''s scribe who gives his mind to and meditates in the law of the Most High is the blessed man of the first Psalm.'),
  ('apocrypha', 'ecclesiasticus', 39, 1, 'canon', 'joshua', 1, 8, 'free', E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* The meditation in the law that Sirach 39:1 commends is the very charge given Joshua at the entry to the land.'),
  ('apocrypha', 'ecclesiasticus', 39, 1, 'canon', 'ezra', 7, 10, 'free', E'Ezra 7:10 — *For Ezra had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments.* Sirach 39:1''s scribe seeking out wisdom and prophecies is Ezra the ready scribe who prepared his heart to seek and teach the Torah.'),
  ('apocrypha', 'ecclesiasticus', 39, 1, 'canon', 'psalms', 119, 97, 'free', E'Psalm 119:97 — *O how love I thy law! it is my meditation all the day.* The constant occupation in the law Sirach 39:1 describes is the psalmist''s all-day love of and meditation in the Torah.'),
  -- thread: ecclesiasticus-39-spirit-of-understanding-poured-out
  ('apocrypha', 'ecclesiasticus', 39, 6, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The scribe of Sirach 39:6 is filled with the spirit of understanding only when the great Yahuah wills — wisdom asked of God and given.'),
  ('apocrypha', 'ecclesiasticus', 39, 6, 'canon', 'james', 1, 17, 'free', E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* Sirach 39:6''s spirit of understanding poured out by God''s will is the good and perfect gift coming down from above.'),
  ('apocrypha', 'ecclesiasticus', 39, 5, 'canon', 'proverbs', 2, 5, 'free', E'Proverbs 2:5 — *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God).* The scribe of Sirach 39:5 who resorts early in prayer to his Maker finds the knowledge of God promised to the one who seeks her.'),
  ('apocrypha', 'ecclesiasticus', 39, 6, 'apocrypha', 'the-wisdom-of-solomon', 7, 15, 'extras', E'Wisdom of Solomon 7:15 — *Yahuah (God) has granted me to speak as I would, and to conceive as is meet for the things that are given me: because it is he that leadeth to wisdom, and directeth the wise.* Sirach''s own sister volume confesses, like Sirach 39:6, that the gift of wise speech comes only as God grants it.'),
  -- thread: ecclesiasticus-39-glory-in-law-name-endures
  ('apocrypha', 'ecclesiasticus', 39, 9, 'canon', 'psalms', 1, 3, 'free', E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The scribe of Sirach 39:9 whose memorial shall not depart is the law-delighting man whose leaf shall not wither.'),
  ('apocrypha', 'ecclesiasticus', 39, 8, 'apocrypha', 'ecclesiasticus', 24, 23, 'extras', E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* The law of the covenant the scribe glories in at Sirach 39:8 is named by Sirach himself as the Mosaic Torah, the heritage of Jacob.'),
  ('apocrypha', 'ecclesiasticus', 39, 8, 'canon', 'matthew', 13, 52, 'free', E'Matthew 13:52 — *Then said he unto them, Therefore every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old.* The scribe of Sirach 39:8 who shews forth what he has learned and glories in the law is the kingdom-scribe bringing forth things new and old.'),
  -- thread: ecclesiasticus-39-all-works-good-in-due-season
  ('apocrypha', 'ecclesiasticus', 39, 16, 'canon', 'genesis', 1, 31, 'free', E'Genesis 1:31 — *And Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.* Sirach 39:16''s verdict that all the works of Yahuah are exceeding good is the Maker''s own verdict over creation.'),
  ('apocrypha', 'ecclesiasticus', 39, 17, 'canon', 'ecclesiastes', 3, 1, 'free', E'Ecclesiastes 3:1 — *To every thing there is a season, and a time to every purpose under the heaven:* Sirach 39:17''s ''at time convenient they shall all be sought out'' answers the same restless question with the Preacher''s season for every purpose.'),
  ('apocrypha', 'ecclesiasticus', 39, 16, 'canon', 'ecclesiastes', 3, 11, 'free', E'Ecclesiastes 3:11 — *He hath made every thing beautiful in his time: also he hath set the world in their heart, so that no man can find out the work that Elohim (God) maketh from the beginning to the end.* Sirach 39:16''s works accomplished ''in due season'' is the Preacher''s every thing made beautiful in its time.'),
  ('apocrypha', 'ecclesiasticus', 39, 33, 'canon', 'romans', 8, 28, 'free', E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* Sirach 39:33''s ''all the works of Yahuah are good... in due season'' reaches its fullness in Paul''s all things working together for good.'),
  ('apocrypha', 'ecclesiasticus', 39, 16, 'canon', 'psalms', 145, 9, 'free', E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* The goodness Sirach 39:16 ascribes to all God''s works is the psalmist''s mercy over all that He has made.'),
  -- thread: ecclesiasticus-39-his-word-commands-creation
  ('apocrypha', 'ecclesiasticus', 39, 17, 'canon', 'psalms', 33, 9, 'free', E'Psalm 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* Sirach 39:17''s waters standing ''as an heap'' at His commandment is the psalm''s word that speaks and it is done.'),
  ('apocrypha', 'ecclesiasticus', 39, 17, 'canon', 'genesis', 1, 9, 'free', E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* Sirach 39:17''s receptacles of waters gathered at His word echo the third-day gathering of the waters.'),
  ('apocrypha', 'ecclesiasticus', 39, 18, 'canon', 'isaiah', 55, 11, 'free', E'Isaiah 55:11 — *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* Sirach 39:18''s ''none can hinder, when he will save'' is the word that does not return void but accomplishes what He pleases.'),
  ('apocrypha', 'ecclesiasticus', 39, 18, 'canon', 'romans', 11, 36, 'free', E'Romans 11:36 — *For of him, and through him, and to him, are all things: to whom be glory for ever. Amen.* Sirach 39:18''s sovereign commandment over all things resolves into Paul''s doxology where all things are of, through, and to Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-39-scribe-meditates-law',
       E'The scribe who gives his mind to the law of the Most High',
       E'Sirach opens its portrait of the ideal scribe: *But he that gives his mind to the law of the Most High, and is occupied in the meditation thereof, will seek out the wisdom of all the ancient, and be occupied in prophecies.* (Ecclesiasticus 39:1) — the man whose whole vocation is the Torah. It ain''t new: this is the blessed man of the first Psalm, *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* (Psalm 1:2), and the charge to Joshua, *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein* (Joshua 1:8). It is Ezra the ready scribe who *had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments* (Ezra 7:10), and the psalmist''s cry, *O how love I thy law! it is my meditation all the day* (Psalm 119:97). The Messiah crowns the figure: *every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old* (Matthew 13:52) — old and new, never old set aside.',
       sv.verse_id, ev.verse_id, 'extras', 59250
  FROM _session253_sir39_lookup sv, _session253_sir39_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=39 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-39-spirit-of-understanding-poured-out',
       E'Filled with the spirit of understanding — wisdom asked and given',
       E'The scribe does not seize wisdom; he begs it: *He will give his heart to resort early to Yahuah (God) that made him, and will pray before the Most High, and will open his mouth in prayer, and make supplication for his sins* (Ecclesiasticus 39:5), and then *When the great Yahuah (God) will, he shall be filled with the spirit of understanding: he shall pour out wise sentences, and give thanks to Yahuah (God) in his prayer* (Ecclesiasticus 39:6). It ain''t new: James names the same path, *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5), and traces every gift to its source, *Every good gift and every perfect gift is from above, and cometh down from the Father of lights* (James 1:17). Proverbs already set the price — *if thou seekest her as silver, and searchest for her as for hid treasures; Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God)* (Proverbs 2:4-5). Sirach''s own twin volume confesses the gift the same way: *Yahuah (God) has granted me to speak as I would... because it is he that leadeth to wisdom, and directeth the wise* (Wisdom of Solomon 7:15).',
       sv.verse_id, ev.verse_id, 'extras', 59253
  FROM _session253_sir39_lookup sv, _session253_sir39_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=39 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-39-glory-in-law-name-endures',
       E'He shall glory in the law of the covenant — his name lives from generation to generation',
       E'The scribe''s boast is the covenant: *He shall shew forth that which he has learned, and shall glory in the law of the covenant of Yahuah (God)* (Ecclesiasticus 39:8), and his reward is endurance — *so long as the world endureth, it shall not be blotted out; his memorial shall not depart away, and his name shall live from generation to generation* (Ecclesiasticus 39:9). It ain''t new: the man who delights in the Torah is *like a tree planted by the rivers of water... and whatsoever he doeth shall prosper* (Psalm 1:3), and the covenant the scribe glories in is the same law Sirach elsewhere names, *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23) — Torah stands, the heritage of Jacob, never set aside. The Messiah''s instructed scribe brings the treasure of that endurance, *things new and old* (Matthew 13:52).',
       sv.verse_id, ev.verse_id, 'extras', 59256
  FROM _session253_sir39_lookup sv, _session253_sir39_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=39 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-39-all-works-good-in-due-season',
       E'All the works of Yahuah are exceeding good in their season',
       E'The doxology turns to the goodness of all God''s works: *All the works of Yahuah (God) are exceeding good, and whatsoever he commands shall be accomplished in due season* (Ecclesiasticus 39:16), and the warning, *And none may say, What is this? wherefore is that? for at time convenient they shall all be sought out* (Ecclesiasticus 39:17), restated as *All the works of Yahuah (God) are good: and he will give every needful thing in due season* (Ecclesiasticus 39:33). It ain''t new: Genesis saw it first, *And Elohim (God) saw every thing that he had made, and, behold, it was very good* (Genesis 1:31); the Preacher answered the same restless ''what is this?'' — *To every thing there is a season, and a time to every purpose under the heaven* (Ecclesiastes 3:1), for *He hath made every thing beautiful in his time* (Ecclesiastes 3:11). Paul carries it to its end: *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose* (Romans 8:28), and *Yahuah (LORD) is good to all: and his tender mercies are over all his works* (Psalm 145:9).',
       sv.verse_id, ev.verse_id, 'extras', 59259
  FROM _session253_sir39_lookup sv, _session253_sir39_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=39 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-39-his-word-commands-creation',
       E'At his commandment the waters stood — none can hinder His word',
       E'Sirach grounds the goodness of all things in the sovereign word: *at his commandment the waters stood as an heap, and at the words of his mouth the receptacles of waters* (Ecclesiasticus 39:17), *At his commandment is done whatsoever pleaseth him; and none can hinder, when he will save* (Ecclesiasticus 39:18). It ain''t new: the psalm of the word made the heavens — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6), *For he spake, and it was done; he commanded, and it stood fast* (Psalm 33:9). Genesis gathered the waters at a word, *Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so* (Genesis 1:9). The word never fails: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please* (Isaiah 55:11). And Paul ends where the doxology aims: *For of him, and through him, and to him, are all things: to whom be glory for ever. Amen.* (Romans 11:36)',
       sv.verse_id, ev.verse_id, 'extras', 59262
  FROM _session253_sir39_lookup sv, _session253_sir39_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=39 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-39-scribe-meditates-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* Sirach 39:1''s scribe who gives his mind to and meditates in the law of the Most High is the blessed man of the first Psalm.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-scribe-meditates-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* The meditation in the law that Sirach 39:1 commends is the very charge given Joshua at the entry to the land.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-scribe-meditates-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 7:10 — *For Ezra had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments.* Sirach 39:1''s scribe seeking out wisdom and prophecies is Ezra the ready scribe who prepared his heart to seek and teach the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-scribe-meditates-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 119:97 — *O how love I thy law! it is my meditation all the day.* The constant occupation in the law Sirach 39:1 describes is the psalmist''s all-day love of and meditation in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-scribe-meditates-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=97
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-39-spirit-of-understanding-poured-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The scribe of Sirach 39:6 is filled with the spirit of understanding only when the great Yahuah wills — wisdom asked of God and given.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-spirit-of-understanding-poured-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:17 — *Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning.* Sirach 39:6''s spirit of understanding poured out by God''s will is the good and perfect gift coming down from above.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-spirit-of-understanding-poured-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 2:5 — *Then shalt thou understand the fear of Yahuah (LORD), and find the knowledge of Elohim (God).* The scribe of Sirach 39:5 who resorts early in prayer to his Maker finds the knowledge of God promised to the one who seeks her.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-spirit-of-understanding-poured-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 7:15 — *Yahuah (God) has granted me to speak as I would, and to conceive as is meet for the things that are given me: because it is he that leadeth to wisdom, and directeth the wise.* Sirach''s own sister volume confesses, like Sirach 39:6, that the gift of wise speech comes only as God grants it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-spirit-of-understanding-poured-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-39-glory-in-law-name-endures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:3 — *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper.* The scribe of Sirach 39:9 whose memorial shall not depart is the law-delighting man whose leaf shall not wither.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-glory-in-law-name-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* The law of the covenant the scribe glories in at Sirach 39:8 is named by Sirach himself as the Mosaic Torah, the heritage of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-glory-in-law-name-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:52 — *Then said he unto them, Therefore every scribe which is instructed unto the kingdom of heaven is like unto a man that is an householder, which bringeth forth out of his treasure things new and old.* The scribe of Sirach 39:8 who shews forth what he has learned and glories in the law is the kingdom-scribe bringing forth things new and old.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-glory-in-law-name-endures'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-39-all-works-good-in-due-season
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:31 — *And Elohim (God) saw every thing that he had made, and, behold, it was very good. And the evening and the morning were the sixth day.* Sirach 39:16''s verdict that all the works of Yahuah are exceeding good is the Maker''s own verdict over creation.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-all-works-good-in-due-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 3:1 — *To every thing there is a season, and a time to every purpose under the heaven:* Sirach 39:17''s ''at time convenient they shall all be sought out'' answers the same restless question with the Preacher''s season for every purpose.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-all-works-good-in-due-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 3:11 — *He hath made every thing beautiful in his time: also he hath set the world in their heart, so that no man can find out the work that Elohim (God) maketh from the beginning to the end.* Sirach 39:16''s works accomplished ''in due season'' is the Preacher''s every thing made beautiful in its time.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-all-works-good-in-due-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:28 — *And we know that all things work together for good to them that love Elohim (God), to them who are the called according to his purpose.* Sirach 39:33''s ''all the works of Yahuah are good... in due season'' reaches its fullness in Paul''s all things working together for good.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-all-works-good-in-due-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 145:9 — *Yahuah (LORD) is good to all: and his tender mercies are over all his works.* The goodness Sirach 39:16 ascribes to all God''s works is the psalmist''s mercy over all that He has made.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-all-works-good-in-due-season'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-39-his-word-commands-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 33:9 — *For he spake, and it was done; he commanded, and it stood fast.* Sirach 39:17''s waters standing ''as an heap'' at His commandment is the psalm''s word that speaks and it is done.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-his-word-commands-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* Sirach 39:17''s receptacles of waters gathered at His word echo the third-day gathering of the waters.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-his-word-commands-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:11 — *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* Sirach 39:18''s ''none can hinder, when he will save'' is the word that does not return void but accomplishes what He pleases.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-his-word-commands-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:36 — *For of him, and through him, and to him, are all things: to whom be glory for ever. Amen.* Sirach 39:18''s sovereign commandment over all things resolves into Paul''s doxology where all things are of, through, and to Him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir39_lookup sv, _session253_sir39_lookup tv
 WHERE t.slug='ecclesiasticus-39-his-word-commands-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=39 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

