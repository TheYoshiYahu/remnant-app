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


COMMIT;
\echo 'session344 — Joshua cross-references complete.'
