-- =====================================================================
-- Session 344 — Joshua FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/former-prophets-wt/data-schema/migrations/session344_joshua_cross_references.sql
-- =====================================================================

\echo 'session344 — Joshua cross-references starting...'
BEGIN;

-- ----- fragment: minion_joshua_1.sql (Joshua 1) -----
-- Book: Joshua  Chapter: 1   Tag: jos01   Session: s344
-- Sort band: 35000, step 3 (35000, 35003, 35006, ...)
-- View: _s344_jos01_lookup
--
-- FRAME: After Moses' death Yahuah (LORD) commissions Joshua (Yehoshua = "Yahuah saves," the
-- namesake of Yahusha/Jesus) to lead Yashar'el (Israel) over Jordan into the promised
-- inheritance. The chapter is the great Torah-affirming commission: courage is tied to
-- observing ALL the Torah Moses commanded (1:6-7), the book of the Torah is to be meditated
-- day and night as the way of prosperity (1:8) — the Torah is the path of life, NEVER the
-- curse. The abiding promise "I will not fail thee, nor forsake thee" (1:5) carries forward
-- to Hebrews 13:5 and Matthew 28:20. Yehoshua leading into the inheritance/rest is the type
-- of the One who leads into the true rest (Hebrews 4:8).
--
-- Joshua 1 coverage:
--   v.1-2  (commission / cross Jordan into the land)
--          NT:     none warranted (the namesake-into-rest weave carried at v.6/v.13)
--          Extras: none warranted
--          Tanakh: Deuteronomy 31:7,23 (Moses charges Joshua) -> thread D
--   v.3-4  (boundaries / every place the sole of your foot treads)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 11:24-25 (echoed land boundaries) -> folded into thread B context (not a separate member to keep curated)
--   v.5    (I will not fail thee, nor forsake thee)
--          NT:     Hebrews 13:5 (I will never leave thee, nor forsake thee); Matthew 28:20 (I am with you alway) -> thread C
--          Extras: none warranted
--          Tanakh: Deuteronomy 31:6,8 (he will not fail thee, nor forsake thee) -> thread C
--   v.6-7  (be strong and very courageous, observe to do all the Torah Moses commanded)
--          NT:     none warranted (Torah-affirmation is the load; NT echo at v.5/v.8 threads)
--          Extras: none warranted
--          Tanakh: Deuteronomy 31:6,7,23 (be strong and of a good courage); Joshua 23:6 (be courageous to keep all written in the book of the Torah) -> thread A
--   v.8    (this book of the Torah... meditate therein day and night... prosperous)
--          NT:     none warranted (the blessed-man weave is the Psalm 1 root)
--          Extras: none warranted
--          Tanakh: Psalm 1:2-3 (his delight is in the Torah... meditate day and night... shall prosper); Deuteronomy 11:18-21 (lay up my words... teach them... that your days be multiplied) -> thread B
--   v.9    (be strong... be not afraid... Yahuah Elohayka is with thee)
--          NT:     Matthew 28:20 (lo, I am with you alway) -> thread C
--          Extras: none warranted
--          Tanakh: Deuteronomy 31:6,8 -> thread C
--   v.10-15 (officers / cross armed / Reubenites-Gadites-half-Manasseh; Yahuah hath given you rest)
--          NT:     Hebrews 4:8 (if Yahusha/Joshua had given them rest) -> thread D
--          Extras: none warranted
--          Tanakh: none additional warranted
--   v.16-18 (the people pledge to obey Joshua as they obeyed Moses)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none additional warranted (the obedience pledge sits inside the commission frame)
--
-- THREADS (slug + target libraries):
--   A joshua-1-be-strong-and-very-courageous-to-do-all-the-torah        [canon Tanakh: Deuteronomy, Joshua]  tier free
--   B joshua-1-meditate-in-the-torah-day-and-night-the-way-of-prosperity [canon Tanakh: Psalms, Deuteronomy]  tier free
--   C joshua-1-i-will-not-fail-thee-nor-forsake-thee-the-abiding-presence [canon: Deuteronomy, Hebrews, Matthew] tier free
--   D joshua-1-yehoshua-leads-into-the-inheritance-and-the-rest          [canon: Deuteronomy, Hebrews]        tier free
--
-- All targets are canon (Tanakh + NT) -> every row tier 'free', every thread tier_required 'free'.

CREATE TEMP VIEW _s344_jos01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD A: be strong and very courageous, to do all the Torah
    ('canon','joshua',1,6,'canon','deuteronomy',31,7,'free',
      E'*And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it* (Deuteronomy 31:7). Joshua''s charge *Be strong and of a good courage: for unto this people shalt thou divide for an inheritance the land* (Joshua 1:6) is the word Moses first spoke to him; the courage is for the work of bringing Yashar''el into the inheritance Yahuah sware unto the fathers.'),
    ('canon','joshua',1,6,'canon','deuteronomy',31,23,'free',
      E'*And he gave Joshua the son of Nun a charge, and said, Be strong and of a good courage: for thou shalt bring the children of Yashar''el (Israel) into the land which I sware unto them: and I will be with thee* (Deuteronomy 31:23). The same charge Yahuah gave Joshua before Moses'' death now opens the book of Joshua: *Be strong and of a good courage* (Joshua 1:6) — the commission to lead the people in.'),
    ('canon','joshua',1,7,'canon','deuteronomy',31,6,'free',
      E'*Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). The courage commanded Joshua — *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee* (Joshua 1:7) — is the same courage Moses commanded all Yashar''el, and here it is bound to keeping the whole Torah, never turning from it.'),
    ('canon','joshua',1,7,'canon','joshua',23,6,'free',
      E'*Be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses, that ye turn not aside therefrom to the right hand or to the left* (Joshua 23:6). At the end of his life Joshua hands the people the very word he received at the start: *turn not from it to the right hand or to the left* (Joshua 1:7) — courage is for keeping all that is written in the Torah, the book framing the whole conquest.'),
    -- THREAD B: meditate in the Torah day and night, the way of prosperity
    ('canon','joshua',1,8,'canon','psalms',1,2,'free',
      E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). The blessed man of Psalm 1 is the man who does exactly what Joshua is commanded: *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night* (Joshua 1:8) — the Torah meditated day and night is the way of the righteous, never a burden, never the curse.'),
    ('canon','joshua',1,8,'canon','psalms',1,3,'free',
      E'*And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper* (Psalm 1:3). The promise to Joshua — *for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8) — is the prospering tree of Psalm 1: the one whose delight is the Torah is planted, fruitful, and prospers in all he does.'),
    ('canon','joshua',1,8,'canon','deuteronomy',11,18,'free',
      E'*Therefore shall ye lay up these my words in your heart and in your soul, and bind them for a sign upon your hand, that they may be as frontlets between your eyes* (Deuteronomy 11:18). Joshua''s *This book of the law shall not depart out of thy mouth* (Joshua 1:8) is the personal form of the command Moses gave all Yashar''el — the Torah kept continually in mouth, heart, and hand.'),
    ('canon','joshua',1,8,'canon','deuteronomy',11,21,'free',
      E'*That your days may be multiplied, and the days of your children, in the land which Yahuah (LORD) sware unto your fathers to give them, as the days of heaven upon the earth* (Deuteronomy 11:21). The good success promised Joshua for meditating in the Torah day and night (Joshua 1:8) is the multiplied days in the land Moses tied to laying up the words of the Torah — the obedience that prospers, not a works-curse but the path of life.'),
    -- THREAD C: I will not fail thee, nor forsake thee — the abiding presence
    ('canon','joshua',1,5,'canon','deuteronomy',31,6,'free',
      E'*Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). The promise to Joshua — *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5) — is the very word Moses spoke to all Yashar''el: the abiding presence of Yahuah that goes with his people.'),
    ('canon','joshua',1,5,'canon','deuteronomy',31,8,'free',
      E'*And Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee, neither forsake thee: fear not, neither be dismayed* (Deuteronomy 31:8). Yahuah''s pledge *I will not fail thee, nor forsake thee* (Joshua 1:5) is Moses'' farewell promise over Joshua himself — the presence that goes before and does not abandon.'),
    ('canon','joshua',1,5,'canon','hebrews',13,5,'free',
      E'*Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). The writer to the Hebrews quotes this very promise — *I will not fail thee, nor forsake thee* (Joshua 1:5) — as the abiding word of Yahuah to his people in every generation; the presence given Joshua is the believer''s sure ground.'),
    ('canon','joshua',1,9,'canon','matthew',28,20,'free',
      E'*Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen* (Matthew 28:20). The risen Yahusha (Jesus) — whose very name is Yehoshua, "Yahuah saves," Joshua''s namesake — gives the same abiding promise Joshua received: *be not afraid... for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9); *I am with you alway*.'),
    -- THREAD D: Yehoshua leads into the inheritance and the rest
    ('canon','joshua',1,2,'canon','deuteronomy',31,7,'free',
      E'*And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it* (Deuteronomy 31:7). Yahuah''s word *arise, go over this Jordan, thou, and all this people, unto the land which I do give to them* (Joshua 1:2) puts Joshua in the place Moses appointed: he is the one who causes Yashar''el to inherit.'),
    ('canon','joshua',1,13,'canon','hebrews',4,8,'free',
      E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8) — where "Yahusha" renders Joshua, the namesake. The remembered word *Yahuah Elohaychem (The LORD your God) hath given you rest, and hath given you this land* (Joshua 1:13) is the rest Joshua brought Yashar''el into the land; Hebrews reads that rest as the figure of the greater, final rest the true Yehoshua leads his people into.'),
    ('canon','joshua',1,6,'canon','hebrews',4,8,'free',
      E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8). Joshua dividing *for an inheritance the land, which I sware unto their fathers* (Joshua 1:6) is the type the writer to the Hebrews unfolds: the inheritance Joshua delivered points beyond itself to the rest that remaineth to the people of Elohim, led in by the One whose name he bore.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
-- THREAD A
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-1-be-strong-and-very-courageous-to-do-all-the-torah',
       E'Be Strong and Very Courageous — to Do All the Torah',
       E'Yahuah''s commission to Joshua binds courage to obedience: *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left* (Joshua 1:7). The strength is not a bare bravery but the resolve to keep the whole Torah. This is the word Moses already laid on him: *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it* (Deuteronomy 31:7), and again the LORD himself: *Be strong and of a good courage: for thou shalt bring the children of Yashar''el (Israel) into the land which I sware unto them: and I will be with thee* (Deuteronomy 31:23). At the close of his life Joshua hands the same charge back to the people unchanged: *Be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses, that ye turn not aside therefrom to the right hand or to the left* (Joshua 23:6). The Torah is not the curse to be feared and escaped — it is the covenant inheritance the courageous keep.',
       sv.verse_id, ev.verse_id, 'free', 35000
  FROM _s344_jos01_lookup sv, _s344_jos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD B
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-1-meditate-in-the-torah-day-and-night-the-way-of-prosperity',
       E'Meditate in the Torah Day and Night — the Way of Prosperity',
       E'The heart of the commission is a command to live in the Torah: *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8). The Torah meditated day and night is the way to prosper — the same portrait Psalm 1 paints of the blessed man: *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2); *And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season; his leaf also shall not wither; and whatsoever he doeth shall prosper* (Psalm 1:3). Moses had already pressed it on all Yashar''el: *Therefore shall ye lay up these my words in your heart and in your soul, and bind them for a sign upon your hand, that they may be as frontlets between your eyes* (Deuteronomy 11:18), with the promise *That your days may be multiplied, and the days of your children, in the land which Yahuah (LORD) sware unto your fathers to give them, as the days of heaven upon the earth* (Deuteronomy 11:21). The Torah kept in mouth, heart, and hand is the path of life and prospering — never the burden Christianized readings make of it.',
       sv.verse_id, ev.verse_id, 'free', 35003
  FROM _s344_jos01_lookup sv, _s344_jos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD C
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-1-i-will-not-fail-thee-nor-forsake-thee-the-abiding-presence',
       E'I Will Not Fail Thee, nor Forsake Thee — the Abiding Presence',
       E'Yahuah grounds Joshua''s courage in his own presence: *There shall not any man be able to stand before thee all the days of thy life: as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5), and again *be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). This is the promise Moses spoke to all Yashar''el — *he will not fail thee, nor forsake thee* (Deuteronomy 31:6) — and over Joshua personally: *And Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee, neither forsake thee* (Deuteronomy 31:8). The writer to the Hebrews lifts the very words as the believer''s sure ground: *for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). And the risen Yahusha (Jesus) — whose name IS Yehoshua, "Yahuah saves" — seals it: *and, lo, I am with you alway, even unto the end of the world. Amen* (Matthew 28:20). The Formed Son who walked with Yashar''el under Moses and Joshua is the same who abides with his people to the end.',
       sv.verse_id, ev.verse_id, 'free', 35006
  FROM _s344_jos01_lookup sv, _s344_jos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD D
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-1-yehoshua-leads-into-the-inheritance-and-the-rest',
       E'Yehoshua Leads Into the Inheritance and the Rest',
       E'Joshua — Yehoshua, "Yahuah saves," the namesake of Yahusha (Jesus) — is raised up to lead Yashar''el over Jordan into the inheritance: *arise, go over this Jordan, thou, and all this people, unto the land which I do give to them, even to the children of Yashar''el (Israel)* (Joshua 1:2), *for unto this people shalt thou divide for an inheritance the land, which I sware unto their fathers to give them* (Joshua 1:6). Moses had appointed him for exactly this: *thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it* (Deuteronomy 31:7). And the rest he gave was real — *Yahuah Elohaychem (The LORD your God) hath given you rest, and hath given you this land* (Joshua 1:13) — yet the writer to the Hebrews reads it as a figure pointing beyond: *For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8). The land-rest Joshua delivered was a true rest and a shadow of the greater rest that remaineth for the people of Elohim, led in by the One whose name he bore.',
       sv.verse_id, ev.verse_id, 'free', 35009
  FROM _s344_jos01_lookup sv, _s344_jos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD A members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Be strong and of a good courage... thou shalt cause them to inherit it* (Deuteronomy 31:7) — the charge Moses first gave Joshua, courage for the inheritance.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-be-strong-and-very-courageous-to-do-all-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Be strong and of a good courage... and I will be with thee* (Deuteronomy 31:23) — Yahuah''s own charge to Joshua before Moses'' death.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-be-strong-and-very-courageous-to-do-all-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Be strong and of a good courage... he will not fail thee, nor forsake thee* (Deuteronomy 31:6) — the courage Moses commanded all Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-be-strong-and-very-courageous-to-do-all-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses* (Joshua 23:6) — Joshua hands the same Torah-charge back to the people at the end.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-be-strong-and-very-courageous-to-do-all-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD B members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2) — the blessed man does what Joshua is commanded.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-meditate-in-the-torah-day-and-night-the-way-of-prosperity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*like a tree planted by the rivers of water... whatsoever he doeth shall prosper* (Psalm 1:3) — the prospering tree is the Torah-meditator''s good success.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-meditate-in-the-torah-day-and-night-the-way-of-prosperity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*lay up these my words in your heart and in your soul... frontlets between your eyes* (Deuteronomy 11:18) — the Torah kept continually, the command behind Joshua 1:8.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-meditate-in-the-torah-day-and-night-the-way-of-prosperity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*That your days may be multiplied... in the land which Yahuah (LORD) sware unto your fathers* (Deuteronomy 11:21) — the multiplied days the Torah-keeper inherits, the good success of Joshua 1:8.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-meditate-in-the-torah-day-and-night-the-way-of-prosperity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD C members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6) — Moses'' promise to all Yashar''el, the abiding presence.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-i-will-not-fail-thee-nor-forsake-thee-the-abiding-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he will be with thee, he will not fail thee, neither forsake thee* (Deuteronomy 31:8) — Moses'' farewell word over Joshua himself.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-i-will-not-fail-thee-nor-forsake-thee-the-abiding-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5) — the very promise lifted as the believer''s sure ground.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-i-will-not-fail-thee-nor-forsake-thee-the-abiding-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*lo, I am with you alway, even unto the end of the world* (Matthew 28:20) — the risen Yahusha (Yehoshua''s namesake) gives the same abiding promise as Joshua 1:9.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-i-will-not-fail-thee-nor-forsake-thee-the-abiding-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD D members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt cause them to inherit it* (Deuteronomy 31:7) — Moses appoints Joshua the one who brings Yashar''el into the inheritance, the work of Joshua 1:2.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-yehoshua-leads-into-the-inheritance-and-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the land, which I sware unto their fathers to give them* (Joshua 1:6 -> Hebrews 4:8) — the inheritance Joshua divides is the figure of the rest that remaineth.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-yehoshua-leads-into-the-inheritance-and-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For if Yahusha (Jesus) had given them rest...* (Hebrews 4:8) — the rest Joshua gave in the land (Joshua 1:13) read as the shadow of the greater rest.'
  FROM cross_reference_threads t
  JOIN _s344_jos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s344_jos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-1-yehoshua-leads-into-the-inheritance-and-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_2.sql (Joshua 2) -----
-- Chapter: Joshua 2 — RAHAB, a keystone of the seed-of-promise framework. The two spies lodge in
-- *an harlot''s house, named Rahab* (2:1) in Jericho. ★★ The Canaanite woman confesses the true
-- Elohim: *I know that Yahuah (LORD) hath given you the land... For we have heard how Yahuah (LORD)
-- dried up the water of the Red sea for you* (2:9-10), *for Yahuah Elohaychem (the LORD your God), he
-- is Elohim (God) in heaven above, and in earth beneath* (2:11) — the very confession of Moses
-- *Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else*
-- (Deuteronomy 4:39). She pleads mercy for *my father''s house* (2:12-13) and is given the sign of the
-- ★ SCARLET LINE bound in the window: *thou shalt bind this line of scarlet thread in the window* (2:18),
-- *and she bound the scarlet line in the window* (2:21) — the Passover-blood deliverance sign, *the
-- blood shall be to you for a token upon the houses* (Exodus 12:13); those under the sign are spared
-- when the city falls, *Joshua saved Rahab the harlot alive* (Joshua 6:25). ★★★ And Rahab is brought
-- into Yashar''el and MARRIED into the seed of promise — *Salmon begat Booz of Rachab* (Matthew 1:5),
-- the daughter-of-the-nations absorbed into the Messianic line by marriage-covenant (NOT by mere
-- confession). ★★ The NT names her the example of living faith perfected by works: *By faith the harlot
-- Rahab perished not* (Hebrews 11:31), *was not Rahab the harlot justified by works, when she had
-- received the messengers* (James 2:25) — the same faith-and-works as Abraham (James 2:21-23).
-- Tag: jos02   Temp view: _s344_jos02_lookup
-- Sort band: base 35025, step 3 -> threads at 35025, 35028, 35031, 35034 (4 threads)
-- Source of EVERY row: 'canon','joshua',2,v
--
-- Joshua 2 coverage:
--   ★★ v.9-11 (I know that Yahuah hath given you the land... for Yahuah Elohaychem (the LORD your God),
--          he is Elohim (God) in heaven above, and in earth beneath)
--        NT:     none warranted distinct (her faith-confession is carried in the works-thread below;
--                the NT names her FAITH at Heb 11:31 / Jas 2:25 — THREAD 4)
--        Extras: none warranted (clean Jubilees/Jasher Rahab witness not present in parse; held in prose)
--        Tanakh: ★★ Deuteronomy 4:39 (Yahuah (LORD) he is Elohim (God) in heaven above, and upon the
--                earth beneath: there is none else) — THREAD 1 (the same confession, on Canaanite lips)
--   ★ v.18,21 (thou shalt bind this line of scarlet thread in the window... and she bound the scarlet
--          line in the window)
--        NT:     none warranted distinct (the deliverance-sign forward-weave is the Passover blood,
--                held in prose as the type the Messiah our Passover fills)
--        Extras: none warranted
--        Tanakh: ★ Exodus 12:13 (the blood shall be to you for a token upon the houses... and when I see
--                the blood, I will pass over you), Exodus 12:23 (when he seeth the blood... Yahuah will
--                pass over the door, and will not suffer the destroyer to come in), Joshua 6:25 (Joshua
--                saved Rahab the harlot alive) — THREAD 2 (the scarlet sign that marks the spared house)
--   ★★★ v.12-14 (shew kindness unto my father''s house... Our life for yours... we will deal kindly and
--          truly with thee) — the oath that brings Rahab into Yashar''el
--        NT:     ★★★ Matthew 1:5 (Salmon begat Booz of Rachab) — THREAD 3 (absorbed into Messiah''s line
--                by MARRIAGE-covenant, not mere confession)
--        Extras: none warranted
--        Tanakh: ★ Ruth 4:21 (Salmon begat Boaz, and Boaz begat Obed) — THREAD 3 (the same line, the
--                daughter-of-the-nations grafted in by marriage, as Ruth after her)
--   ★★ v.1,4 (came into an harlot''s house... the woman took the two men, and hid them) — the receiving
--          of the spies
--        NT:     ★★ Hebrews 11:31 (By faith the harlot Rahab perished not with them that believed not,
--                when she had received the spies with peace), ★★ James 2:25 (was not Rahab the harlot
--                justified by works, when she had received the messengers, and had sent them out another
--                way) — THREAD 4 (faith perfected by works)
--        Extras: none warranted
--        Tanakh: held in prose (her works ARE Joshua 2 — the hiding, the oath, the cord)
--   v.2-8,15-17,19-20,22-24 (the king''s search, the flax on the roof, the cord through the window, the
--          terms of the oath, the spies'' return) — the narrative frame; woven into the four threads,
--          no separate add forced.
--
-- Threads (slug — target libraries):
--   1. joshua-2-i-know-that-yahuah-is-elohim-in-heaven-above — Tanakh (Deuteronomy 4) [free]
--      (★★ the Canaanite harlot confesses the true Elohim — the same confession as Moses)
--   2. joshua-2-the-scarlet-line-in-the-window — Tanakh (Exodus 12, Joshua 6) [free]
--      (★ the scarlet cord = the Passover-blood sign; those under the sign are spared when the city falls)
--   3. joshua-2-rahab-married-into-the-line-of-the-messiah — NT (Matthew 1) + Tanakh (Ruth 4) [free]
--      (★★★ the daughter-of-the-nations absorbed into the seed of promise by MARRIAGE-covenant)
--   4. joshua-2-by-faith-the-harlot-rahab-justified-by-works — NT (Hebrews 11, James 2) [free]
--      (★★ faith perfected by works — the same living faith as Abraham)
--
-- Framing notes:
--   ★★ THE CONFESSION (THREAD 1): a Canaanite harlot, hearing of the Red Sea and the fall of Sihon and
--      Og, confesses what all Yashar''el is to know: *for Yahuah Elohaychem (the LORD your God), he is
--      Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11). It is Moses'' own confession on
--      her lips: *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim
--      (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). She is a
--      victim of the nations'' lie who turns to the true Elohim — but confession is the BEGINNING, not the
--      grafting (THREAD 3 carries the marriage that brings her in). Victims, not enemies.
--   ★ THE SCARLET LINE (THREAD 2): the sign of deliverance is a scarlet cord bound in the window —
--      *thou shalt bind this line of scarlet thread in the window... and all that are with thee in the
--      house* (2:18), *and she bound the scarlet line in the window* (2:21). It is the Passover blood on
--      the doorposts: *the blood shall be to you for a token upon the houses where ye are: and when I see
--      the blood, I will pass over you* (Exodus 12:13); the destroyer passes over the marked house
--      (Exodus 12:23). When Jericho falls, those under the scarlet sign are spared: *And Joshua saved
--      Rahab the harlot alive, and her father''s household* (Joshua 6:25). The blood-marked house delivered
--      from the judgment — the type the Messiah our Passover fills.
--   ★★★ MARRIED INTO THE LINE (THREAD 3): the directional non-symmetry of the seed of promise. Rahab does
--      not enter the covenant by her confession alone; she is brought INTO Yashar''el (Joshua 6:25) and
--      MARRIES Salmon — *Salmon begat Booz of Rachab* (Matthew 1:5) — and so stands in the line of David
--      and of the Messiah: *Salmon begat Boaz, and Boaz begat Obed* (Ruth 4:21). The daughter-of-the-
--      nations is absorbed into the seed of promise by marriage-covenant — paternal bloodline AND covenant
--      together, never confession alone. (Ruth the Moabitess follows the same pattern in the same genealogy.)
--   ★★ FAITH AND WORKS (THREAD 4): the NT names Rahab twice as the proof that living faith works. *By faith
--      the harlot Rahab perished not with them that believed not, when she had received the spies with
--      peace* (Hebrews 11:31); *Likewise also was not Rahab the harlot justified by works, when she had
--      received the messengers, and had sent them out another way?* (James 2:25). Her works ARE Joshua 2 —
--      the receiving, the hiding, the oath, the cord. James sets her beside Abraham: *Was not Abraham our
--      father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21) — the same
--      faith perfected by works (2:22), never faith-confession alone (2:24). Torah-obedient living faith.
--   VERSES WITH NO SEPARATE ADD: v.2-3 (the king''s message), v.5-8 (the flax, the ruse, the pursuit),
--      v.15-17 (the cord let-down, the oath''s terms), v.19-20,22-24 (the blood-guilt clause, the spies''
--      return). All narrative frame, woven into the four threads; none silently skipped.

CREATE TEMP VIEW _s344_jos02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): I know that Yahuah is Elohim in heaven above — the Canaanite''s confession
    ('canon','joshua',2,9,'canon','deuteronomy',4,39,'free',
      E'*Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). Rahab the harlot of Jericho already knows it: *I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us* (Joshua 2:9). A daughter of the nations, hearing what Yahuah did at the Red Sea, confesses the very thing Moses charged Yashar''el (Israel) to consider — that Yahuah alone is Elohim, and there is none else.'),
    ('canon','joshua',2,11,'canon','deuteronomy',4,39,'free',
      E'*Know therefore this day... that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). It is Moses'' confession word for word on a Canaanite''s lips: *for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11). The terror of the nations melts their hearts, but in Rahab it becomes confession of the one true Elohim — *in heaven above, and in earth beneath* — the same words, the same God, none else.'),

    -- THREAD 2 (★): The scarlet line in the window — the Passover-blood deliverance sign
    ('canon','joshua',2,18,'canon','exodus',12,13,'free',
      E'*And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt* (Exodus 12:13). The scarlet cord answers the Passover blood: *thou shalt bind this line of scarlet thread in the window which thou didst let us down by... and all thy father''s household, home unto thee* (Joshua 2:18). As the blood on the doorposts marked the houses Yahuah would pass over, so the scarlet line marks the one house in Jericho that judgment will spare.'),
    ('canon','joshua',2,18,'canon','exodus',12,23,'free',
      E'*For Yahuah (LORD) will pass through to smite the Egyptians; and when he seeth the blood upon the lintel, and on the two side posts, Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you* (Exodus 12:23). The destroyer passes over the blood-marked door; the falling city passes over the scarlet-marked window — *thou shalt bind this line of scarlet thread in the window* (Joshua 2:18). The sign on the house turns away the judgment that takes the city.'),
    ('canon','joshua',2,21,'canon','joshua',6,25,'free',
      E'*And Joshua saved Rahab the harlot alive, and her father''s household, and all that she had; and she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers* (Joshua 6:25). The cord is bound and the sign stands: *and she bound the scarlet line in the window* (Joshua 2:21). When Jericho is utterly destroyed, the one house under the scarlet sign is spared — Rahab and all with her brought out alive, as the Passover house was passed over when Egypt was smitten.'),

    -- THREAD 3 (★★★): Rahab married into the line of the Messiah — absorbed by marriage-covenant
    ('canon','joshua',2,14,'canon','matthew',1,5,'free',
      E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). The oath the spies swear — *Our life for yours... we will deal kindly and truly with thee* (Joshua 2:14) — opens into far more than rescue: Rahab is brought into Yashar''el (Israel) and married to Salmon, and so stands in the line of David and of the Messiah. The daughter-of-the-nations is absorbed into the seed of promise NOT by her confession alone but by marriage-covenant — paternal bloodline and covenant-word together.'),
    ('canon','joshua',2,14,'canon','ruth',4,21,'free',
      E'*And Salmon begat Boaz, and Boaz begat Obed* (Ruth 4:21). The same line that gathers Ruth the Moabitess gathers Rahab before her: the kindness sworn to her — *we will deal kindly and truly with thee* (Joshua 2:14) — brings her into the genealogy of David. Two daughters of the nations, Rahab and Ruth, grafted into the seed of promise by marriage into the line, not by confession standing alone.'),

    -- THREAD 4 (★★): By faith the harlot Rahab — justified by works
    ('canon','joshua',2,4,'canon','hebrews',11,31,'free',
      E'*By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31). Her faith is named in the receiving and hiding: *And the woman took the two men, and hid them* (Joshua 2:4). She is the one who *received the spies with peace* — the living faith that acts, which did not perish with unbelieving Jericho, set among the great cloud of witnesses beside Abraham, Moses, and the rest.'),
    ('canon','joshua',2,4,'canon','james',2,25,'free',
      E'*Likewise also was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25). James names her works as Joshua 2 itself: *And the woman took the two men, and hid them* (Joshua 2:4), then sent them out by the cord through the window. He sets her beside the patriarch — *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar?* (James 2:21) — the same faith perfected by works, never confession standing alone.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-2-i-know-that-yahuah-is-elohim-in-heaven-above',
       E'I know that Yahuah is Elohim — the harlot of Jericho confesses the true God',
       E'Before the spies are laid down, a Canaanite harlot speaks the confession of Yashar''el (Israel): *And she said unto the men, I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you* (Joshua 2:9). She has heard what Yahuah did: *For we have heard how Yahuah (LORD) dried up the water of the Red sea for you, when ye came out of Egypt; and what ye did unto the two kings of the Amorites... whom ye utterly destroyed* (2:10). And the report becomes confession of the one true Elohim: *And as soon as we had heard these things, our hearts did melt... for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (2:11). It is Moses'' own charge, word for word, on a daughter of the nations'' lips: *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39). Rahab is no enemy but a victim of the nations'' darkness who turns to the living God — yet her confession is the beginning, not the grafting; it is the marriage-covenant that will bring her in (see the line-of-Messiah thread). The terror that melts the heathen heart becomes, in her, the knowledge that Yahuah alone is Elohim, and there is none else.',
       sv.verse_id, ev.verse_id, 'free', 35025
  FROM _s344_jos02_lookup sv, _s344_jos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-2-the-scarlet-line-in-the-window',
       E'The scarlet line in the window — the Passover-blood sign of deliverance',
       E'The spies give Rahab a sign to mark her house for sparing: *Behold, when we come into the land, thou shalt bind this line of scarlet thread in the window which thou didst let us down by: and thou shalt bring thy father, and thy mother, and thy brethren, and all thy father''s household, home unto thee* (Joshua 2:18). Whoever stays within the marked house lives; whoever goes out bears his own blood (2:19). She binds it at once: *and she bound the scarlet line in the window* (2:21). This is the Passover blood on the doorposts. *And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13); *Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you* (Exodus 12:23). As the blood-marked houses of Egypt were passed over when judgment fell, so the scarlet-marked window of Jericho is passed over when the city falls: *And Joshua saved Rahab the harlot alive, and her father''s household... because she hid the messengers* (Joshua 6:25). The sign on the house turns away the judgment that takes the city — the deliverance-token the Messiah our Passover fills.',
       sv.verse_id, ev.verse_id, 'free', 35028
  FROM _s344_jos02_lookup sv, _s344_jos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=2 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-2-rahab-married-into-the-line-of-the-messiah',
       E'Rahab married into the line of the Messiah — absorbed by marriage-covenant',
       E'The oath the spies swear is more than rescue: *And the men answered her, Our life for yours, if ye utter not this our business. And it shall be, when Yahuah (LORD) hath given us the land, that we will deal kindly and truly with thee* (Joshua 2:14). Rahab is brought out of Jericho alive and *dwelleth in Yashar''el (Israel) even unto this day* (Joshua 6:25) — and there she is married. The genealogy of the Messiah names her: *And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5); *Salmon begat Boaz, and Boaz begat Obed* (Ruth 4:21). The daughter-of-the-nations enters the seed of promise — the line of David and of the Messiah — NOT by her confession standing alone, but by MARRIAGE-covenant into the paternal line. This is the directional non-symmetry of the promise: it is carried by bloodline AND covenant-word together, and Rahab is grafted in as she marries Salmon, just as Ruth the Moabitess after her is grafted in by marrying Boaz. Two women of the nations stand in the line of the King — absorbed into Yashar''el by marriage, not by mere belief.',
       sv.verse_id, ev.verse_id, 'free', 35031
  FROM _s344_jos02_lookup sv, _s344_jos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-2-by-faith-the-harlot-rahab-justified-by-works',
       E'By faith the harlot Rahab — justified by works, the living faith that acts',
       E'Rahab''s faith is not a bare confession; it acts. *And the woman took the two men, and hid them* (Joshua 2:4); she sent them out by the cord through the window and turned the pursuers aside (2:15-16). The NT names her twice for exactly this. The roll of faith counts her among Abraham and Moses: *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31) — her faith did not perish with unbelieving Jericho because it received and sheltered the messengers. And James makes her the second witness, beside the patriarch, that faith without works is dead: *Likewise also was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25), set right beside *Was not Abraham our father justified by works, when he had offered Isaac his son upon the altar? Seest thou how faith wrought with his works, and by works was faith made perfect?* (James 2:21-22). It is the same Torah-obedient living faith — *by works a man is justified, and not by faith only* (2:24). Rahab believed Yahuah is Elohim, and her belief took the form of obedient deeds; faith perfected by works.',
       sv.verse_id, ev.verse_id, 'free', 35034
  FROM _s344_jos02_lookup sv, _s344_jos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39) — Moses'' confession on a Canaanite''s lips; Rahab''s *I know that Yahuah (LORD) hath given you the land* (Joshua 2:9).'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-i-know-that-yahuah-is-elohim-in-heaven-above'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else* (Deuteronomy 4:39) — the very words of Rahab''s confession *for Yahuah Elohaychem (the LORD your God), he is Elohim (God) in heaven above, and in earth beneath* (Joshua 2:11).'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-i-know-that-yahuah-is-elohim-in-heaven-above'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the blood shall be to you for a token upon the houses... and when I see the blood, I will pass over you* (Exodus 12:13) — the scarlet line (Joshua 2:18) answers the Passover blood that marks the house for sparing.'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-the-scarlet-line-in-the-window'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*when he seeth the blood... Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in* (Exodus 12:23) — the destroyer passes over the blood-marked door as the falling city passes over the scarlet-marked window (Joshua 2:18).'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-the-scarlet-line-in-the-window'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Joshua saved Rahab the harlot alive, and her father''s household... because she hid the messengers* (Joshua 6:25) — the one house under the scarlet sign (Joshua 2:21) spared when Jericho is destroyed.'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-the-scarlet-line-in-the-window'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5) — the kindness sworn (Joshua 2:14) brings Rahab into Yashar''el, married to Salmon, into the line of the Messiah.'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-rahab-married-into-the-line-of-the-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *And Salmon begat Boaz, and Boaz begat Obed* (Ruth 4:21) — the same line gathers Ruth the Moabitess after Rahab; two daughters of the nations grafted in by marriage, not by confession alone (Joshua 2:14).'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-rahab-married-into-the-line-of-the-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31) — her faith named in the receiving and hiding (Joshua 2:4); set among Abraham and Moses.'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-by-faith-the-harlot-rahab-justified-by-works'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25) — her works ARE Joshua 2:4; set beside Abraham, faith perfected by works, never confession alone.'
  FROM cross_reference_threads t
  JOIN _s344_jos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s344_jos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-2-by-faith-the-harlot-rahab-justified-by-works'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_3.sql (Joshua 3) -----
--
-- Book/chapter : Joshua 3 — Yashar'el crosses the JORDAN at flood stage; the priests
--                bearing the ARK OF THE COVENANT go before the people; when the soles of
--                their feet rest in the brim of the water, *the waters which came down from
--                above stood and rose up upon an heap* (3:16) and the people pass over right
--                against Jericho; *the priests ... stood firm on dry ground in the midst of
--                Jordan, and all the Israelites passed over on dry ground* (3:17). *Hereby ye
--                shall know that the living Elohim (God) is among you* (3:10); *as I was with
--                Moses, so I will be with thee* (3:7).
-- Tag          : jos03
-- Session      : s344
-- Temp view    : _s344_jos03_lookup
-- Sort band    : base 35050, step 3  (35050, 35053, 35056)
--
-- FRAMING LENS (binding):
--   * 3:7-17 ★★ the Ark/Presence parting Jordan — the Ark of the covenant of Yahuah, Lord
--     of ALL THE EARTH (3:11,13), goes BEFORE the people; the priests stand firm in the
--     midst of Jordan on dry ground while all Yashar'el pass over. This is not the strength
--     of the man but the going-before of the Presence — the Formed Son who led Yashar'el
--     through the wilderness now leads them into the inheritance. *Hereby ye shall know that
--     the living Elohim (God) is among you* (3:10). LATERAL the memorial answer in Joshua 4:
--     *the waters of Jordan were cut off before the ark of the covenant of Yahuah* (4:7);
--     *Yahuah Elohaychem dried up the waters of Jordan ... as Yahuah Elohaychem did to the
--     Red sea* (4:23). The Psalm sings it: *The sea saw it, and fled: Jordan was driven back*
--     (Ps 114:3), *Tremble, thou earth, at the presence of Yahuah* (Ps 114:7). The Presence,
--     not the river, is the wonder.
--   * 3:13-17 ★★ the Red Sea counterpart / the passage-baptism type — Jordan parted at flood
--     stage is the deliberate twin of the Red Sea (Exod 14:21-22, *the waters were a wall*;
--     Exod 15:8, *the floods stood upright as an heap* — the same word "heap" the Jordan
--     waters *rose up upon*). The whole nation passes from the wilderness into the inheritance
--     through divided waters with the Presence going before — the same figure Paul names a
--     baptism: *all our fathers were under the cloud, and all passed through the sea; and were
--     all baptized unto Moses* (1 Cor 10:1-2). Wilderness behind, inheritance ahead, water
--     parted by the Presence — a passage-baptism.
--   * 3:7 ★ Joshua confirmed as Moses' successor by the SAME power — *This day will I begin
--     to magnify thee in the sight of all Yashar'el, that they may know that, as I was with
--     Moses, so I will be with thee* (3:7). The succession charge of Deut 31:7-8 (*Yahuah ...
--     he it is that doth go before thee*) and Josh 1:5 (*as I was with Moses, so I will be
--     with thee: I will not fail thee*) is now SEALED by a Red-Sea-grade miracle; *Yahuah
--     magnified Joshua ... and they feared him, as they feared Moses* (4:14). The same
--     abiding-presence proof repeats at the next succession: Elijah and then Elisha part the
--     same Jordan with the mantle (2 Kings 2:8,14). The office passes; the going-with of the
--     living Elohim does not.
--
-- ── Joshua 3 coverage ──
--   v.1-6  NT:     none warranted (the three-days, the 2000-cubit space, sanctify yourselves)
--          Extras: none warranted
--          Tanakh: (Josh 1:11 three days; carried implicitly — not separately threaded)
--   v.7    NT:     none warranted (the magnifying-as-Moses — carried in the successor thread)
--          Extras: none warranted
--          Tanakh: Josh 1:5, Deut 31:7, Deut 31:8, Josh 4:14, 2 Kings 2:8, 2 Kings 2:14
--   v.10   NT:     none warranted (the living Elohim among you — carried in the Ark thread)
--          Extras: none warranted
--          Tanakh: Ps 114:7 (tremble at the presence of Yahuah)
--   v.11-13 NT:    none warranted (Ark of the covenant of Yahuah of all the earth passeth over)
--          Extras: none warranted
--          Tanakh: Josh 4:7 (the waters cut off before the ark), Ps 114:3 (Jordan driven back)
--   v.14-17 NT:    1 Cor 10:1, 1 Cor 10:2 (passed through the sea / baptized unto Moses)
--          Extras: none warranted
--          Tanakh: Exod 14:21, Exod 14:22, Exod 15:8 (the Red Sea wall / floods an heap),
--                  Josh 4:18, Josh 4:23 (waters returned / dried up as the Red Sea)
--
-- ── Threads (3) ──
--   joshua-3-the-ark-of-the-covenant-parted-jordan-the-living-elohim-among-you  [free]
--       the Presence going before, priests standing firm, the living Elohim among them (v.7-17)
--       members: Tanakh Josh4:7, Josh4:23, Ps114:3, Ps114:7
--   joshua-3-the-jordan-driven-back-the-red-sea-counterpart-passage-baptism     [free]
--       Red Sea counterpart / the passage-baptism type (v.13-17)
--       members: Tanakh Exod14:21, Exod14:22, Exod15:8 ; NT 1Cor10:1, 1Cor10:2
--   joshua-3-as-i-was-with-moses-so-i-will-be-with-thee                         [free]
--       Joshua confirmed Moses' successor by the same power (v.7)
--       members: Tanakh Josh1:5, Deut31:7, Deut31:8, Josh4:14, 2Kings2:8, 2Kings2:14
--
-- All slugs prefixed joshua-3- and checked against EXISTING_SLUGS.txt (0 hits for the
-- joshua-3- prefix).
-- ───────────────────────────────────────────────────────────────────────────

CREATE TEMP VIEW _s344_jos03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- ── 3:11-13 the Ark parted Jordan / the living Elohim among you (LATERAL Tanakh) ──
    ('canon','joshua',3,11,'canon','joshua',4,7,'free',
      E'*Then ye shall answer them, That the waters of Jordan were cut off before the ark of the covenant of Yahuah (LORD); when it passed over Jordan, the waters of Jordan were cut off: and these stones shall be for a memorial unto the children of Yashar''el (Israel) for ever.* (Joshua 4:7). The memorial answer names exactly what Joshua 3 records — *Behold, the ark of the covenant of Yahuah (Lord) of all the earth passeth over before you into Jordan* (Joshua 3:11), and the waters *cut off before the ark.* The wonder is the Presence going before, not the river; the twelve stones stand so the seed will never forget who parted it.'),
    ('canon','joshua',3,13,'canon','psalms',114,3,'free',
      E'*The sea saw it, and fled: Jordan was driven back.* (Psalms 114:3). The Psalm binds the two crossings into one act of the Presence: the Red Sea fled and the Jordan was *driven back* — exactly Joshua 3:13, *the soles of the feet of the priests that bear the ark ... shall rest in the waters of Jordan, that the waters of Jordan shall be cut off ... and they shall stand upon an heap.* The river retreats before the Ark because it retreats before Yahuah Himself.'),
    ('canon','joshua',3,10,'canon','psalms',114,7,'free',
      E'*Tremble, thou earth, at the presence of Yahuah (Lord), at the presence of the Elohim (God) of Jacob;* (Psalms 114:7). Joshua said *Hereby ye shall know that the living Elohim (God) is among you* (Joshua 3:10) — and the Psalm gives the ground of the sign: the very earth trembles *at the presence of Yahuah.* The Jordan stands up on a heap not by Joshua''s word but because the living Elohim is in the midst of His people; the parted river is the proof of the Presence among them.'),
    ('canon','joshua',3,17,'canon','joshua',4,23,'free',
      E'*For Yahuah Elohaychem (the LORD your God) dried up the waters of Jordan from before you, until ye were passed over, as Yahuah Elohaychem (the LORD your God) did to the Red sea, which he dried up from before us, until we were gone over:* (Joshua 4:23). The narrative''s own commentary on Joshua 3:17 (*the priests ... stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground*): Yahuah *dried up the waters of Jordan ... as ... he did to the Red sea.* The chapter itself names the Red Sea as the pattern, the same hand parting both waters before His people.'),
    -- ── 3:13-17 the Red Sea counterpart / the passage-baptism type ──
    ('canon','joshua',3,16,'canon','exodus',14,21,'free',
      E'*And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* (Exodus 14:21). Forty years before the Jordan, the same Presence parted the Red Sea — Yahuah *made the sea dry land, and the waters were divided*; now *the waters which came down from above stood and rose up upon an heap ... and the people passed over right against Jericho* (Joshua 3:16). The waters of departure and the waters of entry are parted by one and the same hand.'),
    ('canon','joshua',3,17,'canon','exodus',14,22,'free',
      E'*And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* (Exodus 14:22). The Red Sea twin of Joshua 3:17 — there *upon the dry ground ... the waters were a wall*; here *the priests ... stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground.* Israel walks through divided water on dry ground twice: out of Egypt at the Sea, into the inheritance at the Jordan.'),
    ('canon','joshua',3,16,'canon','exodus',15,8,'free',
      E'*And with the blast of thy nostrils the waters were gathered together, the floods stood upright as an heap, and the depths were congealed in the heart of the sea.* (Exodus 15:8). The Song of the Sea uses the very word the Jordan crossing repeats: *the floods stood upright as an heap.* In Joshua 3:16 *the waters which came down from above stood and rose up upon an heap* — the same miracle, the same image of standing waters, sung at the Sea and re-enacted at the river.'),
    ('canon','joshua',3,14,'canon','1-corinthians',10,1,'free',
      E'*Moreover, brethren, I would not that ye should be ignorant, how that all our fathers were under the cloud, and all passed through the sea;* (1 Corinthians 10:1). Paul reads the crossing as a figure for all Yashar''el: *all ... passed through the sea.* Joshua 3:14 brings the whole people *to pass over Jordan* with *the priests bearing the ark of the covenant before the people* — the same nation-wide passage through parted waters with the Presence leading, the type Paul gathers up.'),
    ('canon','joshua',3,17,'canon','1-corinthians',10,2,'free',
      E'*And were all baptized unto Moses in the cloud and in the sea;* (1 Corinthians 10:2). Paul names the passage through the divided waters a baptism — *baptized unto Moses in the cloud and in the sea.* Joshua 3:17, *all the Israelites passed over on dry ground, until all the people were passed clean over Jordan,* is the same figure at the river: the whole nation brought through the waters out of the wilderness into the inheritance — a passage-baptism, the Presence going before.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ cross_references (successor thread) ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- ── 3:7 as I was with Moses, so I will be with thee (LATERAL Tanakh — the succession) ──
    ('canon','joshua',3,7,'canon','joshua',1,5,'free',
      E'*There shall not any man be able to stand before thee all the days of thy life: as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee.* (Joshua 1:5). Yahuah spoke this charge to Joshua at the threshold; now at the Jordan He makes good on it — *This day will I begin to magnify thee in the sight of all Yashar''el (Israel), that they may know that, as I was with Moses, so I will be with thee* (Joshua 3:7). The word *as I was with Moses, so I will be with thee* is the same in both places; the parted river is the proof of the promise.'),
    ('canon','joshua',3,7,'canon','deuteronomy',31,7,'free',
      E'*And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* (Deuteronomy 31:7). Moses commissioned Joshua *in the sight of all Yashar''el*; the magnifying of Joshua 3:7 happens *in the sight of all Yashar''el* too — the public commission ratified publicly, the successor brought to *cause them to inherit it* exactly as Moses charged.'),
    ('canon','joshua',3,7,'canon','deuteronomy',31,8,'free',
      E'*And Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee, neither forsake thee: fear not, neither be dismayed.* (Deuteronomy 31:8). The succession promise — *Yahuah ... he it is that doth go before thee* — is sealed at the Jordan, where the Ark of Yahuah *passeth over before you* (Joshua 3:11) and Joshua is magnified *as I was with Moses, so I will be with thee* (Joshua 3:7). The going-before of Yahuah is the substance the going-before of the Ark makes visible.'),
    ('canon','joshua',3,7,'canon','joshua',4,14,'free',
      E'*On that day Yahuah (LORD) magnified Joshua in the sight of all Yashar''el (Israel); and they feared him, as they feared Moses, all the days of his life.* (Joshua 4:14). The promise of Joshua 3:7 — *This day will I begin to magnify thee in the sight of all Yashar''el* — is reported fulfilled the moment the crossing is done: Yahuah *magnified Joshua ... and they feared him, as they feared Moses.* The same power that authenticated Moses now authenticates his successor.'),
    ('canon','joshua',3,7,'canon','2-kings',2,8,'free',
      E'*And Elijah took his mantle, and wrapped it together, and smote the waters, and they were divided hither and thither, so that they two went over on dry ground.* (2 Kings 2:8). The abiding-presence proof repeats at the same Jordan: Elijah parts the waters and crosses *on dry ground* — the sign Joshua received that *as I was with Moses, so I will be with thee* (Joshua 3:7) is given again, generations later, to mark the prophet Yahuah is with.'),
    ('canon','joshua',3,7,'canon','2-kings',2,14,'free',
      E'*And he took the mantle of Elijah that fell from him, and smote the waters, and said, Where is Yahuah Elohim (the LORD God) of Elijah? and when he also had smitten the waters, they parted hither and thither: and Elisha went over.* (2 Kings 2:14). When the parted Jordan opens again under Elisha, the sons of the prophets know *the spirit of Elijah doth rest on Elisha* (2 Kings 2:15) — the very logic of Joshua 3:7, where the parted Jordan declares *as I was with Moses, so I will be with thee.* The succession is sealed by the same waters drawing back before the same Presence.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================

-- Thread 1: the ark of the covenant parted Jordan / the living Elohim among you (v.7-17)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-3-the-ark-of-the-covenant-parted-jordan-the-living-elohim-among-you',
       E'The ark of the covenant parted Jordan — the living Elohim among you',
       E'Yashar''el comes to the Jordan at flood stage — *Jordan overfloweth all his banks all the time of harvest* (Joshua 3:15) — and the crossing is ordered entirely around the Ark: *When ye see the ark of the covenant of Yahuah Elohaychem (the LORD your God), and the priests the Levites bearing it, then ye shall remove from your place, and go after it* (Joshua 3:3). The Ark goes BEFORE the people, *Behold, the ark of the covenant of Yahuah (Lord) of all the earth passeth over before you into Jordan* (Joshua 3:11); and *as soon as the soles of the feet of the priests that bear the ark of Yahuah ... shall rest in the waters of Jordan ... the waters of Jordan shall be cut off* (Joshua 3:13).\n\nIt happens exactly so: *the waters which came down from above stood and rose up upon an heap very far from the city Adam ... and the people passed over right against Jericho. And the priests that bare the ark of the covenant of Yahuah (LORD) stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground* (Joshua 3:16-17). The wonder is not the river but the Presence going before — the same Formed Presence that led Yashar''el through the wilderness now leading them into the inheritance. Joshua names it: *Hereby ye shall know that the living Elohim (God) is among you* (Joshua 3:10).\n\nThe memorial of the next chapter says the same: *the waters of Jordan were cut off before the ark of the covenant of Yahuah ... these stones shall be for a memorial ... for ever* (Joshua 4:7), and *Yahuah Elohaychem (the LORD your God) dried up the waters of Jordan ... as Yahuah Elohaychem did to the Red sea* (Joshua 4:23). And the Psalm gives the ground of it all: *The sea saw it, and fled: Jordan was driven back* (Psalms 114:3) — *Tremble, thou earth, at the presence of Yahuah (Lord), at the presence of the Elohim (God) of Jacob* (Psalms 114:7). The Jordan stands up on a heap because the living Elohim is in the midst of His people.',
       sv.verse_id, ev.verse_id, 'free', 35050
  FROM _s344_jos03_lookup sv, _s344_jos03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: the Jordan driven back — the Red Sea counterpart / the passage-baptism (v.13-17)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-3-the-jordan-driven-back-the-red-sea-counterpart-passage-baptism',
       E'The Jordan driven back — the Red Sea counterpart, the passage-baptism',
       E'The Jordan crossing is the deliberate twin of the Red Sea. At the Sea, *Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided* (Exodus 14:21), and Yashar''el *went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22). The Song of the Sea sang it with the very word the river will repeat: *the floods stood upright as an heap* (Exodus 15:8).\n\nAt the Jordan it is re-enacted: *the waters which came down from above stood and rose up upon an heap ... and the people passed over right against Jericho. And the priests ... stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground* (Joshua 3:16-17). Israel walks through divided water on dry ground twice — out of Egypt at the Sea, into the inheritance at the Jordan — both times the waters parted by the Presence going before.\n\nPaul gathers the whole figure up and names it a baptism: *all our fathers were under the cloud, and all passed through the sea; and were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:1-2). Wilderness behind, inheritance ahead, the people brought *clean over Jordan* (Joshua 3:17) through parted waters with the Ark leading — a passage-baptism, the same act of the same hand from the Sea to the river.',
       sv.verse_id, ev.verse_id, 'free', 35053
  FROM _s344_jos03_lookup sv, _s344_jos03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: as I was with Moses, so I will be with thee (v.7)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-3-as-i-was-with-moses-so-i-will-be-with-thee',
       E'As I was with Moses, so I will be with thee',
       E'*And Yahuah (LORD) said unto Joshua, This day will I begin to magnify thee in the sight of all Yashar''el (Israel), that they may know that, as I was with Moses, so I will be with thee* (Joshua 3:7). The succession of Moses is not authenticated by Joshua''s strength but by a Red-Sea-grade miracle: the parted Jordan is the public proof that the same Presence now goes with the successor.\n\nThe promise was given before the crossing — *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5) — and stands on Moses'' own commissioning of Joshua *in the sight of all Yashar''el (Israel), Be strong and of a good courage ... thou shalt cause them to inherit it* (Deuteronomy 31:7), with its ground in Yahuah Himself: *Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee* (Deuteronomy 31:8). At the Jordan that going-before is made visible in the Ark passing over before the people, and the result is reported at once: *On that day Yahuah (LORD) magnified Joshua in the sight of all Yashar''el (Israel); and they feared him, as they feared Moses* (Joshua 4:14).\n\nThe same proof repeats at the same river generations later. Elijah *smote the waters, and they were divided ... so that they two went over on dry ground* (2 Kings 2:8); then Elisha takes the fallen mantle and *smote the waters ... and they parted hither and thither: and Elisha went over* (2 Kings 2:14) — and the sons of the prophets confess *the spirit of Elijah doth rest on Elisha* (2 Kings 2:15). The office passes from Moses to Joshua, from Elijah to Elisha; the parted waters declare each time that the going-with of the living Elohim does not.',
       sv.verse_id, ev.verse_id, 'free', 35056
  FROM _s344_jos03_lookup sv, _s344_jos03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================

-- ── Thread 1 members ──
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the waters of Jordan were cut off before the ark of the covenant of Yahuah ... a memorial ... for ever* (Joshua 4:7) — the memorial answer names the wonder of Joshua 3:11: the waters cut off before the Ark passing over.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-ark-of-the-covenant-parted-jordan-the-living-elohim-among-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The sea saw it, and fled: Jordan was driven back* (Psalms 114:3) — the Psalm binds Sea and Jordan into one act of the Presence, the river drawing back as in Joshua 3:13.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=114 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-ark-of-the-covenant-parted-jordan-the-living-elohim-among-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Tremble, thou earth, at the presence of Yahuah* (Psalms 114:7) — the ground of the sign Joshua named: *the living Elohim is among you* (Joshua 3:10); the river stands up because the Presence is in the midst.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=114 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-ark-of-the-covenant-parted-jordan-the-living-elohim-among-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah Elohaychem dried up the waters of Jordan ... as ... he did to the Red sea* (Joshua 4:23) — the chapter''s own commentary on Joshua 3:17, naming the Red Sea as the pattern of the parted Jordan.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-ark-of-the-covenant-parted-jordan-the-living-elohim-among-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ── Thread 2 members ──
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah caused the sea to go back ... and made the sea dry land, and the waters were divided* (Exodus 14:21) — the Red Sea parted forty years before the Jordan, the same hand on both waters (Joshua 3:16).'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-jordan-driven-back-the-red-sea-counterpart-passage-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22) — the Red Sea twin of Joshua 3:17, dry ground in the midst of divided water.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-jordan-driven-back-the-red-sea-counterpart-passage-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the floods stood upright as an heap* (Exodus 15:8) — the Song of the Sea uses the very word the Jordan repeats: the waters *rose up upon an heap* (Joshua 3:16).'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-jordan-driven-back-the-red-sea-counterpart-passage-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1) — Paul reads the nation-wide crossing as a figure; Joshua 3:14 brings *all the people* through with the Ark before them.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-jordan-driven-back-the-red-sea-counterpart-passage-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*and were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2) — the passage through divided waters named a baptism; Joshua 3:17 is the same figure at the river, all *passed clean over Jordan*.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-the-jordan-driven-back-the-red-sea-counterpart-passage-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ── Thread 3 members ──
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5) — the promise given before the crossing; Joshua 3:7 makes it good with the parted Jordan.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-as-i-was-with-moses-so-i-will-be-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Moses called unto Joshua ... in the sight of all Yashar''el ... thou shalt cause them to inherit it* (Deuteronomy 31:7) — the public commission ratified publicly at the Jordan (Joshua 3:7).'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-as-i-was-with-moses-so-i-will-be-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah, he it is that doth go before thee; he will be with thee, he will not fail thee* (Deuteronomy 31:8) — the going-before of Yahuah made visible in the Ark passing over before the people (Joshua 3:11).'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-as-i-was-with-moses-so-i-will-be-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*On that day Yahuah magnified Joshua in the sight of all Yashar''el; and they feared him, as they feared Moses* (Joshua 4:14) — the promise of 3:7 reported fulfilled the moment the crossing is done.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-as-i-was-with-moses-so-i-will-be-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Elijah ... smote the waters, and they were divided ... so that they two went over on dry ground* (2 Kings 2:8) — the abiding-presence proof at the same Jordan, the sign of 3:7 given again.'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-as-i-was-with-moses-so-i-will-be-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Elisha ... smote the waters ... and they parted hither and thither: and Elisha went over* (2 Kings 2:14) — the spirit of Elijah rests on Elisha; the same parted waters seal the next succession (Joshua 3:7).'
  FROM cross_reference_threads t
  JOIN _s344_jos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s344_jos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-3-as-i-was-with-moses-so-i-will-be-with-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_4.sql (Joshua 4) -----
-- Joshua 4 — the TWELVE STONES out of the midst of Jordan, one man of every tribe,
--   set up a MEMORIAL at Gilgal; the catechism of the children ("what mean these stones?");
--   the works of Yahuah declared that all the earth may know his mighty hand.
-- Tag: jos04   View: _s344_jos04_lookup   Sort band: 35075 step 3 (35075,35078,35081,...)
--
-- FRAME: the twelve stones = the twelve tribes, the whole people remembered in the crossing
--   (Reuben/Gad/half-Manasseh pass armed with their brethren, 4:12 — the two-house people one
--   in the crossing); the catechism "what mean these stones" is the same telling-the-children
--   pattern as the Passover (Exod 12:26-27), the Shema (Deut 6:7,20-21), and Asaph's psalm of
--   the generation to come (Ps 78:4-6); the crossing on the tenth day of the first month (4:19)
--   is the very day the Passover lamb was selected (Exod 12:3); the Jordan dried up as the Red
--   Sea was dried (4:23) — one mighty hand, declared that all the earth may know and fear Yahuah.
--
-- Joshua 4 coverage:
--   v.1-9,20 (twelve stones, one per tribe, dry ground)
--        NT:     1 Peter 2:5 (lively stones built a spiritual house — the people as the stones)
--        Extras: none warranted (no clean witness adds weight beyond the canon)
--        Tanakh: Joshua 3:12 (twelve men one per tribe), Joshua 3:17 (dry ground), Exodus 14:22
--                (Red Sea dry ground, waters a wall), Psalm 78:13 (waters made an heap)
--   v.6-7,21-22 (what mean these stones — the catechism of the children)
--        NT:     none warranted (the telling-the-children pattern is whole-Tanakh)
--        Extras: none warranted
--        Tanakh: Exodus 12:26-27 (Passover catechism — what mean ye by this service),
--                Deuteronomy 6:7 (teach them diligently unto thy children),
--                Deuteronomy 6:20-21 (when thy son asketh — what mean the testimonies),
--                Psalm 78:4 (shewing to the generation to come), Psalm 78:5-6
--   v.19 (tenth day of the first month — folded into thread 2 prose; same date Exod 12:3)
--        NT/Extras/Tanakh: Exodus 12:3 (selection of the lamb on the tenth day) — noted in prose
--   v.23-24 (all the earth may know the mighty hand; fear Yahuah for ever)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 14:21 (Yahuah dried the sea by a strong east wind),
--                Exodus 14:31 (the people feared Yahuah and believed),
--                Deuteronomy 6:24 (fear Yahuah for our good always, that he might preserve us)
--
-- Threads (slug — target libraries):
--   joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial  (Tanakh + NT)  free
--   joshua-4-what-mean-these-stones-the-catechism-of-the-children    (Tanakh)       free
--   joshua-4-that-all-the-earth-may-know-the-hand-of-yahuah          (Tanakh)       free
-- All members canon → every thread tier_required 'free'. No verse left without an add that
--   warranted one; vv.10-18 (the priests stood, the ark passed, Joshua magnified) are the
--   crossing-mechanics folded into the memorial threads' prose, no separate weave warranted.

CREATE TEMP VIEW _s344_jos04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================================
-- B. cross_references
-- =====================================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: twelve stones = twelve tribes, the whole people in the crossing
    ('canon','joshua',4,2,'canon','joshua',3,12,'free',
      E'*Now therefore take you twelve men out of the tribes of Yashar''el (Israel), out of every tribe a man* (Joshua 3:12). The command spoken before the crossing is now fulfilled in the gathering of the stones: *Take you twelve men out of the people, out of every tribe a man* (Joshua 4:2). Twelve men, one of each tribe, lift twelve stones — the number of the tribes of the children of Yashar''el (Israel), the whole people borne up in the memorial.'),
    ('canon','joshua',4,5,'canon','joshua',3,12,'free',
      E'*Now therefore take you twelve men out of the tribes of Yashar''el (Israel), out of every tribe a man* (Joshua 3:12). Joshua bids each man take up a stone *according unto the number of the tribes of the children of Yashar''el (Israel)* (Joshua 4:5) — the twelve stones are the twelve tribes, set up together that the one people not be forgotten.'),
    ('canon','joshua',4,8,'canon','joshua',3,17,'free',
      E'*And the priests that bare the ark of the covenant of Yahuah (LORD) stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground, until all the people were passed clean over Jordan* (Joshua 3:17). The twelve stones are lifted *out of the midst of Jordan* (Joshua 4:8) — out of the very riverbed laid bare, the place where the ark held back the waters and the whole nation crossed dry-shod.'),
    ('canon','joshua',4,8,'canon','exodus',14,22,'free',
      E'*And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22). The crossing of Jordan repeats the crossing of the sea: as the Red Sea stood as walls and Yashar''el walked the dry ground, so now twelve stones are taken *out of the midst of Jordan* (Joshua 4:8) where the waters were cut off — the same mighty deliverance for the same one people.'),
    ('canon','joshua',4,18,'canon','psalms',78,13,'free',
      E'*He divided the sea, and caused them to pass through; and he made the waters to stand as an heap* (Psalm 78:13). Asaph sings the sea; the same hand worked the river: when the priests came up, *the waters of Jordan returned unto their place, and flowed over all his banks* (Joshua 4:18) — the heap that stood now released, the wonder sealed for the generation to come.'),
    ('canon','joshua',4,7,'canon','1-peter',2,5,'free',
      E'*Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ)* (1 Peter 2:5). The twelve stones *shall be for a memorial unto the children of Yashar''el (Israel) for ever* (Joshua 4:7); the type runs forward — the living people themselves are the stones, the twelve tribes built up together as Yahuah''s house of remembrance.'),

    -- Thread 2: what mean these stones — the catechism of the children
    ('canon','joshua',4,6,'canon','exodus',12,26,'free',
      E'*And it shall come to pass, when your children shall say unto you, What mean ye by this service?* (Exodus 12:26). The stones are set *that when your children ask their fathers in time to come, saying, What mean ye by these stones?* (Joshua 4:6) — the very pattern of the Passover, the child''s question made the door of teaching, the works of Yahuah handed down house to house.'),
    ('canon','joshua',4,7,'canon','exodus',12,27,'free',
      E'*That ye shall say, It is the sacrifice of the LORD''S passover, who passed over the houses of the children of Yashar''el (Israel) in Egypt, when he smote the Egyptians, and delivered our houses* (Exodus 12:27). As the father answers the Passover-child with the deliverance, so the father answers the stone-child: *That the waters of Jordan were cut off before the ark of the covenant of Yahuah (LORD)* (Joshua 4:7) — the memorial is the answer the fathers are bound to give.'),
    ('canon','joshua',4,6,'canon','deuteronomy',6,7,'free',
      E'*And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up* (Deuteronomy 6:7). The stones make the teaching unavoidable: *when your children ask their fathers in time to come, saying, What mean ye by these stones?* (Joshua 4:6) — Torah commands the telling; the memorial provokes the question that opens it.'),
    ('canon','joshua',4,21,'canon','deuteronomy',6,20,'free',
      E'*And when thy son asketh thee in time to come, saying, What mean the testimonies, and the statutes, and the judgments, which Yahuah Eloheinu (the LORD our God) hath commanded you?* (Deuteronomy 6:20). The same words, the same hour: *When your children shall ask their fathers in time to come, saying, What mean these stones?* (Joshua 4:21) — the son''s question of the statutes and the son''s question of the stones are one catechism of the covenant.'),
    ('canon','joshua',4,22,'canon','deuteronomy',6,21,'free',
      E'*Then thou shalt say unto thy son, We were Pharaoh''s bondmen in Egypt; and Yahuah (LORD) brought us out of Egypt with a mighty hand* (Deuteronomy 6:21). The father''s answer is always the deliverance: *Then ye shall let your children know, saying, Yashar''el (Israel) came over this Jordan on dry land* (Joshua 4:22) — Egypt left behind, the land entered, the same mighty hand confessed to the next generation.'),
    ('canon','joshua',4,21,'canon','psalms',78,4,'free',
      E'*We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done* (Psalm 78:4). The stones at Gilgal are exactly this refusal to hide the works: *When your children shall ask their fathers in time to come, saying, What mean these stones?* (Joshua 4:21) — the memorial exists so the generation to come shall know.'),
    ('canon','joshua',4,22,'canon','psalms',78,5,'free',
      E'*For he established a testimony in Jacob, and appointed a law in Yashar''el (Israel), which he commanded our fathers, that they should make them known to their children* (Psalm 78:5). The fathers are commanded to make the works known; at Jordan they do it: *Then ye shall let your children know, saying, Yashar''el (Israel) came over this Jordan on dry land* (Joshua 4:22).'),
    ('canon','joshua',4,22,'canon','psalms',78,6,'free',
      E'*That the generation to come might know them, even the children which should be born; who should arise and declare them to their children* (Psalm 78:6). The chain of telling runs through the generations; the stones plant it in the land: *ye shall let your children know* (Joshua 4:22) — known, that they may rise and declare it onward.'),

    -- Thread 3: that all the earth may know the hand of Yahuah; fear him for ever
    ('canon','joshua',4,23,'canon','exodus',14,21,'free',
      E'*And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided* (Exodus 14:21). Joshua names the parallel outright: *as Yahuah Elohaychem (the LORD your God) did to the Red sea, which he dried up from before us, until we were gone over* (Joshua 4:23) — the river and the sea are one work of the one hand.'),
    ('canon','joshua',4,24,'canon','exodus',14,31,'free',
      E'*And Yashar''el (Israel) saw that great work which Yahuah (LORD) did upon the Egyptians: and the people feared Yahuah (LORD), and believed Yahuah (LORD), and his servant Moses* (Exodus 14:31). The sea-crossing ended in fear and faith; the river-crossing aims at the same: *that ye might fear Yahuah Elohaychem (the LORD your God) for ever* (Joshua 4:24) — the wonder works the awe that holds the covenant.'),
    ('canon','joshua',4,24,'canon','deuteronomy',6,24,'free',
      E'*And Yahuah (LORD) commanded us to do all these statutes, to fear Yahuah Eloheinu (the LORD our God), for our good always, that he might preserve us alive, as it is at this day* (Deuteronomy 6:24). The fear Joshua sets before Yashar''el is the Torah''s own end: *that ye might fear Yahuah Elohaychem (the LORD your God) for ever* (Joshua 4:24) — not dread but the awe that keeps the statutes and preserves the people alive.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================================
-- C. threads
-- =====================================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial',
       E'The twelve stones out of Jordan — the twelve tribes, the whole people, a memorial',
       E'*Take you twelve men out of the people, out of every tribe a man* (Joshua 4:2); *And Joshua said unto them, Pass over before the ark of Yahuah Elohaychem (the LORD your God) into the midst of Jordan, and take ye up every man of you a stone upon his shoulder, according unto the number of the tribes of the children of Yashar''el (Israel)* (Joshua 4:5). Twelve men, one of each tribe, lift twelve stones — and the count is the point: the stones are the tribes, the whole people borne up out of the riverbed together. The command was given before the crossing — *Now therefore take you twelve men out of the tribes of Yashar''el (Israel), out of every tribe a man* (Joshua 3:12) — and the stones come *out of the midst of Jordan* (Joshua 4:8), out of the dry ground where *the priests that bare the ark of the covenant of Yahuah (LORD) stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground* (Joshua 3:17). This is the sea-crossing renewed: *the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22), and Asaph sings it — *he made the waters to stand as an heap* (Psalm 78:13) — until, the crossing done, *the waters of Jordan returned unto their place, and flowed over all his banks* (Joshua 4:18). The two-house people cross as one: Reuben, Gad, and half Manasseh pass armed with their brethren (Joshua 4:12), and not one tribe is left out of the twelve. *These stones shall be for a memorial unto the children of Yashar''el (Israel) for ever* (Joshua 4:7) — and the type runs forward, for the living people are themselves the stones: *Ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5), the twelve tribes built up together as Yahuah''s house of remembrance.',
       sv.verse_id, ev.verse_id, 'free', 35075
  FROM _s344_jos04_lookup sv, _s344_jos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-4-what-mean-these-stones-the-catechism-of-the-children',
       E'What mean these stones? — the catechism of the next generation',
       E'The stones are not raised to be admired but to provoke a question. *That this may be a sign among you, that when your children ask their fathers in time to come, saying, What mean ye by these stones? Then ye shall answer them, That the waters of Jordan were cut off before the ark of the covenant of Yahuah (LORD)* (Joshua 4:6-7); and again, *When your children shall ask their fathers in time to come, saying, What mean these stones? Then ye shall let your children know, saying, Yashar''el (Israel) came over this Jordan on dry land* (Joshua 4:21-22). This is the Passover''s own pattern: *when your children shall say unto you, What mean ye by this service? That ye shall say, It is the sacrifice of the LORD''S passover, who passed over the houses of the children of Yashar''el (Israel) in Egypt* (Exodus 12:26-27) — and fittingly, the people crossed *on the tenth day of the first month* (Joshua 4:19), the very day the Passover lamb was selected (Exodus 12:3). It is the Shema''s charge: *thou shalt teach them diligently unto thy children* (Deuteronomy 6:7), and when *thy son asketh thee in time to come, saying, What mean the testimonies, and the statutes* (Deuteronomy 6:20), *then thou shalt say unto thy son, We were Pharaoh''s bondmen in Egypt; and Yahuah (LORD) brought us out of Egypt with a mighty hand* (Deuteronomy 6:21). The son''s question of the statutes and the son''s question of the stones are one catechism of the covenant, and the answer is always the deliverance. Asaph names the whole purpose: *We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD)... and his wonderful works that he hath done* (Psalm 78:4); *he commanded our fathers, that they should make them known to their children* (Psalm 78:5); *that the generation to come might know them, even the children which should be born; who should arise and declare them to their children* (Psalm 78:6). The stones plant that chain of telling in the land.',
       sv.verse_id, ev.verse_id, 'free', 35078
  FROM _s344_jos04_lookup sv, _s344_jos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=4 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-4-that-all-the-earth-may-know-the-hand-of-yahuah',
       E'That all the earth may know the hand of Yahuah — and that ye might fear him for ever',
       E'Joshua tells the children why the river dried: *For Yahuah Elohaychem (the LORD your God) dried up the waters of Jordan from before you, until ye were passed over, as Yahuah Elohaychem (the LORD your God) did to the Red sea, which he dried up from before us, until we were gone over* (Joshua 4:23). The river and the sea are one work of one hand — *Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided* (Exodus 14:21). And the wonder has a reach and an end: *That all the people of the earth might know the hand of Yahuah (LORD), that it is mighty: that ye might fear Yahuah Elohaychem (the LORD your God) for ever* (Joshua 4:24). The sea-crossing ended just so — *Yashar''el (Israel) saw that great work which Yahuah (LORD) did upon the Egyptians: and the people feared Yahuah (LORD), and believed Yahuah (LORD)* (Exodus 14:31) — and this is the very fear the Torah commands, not dread but the awe that keeps the covenant: *Yahuah (LORD) commanded us to do all these statutes, to fear Yahuah Eloheinu (the LORD our God), for our good always, that he might preserve us alive* (Deuteronomy 6:24). The works of Yahuah are declared to the nations and graven into the people''s fear, that the covenant may stand to the generations for ever.',
       sv.verse_id, ev.verse_id, 'free', 35081
  FROM _s344_jos04_lookup sv, _s344_jos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================================
-- D. thread_members
-- =====================================================================================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 3:12 — *take you twelve men out of the tribes of Yashar''el (Israel), out of every tribe a man*: the command behind the stones; the count is the tribes.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 3:12 again — each man lifts a stone *according unto the number of the tribes*: the twelve stones are the twelve tribes set up together.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Joshua 3:17 — *the priests... stood firm on dry ground... and all the Israelites passed over on dry ground*: the stones come out of that bared riverbed.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 14:22 — *the waters were a wall unto them on their right hand, and on their left*: the Jordan crossing renews the Red Sea, one people, one mighty deliverance.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 78:13 — *he made the waters to stand as an heap*: Asaph sings the same dividing hand that worked the river; when the priests came up the heap was released (Joshua 4:18).'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=18
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Peter 2:5 — *as lively stones, are built up a spiritual house*: the type runs forward, the living people themselves the stones, the twelve tribes built up as Yahuah''s house.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-twelve-stones-out-of-jordan-the-twelve-tribes-memorial'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 12:26 — *when your children shall say unto you, What mean ye by this service?*: the Passover catechism, the child''s question made the door of teaching.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 12:27 — *It is the sacrifice of the LORD''S passover, who passed over the houses*: the father''s answer is the deliverance, as the stone-child is answered with the cut-off waters.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 6:7 — *thou shalt teach them diligently unto thy children*: Torah commands the telling; the memorial provokes the question that opens it.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 6:20 — *when thy son asketh thee... What mean the testimonies, and the statutes*: the same words, the same hour; statutes and stones, one catechism.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 6:21 — *We were Pharaoh''s bondmen... and Yahuah brought us out of Egypt with a mighty hand*: the father''s answer is always the deliverance, matched by Joshua 4:22.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 78:4 — *We will not hide them from their children, shewing to the generation to come the praises of Yahuah*: the stones are this refusal to hide the works.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Psalm 78:5 — *he commanded our fathers, that they should make them known to their children*: the fathers'' bound duty, done at Jordan (Joshua 4:22).'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Psalm 78:6 — *That the generation to come might know them... who should arise and declare them to their children*: the chain of telling the stones plant in the land.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-what-mean-these-stones-the-catechism-of-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 14:21 — *Yahuah caused the sea to go back by a strong east wind... and the waters were divided*: the river and the sea are one work of one hand (Joshua 4:23).'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-that-all-the-earth-may-know-the-hand-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 14:31 — *the people feared Yahuah, and believed Yahuah*: the sea-crossing ended in the fear the river-crossing aims at (Joshua 4:24).'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-that-all-the-earth-may-know-the-hand-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 6:24 — *to fear Yahuah Eloheinu... for our good always, that he might preserve us alive*: the fear Joshua sets before Yashar''el is Torah''s own end, the awe that keeps the covenant.'
  FROM cross_reference_threads t
  JOIN _s344_jos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s344_jos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-4-that-all-the-earth-may-know-the-hand-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_5.sql (Joshua 5) -----
-- Chapter: Joshua 5 — circumcision at Gilgal, the Passover kept entering the land,
--          the manna ceases, the CAPTAIN OF THE HOST OF YAHUAH (the Formed Son).
-- Tag: jos05   View: _s344_jos05_lookup   Sort band: 35100 step 3 (35100..35112)
--
-- Joshua 5 coverage:
--   v.2-3,7  (circumcise again)  NT: Col 2:11 circumcision-made-without-hands; Tanakh: Gen 17:10-11 the sign, Deut 30:6 circumcise the heart; Extras: none warranted
--   v.9  (reproach of Egypt rolled away / Gilgal)  Tanakh: Deut 30:6 (folded into circumcision thread); Extras/NT: none warranted (covenant-sign restored, not a type to weave forward separately)
--   v.10  (kept the passover, fourteenth day at even)  NT: 1 Cor 5:7-8 Messiah our passover, keep the feast; Tanakh: Exod 12:6/18, Lev 23:5; Extras: none warranted
--   v.11-12  (old corn of the land, manna ceased)  NT: John 6:31-32,48-51 the true bread / living bread; Tanakh: Exod 16:35 manna forty years; Extras: none warranted
--   v.13-15  (the man with sword drawn, captain of the host, fell and worshipped, holy ground)
--        NT: Rev 19:11-14 the Word on the white horse with heaven's armies; Rev 19:10 & 22:9 the created angel REFUSES worship (proving the Captain who RECEIVES it is Yahuah the Formed, not an angel)
--        Tanakh: Exod 3:2-5 the Angel of Yahuah at the bush, holy ground / put off thy shoes; Dan 8:11,25 the Prince of the host / Prince of princes; Zech 1:8-11 the man among the myrtle trees who walks the earth
--        Extras: none warranted (named in-prose if any; clean canon witnesses suffice)
--
-- Threads (5):
--   1 joshua-5-the-covenant-sign-circumcised-again-at-gilgal            [free] Tanakh(Gen,Deut) + NT(Col)
--   2 joshua-5-the-passover-kept-on-the-fourteenth-day-entering-the-land [free] Tanakh(Exod,Lev) + NT(1Cor)
--   3 joshua-5-the-manna-ceased-when-they-ate-the-fruit-of-the-land     [free] Tanakh(Exod) + NT(John)
--   4 joshua-5-the-captain-of-the-host-of-yahuah-the-formed-son         [free] Tanakh(Exod,Dan,Zech)
--   5 joshua-5-he-received-the-worship-a-created-angel-refuses          [free] NT(Rev)
--
-- Framework note (Captain of the host): framed strictly as the FORMED SON, the Angel of Yahuah
-- who bears the Name. The drawn-sword man RECEIVES worship and calls the ground HOLY exactly as
-- the Angel at the bush did (Exod 3:2-5) — and the very same book of Revelation shows a created
-- angel REFUSING that worship twice (19:10; 22:9), so the One who accepts it here is Yahuah-the-
-- Formed, NOT a mere created angel, NOT co-equal-trinity, NOT Arian. He is the commander of
-- heaven's armies (Rev 19:11-14), the Prince of the host (Dan 8:11,25), Yahuah who has a Father.

CREATE TEMP VIEW _s344_jos05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the covenant sign circumcised again at Gilgal
    ('canon','joshua',5,2,'canon','genesis',17,10,'free',
      E'*This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised* (Genesis 17:10). When Yahuah (LORD) tells Joshua *circumcise again the children of Yashar''el (Israel) the second time* (Joshua 5:2), He is renewing the very sign He cut with Abraham — the covenant token of Genesis 17, never a new religion, carried by the seed before they may inherit the land.'),
    ('canon','joshua',5,3,'canon','genesis',17,11,'free',
      E'*And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you* (Genesis 17:11). Joshua *circumcised the children of Yashar''el (Israel) at the hill of the foreskins* (Joshua 5:3): the flesh-sign Yahuah commanded Abraham is restored to the wilderness generation, the token of the everlasting covenant marked in the seed.'),
    ('canon','joshua',5,7,'canon','genesis',17,14,'free',
      E'*And the uncircumcised man child whose flesh of his foreskin is not circumcised, that soul shall be cut off from his people; he hath broken my covenant* (Genesis 17:14). The wilderness-born *were uncircumcised* (Joshua 5:7) and so unfit to inherit; Joshua restores the sign so the seed is not cut off but brought in — the covenant kept, never the covenant abolished.'),
    ('canon','joshua',5,9,'canon','deuteronomy',30,6,'free',
      E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deuteronomy 30:6). When Yahuah says *This day have I rolled away the reproach of Egypt from off you* (Joshua 5:9) and names the place Gilgal (rolling away), the outward sign cut in the flesh points to the inward circumcision of the heart promised for the same restored seed — the Torah loved, not loosed.'),
    ('canon','joshua',5,3,'canon','colossians',2,11,'free',
      E'*In whom also ye are circumcised with the circumcision made without hands, in putting off the body of the sins of the flesh by the circumcision of Messiah (Christ)* (Colossians 2:11). Joshua''s knife *at the hill of the foreskins* (Joshua 5:3) is the outward token of the covenant; its forward fullness is the circumcision made without hands worked in the same covenant people — the sign deepened to the heart, the seed kept in, never a different people grafted in by confession.'),

    -- Thread 2: the Passover kept on the fourteenth day, entering the land
    ('canon','joshua',5,10,'canon','exodus',12,6,'free',
      E'*And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6). The first Passover in Egypt set the appointed time; *the children of Yashar''el (Israel)... kept the passover on the fourteenth day of the month at even in the plains of Jericho* (Joshua 5:10) — the same feast on the same day, carried unbroken across the Jordan into the inheritance.'),
    ('canon','joshua',5,10,'canon','leviticus',23,5,'free',
      E'*In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5). Yahuah''s calendar of *the feasts of Yahuah (LORD)... holy convocations* (Leviticus 23:2) is not Egypt-bound nor abolished at the border; Yashar''el *kept the passover on the fourteenth day of the month at even* (Joshua 5:10) entering Canaan — the appointed time of Leviticus 23 stands as they take the land.'),
    ('canon','joshua',5,10,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The Passover *kept... on the fourteenth day of the month at even in the plains of Jericho* (Joshua 5:10) is the same feast whose Lamb the New Testament names; the appointed time is filled by Messiah, and the very next breath says *let us keep the feast* (1 Corinthians 5:8) — kept, not cancelled.'),

    -- Thread 3: the manna ceased when they ate the fruit of the land
    ('canon','joshua',5,12,'canon','exodus',16,35,'free',
      E'*And the children of Yashar''el (Israel) did eat manna forty years, until they came to a land inhabited; they did eat manna, until they came unto the borders of the land of Canaan* (Exodus 16:35). The wilderness bread was always bounded by the inheritance; *the manna ceased on the morrow after they had eaten of the old corn of the land... but they did eat of the fruit of the land of Canaan* (Joshua 5:12) — the provision ends exactly where the promise begins.'),
    ('canon','joshua',5,11,'canon','exodus',16,4,'free',
      E'*Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no* (Exodus 16:4). The manna was a daily proving in the way; when they *did eat of the old corn of the land... unleavened cakes, and parched corn* (Joshua 5:11), the testing-bread of the wilderness gives way to the bread of the inheritance.'),
    ('canon','joshua',5,12,'canon','john',6,51,'free',
      E'*I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever... not as your fathers did eat manna, and are dead* (John 6:51,58). When *the manna ceased* (Joshua 5:12) the wilderness sign closes, pointing forward to the true bread the Formed Son names — the manna a shadow of *the living bread which came down from heaven*, the inheritance-life it could only foretell.'),

    -- Thread 4: the Captain of the host of Yahuah — the Formed Son
    ('canon','joshua',5,15,'canon','exodus',3,5,'free',
      E'*And he said, Draw not nigh hither: put off thy shoes from off thy feet, for the place whereon thou standest is holy ground* (Exodus 3:5). The Captain''s command to Joshua — *Loose thy shoe from off thy foot; for the place whereon thou standest is holy* (Joshua 5:15) — is word-for-word the Angel of Yahuah at the burning bush. The same Formed Son who met Moses, who bears the Name, now stands before Jericho; common ground becomes holy because He is there.'),
    ('canon','joshua',5,13,'canon','exodus',3,2,'free',
      E'*And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush* (Exodus 3:2). The *man over against him with his sword drawn in his hand* (Joshua 5:13) is that same Angel of Yahuah — the visible Glory, the Formed Son drawn from the Formless Father — appearing now as a warrior with drawn sword to lead Yashar''el (Israel) into the land.'),
    ('canon','joshua',5,14,'canon','daniel',8,11,'free',
      E'*Yea, he magnified himself even to the prince of the host, and by him the daily sacrifice was taken away* (Daniel 8:11). The One who says *as captain of the host of Yahuah (LORD) am I now come* (Joshua 5:14) is the Prince of the host of Daniel''s vision — the commander over the armies of heaven, the same Formed Son whom the little horn dares to magnify itself against.'),
    ('canon','joshua',5,14,'canon','daniel',8,25,'free',
      E'*he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:25). The *captain of the host of Yahuah (LORD)* (Joshua 5:14) is the Prince of princes — the One who fights for His people; the proud king who lifts himself against Him is *broken without hand*, just as Jericho''s wall falls without a sword of Yashar''el.'),
    ('canon','joshua',5,13,'canon','zechariah',1,8,'free',
      E'*I saw by night, and behold a man riding upon a red horse, and he stood among the myrtle trees... and they answered the angel of Yahuah (LORD)* (Zechariah 1:8,11). As Joshua sees *a man... with his sword drawn* (Joshua 5:13), so Zechariah sees the man on the red horse, the Angel of Yahuah who walks the earth for His people — the same Formed One who comes as captain to fight for Yashar''el (Israel).'),

    -- Thread 5: He received the worship a created angel refuses
    ('canon','joshua',5,14,'canon','revelation',19,10,'free',
      E'*And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant... worship Elohim (God)* (Revelation 19:10). When Joshua *fell on his face to the earth, and did worship* (Joshua 5:14), the Captain does NOT forbid it — yet a true created angel REFUSES this very worship and points away to Elohim. The Captain who receives it is therefore Yahuah the Formed, not a fellowservant angel.'),
    ('canon','joshua',5,14,'canon','revelation',22,9,'free',
      E'*Then saith he unto me, See thou do it not: for I am thy fellowservant... worship Elohim (God)* (Revelation 22:9). Twice in Revelation an angel forbids John''s worship; but the Captain lets Joshua *fall on his face to the earth, and... worship* (Joshua 5:14) and then calls the ground holy — He receives what no created angel will, proving He is the Formed Son, Yahuah who has a Father, not a mere angel.'),
    ('canon','joshua',5,13,'canon','revelation',19,11,'free',
      E'*And I saw heaven opened, and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war... And the armies which were in heaven followed him* (Revelation 19:11,14). The *man... with his sword drawn in his hand* who comes *as captain of the host of Yahuah (LORD)* (Joshua 5:13-14) is the same warrior-Word leading heaven''s armies — the drawn sword at Jericho is the sharp sword out of His mouth, the commander of the host of Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-5-the-covenant-sign-circumcised-again-at-gilgal',
  E'The Covenant Sign Circumcised Again at Gilgal',
  E'Before Yashar''el (Israel) may inherit the land, Yahuah (LORD) commands Joshua: *Make thee sharp knives, and circumcise again the children of Yashar''el (Israel) the second time* (Joshua 5:2), and Joshua *circumcised the children of Yashar''el (Israel) at the hill of the foreskins* (Joshua 5:3). This is not a new rite but the renewal of the sign cut with Abraham: *This is my covenant, which ye shall keep... Every man child among you shall be circumcised* (Genesis 17:10), *a token of the covenant betwixt me and you* (Genesis 17:11). The wilderness-born *were uncircumcised* (Joshua 5:7), and the uncircumcised *soul shall be cut off from his people; he hath broken my covenant* (Genesis 17:14) — so the sign must be restored or the seed cannot enter. Then Yahuah says *This day have I rolled away the reproach of Egypt from off you* (Joshua 5:9), naming the place Gilgal, the rolling-away. The flesh-sign points inward to the promise *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God)* (Deuteronomy 30:6), and forward to *the circumcision made without hands... by the circumcision of Messiah (Christ)* (Colossians 2:11) — the same covenant people, the same seed, the Torah loved and kept, never abolished.',
  sv.verse_id, ev.verse_id, 'free', 35100
  FROM _s344_jos05_lookup sv, _s344_jos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=5 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-5-the-passover-kept-on-the-fourteenth-day-entering-the-land',
  E'The Passover Kept on the Fourteenth Day, Entering the Land',
  E'At Gilgal *the children of Yashar''el (Israel) encamped... and kept the passover on the fourteenth day of the month at even in the plains of Jericho* (Joshua 5:10). The appointed time is carried unbroken into the inheritance: it is the very feast first kept in Egypt — *ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6) — and the very feast written into Yahuah''s calendar, *In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5), one of *the feasts of Yahuah (LORD)... holy convocations* (Leviticus 23:2). The feast does not stop at the border of Canaan; it stands as Yashar''el takes the land. Its forward fullness is named plainly: *even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — and the apostle''s conclusion is not abolition but observance: *let us keep the feast* (1 Corinthians 5:8). The appointed time is filled, never erased.',
  sv.verse_id, ev.verse_id, 'free', 35103
  FROM _s344_jos05_lookup sv, _s344_jos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-5-the-manna-ceased-when-they-ate-the-fruit-of-the-land',
  E'The Manna Ceased When They Ate the Fruit of the Land',
  E'*And they did eat of the old corn of the land on the morrow after the passover, unleavened cakes, and parched corn... And the manna ceased on the morrow after they had eaten of the old corn of the land; neither had the children of Yashar''el (Israel) manna any more; but they did eat of the fruit of the land of Canaan* (Joshua 5:11-12). The wilderness provision ends exactly where the inheritance begins — and Yahuah had bounded it so from the first: *the children of Yashar''el (Israel) did eat manna forty years... until they came unto the borders of the land of Canaan* (Exodus 16:35). The manna was always a daily proving — *that I may prove them, whether they will walk in my law, or no* (Exodus 16:4) — bread for the way, not for the home. Its forward shadow is the bread the Formed Son names: *I am the living bread which came down from heaven... not as your fathers did eat manna, and are dead* (John 6:51,58). The manna ceasing as the fruit of the land begins foretells the wilderness shadow giving way to the substance — the inheritance-life it could only point toward.',
  sv.verse_id, ev.verse_id, 'free', 35106
  FROM _s344_jos05_lookup sv, _s344_jos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-5-the-captain-of-the-host-of-yahuah-the-formed-son',
  E'The Captain of the Host of Yahuah — the Formed Son',
  E'*And it came to pass, when Joshua was by Jericho... behold, there stood a man over against him with his sword drawn in his hand... And he said, Nay; but as captain of the host of Yahuah (LORD) am I now come* (Joshua 5:13-14). This is no created angel but the Formed Son — the Angel of Yahuah who bears the Name, the visible Glory drawn from the Formless Father. The proof is in His own words: *Loose thy shoe from off thy foot; for the place whereon thou standest is holy* (Joshua 5:15) — word-for-word what the Angel spoke to Moses, *put off thy shoes from off thy feet, for the place whereon thou standest is holy ground* (Exodus 3:5), the same One who *appeared unto him in a flame of fire out of the midst of a bush* (Exodus 3:2). He is the commander over heaven''s armies — *the prince of the host* (Daniel 8:11), *the Prince of princes* (Daniel 8:25) against whom the proud king is *broken without hand* — and the warrior on the red horse who walks the earth for His people (Zechariah 1:8). The drawn sword at Jericho is the sword of Yahuah''s captain: He fights for Yashar''el (Israel), the wall falls without their hand, and the ground is holy because He stands on it. He is Yahuah, and He has a Father.',
  sv.verse_id, ev.verse_id, 'free', 35109
  FROM _s344_jos05_lookup sv, _s344_jos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=5 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-5-he-received-the-worship-a-created-angel-refuses',
  E'He Received the Worship a Created Angel Refuses',
  E'*And Joshua fell on his face to the earth, and did worship, and said unto him, What saith my lord unto his servant?* (Joshua 5:14). The Captain does not forbid this worship — He accepts it and then calls the very ground holy. Set this beside what a true created angel does when worship is offered: *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant... worship Elohim (God)* (Revelation 19:10), and again *See thou do it not: for I am thy fellowservant... worship Elohim (God)* (Revelation 22:9). Twice an angel refuses and points away to Elohim. The Captain who receives Joshua''s worship is therefore not a fellowservant angel but the Formed Son, Yahuah who has a Father. And He is shown again leading the armies of heaven: *and behold a white horse; and he that sat upon him was called Faithful and True, and in righteousness he doth judge and make war... And the armies which were in heaven followed him* (Revelation 19:11,14). The drawn sword by Jericho is the sharp sword out of His mouth — the captain of the host of Yahuah, worshipped because He is Yahuah the Formed, never a mere angel, never co-equal-trinity, never a created being.',
  sv.verse_id, ev.verse_id, 'free', 35112
  FROM _s344_jos05_lookup sv, _s344_jos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 17:10 — *Every man child among you shall be circumcised*: the covenant Yahuah cut with Abraham, the sign now renewed before the inheritance.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-covenant-sign-circumcised-again-at-gilgal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 17:11 — *a token of the covenant betwixt me and you*: the flesh-sign Joshua restores at the hill of the foreskins.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-covenant-sign-circumcised-again-at-gilgal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 17:14 — the uncircumcised *soul shall be cut off*: why the wilderness-born must be circumcised before they may inherit.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-covenant-sign-circumcised-again-at-gilgal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 30:6 — *circumcise thine heart, and the heart of thy seed*: the inward promise behind the reproach rolled away at Gilgal.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-covenant-sign-circumcised-again-at-gilgal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Colossians 2:11 — *the circumcision made without hands... of Messiah (Christ)*: the outward sign deepened to the heart, the same seed kept in.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-covenant-sign-circumcised-again-at-gilgal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 12:6 — *the fourteenth day... kill it in the evening*: the first Passover in Egypt, the same day kept now in the plains of Jericho.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-passover-kept-on-the-fourteenth-day-entering-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 23:5 — *In the fourteenth day of the first month at even is the LORD''S passover*: the appointed time of Yahuah''s calendar, standing as they enter the land.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-passover-kept-on-the-fourteenth-day-entering-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 5:7 — *Messiah (Christ) our passover is sacrificed for us*: the feast filled by the Lamb, and *let us keep the feast* (5:8) — kept, not cancelled.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-passover-kept-on-the-fourteenth-day-entering-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 16:35 — manna *until they came unto the borders of the land of Canaan*: the wilderness bread always bounded by the inheritance.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-manna-ceased-when-they-ate-the-fruit-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 16:4 — bread from heaven *that I may prove them, whether they will walk in my law*: the manna a daily proving in the way, now ended at the old corn of the land.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-manna-ceased-when-they-ate-the-fruit-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 6:51 — *I am the living bread... not as your fathers did eat manna, and are dead*: the manna a shadow of the Formed Son, ceasing as the substance begins.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-manna-ceased-when-they-ate-the-fruit-of-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 3:5 — *put off thy shoes... the place whereon thou standest is holy ground*: the Captain''s words to Joshua are the Angel''s words to Moses — the same Formed Son.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-captain-of-the-host-of-yahuah-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 3:2 — *the angel of Yahuah (LORD) appeared... in a flame of fire*: the drawn-sword man is that same Angel of Yahuah, the visible Glory.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-captain-of-the-host-of-yahuah-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Daniel 8:11 — *the prince of the host*: the Captain of the host of Yahuah is the commander over heaven''s armies in Daniel''s vision.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-captain-of-the-host-of-yahuah-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Daniel 8:25 — *the Prince of princes... broken without hand*: the Captain Yashar''el follows, against whom the proud king cannot stand.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-captain-of-the-host-of-yahuah-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Zechariah 1:8 — the man on the red horse among the myrtle trees: the Angel of Yahuah who walks the earth for His people, the same Formed warrior who comes as captain.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-the-captain-of-the-host-of-yahuah-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Revelation 19:10 — *See thou do it not: I am thy fellowservant... worship Elohim (God)*: a created angel REFUSES the worship the Captain receives.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-he-received-the-worship-a-created-angel-refuses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Revelation 22:9 — again *See thou do it not: for I am thy fellowservant... worship Elohim (God)*: twice an angel forbids it, proving the Captain who accepts it is Yahuah the Formed.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-he-received-the-worship-a-created-angel-refuses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Revelation 19:11 — *a white horse... Faithful and True... and the armies which were in heaven followed him*: the same captain leading the host of Yahuah, the drawn sword become the sword of His mouth.'
  FROM cross_reference_threads t
  JOIN _s344_jos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s344_jos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-5-he-received-the-worship-a-created-angel-refuses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_6.sql (Joshua 6) -----
--
-- Chapter: Joshua 6 (JERICHO — the seven priests, seven trumpets, seven days; the wall
--   falls flat at the shout; Rahab and her house spared; the devoted city and the curse
--   on rebuilding Jericho).
-- Tag: jos06   View: _s344_jos06_lookup   Sort band: 35125, +3 (35125,35128,35131)
-- Session: s344
--
-- Joshua 6 coverage:
--   v.1-5  (the appointed means: 7 priests / 7 trumpets / 7 days / the shout)
--          NT:     Hebrews 11:30 (by faith the walls fell, compassed seven days);
--                  2 Corinthians 10:4 (weapons not carnal but mighty through Elohim)
--          Extras: none warranted (no clean parallel witness in the restored library)
--          Tanakh: Numbers 10:9 (blow an alarm and be saved from your enemies);
--                  also Revelation 8:6 the seven-trumpet pattern fulfilled forward
--   v.16,20 (the great shout; the wall fell down flat; they took the city)
--          NT:     Hebrews 11:30; 2 Corinthians 10:4; Revelation 8:6 (seven trumpets sound)
--          Extras: none warranted
--          Tanakh: Numbers 10:9
--   v.17,22-25 (Rahab the harlot and all her house spared; she dwelleth in Yashar'el)
--          NT:     Matthew 1:5 (Salmon begat Booz of Rachab — into the Messianic line);
--                  Hebrews 11:31 (by faith Rahab perished not); James 2:25 (Rahab justified by works)
--          Extras: none warranted
--          Tanakh: Joshua 2:18 (the scarlet line in the window — the household sign)
--   v.18-19,26 (the accursed/devoted thing; silver and gold into the treasury;
--          the curse on whoever rebuilds Jericho)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 16:34 (Hiel the Beth-elite — the curse fulfilled in his sons)
--
-- Threads (3):
--   joshua-6-the-walls-fall-by-yahuahs-means-the-trumpets-and-the-shout
--       [canon Tanakh + NT] — Heb 11:30, 2 Cor 10:4, Num 10:9, Rev 8:6
--   joshua-6-rahab-and-her-house-spared-and-brought-into-yasharel
--       [canon Tanakh + NT] — Josh 2:18, Matt 1:5, Heb 11:31, James 2:25
--   joshua-6-the-devoted-city-and-the-curse-on-rebuilding-jericho
--       [canon Tanakh] — 1 Kings 16:34
--
-- Framework notes: the victory is by Yahuah's appointed means (the Ark, the priests, the
--   trumpets, the seventh-day completion, the shout) — NOT by siege-engines / carnal weapons;
--   read forward to faith (Heb 11:30) and to warfare-not-after-the-flesh (2 Cor 10:4) and the
--   seventh-trumpet ingathering (Rev 8). Rahab = the faith that delivers a HOUSEHOLD by a sign
--   (the scarlet line), brought INTO Yashar'el (Israel) and into the paternal Messianic line
--   (Matt 1:5) — inclusion by the covenant sign + the living faith that hides the messengers
--   (Heb 11:31 / James 2:25, faith perfected by works), not lineage-alone nor confession-alone.
--   The herem/devoted city and the curse on rebuilding (1 Kings 16:34) — Yahuah's word stands.

CREATE TEMP VIEW _s344_jos06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the walls fall by Yahuah's means — the trumpets and the shout
    ('canon','joshua',6,4,'canon','hebrews',11,30,'free',
      E'*By faith the walls of Jericho fell down, after they were compassed about seven days* (Hebrews 11:30). The chapter''s appointed means — *seven priests shall bear before the ark seven trumpets of rams'' horns: and the seventh day ye shall compass the city seven times* (Joshua 6:4) — is read forward as the victory of FAITH: the wall came down not by the engines of war but by the trust that obeyed Yahuah''s (the LORD''s) strange order to the seventh-day completion.'),
    ('canon','joshua',6,5,'canon','2-corinthians',10,4,'free',
      E'*(For the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds;)* (2 Corinthians 10:4). When *the wall of the city shall fall down flat* (Joshua 6:5) at the long blast and the great shout, the lesson is named: the stronghold falls by Yahuah''s (the LORD''s) means — the Ark, the trumpets, the shout — not by carnal might.'),
    ('canon','joshua',6,4,'canon','numbers',10,9,'free',
      E'*And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). The trumpet of Jericho — *the priests shall blow with the trumpets* (Joshua 6:4) — is the very alarm Yahuah (the LORD) commanded through Moses: blow, be remembered, and be saved by His hand.'),
    ('canon','joshua',6,20,'canon','numbers',10,9,'free',
      E'*And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets... and ye shall be saved from your enemies* (Numbers 10:9). *So the people shouted when the priests blew with the trumpets... that the wall fell down flat... and they took the city* (Joshua 6:20) — the alarm of Numbers 10 sounded over Jericho, and Yashar''el (Israel) was saved from her enemy by Yahuah''s (the LORD''s) own appointed signal, not by siege.'),
    ('canon','joshua',6,4,'canon','revelation',8,6,'free',
      E'*And the seven angels which had the seven trumpets prepared themselves to sound* (Revelation 8:6). The seventh-day, seven-trumpet pattern of Jericho — *seven priests shall bear before the ark seven trumpets... the seventh day ye shall compass the city seven times* (Joshua 6:4) — reaches its consummation in the seven trumpets of the end, when the kingdoms of this world fall as Jericho''s wall fell, by Yahuah''s (the LORD''s) appointed blast.'),
    -- THREAD 2: Rahab and her house spared, brought into Yashar'el
    ('canon','joshua',6,17,'canon','joshua',2,18,'free',
      E'*Behold, when we come into the land, thou shalt bind this line of scarlet thread in the window which thou didst let us down by: and thou shalt bring thy father, and thy mother, and thy brethren, and all thy father''s household, home unto thee* (Joshua 2:18). The deliverance of *only Rahab the harlot shall live, she and all that are with her in the house, because she hid the messengers* (Joshua 6:17) rests on the scarlet-line sign sworn back in chapter two: the household gathered under the sign is spared.'),
    ('canon','joshua',6,25,'canon','matthew',1,5,'free',
      E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). *And Joshua saved Rahab the harlot alive... and she dwelleth in Yashar''el (Israel) even unto this day* (Joshua 6:25) — and more than dwelt: she is brought into the paternal line of the Messiah, Rachab the mother of Booz, grafted by covenant-sign and living faith into the seed of promise.'),
    ('canon','joshua',6,25,'canon','hebrews',11,31,'free',
      E'*By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31). That *she hid the messengers, which Joshua sent to spy out Jericho* (Joshua 6:25) is read as the faith that distinguishes her from the perishing city — she believed Yahuah (the LORD) had given the land, and so was not destroyed with them that believed not.'),
    ('canon','joshua',6,17,'canon','james',2,25,'free',
      E'*Likewise also was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25). *Only Rahab the harlot shall live... because she hid the messengers that we sent* (Joshua 6:17) — her faith was not bare assent but a living deed that risked her life for Yashar''el''s (Israel''s) spies; faith perfected by works, the faith that delivers a household.'),
    -- THREAD 3: the devoted city and the curse on rebuilding Jericho
    ('canon','joshua',6,26,'canon','1-kings',16,34,'free',
      E'*In his days did Hiel the Beth-elite build Jericho: he laid the foundation thereof in Abiram his firstborn, and set up the gates thereof in his youngest son Segub, according to the word of Yahuah (LORD), which he spake by Joshua the son of Nun* (1 Kings 16:34). The oath *Cursed be the man before Yahuah (LORD), that riseth up and buildeth this city Jericho: he shall lay the foundation thereof in his firstborn, and in his youngest son shall he set up the gates of it* (Joshua 6:26) is fulfilled centuries later to the letter — Yahuah''s (the LORD''s) word does not fall to the ground.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-6-the-walls-fall-by-yahuahs-means-the-trumpets-and-the-shout',
       E'Jericho: the walls fall by Yahuah''s appointed means — the trumpets and the shout',
       E'Jericho is taken by no siege-engine and no carnal weapon. Yahuah (the LORD) gives the city, and the means are His own: *And seven priests shall bear before the ark seven trumpets of rams'' horns: and the seventh day ye shall compass the city seven times, and the priests shall blow with the trumpets* (Joshua 6:4). Six days they march once around in silence; on the seventh day seven times; and *when ye hear the sound of the trumpet, all the people shall shout with a great shout; and the wall of the city shall fall down flat* (Joshua 6:5). So it comes to pass: *the people shouted when the priests blew with the trumpets... that the wall fell down flat, so that the people went up into the city... and they took the city* (Joshua 6:20).\n\nThe trumpet is no improvisation — it is the very alarm Yahuah (the LORD) ordained through Moses: *if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). The wall came down by faith in that appointed order: *By faith the walls of Jericho fell down, after they were compassed about seven days* (Hebrews 11:30). The apostle names the principle: *the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds* (2 Corinthians 10:4). And the sevenfold trumpet of the seventh day reaches forward to the end, when *the seven angels which had the seven trumpets prepared themselves to sound* (Revelation 8:6) and the strongholds of the nations fall as Jericho''s wall fell — at Yahuah''s (the LORD''s) blast, not man''s might.',
       sv.verse_id, ev.verse_id, 'free', 35125
  FROM _s344_jos06_lookup sv, _s344_jos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=6 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-6-rahab-and-her-house-spared-and-brought-into-yasharel',
       E'Rahab and her household spared, and brought into Yashar''el',
       E'When the devoted city is given to destruction, one house is held back: *only Rahab the harlot shall live, she and all that are with her in the house, because she hid the messengers that we sent* (Joshua 6:17). The ground of her deliverance was set in chapter two by a sign sworn to the spies: *thou shalt bind this line of scarlet thread in the window which thou didst let us down by: and thou shalt bring thy father, and thy mother, and thy brethren, and all thy father''s household, home unto thee* (Joshua 2:18). The household gathered under the scarlet line is spared; the spies keep their oath: *Joshua saved Rahab the harlot alive, and her father''s household... and she dwelleth in Yashar''el (Israel) even unto this day* (Joshua 6:25).\n\nHers is no bare confession. *By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31) — she believed Yahuah (the LORD) had given the land and acted on it at the risk of her life; and that living faith is justified by its deed: *was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25). So she is not merely spared but grafted into the seed of promise — *Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5), brought by covenant-sign and living faith into the paternal line of the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 35128
  FROM _s344_jos06_lookup sv, _s344_jos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=6 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-6-the-devoted-city-and-the-curse-on-rebuilding-jericho',
       E'The devoted city and the curse on rebuilding Jericho',
       E'Jericho is herem — devoted wholly to Yahuah (the LORD): *the city shall be accursed, even it, and all that are therein, to Yahuah (LORD)* (Joshua 6:17), and Yashar''el (Israel) is warned to *keep yourselves from the accursed thing, lest ye make yourselves accursed... and make the camp of Yashar''el (Israel) a curse* (Joshua 6:18). The metal is not plunder but offering: *all the silver, and gold, and vessels of brass and iron, are consecrated unto Yahuah (LORD): they shall come into the treasury of Yahuah (LORD)* (Joshua 6:19).\n\nOver the ruin Joshua lays an oath: *Cursed be the man before Yahuah (LORD), that riseth up and buildeth this city Jericho: he shall lay the foundation thereof in his firstborn, and in his youngest son shall he set up the gates of it* (Joshua 6:26). Centuries pass, and the word stands: *In his days did Hiel the Beth-elite build Jericho: he laid the foundation thereof in Abiram his firstborn, and set up the gates thereof in his youngest son Segub, according to the word of Yahuah (LORD), which he spake by Joshua the son of Nun* (1 Kings 16:34). Yahuah''s (the LORD''s) word spoken through His servant does not fall to the ground — it waits, and it is fulfilled to the letter.',
       sv.verse_id, ev.verse_id, 'free', 35131
  FROM _s344_jos06_lookup sv, _s344_jos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=6 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith the walls of Jericho fell down, after they were compassed about seven days* (Hebrews 11:30) — the seventh-day completion of Joshua 6:4 read as the victory of faith.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-the-walls-fall-by-yahuahs-means-the-trumpets-and-the-shout'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds* (2 Corinthians 10:4) — the wall of 6:5 falls flat by Yahuah''s (the LORD''s) means, not carnal might.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-the-walls-fall-by-yahuahs-means-the-trumpets-and-the-shout'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blow an alarm with the trumpets... and ye shall be saved from your enemies* (Numbers 10:9) — the trumpet of 6:4 is the Mosaic alarm: blow, be remembered, be saved.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-the-walls-fall-by-yahuahs-means-the-trumpets-and-the-shout'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Ye shall be saved from your enemies* (Numbers 10:9) — when the shout and trumpet of 6:20 take the city, the Mosaic promise is kept: Yashar''el (Israel) saved by the appointed signal.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-the-walls-fall-by-yahuahs-means-the-trumpets-and-the-shout'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The seven angels which had the seven trumpets prepared themselves to sound* (Revelation 8:6) — the sevenfold seventh-day trumpet of 6:4 reaches its consummation; the nations'' strongholds fall as Jericho''s wall fell.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-the-walls-fall-by-yahuahs-means-the-trumpets-and-the-shout'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt bind this line of scarlet thread in the window... and thou shalt bring thy father, and thy mother, and thy brethren, and all thy father''s household, home unto thee* (Joshua 2:18) — the scarlet-line sign sworn in chapter two grounds the sparing of Rahab''s house in 6:17.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-rahab-and-her-house-spared-and-brought-into-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith the harlot Rahab perished not with them that believed not, when she had received the spies with peace* (Hebrews 11:31) — that she saved Rahab alive in 6:25 is read as the faith that distinguished her from the perishing city.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-rahab-and-her-house-spared-and-brought-into-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Was not Rahab the harlot justified by works, when she had received the messengers, and had sent them out another way?* (James 2:25) — her hiding of the messengers in 6:17 is faith perfected by works, the living faith that delivers a household.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-rahab-and-her-house-spared-and-brought-into-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5) — she dwelleth in Yashar''el (Israel) (6:25), and more: grafted into the paternal line of the Messiah.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=25
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-rahab-and-her-house-spared-and-brought-into-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*In his days did Hiel the Beth-elite build Jericho: he laid the foundation thereof in Abiram his firstborn, and set up the gates thereof in his youngest son Segub, according to the word of Yahuah (LORD), which he spake by Joshua the son of Nun* (1 Kings 16:34) — Joshua''s oath of 6:26 fulfilled to the letter centuries later; Yahuah''s (the LORD''s) word stands.'
  FROM cross_reference_threads t
  JOIN _s344_jos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s344_jos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=16 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-6-the-devoted-city-and-the-curse-on-rebuilding-jericho'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_7.sql (Joshua 7) -----
-- Chapter: Joshua 7 — ACHAN takes of the accursed/devoted thing, hides it, and the
--          whole camp is defeated at Ai; the lot narrows to Achan, his confession
--          (I saw, I coveted, I took), and the valley of Achor.
-- Tag: jos07   View: _s344_jos07_lookup   Sort band: 35150 step 3 (35150,35153,35156)
--
-- Joshua 7 coverage:
--   v.1,11-12  (Yashar'el sinned in the accursed thing / could not stand before enemies)
--        NT: 1 Cor 5:6-7 a little leaven leaveneth the whole lump / purge out the old leaven;
--            Acts 5:1-2,5 Ananias kept back part and hid it, fell down dead (the same hidden-sin-in-the-camp pattern)
--        Tanakh: Joshua 6:18 the standing warning — keep from the accursed thing lest ye make the camp a curse and trouble it
--        Extras: none warranted
--   v.21  (I saw the spoils... then I coveted them, and took them)
--        NT: James 1:14-15 drawn away of his own lust, lust conceives and bringeth forth sin and death
--        Tanakh: Genesis 3:6 the woman saw... pleasant to the eyes... and she took (the Eve pattern of the same progression)
--        Extras: none warranted (clean canon witnesses suffice for the eye-covet-take chain)
--   v.24-26  (the valley of Achor / Why hast thou troubled us? Yahuah shall trouble thee)
--        Tanakh: Hosea 2:15 the valley of Achor for a DOOR OF HOPE — judgment turned to mercy in the restoration
--        NT: none warranted separately (the door-of-hope reach is Tanakh-internal restoration)
--        Extras: none warranted
--   v.2-9 (the rout at Ai, Joshua's intercession), v.13-20 (sanctify, the lot, confession demanded),
--        v.22-23 (the spoil recovered): narrative carriers, framed within the threads above; no separate add warranted.
--
-- Threads (3):
--   1 joshua-7-the-accursed-thing-in-the-camp-the-leaven-that-defeats-the-whole-lump  [free] Tanakh(Joshua) + NT(1Cor,Acts)
--   2 joshua-7-i-saw-i-coveted-i-took-the-eye-that-conceives-sin-and-death            [free] Tanakh(Genesis) + NT(James)
--   3 joshua-7-the-valley-of-achor-trouble-turned-to-a-door-of-hope                   [free] Tanakh(Hosea)
--
-- Framework note: Achan's one hidden sin is covenant-breaking WITHIN the camp (Victims-not-enemies:
-- the lawsuit is conduct, never ethnic). The leaven (1 Cor 5) and Ananias (Acts 5) are the forward
-- pattern of hidden sin and judgment; the eye-covet-take chain (Gen 3:6 / Jas 1:14-15) is the
-- anatomy of sin from Eve forward; and Achor — the valley of TROUBLE — is turned by Hosea 2:15 into
-- a DOOR OF HOPE, judgment giving way to mercy in the two-house restoration (Hosea 2:23, Lo-Ammi
-- become Ammi). Torah here is the covenant kept; the curse is the herem-breaking, never the Torah.

CREATE TEMP VIEW _s344_jos07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the accursed thing in the camp — the leaven that defeats the whole lump
    ('canon','joshua',7,11,'canon','joshua',6,18,'free',
      E'*And ye, in any wise keep yourselves from the accursed thing, lest ye make yourselves accursed, when ye take of the accursed thing, and make the camp of Yashar''el (Israel) a curse, and trouble it* (Joshua 6:18). The warning was given before Jericho fell; Achan breaks it, so *Yashar''el (Israel) hath sinned, and they have also transgressed my covenant... for they have even taken of the accursed thing, and have also stolen, and dissembled also* (Joshua 7:11). The very thing Yahuah said would make the camp *a curse, and trouble it* has come to pass through one man''s hidden hand.'),
    ('canon','joshua',7,1,'canon','1-corinthians',5,6,'free',
      E'*Your glorying is not good. Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6). One man, *Achan... took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel)* (Joshua 7:1) — the whole camp answers for the leaven of one. The single hidden sin works through the whole lump exactly as Paul warns, which is why the camp cannot stand until it is purged out.'),
    ('canon','joshua',7,12,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened* (1 Corinthians 5:7). Yahuah''s remedy at Ai is the same: *neither will I be with you any more, except ye destroy the accursed from among you* (Joshua 7:12). The accursed thing must be put out of the midst before the people can stand — the leaven purged, the camp made a new lump, the covenant kept not abolished.'),
    ('canon','joshua',7,1,'canon','acts',5,1,'free',
      E'*But a certain man named Ananias, with Sapphira his wife, sold a possession, And kept back part of the price... and brought a certain part, and laid it at the apostles'' feet* (Acts 5:1-2). As Achan *took of the accursed thing* and *put it even among their own stuff* (Joshua 7:1,11), so Ananias kept back and hid part of what was devoted — the same pattern of hidden sin against the set-apart thing carried into the assembly.'),
    ('canon','joshua',7,25,'canon','acts',5,5,'free',
      E'*And Ananias hearing these words fell down, and gave up the ghost: and great fear came on all them that heard these things* (Acts 5:5). Achan and his are stoned and burned in the valley — *Why hast thou troubled us? Yahuah (LORD) shall trouble thee this day* (Joshua 7:25) — and Ananias falls dead in the assembly; in both the hidden sin against what is devoted to Yahuah brings sudden judgment, and *great fear* upon the people.'),

    -- Thread 2: I saw, I coveted, I took — the eye that conceives sin and death
    ('canon','joshua',7,21,'canon','genesis',3,6,'free',
      E'*And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat* (Genesis 3:6). Achan''s confession runs the same chain step for step: *When I saw among the spoils a goodly Babylonish garment... then I coveted them, and took them* (Joshua 7:21). The eye sees, the heart covets, the hand takes — the anatomy of sin from Eden forward, the same progression that troubled the whole camp.'),
    ('canon','joshua',7,21,'canon','james',1,14,'free',
      E'*But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14). Achan is not seized from without but *drawn away of his own lust*: *I saw... then I coveted them, and took them* (Joshua 7:21). The spoils did not compel him; his own desire, enticed by the eye, drew him to take what Yahuah had devoted.'),
    ('canon','joshua',7,25,'canon','james',1,15,'free',
      E'*Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:15). The full arc is written over Achan: lust conceived at the sight of the spoils, brought forth the theft, and *when it is finished* brought forth death in the valley — *and all Yashar''el (Israel) stoned him with stones, and burned them with fire* (Joshua 7:25). The hidden coveting ends in the heap of stones.'),

    -- Thread 3: the valley of Achor — trouble turned to a door of hope
    ('canon','joshua',7,26,'canon','hosea',2,15,'free',
      E'*And I will give her her vineyards from thence, and the valley of Achor for a door of hope: and she shall sing there, as in the days of her youth* (Hosea 2:15). The place where Achan was judged — *the name of that place was called, The valley of Achor, unto this day* (Joshua 7:26), Achor meaning trouble — Yahuah turns into a DOOR OF HOPE. The valley of judgment becomes the threshold of restoration; the same Yahuah who *turned from the fierceness of his anger* (Joshua 7:26) makes the place of trouble the place of singing.'),
    ('canon','joshua',7,25,'canon','hosea',2,23,'free',
      E'*And I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The cry over Achan — *Why hast thou troubled us? Yahuah (LORD) shall trouble thee this day* (Joshua 7:25) — is answered far down the canon in mercy: the trouble of Achor opens upon the regathering of the scattered house, Lo-Ammi (not my people) made Ammi (my people) again. Judgment in the valley gives way to the restoration of Yahuah''s people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-7-the-accursed-thing-in-the-camp-the-leaven-that-defeats-the-whole-lump',
  E'The Accursed Thing in the Camp — the Leaven That Defeats the Whole Lump',
  E'One man''s hidden sin defeats the whole camp. *Achan, the son of Carmi... of the tribe of Yahudah (Judah), took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel)* (Joshua 7:1) — and at Ai thirty-six men die, the hearts of the people *melted, and became as water* (Joshua 7:5). The warning had stood from before Jericho fell: *keep yourselves from the accursed thing, lest ye make yourselves accursed... and make the camp of Yashar''el (Israel) a curse, and trouble it* (Joshua 6:18). Now Yahuah names the breach: *Yashar''el (Israel) hath sinned, and they have also transgressed my covenant... for they have even taken of the accursed thing, and have also stolen, and dissembled also, and they have put it even among their own stuff* (Joshua 7:11), so that *the children of Yashar''el (Israel) could not stand before their enemies... neither will I be with you any more, except ye destroy the accursed from among you* (Joshua 7:12). This is the very thing the apostle teaches: *Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6) — *Purge out therefore the old leaven, that ye may be a new lump* (1 Corinthians 5:7). The single hidden sin works through the whole body, and the body cannot stand until it is put out. The pattern reaches forward again into the assembly: Ananias *kept back part of the price* and hid it (Acts 5:1-2), and *hearing these words fell down, and gave up the ghost: and great fear came on all them that heard* (Acts 5:5) — the same hidden sin against what is devoted to Yahuah, the same sudden judgment, the same fear falling on the people. This is covenant-breaking within the camp, never an attack on the people; the cure is to purge the leaven so the people may stand.',
  sv.verse_id, ev.verse_id, 'free', 35150
  FROM _s344_jos07_lookup sv, _s344_jos07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-7-i-saw-i-coveted-i-took-the-eye-that-conceives-sin-and-death',
  E'I Saw, I Coveted, I Took — the Eye That Conceives Sin and Death',
  E'When the lot has narrowed tribe by family by household down to him, Achan confesses, and his words trace the whole anatomy of sin: *When I saw among the spoils a goodly Babylonish garment, and two hundred shekels of silver, and a wedge of gold of fifty shekels weight, then I coveted them, and took them; and, behold, they are hid in the earth in the midst of my tent* (Joshua 7:21). Saw — coveted — took — hid. It is the same chain run in Eden: *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat* (Genesis 3:6). The eye opens the door, desire walks through it, the hand closes on what Yahuah forbade. James names the sequence and its end: *every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14) — Achan was not seized from without but drawn by his own coveting — and *then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death* (James 1:15). The arc is written whole over Achan: lust conceived at the sight of the spoils, brought forth the theft, and *when it is finished* brought forth death — *and all Yashar''el (Israel) stoned him with stones, and burned them with fire* (Joshua 7:25). The hidden coveting that began with a glance ends in the heap of stones.',
  sv.verse_id, ev.verse_id, 'free', 35153
  FROM _s344_jos07_lookup sv, _s344_jos07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-7-the-valley-of-achor-trouble-turned-to-a-door-of-hope',
  E'The Valley of Achor — Trouble Turned to a Door of Hope',
  E'Achan, his goods, and his household are brought to *the valley of Achor* (Joshua 7:24), and there Joshua says *Why hast thou troubled us? Yahuah (LORD) shall trouble thee this day* (Joshua 7:25). They raise *a great heap of stones unto this day. So Yahuah (LORD) turned from the fierceness of his anger. Wherefore the name of that place was called, The valley of Achor* (Joshua 7:26) — Achor, the valley of trouble, a name of judgment. Yet the prophet Hosea reaches back and takes that very name, that very valley, and makes it the threshold of mercy: *And I will give her her vineyards from thence, and the valley of Achor for a door of hope: and she shall sing there, as in the days of her youth, and as in the day when she came up out of the land of Egypt* (Hosea 2:15). The place of trouble becomes the door of hope; the valley of stoning becomes the place of singing. And the restoration runs to its end — *I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23) — Lo-Ammi (not my people) made Ammi (my people) again, the scattered house regathered. The same Yahuah who *turned from the fierceness of his anger* at Achor turns the whole valley of trouble into a door of hope: judgment gives way to mercy.',
  sv.verse_id, ev.verse_id, 'free', 35156
  FROM _s344_jos07_lookup sv, _s344_jos07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 6:18 — *keep yourselves from the accursed thing... and make the camp of Yashar''el (Israel) a curse, and trouble it*: the standing warning Achan breaks.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-the-accursed-thing-in-the-camp-the-leaven-that-defeats-the-whole-lump'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Corinthians 5:6 — *a little leaven leaveneth the whole lump*: one man''s hidden sin works through the whole camp.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-the-accursed-thing-in-the-camp-the-leaven-that-defeats-the-whole-lump'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 5:7 — *Purge out therefore the old leaven*: the remedy is to destroy the accursed from among them so the camp may stand.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-the-accursed-thing-in-the-camp-the-leaven-that-defeats-the-whole-lump'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 5:1 — Ananias *kept back part of the price* and hid it: the same hidden sin against what is devoted, carried into the assembly.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-the-accursed-thing-in-the-camp-the-leaven-that-defeats-the-whole-lump'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Acts 5:5 — Ananias *fell down, and gave up the ghost: and great fear came on all*: sudden judgment and fear, as at Achan''s valley.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-the-accursed-thing-in-the-camp-the-leaven-that-defeats-the-whole-lump'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 3:6 — the woman *saw... pleasant to the eyes... and she took*: the Eden pattern of saw-coveted-took that Achan repeats.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-i-saw-i-coveted-i-took-the-eye-that-conceives-sin-and-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'James 1:14 — *drawn away of his own lust, and enticed*: Achan was not compelled but drawn by his own coveting.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-i-saw-i-coveted-i-took-the-eye-that-conceives-sin-and-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'James 1:15 — *lust... bringeth forth sin: and sin, when it is finished, bringeth forth death*: the full arc ending in the heap of stones.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-i-saw-i-coveted-i-took-the-eye-that-conceives-sin-and-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Hosea 2:15 — *the valley of Achor for a door of hope... she shall sing there*: the valley of trouble turned into the threshold of mercy.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=26
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-the-valley-of-achor-trouble-turned-to-a-door-of-hope'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hosea 2:23 — *I will say to them which were not my people, Thou art my people*: the trouble of Achor opens upon the regathering, Lo-Ammi made Ammi.'
  FROM cross_reference_threads t
  JOIN _s344_jos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s344_jos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-7-the-valley-of-achor-trouble-turned-to-a-door-of-hope'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_8.sql (Joshua 8) -----
-- Chapter: Joshua 8 — Ai taken by the ambush Yahuah directs (Achan's sin purged, victory
--          restored, 8:1 *Fear not*); the king of Ai hanged on a tree and taken down before
--          night; then at MOUNT EBAL Joshua builds an ALTAR of UNHEWN STONES (no iron), offers
--          burnt and peace offerings, writes a COPY OF THE TORAH on the stones, and reads ALL
--          the words of the Torah — the BLESSINGS and the CURSINGS — before all the congregation
--          of Yashar''el: men, women, little ones, and the strangers.
-- Tag: jos08   View: _s344_jos08_lookup   Sort band: 35175 step 3 (35175..35187)
--
-- Joshua 8 coverage:
--   v.1  (Fear not... I have given into thy hand Ai)  Tanakh: Josh 7:12-13 (could not stand because accursed), Josh 7:26 (Yahuah turned from his anger), Deut 31:6,8 (be strong, fear not, He will not fail thee); NT: none warranted (victory-restored-after-sin-purged held in Tanakh); Extras: none warranted
--   v.18-19,26 (stretch out the spear; the ambush takes the city)  Tanakh: held within thread 1 frame; Extras/NT: none warranted (battle narrative; type not woven separately)
--   v.29 (king of Ai hanged on a tree, taken down before sundown, buried)  Tanakh: Deut 21:22-23 (he that is hanged is accursed of Elohim; body shall not remain all night); NT: Gal 3:13 (Messiah made a curse for us — cursed is every one that hangeth on a tree); Extras: none warranted
--   v.30-31 (altar in Ebal, whole/unhewn stones, no iron, burnt + peace offerings)  Tanakh: Exod 20:24-25 (altar of earth/stone not hewn, burnt + peace offerings, I will bless thee), Deut 27:5-6 (altar of whole stones, no iron tool); NT: none warranted; Extras: none warranted
--   v.32 (wrote a copy of the law of Moses upon the stones)  Tanakh: Deut 27:2-3,8 (set up stones, write upon them all the words of this law); NT/Extras: none warranted (held with the altar/Ebal command)
--   v.33-35 (half before Gerizim half before Ebal; read all the words, blessings and cursings; men, women, little ones, strangers; not a word omitted)  Tanakh: Deut 11:29 (blessing on Gerizim, curse on Ebal), Deut 27:12-13 (these to bless, these to curse), Deut 27:26 (cursed that confirmeth not all the words of this law), Deut 31:11-12 (read this law before all Yashar''el — men, women, children, stranger), Neh 8:2-3 (Ezra read the book of the law before the congregation, men and women); NT: none warranted (whole-Torah-read-and-affirmed held in Tanakh + the curse-frame answered by Gal 3:13 in thread 2); Extras: none warranted
--
-- Threads (5):
--   1 joshua-8-fear-not-the-victory-restored-when-the-accursed-is-purged   [free] Tanakh(Josh 7, Deut 31)
--   2 joshua-8-the-king-of-ai-hanged-on-a-tree-taken-down-before-night     [free] Tanakh(Deut 21) + NT(Gal)
--   3 joshua-8-the-altar-of-unhewn-stones-no-iron-lifted-upon-them         [free] Tanakh(Exod, Deut 27)
--   4 joshua-8-he-wrote-a-copy-of-the-torah-upon-the-stones                [free] Tanakh(Deut 27)
--   5 joshua-8-the-whole-torah-read-the-blessings-and-the-cursings         [free] Tanakh(Deut 11, Deut 27, Deut 31, Nehemiah)
--
-- Framework note (the curse): Joshua reads *the blessings and cursings* (8:34) exactly as Moses
-- commanded in Deut 27-28 / 11:29-30 — the whole Torah read and AFFIRMED as Yashar''el enters the
-- land, the covenant they bind themselves to, NOT a defunct law. The curse is the consequence of
-- covenant-BREAKING (*Cursed be he that confirmeth not all the words of this law to do them*,
-- Deut 27:26), never the Torah itself being the curse. The king of Ai *hanged on a tree* and taken
-- down before night (8:29) keeps Deut 21:22-23 to the letter (*he that is hanged is accursed of
-- Elohim*), and that curse-on-the-tree is the very text the New Testament names of Messiah, who was
-- *made a curse for us* (Gal 3:13) — bearing the covenant-breaking-curse, never abolishing the
-- Torah. The strangers and the little ones are inside the hearing (8:33,35) — the two-house people
-- and the sojourner together under the one covenant word.

CREATE TEMP VIEW _s344_jos08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Fear not — the victory restored when the accursed is purged
    ('canon','joshua',8,1,'canon','joshua',7,12,'free',
      E'*Therefore the children of Yashar''el (Israel) could not stand before their enemies, but turned their backs before their enemies, because they were accursed: neither will I be with you any more, except ye destroy the accursed from among you* (Joshua 7:12). The defeat at Ai was never weakness of arm but the accursed thing in the camp; only after Achan is purged does Yahuah say *Fear not, neither be thou dismayed... see, I have given into thy hand the king of Ai* (Joshua 8:1). The sin removed, the presence and the victory are restored.'),
    ('canon','joshua',8,1,'canon','joshua',7,26,'free',
      E'*And they raised over him a great heap of stones unto this day. So Yahuah (LORD) turned from the fierceness of his anger* (Joshua 7:26). The anger kindled by the trespass is turned away when the accursed is judged in the valley of Achor; on the far side of that judgment Yahuah can say *Fear not... I have given into thy hand the king of Ai, and his people, and his city, and his land* (Joshua 8:1) — the same hand that withheld now gives.'),
    ('canon','joshua',8,1,'canon','deuteronomy',31,8,'free',
      E'*And Yahuah (LORD), he it is that doth go before thee; he will be with thee, he will not fail thee, neither forsake thee: fear not, neither be dismayed* (Deuteronomy 31:8). Yahuah''s word to Joshua at Ai — *Fear not, neither be thou dismayed* (Joshua 8:1) — is the very charge Moses gave him before crossing Jordan; the promise *he will not fail thee* is proven the moment the accursed is purged and the city given into his hand.'),
    ('canon','joshua',8,1,'canon','deuteronomy',31,6,'free',
      E'*Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). The command Moses spoke to all Yashar''el (Israel) is now spoken again over Ai: *Fear not... take all the people of war with thee, and arise, go up to Ai* (Joshua 8:1). The fear lifts not by Yashar''el''s strength but because Yahuah goes with them once the camp is clean.'),

    -- Thread 2: The king of Ai hanged on a tree, taken down before night
    ('canon','joshua',8,29,'canon','deuteronomy',21,23,'free',
      E'*His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled* (Deuteronomy 21:23). Joshua keeps this Torah to the letter: *the king of Ai he hanged on a tree until eventide: and as soon as the sun was down, Joshua commanded that they should take his carcase down from the tree* (Joshua 8:29). The hanged king bears the curse of covenant-breaking, and the body is taken down before night so the land is not defiled.'),
    ('canon','joshua',8,29,'canon','deuteronomy',21,22,'free',
      E'*And if a man have committed a sin worthy of death, and he be to be put to death, and thou hang him on a tree* (Deuteronomy 21:22). The hanging of the king of Ai *on a tree until eventide* (Joshua 8:29) follows this statute exactly — the sin worthy of death answered, the carcase cast down and a *great heap of stones* raised over it, the covenant-curse executed in the land.'),
    ('canon','joshua',8,29,'canon','galatians',3,13,'free',
      E'*Messiah (Christ) hath redeemed us from the curse of the law, being made a curse for us: for it is written, Cursed is every one that hangeth on a tree* (Galatians 3:13). The very Torah Joshua obeys — *he that is hanged is accursed of Elohim* (Deut 21:23) — is the word the New Testament names of Messiah, who was *hanged on a tree* (Joshua 8:29 is its first enactment in the land) and bore the curse of covenant-BREAKING for His people. The curse is the consequence of breaking the covenant; Messiah carries it, He does not abolish the Torah that names it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- second cross_references block (threads 3-5) appended to same insert intent via a fresh INSERT
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 3: The altar of unhewn stones, no iron lifted upon them
    ('canon','joshua',8,31,'canon','deuteronomy',27,5,'free',
      E'*And there shalt thou build an altar unto Yahuah Elohayka (the LORD thy God), an altar of stones: thou shalt not lift up any iron tool upon them* (Deuteronomy 27:5). Joshua builds exactly this altar in mount Ebal — *an altar of whole stones, over which no man hath lift up any iron* (Joshua 8:31). The altar is lawful because it is unhewn, made *as it is written in the book of the law of Moses*, man''s tool kept off what is offered to Yahuah.'),
    ('canon','joshua',8,31,'canon','deuteronomy',27,6,'free',
      E'*Thou shalt build the altar of Yahuah Elohayka (the LORD thy God) of whole stones: and thou shalt offer burnt offerings thereon unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 27:6). Joshua''s altar of *whole stones* on which *they offered... burnt offerings unto Yahuah (LORD), and sacrificed peace offerings* (Joshua 8:31) fulfils Moses'' command word for word — the whole-stone altar and the burnt and peace offerings of the covenant ceremony.'),
    ('canon','joshua',8,31,'canon','exodus',20,25,'free',
      E'*And if thou wilt make me an altar of stone, thou shalt not build it of hewn stone: for if thou lift up thy tool upon it, thou hast polluted it* (Exodus 20:25). The law of the altar given at Sinai is the law Joshua keeps at Ebal: *an altar of whole stones, over which no man hath lift up any iron* (Joshua 8:31). To shape the stone with a tool is to pollute it; the lawful altar is the unhewn stone, untouched by iron.'),
    ('canon','joshua',8,31,'canon','exodus',20,24,'free',
      E'*An altar of earth thou shalt make unto me, and shalt sacrifice thereon thy burnt offerings, and thy peace offerings... in all places where I record my name I will come unto thee, and I will bless thee* (Exodus 20:24). The same Sinai word names the very offerings Joshua brings — *burnt offerings... and... peace offerings* (Joshua 8:31) — and the promise that where Yahuah records His name He comes to bless; the altar at Ebal is that recorded-name place in the land.'),

    -- Thread 4: He wrote a copy of the Torah upon the stones
    ('canon','joshua',8,32,'canon','deuteronomy',27,8,'free',
      E'*And thou shalt write upon the stones all the words of this law very plainly* (Deuteronomy 27:8). This is the command Joshua obeys: *he wrote there upon the stones a copy of the law of Moses, which he wrote in the presence of the children of Yashar''el (Israel)* (Joshua 8:32). The Torah is not left in a book alone but cut into stone in the land, plainly, before the whole people — the covenant inheritance written where all may read it.'),
    ('canon','joshua',8,32,'canon','deuteronomy',27,2,'free',
      E'*And it shall be on the day when ye shall pass over Jordan unto the land which Yahuah Elohayka (the LORD thy God) giveth thee, that thou shalt set thee up great stones, and plaister them with plaister* (Deuteronomy 27:2). The stones Joshua writes upon — *a copy of the law of Moses* (Joshua 8:32) — are the great stones Moses commanded be set up on the very day of entering; the entrance into the inheritance and the writing of the Torah are bound together.'),
    ('canon','joshua',8,32,'canon','deuteronomy',27,3,'free',
      E'*And thou shalt write upon them all the words of this law, when thou art passed over, that thou mayest go in unto the land which Yahuah Elohayka (the LORD thy God) giveth thee, a land that floweth with milk and honey* (Deuteronomy 27:3). The whole Torah written on the stones is the condition of going in to possess the land; Joshua''s *copy of the law of Moses* (Joshua 8:32) is that command kept — the Torah carried into the inheritance, never left behind it.'),

    -- Thread 5: The whole Torah read, the blessings and the cursings
    ('canon','joshua',8,33,'canon','deuteronomy',11,29,'free',
      E'*And it shall come to pass, when Yahuah Elohayka (the LORD thy God) hath brought thee in unto the land whither thou goest to possess it, that thou shalt put the blessing upon mount Gerizim, and the curse upon mount Ebal* (Deuteronomy 11:29). Joshua does precisely this: *half of them over against mount Gerizim, and half of them over against mount Ebal* (Joshua 8:33). The covenant ceremony Moses appointed is enacted the moment Yashar''el (Israel) is brought into the land.'),
    ('canon','joshua',8,33,'canon','deuteronomy',27,12,'free',
      E'*These shall stand upon mount Gerizim to bless the people, when ye are come over Jordan; Simeon, and Levi, and Yahudah (Judah), and Issachar, and Joseph, and Benjamin* (Deuteronomy 27:12). The tribes set *over against mount Gerizim* and *over against mount Ebal* (Joshua 8:33) take the stations Moses assigned — the blessing-mount and the curse-mount of the one covenant, the two houses gathered to hear the same Torah.'),
    ('canon','joshua',8,34,'canon','deuteronomy',27,26,'free',
      E'*Cursed be he that confirmeth not all the words of this law to do them. And all the people shall answer and say, Amen* (Deuteronomy 27:26). When Joshua *read all the words of the law, the blessings and cursings* (Joshua 8:34), this is the final Amen of the curse — and it names plainly that the curse is for him who will NOT confirm the Torah to do it. The curse is the consequence of covenant-breaking, never the Torah itself; the Torah read and affirmed is the blessing they bind themselves to.'),
    ('canon','joshua',8,35,'canon','deuteronomy',31,12,'free',
      E'*Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law* (Deuteronomy 31:12). Joshua leaves out no one and no word: *There was not a word of all that Moses commanded, which Joshua read not before all the congregation of Yashar''el (Israel), with the women, and the little ones, and the strangers* (Joshua 8:35). The whole Torah, the whole people — the sojourner and the child inside the hearing, exactly as Moses charged.'),
    ('canon','joshua',8,35,'canon','nehemiah',8,3,'free',
      E'*And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3). The public reading Joshua holds at Ebal — *not a word... which Joshua read not before all the congregation* (Joshua 8:35) — is the same covenant act Ezra renews after the captivity: the book of the law read in full before men and women, the Torah affirmed by the gathered people, generations apart yet one covenant.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-8-fear-not-the-victory-restored-when-the-accursed-is-purged',
  E'Fear Not — the Victory Restored When the Accursed Is Purged',
  E'After the defeat at Ai, Yahuah (LORD) speaks again to Joshua: *Fear not, neither be thou dismayed: take all the people of war with thee, and arise, go up to Ai: see, I have given into thy hand the king of Ai, and his people, and his city, and his land* (Joshua 8:1). The change is not in Yashar''el''s strength but in the camp: the first rout was never weakness of arm — *the children of Yashar''el (Israel) could not stand before their enemies... because they were accursed: neither will I be with you any more, except ye destroy the accursed from among you* (Joshua 7:12). Only when Achan is judged in the valley of Achor does *Yahuah (LORD)... turn from the fierceness of his anger* (Joshua 7:26), and only then is the city given into Joshua''s hand. The *Fear not* itself is Moses'' own charge come true — *Be strong and of a good courage, fear not... for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6), *he will be with thee, he will not fail thee, neither forsake thee: fear not, neither be dismayed* (Deuteronomy 31:8). The presence withheld for sin is restored the moment the accursed is purged; the hand that gave them up now gives the enemy up before them.',
  sv.verse_id, ev.verse_id, 'free', 35175
  FROM _s344_jos08_lookup sv, _s344_jos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-8-the-king-of-ai-hanged-on-a-tree-taken-down-before-night',
  E'The King of Ai Hanged on a Tree, Taken Down Before Night',
  E'*And the king of Ai he hanged on a tree until eventide: and as soon as the sun was down, Joshua commanded that they should take his carcase down from the tree, and cast it at the entering of the gate of the city, and raise thereon a great heap of stones* (Joshua 8:29). Every detail keeps the Torah Moses gave: *And if a man have committed a sin worthy of death, and he be to be put to death, and thou hang him on a tree* (Deuteronomy 21:22); *His body shall not remain all night upon the tree, but thou shalt in any wise bury him that day; (for he that is hanged is accursed of Elohim (God);) that thy land be not defiled* (Deuteronomy 21:23). The hanged king bears the curse of covenant-breaking, and the body is taken down before nightfall so the inheritance is not defiled. This is the very text the New Testament reaches back to: *Messiah (Christ) hath redeemed us from the curse of the law, being made a curse for us: for it is written, Cursed is every one that hangeth on a tree* (Galatians 3:13). The curse is the consequence of breaking the covenant, named by the Torah itself; Messiah is *made a curse* — He bears it for His people, He does not abolish the Torah that defines it. The first enactment of *hanged on a tree* in the land foreshadows the One who would hang and be taken down before the day was out.',
  sv.verse_id, ev.verse_id, 'free', 35178
  FROM _s344_jos08_lookup sv, _s344_jos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=8 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-8-the-altar-of-unhewn-stones-no-iron-lifted-upon-them',
  E'The Altar of Unhewn Stones, No Iron Lifted Upon Them',
  E'*Then Joshua built an altar unto Yahuah Elohim (the LORD God) of Yashar''el (Israel) in mount Ebal, As Moses the servant of Yahuah (LORD) commanded the children of Yashar''el (Israel), as it is written in the book of the law of Moses, an altar of whole stones, over which no man hath lift up any iron: and they offered thereon burnt offerings unto Yahuah (LORD), and sacrificed peace offerings* (Joshua 8:30-31). This is the lawful altar to the letter. At Sinai Yahuah said *if thou wilt make me an altar of stone, thou shalt not build it of hewn stone: for if thou lift up thy tool upon it, thou hast polluted it* (Exodus 20:25), and named the very offerings — *thy burnt offerings, and thy peace offerings... in all places where I record my name I will come unto thee, and I will bless thee* (Exodus 20:24). Moses repeated it for the entrance into the land: *there shalt thou build an altar... thou shalt not lift up any iron tool upon them. Thou shalt build the altar... of whole stones: and thou shalt offer burnt offerings thereon* (Deuteronomy 27:5-6). Man''s tool is kept off what is offered to Yahuah; the altar is unhewn stone, the burnt and peace offerings of the covenant brought up in the recorded-name place in the inheritance.',
  sv.verse_id, ev.verse_id, 'free', 35181
  FROM _s344_jos08_lookup sv, _s344_jos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=8 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-8-he-wrote-a-copy-of-the-torah-upon-the-stones',
  E'He Wrote a Copy of the Torah Upon the Stones',
  E'*And he wrote there upon the stones a copy of the law of Moses, which he wrote in the presence of the children of Yashar''el (Israel)* (Joshua 8:32). The Torah is not carried into the land in a book alone but cut into stone where all may read it — exactly as Moses commanded for the day of entering: *on the day when ye shall pass over Jordan unto the land... thou shalt set thee up great stones, and plaister them with plaister* (Deuteronomy 27:2); *thou shalt write upon them all the words of this law, when thou art passed over, that thou mayest go in unto the land which Yahuah Elohayka (the LORD thy God) giveth thee, a land that floweth with milk and honey* (Deuteronomy 27:3); *thou shalt write upon the stones all the words of this law very plainly* (Deuteronomy 27:8). The writing of the whole Torah on the stones is bound to the inheritance itself — the covenant word carried IN, plainly, before the whole people, the condition and the joy of going in to possess the land. The Torah is the inheritance, never a thing left behind at the border.',
  sv.verse_id, ev.verse_id, 'free', 35184
  FROM _s344_jos08_lookup sv, _s344_jos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=8 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-8-the-whole-torah-read-the-blessings-and-the-cursings',
  E'The Whole Torah Read — the Blessings and the Cursings',
  E'With the altar built and the Torah written on the stones, Joshua holds the covenant ceremony Moses appointed. *All Yashar''el (Israel), and their elders, and officers, and their judges, stood on this side the ark and on that side... as well the stranger, as he that was born among them; half of them over against mount Gerizim, and half of them over against mount Ebal* (Joshua 8:33) — exactly the stations Moses gave: *thou shalt put the blessing upon mount Gerizim, and the curse upon mount Ebal* (Deuteronomy 11:29), *These shall stand upon mount Gerizim to bless the people... Simeon, and Levi, and Yahudah (Judah)... Joseph, and Benjamin* (Deuteronomy 27:12). Then *he read all the words of the law, the blessings and cursings, according to all that is written in the book of the law* (Joshua 8:34). The curse named there is no curse upon the Torah — it is the curse upon him who breaks it: *Cursed be he that confirmeth not all the words of this law to do them. And all the people shall answer and say, Amen* (Deuteronomy 27:26). The Torah is read and AFFIRMED, the covenant they bind themselves to. And no one is left out: *There was not a word of all that Moses commanded, which Joshua read not before all the congregation of Yashar''el (Israel), with the women, and the little ones, and the strangers* (Joshua 8:35) — the whole word before the whole people, just as Moses charged: *Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn... and observe to do all the words of this law* (Deuteronomy 31:12). The same act of public reading and binding is renewed after the captivity, *the ears of all the people... attentive unto the book of the law* before *the men and the women* (Nehemiah 8:3) — one covenant Torah, generations apart, read in full and answered Amen.',
  sv.verse_id, ev.verse_id, 'free', 35187
  FROM _s344_jos08_lookup sv, _s344_jos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=8 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 7:12 — *could not stand before their enemies... because they were accursed*: the first defeat was the accursed thing in the camp, not weakness of arm.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-fear-not-the-victory-restored-when-the-accursed-is-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 7:26 — *So Yahuah (LORD) turned from the fierceness of his anger*: the anger turned away once the accursed is judged in the valley of Achor; only then is Ai given.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-fear-not-the-victory-restored-when-the-accursed-is-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not... he will not fail thee*: Moses'' charge to all Yashar''el, now spoken again over Ai.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-fear-not-the-victory-restored-when-the-accursed-is-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 31:8 — *he will be with thee, he will not fail thee... fear not, neither be dismayed*: the promise to Joshua proven the moment the camp is clean.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-fear-not-the-victory-restored-when-the-accursed-is-purged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 21:22 — *thou hang him on a tree*: the statute for the sin worthy of death that Joshua enacts on the king of Ai.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-king-of-ai-hanged-on-a-tree-taken-down-before-night'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 21:23 — *he that is hanged is accursed of Elohim... his body shall not remain all night*: Joshua keeps it to the letter, taking the carcase down at sundown.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-king-of-ai-hanged-on-a-tree-taken-down-before-night'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Galatians 3:13 — *made a curse for us: for it is written, Cursed is every one that hangeth on a tree*: the curse on the tree borne by Messiah, the Torah named not abolished.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-king-of-ai-hanged-on-a-tree-taken-down-before-night'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 20:25 — *thou shalt not build it of hewn stone: for if thou lift up thy tool upon it, thou hast polluted it*: the Sinai law of the unhewn altar Joshua keeps at Ebal.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=31
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-altar-of-unhewn-stones-no-iron-lifted-upon-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 20:24 — *thy burnt offerings, and thy peace offerings... where I record my name I will come unto thee, and I will bless thee*: the very offerings Joshua brings, the recorded-name place in the land.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=31
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-altar-of-unhewn-stones-no-iron-lifted-upon-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 27:5 — *an altar of stones: thou shalt not lift up any iron tool upon them*: Moses'' command for the altar at Ebal, kept word for word.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=31
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-altar-of-unhewn-stones-no-iron-lifted-upon-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 27:6 — *of whole stones: and thou shalt offer burnt offerings thereon*: the whole-stone altar and the offerings Joshua brings up in mount Ebal.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=31
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-altar-of-unhewn-stones-no-iron-lifted-upon-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 27:2 — *thou shalt set thee up great stones, and plaister them*: the great stones for the day of crossing, the very stones Joshua writes upon.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=32
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-he-wrote-a-copy-of-the-torah-upon-the-stones'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 27:3 — *write upon them all the words of this law... that thou mayest go in unto the land*: the Torah written on the stones is the condition of going in to possess.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=32
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-he-wrote-a-copy-of-the-torah-upon-the-stones'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 27:8 — *write upon the stones all the words of this law very plainly*: the command Joshua obeys, a copy of the Torah cut plainly into stone before the people.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=32
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-he-wrote-a-copy-of-the-torah-upon-the-stones'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 11:29 — *the blessing upon mount Gerizim, and the curse upon mount Ebal*: the two-mount ceremony Moses appointed for the entrance into the land.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=33
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-whole-torah-read-the-blessings-and-the-cursings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 27:12 — *These shall stand upon mount Gerizim to bless the people*: the tribes set in the stations Moses assigned, the two houses gathered to one Torah.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=33
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-whole-torah-read-the-blessings-and-the-cursings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 27:26 — *Cursed be he that confirmeth not all the words of this law to do them*: the curse is on covenant-BREAKING, never on the Torah itself.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=34
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-whole-torah-read-the-blessings-and-the-cursings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 31:12 — *Gather the people together, men, and women, and children, and thy stranger... that they may hear*: the whole people in the hearing, exactly as Joshua reads to all.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=35
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-whole-torah-read-the-blessings-and-the-cursings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Nehemiah 8:3 — *the ears of all the people were attentive unto the book of the law*: the same covenant reading renewed after the captivity, the Torah affirmed by the gathered people.'
  FROM cross_reference_threads t
  JOIN _s344_jos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=8 AND sv.verse_number=35
  JOIN _s344_jos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-8-the-whole-torah-read-the-blessings-and-the-cursings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_9.sql (Joshua 9) -----
-- Book: Joshua  Chapter: 9   TAG: jos09   View: _s344_jos09_lookup
-- Session prefix: s344   Sort band: 35200, step 3 (35200, 35203, 35206, ...)
-- Slug prefix: joshua-9-   (checked against EXISTING_SLUGS.txt — none present)
--
-- Joshua 9 coverage:
--   v.3-13 (the Gibeonite deception — old sacks, mouldy bread, rent bottles, worn shoes, far-country pretence):
--        NT:     none warranted (the wiliness itself is narrative; its weight lands in the failure-to-enquire and the oath threads)
--        Extras: none warranted
--        Tanakh: Deuteronomy 7:1-2 (make no covenant with the nations) / Deuteronomy 20:10-16 (peace to the FAR cities, utter destruction to the near) — the law the deception exploited
--   v.14 (the men took of their victuals, and ASKED NOT counsel at the mouth of Yahuah — THREAD 1 anchor):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Samuel 21:1 (David ENQUIRED of Yahuah — the contrast); Deuteronomy 7:2; Deuteronomy 20:15-16
--   v.15 / v.18-19 / v.20 (the league made, the princes SWARE by Yahuah, the oath kept though obtained by deceit — THREAD 2 anchor):
--        NT:     Matthew 5:33-37 (perform unto Yahuah thine oaths / let your yea be yea) — the Formed Son raising the bar on the sworn word
--        Extras: none warranted
--        Tanakh: Psalm 15:4 (sweareth to his own hurt, and changeth not); Numbers 30:2 (he shall not break his word); Ecclesiastes 5:4-5 (pay that which thou hast vowed); 2 Samuel 21:1-2 (the GRAVITY — Saul's breach of this very oath brings a 3-year famine)
--   v.21 / v.23 / v.27 (hewers of wood and drawers of water for the congregation and for the ALTAR of Yahuah — THREAD 3 anchor):
--        NT:     none warranted (the mercy-in-judgment lands cleanly in the Tanakh covenant-frame)
--        Extras: none warranted
--        Tanakh: Deuteronomy 29:10-13 (the hewer of thy wood / the drawer of thy water STANDS in the covenant and the oath sworn to the fathers); 2 Samuel 21:2 (the Gibeonites still under the sworn protection generations later)
--
-- THREADS (3):
--   joshua-9-they-asked-not-counsel-at-the-mouth-of-yahuah   [Tanakh only — tier free]
--       Jos 9:14 -> Deut 7:2, Deut 20:15, Deut 20:16, 2Sam 21:1
--   joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name   [Tanakh + NT — tier free]
--       Jos 9:15,18,19,20 -> Ps 15:4, Num 30:2, Eccl 5:4, Eccl 5:5, 2Sam 21:1, 2Sam 21:2, Matt 5:33
--   joshua-9-hewers-of-wood-and-drawers-of-water-for-the-altar   [Tanakh only — tier free]
--       Jos 9:21,23,27 -> Deut 29:11, Deut 29:13, 2Sam 21:2
--
-- All targets canon -> every member tier 'free', every thread tier_required 'free'.

CREATE TEMP VIEW _s344_jos09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: they asked not counsel at the mouth of Yahuah (9:14)
    ('canon','joshua',9,14,'canon','deuteronomy',7,2,'free',
      E'*And when Yahuah Elohayka (the LORD thy God) shall deliver them before thee; thou shalt smite them, and utterly destroy them; thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2). The Torah forbade a league with the inhabitants of the land — the very thing the Gibeonites came to extract. When *the men took of their victuals, and asked not counsel at the mouth of Yahuah* (Joshua 9:14), they judged by the mouldy bread and the worn shoes instead of enquiring of the One whose word already governed the matter.'),
    ('canon','joshua',9,14,'canon','deuteronomy',20,15,'free',
      E'*Thus shalt thou do unto all the cities which are very far off from thee, which are not of the cities of these nations* (Deuteronomy 20:15). Peace might be offered to a FAR city — and so the Gibeonites built their whole lie on distance: *We be come from a far country* (Joshua 9:6). Because Yashar''el (Israel) *asked not counsel at the mouth of Yahuah* (Joshua 9:14), the appearance of a far journey was taken for the truth of one.'),
    ('canon','joshua',9,14,'canon','deuteronomy',20,16,'free',
      E'*But of the cities of these people, which Yahuah Elohayka (the LORD thy God) doth give thee for an inheritance, thou shalt save alive nothing that breatheth* (Deuteronomy 20:16). Gibeon was a NEAR city, of the nations of the land — under this very word. The deception turned entirely on which side of Deuteronomy 20 they fell, and the failure to enquire — *asked not counsel at the mouth of Yahuah* (Joshua 9:14) — left the appearance unchallenged.'),
    ('canon','joshua',9,14,'canon','2-samuel',21,1,'free',
      E'*Then there was a famine in the days of David three years, year after year; and David enquired of Yahuah (LORD). And Yahuah (LORD) answered, It is for Saul, and for his bloody house, because he slew the Gibeonites* (2 Samuel 21:1). Here is the contrast that exposes the lapse: David *enquired of Yahuah* and was answered, where the princes *asked not counsel at the mouth of Yahuah* (Joshua 9:14). The same Gibeonite covenant runs through both scenes — and the One who would have warned at Gilgal is the One who answers David generations later.'),

    -- THREAD 2: the princes sware by Yahuah and changed not — the oath in the Name (9:15,18,19,20)
    ('canon','joshua',9,18,'canon','psalms',15,4,'free',
      E'*In whose eyes a vile person is contemned; but he honoureth them that fear Yahuah (LORD). He that sweareth to his own hurt, and changeth not* (Psalm 15:4). This is the man who may abide in Yahuah''s tabernacle — and it is exactly what the princes did. Though the oath was wrung from them by a lie, *the princes of the congregation had sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 9:18), and to their own hurt they changed not.'),
    ('canon','joshua',9,19,'canon','numbers',30,2,'free',
      E'*If a man vow a vow unto Yahuah (LORD), or swear an oath to bind his soul with a bond; he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2). The Torah binds the sworn word absolutely — and so the princes answer the murmuring congregation: *We have sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel): now therefore we may not touch them* (Joshua 9:19). The Name invoked over the oath makes it unbreakable, deceit notwithstanding.'),
    ('canon','joshua',9,15,'canon','ecclesiastes',5,4,'free',
      E'*When thou vowest a vow unto Elohim (God), defer not to pay it; for he hath no pleasure in fools: pay that which thou hast vowed* (Ecclesiastes 5:4). When *the princes of the congregation sware unto them* (Joshua 9:15), heaven held them to it. The preacher names the law the princes obeyed: a vow uttered before Elohim is a debt that must be paid.'),
    ('canon','joshua',9,15,'canon','ecclesiastes',5,5,'free',
      E'*Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5). The rashness was in the swearing — *the princes of the congregation sware unto them* (Joshua 9:15) before they had enquired — but once sworn in the Name, the vow could not be unpaid. Better never to have sworn; having sworn, they paid it to their hurt.'),
    ('canon','joshua',9,20,'canon','2-samuel',21,1,'free',
      E'*Then there was a famine in the days of David three years, year after year; and David enquired of Yahuah (LORD). And Yahuah (LORD) answered, It is for Saul, and for his bloody house, because he slew the Gibeonites* (2 Samuel 21:1). The princes feared this exactly: *we will even let them live, lest wrath be upon us, because of the oath which we sware unto them* (Joshua 9:20). Centuries on, Saul broke that oath and the wrath came — a three-year famine — proving the gravity of a word sworn in the Name of Yahuah.'),
    ('canon','joshua',9,20,'canon','2-samuel',21,2,'free',
      E'*And the king called the Gibeonites, and said unto them; (now the Gibeonites were not of the children of Yashar''el (Israel), but of the remnant of the Amorites; and the children of Yashar''el (Israel) had sworn unto them: and Saul sought to slay them in his zeal to the children of Yashar''el (Israel) and Yahudah (Judah).)* (2 Samuel 21:2). The text reaches back and names this very oath — *the children of Yashar''el had sworn unto them* — confirming the princes'' word in Joshua 9:20 was still binding generations later, and that breaking it brought blood-guilt on the land.'),
    ('canon','joshua',9,19,'canon','matthew',5,33,'free',
      E'*Again, ye have heard that it hath been said by them of old time, Thou shalt not forswear thyself, but shalt perform unto Yahuah (Lord) thine oaths* (Matthew 5:33). The Formed Son names the standard the princes upheld — the sworn word performed unto Yahuah — and in *We have sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel): now therefore we may not touch them* (Joshua 9:19) the oath in the Name is honoured exactly as he requires.'),

    -- THREAD 3: hewers of wood and drawers of water for the altar — mercy within judgment (9:21,23,27)
    ('canon','joshua',9,21,'canon','deuteronomy',29,11,'free',
      E'*Your little ones, your wives, and thy stranger that is in thy camp, from the hewer of thy wood unto the drawer of thy water* (Deuteronomy 29:11). Moses had already set the hewer of wood and the drawer of water INSIDE the covenant assembly — and the princes'' sentence, *Let them live; but let them be hewers of wood and drawers of water unto all the congregation* (Joshua 9:21), folds the deceiving stranger into that same standing place.'),
    ('canon','joshua',9,23,'canon','deuteronomy',29,13,'free',
      E'*That he may establish thee to day for a people unto himself, and that he may be unto thee a Elohim (God), as he hath said unto thee, and as he hath sworn unto thy fathers, to Abraham, to Isaac, and to Jacob* (Deuteronomy 29:13). The curse Joshua pronounces — *there shall none of you be freed from being bondmen, and hewers of wood and drawers of water for the house of my Elohim (God)* (Joshua 9:23) — binds the Gibeonites not to death but to lifelong service at the house of the very Elohim who swore to the fathers; the judgment lands them next to His altar.'),
    ('canon','joshua',9,27,'canon','2-samuel',21,2,'free',
      E'*And the king called the Gibeonites, and said unto them; (now the Gibeonites were not of the children of Yashar''el (Israel), but of the remnant of the Amorites; and the children of Yashar''el (Israel) had sworn unto them...)* (2 Samuel 21:2). The men made *hewers of wood and drawers of water for the congregation, and for the altar of Yahuah (LORD), even unto this day* (Joshua 9:27) were still a remembered, protected people in David''s day — the mercy granted in the judgment outlasting the generation that granted it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-9-they-asked-not-counsel-at-the-mouth-of-yahuah',
       E'They Asked Not Counsel at the Mouth of Yahuah',
       E'The kings of the land gather to fight, but the men of Gibeon try another way: *They did work wilily, and went and made as if they had been ambassadors, and took old sacks upon their asses, and wine bottles, old, and rent, and bound up* (Joshua 9:4), with *all the bread of their provision* gone *dry and mouldy* (Joshua 9:5). Their whole case rests on one claim — *We be come from a far country: now therefore make ye a league with us* (Joshua 9:6) — because the Torah drew a line exactly there. To a FAR city peace might be offered: *Thus shalt thou do unto all the cities which are very far off from thee, which are not of the cities of these nations* (Deuteronomy 20:15); but of the cities of the land, *thou shalt save alive nothing that breatheth* (Deuteronomy 20:16), for *thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2). The deception turns entirely on which side of that line Gibeon falls. And the failure is named in a single verse: *And the men took of their victuals, and asked not counsel at the mouth of Yahuah (LORD)* (Joshua 9:14). They examined the bread and the bottles — the appearances — and never asked the One whose word already settled the matter. The contrast that exposes the lapse comes generations later, when *David enquired of Yahuah (LORD). And Yahuah (LORD) answered* (2 Samuel 21:1). The Formed Son who would have answered at Gilgal is the One who answers David — and Yashar''el (Israel) need only have asked.',
       sv.verse_id, ev.verse_id, 'free', 35200
  FROM _s344_jos09_lookup sv, _s344_jos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=9 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name',
       E'The Princes Sware, and Changed Not — the Oath in the Name',
       E'The league is struck and sealed: *Joshua made peace with them, and made a league with them, to let them live: and the princes of the congregation sware unto them* (Joshua 9:15). Three days later the lie is exposed — these are neighbours, near cities of the land — and the congregation murmurs. But the princes will not break their word, because of WHAT they swore by: *the princes of the congregation had sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 9:18); *We have sworn unto them by Yahuah Elohim (the LORD God) of Yashar''el (Israel): now therefore we may not touch them* (Joshua 9:19). This is the man who may abide in Yahuah''s tabernacle: *He that sweareth to his own hurt, and changeth not* (Psalm 15:4). The Torah binds the sworn word absolutely — *he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2) — and the preacher seals it: *pay that which thou hast vowed* (Ecclesiastes 5:4); *Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5). The rashness was in the swearing; once sworn in the Name, the vow could not be unpaid. The princes know the cost of breaking it: *lest wrath be upon us, because of the oath which we sware unto them* (Joshua 9:20). And the canon proves them right — centuries on, Saul slew the Gibeonites, and *there was a famine in the days of David three years* (2 Samuel 21:1), for *the children of Yashar''el (Israel) had sworn unto them* (2 Samuel 21:2). The Formed Son names the same standard: *Thou shalt not forswear thyself, but shalt perform unto Yahuah (Lord) thine oaths* (Matthew 5:33). A word sworn in the Name is honoured even to one''s own hurt — and the land bleeds when it is broken.',
       sv.verse_id, ev.verse_id, 'free', 35203
  FROM _s344_jos09_lookup sv, _s344_jos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=9 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-9-hewers-of-wood-and-drawers-of-water-for-the-altar',
       E'Hewers of Wood and Drawers of Water for the Altar — Mercy Within the Judgment',
       E'The deceivers are not destroyed; they are bound to service: *Let them live; but let them be hewers of wood and drawers of water unto all the congregation* (Joshua 9:21). Joshua frames it as a curse — *there shall none of you be freed from being bondmen, and hewers of wood and drawers of water for the house of my Elohim (God)* (Joshua 9:23) — yet the place of that service is the mercy hidden in it. Moses had already set this exact pair INSIDE the covenant assembly: *your captains of your tribes, your elders, and your officers... the stranger that is in thy camp, from the hewer of thy wood unto the drawer of thy water* (Deuteronomy 29:11), all standing to enter *into his oath* (Deuteronomy 29:12), the covenant *he hath sworn unto thy fathers, to Abraham, to Isaac, and to Jacob* (Deuteronomy 29:13). So the curse lands the Gibeonites not in the grave but at the doorpost of the house — and the final verse names where: *hewers of wood and drawers of water for the congregation, and for the altar of Yahuah (LORD), even unto this day, in the place which he should choose* (Joshua 9:27). For the altar. The deceivers are given a station beside the very place of atonement. And the mercy outlasts the generation that granted it: in David''s day they are still a remembered, protected people, *the remnant of the Amorites; and the children of Yashar''el (Israel) had sworn unto them* (2 Samuel 21:2). Judgment fell — but it set them down within reach of the altar of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 35206
  FROM _s344_jos09_lookup sv, _s344_jos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=9 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2) — the very league the Torah forbade.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-they-asked-not-counsel-at-the-mouth-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the cities which are very far off from thee, which are not of the cities of these nations* (Deuteronomy 20:15) — peace to the FAR city, the lie they built upon.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-they-asked-not-counsel-at-the-mouth-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt save alive nothing that breatheth* (Deuteronomy 20:16) — Gibeon was a NEAR city, under this word.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-they-asked-not-counsel-at-the-mouth-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*David enquired of Yahuah (LORD). And Yahuah (LORD) answered* (2 Samuel 21:1) — the contrast: David asked, the princes did not.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-they-asked-not-counsel-at-the-mouth-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He that sweareth to his own hurt, and changeth not* (Psalm 15:4) — the abider in the tabernacle; exactly what the princes did.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=18
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he shall not break his word... according to all that proceedeth out of his mouth* (Numbers 30:2) — the Torah binds the sworn word absolutely.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=19
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*pay that which thou hast vowed* (Ecclesiastes 5:4) — a vow before Elohim is a debt; the princes paid it.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Better is it that thou shouldest not vow, than that thou shouldest vow and not pay* (Ecclesiastes 5:5) — the rashness was the swearing; once sworn, unbreakable.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a famine in the days of David three years... because he slew the Gibeonites* (2 Samuel 21:1) — the wrath the princes feared, fallen when the oath was broken.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=20
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the children of Yashar''el (Israel) had sworn unto them* (2 Samuel 21:2) — the canon names this very Joshua-9 oath, still binding generations on.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=20
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*shalt perform unto Yahuah (Lord) thine oaths* (Matthew 5:33) — the Formed Son names the standard the princes upheld.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=19
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-the-princes-sware-and-changed-not-the-oath-in-the-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*from the hewer of thy wood unto the drawer of thy water* (Deuteronomy 29:11) — Moses set this exact pair inside the covenant assembly.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=21
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-hewers-of-wood-and-drawers-of-water-for-the-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*as he hath sworn unto thy fathers, to Abraham, to Isaac, and to Jacob* (Deuteronomy 29:13) — the curse binds them to the house of the Elohim who swore to the fathers.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=23
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-hewers-of-wood-and-drawers-of-water-for-the-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the children of Yashar''el (Israel) had sworn unto them* (2 Samuel 21:2) — the servants of the altar still a remembered, protected people in David''s day.'
  FROM cross_reference_threads t
  JOIN _s344_jos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=9 AND sv.verse_number=27
  JOIN _s344_jos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-9-hewers-of-wood-and-drawers-of-water-for-the-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_10.sql (Joshua 10) -----
-- Joshua 10 — Yashar'el rescues Gibeon by the oath; Yahuah's heavenly artillery,
--   the long day, and the conquest of the south. Tag jos10; view _s344_jos10_lookup.
-- Sort band base 35225, step 3 (35225, 35228, 35231, 35234).
--
-- Joshua 10 coverage:
--   v.8  (Fear them not... I have delivered)
--        NT:     none warranted (motif carried laterally within the conquest narrative)
--        Extras: none warranted
--        Tanakh: Deuteronomy 1:21, Joshua 1:9 (fear-not / be strong) — THREAD 4
--   v.10 (Yahuah discomfited them)
--        NT:     none warranted
--        Extras: Jasher 88:60 (parallel) — carried by hail/long-day threads, not separately threaded
--        Tanakh: carried by the fought-for-Yashar'el thread (the victory His)
--   v.11 (great stones from heaven / hailstones — more than the sword)
--        NT:     none warranted (plague/artillery motif stays Tanakh+extras)
--        Extras: Jasher 88:61 — THREAD 1
--        Tanakh: Psalm 18:12, 18:13, 18:14 (hail stones, coals of fire, arrows, discomfited) — THREAD 1
--   v.12 (Sun stand still upon Gibeon; Moon in Ajalon)
--        NT:     none warranted
--        Extras: Jasher 88:63 — THREAD 3
--        Tanakh: Genesis 1:14, 1:16 (the luminaries for signs/seasons); Habakkuk 3:11 — THREAD 3
--   v.13 (sun stood still in midst of heaven, book of Jasher)
--        NT:     none warranted
--        Extras: Jasher 88:64 (the named book itself) — THREAD 3
--        Tanakh: 2 Kings 20:11 (shadow ten degrees backward, the Hezekiah sun-sign) — THREAD 3
--   v.14 (no day like that — Yahuah hearkened unto the voice of a man; fought for Yashar'el)
--        NT:     none warranted
--        Extras: Jasher 88:65 — THREAD 3
--        Tanakh: Exodus 14:14, 14:25; Deuteronomy 1:30; Joshua 23:3 (fought for) — THREAD 2 & 3
--   v.25 (Fear not, nor be dismayed... thus shall Yahuah do to all your enemies)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Joshua 1:9, Deuteronomy 1:21 — THREAD 4
--   v.42 (Yahuah Elohim of Yashar'el fought for Yashar'el)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exodus 14:14; Deuteronomy 1:30; Joshua 23:3, 23:10 — THREAD 2
--
-- THREADS:
--   THREAD 1 joshua-10-the-hailstones-from-heaven (free... no, EXTRAS — Jasher member): Tanakh (Psalm) + extras (Jasher)
--   THREAD 2 joshua-10-yahuah-fought-for-yashar'el (free): Tanakh only (Exodus, Deuteronomy, Joshua)
--   THREAD 3 joshua-10-the-sun-and-the-moon-stood-still (extras): Tanakh (Genesis, Habakkuk, 2 Kings) + extras (Jasher)
--   THREAD 4 joshua-10-fear-not-thus-shall-yahuah-do (free): Tanakh only (Deuteronomy, Joshua)
--
-- Framework-load-bearing notes:
--   * 10:11 hailstones = Yahuah's heavenly artillery; Psalm 18 sings the same theophany
--     (hail stones and coals of fire, arrows, discomfited them); the Creator's weapons, not the sword.
--   * 10:12-14 the long day = the Creator OVER the sun and moon, the appointed-time luminaries
--     He set (Gen 1:14) for signs and seasons, answering a man's voice. Same Yahuah who turns the
--     sun BACK ten degrees for Hezekiah (2 Kings 20:11) and at whose arrows the sun and moon stood
--     still (Hab 3:11). The Formed Son who led Yashar'el commands His own creation. NOT a co-equal
--     trinity, NOT Arian — Yahuah hearkening to the voice of a man.
--   * 10:14, 42 Yahuah fought for Yashar'el = the man of war (Exod 14:14,25; Deut 1:30; Josh 23:3,10).
--     The victory is His, not their sword — the same hand that drowned Pharaoh's host.

CREATE TEMP VIEW _s344_jos10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the hailstones from heaven (10:11)
    ('canon','joshua',10,11,'canon','psalms',18,12,'free',E'*At the brightness that was before him his thick clouds passed, hail stones and coals of fire* (Psalm 18:12). When Yahuah *cast down great stones from heaven upon them... they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword* (Joshua 10:11), it is the theophany Psalm 18 sings: the heavenly artillery of the Creator, hail and fire from His own storehouse, falling on the enemies of His people.'),
    ('canon','joshua',10,11,'canon','psalms',18,13,'free',E'*Yahuah (LORD) also thundered in the heavens, and the Highest gave his voice; hail stones and coals of fire* (Psalm 18:13). The same *great stones from heaven* (Joshua 10:11) that killed *more... than they whom the children of Yashar''el (Israel) slew with the sword* are Yahuah''s voice in the heavens — the battle is fought from above, the hand of the Most High, not the arm of flesh.'),
    ('canon','joshua',10,11,'canon','psalms',18,14,'free',E'*Yea, he sent out his arrows, and scattered them; and he shot out lightnings, and discomfited them* (Psalm 18:14). As *Yahuah (LORD) discomfited them before Yashar'' el (Israel)* (Joshua 10:10) and then rained *hailstones* on them (10:11), Psalm 18 names the weapons — arrows, lightnings, hail — by which Yahuah scatters the enemy. The victory is the Creator''s, falling from heaven.'),
    ('canon','joshua',10,11,'jasher','jasher',88,61,'extras',E'*And whilst they were fleeing, Yahuah (the Lord) sent upon them hailstones from heaven, and more of them died by the hailstones, than by the slaughter of the children of Israel* (Jasher 88:61). The very book to which Joshua 10:13 points (*Is not this written in the book of Jasher?*) tells the same scene as *Yahuah (LORD) cast down great stones from heaven upon them... they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword* (Joshua 10:11) — the two witnesses agree, the heavenly stones outkilled the sword.'),
    -- THREAD 2 — Yahuah fought for Yashar'el (10:14, 10:42)
    ('canon','joshua',10,14,'canon','exodus',14,14,'free',E'*Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). *That Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel)* (Joshua 10:14) is the promise of the Red Sea kept again — the same hand that needed no help from Yashar''el at the water now needs none on the field of Gibeon. The victory is His.'),
    ('canon','joshua',10,14,'canon','exodus',14,25,'free',E'*And took off their chariot wheels, that they drave them heavily: so that the Egyptians said, Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians* (Exodus 14:25). Even Pharaoh''s host confessed what the Amorites learned under the hailstones: *Yahuah (LORD) fought for Yashar''el (Israel)* (Joshua 10:14). The man of war is the Formed Son who led them out, fighting their battles still.'),
    ('canon','joshua',10,14,'canon','deuteronomy',1,30,'free',E'*Yahuah Elohaychem (The LORD your God) which goeth before you, he shall fight for you, according to all that he did for you in Egypt before your eyes* (Deuteronomy 1:30). Moses'' word to the wilderness generation is fulfilled before their children''s eyes: *Yahuah (LORD) fought for Yashar''el (Israel)* (Joshua 10:14), exactly *according to all that he did for you in Egypt* — the long day is the Red Sea''s heir.'),
    ('canon','joshua',10,42,'canon','exodus',14,14,'free',E'*Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). *All these kings and their land did Joshua take at one time, because Yahuah Elohim (the LORD God) of Yashar''el (Israel) fought for Yashar''el (Israel)* (Joshua 10:42). The whole conquest of the south is one act of the man of war — the cause is named: Yahuah fought, the host only followed.'),
    ('canon','joshua',10,42,'canon','deuteronomy',1,30,'free',E'*Yahuah Elohaychem (The LORD your God) which goeth before you, he shall fight for you, according to all that he did for you in Egypt before your eyes* (Deuteronomy 1:30). *Because Yahuah Elohim (the LORD God) of Yashar''el (Israel) fought for Yashar''el (Israel)* (Joshua 10:42) the kings fell at one time — He went before them as Moses foretold, the same Yahuah of Egypt and the wilderness.'),
    ('canon','joshua',10,42,'canon','joshua',23,3,'free',E'*And ye have seen all that Yahuah Elohaychem (the LORD your God) hath done unto all these nations because of you; for Yahuah Elohaychem (the LORD your God) is he that hath fought for you* (Joshua 23:3). Joshua''s farewell looks back on this very day: *because Yahuah Elohim (the LORD God) of Yashar''el (Israel) fought for Yashar''el (Israel)* (Joshua 10:42). The conquest belongs to Yahuah, start to finish — never to their sword.'),
    ('canon','joshua',10,42,'canon','joshua',23,10,'free',E'*One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you* (Joshua 23:10). The closing creed of the book confesses what Gibeon proved: *Yahuah Elohim (the LORD God) of Yashar''el (Israel) fought for Yashar''el (Israel)* (Joshua 10:42). The disproportion — one chasing a thousand, five kings taken at one time — is the signature of His hand.'),
    -- THREAD 3 — the sun and the moon stood still / the long day (10:12, 10:13, 10:14)
    ('canon','joshua',10,12,'canon','genesis',1,14,'free',E'*And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). When Joshua cried *Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon* (Joshua 10:12), he spoke to the very luminaries Elohim set for signs and seasons — and their Maker, the Formed Son who led Yashar''el, bent His own creation to a man''s voice.'),
    ('canon','joshua',10,12,'canon','genesis',1,16,'free',E'*And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night: he made the stars also* (Genesis 1:16). The two great lights — *the sun... and the moon* (Joshua 10:12-13) — stood still at the word of the One who made them. The appointed-time rulers of day and night obey their Creator over Gibeon and Ajalon.'),
    ('canon','joshua',10,12,'canon','habakkuk',3,11,'free',E'*The sun and moon stood still in their habitation: at the light of thine arrows they went, and at the shining of thy glittering spear* (Habakkuk 3:11). Habakkuk''s prayer remembers Gibeon directly: *Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon* (Joshua 10:12). The Creator marches in salvation for His people, and the luminaries halt at His arrows.'),
    ('canon','joshua',10,13,'canon','2-kings',20,11,'free',E'*And Isaiah the prophet cried unto Yahuah (LORD): and he brought the shadow ten degrees backward, by which it had gone down in the dial of Ahaz* (2 Kings 20:11). As *the sun stood still in the midst of heaven, and hasted not to go down about a whole day* for Joshua (Joshua 10:13), so Yahuah turned the sun BACK ten degrees as a sign for Hezekiah — twice the Maker over-rules the sun''s course at the prayer of a man, the same hand both times.'),
    ('canon','joshua',10,13,'jasher','jasher',88,64,'extras',E'*And Yahuah (the Lord) hearkened to the voice of Joshua, and the sun stood still in the midst of the heavens, and it stood still six and thirty moments, and the moon also stood still and hastened not to go down a whole day* (Jasher 88:64). Joshua 10:13 names this very book — *Is not this written in the book of Jasher?* — and Jasher answers, telling the long day in full: the sun *stood still in the midst of heaven, and hasted not to go down about a whole day* (Joshua 10:13). The cited witness speaks.'),
    ('canon','joshua',10,12,'jasher','jasher',88,63,'extras',E'*And when they were smiting, the day was declining toward evening, and Joshua said in the sight of all the people, Sun, stand you still upon Gibeon, and you moon in the valley of Ajalon, until the nation shall have revenged itself upon its enemies* (Jasher 88:63). The book of Jasher records the very prayer Joshua 10:12 preserves — *Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon* — the two witnesses laid side by side.'),
    ('canon','joshua',10,14,'jasher','jasher',88,65,'extras',E'*And there was no day like that, before it or after it, that Yahuah (the Lord) hearkened to the voice of a man, for Yahuah (the Lord) fought for Israel* (Jasher 88:65). Word for word the cited book confirms Joshua 10:14 — *there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel)*. The Creator answered a man and warred for His people.'),
    -- THREAD 4 — fear not, thus shall Yahuah do (10:8, 10:25)
    ('canon','joshua',10,8,'canon','joshua',1,9,'free',E'*Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). *And Yahuah (LORD) said unto Joshua, Fear them not: for I have delivered them into thine hand* (Joshua 10:8) keeps the commission word of the book''s opening — the same charge to be unafraid because Yahuah goes with him into every battle.'),
    ('canon','joshua',10,8,'canon','deuteronomy',1,21,'free',E'*Behold, Yahuah Elohayka (the LORD thy God) hath set the land before thee: go up and possess it, as Yahuah Elohim (the LORD God) of thy fathers hath said unto thee; fear not, neither be discouraged* (Deuteronomy 1:21). Moses'' charge at Kadesh — *fear not, neither be discouraged* — is renewed at Gibeon: *Fear them not: for I have delivered them into thine hand* (Joshua 10:8). The wilderness generation refused; this generation obeys and inherits.'),
    ('canon','joshua',10,25,'canon','joshua',1,9,'free',E'*Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). Joshua now passes to all Yashar''el the word Yahuah first gave him: *Fear not, nor be dismayed, be strong and of good courage: for thus shall Yahuah (LORD) do to all your enemies against whom ye fight* (Joshua 10:25). The captain hands down the courage he received.'),
    ('canon','joshua',10,25,'canon','deuteronomy',1,21,'free',E'*Behold, Yahuah Elohayka (the LORD thy God) hath set the land before thee: go up and possess it, as Yahuah Elohim (the LORD God) of thy fathers hath said unto thee; fear not, neither be discouraged* (Deuteronomy 1:21). *Fear not, nor be dismayed, be strong and of good courage: for thus shall Yahuah (LORD) do to all your enemies* (Joshua 10:25) is the Kadesh charge made good — the land set before them, the enemies given into their hand, fear undone by the One who fights for them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 — the hailstones from heaven (extras: Jasher member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-10-the-hailstones-from-heaven',
       E'Joshua 10 — Yahuah''s Heavenly Artillery: the Hailstones from Heaven',
       E'When the five Amorite kings fled before Yashar''el, the battle was not won by the sword. *And it came to pass, as they fled from before Yashar''el (Israel), and were in the going down to Beth-horon, that Yahuah (LORD) cast down great stones from heaven upon them unto Azekah, and they died: they were more which died with hailstones than they whom the children of Yashar''el (Israel) slew with the sword* (Joshua 10:11). This is the heavenly artillery of the Creator — the same weapons Psalm 18 sings in the great theophany: *At the brightness that was before him his thick clouds passed, hail stones and coals of fire* (Psalm 18:12); *Yahuah (LORD) also thundered in the heavens, and the Highest gave his voice; hail stones and coals of fire* (Psalm 18:13); *he shot out lightnings, and discomfited them* (Psalm 18:14). The hand of the Most High fought from above. The book Joshua 10:13 itself points to confirms it: *And whilst they were fleeing, Yahuah (the Lord) sent upon them hailstones from heaven, and more of them died by the hailstones, than by the slaughter of the children of Israel* (Jasher 88:61). The victory falls from heaven, not from the arm of flesh.',
       sv.verse_id, ev.verse_id, 'extras', 35225
  FROM _s344_jos10_lookup sv, _s344_jos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 — Yahuah fought for Yashar'el (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-10-yahuah-fought-for-yashar-el',
       E'Joshua 10 — Yahuah Fought for Yashar''el: the Man of War',
       E'Twice the chapter names the true cause of the victory. *And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel)* (Joshua 10:14); *And all these kings and their land did Joshua take at one time, because Yahuah Elohim (the LORD God) of Yashar''el (Israel) fought for Yashar''el (Israel)* (Joshua 10:42). This is the man of war of the Red Sea: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14) — and even Pharaoh''s host confessed it, *Let us flee from the face of Yashar''el (Israel); for Yahuah (LORD) fighteth for them against the Egyptians* (Exodus 14:25). Moses promised the wilderness generation, *Yahuah Elohaychem (The LORD your God) which goeth before you, he shall fight for you, according to all that he did for you in Egypt before your eyes* (Deuteronomy 1:30), and their children saw it kept. At the book''s close Joshua confesses the whole conquest the same way: *Yahuah Elohaychem (the LORD your God) is he that hath fought for you* (Joshua 23:3); *One man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you, as he hath promised you* (Joshua 23:10). The Formed Son who led them out leads them in; the land is His gift, never their sword.',
       sv.verse_id, ev.verse_id, 'free', 35228
  FROM _s344_jos10_lookup sv, _s344_jos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=10 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 — the sun and the moon stood still / the long day (extras: Jasher members)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-10-the-sun-and-the-moon-stood-still',
       E'Joshua 10 — The Long Day: the Creator over Sun and Moon Answers a Man''s Voice',
       E'*Then spake Joshua to Yahuah (LORD)... and he said in the sight of Yashar''el (Israel), Sun, stand thou still upon Gibeon; and thou, Moon, in the valley of Ajalon. And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies... So the sun stood still in the midst of heaven, and hasted not to go down about a whole day. And there was no day like that before it or after it, that Yahuah (LORD) hearkened unto the voice of a man: for Yahuah (LORD) fought for Yashar''el (Israel)* (Joshua 10:12-14). A man commanded the sun and moon, and they obeyed — because the One who heard him is their Maker. *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14); *And Elohim (God) made two great lights; the greater light to rule the day, and the lesser light to rule the night* (Genesis 1:16). The appointed-time luminaries halt at the word of the Formed Son who led Yashar''el. Habakkuk remembers the day: *The sun and moon stood still in their habitation: at the light of thine arrows they went* (Habakkuk 3:11). And the same Yahuah who held the sun for Joshua turned it BACK for Hezekiah: *And Isaiah the prophet cried unto Yahuah (LORD): and he brought the shadow ten degrees backward, by which it had gone down in the dial of Ahaz* (2 Kings 20:11) — twice the Maker over-rules the sun''s course at a man''s prayer. The book Joshua itself cites bears witness: *Sun, stand you still upon Gibeon, and you moon in the valley of Ajalon* (Jasher 88:63); *the sun stood still in the midst of the heavens... and the moon also stood still and hastened not to go down a whole day* (Jasher 88:64); *there was no day like that, before it or after it, that Yahuah (the Lord) hearkened to the voice of a man, for Yahuah (the Lord) fought for Israel* (Jasher 88:65). This is no co-equal counterfeit and no created angel — it is Yahuah, the Creator over His own creation, hearkening to the voice of a man and fighting for His people.',
       sv.verse_id, ev.verse_id, 'extras', 35231
  FROM _s344_jos10_lookup sv, _s344_jos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 — fear not, thus shall Yahuah do (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-10-fear-not-thus-shall-yahuah-do',
       E'Joshua 10 — Fear Not, Nor Be Dismayed: Thus Shall Yahuah Do',
       E'The courage of the conquest is a gift handed down. Yahuah first gives it to Joshua: *And Yahuah (LORD) said unto Joshua, Fear them not: for I have delivered them into thine hand; there shall not a man of them stand before thee* (Joshua 10:8). Then Joshua passes it to all Yashar''el over the necks of the five kings: *Fear not, nor be dismayed, be strong and of good courage: for thus shall Yahuah (LORD) do to all your enemies against whom ye fight* (Joshua 10:25). This is the commission word of the whole book: *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). And it answers the failure at Kadesh, where Moses charged them in vain: *Behold, Yahuah Elohayka (the LORD thy God) hath set the land before thee: go up and possess it... fear not, neither be discouraged* (Deuteronomy 1:21). The generation that feared perished in the wilderness; the generation that believes Yahuah''s word inherits — for He is with them, and He fights their battles.',
       sv.verse_id, ev.verse_id, 'free', 35234
  FROM _s344_jos10_lookup sv, _s344_jos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=10 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD 1 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 18:12 — *hail stones and coals of fire*; the theophany weapons that fell on the Amorites (Joshua 10:11).'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-hailstones-from-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 18:13 — *the Highest gave his voice; hail stones and coals of fire*; the hail is Yahuah''s voice in the heavens.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-hailstones-from-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 18:14 — *he shot out lightnings, and discomfited them*; the same word, Yahuah *discomfited* them at Gibeon (Joshua 10:10).'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-hailstones-from-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jasher 88:61 — *Yahuah (the Lord) sent upon them hailstones from heaven, and more of them died by the hailstones*; the book Joshua 10:13 cites, agreeing.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=88 AND tv.verse_number=61
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-hailstones-from-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 2 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 14:14 — *Yahuah (LORD) shall fight for you, and ye shall hold your peace*; the Red Sea promise kept at Gibeon (Joshua 10:14).'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-yahuah-fought-for-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 14:25 — even Egypt confessed *Yahuah (LORD) fighteth for them*; the same confession the Amorites learn.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-yahuah-fought-for-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 1:30 — *he shall fight for you, according to all that he did for you in Egypt*; Moses'' word fulfilled before their children''s eyes.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-yahuah-fought-for-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 14:14 (to 10:42) — the man of war takes all the southern kings at one time, holding their peace.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=42
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-yahuah-fought-for-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 1:30 (to 10:42) — *he shall fight for you*; the cause of taking the kings at one time.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=42
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-yahuah-fought-for-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Joshua 23:3 — the farewell confession: *Yahuah Elohaychem (the LORD your God) is he that hath fought for you*.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=42
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-yahuah-fought-for-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Joshua 23:10 — *One man of you shall chase a thousand: for... he it is that fighteth for you*; the disproportion is His signature.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=42
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-yahuah-fought-for-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 3 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 1:14 — the luminaries set *for signs, and for seasons*; Joshua speaks to the very lights Elohim made.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-sun-and-the-moon-stood-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 1:16 — *two great lights*; the sun and moon halt at their Maker''s word over Gibeon and Ajalon.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-sun-and-the-moon-stood-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Habakkuk 3:11 — *The sun and moon stood still in their habitation*; the prophet remembers the long day.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-sun-and-the-moon-stood-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 20:11 — Yahuah brings the shadow *ten degrees backward* for Hezekiah; twice He over-rules the sun at a man''s prayer.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-sun-and-the-moon-stood-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Jasher 88:63 — the cited book records the very prayer: *Sun, stand you still upon Gibeon, and you moon in the valley of Ajalon*.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=88 AND tv.verse_number=63
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-sun-and-the-moon-stood-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Jasher 88:64 — *the sun stood still in the midst of the heavens... and the moon also stood still*; the book Joshua 10:13 names, speaking.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=88 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-sun-and-the-moon-stood-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Jasher 88:65 — *there was no day like that... that Yahuah (the Lord) hearkened to the voice of a man, for Yahuah (the Lord) fought for Israel*; word for word with 10:14.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=88 AND tv.verse_number=65
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-the-sun-and-the-moon-stood-still'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 4 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 1:9 — *Be strong and of a good courage; be not afraid*; the commission word echoed in *Fear them not* (10:8).'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-fear-not-thus-shall-yahuah-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 1:21 — *fear not, neither be discouraged*; the Kadesh charge the wilderness refused, now obeyed.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-fear-not-thus-shall-yahuah-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Joshua 1:9 (to 10:25) — Joshua hands down to all Yashar''el the courage Yahuah first gave him.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-fear-not-thus-shall-yahuah-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 1:21 (to 10:25) — the Kadesh charge made good: the enemies given into their hand, fear undone.'
  FROM cross_reference_threads t
  JOIN _s344_jos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s344_jos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-10-fear-not-thus-shall-yahuah-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_11.sql (Joshua 11) -----
-- Book/chapter: Joshua 11   Tag: jos11   View: _s344_jos11_lookup
-- Sort band: base 35250, step 3 -> 35250, 35253, 35256, 35259
--
-- Joshua 11 coverage:
--   v.4 (sand-of-the-sea host, horses+chariots very many)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deuteronomy 17:16 (king not multiply horses), Psalm 20:7 (some trust in chariots) — bound in thread 1
--   v.6 (Be not afraid... hough their horses, burn their chariots)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deuteronomy 17:16, Psalm 20:7 — bound in thread 1
--   v.9 (he houghed their horses and burnt their chariots)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 20:7 — bound in thread 1
--   v.12 (utterly destroyed them, as Moses the servant of Yahuah commanded)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Joshua 1:7 (observe to do all the law) — bound in thread 2
--   v.15 (he left nothing undone of all that Yahuah commanded Moses) ★★ keystone
--        NT:     none warranted (Heb 11:30-31 is Jericho/Rahab, not this summary)
--        Extras: none warranted
--        Tanakh: Joshua 1:7, Joshua 1:8 (this book of the law shall not depart) — bound in thread 2
--   v.20 (it was of Yahuah to harden their hearts) ★ judicial hardening
--        NT:     none warranted (Rom 9:18 not in this curated set)
--        Extras: none warranted
--        Tanakh: Exodus 14:4, Exodus 14:17 (Pharaoh hardened), Genesis 15:16 (iniquity of Amorites not yet full) — bound in thread 3
--   v.21-22 (cut off the Anakims, none left in the land)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 13:32, Numbers 13:33 (giants, sons of Anak) — bound in thread 4
--   v.23 (Joshua took the whole land... and the land rested from war) ★ the rest
--        NT:     Hebrews 4:8, Hebrews 4:9 (a rest remaineth) — bound in thread 4
--        Extras: none warranted
--        Tanakh: Numbers 13 (seed-war remnant cleared) — bound in thread 4
--
-- Threads:
--   1. joshua-11-be-not-afraid-hough-their-horses-burn-their-chariots  [free]  (Tanakh: Deut, Psalm)
--   2. joshua-11-he-left-nothing-undone-of-all-that-yahuah-commanded-moses  [free]  (Tanakh: Joshua 1)
--   3. joshua-11-it-was-of-yahuah-to-harden-their-hearts  [free]  (Tanakh: Exodus, Genesis)
--   4. joshua-11-the-anakims-cut-off-and-the-land-rested-from-war  [free]  (Tanakh: Numbers; NT: Hebrews)

CREATE TEMP VIEW _s344_jos11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: not trusting in chariots
    ('canon','joshua',11,4,'canon','deuteronomy',17,16,'free',E'*But he shall not multiply horses to himself, nor cause the people to return to Egypt, to the end that he should multiply horses: forasmuch as Yahuah (LORD) hath said unto you, Ye shall henceforth return no more that way.* (Deuteronomy 17:16). The northern coalition comes *with horses and chariots very many* (Joshua 11:4), the strength Torah forbade Yashar''el''s own king to trust — the enemy''s confidence is the very thing the covenant teaches the redeemed to refuse.'),
    ('canon','joshua',11,4,'canon','psalms',20,7,'free',E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* (Psalm 20:7). The host gathered *as the sand that is upon the sea shore in multitude, with horses and chariots very many* (Joshua 11:4) — and Joshua''s answer is not a greater army but the Name; the Psalm sings the lesson the battle teaches.'),
    ('canon','joshua',11,6,'canon','deuteronomy',17,16,'free',E'*But he shall not multiply horses to himself... forasmuch as Yahuah (LORD) hath said unto you, Ye shall henceforth return no more that way.* (Deuteronomy 17:16). Yahuah commands Joshua, *thou shalt hough their horses, and burn their chariots with fire* (Joshua 11:6) — the captured war-machine is destroyed, not absorbed; obedience refuses the strength Torah told the king never to gather.'),
    ('canon','joshua',11,6,'canon','psalms',20,7,'free',E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* (Psalm 20:7). *Be not afraid because of them: for to morrow about this time will I deliver them up all slain... thou shalt hough their horses, and burn their chariots with fire* (Joshua 11:6) — Yahuah delivers, then has the horses crippled and the chariots burned, so that no man may afterward boast in them.'),
    ('canon','joshua',11,9,'canon','psalms',20,7,'free',E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* (Psalm 20:7). *And Joshua did unto them as Yahuah (LORD) bade him: he houghed their horses, and burnt their chariots with fire* (Joshua 11:9) — the obedient deed enacts the Psalm: the chariots are ash, the victory is credited to the Name alone.'),
    -- Thread 2: he left nothing undone of all that Yahuah commanded Moses
    ('canon','joshua',11,12,'canon','joshua',1,7,'free',E'*Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest.* (Joshua 1:7). Joshua smites the kings *as Moses the servant of Yahuah (LORD) commanded* (Joshua 11:12) — the conquest is Torah obeyed, *all the law... turn not from it,* the charge of chapter one carried out to the letter.'),
    ('canon','joshua',11,15,'canon','joshua',1,7,'free',E'*Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left.* (Joshua 1:7). The summary of the whole campaign — *he left nothing undone of all that Yahuah (LORD) commanded Moses* (Joshua 11:15) — is the answer to the opening charge: not a hand''s breadth turned aside, the full Torah-obedience the covenant requires, never the Torah as a curse but the inheritance done whole.'),
    ('canon','joshua',11,15,'canon','joshua',1,8,'free',E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success.* (Joshua 1:8). *As Yahuah (LORD) commanded Moses his servant, so did Moses command Joshua, and so did Joshua; he left nothing undone of all that Yahuah (LORD) commanded Moses* (Joshua 11:15) — the man who meditated in the book did *all that is written therein;* the promised prosperity is the land taken and rested.'),
    -- Thread 3: it was of Yahuah to harden their hearts
    ('canon','joshua',11,20,'canon','exodus',14,4,'free',E'*And I will harden Pharaoh’s heart, that he shall follow after them; and I will be honoured upon Pharaoh, and upon all his host; that the Egyptians may know that I am Yahuah (LORD). And they did so.* (Exodus 14:4). *For it was of Yahuah (LORD) to harden their hearts, that they should come against Yashar''el (Israel) in battle, that he might destroy them utterly* (Joshua 11:20) — the same judicial hand that hardened Pharaoh to draw him to the sea now draws the Amorite kings to the slaughter; the long-suffering ended, the judgment is His.'),
    ('canon','joshua',11,20,'canon','exodus',14,17,'free',E'*And I, behold, I will harden the hearts of the Egyptians, and they shall follow them: and I will get me honour upon Pharaoh, and upon all his host, upon his chariots, and upon his horsemen.* (Exodus 14:17). The hardening that brought Egypt''s chariots into the sea is the pattern of *it was of Yahuah (LORD) to harden their hearts, that they should come against Yashar''el (Israel) in battle* (Joshua 11:20) — Yahuah gives the obstinate over to the battle that ends them.'),
    ('canon','joshua',11,20,'canon','genesis',15,16,'free',E'*But in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full.* (Genesis 15:16). The hardening of Joshua 11:20 — *that he might destroy them utterly... as Yahuah (LORD) commanded Moses* — falls when the long-promised measure has run out: the Amorite''s iniquity, *not yet full* in Abram''s day, is full now, and the patient delay of four generations closes in judgment.'),
    -- Thread 4: the Anakims cut off and the land rested from war
    ('canon','joshua',11,21,'canon','numbers',13,33,'free',E'*And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* (Numbers 13:33). The very giants whose report turned a generation back from the land — *the sons of Anak* — are now *cut off from the mountains, from Hebron, from Debir, from Anab* (Joshua 11:21); the seed-war remnant that terrified the spies is cleared out by the obedient who went up.'),
    ('canon','joshua',11,22,'canon','numbers',13,32,'free',E'*And they brought up an evil report of the land which they had searched unto the children of Yashar''el (Israel), saying, The land, through which we have gone to search it, is a land that eateth up the inhabitants thereof; and all the people that we saw in it are men of a great stature.* (Numbers 13:32). The *evil report* of men *of a great stature* is undone by *There was none of the Anakims left in the land of the children of Yashar''el (Israel)* (Joshua 11:22) — what unbelief called unconquerable, obedience under Yahuah utterly removed.'),
    ('canon','joshua',11,23,'canon','hebrews',4,8,'free',E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day.* (Hebrews 4:8). *So Joshua took the whole land... and the land rested from war* (Joshua 11:23) — yet the writer to the Hebrews reads even this rest as a shadow pointing past Joshua to a greater rest still spoken of, the rest the Formed Son brings to the people of Elohim.'),
    ('canon','joshua',11,23,'canon','hebrews',4,9,'free',E'*There remaineth therefore a rest to the people of Elohim (God).* (Hebrews 4:9). The land that *rested from war* (Joshua 11:23) is the firstfruits of the promise; *there remaineth therefore a rest to the people of Elohim (God)* — the Sabbath-rest of the inheritance, given by tribes and divisions, opening forward to the consummate rest of the redeemed two-house people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-11-be-not-afraid-hough-their-horses-burn-their-chariots',
       E'Be not afraid — hough their horses, burn their chariots',
       E'The northern coalition under Jabin king of Hazor gathers a host *as the sand that is upon the sea shore in multitude, with horses and chariots very many* (Joshua 11:4). Against that strength Yahuah (LORD) says, *Be not afraid because of them: for to morrow about this time will I deliver them up all slain before Yashar''el (Israel): thou shalt hough their horses, and burn their chariots with fire* (Joshua 11:6) — and Joshua does it: *he houghed their horses, and burnt their chariots with fire* (Joshua 11:9). The captured war-machine is not absorbed but destroyed, because the covenant forbids trust in it: *he shall not multiply horses to himself... forasmuch as Yahuah (LORD) hath said unto you, Ye shall henceforth return no more that way* (Deuteronomy 17:16). The Psalm sings the very lesson of the battle: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7).',
       sv.verse_id, ev.verse_id, 'free', 35250
  FROM _s344_jos11_lookup sv, _s344_jos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-11-he-left-nothing-undone-of-all-that-yahuah-commanded-moses',
       E'He left nothing undone of all that Yahuah commanded Moses',
       E'Joshua smites the kings *as Moses the servant of Yahuah (LORD) commanded* (Joshua 11:12), and the campaign is summed in one line of total obedience: *As Yahuah (LORD) commanded Moses his servant, so did Moses command Joshua, and so did Joshua; he left nothing undone of all that Yahuah (LORD) commanded Moses* (Joshua 11:15). This is the answer to the opening charge of the book — *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left* (Joshua 1:7) — and to the meditating heart that holds it: *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein* (Joshua 1:8). The Torah is never the curse here; it is the inheritance done whole, not a hand''s breadth turned aside, and the promised good success is the land taken.',
       sv.verse_id, ev.verse_id, 'free', 35253
  FROM _s344_jos11_lookup sv, _s344_jos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=11 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-11-it-was-of-yahuah-to-harden-their-hearts',
       E'It was of Yahuah to harden their hearts — the Amorite''s iniquity full',
       E'*For it was of Yahuah (LORD) to harden their hearts, that they should come against Yashar''el (Israel) in battle, that he might destroy them utterly, and that they might have no favour, but that he might destroy them, as Yahuah (LORD) commanded Moses* (Joshua 11:20). This is the same judicial hand that drew Egypt to the sea: *And I will harden Pharaoh’s heart, that he shall follow after them; and I will be honoured upon Pharaoh* (Exodus 14:4); *I will harden the hearts of the Egyptians, and they shall follow them... upon his chariots, and upon his horsemen* (Exodus 14:17). Yahuah gives the obstinate over to the battle that ends them — and the timing is not arbitrary. Long before, He told Abram the delay had a measure: *in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full* (Genesis 15:16). Now it is full; the long-suffering is ended, and the judgment is His own, not Yashar''el''s vengeance.',
       sv.verse_id, ev.verse_id, 'free', 35256
  FROM _s344_jos11_lookup sv, _s344_jos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=11 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-11-the-anakims-cut-off-and-the-land-rested-from-war',
       E'The Anakims cut off — and the land rested from war',
       E'The giants whose report once turned a whole generation back from the land are now cleared out: *And at that time came Joshua, and cut off the Anakims from the mountains, from Hebron, from Debir, from Anab, and from all the mountains of Yahudah (Judah), and from all the mountains of Yashar''el (Israel)* (Joshua 11:21); *There was none of the Anakims left in the land of the children of Yashar''el (Israel)* (Joshua 11:22). At Kadesh the spies had *brought up an evil report... a land that eateth up the inhabitants thereof; and all the people that we saw in it are men of a great stature* (Numbers 13:32), wailing, *there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers* (Numbers 13:33). What unbelief called unconquerable, obedience under Yahuah utterly removed. And the chapter closes in rest: *So Joshua took the whole land, according to all that Yahuah (LORD) said unto Moses; and Joshua gave it for an inheritance unto Yashar''el (Israel) according to their divisions by their tribes. And the land rested from war* (Joshua 11:23). Yet the writer to the Hebrews reads even this rest as a shadow: *For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8) — *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9), the consummate Sabbath-rest the inheritance only foretells.',
       sv.verse_id, ev.verse_id, 'free', 35259
  FROM _s344_jos11_lookup sv, _s344_jos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He shall not multiply horses to himself... Ye shall henceforth return no more that way* (Deuteronomy 17:16) — the enemy''s *horses and chariots very many* are the strength Torah forbade the king to trust.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-be-not-afraid-hough-their-horses-burn-their-chariots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu* (Psalm 20:7) — the Psalm sings the lesson of the sand-of-the-sea host.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-be-not-afraid-hough-their-horses-burn-their-chariots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He shall not multiply horses to himself* (Deuteronomy 17:16) — Yahuah''s command to *hough their horses, and burn their chariots with fire* refuses the very strength the king was forbidden to gather.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-be-not-afraid-hough-their-horses-burn-their-chariots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Some trust in chariots... but we will remember the name of Yahuah Eloheinu* (Psalm 20:7) — *Be not afraid... thou shalt hough their horses, and burn their chariots with fire* leaves no chariot to boast in.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-be-not-afraid-hough-their-horses-burn-their-chariots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Some trust in chariots, and some in horses* (Psalm 20:7) — *Joshua did unto them as Yahuah (LORD) bade him: he houghed their horses, and burnt their chariots with fire* enacts the Psalm in deed.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-be-not-afraid-hough-their-horses-burn-their-chariots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Observe to do according to all the law... turn not from it to the right hand or to the left* (Joshua 1:7) — Joshua smites the kings *as Moses the servant of Yahuah commanded.*'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-he-left-nothing-undone-of-all-that-yahuah-commanded-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Observe to do according to all the law... turn not from it to the right hand or to the left* (Joshua 1:7) — the keystone summary *he left nothing undone of all that Yahuah commanded Moses* is the charge fulfilled to the letter.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=15
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-he-left-nothing-undone-of-all-that-yahuah-commanded-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*This book of the law shall not depart out of thy mouth... that thou mayest observe to do according to all that is written therein* (Joshua 1:8) — the man who meditated did *all,* leaving *nothing undone.*'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=15
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-he-left-nothing-undone-of-all-that-yahuah-commanded-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will harden Pharaoh’s heart, that he shall follow after them; and I will be honoured upon Pharaoh* (Exodus 14:4) — the same hand draws the Amorite kings to the battle that ends them.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=20
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-it-was-of-yahuah-to-harden-their-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will harden the hearts of the Egyptians... upon his chariots, and upon his horsemen* (Exodus 14:17) — the hardening that brought Egypt''s chariots into the sea is the pattern at Merom.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=20
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-it-was-of-yahuah-to-harden-their-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The iniquity of the Amorites is not yet full* (Genesis 15:16) — the long-suffering foretold to Abram is ended; the measure full, the judgment falls.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=20
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-it-was-of-yahuah-to-harden-their-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*There we saw the giants, the sons of Anak... we were in our own sight as grasshoppers* (Numbers 13:33) — the giants that terrified the spies are *cut off* by Joshua.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=21
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-the-anakims-cut-off-and-the-land-rested-from-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*An evil report... a land that eateth up the inhabitants thereof... men of a great stature* (Numbers 13:32) — undone by *There was none of the Anakims left in the land.*'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=22
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-the-anakims-cut-off-and-the-land-rested-from-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8) — *the land rested from war* is a shadow pointing past Joshua to a greater rest.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-the-anakims-cut-off-and-the-land-rested-from-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — the inheritance that rested from war foretells the consummate Sabbath-rest of the redeemed.'
  FROM cross_reference_threads t
  JOIN _s344_jos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=11 AND sv.verse_number=23
  JOIN _s344_jos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-11-the-anakims-cut-off-and-the-land-rested-from-war'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_13.sql (Joshua 13) -----
-- Joshua 13 — Joshua is old, and there remaineth yet very much land to be possessed;
--   the land divided among the tribes; LEVI receives no land — Yahuah Himself is his inheritance;
--   the east-of-Jordan portion of Reuben, Gad, half-Manasseh which Moses gave.
--   Tag jos13; view _s344_jos13_lookup.
-- Sort band base 35300, step 3 (35300, 35303, 35306).
--
-- Joshua 13 coverage:
--   v.1  (Joshua old; there remaineth yet very much land to be possessed)
--        NT:     Hebrews 4:8-9 (there remaineth a rest — the promise not yet fully entered) — THREAD 2
--        Extras: none warranted
--        Tanakh: Joshua 23:4, 23:5 (the nations that remain, yet to be possessed) — THREAD 2
--   v.6  (only divide thou it by lot... for an inheritance, as I have commanded)
--        NT:     none warranted (carried by the much-land-remaining thread)
--        Extras: none warranted
--        Tanakh: carried by THREAD 2
--   v.8  (Reuben, Gad received their inheritance which Moses gave, beyond Jordan eastward)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 32:33 (Moses gave the kingdom of Sihon and Og east of Jordan) — THREAD 3
--   v.14 (★★ unto Levi he gave none inheritance; the sacrifices made by fire are their inheritance)
--        NT:     none warranted (the priestly-portion motif stays Tanakh+Psalms here)
--        Extras: none warranted
--        Tanakh: Numbers 18:20; Deuteronomy 10:9; Deuteronomy 18:1, 18:2; Psalm 16:5; Psalm 73:26 — THREAD 1
--   v.33 (★★ unto Levi Moses gave not any inheritance: YAHUAH ELOHIM of Yashar'el was their inheritance)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 18:20; Deuteronomy 10:9; Psalm 16:5; Psalm 73:26 — THREAD 1
--   vv.2-5,9-13,15-32 (the boundary lists / coast descriptions)
--        NT/Extras/Tanakh: none warranted — boundary-list verses, not threaded (brief instruction: keep lean)
--
-- THREADS:
--   THREAD 1 joshua-13-levi-s-inheritance-is-yahuah-himself (free): Tanakh (Numbers, Deuteronomy, Psalms) — THE KEYSTONE
--   THREAD 2 joshua-13-there-remaineth-yet-very-much-land (free): Tanakh (Joshua 23) + NT (Hebrews 4)
--   THREAD 3 joshua-13-the-inheritance-which-moses-gave-beyond-jordan (free): Tanakh (Numbers 32)
--
-- Framework-load-bearing notes:
--   * 13:14,33 ★★ Levi's portion is YAHUAH HIMSELF, not land. The priestly tribe receives no
--     territory because *I am thy part and thine inheritance* (Num 18:20); *Yahuah (LORD) is his
--     inheritance* (Deut 10:9; Deut 18:2). The Psalms deepen it from the priesthood to every
--     believer whose portion is Yahuah: *Yahuah (LORD) is the portion of mine inheritance* (Ps 16:5),
--     *Elohim... is the strength of my heart, and my portion for ever* (Ps 73:26). The deepest
--     inheritance is the Giver, not the gift.
--   * 13:1 the land not yet fully entered = the promise still to be claimed; Joshua 23 names the
--     nations that remain, and Hebrews 4 reads the unfinished entering forward — *There remaineth
--     therefore a rest to the people of Elohim* — Torah's rest never abolished, only not yet fully
--     possessed.
--   * 13:8 the east-Jordan inheritance Moses gave Reuben/Gad/half-Manasseh = Numbers 32 kept; the
--     two-and-a-half tribes' portion, the same twelve-tribe inheritance reaching across Jordan.

CREATE TEMP VIEW _s344_jos13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — Levi's inheritance is Yahuah Himself (13:14, 13:33)
    ('canon','joshua',13,14,'canon','numbers',18,20,'free',E'*And Yahuah (LORD) spake unto Aaron, Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). This is the law Joshua now keeps: *Only unto the tribe of Levi he gave none inheritance; the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance* (Joshua 13:14). The priestly tribe receives no land because Yahuah Himself said *I am thy part* — the Giver is the portion, not the gift.'),
    ('canon','joshua',13,14,'canon','deuteronomy',10,9,'free',E'*Wherefore Levi hath no part nor inheritance with his brethren; Yahuah (LORD) is his inheritance, according as Yahuah Elohayka (the LORD thy God) promised him* (Deuteronomy 10:9). Moses'' word stands fulfilled in the land: *unto the tribe of Levi he gave none inheritance; the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance* (Joshua 13:14). The tribe set apart to bear the ark and minister has the deepest portion of all — *Yahuah (LORD) is his inheritance*.'),
    ('canon','joshua',13,14,'canon','deuteronomy',18,1,'free',E'*The priests the Levites, and all the tribe of Levi, shall have no part nor inheritance with Yashar''el (Israel): they shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance* (Deuteronomy 18:1). Joshua 13:14 echoes the very phrase — *the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance*. The offerings made by fire are Levi''s bread, for Yahuah''s own portion is theirs to share.'),
    ('canon','joshua',13,14,'canon','deuteronomy',18,2,'free',E'*Therefore shall they have no inheritance among their brethren: Yahuah (LORD) is their inheritance, as he hath said unto them* (Deuteronomy 18:2). The same *as he hath said unto them* closes Joshua''s record: *the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance, as he said unto them* (Joshua 13:14). Land withheld is no loss when Yahuah is the inheritance.'),
    ('canon','joshua',13,14,'canon','psalms',16,5,'free',E'*Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). What was Levi''s alone — *the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance* (Joshua 13:14) — David sings as his own deepest possession. *Yahuah (LORD) is the portion of mine inheritance*: the priestly portion opens to every heart that takes the Giver as its lot.'),
    ('canon','joshua',13,33,'canon','numbers',18,20,'free',E'*And Yahuah (LORD) spake unto Aaron, Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). Joshua repeats the law as the climax of the whole allotment: *But unto the tribe of Levi Moses gave not any inheritance: Yahuah Elohim (the LORD God) of Yashar''el (Israel) was their inheritance, as he said unto them* (Joshua 13:33). What Yahuah declared to Aaron — *I am thy part* — is now graven into the land: Yahuah Himself, not territory, is Levi''s portion.'),
    ('canon','joshua',13,33,'canon','deuteronomy',10,9,'free',E'*Wherefore Levi hath no part nor inheritance with his brethren; Yahuah (LORD) is his inheritance, according as Yahuah Elohayka (the LORD thy God) promised him* (Deuteronomy 10:9). Joshua 13:33 seals the promise in fact: *Yahuah Elohim (the LORD God) of Yashar''el (Israel) was their inheritance, as he said unto them*. The tribe that stands before Yahuah to minister holds Yahuah Himself as its everlasting heritage.'),
    ('canon','joshua',13,33,'canon','psalms',16,5,'free',E'*Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). The climactic word of the chapter — *Yahuah Elohim (the LORD God) of Yashar''el (Israel) was their inheritance, as he said unto them* (Joshua 13:33) — is the very confession David makes his own. The Levite''s portion becomes the song of every soul whose lot Yahuah maintains.'),
    ('canon','joshua',13,33,'canon','psalms',73,26,'free',E'*My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever* (Psalm 73:26). Asaph reaches the same bottom Joshua records of Levi: *Yahuah Elohim (the LORD God) of Yashar''el (Israel) was their inheritance, as he said unto them* (Joshua 13:33). When all else fails, the portion that cannot fail is Yahuah Himself — *my portion for ever*.'),
    -- THREAD 2 — there remaineth yet very much land to be possessed (13:1)
    ('canon','joshua',13,1,'canon','joshua',23,4,'free',E'*Behold, I have divided unto you by lot these nations that remain, to be an inheritance for your tribes, from Jordan, with all the nations that I have cut off, even unto the great sea westward* (Joshua 23:4). Joshua''s farewell answers the charge of his old age: *there remaineth yet very much land to be possessed* (Joshua 13:1). The land is given by promise and divided by lot, yet *these nations that remain* are still to be entered — the inheritance is sure but not yet wholly claimed.'),
    ('canon','joshua',13,1,'canon','joshua',23,5,'free',E'*And Yahuah Elohaychem (the LORD your God), he shall expel them from before you, and drive them from out of your sight; and ye shall possess their land, as Yahuah Elohaychem (the LORD your God) hath promised unto you* (Joshua 23:5). The much land that *yet remaineth* (Joshua 13:1) is Yahuah''s to give: *he shall expel them from before you... as Yahuah Elohaychem (the LORD your God) hath promised*. The promise stands; the possessing is still to come.'),
    ('canon','joshua',13,1,'canon','hebrews',4,8,'free',E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8). Even after Joshua led them in, *there remaineth yet very much land to be possessed* (Joshua 13:1) — the entering was never finished. Hebrews reads it forward: the rest Joshua gave was a figure, not the full possession, for Yahuah spoke of *another day* still to be entered.'),
    ('canon','joshua',13,1,'canon','hebrews',4,9,'free',E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The very word of Joshua 13:1 — *there remaineth yet very much land to be possessed* — is the figure Hebrews carries to its end: *there remaineth therefore a rest*. The land not yet fully entered pictures the promised rest still to be claimed; the inheritance is held out, the possessing yet ahead.'),
    -- THREAD 3 — the inheritance which Moses gave beyond Jordan eastward (13:8)
    ('canon','joshua',13,8,'canon','numbers',32,33,'free',E'*And Moses gave unto them, even to the children of Gad, and to the children of Reuben, and unto half the tribe of Manasseh the son of Joseph, the kingdom of Sihon king of the Amorites, and the kingdom of Og king of Bashan, the land, with the cities thereof* (Numbers 32:33). Joshua records this same grant: *the Reubenites and the Gadites have received their inheritance, which Moses gave them, beyond Jordan eastward* (Joshua 13:8). The two-and-a-half tribes'' portion east of Jordan was Moses'' deed, now honoured in the dividing of the land; the twelve-tribe inheritance reaches across the river.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 — Levi's inheritance is Yahuah Himself (free) — THE KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-13-levi-s-inheritance-is-yahuah-himself',
       E'Joshua 13 — Levi''s Inheritance Is Yahuah Himself: the Portion That Is the Giver',
       E'When the land was divided, one tribe received no field, no border, no city of its own — and that tribe held the richest portion of all. *Only unto the tribe of Levi he gave none inheritance; the sacrifices of Yahuah Elohim (the LORD God) of Yashar''el (Israel) made by fire are their inheritance, as he said unto them* (Joshua 13:14); and again, as the climax of the whole allotment, *But unto the tribe of Levi Moses gave not any inheritance: Yahuah Elohim (the LORD God) of Yashar''el (Israel) was their inheritance, as he said unto them* (Joshua 13:33). This keeps the word Yahuah spoke to Aaron: *Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). Moses had said it twice over — *Wherefore Levi hath no part nor inheritance with his brethren; Yahuah (LORD) is his inheritance* (Deuteronomy 10:9); *The priests the Levites... shall have no part nor inheritance with Yashar''el (Israel): they shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance... Yahuah (LORD) is their inheritance, as he hath said unto them* (Deuteronomy 18:1-2). The tribe set apart to bear the ark and stand before Yahuah is given Yahuah Himself. And what was Levi''s alone the Psalms open to every heart: *Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5); *My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever* (Psalm 73:26). This is the deepest inheritance the covenant offers — not the land, but the One who gave it; not the gift, but the Giver, the portion that fails not for ever.',
       sv.verse_id, ev.verse_id, 'free', 35300
  FROM _s344_jos13_lookup sv, _s344_jos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=13 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 — there remaineth yet very much land to be possessed (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-13-there-remaineth-yet-very-much-land',
       E'Joshua 13 — There Remaineth Yet Very Much Land: the Promise Not Yet Fully Entered',
       E'*Now Joshua was old and stricken in years; and Yahuah (LORD) said unto him, Thou art old and stricken in years, and there remaineth yet very much land to be possessed* (Joshua 13:1). The conqueror is aged, the land is divided by lot, and still the inheritance is not wholly claimed. Joshua''s own farewell names the same unfinished work: *Behold, I have divided unto you by lot these nations that remain, to be an inheritance for your tribes* (Joshua 23:4); *And Yahuah Elohaychem (the LORD your God), he shall expel them from before you... and ye shall possess their land, as Yahuah Elohaychem (the LORD your God) hath promised unto you* (Joshua 23:5). The promise is certain — Yahuah will drive them out — yet the possessing is still ahead. Hebrews carries the figure to its end: *For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8); *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The rest Joshua led them into was real but not yet full — a picture of the inheritance held out and the rest still to be entered. Much land remaineth; the promise stands; the people of Yahuah press on to possess it.',
       sv.verse_id, ev.verse_id, 'free', 35303
  FROM _s344_jos13_lookup sv, _s344_jos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=13 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 — the inheritance which Moses gave beyond Jordan eastward (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-13-the-inheritance-which-moses-gave-beyond-jordan',
       E'Joshua 13 — The Inheritance Which Moses Gave Beyond Jordan Eastward',
       E'Before the lot fell west of Jordan, two tribes and a half had already received their portion to the east — and Joshua honours that earlier grant: *With whom the Reubenites and the Gadites have received their inheritance, which Moses gave them, beyond Jordan eastward, even as Moses the servant of Yahuah (LORD) gave them* (Joshua 13:8). This keeps the deed of Numbers 32: *And Moses gave unto them, even to the children of Gad, and to the children of Reuben, and unto half the tribe of Manasseh the son of Joseph, the kingdom of Sihon king of the Amorites, and the kingdom of Og king of Bashan, the land, with the cities thereof* (Numbers 32:33). The cattle-rich tribes asked for Gilead and Bashan, vowed to cross armed before their brethren until all Yashar''el inherited, and Moses gave them their place east of the river. The twelve-tribe inheritance reaches across Jordan; what Moses the servant of Yahuah granted, Joshua confirms as the land is parted among the tribes.',
       sv.verse_id, ev.verse_id, 'free', 35306
  FROM _s344_jos13_lookup sv, _s344_jos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD 1 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 18:20 — *I am thy part and thine inheritance among the children of Yashar''el (Israel)*; the law Joshua 13:14 keeps — Yahuah Himself is Levi''s portion.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 10:9 — *Yahuah (LORD) is his inheritance*; Moses'' word kept in the land — Levi''s portion is Yahuah.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 18:1 — *they shall eat the offerings of Yahuah (LORD) made by fire, and his inheritance*; the same offerings-made-by-fire are Levi''s bread (Joshua 13:14).'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 18:2 — *Yahuah (LORD) is their inheritance, as he hath said unto them*; the very phrase Joshua 13:14 echoes — *as he said unto them*.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 16:5 — *Yahuah (LORD) is the portion of mine inheritance and of my cup*; the priestly portion opens to every heart that takes the Giver as its lot.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Numbers 18:20 — *I am thy part and thine inheritance*; the climactic word of the chapter (Joshua 13:33) is the law fulfilled — Yahuah Himself, not land.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=33
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Deuteronomy 10:9 — *Yahuah (LORD) is his inheritance*; the promise sealed in fact (Joshua 13:33) — the ministering tribe holds Yahuah as its heritage.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=33
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Psalm 16:5 — *Yahuah (LORD) is the portion of mine inheritance*; David sings the Levite''s climax (Joshua 13:33) as his own confession.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=33
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Psalm 73:26 — *Elohim (God) is the strength of my heart, and my portion for ever*; when all else fails, the portion that cannot fail is Yahuah Himself (Joshua 13:33).'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=33
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-levi-s-inheritance-is-yahuah-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 2 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 23:4 — *these nations that remain, to be an inheritance for your tribes*; the same unfinished work Joshua 13:1 names — divided by lot, not yet wholly entered.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-there-remaineth-yet-very-much-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 23:5 — *he shall expel them from before you... as Yahuah Elohaychem (the LORD your God) hath promised*; the much land yet remaining (Joshua 13:1) is Yahuah''s to give.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-there-remaineth-yet-very-much-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 4:8 — *if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day*; Joshua''s rest was a figure, the entering never finished (Joshua 13:1).'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-there-remaineth-yet-very-much-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God)*; the very word of Joshua 13:1 — the land not yet possessed pictures the promised rest still to be claimed.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-there-remaineth-yet-very-much-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 3 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 32:33 — *Moses gave... the kingdom of Sihon... and the kingdom of Og... the land*; the east-Jordan grant Joshua 13:8 confirms for Reuben, Gad, half-Manasseh.'
  FROM cross_reference_threads t
  JOIN _s344_jos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=13 AND sv.verse_number=8
  JOIN _s344_jos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=32 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-13-the-inheritance-which-moses-gave-beyond-jordan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_14.sql (Joshua 14) -----
-- Joshua 14 — the land divided by lot; Caleb the son of Jephunneh, who WHOLLY
--   FOLLOWED Yahuah, comes to Joshua at Gilgal, recalls the faithful spy-report and
--   Moses' oath, and at eighty-five asks for his mountain Hebron where the Anakim are.
--   Tag jos14; view _s344_jos14_lookup. Sort band base 35325, step 3 (35325, 35328, 35331, 35334).
--
-- SEED-LINE NOTE (framework): Caleb is twice called "the Kenezite/Kenizzite" (14:6,14) and
--   elsewhere mocked as of foreign-origin stock — but he is here reckoned of YAHUDAH (Judah):
--   *Then the children of Yahudah (Judah) came unto Joshua in Gilgal: and Caleb the son of
--   Jephunneh the Kenezite said unto him* (14:6); Numbers 13:6 names him *Of the tribe of
--   Yahudah (Judah), Caleb the son of Jephunneh*. He stands in the seed by PATERNAL lineage
--   AND covenant (the foreign mother absorbed by the marriage-covenant) — NOT a Gentile grafted
--   in by faith-confession. The frame honors the seed-line; do not Christianize him into a
--   replacement-theology proof-text.
--
-- Joshua 14 coverage:
--   v.1-2  (the inheritance by LOT, as Yahuah commanded by Moses)
--          NT:     none warranted (the apportioning motif stays Tanakh)
--          Extras: none warranted
--          Tanakh: Numbers 26:55, Numbers 33:54 (divide by lot) — THREAD 4
--   v.6    (Caleb of Yahudah comes; what Yahuah said at Kadesh-barnea)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Numbers 13:6 (Caleb of the tribe of Yahudah) — THREAD 1 (seed-line)
--   v.7-9  (the faithful report; Moses' oath of the inheritance because he wholly followed)
--          NT:     none warranted (carried by the inheritance/faith threads)
--          Extras: none warranted
--          Tanakh: Numbers 13:30; Numbers 14:24; Deuteronomy 1:36 — THREAD 1
--   v.10-12 (kept alive 45 yrs; fourscore-and-five; strength undimmed; GIVE ME THIS MOUNTAIN)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Psalm 92:13, Psalm 92:14 (planted, bring forth fruit in old age) — THREAD 2
--   v.13-14 (Joshua blesses; Hebron the inheritance because he wholly followed Yahuah)
--          NT:     Hebrews 3:18, 3:19 (the unbelieving could not enter for unbelief);
--                  Hebrews 6:12 (faith and patience inherit the promises) — THREAD 3
--          Extras: none warranted
--          Tanakh: Numbers 14:24, Deuteronomy 1:36 (the faithful inherit) — THREAD 1 & 3
--
-- THREADS:
--   THREAD 1 joshua-14-caleb-wholly-followed-yahuah-another-spirit (free): Tanakh only (Numbers 13, Numbers 14, Deuteronomy 1)
--   THREAD 2 joshua-14-give-me-this-mountain-fruit-in-old-age (free): Tanakh only (Psalm 92)
--   THREAD 3 joshua-14-the-inheritance-of-the-faithful-while-the-unbelieving-fell (free): NT (Hebrews 3, Hebrews 6) + Tanakh (Numbers, Deuteronomy)
--   THREAD 4 joshua-14-the-inheritance-by-lot-as-yahuah-commanded (free): Tanakh only (Numbers 26, Numbers 33)
--
-- Framework-load-bearing notes:
--   * 14:8,9,14 *I wholly followed Yahuah Elohai* — the keystone. Numbers 14:24 names WHY:
--     *because he had ANOTHER SPIRIT with him, and hath followed me fully*. The faithful spy
--     (Num 13:30) over against the ten who made the heart of the people melt. The seed inherits
--     by following Yahuah fully, the paternal line of Yahudah (Num 13:6) + covenant-faith.
--   * 14:10-12 *I am this day fourscore and five years old... as yet I am as strong this day* —
--     the undimmed faith and strength of the man who wholly followed; Psalm 92:14 *They shall
--     still bring forth fruit in old age* sings the same: the righteous planted in Yahuah's house.
--   * 14:13-14 Hebron given *because that he wholly followed Yahuah* — the inheritance of the
--     faithful, set AGAINST the unbelieving generation whose carcases fell and who could NOT
--     enter the rest for unbelief (Heb 3:18-19); *followers of them who through faith and
--     patience inherit the promises* (Heb 6:12). Faith that inherits is Torah-faithful following,
--     not a bare confession — Caleb FOLLOWED Yahuah fully.

CREATE TEMP VIEW _s344_jos14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — Caleb wholly followed Yahuah; another spirit (14:6, 14:8, 14:9, 14:14)
    ('canon','joshua',14,6,'canon','numbers',13,6,'free',E'*Of the tribe of Yahudah (Judah), Caleb the son of Jephunneh* (Numbers 13:6). When *the children of Yahudah (Judah) came unto Joshua in Gilgal: and Caleb the son of Jephunneh the Kenezite said unto him* (Joshua 14:6), Caleb comes reckoned in the seed of Yahudah — the paternal line that the spy-list itself records. The "Kenezite" name marks his foreign-origin stock, but he stands in the covenant by his Yahudite lineage, not grafted in by confession alone.'),
    ('canon','joshua',14,8,'canon','numbers',13,30,'free',E'*And Caleb stilled the people before Moses, and said, Let us go up at once, and possess it; for we are well able to overcome it* (Numbers 13:30). This is the faithful report Caleb recalls: *Nevertheless my brethren that went up with me made the heart of the people melt: but I wholly followed Yahuah Elohai (the LORD my God)* (Joshua 14:8). While ten made the heart melt, Caleb stilled the people — the one who wholly followed against the many who feared.'),
    ('canon','joshua',14,8,'canon','numbers',14,24,'free',E'*But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). Yahuah Himself names why Caleb *wholly followed* (Joshua 14:8): *another spirit* was with him — and *his seed shall possess it*. The inheritance is promised to the man who followed Yahuah fully, and to his seed after him.'),
    ('canon','joshua',14,9,'canon','numbers',14,24,'free',E'*But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). *And Moses sware on that day, saying, Surely the land whereon thy feet have trodden shall be thine inheritance, and thy children''s for ever, because thou hast wholly followed Yahuah Elohai (the LORD my God)* (Joshua 14:9) — the oath rests on the very ground Yahuah named: the *another spirit*, the full following, the seed possessing the land.'),
    ('canon','joshua',14,9,'canon','deuteronomy',1,36,'free',E'*Save Caleb the son of Jephunneh; he shall see it, and to him will I give the land that he hath trodden upon, and to his children, because he hath wholly followed Yahuah (LORD)* (Deuteronomy 1:36). Moses'' oath in Joshua 14:9 — *the land whereon thy feet have trodden shall be thine inheritance, and thy children''s for ever, because thou hast wholly followed* — is the word Yahuah spoke through Moses at Kadesh, now claimed at Gilgal: the land Caleb''s foot trod, given because he followed fully.'),
    ('canon','joshua',14,14,'canon','numbers',14,24,'free',E'*But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 14:14). The promise of the *another spirit* who *followed me fully* is kept to the letter: the seed possesses the very land.'),
    -- THREAD 2 — give me this mountain; fruit in old age (14:10, 14:11, 14:12)
    ('canon','joshua',14,11,'canon','psalms',92,14,'free',E'*They shall still bring forth fruit in old age; they shall be fat and flourishing* (Psalm 92:14). At fourscore and five Caleb says *As yet I am as strong this day as I was in the day that Moses sent me: as my strength was then, even so is my strength now, for war* (Joshua 14:11) — the undimmed strength of the man who wholly followed Yahuah, the righteous who *still bring forth fruit in old age*, flourishing because they are planted in Him.'),
    ('canon','joshua',14,12,'canon','psalms',92,13,'free',E'*Those that be planted in the house of Yahuah (LORD) shall flourish in the courts of our Elohim (God)* (Psalm 92:13). *Now therefore give me this mountain, whereof Yahuah (LORD) spake in that day... if so be Yahuah (LORD) will be with me, then I shall be able to drive them out, as Yahuah (LORD) said* (Joshua 14:12). The planted man flourishes — Caleb asks not for ease but for the mountain of the Anakim, his faith as green at eighty-five as the day Moses sent him.'),
    ('canon','joshua',14,10,'canon','psalms',92,14,'free',E'*They shall still bring forth fruit in old age; they shall be fat and flourishing* (Psalm 92:14). *And now, behold, Yahuah (LORD) hath kept me alive, as he said, these forty and five years... and now, lo, I am this day fourscore and five years old* (Joshua 14:10). The Psalm sings what Caleb embodies: Yahuah keeps the faithful alive and fruitful into old age, the preserved strength of the man who followed Him fully.'),
    -- THREAD 3 — the inheritance of the faithful while the unbelieving fell (14:9, 14:13, 14:14)
    ('canon','joshua',14,14,'canon','hebrews',3,18,'free',E'*And to whom sware he that they should not enter into his rest, but to them that believed not?* (Hebrews 3:18). Set against the generation barred from the rest stands Caleb: *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 14:14). The unbelieving fell in the wilderness; the man who wholly followed inherited his mountain.'),
    ('canon','joshua',14,14,'canon','hebrews',3,19,'free',E'*So we see that they could not enter in because of unbelief* (Hebrews 3:19). The contrast is the whole point of Joshua 14:14: while the unbelieving *could not enter in*, *Hebron... became the inheritance of Caleb... because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel)*. Unbelief forfeits the rest; following Yahuah fully inherits it.'),
    ('canon','joshua',14,13,'canon','hebrews',6,12,'free',E'*That ye be not slothful, but followers of them who through faith and patience inherit the promises* (Hebrews 6:12). *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance* (Joshua 14:13). Caleb is the very pattern Hebrews holds up — the man who *through faith and patience* (forty-five years of waiting) *inherited the promise*, the mountain Moses sware to him.'),
    ('canon','joshua',14,9,'canon','hebrews',6,12,'free',E'*That ye be not slothful, but followers of them who through faith and patience inherit the promises* (Hebrews 6:12). Moses sware *the land whereon thy feet have trodden shall be thine inheritance... because thou hast wholly followed Yahuah Elohai (the LORD my God)* (Joshua 14:9), and Caleb waited forty-five years to claim it — *faith and patience* inheriting the promise. The faith that inherits is the full following of Yahuah, not a bare confession.'),
    ('canon','joshua',14,14,'canon','numbers',14,24,'free',E'*But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). The whole wilderness generation murmured and fell, but Caleb *wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 14:14) and inherited — the faithful spy with *another spirit*, set against the carcases that fell for unbelief.'),
    -- THREAD 4 — the inheritance by lot, as Yahuah commanded (14:1, 14:2)
    ('canon','joshua',14,2,'canon','numbers',26,55,'free',E'*Notwithstanding the land shall be divided by lot: according to the names of the tribes of their fathers they shall inherit* (Numbers 26:55). *By lot was their inheritance, as Yahuah (LORD) commanded by the hand of Moses, for the nine tribes, and for the half tribe* (Joshua 14:2). The apportioning is no man''s scheme — the lot is Yahuah''s choice, the inheritance falling by His hand exactly as He commanded through Moses.'),
    ('canon','joshua',14,2,'canon','numbers',33,54,'free',E'*And ye shall divide the land by lot for an inheritance among your families... every man''s inheritance shall be in the place where his lot falleth; according to the tribes of your fathers ye shall inherit* (Numbers 33:54). *By lot was their inheritance, as Yahuah (LORD) commanded by the hand of Moses* (Joshua 14:2) — the commandment given before the Jordan is now kept beyond it, the tribes inheriting where Yahuah''s lot falls, by the tribes of their fathers.'),
    ('canon','joshua',14,1,'canon','numbers',26,55,'free',E'*Notwithstanding the land shall be divided by lot: according to the names of the tribes of their fathers they shall inherit* (Numbers 26:55). *And these are the countries which the children of Yashar''el (Israel) inherited in the land of Canaan, which Eleazar the priest, and Joshua the son of Nun, and the heads of the fathers of the tribes... distributed for inheritance to them* (Joshua 14:1). Eleazar and Joshua distribute exactly as commanded — *according to the names of the tribes of their fathers* — the seed inheriting by the paternal tribes.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 — Caleb wholly followed Yahuah; another spirit (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-14-caleb-wholly-followed-yahuah-another-spirit',
       E'Joshua 14 — Caleb Wholly Followed Yahuah: the Man with Another Spirit',
       E'Caleb comes to Joshua at Gilgal and rests his whole claim on one thing — that he followed Yahuah fully. *Then the children of Yahudah (Judah) came unto Joshua in Gilgal: and Caleb the son of Jephunneh the Kenezite said unto him... Forty years old was I when Moses the servant of Yahuah (LORD) sent me from Kadesh-barnea to espy out the land; and I brought him word again as it was in mine heart. Nevertheless my brethren that went up with me made the heart of the people melt: but I wholly followed Yahuah Elohai (the LORD my God)* (Joshua 14:6-8). He is reckoned of the seed of Yahudah by his father''s line — *Of the tribe of Yahudah (Judah), Caleb the son of Jephunneh* (Numbers 13:6) — and the "Kenezite" name marks only his foreign-origin stock, absorbed by covenant, not a Gentile grafted in by confession. While the ten made the heart of the people melt, Caleb stilled them: *Let us go up at once, and possess it; for we are well able to overcome it* (Numbers 13:30). And Yahuah Himself named the reason the land would be his: *But my servant Caleb, because he had another spirit with him, and hath followed me fully, him will I bring into the land whereinto he went; and his seed shall possess it* (Numbers 14:24). Moses sware on it — *Save Caleb the son of Jephunneh; he shall see it... because he hath wholly followed Yahuah (LORD)* (Deuteronomy 1:36) — and the chapter seals it: *Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 14:14). The seed inherits by following Yahuah fully — paternal line and covenant-faith together, never one without the other.',
       sv.verse_id, ev.verse_id, 'free', 35325
  FROM _s344_jos14_lookup sv, _s344_jos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=14 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 — give me this mountain; fruit in old age (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-14-give-me-this-mountain-fruit-in-old-age',
       E'Joshua 14 — Give Me This Mountain: the Undimmed Strength of the Faithful',
       E'Forty-five years of wilderness have not aged Caleb''s faith. *And now, behold, Yahuah (LORD) hath kept me alive, as he said, these forty and five years... and now, lo, I am this day fourscore and five years old. As yet I am as strong this day as I was in the day that Moses sent me: as my strength was then, even so is my strength now, for war, both to go out, and to come in* (Joshua 14:10-11). And he asks not for the easy valley but the mountain of the giants: *Now therefore give me this mountain, whereof Yahuah (LORD) spake in that day; for thou heardest in that day how the Anakims were there, and that the cities were great and fenced: if so be Yahuah (LORD) will be with me, then I shall be able to drive them out, as Yahuah (LORD) said* (Joshua 14:12). This is the Psalm made flesh: *Those that be planted in the house of Yahuah (LORD) shall flourish in the courts of our Elohim (God). They shall still bring forth fruit in old age; they shall be fat and flourishing* (Psalm 92:13-14). The man planted in Yahuah does not wither — at eighty-five his strength is undimmed, his faith green, because the same Yahuah who preserved him is with him still against the Anakim.',
       sv.verse_id, ev.verse_id, 'free', 35328
  FROM _s344_jos14_lookup sv, _s344_jos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=14 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 — the inheritance of the faithful while the unbelieving fell (free; NT members)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-14-the-inheritance-of-the-faithful-while-the-unbelieving-fell',
       E'Joshua 14 — The Inheritance of the Faithful: Caleb Entered, the Unbelieving Fell',
       E'Caleb''s mountain is the answer to the wilderness''s grave. *And Joshua blessed him, and gave unto Caleb the son of Jephunneh Hebron for an inheritance. Hebron therefore became the inheritance of Caleb the son of Jephunneh the Kenezite unto this day, because that he wholly followed Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 14:13-14). The whole evil generation murmured and was barred — *But my servant Caleb, because he had another spirit with him, and hath followed me fully... his seed shall possess it* (Numbers 14:24) — and the New Testament reads exactly this contrast into the rest of Yahuah: *And to whom sware he that they should not enter into his rest, but to them that believed not? So we see that they could not enter in because of unbelief* (Hebrews 3:18-19). The unbelieving forfeited the rest; the man who wholly followed inherited it. And Caleb waited forty-five years for the promise — the very pattern held up to imitate: *That ye be not slothful, but followers of them who through faith and patience inherit the promises* (Hebrews 6:12). The faith that inherits is no bare assent — it is Caleb''s full following of Yahuah, faith and patience together, the seed possessing the land Moses sware.',
       sv.verse_id, ev.verse_id, 'free', 35331
  FROM _s344_jos14_lookup sv, _s344_jos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=14 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 — the inheritance by lot, as Yahuah commanded (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-14-the-inheritance-by-lot-as-yahuah-commanded',
       E'Joshua 14 — The Inheritance by Lot: Yahuah''s Choice, the Tribes of the Fathers',
       E'The land is not seized by the strong nor parcelled by men''s favor — it falls by the lot of Yahuah. *And these are the countries which the children of Yashar''el (Israel) inherited in the land of Canaan, which Eleazar the priest, and Joshua the son of Nun, and the heads of the fathers of the tribes of the children of Yashar''el (Israel), distributed for inheritance to them. By lot was their inheritance, as Yahuah (LORD) commanded by the hand of Moses, for the nine tribes, and for the half tribe* (Joshua 14:1-2). This keeps the commandment given before the Jordan: *Notwithstanding the land shall be divided by lot: according to the names of the tribes of their fathers they shall inherit* (Numbers 26:55); *every man''s inheritance shall be in the place where his lot falleth; according to the tribes of your fathers ye shall inherit* (Numbers 33:54). The apportioning is Yahuah''s sovereign choice, and it runs along the paternal tribes — the seed inheriting by the houses of their fathers, exactly as He commanded by the hand of Moses.',
       sv.verse_id, ev.verse_id, 'free', 35334
  FROM _s344_jos14_lookup sv, _s344_jos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD 1 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 13:6 — *Of the tribe of Yahudah (Judah), Caleb the son of Jephunneh*; the seed-line, reckoned in Yahudah by his father.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-caleb-wholly-followed-yahuah-another-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 13:30 — *Let us go up at once, and possess it*; Caleb stilled the people while the ten made the heart melt.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-caleb-wholly-followed-yahuah-another-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 14:24 (to 14:8) — *another spirit with him, and hath followed me fully... his seed shall possess it*; Yahuah names the reason.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-caleb-wholly-followed-yahuah-another-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 14:24 (to 14:9) — the *another spirit* who *followed me fully* underwrites Moses'' oath of the inheritance.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-caleb-wholly-followed-yahuah-another-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 1:36 — *to him will I give the land... because he hath wholly followed Yahuah*; Moses'' oath, the word of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-caleb-wholly-followed-yahuah-another-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Numbers 14:24 (to 14:14) — the promise kept: the seed possesses Hebron because he followed Yahuah fully.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-caleb-wholly-followed-yahuah-another-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 2 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 92:14 (to 14:10) — *They shall still bring forth fruit in old age*; Yahuah keeps the faithful alive and fruitful.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=92 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-give-me-this-mountain-fruit-in-old-age'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 92:14 (to 14:11) — at eighty-five Caleb is *as strong this day*; the righteous *fat and flourishing* in old age.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=11
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=92 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-give-me-this-mountain-fruit-in-old-age'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 92:13 (to 14:12) — *planted in the house of Yahuah... shall flourish*; the planted man asks for the mountain of the Anakim.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=12
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=92 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-give-me-this-mountain-fruit-in-old-age'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 3 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 14:24 (to 14:14) — *another spirit... his seed shall possess it*; Caleb inherits while the murmurers fall.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-of-the-faithful-while-the-unbelieving-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 3:18 — *to whom sware he that they should not enter into his rest, but to them that believed not?*; the unbelieving barred.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-of-the-faithful-while-the-unbelieving-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 3:19 — *they could not enter in because of unbelief*; the contrast that crowns Caleb''s inheritance.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-of-the-faithful-while-the-unbelieving-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 6:12 (to 14:13) — *followers of them who through faith and patience inherit the promises*; Caleb blessed with Hebron.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=13
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-of-the-faithful-while-the-unbelieving-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hebrews 6:12 (to 14:9) — forty-five years'' waiting = *faith and patience* inheriting Moses'' sworn promise.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-of-the-faithful-while-the-unbelieving-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 4 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 26:55 (to 14:1) — *divided by lot: according to the names of the tribes of their fathers*; Eleazar and Joshua distribute so.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=1
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-by-lot-as-yahuah-commanded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 26:55 (to 14:2) — the lot is Yahuah''s choice; the inheritance falls by His hand, by the tribes of the fathers.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-by-lot-as-yahuah-commanded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 33:54 (to 14:2) — *where his lot falleth... according to the tribes of your fathers*; the pre-Jordan command kept beyond it.'
  FROM cross_reference_threads t
  JOIN _s344_jos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s344_jos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=33 AND tv.verse_number=54
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-14-the-inheritance-by-lot-as-yahuah-commanded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_15.sql (Joshua 15) -----
-- Chapter: Joshua 15 — the inheritance of the tribe of YAHUDAH (Judah), the royal/Messianic tribe
-- Tag: jos15   View: _s344_jos15_lookup   Sort band: 35350, step 3 (35350, 35353, 35356)
-- Frame: Yahudah's lot is the inheritance of the royal tribe (Gen 49:10 the sceptre, the lion's
--   whelp, until Shiloh come) — the line of the Messiah, the Lion of Juda / Root of David (Rev 5:5),
--   out of which our Lord sprang (Heb 7:14). Caleb's faith of ch14 enacted: he drives the three
--   sons of Anak (the giants) out of Hebron (15:13-14), the un-driven-out remnant of Num 13's giants
--   now cut off. Achsah the daughter asks her father for the springs of water and receives the upper
--   and the nether springs (15:18-19; Judges 1:14-15) — the bold request to the Father for the
--   living water that makes the dry south land fruitful (Matt 7:11 the Father gives good gifts;
--   John 4:14 / 7:38 the living water springing up). But Yahudah could NOT drive out the Jebusites
--   (15:63) — the incomplete possession, the un-driven-out stronghold that waits for David to take
--   Zion (2 Sam 5:7 / 1 Chron 11:5). The place-name lists (vv.21-62) are NOT threaded.
--
-- Joshua 15 coverage:
--   v.1/v.20 (Yahudah's lot/inheritance):
--        NT:     Revelation 5:5 (Lion of Juda, Root of David); Hebrews 7:14 (our Lord sprang out of Juda)
--        Extras: none warranted
--        Tanakh: Genesis 49:8,9,10 (the sceptre, the lion's whelp, until Shiloh come)
--   v.13-14 (Caleb drives out the three sons of Anak from Hebron):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Numbers 13:28,33 (the sons of Anak, the giants, grasshoppers); Joshua 14:12 (give me this mountain)
--   v.15-19 (Achsah asks her father for the springs of water):
--        NT:     Matthew 7:11 (the Father gives good gifts); John 4:14 (well springing up); John 7:38 (rivers of living water)
--        Extras: none warranted
--        Tanakh: Judges 1:14,15 (the same account, the upper and nether springs)
--   v.63 (the Jebusites Yahudah could not drive out, dwell at Jerusalem unto this day):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Judges 1:21 (the un-driven-out Jebusites); 2 Samuel 5:7 (David took the strong hold of Zion); 1 Chronicles 11:5 (David took the castle of Zion)
--   vv.2-12, vv.21-62 (border / place-name / city lists): NOT threaded by design (boundary survey).
--
-- Threads (3):
--   joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah   [free] — Tanakh + NT (Gen 49; Rev 5; Heb 7)
--   joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs [free] — Tanakh + NT (Num 13; Josh 14; Judg 1; Matt 7; John 4; John 7)
--   joshua-15-the-jebusites-yahudah-could-not-drive-out-zion-waits-for-david [free] — Tanakh (Judg 1; 2 Sam 5; 1 Chr 11)

CREATE TEMP VIEW _s344_jos15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Yahudah's inheritance — the sceptre and the Lion of Judah
    ('canon','joshua',15,1,'canon','genesis',49,8,'free',E'*Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee.* (Genesis 49:8). The lot that *was the lot of the tribe of the children of Yahudah (Judah)* (Joshua 15:1) is the inheritance of the tribe Jacob set first among his brethren — the royal portion, the one before whom the others bow.'),
    ('canon','joshua',15,1,'canon','genesis',49,9,'free',E'*Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9). Yahudah''s land-portion is the den of the lion''s whelp — the tribe blessed as the lion, the one that goes up first to the prey.'),
    ('canon','joshua',15,1,'canon','genesis',49,10,'free',E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10). This is why Yahudah''s inheritance carries the framework weight: the sceptre — the kingly line of the Messiah — is lodged in this tribe, *until Shiloh come*, and *unto him shall the gathering of the people be*, the two-house ingathering.'),
    ('canon','joshua',15,20,'canon','genesis',49,10,'free',E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10). *This is the inheritance of the tribe of the children of Yahudah (Judah)* (Joshua 15:20) — the territory of the sceptre-bearing tribe, the cradle of the Davidic throne and of Shiloh who comes from it.'),
    ('canon','joshua',15,20,'canon','revelation',5,5,'free',E'*And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* (Revelation 5:5). The inheritance of Yahudah (Joshua 15:20) is the soil of the *Lion of the tribe of Juda, the Root of David* — the lion''s whelp of Genesis 49:9 grown to the Messiah who alone prevails.'),
    ('canon','joshua',15,20,'canon','hebrews',7,14,'free',E'*For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.* (Hebrews 7:14). The land surveyed in *the inheritance of the tribe of the children of Yahudah (Judah)* (Joshua 15:20) is the lineage-ground from which *our Lord sprang out of Juda* — the Formed Son taking flesh in the royal tribe.'),
    -- Thread 2: Caleb cuts off the Anakim; Achsah asks for the springs
    ('canon','joshua',15,13,'canon','joshua',14,12,'free',E'*Now therefore give me this mountain, whereof Yahuah (LORD) spake in that day; for thou heardest in that day how the Anakims were there, and that the cities were great and fenced: if so be Yahuah (LORD) will be with me, then I shall be able to drive them out, as Yahuah (LORD) said.* (Joshua 14:12). Caleb''s request of the chapter before is now granted: *unto Caleb the son of Jephunneh he gave a part... even the city of Arba the father of Anak, which city is Hebron* (Joshua 15:13) — the mountain asked in faith, now in hand.'),
    ('canon','joshua',15,14,'canon','numbers',13,33,'free',E'*And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight.* (Numbers 13:33). The very giants that made the ten spies feel as grasshoppers, Caleb now drives out: *and Caleb drove thence the three sons of Anak, Sheshai, and Ahiman, and Talmai, the children of Anak* (Joshua 15:14) — the faith that said "we are well able" enacted forty-five years on, the Anakim cut off.'),
    ('canon','joshua',15,14,'canon','numbers',13,28,'free',E'*Nevertheless the people be strong that dwell in the land, and the cities are walled, and very great: and moreover we saw the children of Anak there.* (Numbers 13:28). The walled-city dread of the evil report is undone by Caleb''s sword: *and Caleb drove thence the three sons of Anak* (Joshua 15:14) — the children of Anak the spies feared, now expelled by the one who wholly followed Yahuah.'),
    ('canon','joshua',15,15,'canon','judges',1,14,'free',E'*And it came to pass, when she came to him, that she moved him to ask of her father a field: and she lighted from off her ass; and Caleb said unto her, What wilt thou?* (Judges 1:14). Judges retells this same account of Caleb at Debir/Kirjath-sepher and Achsah''s asking — *he went up thence to the inhabitants of Debir: and the name of Debir before was Kirjath-sepher* (Joshua 15:15) — the two witnesses to the daughter''s bold request.'),
    ('canon','joshua',15,19,'canon','judges',1,15,'free',E'*And she said unto him, Give me a blessing: for thou hast given me a south land; give me also springs of water. And Caleb gave her the upper springs and the nether springs.* (Judges 1:15). The same scene Joshua records — *Give me a blessing; for thou hast given me a south land; give me also springs of water. And he gave her the upper springs, and the nether springs* (Joshua 15:19) — the daughter who asks her father for the water that makes the dry south land fruitful, and receives it doubled.'),
    ('canon','joshua',15,19,'canon','matthew',7,11,'free',E'*If ye then, being evil, know how to give good gifts unto your children, how much more shall your Father which is in heaven give good things to them that ask him?* (Matthew 7:11). Achsah''s asking is the pattern Yahusha names: a father who gives his daughter not the dry land only but *the upper springs, and the nether springs* (Joshua 15:19) — how much more the Father in heaven to the child who asks.'),
    ('canon','joshua',15,19,'canon','john',4,14,'free',E'*But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* (John 4:14). The *springs of water* Achsah asks and receives (Joshua 15:19) foreshadow the living water the Formed Son gives — *a well of water springing up into everlasting life* — the bold request for the water that never runs dry.'),
    ('canon','joshua',15,19,'canon','john',7,38,'free',E'*He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* (John 7:38). The daughter who asks for *the upper springs, and the nether springs* (Joshua 15:19) is answered fully in the *rivers of living water* the Spirit pours — the dry inheritance made a fountain in the one who asks.'),
    -- Thread 3: the un-driven-out Jebusites — Zion waits for David
    ('canon','joshua',15,63,'canon','judges',1,21,'free',E'*And the children of Benjamin did not drive out the Jebusites that inhabited Jerusalem; but the Jebusites dwell with the children of Benjamin in Jerusalem unto this day.* (Judges 1:21). Judges echoes the same un-driven-out remnant Joshua records — *the Jebusites dwell with the children of Yahudah (Judah) at Jerusalem unto this day* (Joshua 15:63) — the stronghold not taken, the snare of compromise left standing in the midst of the inheritance.'),
    ('canon','joshua',15,63,'canon','2-samuel',5,7,'free',E'*Nevertheless David took the strong hold of Zion: the same is the city of David.* (2 Samuel 5:7). What Yahudah *could not drive them out* (Joshua 15:63) waits generations until *David took the strong hold of Zion* — the Jebusite fortress finally claimed, the city of the king, the seat of the throne of Yahudah.'),
    ('canon','joshua',15,63,'canon','1-chronicles',11,5,'free',E'*And the inhabitants of Jebus said to David, Thou shalt not come hither. Nevertheless David took the castle of Zion, which is the city of David.* (1 Chronicles 11:5). The Jebusites who *dwell with the children of Yahudah (Judah) at Jerusalem unto this day* (Joshua 15:63) are the same who taunt David — *Thou shalt not come hither* — until the king of Yahudah takes the castle of Zion that the inheritance left unclaimed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah',
       E'Yahudah''s inheritance — the sceptre and the Lion of Judah',
       E'The chapter opens, *This then was the lot of the tribe of the children of Yahudah (Judah)* (Joshua 15:1), and closes the survey, *This is the inheritance of the tribe of the children of Yahudah (Judah)* (Joshua 15:20). This is no ordinary allotment: it is the territory of the royal tribe, the line of the Messiah. Jacob had set Yahudah above his brethren — *Yahudah (Judah), thou art he whom thy brethren shall praise... thy father''s children shall bow down before thee* (Genesis 49:8), *Yahudah (Judah) is a lion''s whelp* (Genesis 49:9) — and lodged the throne in him forever: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The land mapped here is the cradle of that sceptre. The lion''s whelp grows to *the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book* (Revelation 5:5); and out of this very lineage-ground the Formed Son takes flesh — *it is evident that our Lord sprang out of Juda* (Hebrews 7:14). Yahudah''s inheritance is the soil of the throne and of Shiloh, and *unto him shall the gathering* — the two-house ingathering — *be.*',
       sv.verse_id, ev.verse_id, 'free', 35350
  FROM _s344_jos15_lookup sv, _s344_jos15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=15 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs',
       E'Caleb cuts off the Anakim, and Achsah asks for the springs',
       E'The faith of the chapter before is now enacted. Caleb had asked, *Now therefore give me this mountain, whereof Yahuah (LORD) spake in that day; for thou heardest in that day how the Anakims were there... if so be Yahuah (LORD) will be with me, then I shall be able to drive them out* (Joshua 14:12) — and here it is granted: *unto Caleb the son of Jephunneh he gave a part... even the city of Arba the father of Anak, which city is Hebron. And Caleb drove thence the three sons of Anak, Sheshai, and Ahiman, and Talmai* (Joshua 15:13-14). These are the very giants that made the ten spies despair — *there we saw the giants, the sons of Anak... and we were in our own sight as grasshoppers* (Numbers 13:33), *the cities are walled, and very great: and moreover we saw the children of Anak there* (Numbers 13:28). The man who said "we are well able" cuts them off forty-five years on. Then his daughter Achsah enacts the same faith in a tender key: *Give me a blessing; for thou hast given me a south land; give me also springs of water. And he gave her the upper springs, and the nether springs* (Joshua 15:19; the same scene retold, *Caleb gave her the upper springs and the nether springs* — Judges 1:14-15). She is the daughter who boldly asks her father for the water that makes the dry south land fruitful, and receives it doubled — the pattern Yahusha names: *If ye then, being evil, know how to give good gifts unto your children, how much more shall your Father which is in heaven give good things to them that ask him?* (Matthew 7:11). The springs she asks for foreshadow the living water of the Formed Son — *a well of water springing up into everlasting life* (John 4:14), *out of his belly shall flow rivers of living water* (John 7:38). Ask the Father for the springs; He gives the upper and the nether.',
       sv.verse_id, ev.verse_id, 'free', 35353
  FROM _s344_jos15_lookup sv, _s344_jos15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=15 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-15-the-jebusites-yahudah-could-not-drive-out-zion-waits-for-david',
       E'The Jebusites Yahudah could not drive out — Zion waits for David',
       E'The catalogue of cities ends on a confession of failure: *As for the Jebusites the inhabitants of Jerusalem, the children of Yahudah (Judah) could not drive them out: but the Jebusites dwell with the children of Yahudah (Judah) at Jerusalem unto this day* (Joshua 15:63). The inheritance is mapped but not fully possessed — the Jebusite stronghold left standing in its very heart, the snare of compromise. Judges records the same un-driven-out remnant on Benjamin''s side of the line: *the Jebusites dwell with the children of Benjamin in Jerusalem unto this day* (Judges 1:21). The fortress waits generations until the king of the royal tribe comes: *Nevertheless David took the strong hold of Zion: the same is the city of David* (2 Samuel 5:7), *Nevertheless David took the castle of Zion, which is the city of David* (1 Chronicles 11:5). What Yahudah *could not drive out* becomes, in David''s hand, the city of the king — the seat of the throne the sceptre of Genesis 49 promised. The incomplete possession of Joshua''s day is completed by the son of Yahudah who takes Zion.',
       sv.verse_id, ev.verse_id, 'free', 35356
  FROM _s344_jos15_lookup sv, _s344_jos15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=63
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=15 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- Members: Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 49:8 — *thy father''s children shall bow down before thee*: Yahudah''s lot is the portion of the tribe set first among the brethren.'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 49:9 — *Yahudah is a lion''s whelp*: the land-portion is the den of the lion''s whelp, the tribe blessed as the lion.'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 49:10 — *the sceptre shall not depart from Yahudah... until Shiloh come*: the throne and the ingathering lodged in this tribe (against v.1).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=1
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 49:10 — *until Shiloh come; and unto him shall the gathering of the people be*: the inheritance summary (v.20) is the cradle of the Davidic throne and of Shiloh.'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=20
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Revelation 5:5 — *the Lion of the tribe of Juda, the Root of David, hath prevailed*: the lion''s whelp grown to the Messiah whose tribal soil this is.'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=20
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Hebrews 7:14 — *our Lord sprang out of Juda*: the inheritance of Yahudah is the lineage-ground from which the Formed Son took flesh.'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=20
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-yahudahs-inheritance-the-sceptre-and-the-lion-of-judah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 14:12 — *give me this mountain... I shall be able to drive them out*: Caleb''s faith-request of the chapter before, now granted in Hebron (v.13).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 13:33 — *the giants, the sons of Anak... we were in our own sight as grasshoppers*: the giants the spies feared, now driven out by Caleb (v.14).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 13:28 — *the cities are walled, and very great... the children of Anak there*: the walled-city dread undone by Caleb''s sword (v.14).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Judges 1:14 — *she moved him to ask of her father a field*: the second witness to the same Debir/Kirjath-sepher account (v.15).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=15
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Judges 1:15 — *give me also springs of water... the upper springs and the nether springs*: the same scene, the daughter''s request and the doubled gift (v.19).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=19
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Matthew 7:11 — *how much more shall your Father which is in heaven give good things to them that ask him*: Achsah''s asking is the pattern of the Father''s giving (v.19).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=19
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'John 4:14 — *a well of water springing up into everlasting life*: the springs Achsah asks foreshadow the living water the Formed Son gives (v.19).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=19
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'John 7:38 — *out of his belly shall flow rivers of living water*: the daughter''s request answered fully in the Spirit poured (v.19).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=19
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-caleb-cuts-off-the-anakim-and-achsah-asks-for-the-springs'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members: Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 1:21 — *the Jebusites dwell with the children of Benjamin in Jerusalem unto this day*: the same un-driven-out remnant echoed in Judges (v.63).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=63
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-the-jebusites-yahudah-could-not-drive-out-zion-waits-for-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 5:7 — *David took the strong hold of Zion: the same is the city of David*: what Yahudah could not drive out, the king of the royal tribe takes (v.63).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=63
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-the-jebusites-yahudah-could-not-drive-out-zion-waits-for-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 11:5 — *David took the castle of Zion, which is the city of David*: the Jebusite taunt overturned, the incomplete possession completed (v.63).'
  FROM cross_reference_threads t
  JOIN _s344_jos15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=15 AND sv.verse_number=63
  JOIN _s344_jos15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-15-the-jebusites-yahudah-could-not-drive-out-zion-waits-for-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_12.sql (Joshua 12) -----
-- Book: Joshua  Chapter: 12  Tag: _s344_jos12_lookup  Sort band: 35275, 35278, 35281
-- The catalogue of the kings Yashar'el (Israel) smote — the two great kings east of
-- Jordan (Sihon and Og, by Moses' hand, Num 21 / Deut 2-3) and the thirty and one kings
-- west of Jordan (by Joshua's hand). A LEAN memorial chapter: exactly 3 framework-bearing
-- threads. All members canon (all tier 'free').
--
-- Joshua 12 coverage:
--   v.1  (these are the kings Yashar'el smote, possessed their land east of Jordan)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Ps 136:17-18 (smote great kings / slew famous kings, mercy endureth);
--                Ps 135:10-11 (smote great nations, Sihon and Og); Neh 9:24 (gavest
--                them into their hands, with their kings) — thread 1
--   v.2  (Sihon king of the Amorites in Heshbon)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Num 21:24 (smote him with the sword, possessed his land from Arnon to
--                Jabbok); Deut 2:33 (Yahuah delivered him, we smote him) — thread 2
--   v.3  (the bounds of Sihon's land) — gathered under v.2, none added separately
--   v.4  (Og king of Bashan, of the remnant of the giants)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Num 21:33 (Og went out against them at Edrei); Num 21:35 (smote him,
--                his sons, none left, possessed his land); Deut 3:3 (delivered Og, smote
--                him until none was left remaining) — thread 2
--   v.5  (Og's reign in Bashan) — gathered under v.4
--   v.6  (Moses gave it for a possession to Reuben, Gad, half Manasseh)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deut 3:12 (this land we possessed... gave I unto the Reubenites and the
--                Gadites) — thread 3
--   v.7  (Joshua gave the western land unto the tribes of Yashar'el for a possession)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Ps 136:21-22 (gave their land for an heritage... unto Yashar'el his
--                servant) — thread 3
--   v.8-24 (the geographic catalogue + the thirty and one kings, one by one)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: the roll itself; weight carried into thread 1 (the memorial) from v.1
--
-- Threads:
--   1. joshua-12-the-memorial-of-the-kings-yahuah-smote          [Tanakh] — the catalogue
--      = the memorial the psalms rehearse: Yahuah is the one who smote the kings.
--   2. joshua-12-sihon-and-og-the-two-great-kings-overthrown     [Tanakh] — the two
--      great kings east of Jordan overthrown by Moses' hand (Num 21 / Deut 2-3).
--   3. joshua-12-the-land-given-for-an-heritage-as-yahuah-promised-the-fathers
--      [Tanakh] — the land given for an heritage to Yashar'el his servant, as sworn to
--      the fathers (Deut 3:12 east; Ps 136:21-22 the sung confession).

CREATE TEMP VIEW _s344_jos12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the memorial of the kings Yahuah smote (source v.1)
    ('canon','joshua',12,1,'canon','psalms',136,17,'free',E'*To him which smote great kings: for his mercy endureth for ever* (Psalm 136:17). The roll of Joshua 12 opens, *Now these are the kings of the land, which the children of Yashar''el (Israel) smote* (Joshua 12:1) — and the psalm of the everlasting mercy gathers that whole catalogue into one refrain: it was Yahuah (LORD) who smote the kings, His mercy that delivered them into Yashar''el''s (Israel''s) hand. The memorial list is a hymn of His covenant faithfulness.'),
    ('canon','joshua',12,1,'canon','psalms',136,18,'free',E'*And slew famous kings: for his mercy endureth for ever* (Psalm 136:18). The thirty and one kings of Joshua 12 — Jericho, Ai, Jerusalem, Hebron, every one named *one* — are the *famous kings* the psalm rehearses. *These are the kings of the land, which the children of Yashar''el (Israel) smote* (Joshua 12:1): the slaying is recounted not as Yashar''el''s (Israel''s) might but as Yahuah''s (LORD''s) mercy enduring for ever.'),
    ('canon','joshua',12,1,'canon','psalms',135,10,'free',E'*Who smote great nations, and slew mighty kings* (Psalm 135:10). The catalogue, *the kings of the land, which the children of Yashar''el (Israel) smote* (Joshua 12:1), is the same victory Psalm 135 sings of Jacob, His *peculiar treasure* — the smiting of the great nations is the act of the Yahuah (LORD) who chose Yashar''el (Israel) unto Himself.'),
    ('canon','joshua',12,1,'canon','psalms',135,11,'free',E'*Sihon king of the Amorites, and Og king of Bashan, and all the kingdoms of Canaan* (Psalm 135:11). The psalm names the very two heads of the Joshua 12 list — Sihon (Joshua 12:2) and Og (Joshua 12:4) — and folds *all the kingdoms of Canaan*, the thirty and one west of Jordan, into the one memorial. *These are the kings of the land, which the children of Yashar''el (Israel) smote* (Joshua 12:1).'),
    ('canon','joshua',12,1,'canon','nehemiah',9,24,'free',E'*So the children went in and possessed the land, and thou subduedst before them the inhabitants of the land, the Canaanites, and gavest them into their hands, with their kings* (Nehemiah 9:24). The Levites'' confession reads the Joshua 12 roll back as Yahuah''s (LORD''s) own work: He *subduedst* the inhabitants and gave them *with their kings* into Yashar''el''s (Israel''s) hand. *These are the kings of the land, which the children of Yashar''el (Israel) smote, and possessed their land* (Joshua 12:1).'),
    -- Thread 2: Sihon and Og the two great kings overthrown (source v.2 Sihon, v.4 Og)
    ('canon','joshua',12,2,'canon','numbers',21,24,'free',E'*And Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok, even unto the children of Ammon* (Numbers 21:24). Joshua 12 records *Sihon king of the Amorites, who dwelt in Heshbon, and ruled from Aroer... even unto the river Jabbok* (Joshua 12:2) — the very bounds of the conquest first told in Numbers 21, the first of the two great kings overthrown east of Jordan.'),
    ('canon','joshua',12,2,'canon','deuteronomy',2,33,'free',E'*And Yahuah Eloheinu (the LORD our God) delivered him before us; and we smote him, and his sons, and all his people* (Deuteronomy 2:33). Moses rehearses the fall of *Sihon king of the Amorites, who dwelt in Heshbon* (Joshua 12:2): it was Yahuah (LORD) who *delivered him before us*. The Joshua 12 memorial names Sihon as conquered; Deuteronomy 2 names the One who conquered him.'),
    ('canon','joshua',12,4,'canon','numbers',21,33,'free',E'*And they turned and went up by the way of Bashan: and Og the king of Bashan went out against them, he, and all his people, to the battle at Edrei* (Numbers 21:33). Joshua 12 records *the coast of Og king of Bashan... that dwelt at Ashtaroth and at Edrei* (Joshua 12:4) — the second great king, met in battle at the very Edrei Numbers 21 names.'),
    ('canon','joshua',12,4,'canon','numbers',21,35,'free',E'*So they smote him, and his sons, and all his people, until there was none left him alive: and they possessed his land* (Numbers 21:35). *Og king of Bashan, which was of the remnant of the giants* (Joshua 12:4) is the *remnant of the giants* overthrown until *none left him alive* — the second of the two great kings the Joshua 12 catalogue memorializes.'),
    ('canon','joshua',12,4,'canon','deuteronomy',3,3,'free',E'*So Yahuah Eloheinu (the LORD our God) delivered into our hands Og also, the king of Bashan, and all his people: and we smote him until none was left to him remaining* (Deuteronomy 3:3). Moses names *Og king of Bashan, which was of the remnant of the giants* (Joshua 12:4) as delivered by Yahuah''s (LORD''s) own hand. The Joshua 12 list names the giant-king conquered; Deuteronomy 3 names the deliverance.'),
    -- Thread 3: the land given for an heritage as Yahuah promised the fathers (source v.6 east, v.7 west)
    ('canon','joshua',12,6,'canon','deuteronomy',3,12,'free',E'*And this land, which we possessed at that time, from Aroer, which is by the river Arnon, and half mount Gilead, and the cities thereof, gave I unto the Reubenites and to the Gadites* (Deuteronomy 3:12). Joshua 12 records that *Moses the servant of Yahuah (LORD) gave it for a possession unto the Reubenites, and the Gadites, and the half tribe of Manasseh* (Joshua 12:6) — the eastern heritage apportioned exactly as Moses recounts in Deuteronomy 3.'),
    ('canon','joshua',12,7,'canon','psalms',136,21,'free',E'*And gave their land for an heritage: for his mercy endureth for ever* (Psalm 136:21). Where Joshua 12 says *Joshua gave unto the tribes of Yashar''el (Israel) for a possession according to their divisions* (Joshua 12:7), the psalm names the deeper Giver: the land is an *heritage* of His enduring mercy, not merely a spoil of war.'),
    ('canon','joshua',12,7,'canon','psalms',136,22,'free',E'*Even an heritage unto Yashar''el (Israel) his servant: for his mercy endureth for ever* (Psalm 136:22). The western land *Joshua gave unto the tribes of Yashar''el (Israel) for a possession* (Joshua 12:7) is the *heritage unto Yashar''el (Israel) his servant* — the inheritance sworn to the fathers, given by the mercy that endureth for ever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-12-the-memorial-of-the-kings-yahuah-smote',
       E'The Memorial of the Kings Yahuah Smote',
       E'Joshua 12 opens, *Now these are the kings of the land, which the children of Yashar''el (Israel) smote, and possessed their land* (Joshua 12:1), and closes with the count, *all the kings thirty and one* (Joshua 12:24). It reads like a war-memorial — every king named *one*. But the Psalms read it as a hymn. *Who smote great kings: for his mercy endureth for ever: And slew famous kings: for his mercy endureth for ever* (Psalm 136:17-18) — the catalogue is not Yashar''el''s (Israel''s) boast but Yahuah''s (LORD''s) mercy enduring for ever. *Who smote great nations, and slew mighty kings* (Psalm 135:10) sings the same of Jacob His peculiar treasure. And the Levites'' confession seals it: *thou subduedst before them the inhabitants of the land... and gavest them into their hands, with their kings* (Nehemiah 9:24). The roll of conquered kings is a memorial of who fought the battle — Yahuah (LORD), whose mercy endureth for ever.',
       sv.verse_id, ev.verse_id, 'free', 35275
  FROM _s344_jos12_lookup sv, _s344_jos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=12 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-12-sihon-and-og-the-two-great-kings-overthrown',
       E'Sihon and Og — the Two Great Kings Overthrown',
       E'Before the thirty and one kings of the west, the Joshua 12 roll names two heads east of Jordan: *Sihon king of the Amorites, who dwelt in Heshbon* (Joshua 12:2) and *Og king of Bashan, which was of the remnant of the giants* (Joshua 12:4). These two are the great kings Moses overthrew. Of Sihon: *And Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok* (Numbers 21:24); Moses rehearses, *Yahuah Eloheinu (the LORD our God) delivered him before us; and we smote him, and his sons, and all his people* (Deuteronomy 2:33). Of Og the giant-king: *Og the king of Bashan went out against them... to the battle at Edrei* (Numbers 21:33), *and they possessed his land* (Numbers 21:35), for *Yahuah Eloheinu (the LORD our God) delivered into our hands Og also... and we smote him until none was left to him remaining* (Deuteronomy 3:3). The Joshua 12 catalogue places these two giant-kings first because they are the firstfruits of the conquest — and in both tellings the victory is Yahuah''s (LORD''s) deliverance, not Yashar''el''s (Israel''s) strength.',
       sv.verse_id, ev.verse_id, 'free', 35278
  FROM _s344_jos12_lookup sv, _s344_jos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-12-the-land-given-for-an-heritage-as-yahuah-promised-the-fathers',
       E'The Land Given for an Heritage, as Yahuah Promised the Fathers',
       E'The Joshua 12 roll is not merely a list of the defeated — it is a deed of inheritance. East of Jordan, *Moses the servant of Yahuah (LORD) gave it for a possession unto the Reubenites, and the Gadites, and the half tribe of Manasseh* (Joshua 12:6), exactly as Moses recounts: *this land, which we possessed at that time... gave I unto the Reubenites and to the Gadites* (Deuteronomy 3:12). West of Jordan, *Joshua gave unto the tribes of Yashar''el (Israel) for a possession according to their divisions* (Joshua 12:7). And the psalm names the true Giver and the everlasting reason: *And gave their land for an heritage: for his mercy endureth for ever: Even an heritage unto Yashar''el (Israel) his servant: for his mercy endureth for ever* (Psalm 136:21-22). The conquered kings become the measured-out *heritage* of Yashar''el (Israel) His servant — the land sworn to the fathers, given by the mercy that endureth for ever.',
       sv.verse_id, ev.verse_id, 'free', 35281
  FROM _s344_jos12_lookup sv, _s344_jos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: joshua-12-the-memorial-of-the-kings-yahuah-smote
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*To him which smote great kings: for his mercy endureth for ever* (Psalm 136:17) — the catalogue of *the kings of the land, which the children of Yashar''el (Israel) smote* (Joshua 12:1) gathered into the refrain of enduring mercy.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-memorial-of-the-kings-yahuah-smote'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And slew famous kings: for his mercy endureth for ever* (Psalm 136:18) — the thirty and one kings, each named *one*, are the famous kings the psalm rehearses as Yahuah''s (LORD''s) mercy.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-memorial-of-the-kings-yahuah-smote'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Who smote great nations, and slew mighty kings* (Psalm 135:10) — the conquest of *the kings of the land* (Joshua 12:1) is the act of the Yahuah (LORD) who chose Jacob unto Himself.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-memorial-of-the-kings-yahuah-smote'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Sihon king of the Amorites, and Og king of Bashan, and all the kingdoms of Canaan* (Psalm 135:11) — the psalm names the two heads of the Joshua 12 list and folds in the thirty and one of Canaan.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-memorial-of-the-kings-yahuah-smote'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*thou subduedst before them the inhabitants of the land... and gavest them into their hands, with their kings* (Nehemiah 9:24) — the Levites read the Joshua 12 roll back as Yahuah''s (LORD''s) own subduing of the kings.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=1
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-memorial-of-the-kings-yahuah-smote'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: joshua-12-sihon-and-og-the-two-great-kings-overthrown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Yashar''el (Israel) smote him with the edge of the sword, and possessed his land from Arnon unto Jabbok* (Numbers 21:24) — the fall of *Sihon king of the Amorites, who dwelt in Heshbon* (Joshua 12:2), the first great king east of Jordan.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-sihon-and-og-the-two-great-kings-overthrown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah Eloheinu (the LORD our God) delivered him before us; and we smote him, and his sons, and all his people* (Deuteronomy 2:33) — Moses names the One who overthrew Sihon (Joshua 12:2): Yahuah (LORD) delivered him.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-sihon-and-og-the-two-great-kings-overthrown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Og the king of Bashan went out against them, he, and all his people, to the battle at Edrei* (Numbers 21:33) — the second great king, *Og king of Bashan... that dwelt at Ashtaroth and at Edrei* (Joshua 12:4), met in battle at Edrei.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-sihon-and-og-the-two-great-kings-overthrown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*So they smote him, and his sons, and all his people, until there was none left him alive: and they possessed his land* (Numbers 21:35) — *Og king of Bashan, which was of the remnant of the giants* (Joshua 12:4) overthrown until none remained.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-sihon-and-og-the-two-great-kings-overthrown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah Eloheinu (the LORD our God) delivered into our hands Og also, the king of Bashan... and we smote him until none was left to him remaining* (Deuteronomy 3:3) — Moses names Yahuah''s (LORD''s) deliverance of the giant-king Og (Joshua 12:4).'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-sihon-and-og-the-two-great-kings-overthrown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: joshua-12-the-land-given-for-an-heritage-as-yahuah-promised-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*this land, which we possessed at that time, from Aroer... gave I unto the Reubenites and to the Gadites* (Deuteronomy 3:12) — the eastern heritage *Moses the servant of Yahuah (LORD) gave... unto the Reubenites, and the Gadites, and the half tribe of Manasseh* (Joshua 12:6).'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=6
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-land-given-for-an-heritage-as-yahuah-promised-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And gave their land for an heritage: for his mercy endureth for ever* (Psalm 136:21) — where *Joshua gave unto the tribes of Yashar''el (Israel) for a possession* (Joshua 12:7), the psalm names the deeper Giver and His enduring mercy.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-land-given-for-an-heritage-as-yahuah-promised-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Even an heritage unto Yashar''el (Israel) his servant: for his mercy endureth for ever* (Psalm 136:22) — the land *Joshua gave unto the tribes of Yashar''el (Israel) for a possession* (Joshua 12:7) is the heritage of Yashar''el (Israel) His servant, sworn to the fathers.'
  FROM cross_reference_threads t
  JOIN _s344_jos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s344_jos12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=136 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-12-the-land-given-for-an-heritage-as-yahuah-promised-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_16.sql (Joshua 16) -----
-- Joshua 16 — the inheritance of the children of JOSEPH: Manasseh and Ephraim.
-- Tag: jos16   View: _s344_jos16_lookup   Sort band: 35375, 35378
-- LEAN allotment chapter — exactly 2 framework-bearing threads (boundary verses NOT authored).
--
-- Joshua 16 coverage:
--   v.1,4,5  (the lot/inheritance of Joseph = Ephraim the northern house)
--        NT:     none warranted (Tanakh two-house spine carries the weight here)
--        Extras: none warranted
--        Tanakh: Genesis 48:19 (Ephraim's seed a MULTITUDE OF NATIONS), Ezekiel 37:16,19 (the
--                stick of Joseph in the hand of Ephraim, the two sticks made one), 1 Kings 12:20
--                (the ten tribes under Jeroboam of Ephraim become "Yashar'el" the northern house)
--   v.6,7,8  (boundary verses — Michmethah, Taanath-shiloh, Tappuah, river Kanah)
--        NT/Extras/Tanakh: none warranted (pure geography — LEAN chapter, not authored)
--   v.9      (separate cities of Ephraim among Manasseh)
--        none warranted (administrative detail)
--   v.10     (★ they DRAVE NOT OUT the Canaanites in Gezer — incomplete obedience, the snare)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Judges 1:29 (the SAME failure restated — Ephraim drave not out the Canaanites
--                in Gezer), 1 Kings 12:28 (the un-driven snare ripening into the golden calves of
--                Beth-el in Ephraim's own land — the leaven of compromise becomes idolatry)
--
-- Thread 1 (free):  joshua-16-the-inheritance-of-joseph-ephraim-the-northern-house
--                   targets: Tanakh only (Genesis, Ezekiel, 1 Kings)
-- Thread 2 (free):  joshua-16-they-drave-not-out-the-canaanites-the-snare-of-incomplete-obedience
--                   targets: Tanakh only (Judges, 1 Kings)

CREATE TEMP VIEW _s344_jos16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Joseph/Ephraim = the northern house
    ('canon','joshua',16,1,'canon','genesis',48,19,'free',E'*And his father refused, and said, I know it, my son, I know it: he also shall become a people, and he also shall be great: but truly his younger brother shall be greater than he, and his seed shall become a multitude of nations* (Genesis 48:19). Joshua opens with *the lot of the children of Joseph* (Joshua 16:1); the land now measured to Ephraim is the inheritance Yashar''el (Israel) promised over the younger lad''s head — Ephraim''s seed becomes the *multitude of nations*, the melo ha-goyim, the northern house that will be scattered into the nations and gathered home.'),
    ('canon','joshua',16,4,'canon','genesis',48,19,'free',E'*And his father refused, and said, I know it, my son, I know it: he also shall become a people, and he also shall be great: but truly his younger brother shall be greater than he, and his seed shall become a multitude of nations* (Genesis 48:19). *So the children of Joseph, Manasseh and Ephraim, took their inheritance* (Joshua 16:4) — the order Yashar''el (Israel) set when he crossed his hands, putting Ephraim before Manasseh, is the order the land itself now honours: the *multitude of nations* takes its portion.'),
    ('canon','joshua',16,5,'canon','ezekiel',37,16,'free',E'*Moreover, thou son of Adam, take thee one stick, and write upon it, For Yahudah (Judah), and for the children of Yashar''el (Israel) his companions: then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (Ezekiel 37:16). *The border of the children of Ephraim* (Joshua 16:5) is the inheritance of the very tribe whose name Ezekiel writes on the second stick — Ephraim stands for *all the house of Yashar''el (Israel)*, the northern house that will one day be rejoined to Yahudah (Judah).'),
    ('canon','joshua',16,4,'canon','ezekiel',37,19,'free',E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The inheritance *Manasseh and Ephraim took* (Joshua 16:4) is the stick of Joseph itself — the regathering Ezekiel foresees is not a new people grafted in, but these same sons of Joseph made one again with Yahudah (Judah).'),
    ('canon','joshua',16,5,'canon','1-kings',12,20,'free',E'*And it came to pass, when all Yashar''el (Israel) heard that Jeroboam was come again, that they sent and called him unto the congregation, and made him king over all Yashar''el (Israel): there was none that followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20). *The border of the children of Ephraim* (Joshua 16:5) measures the heartland of the ten tribes that, under Jeroboam of Ephraim, will split off and carry the name "Yashar''el (Israel)" as the northern house — the two-house division foreshadowed in the very allotment.'),
    -- Thread 2: they drave not out the Canaanites — the snare
    ('canon','joshua',16,10,'canon','judges',1,29,'free',E'*Neither did Ephraim drive out the Canaanites that dwelt in Gezer; but the Canaanites dwelt in Gezer among them* (Judges 1:29). This is Joshua''s same indictment restated word for word: *they drave not out the Canaanites that dwelt in Gezer: but the Canaanites dwell among the Ephraimites unto this day, and serve under tribute* (Joshua 16:10). The un-driven-out remnant is incomplete obedience — the leaven left in the lump that becomes a snare to the northern house.'),
    ('canon','joshua',16,10,'canon','1-kings',12,28,'free',E'*Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). The compromise that began as *the Canaanites dwell among the Ephraimites* (Joshua 16:10) ripens here in Ephraim''s own land under Jeroboam: the Canaanite leaven left un-driven becomes the golden calves of Beth-el, the snare that finally scatters the northern house.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-16-the-inheritance-of-joseph-ephraim-the-northern-house',
       E'The Inheritance of Joseph: Ephraim the Northern House',
       E'Joshua 16 measures out *the lot of the children of Joseph* (Joshua 16:1), and *So the children of Joseph, Manasseh and Ephraim, took their inheritance* (Joshua 16:4). This is no ordinary allotment — it is the land promised over a younger lad''s head when Yashar''el (Israel) crossed his hands: *truly his younger brother shall be greater than he, and his seed shall become a multitude of nations* (Genesis 48:19). Ephraim is the *multitude of nations*, the melo ha-goyim, the leading tribe of the ten that will carry the name "Yashar''el (Israel)" as the northern house.\n\nEzekiel writes that name on the second of two sticks: *take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (Ezekiel 37:16) — and promises, *I will take the stick of Joseph, which is in the hand of Ephraim... and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The very tribe receiving its border here is the stick that will be scattered into the nations and one day rejoined to Yahudah (Judah).\n\nThe split is already in view: *they... made him king over all Yashar''el (Israel): there was none that followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20) — the ten tribes under Jeroboam of Ephraim become the northern house. This is two-house, not replacement: both sticks are Yashar''el (Israel), to be made one again in the hand of Yahuah (the LORD).',
       sv.verse_id, ev.verse_id, 'free', 35375
  FROM _s344_jos16_lookup sv, _s344_jos16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=16 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-16-they-drave-not-out-the-canaanites-the-snare-of-incomplete-obedience',
       E'They Drave Not Out the Canaanites: the Snare of Incomplete Obedience',
       E'The chapter that measures Ephraim''s inheritance ends with a confession of failure: *And they drave not out the Canaanites that dwelt in Gezer: but the Canaanites dwell among the Ephraimites unto this day, and serve under tribute* (Joshua 16:10). The land was given whole, but the obedience was partial — the leaven left in the lump.\n\nJudges restates the same indictment word for word: *Neither did Ephraim drive out the Canaanites that dwelt in Gezer; but the Canaanites dwelt in Gezer among them* (Judges 1:29). What was not driven out does not stay quiet; it becomes a snare. The compromise ripens generations later in Ephraim''s own heartland, when Jeroboam *made two calves of gold, and said unto them... behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28) — the Canaanite worship left un-driven becomes the golden calves of Beth-el, the very sin that finally scatters the northern house into the nations.\n\nThe lesson is the framework''s warning against half-kept covenant: incomplete obedience is not neutral. What you tolerate today rules over your children tomorrow.',
       sv.verse_id, ev.verse_id, 'free', 35378
  FROM _s344_jos16_lookup sv, _s344_jos16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=16 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*his seed shall become a multitude of nations* (Genesis 48:19) — the lot of Joseph (Joshua 16:1) is the land promised to the melo ha-goyim, the northern house.'
  FROM cross_reference_threads t
  JOIN _s344_jos16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=1
  JOIN _s344_jos16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-16-the-inheritance-of-joseph-ephraim-the-northern-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Manasseh and Ephraim, took their inheritance* (Joshua 16:4) honours the crossed-hands order set in *his seed shall become a multitude of nations* (Genesis 48:19).'
  FROM cross_reference_threads t
  JOIN _s344_jos16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s344_jos16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-16-the-inheritance-of-joseph-ephraim-the-northern-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the stick of Ephraim, and for all the house of Yashar''el (Israel)* (Ezekiel 37:16) — the border of Ephraim (Joshua 16:5) is the tribe written on the second stick.'
  FROM cross_reference_threads t
  JOIN _s344_jos16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=5
  JOIN _s344_jos16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-16-the-inheritance-of-joseph-ephraim-the-northern-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the stick of Joseph, which is in the hand of Ephraim... make them one stick* (Ezekiel 37:19) — the inheritance Joseph took (Joshua 16:4) is the stick to be rejoined to Yahudah (Judah).'
  FROM cross_reference_threads t
  JOIN _s344_jos16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s344_jos16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-16-the-inheritance-of-joseph-ephraim-the-northern-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*made him king over all Yashar''el (Israel)... but the tribe of Yahudah (Judah) only* (1 Kings 12:20) — Ephraim''s border (Joshua 16:5) is the heartland of the ten tribes that become the northern house.'
  FROM cross_reference_threads t
  JOIN _s344_jos16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=5
  JOIN _s344_jos16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-16-the-inheritance-of-joseph-ephraim-the-northern-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Neither did Ephraim drive out the Canaanites that dwelt in Gezer* (Judges 1:29) — the same indictment restated; *they drave not out the Canaanites* (Joshua 16:10) is incomplete obedience.'
  FROM cross_reference_threads t
  JOIN _s344_jos16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s344_jos16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-16-they-drave-not-out-the-canaanites-the-snare-of-incomplete-obedience'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*made two calves of gold... behold thy gods, O Yashar''el (Israel)* (1 Kings 12:28) — the un-driven Canaanite leaven (Joshua 16:10) ripens into the golden calves of Beth-el, the snare that scatters the north.'
  FROM cross_reference_threads t
  JOIN _s344_jos16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s344_jos16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-16-they-drave-not-out-the-canaanites-the-snare-of-incomplete-obedience'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_17.sql (Joshua 17) -----
-- Joshua 17 — the inheritance of MANASSEH, the other half of Joseph west of Jordan;
--   ★ the DAUGHTERS OF ZELOPHEHAD (Mahlah, Noah, Hoglah, Milcah, Tirzah) come near and
--   receive an inheritance among their father's brethren *according to the commandment of
--   Yahuah* (17:3-4,6 — the Num 27/36 case-law kept); ★ the children of Joseph complain of
--   one lot and are answered *thou art a great people... get thee up to the wood country, and
--   cut down for thyself there... thou shalt drive out the Canaanites, though they have iron
--   chariots* (17:14-18 — the inheritance possessed by faith/effort, no passivity); ★ but
--   Manasseh *could not drive out* the Canaanites who *would dwell in that land* (17:12-13 —
--   the incomplete possession, Judges 1:27-28).
--   Tag jos17; view _s344_jos17_lookup. Sort band 35400, 35403, 35406.
--
-- Joshua 17 coverage:
--   v.3-4  (daughters of Zelophehad come near; inheritance among their brethren per Yahuah's command)
--          NT:     Galatians 3:28-29 (neither male nor female; heirs according to the promise) — THREAD 1
--          Extras: none warranted
--          Tanakh: Numbers 27:1,4,7,8; Numbers 36:2,10 (the case-law of daughters' inheritance) — THREAD 1
--   v.6    (the daughters of Manasseh had an inheritance among his sons)
--          NT:     none warranted (carried by THREAD 1)
--          Extras: none warranted
--          Tanakh: Numbers 27:7; Numbers 36:10 — THREAD 1
--   v.12-13 (could not drive out; Canaanites would dwell; put to tribute, did not utterly drive out)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Judges 1:27, Judges 1:28 (the same Manasseh cities un-driven-out) — THREAD 3
--   v.14-15 (children of Joseph: one lot, I am a great people; Joshua: get up, cut down the wood)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: carried within THREAD 2 (intra-chapter answer)
--   v.16-18 (chariots of iron; thou shalt drive out the Canaanites though they have iron chariots)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Judges 1:19 (could not drive out the valley for chariots of iron) — THREAD 2
--
-- THREADS:
--   THREAD 1 joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah (free):
--            NT (Galatians 3:28-29) + Tanakh (Numbers 27, Numbers 36)
--   THREAD 2 joshua-17-a-great-people-cut-down-the-wood-and-drive-out-the-iron-chariots (free):
--            Tanakh only (Judges 1:19)
--   THREAD 3 joshua-17-the-canaanites-that-could-not-be-driven-out (free):
--            Tanakh only (Judges 1:27, Judges 1:28)
--
-- Framework-load-bearing notes:
--   * 17:3-4 the daughters inherit *according to the commandment of Yahuah* — the Numbers 27/36
--     statute of judgment kept to the letter: Yahuah's justice does not leave the name of a man
--     without sons cut off, nor the daughters portionless. The forward weave to Galatians
--     3:28-29 is FAINT and DELIBERATE: *neither male nor female... heirs according to the
--     promise* names an inheritance not bounded by the expected — but the membership is still
--     the SEED (*Abraham's seed*), the covenant lineage, NOT a replacement-by-confession. The
--     daughters are not an exception to the seed but its inclusion within Manasseh; the frame
--     honors Torah's own justice, not its abolition. The marriage-restriction of Num 36 (they
--     marry within the tribe so the inheritance stays in Joseph) guards the paternal portion.
--   * 17:14-18 the inheritance is possessed by faith and effort, never passivity: *get thee up
--     to the wood country, and cut down for thyself there... thou shalt drive out the
--     Canaanites, though they have iron chariots*. Joseph is a *great people* and must clear
--     his own portion; the blessing is given but must be taken.
--   * 17:12-13 *could not drive out... the Canaanites would dwell in that land* — the incomplete
--     obedience, the un-driven-out remnant, the same cities listed again as Manasseh's failure
--     in Judges 1:27-28. The promise was full; the possession was partial because the work was
--     left half-done.

CREATE TEMP VIEW _s344_jos17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the daughters of Zelophehad inherit according to the commandment of Yahuah (17:3, 17:4, 17:6)
    ('canon','joshua',17,3,'canon','numbers',27,1,'free',E'*Then came the daughters of Zelophehad, the son of Hepher, the son of Gilead, the son of Machir, the son of Manasseh, of the families of Manasseh the son of Joseph: and these are the names of his daughters; Mahlah, Noah, and Hoglah, and Milcah, and Tirzah* (Numbers 27:1). The very names and the very lineage stand again in *But Zelophehad, the son of Hepher, the son of Gilead, the son of Machir, the son of Manasseh, had no sons, but daughters: and these are the names of his daughters, Mahlah, and Noah, Hoglah, Milcah, and Tirzah* (Joshua 17:3). What was a case brought before Moses in the wilderness is here a portion received in the land — the statute kept.'),
    ('canon','joshua',17,3,'canon','numbers',27,4,'free',E'*Why should the name of our father be done away from among his family, because he hath no son? Give unto us therefore a possession among the brethren of our father* (Numbers 27:4). This is the plea behind Joshua 17:3''s *had no sons, but daughters* — Yahuah''s justice will not let the name of a man without sons be cut off from his family. The inheritance is given so the name is not done away.'),
    ('canon','joshua',17,4,'canon','numbers',27,7,'free',E'*The daughters of Zelophehad speak right: thou shalt surely give them a possession of an inheritance among their father''s brethren; and thou shalt cause the inheritance of their father to pass unto them* (Numbers 27:7). Joshua 17:4 keeps this word to the letter: *Yahuah (LORD) commanded Moses to give us an inheritance among our brethren. Therefore according to the commandment of Yahuah (LORD) he gave them an inheritance among the brethren of their father*. The judgment Yahuah spoke is the judgment Joshua executes.'),
    ('canon','joshua',17,4,'canon','numbers',27,8,'free',E'*And thou shalt speak unto the children of Yashar''el (Israel), saying, If a man die, and have no son, then ye shall cause his inheritance to pass unto his daughter* (Numbers 27:8). The daughters'' claim in Joshua 17:4 — *according to the commandment of Yahuah (LORD) he gave them an inheritance* — rests on this standing statute of judgment: the inheritance passes to the daughter when there is no son, Yahuah''s own provision in the Torah.'),
    ('canon','joshua',17,4,'canon','galatians',3,28,'free',E'*There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus)* (Galatians 3:28). When the daughters receive *an inheritance among the brethren of their father* (Joshua 17:4), the inheritance is not bounded by the expected — *neither male nor female* in the matter of the promised portion. Yet the membership remains the seed of Manasseh, the covenant lineage; the daughters are gathered IN, not a stranger grafted by confession.'),
    ('canon','joshua',17,4,'canon','galatians',3,29,'free',E'*And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29). The daughters of Zelophehad inherit *according to the commandment of Yahuah (LORD)* (Joshua 17:4) as *heirs according to the promise* — the inheritance flows from Yahuah''s word, not from the accident of having sons. The seed of Abraham inherits by the promise, and Yahuah''s justice reaches even the daughters within the seed.'),
    ('canon','joshua',17,6,'canon','numbers',27,7,'free',E'*The daughters of Zelophehad speak right: thou shalt surely give them a possession of an inheritance among their father''s brethren; and thou shalt cause the inheritance of their father to pass unto them* (Numbers 27:7). Joshua 17:6 reports the statute fulfilled in the land: *Because the daughters of Manasseh had an inheritance among his sons*. The possession Yahuah ordered to pass unto them has now passed — they hold a portion among the sons of Manasseh.'),
    ('canon','joshua',17,6,'canon','numbers',36,10,'free',E'*Even as Yahuah (LORD) commanded Moses, so did the daughters of Zelophehad* (Numbers 36:10). The marriage-statute of Numbers 36 guarded the daughters'' inheritance so it would not pass from tribe to tribe — and Joshua 17:6, *the daughters of Manasseh had an inheritance among his sons*, shows the portion kept within Joseph exactly as commanded, the paternal inheritance preserved in the tribe of their father.'),
    -- THREAD 2 — a great people; cut down the wood and drive out the iron chariots (17:16, 17:18)
    ('canon','joshua',17,16,'canon','judges',1,19,'free',E'*And Yahuah (LORD) was with Yahudah (Judah); and he drave out the inhabitants of the mountain; but could not drive out the inhabitants of the valley, because they had chariots of iron* (Judges 1:19). The children of Joseph plead the same obstacle: *all the Canaanites that dwell in the land of the valley have chariots of iron* (Joshua 17:16). The iron chariots are the test of faith — Yahudah faltered before them in the valley, and Joseph fears them; but the word to Joseph is that they SHALL be driven out.'),
    ('canon','joshua',17,18,'canon','judges',1,19,'free',E'*And Yahuah (LORD) was with Yahudah (Judah); and he drave out the inhabitants of the mountain; but could not drive out the inhabitants of the valley, because they had chariots of iron* (Judges 1:19). Against that very failure stands Joshua''s charge: *thou shalt drive out the Canaanites, though they have iron chariots, and though they be strong* (Joshua 17:18). The inheritance is no passive gift — the great people must go up, cut down the wood, and take it by faith and effort, the iron chariots notwithstanding.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 — the Canaanites that could not be driven out (17:12, 17:13)
    ('canon','joshua',17,12,'canon','judges',1,27,'free',E'*Neither did Manasseh drive out the inhabitants of Beth-shean and her towns, nor Taanach and her towns, nor the inhabitants of Dor and her towns, nor the inhabitants of Ibleam and her towns, nor the inhabitants of Megiddo and her towns: but the Canaanites would dwell in that land* (Judges 1:27). The same un-driven-out cities are named here: *Yet the children of Manasseh could not drive out the inhabitants of those cities; but the Canaanites would dwell in that land* (Joshua 17:12). The book of Judges opens by repeating Joshua''s unfinished work — the incomplete possession.'),
    ('canon','joshua',17,13,'canon','judges',1,28,'free',E'*And it came to pass, when Yashar''el (Israel) was strong, that they put the Canaanites to tribute, and did not utterly drive them out* (Judges 1:28). Joshua 17:13 says the very same: *when the children of Yashar''el (Israel) were waxen strong, that they put the Canaanites to tribute; but did not utterly drive them out*. Strength came, but the obedience stopped short of fully driving out — the half-done work that becomes a snare in the land.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 — the daughters of Zelophehad inherit according to the commandment of Yahuah (free; NT member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah',
       E'Joshua 17 — The Daughters of Zelophehad Inherit According to the Commandment of Yahuah',
       E'In the wilderness five sisters had brought a cause before Moses; in the land they receive their portion. *But Zelophehad, the son of Hepher, the son of Gilead, the son of Machir, the son of Manasseh, had no sons, but daughters: and these are the names of his daughters, Mahlah, and Noah, Hoglah, Milcah, and Tirzah. And they came near before Eleazar the priest, and before Joshua the son of Nun, and before the princes, saying, Yahuah (LORD) commanded Moses to give us an inheritance among our brethren. Therefore according to the commandment of Yahuah (LORD) he gave them an inheritance among the brethren of their father* (Joshua 17:3-4). The plea behind it was Yahuah''s own justice: *Why should the name of our father be done away from among his family, because he hath no son? Give unto us therefore a possession among the brethren of our father* (Numbers 27:4), and Yahuah answered, *The daughters of Zelophehad speak right: thou shalt surely give them a possession of an inheritance among their father''s brethren... If a man die, and have no son, then ye shall cause his inheritance to pass unto his daughter* (Numbers 27:7-8) — a standing statute of judgment in the Torah. The marriage-law of Numbers 36 then guarded the portion so it would not pass out of Joseph, *Even as Yahuah (LORD) commanded Moses, so did the daughters of Zelophehad* (Numbers 36:10), and Joshua 17:6 reports it kept: *Because the daughters of Manasseh had an inheritance among his sons*. This is the faint, deliberate foreshadow the apostle names: *There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in HaMashiach Yahusha (Christ Jesus)... And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:28-29). The inheritance is not bounded by the expected — but the heirs are still *Abraham''s seed*, the covenant lineage, the daughters gathered IN within Manasseh, not a stranger grafted by bare confession. Yahuah''s justice reaches even the daughters within the seed.',
       sv.verse_id, ev.verse_id, 'free', 35400
  FROM _s344_jos17_lookup sv, _s344_jos17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 — a great people; cut down the wood and drive out the iron chariots (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-17-a-great-people-cut-down-the-wood-and-drive-out-the-iron-chariots',
       E'Joshua 17 — A Great People: Cut Down the Wood and Drive Out the Iron Chariots',
       E'The inheritance is given, but it must be taken — no portion falls to the passive. The children of Joseph complain, *Why hast thou given me but one lot and one portion to inherit, seeing I am a great people, forasmuch as Yahuah (LORD) hath blessed me hitherto?* (Joshua 17:14), and Joshua throws the greatness back on them as a call to labor: *If thou be a great people, then get thee up to the wood country, and cut down for thyself there in the land of the Perizzites and of the giants* (Joshua 17:15). They protest the obstacle — *all the Canaanites that dwell in the land of the valley have chariots of iron* (Joshua 17:16) — the very thing that later defeats Yahudah in the valley: *And Yahuah (LORD) was with Yahudah (Judah); and he drave out the inhabitants of the mountain; but could not drive out the inhabitants of the valley, because they had chariots of iron* (Judges 1:19). But the word to the house of Joseph is a charge of faith, not a concession to fear: *Thou art a great people, and hast great power... But the mountain shall be thine; for it is a wood, and thou shalt cut it down: and the outgoings of it shall be thine: for thou shalt drive out the Canaanites, though they have iron chariots, and though they be strong* (Joshua 17:17-18). The blessing is real and the enemy is strong — and the great people must go up, cut down, and drive out. The inheritance is possessed by faith and effort, the iron chariots notwithstanding.',
       sv.verse_id, ev.verse_id, 'free', 35403
  FROM _s344_jos17_lookup sv, _s344_jos17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=17 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 — the Canaanites that could not be driven out (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-17-the-canaanites-that-could-not-be-driven-out',
       E'Joshua 17 — The Canaanites That Could Not Be Driven Out: the Half-Done Work',
       E'For all the promise, the possession is left incomplete. *Yet the children of Manasseh could not drive out the inhabitants of those cities; but the Canaanites would dwell in that land. Yet it came to pass, when the children of Yashar''el (Israel) were waxen strong, that they put the Canaanites to tribute; but did not utterly drive them out* (Joshua 17:12-13). The book of Judges opens by repeating the very failure, city for city: *Neither did Manasseh drive out the inhabitants of Beth-shean and her towns, nor Taanach and her towns, nor the inhabitants of Dor and her towns, nor the inhabitants of Ibleam and her towns, nor the inhabitants of Megiddo and her towns: but the Canaanites would dwell in that land* (Judges 1:27), and again the same half-measure: *And it came to pass, when Yashar''el (Israel) was strong, that they put the Canaanites to tribute, and did not utterly drive them out* (Judges 1:28). Strength came, and with strength the option of tribute instead of obedience — the Canaanites taxed but not removed. The promise was full; the possession was partial, because the work was left half-done. The un-driven-out remnant becomes the snare that the book of Judges will turn upon again and again.',
       sv.verse_id, ev.verse_id, 'free', 35406
  FROM _s344_jos17_lookup sv, _s344_jos17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD 1 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 27:1 (to 17:3) — the same names and lineage: *the daughters of Zelophehad... Mahlah, Noah, and Hoglah, and Milcah, and Tirzah*; the wilderness case now a land-portion.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=3
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 27:4 (to 17:3) — *Why should the name of our father be done away... because he hath no son?*; Yahuah''s justice will not cut off the name.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=3
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 27:7 (to 17:4) — *The daughters of Zelophehad speak right... cause the inheritance of their father to pass unto them*; the judgment Joshua executes.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 27:8 (to 17:4) — *If a man die, and have no son... cause his inheritance to pass unto his daughter*; the standing statute behind the daughters'' claim.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Galatians 3:28 (to 17:4) — *neither male nor female... all one in HaMashiach Yahusha*; the inheritance not bounded by the expected, the daughters gathered in.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Galatians 3:29 (to 17:4) — *Abraham''s seed, and heirs according to the promise*; the daughters inherit by Yahuah''s word, the seed inheriting by promise.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Numbers 27:7 (to 17:6) — the possession ordered to pass now passed: *the daughters of Manasseh had an inheritance among his sons*.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=27 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Numbers 36:10 (to 17:6) — *Even as Yahuah commanded Moses, so did the daughters*; the marriage-statute keeps the portion within Joseph, the paternal inheritance preserved.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=36 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-daughters-of-zelophehad-inherit-according-to-the-commandment-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 2 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 1:19 (to 17:16) — Yahudah *could not drive out the inhabitants of the valley, because they had chariots of iron*; the very obstacle Joseph fears.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=16
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-a-great-people-cut-down-the-wood-and-drive-out-the-iron-chariots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 1:19 (to 17:18) — against that failure stands the charge: *thou shalt drive out the Canaanites, though they have iron chariots*; the inheritance taken by faith and effort.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=18
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-a-great-people-cut-down-the-wood-and-drive-out-the-iron-chariots'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 3 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Judges 1:27 (to 17:12) — the same un-driven-out cities (Beth-shean, Taanach, Dor, Ibleam, Megiddo): *the Canaanites would dwell in that land*.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=12
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-canaanites-that-could-not-be-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Judges 1:28 (to 17:13) — *when Yashar''el was strong... put the Canaanites to tribute, and did not utterly drive them out*; tribute chosen over obedience.'
  FROM cross_reference_threads t
  JOIN _s344_jos17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s344_jos17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-17-the-canaanites-that-could-not-be-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_18.sql (Joshua 18) -----
-- Joshua 18 — the whole congregation assembles at SHILOH and sets up the tabernacle
--   of the congregation; Joshua rebukes the seven slack tribes; the remaining land is
--   surveyed in a book and divided by LOT before Yahuah at Shiloh; Benjamin's lot
--   comes up between Yahudah and the house of Joseph.
--   Tag jos18; view _s344_jos18_lookup. Sort band 35425, step 3 (35425, 35428, 35431).
--   LEAN allotment chapter — 3 framework-bearing threads (do NOT author boundary verses).
--
-- Joshua 18 coverage:
--   v.1  (the tabernacle of the congregation set up at Shiloh; the land subdued)
--        NT:     none warranted (the central-sanctuary motif stays Tanakh here)
--        Extras: none warranted
--        Tanakh: Deuteronomy 12:5, Deuteronomy 12:11 (the place Yahuah chooses to put His
--                name); 1 Samuel 1:3 (Shiloh the sanctuary to Samuel's day); Psalm 78:60
--                (He forsook the tabernacle of Shiloh); Jeremiah 7:12 (go ye now unto my
--                place which was in Shiloh) — THREAD 1
--   v.3  (How long are ye SLACK to go to possess the land Yahuah hath given you?)
--        NT:     none warranted (carried by the inheritance frame)
--        Extras: none warranted
--        Tanakh: Deuteronomy 12:9, Deuteronomy 12:10 (the rest and the inheritance);
--                Psalm 78:55 (cast out the heathen, divided them an inheritance) — THREAD 2
--   v.8-10 (the land described in a book; Joshua casts lots before Yahuah in Shiloh)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: folded into THREAD 1 (cast lots BEFORE YAHUAH IN SHILOH = the chosen place)
--   v.11 (Benjamin's lot between the children of Yahudah and the children of Joseph)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 78:67, Psalm 78:68 (refused Joseph/Ephraim, chose Yahudah) — THREAD 3
--   v.12-28 (Benjamin's borders and cities)
--        NT/Extras/Tanakh: none warranted — boundary verses, intentionally not authored (lean)
--
-- THREADS:
--   THREAD 1 joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name (free):
--            Tanakh only (Deuteronomy 12, 1 Samuel 1, Psalm 78, Jeremiah 7)
--   THREAD 2 joshua-18-how-long-are-ye-slack-to-possess-the-inheritance (free):
--            Tanakh only (Deuteronomy 12, Psalm 78)
--   THREAD 3 joshua-18-benjamin-the-lot-between-yahudah-and-joseph (free):
--            Tanakh only (Psalm 78) — the two houses
--
-- Framework-load-bearing notes:
--   * 18:1 *set up the tabernacle of the congregation there* (at Shiloh) — the central
--     sanctuary, the dwelling of Yahuah, the place He chose out of all the tribes to put
--     His name (Deut 12:5,11). Shiloh remains the sanctuary through the Judges and to
--     Samuel (1 Sam 1:3) until its ruin for the wickedness of the people — *he forsook
--     the tabernacle of Shiloh* (Ps 78:60); *go ye now unto my place which was in Shiloh*
--     (Jer 7:12). The appointed-times architecture: the tent of meeting / the dwelling of
--     His Name established before the temple. NOT a defunct shadow — the living centre.
--   * 18:3 *How long are ye slack to go to possess the land?* — the promise possessed only
--     by GOING UP. Deut 12:9-10 names the goal: *the rest and the inheritance*. The land is
--     given by oath yet still must be claimed; the slackness forfeits the gift not yet taken.
--   * 18:11 Benjamin's lot falls *between the children of Yahudah (Judah) and the children
--     of Joseph* — the small seam-tribe set between the two houses (Yahudah south, Joseph
--     north), the very fault-line Psalm 78 names: *he refused the tabernacle of Joseph...
--     But chose the tribe of Yahudah* (Ps 78:67-68). The two-house frame already in the lot.

CREATE TEMP VIEW _s344_jos18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the tabernacle set up at Shiloh, the place of His name (18:1, 18:8, 18:10)
    ('canon','joshua',18,1,'canon','deuteronomy',12,5,'free',E'*But unto the place which Yahuah Elohaychem (the LORD your God) shall choose out of all your tribes to put his name there, even unto his habitation shall ye seek, and thither thou shalt come* (Deuteronomy 12:5). When *the whole congregation of the children of Yashar''el (Israel) assembled together at Shiloh, and set up the tabernacle of the congregation there* (Joshua 18:1), the command is kept — Shiloh is the place chosen out of all the tribes to put His name, His habitation sought out at last in the land.'),
    ('canon','joshua',18,1,'canon','deuteronomy',12,11,'free',E'*Then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there; thither shall ye bring all that I command you* (Deuteronomy 12:11). The promise of one chosen place where the Name would dwell now rests at Shiloh, where they *set up the tabernacle of the congregation* (Joshua 18:1) — the central sanctuary of the appointed times, the dwelling of Yahuah established in the midst of His people.'),
    ('canon','joshua',18,1,'canon','1-samuel',1,3,'free',E'*And this man went up out of his city yearly to worship and to sacrifice unto Yahuah Tseva''ot (LORD of hosts) in Shiloh* (1 Samuel 1:3). The tabernacle *set up* at Shiloh in Joshua 18:1 is still the sanctuary generations later, the place the faithful go up yearly to worship in the days of Eli and Samuel — Shiloh the standing centre of Yahuah''s house through all the Judges.'),
    ('canon','joshua',18,1,'canon','psalms',78,60,'free',E'*So that he forsook the tabernacle of Shiloh, the tent which he placed among men* (Psalm 78:60). The tent *set up* at Shiloh (Joshua 18:1) is *the tent which he placed among men* — the dwelling of Yahuah that would one day be forsaken for the wickedness of His people, His strength delivered into captivity and His glory into the enemy''s hand.'),
    ('canon','joshua',18,1,'canon','jeremiah',7,12,'free',E'*But go ye now unto my place which was in Shiloh, where I set my name at the first, and see what I did to it for the wickedness of my people Yashar''el (Israel)* (Jeremiah 7:12). Yahuah Himself calls Shiloh *my place... where I set my name at the first* — the very sanctuary *set up* in Joshua 18:1; its later ruin becomes the warning to Yahudah''s temple, that the chosen place is no charm against covenant-breaking.'),
    ('canon','joshua',18,10,'canon','deuteronomy',12,5,'free',E'*But unto the place which Yahuah Elohaychem (the LORD your God) shall choose out of all your tribes to put his name there... thither thou shalt come* (Deuteronomy 12:5). *And Joshua cast lots for them in Shiloh before Yahuah (LORD): and there Joshua divided the land unto the children of Yashar''el (Israel)* (Joshua 18:10). The inheritance is apportioned not at any place but *before Yahuah in Shiloh* — at the chosen sanctuary where His name dwells, the lot cast in His presence.'),
    ('canon','joshua',18,8,'canon','jeremiah',7,12,'free',E'*But go ye now unto my place which was in Shiloh, where I set my name at the first* (Jeremiah 7:12). Joshua charges the surveyors to come again *that I may here cast lots for you before Yahuah (LORD) in Shiloh* (Joshua 18:8) — the place where Yahuah *set my name at the first*; the whole work of dividing the inheritance is done at the sanctuary of His Name.'),
    -- THREAD 2 — how long are ye slack to possess the inheritance (18:3)
    ('canon','joshua',18,3,'canon','deuteronomy',12,9,'free',E'*For ye are not as yet come to the rest and to the inheritance, which Yahuah Elohaychem (the LORD your God) giveth you* (Deuteronomy 12:9). Moses had named the goal — *the rest and the inheritance* — and now Joshua rebukes the slackness toward it: *How long are ye slack to go to possess the land, which Yahuah Elohim (the LORD God) of your fathers hath given you?* (Joshua 18:3). The rest is given, yet still must be entered; the inheritance is a gift claimed only by going up.'),
    ('canon','joshua',18,3,'canon','deuteronomy',12,10,'free',E'*But when ye go over Jordan, and dwell in the land which Yahuah Elohaychem (the LORD your God) giveth you to inherit, and when he giveth you rest from all your enemies round about, so that ye dwell in safety* (Deuteronomy 12:10). The promised dwelling *in the land which Yahuah giveth you to inherit* is the very thing the seven tribes are *slack to go to possess* (Joshua 18:3) — the land *given* by oath, yet possessed only by those who rise and take it.'),
    ('canon','joshua',18,3,'canon','psalms',78,55,'free',E'*He cast out the heathen also before them, and divided them an inheritance by line, and made the tribes of Yashar''el (Israel) to dwell in their tents* (Psalm 78:55). The Psalm sings the gift the slack tribes neglect: Yahuah Himself *divided them an inheritance by line*. The land *which Yahuah Elohim (the LORD God) of your fathers hath given you* (Joshua 18:3) is His doing — to be slack to possess it is to slight the hand that cast out the heathen and gave the line.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 3 — Benjamin's lot between Yahudah and Joseph (18:11) — separate INSERT so the
--   Psalm 78:67/68 targets that only this thread uses are added (already covered above is none)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','joshua',18,11,'canon','psalms',78,67,'free',E'*Moreover he refused the tabernacle of Joseph, and chose not the tribe of Ephraim* (Psalm 78:67). Benjamin''s lot *came forth between the children of Yahudah (Judah) and the children of Joseph* (Joshua 18:11) — the small seam-tribe set on the very fault-line between the two houses, the line where Yahuah would later *refuse the tabernacle of Joseph* (the northern house) and keep Yahudah.'),
    ('canon','joshua',18,11,'canon','psalms',78,68,'free',E'*But chose the tribe of Yahudah (Judah), the mount Zion which he loved* (Psalm 78:68). Benjamin''s border falls *between the children of Yahudah (Judah) and the children of Joseph* (Joshua 18:11), and into Benjamin''s portion would come Jebusi *which is Jerusalem* (Joshua 18:28) — the very ground of *the mount Zion which he loved*, where Yahuah *chose the tribe of Yahudah*; the two-house frame is already drawn in the lot.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 — the tabernacle set up at Shiloh, the place of His name (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name',
       E'Joshua 18 — The Tabernacle Set Up at Shiloh: the Place Yahuah Chose for His Name',
       E'With the land subdued, the whole nation gathers and the dwelling of Yahuah is planted at its centre. *And the whole congregation of the children of Yashar''el (Israel) assembled together at Shiloh, and set up the tabernacle of the congregation there. And the land was subdued before them* (Joshua 18:1). This is the keeping of Moses'' word about the one chosen place: *But unto the place which Yahuah Elohaychem (the LORD your God) shall choose out of all your tribes to put his name there, even unto his habitation shall ye seek, and thither thou shalt come* (Deuteronomy 12:5); *Then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there* (Deuteronomy 12:11). Shiloh becomes that place — the central sanctuary of the appointed times, the tent of meeting where the lot is cast: *And Joshua cast lots for them in Shiloh before Yahuah (LORD): and there Joshua divided the land unto the children of Yashar''el (Israel)* (Joshua 18:10). It stands as the house of Yahuah through all the Judges and down to Samuel: *And this man went up out of his city yearly to worship and to sacrifice unto Yahuah Tseva''ot (LORD of hosts) in Shiloh* (1 Samuel 1:3). And because the chosen place is no charm against covenant-breaking, it would one day be forsaken — *So that he forsook the tabernacle of Shiloh, the tent which he placed among men* (Psalm 78:60) — its ruin made the prophet''s warning to Yahudah''s temple: *But go ye now unto my place which was in Shiloh, where I set my name at the first, and see what I did to it for the wickedness of my people Yashar''el (Israel)* (Jeremiah 7:12). The dwelling of His Name, established here, lived and was forsaken — the living centre, never a defunct shadow.',
       sv.verse_id, ev.verse_id, 'free', 35425
  FROM _s344_jos18_lookup sv, _s344_jos18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=18 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 — how long are ye slack to possess the inheritance (free)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-18-how-long-are-ye-slack-to-possess-the-inheritance',
       E'Joshua 18 — How Long Are Ye Slack? The Inheritance Claimed Only by Going Up',
       E'Seven tribes still have no inheritance, and Joshua names the cause — not lack of promise but slackness to take it. *And there remained among the children of Yashar''el (Israel) seven tribes, which had not yet received their inheritance. And Joshua said unto the children of Yashar''el (Israel), How long are ye slack to go to possess the land, which Yahuah Elohim (the LORD God) of your fathers hath given you?* (Joshua 18:2-3). Moses had set *the rest and the inheritance* as the very goal of the crossing: *For ye are not as yet come to the rest and to the inheritance, which Yahuah Elohaychem (the LORD your God) giveth you* (Deuteronomy 12:9); *But when ye go over Jordan, and dwell in the land which Yahuah Elohaychem (the LORD your God) giveth you to inherit, and when he giveth you rest from all your enemies round about, so that ye dwell in safety* (Deuteronomy 12:10). The land is *given* by oath, yet it is possessed only by those who rise and go up — and to be slack toward it is to slight the hand that won it: *He cast out the heathen also before them, and divided them an inheritance by line, and made the tribes of Yashar''el (Israel) to dwell in their tents* (Psalm 78:55). The promise is sure; the inheritance is a gift that must still be claimed.',
       sv.verse_id, ev.verse_id, 'free', 35428
  FROM _s344_jos18_lookup sv, _s344_jos18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=18 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 — Benjamin's lot between Yahudah and Joseph (free) — the two houses
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-18-benjamin-the-lot-between-yahudah-and-joseph',
       E'Joshua 18 — Benjamin''s Lot: the Seam Between the Two Houses',
       E'The first lot cast at Shiloh falls on Benjamin, and it falls on the very seam of the divided kingdom to come. *And the lot of the tribe of the children of Benjamin came up according to their families: and the coast of their lot came forth between the children of Yahudah (Judah) and the children of Joseph* (Joshua 18:11). Benjamin, the small seam-tribe, is set between the two houses — Yahudah in the south and Joseph in the north — the very fault-line along which the people would one day be torn, and along which Yahuah would make His choice: *Moreover he refused the tabernacle of Joseph, and chose not the tribe of Ephraim: But chose the tribe of Yahudah (Judah), the mount Zion which he loved* (Psalm 78:67-68). Into Benjamin''s portion came *Jebusi, which is Jerusalem* (Joshua 18:28) — the ground of *the mount Zion which he loved*. The two-house frame is already drawn in the casting of the lot before Yahuah at Shiloh.',
       sv.verse_id, ev.verse_id, 'free', 35431
  FROM _s344_jos18_lookup sv, _s344_jos18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=18 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD 1 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 12:5 (to 18:1) — *the place which Yahuah... shall choose... to put his name there*; Shiloh is that chosen place.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 12:11 (to 18:1) — *a place... to cause his name to dwell there*; the Name dwells at Shiloh.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 1:3 (to 18:1) — *to worship and to sacrifice unto Yahuah Tseva''ot in Shiloh*; the standing sanctuary to Samuel''s day.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 78:60 (to 18:1) — *he forsook the tabernacle of Shiloh, the tent which he placed among men*; the chosen tent later forsaken.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=60
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Jeremiah 7:12 (to 18:1) — *go ye now unto my place which was in Shiloh, where I set my name at the first*; its ruin warns Yahudah''s temple.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Deuteronomy 12:5 (to 18:10) — the lot is cast *before Yahuah in Shiloh*, at the chosen place where His name is put.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=10
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Jeremiah 7:12 (to 18:8) — Joshua casts lots *before Yahuah in Shiloh*, the place *where I set my name at the first*.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=8
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-the-tabernacle-set-up-at-shiloh-the-place-of-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 2 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 12:9 (to 18:3) — *the rest and the inheritance, which Yahuah... giveth you*; the goal the slack tribes neglect.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-how-long-are-ye-slack-to-possess-the-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 12:10 (to 18:3) — *the land which Yahuah... giveth you to inherit*; given by oath, possessed only by going up.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-how-long-are-ye-slack-to-possess-the-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 78:55 (to 18:3) — *divided them an inheritance by line*; to be slack is to slight the hand that gave the land.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-how-long-are-ye-slack-to-possess-the-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ===== THREAD 3 members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 78:67 (to 18:11) — *he refused the tabernacle of Joseph*; Benjamin''s lot falls on the seam between Joseph and Yahudah.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=67
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-benjamin-the-lot-between-yahudah-and-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 78:68 (to 18:11) — *chose the tribe of Yahudah, the mount Zion which he loved*; Jerusalem falls in Benjamin''s portion.'
  FROM cross_reference_threads t
  JOIN _s344_jos18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s344_jos18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=68
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-18-benjamin-the-lot-between-yahudah-and-joseph'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_19.sql (Joshua 19) -----
--
-- Chapter: Joshua 19 — the inheritance of the remaining tribes (Simeon, Zebulun,
--   Issachar, Asher, Naphtali, Dan), then Joshua's own portion last, divided by lot
--   at Shiloh before Yahuah.
-- Tag: jos19   View: _s344_jos19_lookup   Sort band: 35450, 35453
--
-- Joshua 19 coverage:
--   v.1,9 (Simeon's inheritance WITHIN Yahudah's portion):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Genesis 49:5,7 (Simeon scattered/divided in Yashar'el) — THREADED (thread 1)
--   v.10,16 (Zebulun's border) + v.32,39 (Naphtali's border) = the land of Galilee:
--        NT:     Matthew 4:13,15,16 (Messiah dwells in Zabulon/Nephthalim, the light) — THREADED (thread 2)
--        Extras: none warranted
--        Tanakh: Isaiah 9:1,2 (Galilee of the nations, the great light) — THREADED (thread 2)
--   v.17-23 (Issachar), v.24-31 (Asher), v.40-48 (Dan) boundary lists:
--        NT/Extras/Tanakh: none warranted (boundary verses, kept lean per chapter guidance)
--   v.49-50 (Joshua receives Timnath-serah LAST, the servant-leader):
--        NT/Extras/Tanakh: none warranted as a SEPARATE thread — chapter capped at 2 threads
--        (lean allotment chapter); recorded weighed, deliberately not threaded.
--   v.51 (divided by lot at Shiloh before Yahuah):
--        none warranted (procedural close)
--
-- Threads:
--   1. joshua-19-simeon-scattered-within-yahudah-the-patriarchs-word-fulfilled  [Tanakh]  (free)
--        Jos 19:1,9 -> Gen 49:5,7
--   2. joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns       [Tanakh+NT]  (free)
--        Jos 19:10,32 -> Isa 9:1,2 ; Matt 4:13,15,16
--

CREATE TEMP VIEW _s344_jos19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Simeon scattered within Yahudah — Jacob's word fulfilled
    ('canon','joshua',19,1,'canon','genesis',49,5,'free',E'*Simeon and Levi are brethren; instruments of cruelty are in their habitations.* (Genesis 49:5). Jacob names the brothers whose fierce anger he will judge; here in Joshua *the second lot came forth to Simeon... and their inheritance was within the inheritance of the children of Yahudah (Judah)* (Joshua 19:1) — Simeon receives no separate land but is absorbed into Yahudah''s portion, the first motion of the dividing the patriarch foretold.'),
    ('canon','joshua',19,1,'canon','genesis',49,7,'free',E'*Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* (Genesis 49:7). The patriarch''s *I will divide... and scatter* lands precisely here: *the second lot came forth to Simeon... and their inheritance was within the inheritance of the children of Yahudah (Judah)* (Joshua 19:1) — Simeon is given no land of his own but scattered among Yahudah, the word made allotment.'),
    ('canon','joshua',19,9,'canon','genesis',49,7,'free',E'*Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel).* (Genesis 49:7). Joshua records the reason: *Out of the portion of the children of Yahudah (Judah) was the inheritance of the children of Simeon: for the part of the children of Yahudah (Judah) was too much for them: therefore the children of Simeon had their inheritance within the inheritance of them* (Joshua 19:9) — Simeon dwelling inside another tribe''s land is the patriarchal *scatter them in Yashar''el (Israel)* coming to pass.'),
    -- Thread 2: Zebulun and Naphtali — Galilee, where the great light dawns
    ('canon','joshua',19,10,'canon','isaiah',9,1,'free',E'*Nevertheless the dimness shall not be such as was in her vexation, when at the first he lightly afflicted the land of Zebulun and the land of Naphtali, and afterward did more grievously afflict her by the way of the sea, beyond Jordan, in Galilee of the nations.* (Isaiah 9:1). The territory measured out here — *the third lot came up for the children of Zebulun... and the border of their inheritance was unto Sarid* (Joshua 19:10) — is the very *land of Zebulun* Isaiah marks as the place where the dawn will break.'),
    ('canon','joshua',19,10,'canon','isaiah',9,2,'free',E'*The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined.* (Isaiah 9:2). The inheritance of Zebulun apportioned here (Joshua 19:10) becomes the ground of the *great light* — the tribal allotment is the stage on which the Messiah''s light would later shine.'),
    ('canon','joshua',19,10,'canon','matthew',4,13,'free',E'*And leaving Nazareth, he came and dwelt in Capernaum, which is upon the sea coast, in the borders of Zabulon and Nephthalim* (Matthew 4:13). The Messiah takes up residence in the very *borders of Zabulon* whose boundary *unto Sarid* (Joshua 19:10) was drawn here at the conquest — the inheritance prepared the place where he would dwell and minister.'),
    ('canon','joshua',19,10,'canon','matthew',4,15,'free',E'*The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles* (Matthew 4:15). Matthew quotes Isaiah back over this allotment: the *children of Zebulun* whose border is set in Joshua 19:10 are the *land of Zabulon* whose deliverance the gospel proclaims fulfilled.'),
    ('canon','joshua',19,32,'canon','isaiah',9,1,'free',E'*Nevertheless the dimness shall not be such as was in her vexation, when at the first he lightly afflicted the land of Zebulun and the land of Naphtali, and afterward did more grievously afflict her by the way of the sea, beyond Jordan, in Galilee of the nations.* (Isaiah 9:1). *The sixth lot came out to the children of Naphtali* (Joshua 19:32); this *land of Naphtali*, named beside Zebulun, is the second half of the Galilee where Isaiah promises the dimness will be undone.'),
    ('canon','joshua',19,32,'canon','matthew',4,15,'free',E'*The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles* (Matthew 4:15). The portion measured to Naphtali — *the sixth lot came out to the children of Naphtali, even for the children of Naphtali according to their families* (Joshua 19:32) — is the *land of Nephthalim* the evangelist names as the ground where the prophecy of the light was fulfilled.'),
    ('canon','joshua',19,32,'canon','matthew',4,16,'free',E'*The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up.* (Matthew 4:16). On the inheritance of Naphtali set down in Joshua 19:32 the *great light* sprang up; the tribal allotment is fulfilled when the Messiah walks its borders.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-19-simeon-scattered-within-yahudah-the-patriarchs-word-fulfilled',
       E'Simeon scattered within Yahudah — the patriarch''s word fulfilled',
       E'When Jacob blessed his sons he passed sentence on Simeon: *Simeon and Levi are brethren; instruments of cruelty are in their habitations* (Genesis 49:5), and *Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel)* (Genesis 49:7). Here that word becomes a land-survey. *And the second lot came forth to Simeon, even for the tribe of the children of Simeon according to their families: and their inheritance was within the inheritance of the children of Yahudah (Judah)* (Joshua 19:1) — Simeon receives no border of his own. Joshua states the reason plainly: *Out of the portion of the children of Yahudah (Judah) was the inheritance of the children of Simeon: for the part of the children of Yahudah (Judah) was too much for them: therefore the children of Simeon had their inheritance within the inheritance of them* (Joshua 19:9). Simeon is divided in Jacob and scattered in Yashar''el, dwelling inside his brother''s portion. The patriarchal blessing is not poetry only — it is covenant decree, and the allotment of the land is its fulfillment, the same Yahuah who spoke through the father dividing the inheritance through Joshua.',
       sv.verse_id, ev.verse_id, 'free', 35450
  FROM _s344_jos19_lookup sv, _s344_jos19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=19 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns',
       E'Zebulun and Naphtali — Galilee, where the great light dawns',
       E'Two of the lots in this chapter map out the region the prophets would call Galilee. *And the third lot came up for the children of Zebulun according to their families: and the border of their inheritance was unto Sarid* (Joshua 19:10); *The sixth lot came out to the children of Naphtali, even for the children of Naphtali according to their families* (Joshua 19:32). Centuries later Isaiah laid his finger on that same ground: *Nevertheless the dimness shall not be such as was in her vexation, when at the first he lightly afflicted the land of Zebulun and the land of Naphtali, and afterward did more grievously afflict her by the way of the sea, beyond Jordan, in Galilee of the nations* (Isaiah 9:1) — and promised, *The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* (Isaiah 9:2). The northern tribes, first to be afflicted and carried off in the Assyrian exile, are marked as the first to see the dawn. The evangelist closes the circle: *And leaving Nazareth, he came and dwelt in Capernaum, which is upon the sea coast, in the borders of Zabulon and Nephthalim* (Matthew 4:13), *That it might be fulfilled which was spoken by Esaias the prophet... The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles; The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up* (Matthew 4:15-16). The Formed Son chose the inheritance of Zebulun and Naphtali — the very borders surveyed here at the conquest — to begin his ministry. The tribal allotment was never incidental; it prepared the land on which the light would shine, the scattered house of Yashar''el meeting its salvation on its own ground.',
       sv.verse_id, ev.verse_id, 'free', 35453
  FROM _s344_jos19_lookup sv, _s344_jos19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=19 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: Simeon scattered within Yahudah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* The brothers Jacob marks for judgment; Simeon''s landless inheritance begins to fulfill it.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=1
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-simeon-scattered-within-yahudah-the-patriarchs-word-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 49:7 — *I will divide them in Jacob, and scatter them in Yashar''el (Israel).* The decree; Simeon''s lot *within the inheritance of... Yahudah* (Joshua 19:1) is the scattering enacted.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=1
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-simeon-scattered-within-yahudah-the-patriarchs-word-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 49:7 — *I will... scatter them in Yashar''el (Israel).* Joshua 19:9 gives the reason: Yahudah''s part *was too much for them*, so Simeon dwells inside it — the word made allotment.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=9
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-simeon-scattered-within-yahudah-the-patriarchs-word-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Zebulun and Naphtali — Galilee, where the great light dawns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 9:1 — *...when at the first he lightly afflicted the land of Zebulun and the land of Naphtali... in Galilee of the nations.* The lot of Zebulun (Joshua 19:10) is the land Isaiah marks for the coming dawn.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 9:2 — *The people that walked in darkness have seen a great light.* Zebulun''s inheritance (Joshua 19:10) becomes the ground of the great light.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Matthew 4:13 — *...he came and dwelt in Capernaum... in the borders of Zabulon and Nephthalim.* The Messiah dwells in the very borders of Zebulun set in Joshua 19:10.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Matthew 4:15 — *The land of Zabulon, and the land of Nephthalim... Galilee of the Gentiles.* The gospel names Zebulun''s allotment (Joshua 19:10) as the prophecy fulfilled.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Isaiah 9:1 — *...the land of Naphtali... in Galilee of the nations.* The sixth lot to Naphtali (Joshua 19:32) is the second half of the Galilee Isaiah names.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=32
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Matthew 4:15 — *The land of... Nephthalim, by the way of the sea... Galilee of the Gentiles.* Naphtali''s lot (Joshua 19:32) is the land of Nephthalim the evangelist names.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=32
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Matthew 4:16 — *The people which sat in darkness saw great light.* On Naphtali''s inheritance (Joshua 19:32) the great light sprang up.'
  FROM cross_reference_threads t
  JOIN _s344_jos19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=19 AND sv.verse_number=32
  JOIN _s344_jos19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-19-zebulun-and-naphtali-galilee-where-the-great-light-dawns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_20.sql (Joshua 20) -----
-- Chapter: Joshua 20 — THE CITIES OF REFUGE (Kedesh, Shechem, Hebron west; Bezer, Ramoth, Golan east)
-- Tag: jos20   View: _s344_jos20_lookup   Sort band: 35475, 35478, 35481, 35484
--
-- Joshua 20 coverage:
--   v.1-3  (appoint cities of refuge, the slayer that killeth unawares may flee, refuge from the avenger of blood)
--          NT:     none warranted at the verse (the Torah-mercy weave is Tanakh-lateral)
--          Extras: none warranted
--          Tanakh: Numbers 35:9-15,22-25 (the original statute), Deuteronomy 19:1-6 (three cities, the slayer
--                  that hated him not), Exodus 21:13-14 (Elohim deliver him into his hand → a place to flee /
--                  the presumptuous slayer taken from the altar) — Torah's own provision of mercy & due process
--   v.4-5  (stand at the gate, declare his cause to the elders, not delivered to the avenger, smote unwittingly)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Numbers 35:12,24-25 (congregation judges, slayer not die until he stand for judgment),
--                  Deuteronomy 19:11-13 (the murderer fetched out — due process distinguishes intent)
--   v.6    (dwell until the death of the HIGH PRIEST, then the slayer return) — the keystone type
--          NT:     Hebrews 6:18 (fled for refuge to lay hold upon the hope), Hebrews 9:15 (mediator, by means
--                  of death the redemption of transgressions) — the great High Priest whose death sets free
--          Extras: none warranted
--          Tanakh: Numbers 35:25,28,32 (abide unto the death of the high priest, then return to possession)
--   v.7-9  (Kedesh, Shechem, Hebron, Bezer, Ramoth, Golan; for Yashar'el AND the stranger that sojourneth)
--          NT:     Romans 8:1 (no condemnation to them in Messiah) — the refuge from the avenger/condemnation
--          Extras: none warranted
--          Tanakh: Psalm 46:1 (Elohim is our refuge and strength), Numbers 35:15 (refuge for Israel and the
--                  stranger and the sojourner) — Yahuah Himself the refuge, mercy reaching the sojourner
--
-- Threads (all members canon → tier_required 'free'):
--   joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares   [Tanakh: Numbers, Deuteronomy, Exodus]
--   joshua-20-until-the-death-of-the-high-priest-then-the-slayer-shall-return [Tanakh: Numbers | NT: Hebrews]
--   joshua-20-a-refuge-from-the-avenger-yahuah-himself-the-refuge             [Tanakh: Psalms, Numbers | NT: Romans]
--
-- Framework notes: the cities of refuge are the Torah's OWN provision of mercy and due process — the curse is
-- never the Torah; here the Torah shelters the innocent-of-intent from the avenger of blood (Num 35/Deut 19),
-- distinguishing the manslayer from the murderer. The death of the high priest that frees the refugee (20:6) is
-- a faint Messianic type read FORWARD to the great High Priest whose death opens the way (Heb 6:18/9:15) — a
-- foreshadow, NOT co-equal-trinity grammar; the Formed Son after the order of Melek Tsadiq. Refuge for Israel
-- AND the stranger/sojourner (20:9, Num 35:15) — mercy reaching beyond the native-born.

CREATE TEMP VIEW _s344_jos20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the cities of refuge = Torah's mercy for the slayer unawares (Numbers / Deuteronomy / Exodus)
    ('canon','joshua',20,2,'canon','numbers',35,11,'free',E'*Then ye shall appoint you cities to be cities of refuge for you; that the slayer may flee thither, which killeth any person at unawares* (Numbers 35:11). Joshua does what Yahuah commanded *by the hand of Moses* (20:2) — *Appoint out for you cities of refuge*. The provision is no new mercy invented at the conquest; it is the Torah''s own statute now planted in the land. The Torah is never the curse — here it is the very shelter of the innocent-of-intent.'),
    ('canon','joshua',20,3,'canon','numbers',35,15,'free',E'*These six cities shall be a refuge, both for the children of Yashar''el (Israel), and for the stranger, and for the sojourner among them: that every one that killeth any person unawares may flee thither* (Numbers 35:15). The Joshua statute — *That the slayer that killeth any person unawares and unwittingly may flee thither: and they shall be your refuge from the avenger of blood* (20:3) — quotes Moses word for word; the same mercy, and it reaches the stranger, not the native-born alone.'),
    ('canon','joshua',20,3,'canon','deuteronomy',19,4,'free',E'*And this is the case of the slayer, which shall flee thither, that he may live: Whoso killeth his neighbour ignorantly, whom he hated not in time past* (Deuteronomy 19:4). Joshua''s *unawares and unwittingly* (20:3) is Moses'' *ignorantly... hated not in time past* — the Torah carefully distinguishes the accidental death from murder, sheltering the one whose heart held no malice.'),
    ('canon','joshua',20,3,'canon','exodus',21,13,'free',E'*And if a man lie not in wait, but Elohim (God) deliver him into his hand; then I will appoint thee a place whither he shall flee* (Exodus 21:13). The seed of the whole refuge law: where there was no lying-in-wait, Yahuah Himself appoints *a place whither he shall flee* — the cities of Joshua 20 are that appointed place made real, the Torah''s mercy from the first giving of the judgments.'),
    ('canon','joshua',20,5,'canon','exodus',21,14,'free',E'*But if a man come presumptuously upon his neighbour, to slay him with guile; thou shalt take him from mine altar, that he may die* (Exodus 21:14). The refuge shelters only the unwitting: *because he smote his neighbour unwittingly, and hated him not beforetime* (20:5). The presumptuous murderer finds no sanctuary — torn even from the altar — but the slayer who hated not is *not delivered up into his hand*. Mercy and justice in one statute.'),
    ('canon','joshua',20,5,'canon','deuteronomy',19,6,'free',E'*Lest the avenger of the blood pursue the slayer, while his heart is hot, and overtake him, because the way is long, and slay him; whereas he was not worthy of death, inasmuch as he hated him not in time past* (Deuteronomy 19:6). The refuge stands precisely against the hot-hearted avenger of 20:5 — *if the avenger of blood pursue after him, then they shall not deliver the slayer up into his hand*. The Torah cools the blood-feud and guards the one *not worthy of death*.'),
    -- THREAD 1: due process at the gate (Numbers 35:24, Deuteronomy 19:11-12)
    ('canon','joshua',20,4,'canon','numbers',35,24,'free',E'*Then the congregation shall judge between the slayer and the revenger of blood according to these judgments* (Numbers 35:24). The manslayer of Joshua 20 *shall stand at the entering of the gate of the city, and shall declare his cause in the ears of the elders* (20:4) — open due process, the congregation weighing intent, no man condemned unheard. The Torah''s justice is deliberate, not vengeful.'),
    ('canon','joshua',20,6,'canon','deuteronomy',19,12,'free',E'*Then the elders of his city shall send and fetch him thence, and deliver him into the hand of the avenger of blood, that he may die* (Deuteronomy 19:12). The refuge is no blanket pardon: *he shall dwell in that city, until he stand before the congregation for judgment* (20:6). A true murderer who flees there is fetched out to die — the city shelters the innocent of intent, never the guilty.'),
    -- THREAD 2: until the death of the high priest, then the slayer shall return (Numbers 35 / Hebrews 6 & 9)
    ('canon','joshua',20,6,'canon','numbers',35,25,'free',E'*And the congregation shall deliver the slayer out of the hand of the revenger of blood... and he shall abide in it unto the death of the high priest, which was anointed with the holy oil* (Numbers 35:25). Joshua''s statute is Moses'' exactly — the slayer dwells *until the death of the high priest that shall be in those days: then shall the slayer return* (20:6). The death of the anointed priest, not the slayer''s own merit, releases him to his possession.'),
    ('canon','joshua',20,6,'canon','numbers',35,28,'free',E'*Because he should have remained in the city of his refuge until the death of the high priest: but after the death of the high priest the slayer shall return into the land of his possession* (Numbers 35:28). The clock of the refuge runs by the life of the high priest — *then shall the slayer return, and come unto his own city, and unto his own house* (20:6). A death sets the sheltered one free to go home.'),
    ('canon','joshua',20,6,'canon','hebrews',6,18,'free',E'*That by two immutable things, in which it was impossible for Elohim (God) to lie, we might have a strong consolation, who have fled for refuge to lay hold upon the hope set before us* (Hebrews 6:18). The refugee flees to the city; the believer has *fled for refuge to lay hold upon the hope*. Joshua''s manslayer waits *until the death of the high priest* (20:6); the next breath of Hebrews names *Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq* (Heb 6:20) — the type read forward to the great High Priest who is the refuge.'),
    ('canon','joshua',20,6,'canon','hebrews',9,15,'free',E'*And for this cause he is the mediator of the new testament, that by means of death, for the redemption of the transgressions that were under the first testament, they which are called might receive the promise of eternal inheritance* (Hebrews 9:15). As the high priest''s death freed the refugee to *return... unto his own house* (20:6), so *by means of death* the great High Priest opens the way to the *eternal inheritance* — a faint foreshadow filled, the Formed Son who has a Father, not a co-equal person.'),
    -- THREAD 3: a refuge from the avenger — Yahuah Himself the refuge (Psalm 46 / Romans 8 / Numbers 35:15)
    ('canon','joshua',20,3,'canon','psalms',46,1,'free',E'*Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1). The six cities are *your refuge from the avenger of blood* (20:3) — and the stone walls only picture the deeper truth the Psalmist sings: Yahuah Himself is the refuge to whom His people flee. *The Elohim (God) of Jacob is our refuge* (Ps 46:7,11).'),
    ('canon','joshua',20,3,'canon','romans',8,1,'free',E'*There is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit* (Romans 8:1). The slayer inside the gate is safe from the avenger — *they shall not deliver the slayer up into his hand* (20:5). So *no condemnation* shelters those who have fled to Messiah from the pursuit of death; the refuge of Joshua 20 read forward to the refuge that swallows condemnation itself.'),
    ('canon','joshua',20,9,'canon','numbers',35,15,'free',E'*These six cities shall be a refuge, both for the children of Yashar''el (Israel), and for the stranger, and for the sojourner among them* (Numbers 35:15). Joshua''s closing word is the same mercy: *These were the cities appointed for all the children of Yashar''el (Israel), and for the stranger that sojourneth among them* (20:9). The refuge of Yahuah is wide — it covers the sojourner, not the native-born alone.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares',
       E'The Cities of Refuge — the Torah''s Mercy for the Slayer Unawares',
       E'Joshua appoints the cities of refuge *as Yahuah (LORD) commanded by the hand of Moses* — *That the slayer that killeth any person unawares and unwittingly may flee thither: and they shall be your refuge from the avenger of blood* (Joshua 20:2-3). This is no new mercy invented at the conquest; it is the Torah''s own statute now planted in the land. Moses had given it twice: *Then ye shall appoint you cities to be cities of refuge for you; that the slayer may flee thither, which killeth any person at unawares* (Numbers 35:11), and *These six cities shall be a refuge, both for the children of Yashar''el (Israel), and for the stranger, and for the sojourner among them* (Numbers 35:15); and *And this is the case of the slayer, which shall flee thither, that he may live: Whoso killeth his neighbour ignorantly, whom he hated not in time past* (Deuteronomy 19:4). The Torah is never the curse — here it is the very shelter of the innocent-of-intent. The whole law turns on intent: *And if a man lie not in wait, but Elohim (God) deliver him into his hand; then I will appoint thee a place whither he shall flee* (Exodus 21:13), but *if a man come presumptuously upon his neighbour, to slay him with guile; thou shalt take him from mine altar, that he may die* (Exodus 21:14). So in Joshua the slayer is sheltered *because he smote his neighbour unwittingly, and hated him not beforetime* (20:5), guarded against the avenger whose *heart is hot* (Deuteronomy 19:6). And it is no blanket pardon: the manslayer must *stand at the entering of the gate... and declare his cause in the ears of the elders* (20:4), for *the congregation shall judge between the slayer and the revenger of blood according to these judgments* (Numbers 35:24) — and a true murderer who flees there *shall the elders of his city... fetch him thence, and deliver him into the hand of the avenger of blood, that he may die* (Deuteronomy 19:12). Mercy and justice held in one statute: the Torah cools the blood-feud and shelters the one *not worthy of death*.',
       sv.verse_id, ev.verse_id, 'free', 35475
  FROM _s344_jos20_lookup sv, _s344_jos20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-20-until-the-death-of-the-high-priest-then-the-slayer-shall-return',
       E'Until the Death of the High Priest — Then the Slayer Shall Return',
       E'The refugee''s release is fixed not to his own merit but to a death: *he shall dwell in that city, until he stand before the congregation for judgment, and until the death of the high priest that shall be in those days: then shall the slayer return, and come unto his own city, and unto his own house, unto the city from whence he fled* (Joshua 20:6). Moses had set the same clock: *and he shall abide in it unto the death of the high priest, which was anointed with the holy oil* (Numbers 35:25), for *after the death of the high priest the slayer shall return into the land of his possession* (Numbers 35:28). One death — the anointed priest''s — sets the sheltered one free to go home. It is a faint and striking type, read forward to the great High Priest. Hebrews names the refugees: *we might have a strong consolation, who have fled for refuge to lay hold upon the hope set before us* (Hebrews 6:18), and the very next breath calls Him *Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). His death is the release: *for this cause he is the mediator of the new testament, that by means of death... they which are called might receive the promise of eternal inheritance* (Hebrews 9:15). As the high priest''s death freed the manslayer to his own house, so *by means of death* the Formed Son — who is Yahuah and has a Father, no co-equal person — opens the way home to the eternal inheritance.',
       sv.verse_id, ev.verse_id, 'free', 35478
  FROM _s344_jos20_lookup sv, _s344_jos20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-20-a-refuge-from-the-avenger-yahuah-himself-the-refuge',
       E'A Refuge from the Avenger — Yahuah Himself the Refuge',
       E'The six cities are *your refuge from the avenger of blood* (Joshua 20:3), and inside the gate *they shall not deliver the slayer up into his hand* (20:5). The stone walls only picture a deeper refuge the Psalmist sings: *Elohim (God) is our refuge and strength, a very present help in trouble* (Psalm 46:1) — *the Elohim (God) of Jacob is our refuge* (Psalm 46:7,11). What the city is to the manslayer, Yahuah Himself is to His people. Read forward, the refuge swallows condemnation itself: *There is therefore now no condemnation to them which are in HaMashiach Yahusha (Christ Jesus), who walk not after the flesh, but after the Spirit* (Romans 8:1) — the pursuing avenger of death finds no opening against the one sheltered in Messiah. And the mercy is wide: Joshua closes, *These were the cities appointed for all the children of Yashar''el (Israel), and for the stranger that sojourneth among them* (20:9), exactly as Moses gave it — *a refuge, both for the children of Yashar''el (Israel), and for the stranger, and for the sojourner among them* (Numbers 35:15). The refuge of Yahuah covers the sojourner, not the native-born alone.',
       sv.verse_id, ev.verse_id, 'free', 35481
  FROM _s344_jos20_lookup sv, _s344_jos20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=20 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 35:11 — *cities of refuge... that the slayer may flee thither, which killeth any person at unawares*: Joshua does what was commanded by the hand of Moses.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 35:15 — *a refuge, both for the children of Yashar''el (Israel), and for the stranger, and for the sojourner*: Joshua 20:3 quotes the statute, mercy reaching the stranger.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 19:4 — *Whoso killeth his neighbour ignorantly, whom he hated not in time past*: the Torah distinguishes the accidental death from murder.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 21:13 — *Elohim (God) deliver him into his hand; then I will appoint thee a place whither he shall flee*: the seed of the whole refuge law.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Exodus 21:14 — *if a man come presumptuously... thou shalt take him from mine altar, that he may die*: no sanctuary for the murderer, only for the unwitting.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Deuteronomy 19:6 — *Lest the avenger of the blood pursue the slayer, while his heart is hot*: the refuge stands against the hot-hearted avenger of Joshua 20:5.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Numbers 35:24 — *the congregation shall judge between the slayer and the revenger of blood*: open due process at the gate (Joshua 20:4).'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=4
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Deuteronomy 19:12 — *the elders... shall fetch him thence, and deliver him into the hand of the avenger of blood, that he may die*: no shelter for the true murderer.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-the-cities-of-refuge-the-torahs-mercy-for-the-slayer-unawares'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 35:25 — *he shall abide in it unto the death of the high priest, which was anointed with the holy oil*: Joshua 20:6 is Moses exactly, the priest''s death the release.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-until-the-death-of-the-high-priest-then-the-slayer-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 35:28 — *after the death of the high priest the slayer shall return into the land of his possession*: one death sets the sheltered one free to go home.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-until-the-death-of-the-high-priest-then-the-slayer-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 6:18 — *who have fled for refuge to lay hold upon the hope set before us*: the type read forward; the next verse names the High Priest after Melek Tsadiq.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-until-the-death-of-the-high-priest-then-the-slayer-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 9:15 — *by means of death... they which are called might receive the promise of eternal inheritance*: the great High Priest''s death opens the way home.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-until-the-death-of-the-high-priest-then-the-slayer-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 46:1 — *Elohim (God) is our refuge and strength, a very present help in trouble*: the city walls picture Yahuah Himself the refuge.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-a-refuge-from-the-avenger-yahuah-himself-the-refuge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 8:1 — *no condemnation to them which are in HaMashiach Yahusha (Christ Jesus)*: the refuge that swallows condemnation, the avenger of death finds no opening.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-a-refuge-from-the-avenger-yahuah-himself-the-refuge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 35:15 — *a refuge... for the stranger, and for the sojourner among them*: Joshua 20:9 closes with the same wide mercy, covering the sojourner.'
  FROM cross_reference_threads t
  JOIN _s344_jos20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=20 AND sv.verse_number=9
  JOIN _s344_jos20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-20-a-refuge-from-the-avenger-yahuah-himself-the-refuge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_21.sql (Joshua 21) -----
-- Chapter: Joshua 21 — THE FORTY-EIGHT LEVITICAL CITIES, then THE GREAT SUMMARY (the rest given, not one good word failed)
-- Tag: jos21   View: _s344_jos21_lookup   Sort band: 35500, 35503, 35506, 35509
--
-- Joshua 21 coverage:
--   v.1-8  (the heads of the Levites come; cities to dwell in with suburbs; the lot out of EVERY tribe — Kohath,
--           Gershon, Merari; as Yahuah commanded by the hand of Moses)
--          NT:     none warranted at the verse (the scattered-priesthood weave is Tanakh-lateral)
--          Extras: none warranted
--          Tanakh: Numbers 35:1-8 (the original command — cities + suburbs for the Levites out of the possession of
--                  Israel, the few give few and the many give many), Genesis 49:7 (Levi divided in Jacob, scattered
--                  in Israel — the curse turned to ministry), Deuteronomy 18:1-2 (Levi hath no part nor inheritance,
--                  Yahuah is their inheritance) — Levi has no land-block but is planted among ALL the people
--   v.9-42 (the 48 cities named tribe by tribe, the cities of refuge — Hebron, Shechem, Golan, Kedesh, Bezer,
--           Ramoth — among them)
--          NT:     none warranted (city-list)
--          Extras: none warranted
--          Tanakh: Numbers 35:6 (among the cities six for refuge for the manslayer), Joshua 20:7-8 (the six cities
--                  of refuge appointed) — the cities of refuge are Levitical cities, mercy planted among the priests
--   v.43   (Yahuah gave Yashar'el ALL the land which he sware to give unto their fathers; they possessed it, dwelt)
--          NT:     none warranted at the verse (the rest/promise weave carried by v.44-45)
--          Extras: none warranted
--          Tanakh: Genesis 15:18 (the covenant: unto thy seed have I given this land), Deuteronomy 7:8 (he keep the
--                  oath sworn unto your fathers) — the Abrahamic land-oath FULFILLED
--   v.44   (Yahuah gave them REST round about, according to all he sware; no enemy stood)
--          NT:     Hebrews 4:8-9 (if Yahusha had given them rest... there remaineth therefore a rest to the people
--                  of Elohim) — Joshua's rest a shadow of the greater rest that yet remains
--          Extras: none warranted
--          Tanakh: Deuteronomy 7:1-2 (cast out many nations, deliver them before thee) — the rest as the gift of the
--                  One who fought for them
--   v.45   (THERE FAILED NOT OUGHT of any good thing which Yahuah had spoken; ALL CAME TO PASS)
--          NT:     2 Corinthians 1:20 (all the promises of Elohim in him are yea, and Amen) — the faithful word
--          Extras: none warranted
--          Tanakh: 1 Kings 8:56 (there hath not failed one word of all his good promise), Joshua 23:14 (not one thing
--                  hath failed of all the good things... all are come to pass) — the faithful word of Yahuah
--
-- Threads:
--   joshua-21-the-forty-eight-levitical-cities-levi-scattered-among-all-the-tribes  [Tanakh: Numbers, Genesis, Deuteronomy]  (free)
--   joshua-21-the-cities-of-refuge-among-the-levites                                [Tanakh: Numbers, Joshua]                (free)
--   joshua-21-the-rest-given-the-land-sworn-to-the-fathers-fulfilled                [Tanakh: Genesis, Deuteronomy | NT: Hebrews]  (free)
--   joshua-21-there-failed-not-one-good-word-all-came-to-pass                       [Tanakh: 1 Kings, Joshua | NT: 2 Corinthians] (free)
--
-- Framework notes: ★★ Levi has NO land-block — the curse of Genesis 49:7 (*I will divide them in Jacob, and scatter
-- them in Israel*) is turned to ministry: the priests planted in 48 cities through EVERY tribe so the people of
-- Yahuah dwell among His servants (Num 35:1-8; Deut 18:1-2 — *Yahuah is their inheritance*). The cities of refuge
-- (21:13,21,27,32,38) are Levitical cities — mercy housed among the priests (Num 35:6; Joshua 20). ★★★ THE GREAT
-- SUMMARY: the Abrahamic land-oath (Gen 15:18) FULFILLED (21:43), the REST GIVEN (21:44) read forward as a shadow of
-- the greater rest that yet remains (Heb 4:8-9 — Joshua's rest was not the final rest), and NOT ONE GOOD WORD FAILED
-- (21:45), the faithful word echoed at the temple (1 Kings 8:56) and in Joshua's own farewell (23:14), filled in the
-- Yea-and-Amen of all Yahuah's promises (2 Cor 1:20). The faithfulness is the Father's; the Formed Son who fought
-- for Israel (Deut 7) is Yahuah and has a Father — no co-equal-person grammar.

CREATE TEMP VIEW _s344_jos21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the 48 Levitical cities — Levi scattered among all the tribes (Numbers / Genesis / Deuteronomy)
    ('canon','joshua',21,2,'canon','numbers',35,2,'free',E'*Command the children of Yashar''el (Israel), that they give unto the Levites of the inheritance of their possession cities to dwell in; and ye shall give also unto the Levites suburbs for the cities round about them* (Numbers 35:2). The heads of the Levites come pleading the very word of Moses — *Yahuah (LORD) commanded by the hand of Moses to give us cities to dwell in, with the suburbs thereof for our cattle* (21:2). Joshua does not invent; he obeys the Torah''s own provision for the tribe with no land.'),
    ('canon','joshua',21,3,'canon','numbers',35,8,'free',E'*And the cities which ye shall give shall be of the possession of the children of Yashar''el (Israel): from them that have many ye shall give many; but from them that have few ye shall give few: every one shall give of his cities unto the Levites according to his inheritance which he inheriteth* (Numbers 35:8). So *the children of Yashar''el (Israel) gave unto the Levites out of their inheritance... these cities and their suburbs* (21:3) — every tribe gives of its own, the priests planted among the whole people, not gathered into one corner.'),
    ('canon','joshua',21,4,'canon','genesis',49,7,'free',E'*Cursed be their anger, for it was fierce; and their wrath, for it was cruel: I will divide them in Jacob, and scatter them in Yashar''el (Israel)* (Genesis 49:7). Jacob''s word over Levi was a scattering — and here the scattering is fulfilled, yet turned to ministry: *the children of Aaron... had by lot out of the tribe of Yahudah (Judah), and out of the tribe of Simeon, and out of the tribe of Benjamin, thirteen cities* (21:4), the lot reaching into tribe after tribe. The curse becomes the priesthood dwelling among all the people.'),
    ('canon','joshua',21,8,'canon','deuteronomy',18,2,'free',E'*Therefore shall they have no inheritance among their brethren: Yahuah (LORD) is their inheritance, as he hath said unto them* (Deuteronomy 18:2). The Levites receive cities but no land-block — *the children of Yashar''el (Israel) gave by lot unto the Levites these cities with their suburbs, as Yahuah (LORD) commanded by the hand of Moses* (21:8). Their portion is not a territory but Yahuah Himself; they live scattered so the people may dwell beside the servants of the Name.'),
    -- THREAD 2: the cities of refuge are among the Levitical cities (Numbers 35:6 / Joshua 20)
    ('canon','joshua',21,13,'canon','numbers',35,6,'free',E'*And among the cities which ye shall give unto the Levites there shall be six cities for refuge, which ye shall appoint for the manslayer, that he may flee thither: and to them ye shall add forty and two cities* (Numbers 35:6). Just as Moses said, the cities of refuge are Levitical cities: *they gave to the children of Aaron the priest Hebron with her suburbs, to be a city of refuge for the slayer* (21:13). The mercy for the slayer-unawares is housed among the priests — refuge and priesthood in one place.'),
    ('canon','joshua',21,21,'canon','joshua',20,7,'free',E'*And they appointed Kedesh in Galilee in mount Naphtali, and Shechem in mount Ephraim, and Kirjath-arba, which is Hebron, in the mountain of Yahudah (Judah)* (Joshua 20:7). The cities of refuge appointed the chapter before reappear here as Levitical cities — *Shechem with her suburbs in mount Ephraim, to be a city of refuge for the slayer* (21:21). The refuge-city and the priest-city are the same city; the Torah''s mercy and the Torah''s ministry stand together.'),
    ('canon','joshua',21,27,'canon','joshua',20,8,'free',E'*And on the other side Jordan by Jericho eastward, they assigned Bezer in the wilderness upon the plain out of the tribe of Reuben, and Ramoth in Gilead out of the tribe of Gad, and Golan in Bashan out of the tribe of Manasseh* (Joshua 20:8). The eastern cities of refuge are likewise given to the Levites — *Golan in Bashan with her suburbs, to be a city of refuge for the slayer* (21:27). The slayer flees to a city where the priests dwell; mercy and the service of Yahuah share one wall.'),
    -- THREAD 3: the rest given, the land sworn to the fathers fulfilled (Genesis 15 / Deuteronomy 7 / Hebrews 4)
    ('canon','joshua',21,43,'canon','genesis',15,18,'free',E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). The oath cut between the pieces is now made good: *Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein* (21:43). The land-promise to Abraham, carried by the seed, is FULFILLED — not a word of it forgotten across four hundred years.'),
    ('canon','joshua',21,43,'canon','deuteronomy',7,8,'free',E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand* (Deuteronomy 7:8). The possession of the land is the keeping of the oath sworn to the fathers — *all the land which he sware to give unto their fathers* (21:43). It rests on Yahuah''s love and faithfulness, *not because ye were more in number* (Deut 7:7), the covenant-mercy reaching from Abraham to the conquest.'),
    ('canon','joshua',21,44,'canon','deuteronomy',7,2,'free',E'*And when Yahuah Elohayka (the LORD thy God) shall deliver them before thee; thou shalt smite them, and utterly destroy them; thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2). The promise to deliver the nations is kept: *there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand* (21:44). The rest is not won by Israel''s sword but given by the One who fought for them, exactly as Moses foretold.'),
    ('canon','joshua',21,44,'canon','hebrews',4,8,'free',E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8). *Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers* (21:44) — yet that rest in the land was not the final rest; Hebrews reads it forward: *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). Joshua''s rest is a true gift and a shadow of the greater Sabbath-rest that yet remains for the people of Yahuah.'),
    ('canon','joshua',21,44,'canon','hebrews',4,9,'free',E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The rest given by Joshua — *Yahuah (LORD) gave them rest round about* (21:44) — pointed past itself: *if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Heb 4:8). The land-rest is the type; the keeping of the Sabbath-rest of Yahuah, entered by faith and not abolished, is the substance still to come.'),
    -- THREAD 4: there failed not one good word — all came to pass (1 Kings 8:56 / Joshua 23:14 / 2 Corinthians 1:20)
    ('canon','joshua',21,45,'canon','1-kings',8,56,'free',E'*Blessed be Yahuah (LORD), that hath given rest unto his people Yashar''el (Israel), according to all that he promised: there hath not failed one word of all his good promise, which he promised by the hand of Moses his servant* (1 Kings 8:56). Solomon at the temple sings the very word of Joshua: *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (21:45). From conquest to temple the testimony is one — Yahuah''s good word does not fall to the ground.'),
    ('canon','joshua',21,45,'canon','joshua',23,14,'free',E'*Ye know in all your hearts and in all your souls, that not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake concerning you; all are come to pass unto you, and not one thing hath failed thereof* (Joshua 23:14). Joshua''s own farewell repeats the summary of 21:45 — *There failed not ought of any good thing... all came to pass*. The covenant faithfulness is set as a witness twice over, so the house of Yashar''el cannot doubt the faithful word.'),
    ('canon','joshua',21,45,'canon','2-corinthians',1,20,'free',E'*For all the promises of Elohim (God) in him are yea, and in him Amen, unto the glory of Elohim (God) by us* (2 Corinthians 1:20). What Joshua witnessed in the land — *There failed not ought of any good thing which Yahuah (LORD) had spoken... all came to pass* (21:45) — is the standing character of Yahuah: every promise is *yea, and... Amen*. The faithfulness shown to the fathers is the same faithfulness gathered up in the Formed Son, who is Yahuah and has a Father.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-21-the-forty-eight-levitical-cities-levi-scattered-among-all-the-tribes',
       E'The Forty-Eight Levitical Cities — Levi Scattered Among All the Tribes',
       E'The tribe of Levi receives no land-block. Instead the heads of the Levites come pleading the word of Moses — *Yahuah (LORD) commanded by the hand of Moses to give us cities to dwell in, with the suburbs thereof for our cattle* (Joshua 21:2) — and Israel obeys: *the children of Yashar''el (Israel) gave unto the Levites out of their inheritance, at the commandment of Yahuah (LORD), these cities and their suburbs* (21:3), forty and eight in all (21:41). This is the Torah''s own provision: *Command the children of Yashar''el (Israel), that they give unto the Levites of the inheritance of their possession cities to dwell in* (Numbers 35:2), *from them that have many ye shall give many; but from them that have few ye shall give few... according to his inheritance* (Numbers 35:8). Every tribe gives of its own — Kohath out of Judah, Simeon, Benjamin, Ephraim, Dan, Manasseh; Gershon out of Issachar, Asher, Naphtali; Merari out of Reuben, Gad, Zebulun — so the priests dwell among the whole people, not gathered into one corner. And the scattering is no accident: Jacob had said over Levi, *I will divide them in Jacob, and scatter them in Yashar''el (Israel)* (Genesis 49:7) — a word of judgment now turned to ministry, the levitical anger of Shechem transfigured into a priesthood planted in every tribe. Their portion is not a territory: *Therefore shall they have no inheritance among their brethren: Yahuah (LORD) is their inheritance, as he hath said unto them* (Deuteronomy 18:2). Levi is scattered so that the people of Yahuah may dwell beside the servants of the Name, and so that the One whose inheritance the Levites are may be near to all.',
       sv.verse_id, ev.verse_id, 'free', 35500
  FROM _s344_jos21_lookup sv, _s344_jos21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=21 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-21-the-cities-of-refuge-among-the-levites',
       E'The Cities of Refuge Among the Levites',
       E'Six of the forty-eight Levitical cities are cities of refuge — mercy housed among the priests. Moses had joined the two: *And among the cities which ye shall give unto the Levites there shall be six cities for refuge, which ye shall appoint for the manslayer, that he may flee thither: and to them ye shall add forty and two cities* (Numbers 35:6). So in Joshua the refuge-city and the priest-city are one and the same: *they gave to the children of Aaron the priest Hebron with her suburbs, to be a city of refuge for the slayer* (21:13); *Shechem with her suburbs in mount Ephraim, to be a city of refuge for the slayer* (21:21); *Golan in Bashan with her suburbs, to be a city of refuge for the slayer* (21:27) — and Kedesh, Bezer, and Ramoth likewise (21:32,36,38). These are the very cities Joshua had appointed the chapter before: *Kedesh in Galilee in mount Naphtali, and Shechem in mount Ephraim, and Kirjath-arba, which is Hebron* (Joshua 20:7), and across Jordan *Bezer... and Ramoth in Gilead... and Golan in Bashan* (Joshua 20:8). The slayer-unawares flees to a city where the priests dwell; the Torah''s mercy for the innocent-of-intent and the Torah''s ministry of the Name share one wall. The curse is never the Torah — here the Torah shelters the slayer and houses the priesthood in the very same gates.',
       sv.verse_id, ev.verse_id, 'free', 35503
  FROM _s344_jos21_lookup sv, _s344_jos21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=21 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-21-the-rest-given-the-land-sworn-to-the-fathers-fulfilled',
       E'The Rest Given — the Land Sworn to the Fathers Fulfilled',
       E'The great summary of the conquest: *And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein. And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand* (Joshua 21:43-44). This is the Abrahamic land-oath made good — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18) — the promise carried by the seed across four hundred years and not one word of it forgotten. It rests on Yahuah''s love and faithfulness, not Israel''s strength: *because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand* (Deuteronomy 7:8), and it was He who *deliver them before thee* (Deuteronomy 7:2), so that *there stood not a man of all their enemies before them*. Yet the rest in the land was not the final rest. Hebrews reads it forward: *For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8) — *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). Joshua''s rest is a true gift and a shadow: the land-Sabbath is the type, and the keeping of the greater Sabbath-rest of Yahuah, entered by faith and never abolished, is the substance that yet remains.',
       sv.verse_id, ev.verse_id, 'free', 35506
  FROM _s344_jos21_lookup sv, _s344_jos21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=43
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=21 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-21-there-failed-not-one-good-word-all-came-to-pass',
       E'There Failed Not One Good Word — All Came to Pass',
       E'The chapter ends on the faithfulness of Yahuah itself: *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45). This becomes the standing testimony of the whole canon. Solomon sings it word for word at the dedication of the temple: *Blessed be Yahuah (LORD), that hath given rest unto his people Yashar''el (Israel), according to all that he promised: there hath not failed one word of all his good promise, which he promised by the hand of Moses his servant* (1 Kings 8:56). Joshua himself sets it as a double witness in his farewell: *not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake concerning you; all are come to pass unto you, and not one thing hath failed thereof* (Joshua 23:14). From conquest to temple to farewell, the word of Yahuah does not fall to the ground. And this is no past-tense faithfulness only; it is the very character of Yahuah, gathered up in the Formed Son: *For all the promises of Elohim (God) in him are yea, and in him Amen, unto the glory of Elohim (God) by us* (2 Corinthians 1:20). The same faithfulness that gave the land to the fathers is the Yea-and-Amen of every promise — the Son who is Yahuah and has a Father, the seal upon the good word that cannot fail.',
       sv.verse_id, ev.verse_id, 'free', 35509
  FROM _s344_jos21_lookup sv, _s344_jos21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=45
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=21 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 35:2 — *give unto the Levites... cities to dwell in; and... suburbs for the cities round about them*: the heads of the Levites plead the very word of Moses (Joshua 21:2).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=2
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-forty-eight-levitical-cities-levi-scattered-among-all-the-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 35:8 — *from them that have many ye shall give many; but from them that have few ye shall give few*: every tribe gives of its own, the priests planted among the whole people (Joshua 21:3).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=3
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-forty-eight-levitical-cities-levi-scattered-among-all-the-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 49:7 — *I will divide them in Jacob, and scatter them in Yashar''el (Israel)*: Jacob''s word over Levi fulfilled here, the curse turned to ministry (Joshua 21:4).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=4
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-forty-eight-levitical-cities-levi-scattered-among-all-the-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 18:2 — *Yahuah (LORD) is their inheritance, as he hath said unto them*: Levi receives cities but no land-block; their portion is Yahuah Himself (Joshua 21:8).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=8
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-forty-eight-levitical-cities-levi-scattered-among-all-the-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 35:6 — *among the cities... six cities for refuge... for the manslayer*: the cities of refuge are Levitical cities, mercy housed among the priests (Joshua 21:13).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-cities-of-refuge-among-the-levites'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 20:7 — *Kedesh... Shechem... Kirjath-arba, which is Hebron*: the refuge-cities appointed the chapter before are the same priest-cities (Joshua 21:21).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=21
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-cities-of-refuge-among-the-levites'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Joshua 20:8 — *Bezer... and Ramoth in Gilead... and Golan in Bashan*: the eastern refuge-cities likewise given to the Levites (Joshua 21:27).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=27
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-cities-of-refuge-among-the-levites'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 15:18 — *Unto thy seed have I given this land*: the Abrahamic land-oath fulfilled, the promise carried by the seed (Joshua 21:43).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=43
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-rest-given-the-land-sworn-to-the-fathers-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 7:8 — *he would keep the oath which he had sworn unto your fathers*: the possession rests on Yahuah''s love and faithfulness (Joshua 21:43).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=43
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-rest-given-the-land-sworn-to-the-fathers-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 7:2 — *Yahuah Elohayka shall deliver them before thee*: the rest is given by the One who fought for them, not won by Israel''s sword (Joshua 21:44).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=44
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-rest-given-the-land-sworn-to-the-fathers-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 4:8 — *if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day*: Joshua''s rest was not the final rest (Joshua 21:44).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=44
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-rest-given-the-land-sworn-to-the-fathers-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God)*: the land-rest a shadow of the greater Sabbath-rest that yet remains (Joshua 21:44).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=44
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-the-rest-given-the-land-sworn-to-the-fathers-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 8:56 — *there hath not failed one word of all his good promise, which he promised by the hand of Moses*: Solomon at the temple sings the word of Joshua 21:45.'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=45
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-there-failed-not-one-good-word-all-came-to-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 23:14 — *not one thing hath failed of all the good things... all are come to pass*: Joshua''s farewell repeats the summary as a double witness (Joshua 21:45).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=45
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-there-failed-not-one-good-word-all-came-to-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Corinthians 1:20 — *all the promises of Elohim (God) in him are yea, and in him Amen*: the faithfulness shown to the fathers gathered up in the Formed Son (Joshua 21:45).'
  FROM cross_reference_threads t
  JOIN _s344_jos21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=21 AND sv.verse_number=45
  JOIN _s344_jos21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-21-there-failed-not-one-good-word-all-came-to-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_22.sql (Joshua 22) -----
-- Chapter: Joshua 22 — THE EASTERN TRIBES SENT HOME; THE ALTAR OF WITNESS (ED) & THE NEAR-WAR AVERTED
-- Tag: jos22   View: _s344_jos22_lookup   Sort band: 35525, 35528, 35531, 35534
--
-- Joshua 22 coverage:
--   v.1-6  (Reuben, Gad, half-Manasseh sent home with a blessing; v.5 the Torah-love charge —
--          love Yahuah, walk in all his ways, keep his commandments, cleave unto him, serve with
--          all your heart and soul)
--          NT:     none warranted at the verse (the love-command weave is Tanakh-lateral here;
--                  the Shema-greatest-command is treated more directly at Deut 6)
--          Extras: none warranted
--          Tanakh: Deuteronomy 6:5 (love Yahuah with all thine heart/soul/might), Deuteronomy 10:12
--                  (fear/walk/love/serve with all heart and soul), Deuteronomy 11:13 (love & serve
--                  with all your heart and soul), Deuteronomy 13:4 (walk after, fear, keep
--                  commandments, obey, serve, cleave) — Joshua hands the departing tribes the very
--                  Torah-love charge of Moses
--   v.10-20 (the great altar by Jordan; the congregation gathers to WAR, fearing rival/apostate
--          worship against the ONE place Yahuah chose; Peor and Achan remembered)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 12:5,13-14 (the ONE place Yahuah shall choose; offer not burnt
--                  offerings in every place), Leviticus 17:8-9 (offer only at the door of the
--                  tabernacle, else cut off), Numbers 25:3-4 (Baal-peor, the plague, Yahuah's
--                  anger), Joshua 7:1 (Achan's trespass, wrath on all the congregation) — zeal for
--                  the one altar against apostasy
--   v.21-34 (the eastern tribes answer: the altar is NOT for sacrifice but a WITNESS — ED — that
--          they share in Yahuah; Phinehas & the princes INQUIRE first; the war averted; "he knoweth")
--          NT:     Matthew 18:15-16 (go and tell him his fault... in the mouth of two or three
--                  witnesses — the pattern of inquiry before judgment), Romans 14:4,13 (who art
--                  thou that judgest another?... judge this rather, put no stumblingblock — not
--                  judging a brother rashly)
--          Extras: none warranted
--          Tanakh: Joshua 24:27 (the great stone a witness — "it hath heard all the words") — the
--                  same memorial-witness pattern; the unity of the tribes preserved
--
-- Threads:
--   joshua-22-take-diligent-heed-to-love-yahuah-the-torah-charge-to-the-departing-tribes  [Tanakh: Deuteronomy] (free)
--   joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy        [Tanakh: Deuteronomy, Leviticus, Numbers, Joshua] (free)
--   joshua-22-the-altar-of-witness-ed-the-war-averted-by-inquiry-not-assumption           [Tanakh: Joshua | NT: Matthew, Romans] (free)
--
-- Framework notes: ★ Joshua sends the EASTERN tribes (Reuben/Gad/half-Manasseh) home with the
-- Torah-LOVE charge of Moses (22:5 = Deut 6:5/10:12/11:13/13:4) — the covenant inheritance, never
-- the curse; love and obedience held together, *cleave unto him*. ★ The near-civil-war turns on the
-- ONE place Yahuah chose (Deut 12) and the one altar (Lev 17:8-9): the western tribes rightly fear
-- rival/apostate worship, remembering Peor (Num 25) and Achan (Josh 7) — zeal FOR holiness, not
-- ethnic hatred. ★★ But the altar is *ED* — a WITNESS, *not for burnt offering, nor for sacrifice;
-- but it is a witness between us and you* (22:26-28) — built to TESTIFY that the eastern tribes have
-- part in Yahuah, lest their children be told *ye have no part in Yahuah* (22:25,27). The unity of
-- the tribes preserved. ★ The war is averted because Phinehas and the princes GO AND ASK rather than
-- assume the worst — the very pattern of *go and tell him his fault between thee and him alone*
-- (Matt 18:15) and *who art thou that judgest another?* (Rom 14:4) — inquiry before judgment, not
-- judging a brother rashly. *Yahuah Elohim of gods... HE KNOWETH* (22:22). No verse left without an
-- add except the narrative-detail verses (v.7-9 logistics of return, v.30-33 the resolution
-- narrative) whose load is carried within the threads' anchor spans.

CREATE TEMP VIEW _s344_jos22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Torah-love charge to the departing tribes (Deuteronomy)
    ('canon','joshua',22,5,'canon','deuteronomy',6,5,'free',E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). Joshua hands the eastern tribes the heart of the Shema as their parting charge — *to love Yahuah Elohaychem (the LORD your God), and to walk in all his ways, and to keep his commandments, and to cleave unto him, and to serve him with all your heart and with all your soul* (22:5). The same all-the-heart love Moses commanded follows the tribes home across Jordan; the Torah is the covenant inheritance carried with them, never left behind.'),
    ('canon','joshua',22,5,'canon','deuteronomy',10,12,'free',E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul* (Deuteronomy 10:12). Joshua''s charge is Moses'' charge nearly word for word — *to walk in all his ways... and to serve him with all your heart and with all your soul* (22:5). Fear, walk, love, serve, cleave: one undivided covenant-love, the whole duty of the people Yahuah is sending home.'),
    ('canon','joshua',22,5,'canon','deuteronomy',11,13,'free',E'*And it shall come to pass, if ye shall hearken diligently unto my commandments which I command you this day, to love Yahuah Elohaychem (the LORD your God), and to serve him with all your heart and with all your soul* (Deuteronomy 11:13). The very pairing of Joshua 22:5 — *take diligent heed to do the commandment and the law... to love Yahuah... and to serve him with all your heart and with all your soul* — Moses joined love and obedience and whole-hearted service into one charge, and Joshua lays that same yoke of love on Reuben, Gad, and half-Manasseh.'),
    ('canon','joshua',22,5,'canon','deuteronomy',13,4,'free',E'*Ye shall walk after Yahuah Elohaychem (the LORD your God), and fear him, and keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4). Joshua''s closing word — *and to cleave unto him* (22:5) — echoes Moses'' charge to *cleave unto him*. The very chapter where the tribes will be tested over a suspected altar opens by binding them to cling to Yahuah alone; the cleaving Moses commanded is exactly what the eastern tribes will prove they have kept.'),
    -- THREAD 2: the zeal for the ONE altar; the congregation gathers against apostasy (Deuteronomy / Leviticus / Numbers / Joshua)
    ('canon','joshua',22,19,'canon','deuteronomy',12,5,'free',E'*But unto the place which Yahuah Elohaychem (the LORD your God) shall choose out of all your tribes to put his name there, even unto his habitation shall ye seek, and thither thou shalt come* (Deuteronomy 12:5). The whole alarm of Joshua 22 rests on this command: there is ONE place, ONE altar. So the western tribes cry, *rebel not against Yahuah (LORD)... in building you an altar beside the altar of Yahuah Eloheinu (the LORD our God)* (22:19). Their zeal is for the place Yahuah chose to put His name — a rival altar would be apostasy.'),
    ('canon','joshua',22,16,'canon','deuteronomy',12,13,'free',E'*Take heed to thyself that thou offer not thy burnt offerings in every place that thou seest: But in the place which Yahuah (LORD) shall choose in one of thy tribes, there thou shalt offer thy burnt offerings* (Deuteronomy 12:13-14). This is the law the congregation believes has been broken: *ye have builded you an altar, that ye might rebel this day against Yahuah (LORD)* (22:16). To raise a second altar for sacrifice would be to *offer thy burnt offerings in every place* — the very thing Moses forbade. Their accusation is grounded in Torah, even before the truth is known.'),
    ('canon','joshua',22,16,'canon','leviticus',17,8,'free',E'*Whatsoever man there be of the house of Yashar''el (Israel), or of the strangers which sojourn among you, that offereth a burnt offering or sacrifice, And bringeth it not unto the door of the tabernacle of the congregation, to offer it unto Yahuah (LORD); even that man shall be cut off from among his people* (Leviticus 17:8-9). The one-altar law carries the penalty of being CUT OFF. So when the eastern tribes seem to have built an altar of their own, the congregation reads it as a soul-imperiling rebellion — *what trespass is this... to turn away this day from following Yahuah (LORD)* (22:16). The stakes are the very life of the people.'),
    ('canon','joshua',22,17,'canon','numbers',25,3,'free',E'*And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* (Numbers 25:3). The congregation names Peor by name: *Is the iniquity of Peor too little for us, from which we are not cleansed until this day, although there was a plague in the congregation of Yahuah (LORD)* (22:17). They remember how apostasy brought wrath on the whole people — and it was Phinehas himself who turned that wrath away (Num 25:7-8,11). Now that same Phinehas leads the inquiry; the memory of Peor is why they fear and why they ask.'),
    ('canon','joshua',22,18,'canon','numbers',25,4,'free',E'*And Yahuah (LORD) said unto Moses, Take all the heads of the people, and hang them up before Yahuah (LORD) against the sun, that the fierce anger of Yahuah (LORD) may be turned away from Yashar''el (Israel)* (Numbers 25:4). The dread of corporate judgment drives the warning: *seeing ye rebel to day against Yahuah (LORD), that to morrow he will be wroth with the whole congregation of Yashar''el (Israel)* (22:18). One tribe''s sin can kindle Yahuah''s anger against all — the lesson of Peor burned into the congregation''s memory.'),
    ('canon','joshua',22,20,'canon','joshua',7,1,'free',E'*But the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan, the son of Carmi... took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel)* (Joshua 7:1). The congregation names Achan too: *Did not Achan the son of Zerah commit a trespass in the accursed thing, and wrath fell on all the congregation of Yashar''el (Israel)? and that man perished not alone in his iniquity* (22:20). One man''s sin felled all Yashar''el before Ai — the zeal against the altar is zeal lest the whole people perish again for the trespass of a few.'),
    -- THREAD 3: the altar of WITNESS (ED) & the war averted by inquiry (Joshua / Matthew / Romans)
    ('canon','joshua',22,27,'canon','joshua',24,27,'free',E'*And Joshua said unto all the people, Behold, this stone shall be a witness unto us; for it hath heard all the words of Yahuah (LORD) which he spake unto us: it shall be therefore a witness unto you, lest ye deny your Elohim (God)* (Joshua 24:27). The eastern tribes build their altar for the same purpose: *that it may be a witness between us, and you, and our generations after us... that your children may not say to our children in time to come, Ye have no part in Yahuah (LORD)* (22:27). Two memorials, one purpose — a standing witness that binds the generations to Yahuah and to one another, lest the covenant-bond be denied.'),
    ('canon','joshua',22,16,'canon','matthew',18,15,'free',E'*Moreover if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother* (Matthew 18:15). The whole tragedy is averted because the congregation, though it first *gathered themselves together... to go up to war* (22:12), does not strike — it sends Phinehas and the princes to ASK: *What trespass is this...?* (22:16). They go and tell the fault to their brethren''s face, and gain their brethren back. This is the very pattern Messiah commands — inquiry before judgment, the brother confronted, not condemned unheard.'),
    ('canon','joshua',22,14,'canon','matthew',18,16,'free',E'*But if he will not hear thee, then take with thee one or two more, that in the mouth of two or three witnesses every word may be established* (Matthew 18:16). The congregation does not send one hot-headed accuser but *Phinehas the son of Eleazar the priest, And with him ten princes, of each chief house a prince throughout all the tribes of Yashar''el (Israel)* (22:13-14) — a sober embassy of many witnesses to establish the truth. The Torah''s witness-rule and Messiah''s pattern alike: weigh every word in the mouth of many before judging a brother.'),
    ('canon','joshua',22,22,'canon','romans',14,4,'free',E'*Who art thou that judgest another man''s servant? to his own master he standeth or falleth. Yea, he shall be holden up: for Elohim (God) is able to make him stand* (Romans 14:4). The eastern tribes appeal past their accusers to the One who truly knows: *Yahuah Elohim (The LORD God) of gods, Yahuah Elohim (the LORD God) of gods, he knoweth, and Yashar''el (Israel) he shall know; if it be in rebellion, or if in transgression against Yahuah (LORD)* (22:22). To rashly judge a brother is to usurp the place of the Master who alone reads the heart — *HE KNOWETH*.'),
    ('canon','joshua',22,26,'canon','romans',14,13,'free',E'*Let us not therefore judge one another any more: but judge this rather, that no man put a stumblingblock or an occasion to fall in his brother''s way* (Romans 14:13). The altar was raised for the opposite of a stumblingblock — *not for burnt offering, nor for sacrifice* (22:26), but to keep the eastern children from ever being made to *cease from fearing Yahuah (LORD)* (22:25). What looked like rebellion was love guarding the bond; and the western tribes, by asking rather than assuming, refuse to make their brethren a stumblingblock. Both houses choose the way that *make[s] for peace* (Rom 14:19).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-22-take-diligent-heed-to-love-yahuah-the-torah-charge-to-the-departing-tribes',
       E'Take Diligent Heed to Love Yahuah — the Torah-Charge to the Departing Tribes',
       E'When the long war is ended and the eastern tribes are sent home, Joshua does not loose them from the covenant — he binds them to its heart: *But take diligent heed to do the commandment and the law, which Moses the servant of Yahuah (LORD) charged you, to love Yahuah Elohaychem (the LORD your God), and to walk in all his ways, and to keep his commandments, and to cleave unto him, and to serve him with all your heart and with all your soul* (Joshua 22:5). This is the Shema itself sent across Jordan: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). It is the whole duty Moses named: *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul* (Deuteronomy 10:12); *to love Yahuah Elohaychem (the LORD your God), and to serve him with all your heart and with all your soul* (Deuteronomy 11:13). And it ends where Moses ended — *Ye shall walk after Yahuah Elohaychem (the LORD your God), and fear him, and keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4): the same *cleave unto him* Joshua sets last in his charge. Love and obedience are never split apart — the Torah is the covenant inheritance carried home, never the curse left behind. The very tribes who will, in this same chapter, be suspected of rebellion go home charged to cleave to Yahuah alone — and they will prove they have kept exactly this.',
       sv.verse_id, ev.verse_id, 'free', 35525
  FROM _s344_jos22_lookup sv, _s344_jos22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=22 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy',
       E'The Zeal for the One Altar — the Congregation Gathers Against Apostasy',
       E'When word comes that the eastern tribes *built there an altar by Jordan, a great altar to see to* (Joshua 22:10), *the whole congregation of the children of Yashar''el (Israel) gathered themselves together at Shiloh, to go up to war against them* (22:12). The alarm is no overreaction in their eyes — it is zeal for the one altar and the one place Yahuah chose. Moses had commanded: *unto the place which Yahuah Elohaychem (the LORD your God) shall choose out of all your tribes to put his name there... thither thou shalt come* (Deuteronomy 12:5), and *Take heed to thyself that thou offer not thy burnt offerings in every place that thou seest: But in the place which Yahuah (LORD) shall choose... there thou shalt offer thy burnt offerings* (Deuteronomy 12:13-14). The penalty for a rival altar was to be cut off: *that offereth a burnt offering or sacrifice, And bringeth it not unto the door of the tabernacle of the congregation... even that man shall be cut off from among his people* (Leviticus 17:8-9). So they cry, *rebel not against Yahuah (LORD)... in building you an altar beside the altar of Yahuah Eloheinu (the LORD our God)* (22:19). And their fear is fed by memory — *Is the iniquity of Peor too little for us...* (22:17): *Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* (Numbers 25:3), so that Yahuah said, *Take all the heads of the people, and hang them up... that the fierce anger of Yahuah (LORD) may be turned away* (Numbers 25:4). And Achan: *Did not Achan the son of Zerah commit a trespass in the accursed thing, and wrath fell on all the congregation* (22:20) — *the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel)* (Joshua 7:1), and one man''s sin felled all the host before Ai. *To morrow he will be wroth with the whole congregation* (22:18): one tribe''s apostasy can kindle wrath on all. The zeal is FOR holiness, FOR the one altar — never ethnic hatred, but dread of the trespass that perishes more than the one.',
       sv.verse_id, ev.verse_id, 'free', 35528
  FROM _s344_jos22_lookup sv, _s344_jos22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=22 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-22-the-altar-of-witness-ed-the-war-averted-by-inquiry-not-assumption',
       E'The Altar of Witness — ED — the War Averted by Inquiry, Not Assumption',
       E'The near-civil-war is undone not by the sword but by a question. Though the congregation had gathered *to go up to war* (22:12), it first sends *Phinehas the son of Eleazar the priest, And with him ten princes, of each chief house a prince throughout all the tribes of Yashar''el (Israel)* (22:13-14) — a sober embassy of many witnesses — to ASK: *What trespass is this that ye have committed...?* (22:16). And the answer reveals the truth: the altar was never for sacrifice. *Yahuah Elohim (The LORD God) of gods, Yahuah Elohim (the LORD God) of gods, he knoweth, and Yashar''el (Israel) he shall know; if it be in rebellion, or if in transgression against Yahuah (LORD), (save us not this day,)* (22:22). They built it *not for burnt offering, nor for sacrifice* (22:26) — *But that it may be a witness between us, and you, and our generations after us... that your children may not say to our children in time to come, Ye have no part in Yahuah (LORD)* (22:27). It is *ED* — a witness — raised so that the unity of the tribes, severed by Jordan, would never be denied: *that Yahuah (LORD) is Elohim (God)* (22:34). It is the same memorial Joshua himself will raise: *Behold, this stone shall be a witness unto us; for it hath heard all the words of Yahuah (LORD)... lest ye deny your Elohim (God)* (Joshua 24:27). The whole disaster is averted because the brethren go and ask — the very pattern Messiah commands: *if thy brother shall trespass against thee, go and tell him his fault between thee and him alone: if he shall hear thee, thou hast gained thy brother* (Matthew 18:15), with *one or two more, that in the mouth of two or three witnesses every word may be established* (Matthew 18:16). And it rebukes the rash judging Paul forbids: *Who art thou that judgest another man''s servant? to his own master he standeth or falleth... Elohim (God) is able to make him stand* (Romans 14:4); *Let us not therefore judge one another any more: but judge this rather, that no man put a stumblingblock... in his brother''s way* (Romans 14:13). The eastern tribes were guarding the bond, not breaking it; the western tribes, by asking rather than assuming the worst, choose *the things which make for peace* (Romans 14:19). HE KNOWETH — and the people, having inquired, blessed Elohim and did not go up to battle.',
       sv.verse_id, ev.verse_id, 'free', 35531
  FROM _s344_jos22_lookup sv, _s344_jos22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=22 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 6:5 — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might*: the Shema sent home with the eastern tribes (Joshua 22:5).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=5
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-take-diligent-heed-to-love-yahuah-the-torah-charge-to-the-departing-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 10:12 — *to walk in all his ways, and to love him, and to serve Yahuah Elohayka with all thy heart and with all thy soul*: Joshua''s charge nearly word for word.'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=5
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-take-diligent-heed-to-love-yahuah-the-torah-charge-to-the-departing-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 11:13 — *to love Yahuah Elohaychem, and to serve him with all your heart and with all your soul*: love and whole-hearted service joined as one, as in Joshua 22:5.'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=5
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-take-diligent-heed-to-love-yahuah-the-torah-charge-to-the-departing-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 13:4 — *keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him*: Joshua''s closing *cleave unto him* echoes Moses exactly.'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=5
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-take-diligent-heed-to-love-yahuah-the-torah-charge-to-the-departing-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 12:5 — *the place which Yahuah Elohaychem shall choose... to put his name there*: the ONE place behind the whole alarm (Joshua 22:19).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=19
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 12:13 — *offer not thy burnt offerings in every place... But in the place which Yahuah shall choose*: the law the congregation believes is broken (Joshua 22:16).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 17:8 — *bringeth it not unto the door of the tabernacle... even that man shall be cut off*: a rival altar carries the penalty of being cut off (Joshua 22:16).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 25:3 — *Yashar''el joined himself unto Baal-peor: and the anger of Yahuah was kindled*: the Peor the congregation names (Joshua 22:17).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=17
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Numbers 25:4 — *Take all the heads of the people, and hang them up... that the fierce anger of Yahuah may be turned away*: the corporate judgment Joshua 22:18 dreads.'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Joshua 7:1 — *Achan... took of the accursed thing: and the anger of Yahuah was kindled against the children of Yashar''el*: one man''s sin felled all, as the congregation recalls (Joshua 22:20).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=20
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-zeal-for-the-one-altar-the-congregation-gathers-against-apostasy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 24:27 — *this stone shall be a witness unto us; for it hath heard all the words of Yahuah... lest ye deny your Elohim*: the same memorial-witness purpose as the altar ED (Joshua 22:27).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=27
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-altar-of-witness-ed-the-war-averted-by-inquiry-not-assumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Matthew 18:15 — *go and tell him his fault between thee and him alone... thou hast gained thy brother*: the pattern of inquiry the congregation follows instead of striking (Joshua 22:16).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=16
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-altar-of-witness-ed-the-war-averted-by-inquiry-not-assumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Matthew 18:16 — *in the mouth of two or three witnesses every word may be established*: Phinehas and ten princes, a sober embassy of many witnesses (Joshua 22:14).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=14
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-altar-of-witness-ed-the-war-averted-by-inquiry-not-assumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 14:4 — *Who art thou that judgest another man''s servant?... Elohim is able to make him stand*: to rashly judge usurps the Master who alone knows — *HE KNOWETH* (Joshua 22:22).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=22
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-altar-of-witness-ed-the-war-averted-by-inquiry-not-assumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Romans 14:13 — *judge this rather, that no man put a stumblingblock... in his brother''s way*: the altar raised to keep the children from stumbling, not to divide (Joshua 22:26).'
  FROM cross_reference_threads t
  JOIN _s344_jos22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=22 AND sv.verse_number=26
  JOIN _s344_jos22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-22-the-altar-of-witness-ed-the-war-averted-by-inquiry-not-assumption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_23.sql (Joshua 23) -----
-- Book: Joshua  Chapter: 23   Tag: jos23   View: _s344_jos23_lookup
-- Sort band: 35550, 35553, 35556, 35559
--
-- Joshua's FIRST farewell — old, he gathers Yashar'el and charges them to keep the
-- whole Torah, cleave to Yahuah, not mix with the nations' gods, lest they perish from
-- the land. The blessing-and-curse of Deut 28 / Lev 26 set as the standing covenant
-- warning that foretells the very exile of 2 Kings 17.
--
-- Joshua 23 coverage:
--   v.3/10 (Yahuah fought / one chases a thousand)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Joshua 21:43-45 (rest given, not a man stood); Joshua 1:5 (none shall stand before thee) — THREAD 4
--   v.6 (be very courageous to keep and do all the Torah, turn not aside)
--        NT:     none warranted (charge is Torah-internal)
--        Extras: none warranted
--        Tanakh: Joshua 1:7 + 1:8 (the same charge to Joshua himself); Deut 28:14 (turn not aside to right/left) — THREAD 1
--   v.7-8,12 (cleave to Yahuah, make no mention of their gods, make no marriages)
--        NT:     2 Corinthians 6:14, 6:17, 6:18 (unequally yoked / come out and be separate) — THREAD 2
--        Extras: none warranted
--        Tanakh: Deut 7:2, 7:3, 7:4 (no covenant/no marriages); Exodus 23:32, 23:33 (no covenant, snare); Deut 13:4 (cleave unto him) — THREAD 2
--   v.14-16 (all good things came; so all evil things, ye shall perish from the land when ye transgress)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Lev 26:14, 26:15, 26:33 (curse for covenant-breaking, scattered); Deut 28:15, 28:63, 28:64 (curses, plucked off / scattered); Deut 7:9 (faithful Elohim keeps covenant w/ them that love+keep); 2 Kings 17:23 (the exile fulfilled) — THREAD 3
--   v.14 (not one thing hath failed of all the good things)
--        Tanakh: Joshua 21:45 (there failed not ought of any good thing) — THREAD 4
--
-- Threads (slug + target libraries):
--   joshua-23-be-very-courageous-to-keep-and-do-all-the-torah-turn-not-aside  [canon Tanakh]  free
--   joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods  [canon Tanakh + NT]  free
--   joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant  [canon Tanakh]  free
--   joshua-23-not-one-thing-hath-failed-yahuah-hath-fought-for-you  [canon Tanakh]  free
--
-- Framework-load-bearing framing:
--   23:6 the courage-charge is to KEEP and DO all the Torah and turn not aside — the IDENTICAL
--     charge laid on Joshua himself at 1:7-8; Torah is the covenant inheritance, affirmed, never the curse.
--   23:15-16 the "all evil things / perish from the land" is the Deut 28 / Lev 26 covenant-curse =
--     the CONSEQUENCE of covenant-breaking (turning to mix and serve other gods), NEVER the Torah
--     itself. It foretells the exile of 2 Kings 17 (the northern house carried to Assyria).
--   23:12 marriages with the remnant nations = the un-equal-yoke; 2 Cor 6 "come out and be separate"
--     is the SAME separation-unto-Yahuah, not a new people — the holy people kept distinct from the
--     nations' gods (Deut 7 / Exod 23).

CREATE TEMP VIEW _s344_jos23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: 23:6 keep and do all the Torah, turn not aside (the 1:7 charge)
    ('canon','joshua',23,6,'canon','joshua',1,7,'free',E'*Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest* (Joshua 1:7). At the start of the conquest Yahuah laid this very charge on Joshua himself; now, old, Joshua hands the IDENTICAL charge to all Yashar''el — *be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses, that ye turn not aside therefrom to the right hand or to the left* (Joshua 23:6). The Torah is the covenant inheritance, kept and done, never set aside.'),
    ('canon','joshua',23,6,'canon','joshua',1,8,'free',E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8). The book of the Torah is to be kept *day and night* — the very book Joshua now commands the nation to *keep and to do* (Joshua 23:6); to do all that is written is the way of life, not a yoke to be broken.'),
    ('canon','joshua',23,6,'canon','deuteronomy',28,14,'free',E'*And thou shalt not go aside from any of the words which I command thee this day, to the right hand, or to the left, to go after other gods to serve them* (Deuteronomy 28:14). Moses framed turning aside *to the right hand or to the left* as the road to other gods; Joshua repeats the exact bound — *that ye turn not aside therefrom to the right hand or to the left* (Joshua 23:6) — the single straight path of the Torah.'),
    -- THREAD 2: 23:7-8,12 cleave to Yahuah, mix not with the nations and their gods
    ('canon','joshua',23,8,'canon','deuteronomy',13,4,'free',E'*Ye shall walk after Yahuah Elohaychem (the LORD your God), and fear him, and keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4). Moses bound cleaving to Yahuah to keeping his commandments; Joshua charges the same — *But cleave unto Yahuah Elohaychem (the LORD your God), as ye have done unto this day* (Joshua 23:8) — to cleave is to keep, and to keep is to cleave.'),
    ('canon','joshua',23,7,'canon','deuteronomy',7,2,'free',E'*And when Yahuah Elohayka (the LORD thy God) shall deliver them before thee; thou shalt smite them, and utterly destroy them; thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2). The standing command was no covenant with the nations of the land; Joshua holds the people to it — *That ye come not among these nations... neither make mention of the name of their gods... neither serve them, nor bow yourselves unto them* (Joshua 23:7).'),
    ('canon','joshua',23,12,'canon','deuteronomy',7,3,'free',E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3). Joshua names the precise danger Moses forbade — *and shall make marriages with them, and go in unto them, and they to you* (Joshua 23:12) — the un-equal yoke that drags the holy people back among the nations.'),
    ('canon','joshua',23,12,'canon','deuteronomy',7,4,'free',E'*For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly* (Deuteronomy 7:4). Moses gave the reason behind the ban on marriages — they turn the heart to other gods; Joshua warns the same outcome if they *go back, and cleave unto the remnant of these nations* (Joshua 23:12).'),
    ('canon','joshua',23,7,'canon','exodus',23,32,'free',E'*Thou shalt make no covenant with them, nor with their gods* (Exodus 23:32). From Sinai onward the line was drawn — no league with the nations or their gods; Joshua presses it on the threshold of his death — *neither make mention of the name of their gods, nor cause to swear by them* (Joshua 23:7).'),
    ('canon','joshua',23,13,'canon','exodus',23,33,'free',E'*They shall not dwell in thy land, lest they make thee sin against me: for if thou serve their gods, it will surely be a snare unto thee* (Exodus 23:33). The warned-of *snare* of Exodus returns in Joshua''s mouth as the consequence of mixing — *they shall be snares and traps unto you, and scourges in your sides, and thorns in your eyes, until ye perish from off this good land* (Joshua 23:13).'),
    ('canon','joshua',23,12,'canon','2-corinthians',6,14,'free',E'*Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14). The apostolic un-equal-yoke is Joshua''s warning carried forward — do not *make marriages with them, and go in unto them* (Joshua 23:12); the people set apart unto Yahuah are not to be bound to what serves other gods.'),
    ('canon','joshua',23,8,'canon','2-corinthians',6,17,'free',E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). To *cleave unto Yahuah Elohaychem (the LORD your God)* (Joshua 23:8) is to *come out... and be separate* — the same separation unto Yahuah, the holy people kept distinct, not a new people but Yashar''el set apart.'),
    ('canon','joshua',23,8,'canon','2-corinthians',6,18,'free',E'*And will be a Father unto you, and ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:18). The promise to those who cleave and come out is sonship to the Father; cleaving unto Yahuah — *as ye have done unto this day* (Joshua 23:8) — is the covenant nearness that the separation guards.'),
    -- THREAD 3: 23:14-16 as all good things came, so all evil; ye shall perish from the land
    ('canon','joshua',23,16,'canon','leviticus',26,14,'free',E'*But if ye will not hearken unto me, and will not do all these commandments* (Leviticus 26:14). Joshua''s covenant warning is the Lev 26 sanction set before the nation — the evil things come *when ye have transgressed the covenant of Yahuah Elohaychem (the LORD your God), which he commanded you, and have gone and served other gods* (Joshua 23:16); the curse follows covenant-breaking, not the keeping of it.'),
    ('canon','joshua',23,16,'canon','leviticus',26,15,'free',E'*And if ye shall despise my statutes, or if your soul abhor my judgments, so that ye will not do all my commandments, but that ye break my covenant* (Leviticus 26:15). To *break my covenant* is exactly what Joshua names — *when ye have transgressed the covenant* (Joshua 23:16); the evil is the consequence of forsaking the statutes, never the statutes themselves.'),
    ('canon','joshua',23,15,'canon','leviticus',26,33,'free',E'*And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). The threatened scattering is the *all evil things, until he have destroyed you from off this good land* (Joshua 23:15) — the very removal from the land that Joshua holds before the people as the wage of covenant-breaking.'),
    ('canon','joshua',23,15,'canon','deuteronomy',28,15,'free',E'*But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). The Deut 28 curse-clause is the mirror of Joshua''s — *so shall Yahuah (LORD) bring upon you all evil things* (Joshua 23:15); the curses overtake the one who will not hearken, the consequence of disobedience.'),
    ('canon','joshua',23,15,'canon','deuteronomy',28,63,'free',E'*And it shall come to pass, that as Yahuah (LORD) rejoiced over you to do you good, and to multiply you; so Yahuah (LORD) will rejoice over you to destroy you, and to bring you to nought; and ye shall be plucked from off the land whither thou goest to possess it* (Deuteronomy 28:63). Joshua quotes the very pattern — *as all good things are come upon you... so shall Yahuah (LORD) bring upon you all evil things... until he have destroyed you from off this good land* (Joshua 23:15); the good and the plucking-off are the two faces of the one covenant.'),
    ('canon','joshua',23,16,'canon','deuteronomy',28,64,'free',E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). The end of going and serving *other gods* (Joshua 23:16) is to be scattered and there to serve the very gods one ran after — the curse loops back on covenant-breaking.'),
    ('canon','joshua',23,11,'canon','deuteronomy',7,9,'free',E'*Know therefore that Yahuah Elohayka (the LORD thy God), he is Elohim (God), the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9). Joshua''s charge — *Take good heed therefore unto yourselves, that ye love Yahuah Elohaychem (the LORD your God)* (Joshua 23:11) — rests on the faithful Elohim who keeps covenant with *them that love him and keep his commandments*; love and keeping are bound as one.'),
    ('canon','joshua',23,15,'canon','2-kings',17,23,'free',E'*Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). Joshua''s warning was no idle word: the northern house was in time *removed... out of his sight* and carried to Assyria — the exact *destroyed you from off this good land* (Joshua 23:15) come to pass, the two-house scattering set in motion by covenant-breaking.'),
    -- THREAD 4: 23:14 not one thing hath failed; Yahuah hath fought for you
    ('canon','joshua',23,14,'canon','joshua',21,45,'free',E'*There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45). Two chapters before, the narrator''s verdict on the conquest; now Joshua sets it as the seal of his farewell — *not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake concerning you; all are come to pass* (Joshua 23:14). The faithful word is the witness that the warning too will surely stand.'),
    ('canon','joshua',23,3,'canon','joshua',21,43,'free',E'*And Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware to give unto their fathers; and they possessed it, and dwelt therein* (Joshua 21:43). The land given as Yahuah swore is the proof of *all that Yahuah Elohaychem (the LORD your God) hath done unto all these nations because of you; for Yahuah Elohaychem (the LORD your God) is he that hath fought for you* (Joshua 23:3).'),
    ('canon','joshua',23,10,'canon','joshua',21,44,'free',E'*And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers: and there stood not a man of all their enemies before them; Yahuah (LORD) delivered all their enemies into their hand* (Joshua 21:44). That *there stood not a man* is exactly why *one man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you* (Joshua 23:10) — the victory was his, not theirs.'),
    ('canon','joshua',23,10,'canon','joshua',1,5,'free',E'*There shall not any man be able to stand before thee all the days of thy life: as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5). The promise at the outset — none shall stand before thee — is the ground of Joshua''s testimony — *no man hath been able to stand before you unto this day* (Joshua 23:9), *one man of you shall chase a thousand* (Joshua 23:10), for it is Yahuah who fights.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-23-be-very-courageous-to-keep-and-do-all-the-torah-turn-not-aside',
       E'Be very courageous to keep and do all the Torah — turn not aside (the 1:7 charge)',
       E'Old and going *the way of all the earth*, Joshua hands the nation the very charge Yahuah once laid on him: *be ye therefore very courageous to keep and to do all that is written in the book of the law of Moses, that ye turn not aside therefrom to the right hand or to the left* (Joshua 23:6). It is word for word the commission of his own youth — *Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left* (Joshua 1:7) — the book that must *not depart out of thy mouth; but thou shalt meditate therein day and night* (Joshua 1:8). Moses had drawn the same straight line: *thou shalt not go aside from any of the words which I command thee this day, to the right hand, or to the left, to go after other gods* (Deuteronomy 28:14). The Torah is the covenant inheritance, to be kept and done, never the thing turned aside from.',
       sv.verse_id, ev.verse_id, 'free', 35550
  FROM _s344_jos23_lookup sv, _s344_jos23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods',
       E'Cleave unto Yahuah — make no mention of their gods, make no marriages (come out and be separate)',
       E'The second half of the charge is separation: *That ye come not among these nations... neither make mention of the name of their gods, nor cause to swear by them, neither serve them, nor bow yourselves unto them: But cleave unto Yahuah Elohaychem (the LORD your God), as ye have done unto this day* (Joshua 23:7-8). To cleave is to keep — Moses had said *ye shall serve him, and cleave unto him* in the same breath as *keep his commandments* (Deuteronomy 13:4). The danger is the un-equal yoke: *if ye do in any wise go back... and shall make marriages with them* (Joshua 23:12), the very thing forbidden — *Neither shalt thou make marriages with them... For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:3-4) — for the nations and their gods are *a snare unto thee* (Exodus 23:33), and so *they shall be snares and traps unto you... until ye perish* (Joshua 23:13). The apostle carries the same line forward unbroken: *Be ye not unequally yoked together with unbelievers* (2 Corinthians 6:14); *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord)... and I will receive you, And will be a Father unto you, and ye shall be my sons and daughters* (2 Corinthians 6:17-18). It is not a new people grafted in by confession but the holy people kept distinct unto Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 35553
  FROM _s344_jos23_lookup sv, _s344_jos23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=23 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant',
       E'As all good things came, so all evil things — perish from the land if ye transgress the covenant (the curse = covenant-breaking)',
       E'Joshua sets the blessing-and-curse of the Torah before the nation as a standing warning: *as all good things are come upon you, which Yahuah Elohaychem (the LORD your God) promised you; so shall Yahuah (LORD) bring upon you all evil things, until he have destroyed you from off this good land... When ye have transgressed the covenant of Yahuah Elohaychem (the LORD your God), which he commanded you, and have gone and served other gods... then shall the anger of Yahuah (LORD) be kindled against you, and ye shall perish quickly from off the good land* (Joshua 23:15-16). This is the Lev 26 / Deut 28 sanction, and it hinges on one thing — covenant-breaking, never the covenant itself: *if ye shall despise my statutes... but that ye break my covenant* (Leviticus 26:15), *I will scatter you among the heathen* (Leviticus 26:33); *if thou wilt not hearken unto the voice of Yahuah... that all these curses shall come upon thee* (Deuteronomy 28:15), *ye shall be plucked from off the land* (Deuteronomy 28:63), *and Yahuah (LORD) shall scatter thee among all people* (Deuteronomy 28:64). The other side stands just as firm: *the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments* (Deuteronomy 7:9) — hence *that ye love Yahuah Elohaychem (the LORD your God)* (Joshua 23:11). And the warning was no idle word: in time *Yahuah (LORD) removed Yashar''el (Israel) out of his sight... So was Yashar''el (Israel) carried away out of their own land to Assyria* (2 Kings 17:23) — the northern house scattered, the two-house exile that began exactly where Joshua said it would, in the mixing he forbade.',
       sv.verse_id, ev.verse_id, 'free', 35556
  FROM _s344_jos23_lookup sv, _s344_jos23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=23 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-23-not-one-thing-hath-failed-yahuah-hath-fought-for-you',
       E'Not one thing hath failed — Yahuah he it is that hath fought for you',
       E'Joshua grounds both promise and warning in the proven faithfulness of Yahuah: *ye know in all your hearts and in all your souls, that not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake concerning you; all are come to pass unto you* (Joshua 23:14). The narrator had already sealed it: *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45); *Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware* (Joshua 21:43); *there stood not a man of all their enemies before them* (Joshua 21:44). That is why Joshua can say *Yahuah Elohaychem (the LORD your God) is he that hath fought for you* (Joshua 23:3) and *one man of you shall chase a thousand: for Yahuah Elohaychem (the LORD your God), he it is that fighteth for you* (Joshua 23:10) — the very promise of the outset, *There shall not any man be able to stand before thee all the days of thy life... I will not fail thee, nor forsake thee* (Joshua 1:5). The good word stood to the letter; therefore the warning word will stand too.',
       sv.verse_id, ev.verse_id, 'free', 35559
  FROM _s344_jos23_lookup sv, _s344_jos23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=23 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*turn not from it to the right hand or to the left* (Joshua 1:7) — the identical charge first laid on Joshua himself.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-be-very-courageous-to-keep-and-do-all-the-torah-turn-not-aside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*This book of the law shall not depart out of thy mouth... day and night* (Joshua 1:8) — the book to be kept, the same Torah now charged on the nation.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-be-very-courageous-to-keep-and-do-all-the-torah-turn-not-aside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt not go aside... to the right hand, or to the left, to go after other gods* (Deuteronomy 28:14) — Moses'' straight bound of the Torah.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-be-very-courageous-to-keep-and-do-all-the-torah-turn-not-aside'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye shall serve him, and cleave unto him* (Deuteronomy 13:4) — to cleave is to keep his commandments.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=8
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt make no covenant with them, nor shew mercy unto them* (Deuteronomy 7:2) — no league with the nations.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=7
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Neither shalt thou make marriages with them* (Deuteronomy 7:3) — the exact danger Joshua names at 23:12.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=12
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4) — why marriages are forbidden.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=12
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou shalt make no covenant with them, nor with their gods* (Exodus 23:32) — the line drawn from Sinai.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=7
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*if thou serve their gods, it will surely be a snare unto thee* (Exodus 23:33) — the snare Joshua warns of at 23:13.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=13
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Be ye not unequally yoked together with unbelievers* (2 Corinthians 6:14) — Joshua''s un-equal-yoke carried forward.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=12
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*come out from among them, and be ye separate, saith Yahuah (Lord)* (2 Corinthians 6:17) — cleaving = separation unto Yahuah.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=8
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*ye shall be my sons and daughters, saith Yahuah (Lord) Almighty* (2 Corinthians 6:18) — the sonship guarded by the separation.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=8
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-cleave-unto-yahuah-and-mix-not-with-the-nations-and-their-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if ye will not hearken... and will not do all these commandments* (Leviticus 26:14) — the curse opens with covenant-breaking.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*if ye shall despise my statutes... but that ye break my covenant* (Leviticus 26:15) — exactly what Joshua names: *transgressed the covenant*.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will scatter you among the heathen... your land shall be desolate* (Leviticus 26:33) — the destroying-from-the-land of 23:15.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=15
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*if thou wilt not hearken... all these curses shall come upon thee* (Deuteronomy 28:15) — the mirror of Joshua''s *all evil things*.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=15
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*ye shall be plucked from off the land* (Deuteronomy 28:63) — the two faces of the one covenant, good and plucking-off.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=15
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=63
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah (LORD) shall scatter thee among all people... there thou shalt serve other gods* (Deuteronomy 28:64) — the end of going after other gods.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments* (Deuteronomy 7:9) — the ground of *that ye love Yahuah* (23:11).'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=11
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*So was Yashar''el (Israel) carried away out of their own land to Assyria* (2 Kings 17:23) — the warning fulfilled, the northern house scattered.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=15
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-as-all-good-things-came-so-all-evil-things-if-ye-transgress-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*There failed not ought of any good thing which Yahuah (LORD) had spoken* (Joshua 21:45) — the narrator''s verdict Joshua now seals.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=14
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-not-one-thing-hath-failed-yahuah-hath-fought-for-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) gave unto Yashar''el (Israel) all the land which he sware* (Joshua 21:43) — proof he *hath fought for you* (23:3).'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=3
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-not-one-thing-hath-failed-yahuah-hath-fought-for-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*there stood not a man of all their enemies before them* (Joshua 21:44) — why *one man of you shall chase a thousand* (23:10).'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=10
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-not-one-thing-hath-failed-yahuah-hath-fought-for-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*There shall not any man be able to stand before thee... I will not fail thee, nor forsake thee* (Joshua 1:5) — the promise at the outset, the ground of 23:9-10.'
  FROM cross_reference_threads t
  JOIN _s344_jos23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=23 AND sv.verse_number=10
  JOIN _s344_jos23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-23-not-one-thing-hath-failed-yahuah-hath-fought-for-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joshua_24.sql (Joshua 24) -----
-- Chapter: Joshua 24 — THE COVENANT AT SHECHEM (the recital of grace from Abraham; "choose you this
--          day"; as-for-me-and-my-house; the stone-witness; Joseph's bones buried in the land) — the
--          FINAL chapter of Joshua
-- Tag: jos24   View: _s344_jos24_lookup   Sort band: 35575, 35578, 35581, 35584, 35587, 35590
--
-- Joshua 24 coverage:
--   v.2-13 (Joshua rehearses Yahuah's mighty acts: Abraham called from beyond the river, Isaac, Jacob,
--           Egypt, the Red sea, the wilderness, the conquest; *a land for which ye did not labour*)
--          NT:     Acts 7:2-5 (Stephen's recital — the Elohim of glory appeared unto Abraham, get thee out)
--          Extras: none warranted (the recital is a canon-lateral genre)
--          Tanakh: Genesis 12:1 (the call — get thee out of thy country), Deuteronomy 26:5-9 (the
--                  firstfruits creed — a Syrian ready to perish), Nehemiah 9:7-8,24-25 (the Levites'
--                  confession — thou didst choose Abram... a fat land, vineyards, oliveyards)
--   v.14-15 (the decisive call: fear Yahuah, put away the strange gods, choose you this day whom ye will
--            serve; BUT AS FOR ME AND MY HOUSE, WE WILL SERVE Yahuah) — THE KEYSTONE
--          NT:     Matthew 6:24 (no man can serve two masters... ye cannot serve Elohim and mammon)
--          Extras: none warranted
--          Tanakh: Deuteronomy 30:19 (I have set before you life and death... therefore choose life),
--                  1 Kings 18:21 (Elijah: how long halt ye between two opinions?)
--   v.22-27 (the people: Yahuah our Elohim will we serve; Joshua makes a covenant, writes in the book of
--            the law, sets up the GREAT STONE as a witness that hath heard all the words of Yahuah)
--          NT:     none warranted at the verse
--          Extras: none warranted
--          Tanakh: Deuteronomy 26:17-18 (thou hast avouched Yahuah... and Yahuah hath avouched thee his
--                  peculiar people), Genesis 31:48 (the heap a witness — this stone shall be a witness)
--   v.32   (the BONES OF JOSEPH brought up out of Egypt buried at Shechem, in the parcel Jacob bought —
--           the Genesis 50:25 oath fulfilled) — the seed who trusted the promise laid in the land
--          NT:     Hebrews 11:22 (by faith Joseph... gave commandment concerning his bones)
--          Extras: none warranted
--          Tanakh: Genesis 50:25 (Joseph took an oath... ye shall carry up my bones), Exodus 13:19
--                  (Moses took the bones of Joseph with him)
--   v.1,28-31,33 (gathered to Shechem; the people depart to their inheritance; Joshua dies at 110;
--                 Yashar'el served Yahuah all his days; Eleazar buried in mount Ephraim)
--          NT/Extras/Tanakh: none warranted as standalone threads — woven into the recital & covenant
--                  threads (Shechem the place, the inheritance, the generation that knew the works)
--
-- Threads:
--   joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance  [Tanakh: Genesis, Deuteronomy, Nehemiah | NT: Acts]  (free)
--   joshua-24-choose-you-this-day-but-as-for-me-and-my-house-we-will-serve-yahuah [Tanakh: Deuteronomy, 1 Kings | NT: Matthew]        (free)
--   joshua-24-the-covenant-and-the-stone-witness-lest-ye-deny-your-elohim         [Tanakh: Deuteronomy, Genesis]                        (free)
--   joshua-24-the-bones-of-joseph-buried-in-the-land-the-oath-of-the-seed-fulfilled [Tanakh: Genesis, Exodus | NT: Hebrews]            (free)
--
-- Framework notes: the recital (24:2-13) is the seed-history rehearsed — Yahuah *took your father Abraham
-- from the other side of the flood... and multiplied his seed* (24:3), the unearned inheritance *a land for
-- which ye did not labour* (24:13), the same grace-recital genre as the firstfruits creed (Deut 26:5-9), the
-- Levites' confession (Neh 9), and Stephen's defense (Acts 7) — grace first, then covenant obedience, never
-- merit. ★★★ The keystone is *choose you this day whom ye will serve... but as for me and my house, we will
-- serve Yahuah* (24:15) — undivided allegiance, the household pledged; Deut 30:19 *therefore choose life*,
-- Elijah's *how long halt ye between two opinions* (1 Kgs 18:21), and Yahusha's *ye cannot serve Elohim and
-- mammon* (Matt 6:24). The covenant is ratified and written *in the book of the law of Elohim* — Torah is the
-- inheritance, not the curse; the great stone a witness *lest ye deny your Elohim* (24:27), echoing the
-- avouching of Deut 26:17-18 (his peculiar people) and the witness-heap of Gen 31:48. ★ Joseph's bones buried
-- at Shechem (24:32) close the book of the conquest by fulfilling the Genesis 50:25 oath of the seed who
-- trusted the promise of the land (Exod 13:19, Heb 11:22) — and Joseph, father of Ephraim, the northern house,
-- is laid to rest in his inheritance (the two-house note). All members canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s344_jos24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the recital of Yahuah's grace from Abraham — the unearned inheritance (Genesis / Deuteronomy / Nehemiah / Acts)
    ('canon','joshua',24,3,'canon','genesis',12,1,'free',E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). Joshua opens the recital with the very call: *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* (24:3). The whole history hangs on Yahuah''s sovereign taking — *I took* — the seed of promise carried by paternal bloodline AND covenant-word from the first calling.'),
    ('canon','joshua',24,2,'canon','nehemiah',9,7,'free',E'*Thou art Yahuah (LORD) the Elohim (God), who didst choose Abram, and broughtest him forth out of Ur of the Chaldees, and gavest him the name of Abraham* (Nehemiah 9:7). Joshua names the same beginning — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (24:2). Out of an idolatrous house Yahuah chose Abram by grace; the Levites'' confession sings the identical recital of the seed called from the nations.'),
    ('canon','joshua',24,13,'canon','nehemiah',9,25,'free',E'*And they took strong cities, and a fat land, and possessed houses full of all goods, wells digged, vineyards, and oliveyards, and fruit trees in abundance: so they did eat, and were filled* (Nehemiah 9:25). Joshua''s word is the same unearned gift: *And I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat* (24:13). The inheritance is grace — vineyards they planted not, cities they built not — never wages earned.'),
    ('canon','joshua',24,5,'canon','deuteronomy',26,8,'free',E'*And Yahuah (LORD) brought us forth out of Egypt with a mighty hand, and with an outstretched arm, and with great terribleness, and with signs, and with wonders* (Deuteronomy 26:8). Joshua rehearses it: *I sent Moses also and Aaron, and I plagued Egypt... and afterward I brought you out* (24:5). The firstfruits creed and the Shechem recital are one confession — the bringing-out is Yahuah''s mighty act, the ground of all the covenant that follows.'),
    ('canon','joshua',24,13,'canon','deuteronomy',26,9,'free',E'*And he hath brought us into this place, and hath given us this land, even a land that floweth with milk and honey* (Deuteronomy 26:9). The basket of firstfruits is brought precisely because the land was given, not earned — exactly Joshua''s *I have given you a land for which ye did not labour* (24:13). Grace receives the gift, then renders the firstfruits back; the recital always runs grace-first.'),
    ('canon','joshua',24,3,'canon','acts',7,2,'free',E'*The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2). Stephen begins his defense exactly where Joshua begins his recital — Abraham *on the other side of the flood* (24:2-3), in Mesopotamia, taken by the Elohim of glory. The Formed Son who appeared to Abraham is the One the whole seed-history testifies of.'),
    ('canon','joshua',24,3,'canon','acts',7,5,'free',E'*And he gave him none inheritance in it, no, not so much as to set his foot on: yet he promised that he would give it to him for a possession, and to his seed after him, when as yet he had no child* (Acts 7:5). Joshua''s recital is the promise come true — *multiplied his seed, and gave him Isaac* (24:3) — the land Abraham never set foot to possess now stands given to the tribes at Shechem; the unearned inheritance of the seed.'),
    -- THREAD 2: choose you this day — but as for me and my house, we will serve Yahuah (Deuteronomy / 1 Kings / Matthew)
    ('canon','joshua',24,15,'canon','deuteronomy',30,19,'free',E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). Joshua sets the same choice before the tribes: *choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD)* (24:15). The covenant always lays the undivided decision before the people — life is choosing Yahuah, and the household chooses with the man.'),
    ('canon','joshua',24,15,'canon','1-kings',18,21,'free',E'*And Elijah came unto all the people, and said, How long halt ye between two opinions? if Yahuah (LORD) be Elohim (God), follow him: but if Baal, then follow him* (1 Kings 18:21). Elijah on Carmel presses the very demand Joshua presses at Shechem — no limping between two masters; *if it seem evil unto you to serve Yahuah (LORD), choose you this day* (24:15). Undivided allegiance: serve Yahuah, or serve the gods, but not both.'),
    ('canon','joshua',24,15,'canon','matthew',6,24,'free',E'*No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). Yahusha (Jesus) states the law Joshua enacts: the heart cannot be divided. *Put away the gods which your fathers served... and serve ye Yahuah (LORD)* (24:14); *as for me and my house, we will serve Yahuah* (24:15) — one Master, the whole household pledged.'),
    ('canon','joshua',24,14,'canon','deuteronomy',30,20,'free',E'*That thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life, and the length of thy days* (Deuteronomy 30:20). Joshua''s call to *fear Yahuah (LORD), and serve him in sincerity and in truth* (24:14) is Moses'' call to love, obey, and cleave — to serve Yahuah is to choose life itself, the undivided heart given wholly to Him.'),
    -- THREAD 3: the covenant and the stone-witness — lest ye deny your Elohim (Deuteronomy / Genesis)
    ('canon','joshua',24,22,'canon','deuteronomy',26,17,'free',E'*Thou hast avouched Yahuah (LORD) this day to be thy Elohim (God), and to walk in his ways, and to keep his statutes, and his commandments, and his judgments, and to hearken unto his voice* (Deuteronomy 26:17). At Shechem the people avouch the same: *Ye are witnesses against yourselves that ye have chosen you Yahuah (LORD), to serve him. And they said, We are witnesses* (24:22). The covenant is sworn aloud — the people themselves the witnesses to their own choosing.'),
    ('canon','joshua',24,24,'canon','deuteronomy',26,18,'free',E'*And Yahuah (LORD) hath avouched thee this day to be his peculiar people, as he hath promised thee, and that thou shouldest keep all his commandments* (Deuteronomy 26:18). The people answer Joshua, *Yahuah Eloheinu (The LORD our God) will we serve, and his voice will we obey* (24:24) — the mutual avouching of Deuteronomy renewed: Yahuah''s peculiar people pledged to keep His commandments, the Torah the very inheritance, never the curse.'),
    ('canon','joshua',24,26,'canon','deuteronomy',26,16,'free',E'*This day Yahuah Elohayka (the LORD thy God) hath commanded thee to do these statutes and judgments: thou shalt therefore keep and do them with all thine heart, and with all thy soul* (Deuteronomy 26:16). Joshua *wrote these words in the book of the law of Elohim (God)* (24:26) — the covenant set down in the very Torah Moses commanded them to keep with all the heart. The written law is the bond of the renewed covenant, not its abolishing.'),
    ('canon','joshua',24,27,'canon','genesis',31,48,'free',E'*And Laban said, This heap is a witness between me and thee this day. Therefore was the name of it called Galeed* (Genesis 31:48). As Jacob raised a heap of stones to witness a covenant, Joshua *took a great stone, and set it up... Behold, this stone shall be a witness unto us; for it hath heard all the words of Yahuah (LORD)... lest ye deny your Elohim (God)* (24:26-27). The standing stone is the silent witness of the sworn covenant — a testimony against any future denial.'),
    -- THREAD 4: the bones of Joseph buried in the land — the oath of the seed fulfilled (Genesis / Exodus / Hebrews)
    ('canon','joshua',24,32,'canon','genesis',50,25,'free',E'*And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25). At the last verse of the conquest the oath is kept: *And the bones of Joseph, which the children of Yashar''el (Israel) brought up out of Egypt, buried they in Shechem* (24:32). The seed who trusted the promise of the land — who would not be buried in Egypt — is laid at last in the inheritance he believed Yahuah would give.'),
    ('canon','joshua',24,32,'canon','exodus',13,19,'free',E'*And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you* (Exodus 13:19). The bones carried out of Egypt at the Exodus are carried all the wilderness journey until this burial — *buried they in Shechem, in a parcel of ground which Jacob bought* (24:32). The oath spans the whole deliverance: out of Egypt, through the wilderness, into the land, into Joseph''s own inheritance.'),
    ('canon','joshua',24,32,'canon','hebrews',11,22,'free',E'*By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). Hebrews names the burial of Joshua 24:32 as faith itself — Joseph, sure of the promised departing, *gave commandment concerning his bones*. The seed who believed the inheritance was real is buried where he believed; and Joseph, father of Ephraim, the northern house, is laid in *the inheritance of the children of Joseph* (24:32) — the two-house seed at rest in the land.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s344_jos24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s344_jos24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance',
       E'The Recital of Yahuah''s Grace from Abraham — the Unearned Inheritance',
       E'Gathered at Shechem, Joshua does not begin with a command but with a history of grace: *Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods. And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* (Joshua 24:2-3). Out of an idolatrous house Yahuah chose Abram by sovereign grace — *I took* — exactly as the Levites confess: *Thou art Yahuah (LORD) the Elohim (God), who didst choose Abram, and broughtest him forth out of Ur of the Chaldees, and gavest him the name of Abraham* (Nehemiah 9:7). Stephen begins his defense at the same place: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia* (Acts 7:2) — and that land Abraham never set foot to possess (Acts 7:5) is now given to the tribes. The recital runs through Egypt and the Red sea — *I sent Moses also and Aaron, and I plagued Egypt... and afterward I brought you out* (24:5), which is the firstfruits creed word for word: *And Yahuah (LORD) brought us forth out of Egypt with a mighty hand, and with an outstretched arm* (Deuteronomy 26:8). And it ends in the gift no man earned: *I have given you a land for which ye did not labour, and cities which ye built not, and ye dwell in them; of the vineyards and oliveyards which ye planted not do ye eat* (24:13) — the same unearned plenty Nehemiah names, *a fat land, possessed houses full of all goods, wells digged, vineyards, and oliveyards* (Nehemiah 9:25), and the same given land of the creed, *he hath brought us into this place, and hath given us this land* (Deuteronomy 26:9). Grace first, always — the seed called, the people delivered, the inheritance given — and only then the covenant choice that follows.',
       sv.verse_id, ev.verse_id, 'free', 35575
  FROM _s344_jos24_lookup sv, _s344_jos24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=24 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-24-choose-you-this-day-but-as-for-me-and-my-house-we-will-serve-yahuah',
       E'Choose You This Day — But As For Me and My House, We Will Serve Yahuah',
       E'The recital of grace lands on a demand for undivided allegiance: *Now therefore fear Yahuah (LORD), and serve him in sincerity and in truth: and put away the gods which your fathers served on the other side of the flood, and in Egypt; and serve ye Yahuah (LORD). And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD)* (Joshua 24:14-15). This is the covenant''s own grammar: Moses had set it the same way — *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19), for to serve Yahuah is *that thou mayest love Yahuah Elohayka (the LORD thy God), and that thou mayest obey his voice, and that thou mayest cleave unto him: for he is thy life* (Deuteronomy 30:20). Elijah pressed the identical choice on Carmel: *How long halt ye between two opinions? if Yahuah (LORD) be Elohim (God), follow him: but if Baal, then follow him* (1 Kings 18:21) — no limping between two masters. And Yahusha (Jesus) states the law beneath it all: *No man can serve two masters... Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). The heart will not be split. Joshua pledges not himself only but his household — *me and my house* — the covenant gathering the whole family under one undivided Lord.',
       sv.verse_id, ev.verse_id, 'free', 35578
  FROM _s344_jos24_lookup sv, _s344_jos24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=24 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-24-the-covenant-and-the-stone-witness-lest-ye-deny-your-elohim',
       E'The Covenant and the Stone-Witness — Lest Ye Deny Your Elohim',
       E'The people answer the call, *Yahuah Eloheinu (The LORD our God) will we serve, and his voice will we obey* (Joshua 24:24), and Joshua binds the moment into covenant. First the people are made witnesses against themselves: *Ye are witnesses against yourselves that ye have chosen you Yahuah (LORD), to serve him. And they said, We are witnesses* (24:22) — the very avouching Moses set down, *Thou hast avouched Yahuah (LORD) this day to be thy Elohim (God), and to walk in his ways, and to keep his statutes, and his commandments* (Deuteronomy 26:17), to which Yahuah answers, *Yahuah (LORD) hath avouched thee this day to be his peculiar people... and that thou shouldest keep all his commandments* (Deuteronomy 26:18). Then Joshua *made a covenant with the people that day... And Joshua wrote these words in the book of the law of Elohim (God)* (24:25-26) — the covenant set down in the very Torah commanded to be kept *with all thine heart, and with all thy soul* (Deuteronomy 26:16); the written law is the bond of the renewed covenant, never its abolishing. Finally he *took a great stone, and set it up there under an oak, that was by the sanctuary of Yahuah (LORD). And Joshua said... Behold, this stone shall be a witness unto us; for it hath heard all the words of Yahuah (LORD) which he spake unto us: it shall be therefore a witness unto you, lest ye deny your Elohim (God)* (24:26-27) — a standing stone like the heap Jacob raised, *This heap is a witness between me and thee this day* (Genesis 31:48); the silent stone a testimony against any future denial of the covenant sworn at Shechem.',
       sv.verse_id, ev.verse_id, 'free', 35581
  FROM _s344_jos24_lookup sv, _s344_jos24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=24 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joshua-24-the-bones-of-joseph-buried-in-the-land-the-oath-of-the-seed-fulfilled',
       E'The Bones of Joseph Buried in the Land — the Oath of the Seed Fulfilled',
       E'The book of the conquest closes on a grave that fulfills a centuries-old oath: *And the bones of Joseph, which the children of Yashar''el (Israel) brought up out of Egypt, buried they in Shechem, in a parcel of ground which Jacob bought of the sons of Hamor the father of Shechem for an hundred pieces of silver: and it became the inheritance of the children of Joseph* (Joshua 24:32). Long before, dying in Egypt, Joseph had made the sons of Yashar''el swear: *Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25). He would not be buried in Egypt — he believed the promise of the land was real, and bound the seed to carry him into it. At the Exodus the oath was honored: *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you* (Exodus 13:19) — out of Egypt, through all the wilderness, into the land, and now at last into the ground Jacob bought. Hebrews names this very thing faith: *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). The seed who trusted the inheritance is buried in the inheritance — and Joseph, the father of Ephraim, the head of the northern house, is laid to rest in *the inheritance of the children of Joseph* (24:32): the two-house seed home in the land Yahuah swore to the fathers.',
       sv.verse_id, ev.verse_id, 'free', 35584
  FROM _s344_jos24_lookup sv, _s344_jos24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='joshua' AND ev.chapter_number=24 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 12:1 — *Get thee out of thy country... unto a land that I will shew thee*: Joshua''s *I took your father Abraham from the other side of the flood* (24:3) is the call itself.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Nehemiah 9:7 — *who didst choose Abram, and broughtest him forth out of Ur of the Chaldees*: out of an idolatrous house (24:2) Yahuah chose Abram by grace.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=2
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 26:8 — *Yahuah brought us forth out of Egypt with a mighty hand*: Joshua''s *I plagued Egypt... and brought you out* (24:5), the firstfruits creed.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=5
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 26:9 — *he hath brought us into this place, and hath given us this land*: the land is given (24:13), grace receives it then renders firstfruits back.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=13
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Nehemiah 9:25 — *a fat land... vineyards, and oliveyards*: the unearned plenty of Joshua''s *vineyards and oliveyards which ye planted not* (24:13).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=13
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Acts 7:2 — *The Elohim of glory appeared unto our father Abraham... in Mesopotamia*: Stephen begins where Joshua begins, the Formed Son who appeared to Abraham.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Acts 7:5 — *he gave him none inheritance... yet he promised... to his seed after him*: the promise come true, the land now given to the tribes (24:3).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-recital-of-yahuahs-grace-from-abraham-the-unearned-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 30:19 — *I have set before you life and death... therefore choose life*: Moses sets the same choice Joshua sets, *choose you this day* (24:15).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-choose-you-this-day-but-as-for-me-and-my-house-we-will-serve-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 30:20 — *love Yahuah... obey his voice... cleave unto him: for he is thy life*: to serve Yahuah (24:14) is to choose life itself.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=14
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-choose-you-this-day-but-as-for-me-and-my-house-we-will-serve-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 18:21 — *How long halt ye between two opinions?*: Elijah presses on Carmel the undivided demand Joshua presses at Shechem (24:15).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-choose-you-this-day-but-as-for-me-and-my-house-we-will-serve-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Matthew 6:24 — *Ye cannot serve Elohim and mammon*: Yahusha states the law beneath Joshua''s call — the heart cannot be divided, one Master only (24:15).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-choose-you-this-day-but-as-for-me-and-my-house-we-will-serve-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 26:17 — *Thou hast avouched Yahuah this day to be thy Elohim*: the people avouch the same at Shechem, witnesses against themselves (24:22).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=22
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-covenant-and-the-stone-witness-lest-ye-deny-your-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 26:18 — *Yahuah hath avouched thee to be his peculiar people... keep all his commandments*: the people pledge *his voice will we obey* (24:24).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=24
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-covenant-and-the-stone-witness-lest-ye-deny-your-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 26:16 — *keep and do them with all thine heart*: Joshua *wrote these words in the book of the law of Elohim* (24:26), the Torah the bond of the covenant.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=26
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-covenant-and-the-stone-witness-lest-ye-deny-your-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 31:48 — *This heap is a witness between me and thee this day*: as Jacob raised a witness-heap, Joshua sets the great stone *lest ye deny your Elohim* (24:27).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=27
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=31 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-covenant-and-the-stone-witness-lest-ye-deny-your-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 50:25 — *ye shall carry up my bones from hence*: the oath of the dying Joseph, kept at last in Joshua 24:32 — the seed who trusted the land.'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=32
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-bones-of-joseph-buried-in-the-land-the-oath-of-the-seed-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 13:19 — *Moses took the bones of Joseph with him*: the bones carried out at the Exodus, through the wilderness, now buried in the land (24:32).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=32
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=13 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-bones-of-joseph-buried-in-the-land-the-oath-of-the-seed-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 11:22 — *By faith Joseph... gave commandment concerning his bones*: the burial named as faith; Joseph, father of Ephraim, laid in the northern house''s inheritance (24:32).'
  FROM cross_reference_threads t
  JOIN _s344_jos24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joshua' AND sv.chapter_number=24 AND sv.verse_number=32
  JOIN _s344_jos24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joshua-24-the-bones-of-joseph-buried-in-the-land-the-oath-of-the-seed-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session344 — Joshua cross-references complete.'
