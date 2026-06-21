-- =====================================================================
-- Session 260 — 1 Corinthians (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_1corinthians_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — 1 Corinthians (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_1corinthians_11.sql -----
-- ============================================================================
-- 1 CORINTHIANS 11 — NT DEPTH PASS — full-library "Come and See" cross-references
-- Chapter-minion fragment. 3 NEW threads (THIN-ADD; existing 11:3 + 11:23 NOT touched).
-- Temp-view tag: _1co11_lookup | book slug: 1-corinthians | band base 17300 step 3
-- ============================================================================

-- 3a. TEMP VIEW
CREATE TEMP VIEW _1co11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- 3b. cross_references rows (ALL members)
-- ============================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- ---- THREAD 1 :: 11:2 the delivered teaching KEPT and handed down ----
  ('canon','1-corinthians',11,2,'canon','deuteronomy',4,2, 'free',
   E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you.* (Deuteronomy 4:2). Paul praises them for holding fast what was DELIVERED — the same Torah of transmission Moshe set: receive it whole, add nothing, take nothing away.'),
  ('canon','1-corinthians',11,2,'canon','deuteronomy',12,32, 'free',
   E'*What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it.* (Deuteronomy 12:32). The very pattern Paul calls keeping the traditions *even as I delivered them* — the word handed down unchanged, neither swelled nor shaved.'),
  ('canon','1-corinthians',11,2,'canon','exodus',12,24, 'free',
   E'*And ye shall observe this thing for an ordinance to thee and to thy sons for ever.* (Exodus 12:24). The ordinance of the Passover is *delivered* to be *kept* — generation to generation. Paul stands squarely in that line of faithful handing-down.'),
  ('canon','1-corinthians',11,2,'canon','exodus',12,25, 'free',
   E'*And it shall come to pass, when ye be come to the land which Yahuah (LORD) will give you, according as he hath promised, that ye shall keep this service.* (Exodus 12:25). The kept service — exactly what Paul means by *the traditions, even as I delivered them.* The Torah was never abolished; it is received and guarded.'),
  ('canon','1-corinthians',11,2,'canon','2-thessalonians',2,15, 'free',
   E'*Therefore, brethren, stand fast, and hold the traditions which ye have been taught, whether by word, or our epistle.* (2 Thessalonians 2:15). Paul''s own twin charge — the apostolic deposit is to be HELD, not edited. One unbroken chain: Moshe to the assembly.'),

  -- ---- THREAD 2 :: 11:17-22 the table that shames the poor ----
  ('canon','1-corinthians',11,22,'canon','deuteronomy',15,7, 'free',
   E'*If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother:* (Deuteronomy 15:7). Paul rebukes a meal where *one is hungry* — the open-hand statute is being trampled at the very table of the Messiah.'),
  ('canon','1-corinthians',11,22,'canon','deuteronomy',15,11, 'free',
   E'*For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land.* (Deuteronomy 15:11). The standing command. To *shame them that have not* is to break the very Torah the table is meant to embody.'),
  ('canon','1-corinthians',11,22,'canon','isaiah',58,7, 'free',
   E'*Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). The fast Yahuah chooses is bread shared. A gathering where some feast and some starve is the opposite of the assembly''s calling.'),
  ('canon','1-corinthians',11,22,'canon','isaiah',58,10, 'free',
   E'*And if thou draw out thy soul to the hungry, and satisfy the afflicted soul; then shall thy light rise in obscurity, and thy darkness be as the noonday:* (Isaiah 58:10). Feed the afflicted and light rises; shame them and the gathering turns *not for the better, but for the worse.*'),
  ('canon','1-corinthians',11,22,'canon','proverbs',14,31, 'free',
   E'*He that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor.* (Proverbs 14:31). To despise the assembly of Elohim and shame the have-nots is to reproach the Maker himself — the meal''s injustice strikes upward.'),
  ('canon','1-corinthians',11,22,'canon','amos',5,21, 'free',
   E'*I hate, I despise your feast days, and I will not smell in your solemn assemblies.* (Amos 5:21). An assembly emptied of justice Yahuah rejects outright — Paul''s *I praise you not* is Amos''s verdict pronounced over the Corinthian supper.'),
  ('canon','1-corinthians',11,22,'canon','amos',5,24, 'free',
   E'*But let judgment run down as waters, and righteousness as a mighty stream.* (Amos 5:24). The remedy for a corrupt feast is not more ceremony but justice and righteousness — exactly what Paul calls them back to: tarry one for another, shame no one.'),
  ('canon','1-corinthians',11,22,'apocrypha','ecclesiasticus',34,21, 'extras',
   E'*The bread of the needy is their life: he that defraudeth him thereof is a man of blood.* (Sirach 34:21). The second-Temple sages weighed it the same: to withhold bread from the hungry at the very table is no light thing — it is bloodguilt. The whole library speaks with one voice on the poor.'),

  -- ---- THREAD 3 :: 11:27-32 reverence at the covenant meal; the Father chastens his sons ----
  ('canon','1-corinthians',11,27,'canon','leviticus',10,1, 'free',
   E'*And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not.* (Leviticus 10:1). The holy thing approached *unworthily.* Paul''s warning against eating the bread *unworthily* stands on this ancient ground: the covenant meal is not common.'),
  ('canon','1-corinthians',11,27,'canon','leviticus',10,3, 'free',
   E'*Then Moses said unto Aaron, This is it that Yahuah (LORD) spake, saying, I will be sanctified in them that come nigh me, and before all the people I will be glorified. And Aaron held his peace.* (Leviticus 10:3). *I will be sanctified in them that come nigh me* — the reverence Paul demands at the table. To *discern the body* is to come nigh in awe, not carelessness.'),
  ('canon','1-corinthians',11,28,'canon','psalms',26,2, 'free',
   E'*Examine me, O Yahuah (LORD), and prove me; try my reins and my heart.* (Psalms 26:2). *Let a man examine himself* — Paul echoes David''s prayer. The one who comes to the meal first lays his own heart open before the Father.'),
  ('canon','1-corinthians',11,28,'canon','lamentations',3,40, 'free',
   E'*Let us search and try our ways, and turn again to Yahuah (LORD).* (Lamentations 3:40). Self-examination unto repentance — the very turning Paul presses: *if we would judge ourselves, we should not be judged.*'),
  ('canon','1-corinthians',11,32,'canon','proverbs',3,11, 'free',
   E'*My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* (Proverbs 3:11). *We are chastened of Yahuah, that we should not be condemned with the world.* This is a SON being corrected — never a son cast off.'),
  ('canon','1-corinthians',11,32,'canon','proverbs',3,12, 'free',
   E'*For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* (Proverbs 3:12). The weak and sickly are not abandoned but loved. The Father chastens his own — the discipline of a delighted-in son, the opposite of condemnation.'),
  ('canon','1-corinthians',11,32,'apocrypha','ecclesiasticus',2,5, 'extras',
   E'*For gold is tried in the fire, and acceptable men in the furnace of adversity.* (Sirach 2:5). Ben Sira reads the Father''s chastening just as Paul does: not wrath against the rejected but the refining of the accepted. The fire proves the son it loves.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _1co11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _1co11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- 3c. threads (7 cols / 7 SELECT exprs)
-- ============================================================================

-- THREAD 1 :: 11:2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-11-hold-fast-the-traditions-delivered-deuteronomy-4-exodus-12',
       E'Hold Fast the Traditions, Even As I Delivered Them',
       E'*Now I praise you, brethren, that ye remember me in all things, and hold fast the traditions, even as I delivered them unto you* (1 Corinthians 11:2). Before Paul corrects the assembly, he commends the one thing they have right: they are KEEPING what was handed down, *even as I delivered them.* This is the Torah of transmission honored — the word received whole, nothing added, nothing taken away.\n\nThe pattern is as old as Sinai. *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God) which I command you* (Deuteronomy 4:2). And again: *What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). The deposit is to be guarded exactly, not edited.\n\nThe Passover is the very picture of a faithful handing-down: *And ye shall observe this thing for an ordinance to thee and to thy sons for ever* (Exodus 12:24); *that ye shall keep this service* (Exodus 12:25). Generation to generation, the kept ordinance. And Paul gives the assembly the same charge elsewhere: *stand fast, and hold the traditions which ye have been taught, whether by word, or our epistle* (2 Thessalonians 2:15).\n\nOne unbroken chain — Moshe to the apostles to the assembly. The teaching delivered is the teaching kept. The Torah was never abolished; it is received and reverently guarded. Come and see: the deposit handed down is one.',
       sv.verse_id, ev.verse_id, 'free', 17300
  FROM _1co11_lookup sv, _1co11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 :: 11:17-22
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5',
       E'When Ye Come Together Not for the Better: The Table That Shames the Poor',
       E'*Now in this that I declare unto you I praise you not, that ye come together not for the better, but for the worse* (1 Corinthians 11:17). The trouble: *in eating every one taketh before other his own supper: and one is hungry, and another is drunken* (11:21). And Paul''s sharpest word: *or despise ye the assembly of Elohim (God), and shame them that have not?* (11:22). A gathering meant to embody the covenant has become a place where the poor are humiliated.\n\nThis is a Torah failure at the table. *If there be among you a poor man of one of thy brethren... thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7); *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The open-hand statute is being trampled where the bread is broken.\n\nIsaiah names the fast Yahuah actually chooses: *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house?* (Isaiah 58:7); *And if thou draw out thy soul to the hungry, and satisfy the afflicted soul; then shall thy light rise in obscurity* (Isaiah 58:10). Feed the afflicted and light rises; shame them and the meal turns *for the worse.*\n\nAnd the injustice strikes upward: *He that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor* (Proverbs 14:31). The second-Temple sages weighed it the same — *The bread of the needy is their life: he that defraudeth him thereof is a man of blood* (Sirach 34:21).\n\nMost piercing of all, Amos pronounces the verdict over an empty feast: *I hate, I despise your feast days, and I will not smell in your solemn assemblies* (Amos 5:21) — *But let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:24). Paul''s *I praise you not* IS Amos''s verdict spoken over the Corinthian supper. The remedy is not more ceremony but justice and mercy: tarry one for another, shame no one. Come and see: the whole library guards the poor at the table.',
       sv.verse_id, ev.verse_id, 'extras', 17303
  FROM _1co11_lookup sv, _1co11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=11 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 :: 11:27-32
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3',
       E'Let a Man Examine Himself: Reverence at the Meal, the Father''s Chastening',
       E'*Wherefore whosoever shall eat this bread, and drink this cup of Yahusha (the Lord), unworthily, shall be guilty of the body and blood of Yahusha (the Lord)* (1 Corinthians 11:27). The covenant meal is not common, and to handle it carelessly is grave.\n\nThe ancient ground is Nadab and Abihu: *And Nadab and Abihu, the sons of Aaron, took either of them his censer... and offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1). The holy thing approached unworthily. And the word over it: *I will be sanctified in them that come nigh me, and before all the people I will be glorified* (Leviticus 10:3). To *discern the body* is to come nigh in awe.\n\nSo Paul says, *let a man examine himself* (11:28) — David''s own prayer: *Examine me, O Yahuah (LORD), and prove me; try my reins and my heart* (Psalms 26:2); and the turning of Lamentations, *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40). Self-examination unto repentance: *if we would judge ourselves, we should not be judged* (11:31).\n\nAnd here is the gospel comfort in the warning. *But when we are judged, we are chastened of Yahuah (the Lord), that we should not be condemned with the world* (11:32). This is not wrath against the rejected. *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: for whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* (Proverbs 3:11-12). The weak and sickly are not cast off — they are SONS being corrected by a Father who delights in them. Ben Sira read it the same: *gold is tried in the fire, and acceptable men in the furnace of adversity* (Sirach 2:5). The fire proves the son it loves. Come and see: the chastening is a Father''s, never a judge''s condemnation.',
       sv.verse_id, ev.verse_id, 'extras', 17306
  FROM _1co11_lookup sv, _1co11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- 3d. thread_members
-- ============================================================================

-- ---- THREAD 1 members ----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:2 — *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it...* — receive the word whole, add nothing, take nothing away.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-hold-fast-the-traditions-delivered-deuteronomy-4-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 12:32 — *thou shalt not add thereto, nor diminish from it* — the deposit guarded exactly, neither swelled nor shaved.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-hold-fast-the-traditions-delivered-deuteronomy-4-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:24 — *ye shall observe this thing for an ordinance to thee and to thy sons for ever* — the ordinance handed down generation to generation.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-hold-fast-the-traditions-delivered-deuteronomy-4-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:25 — *that ye shall keep this service* — the kept service, exactly what Paul means by the traditions delivered.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-hold-fast-the-traditions-delivered-deuteronomy-4-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Thessalonians 2:15 — *stand fast, and hold the traditions which ye have been taught* — Paul''s twin charge; the apostolic deposit held, not edited.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-hold-fast-the-traditions-delivered-deuteronomy-4-exodus-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---- THREAD 2 members ----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:7 — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* — the open-hand statute, trampled where the bread is broken.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:11 — *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* — the standing command behind Paul''s rebuke.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry...?* — the fast Yahuah chooses is bread shared, not a meal where some starve.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 58:10 — *satisfy the afflicted soul; then shall thy light rise in obscurity* — feed the afflicted and light rises; shame them and the gathering turns for the worse.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 14:31 — *He that oppresseth the poor reproacheth his Maker* — the meal''s injustice strikes upward at Elohim himself.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Amos 5:21 — *I hate, I despise your feast days... I will not smell in your solemn assemblies* — Paul''s "I praise you not" is Amos''s verdict over the Corinthian supper.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Amos 5:24 — *let judgment run down as waters, and righteousness as a mighty stream* — the remedy for a corrupt feast: justice, not more ceremony.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Sirach 34:21 (extra-canonical witness) — *The bread of the needy is their life: he that defraudeth him thereof is a man of blood* — the second-Temple sages: to withhold bread is bloodguilt.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-the-table-that-shames-the-poor-deuteronomy-15-isaiah-58-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---- THREAD 3 members ----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 10:1 — *offered strange fire before Yahuah (LORD), which he commanded them not* — the holy thing approached unworthily; the ancient ground of Paul''s warning.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 10:3 — *I will be sanctified in them that come nigh me* — to discern the body is to come nigh in awe, not carelessness.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 26:2 — *Examine me, O Yahuah (LORD), and prove me; try my reins and my heart* — David''s prayer behind Paul''s "let a man examine himself."'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=26 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Lamentations 3:40 — *Let us search and try our ways, and turn again to Yahuah (LORD)* — self-examination unto repentance, the turning Paul presses.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD)* — the chastening Paul names is a son''s correction, never a son cast off.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* — the weak and sickly are loved sons, not the condemned.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Sirach 2:5 (extra-canonical witness) — *gold is tried in the fire, and acceptable men in the furnace of adversity* — Ben Sira reads the Father''s chastening as the refining of the accepted, not wrath against the rejected.'
  FROM cross_reference_threads t, cross_references x, _1co11_lookup sv, _1co11_lookup tv
 WHERE t.slug='1-corinthians-11-examine-yourself-and-the-fathers-chastening-leviticus-10-proverbs-3'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1corinthians_13.sql -----
-- minion_1corinthians_13.sql — NT depth pass, 1 Corinthians 13 (the love chapter)
-- 3 NEW threads (THIN-ADD): 13:1-3, 13:8-10, 13:13. Avoids existing 13:4 and 13:12 anchors.

CREATE TEMP VIEW _1co13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. cross_references rows
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 13:1-3 gifts without love profit nothing; mercy over offering
  ('canon','1-corinthians',13,1,'canon','hosea',6,6, 'free', E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). The showiest gift — tongues of men and of angels — is sounding brass without love, because Yahuah was always after the heart, not the spectacle. Mercy is the marrow of the Torah.'),
  ('canon','1-corinthians',13,2,'canon','micah',6,8, 'free', E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). All mysteries and all knowledge and mountain-moving faith come to nothing if a man has not the very thing Yahuah requires — to love mercy.'),
  ('canon','1-corinthians',13,3,'canon','1-samuel',15,22, 'free', E'*And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Bestow all your goods, give your body to be burned — without love it profiteth nothing, for obedience of the heart was ever weightier than the costliest offering.'),
  ('canon','1-corinthians',13,3,'canon','proverbs',21,3, 'free', E'*To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3). The whole library agrees: the offering without the loving, just heart behind it profits nothing.'),

  -- THREAD 2 — 13:8-10 charity never faileth; the partial gives way to the whole
  ('canon','1-corinthians',13,8,'canon','isaiah',40,8, 'free', E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). Prophecies fail, tongues cease, knowledge vanishes away — but what is of Yahuah endures; love, His own word and nature, never faileth.'),
  ('canon','1-corinthians',13,8,'canon','psalms',89,1, 'free', E'*I will sing of the mercies of Yahuah (LORD) for ever: with my mouth will I make known thy faithfulness to all generations* (Psalm 89:1). The mercy (hesed) that charity is made of is sung for ever — it does not run out when the gifts do.'),
  ('canon','1-corinthians',13,9,'canon','psalms',89,2, 'free', E'*For I have said, Mercy shall be built up for ever: thy faithfulness shalt thou establish in the very heavens* (Psalm 89:2). We know in part now, but His mercy is built up for ever — the everlasting hesed into which the partial will be swallowed when that which is perfect is come.'),
  ('canon','1-corinthians',13,9,'canon','joel',2,28, 'free', E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). Here is the partial outpouring Paul names — prophecy, the gift in part — a foretaste, not the fullness; the gifts serve the age, love crowns the age to come.'),

  -- THREAD 3 — 13:13 the enduring triad; love crowns the Torah
  ('canon','1-corinthians',13,13,'canon','micah',6,8, 'free', E'*...what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Faith, hope, love — and the greatest is love, because to love mercy and walk humbly was always the whole of what Yahuah required.'),
  ('canon','1-corinthians',13,13,'canon','habakkuk',2,4, 'free', E'*Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith* (Habakkuk 2:4). The first of the abiding three — faith — stands rooted here; the just have ever lived by it.'),
  ('canon','1-corinthians',13,13,'canon','lamentations',3,21, 'free', E'*This I recall to my mind, therefore have I hope* (Lamentations 3:21). The second of the three — hope — drawn up out of the ash heap by remembering the mercies of Yahuah.'),
  ('canon','1-corinthians',13,13,'canon','lamentations',3,26, 'free', E'*It is good that a man should both hope and quietly wait for the salvation of Yahuah (LORD)* (Lamentations 3:26). Hope that abides is hope that waits — the same patient hope Paul sets among the enduring three.'),
  ('canon','1-corinthians',13,13,'canon','deuteronomy',6,5, 'free', E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). The greatest of the three is love because love is the very aim of the Torah — love toward Yahuah, the first and great commandment, never abolished but crowned.'),
  ('canon','1-corinthians',13,13,'canon','leviticus',19,18, 'free', E'*...but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). And love toward the neighbour, the second like unto it; on these two — both already in the Torah — hang all the law and the prophets, and so love is the law''s whole aim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _1co13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _1co13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-13-the-showiest-gift-without-love-is-nothing-hosea-6',
       E'Though I Speak with the Tongues of Angels — Mercy Over Mere Offering',
       E'*Though I speak with the tongues of men and of angels, and have not charity, I am become as sounding brass, or a tinkling cymbal... And though I bestow all my goods to feed the poor, and though I give my body to be burned, and have not charity, it profiteth me nothing* (1 Corinthians 13:1-3). Paul says nothing new here — he says the oldest thing in the library. Yahuah was never impressed by the spectacle; He was always after the heart. *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). *Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3). Come and see: the gift without the loving heart behind it is sounding brass — not because the gift is bad, but because love is the marrow of the Torah, and an offering without it profiteth nothing.',
       sv.verse_id, ev.verse_id, 'free', 17360
  FROM _1co13_lookup sv, _1co13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=13 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-13-charity-never-faileth-the-partial-gives-way-isaiah-40',
       E'Charity Never Faileth — The Everlasting Hesed and the Partial Gifts',
       E'*Charity never faileth: but whether there be prophecies, they shall fail; whether there be tongues, they shall cease; whether there be knowledge, it shall vanish away. For we know in part, and we prophesy in part. But when that which is perfect is come, then that which is in part shall be done away* (1 Corinthians 13:8-10). The gifts are scaffolding for the age; love is the building that stands when the scaffolding comes down. *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). What is of Yahuah endures, and love is His own nature. *I will sing of the mercies of Yahuah (LORD) for ever: with my mouth will I make known thy faithfulness to all generations* (Psalm 89:1); *For I have said, Mercy shall be built up for ever: thy faithfulness shalt thou establish in the very heavens* (Psalm 89:2) — the hesed that charity is made of is built up for ever and never runs out. And the gifts that *do* run out? They were only ever a foretaste: *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28) — prophecy in part now, the whole still ahead. Come and see: love endures into the age to come, when the partial is swallowed up in the perfect.',
       sv.verse_id, ev.verse_id, 'free', 17363
  FROM _1co13_lookup sv, _1co13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-13-faith-hope-charity-love-crowns-the-torah-deuteronomy-6',
       E'Faith, Hope, Charity — The Greatest Is Love, the Torah''s Whole Aim',
       E'*And now abideth faith, hope, charity, these three; but the greatest of these is charity* (1 Corinthians 13:13). The enduring triad — and each of the three is already woven through the library. Faith: *the just shall live by his faith* (Habakkuk 2:4). Hope: *This I recall to my mind, therefore have I hope* (Lamentations 3:21); *It is good that a man should both hope and quietly wait for the salvation of Yahuah (LORD)* (Lamentations 3:26). And love, the greatest, because love is the very aim of the Torah: *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Love toward Yahuah — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5) — and love toward the neighbour — *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). On these two the law and the prophets hang. Come and see: charity is greatest not because it replaces the commandments but because it crowns them; love is what the whole Torah was reaching for all along.',
       sv.verse_id, ev.verse_id, 'free', 17366
  FROM _1co13_lookup sv, _1co13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. thread_members
-- ============================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 6:6 — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings.* The heart of the matter: Yahuah was always after mercy, not the spectacle of the gift.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-the-showiest-gift-without-love-is-nothing-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 6:8 — *...what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* Mysteries and faith are nothing without the very thing Yahuah requires.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-the-showiest-gift-without-love-is-nothing-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 15:22 — *Behold, to obey is better than sacrifice, and to hearken than the fat of rams.* Give your body to be burned without love and it profits nothing; obedience of the heart outweighs the costliest offering.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-the-showiest-gift-without-love-is-nothing-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 21:3 — *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice.* The whole library agrees: the offering without the loving, just heart profits nothing.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-the-showiest-gift-without-love-is-nothing-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:8 — *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever.* Prophecies, tongues, knowledge fade; what is of Yahuah endures, and love never faileth.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-never-faileth-the-partial-gives-way-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 89:1 — *I will sing of the mercies of Yahuah (LORD) for ever: with my mouth will I make known thy faithfulness to all generations.* The hesed that charity is made of is sung for ever — it does not run out when the gifts do.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-never-faileth-the-partial-gives-way-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 89:2 — *For I have said, Mercy shall be built up for ever: thy faithfulness shalt thou establish in the very heavens.* We know in part now, but His mercy is built up for ever — the everlasting hesed into which the partial will be swallowed.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-never-faileth-the-partial-gives-way-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joel 2:28 — *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions.* The partial outpouring Paul names — prophecy in part, a foretaste, not the fullness; the gifts serve the age, love crowns the age to come.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-charity-never-faileth-the-partial-gives-way-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Micah 6:8 — *...what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* The greatest is love because to love mercy and walk humbly was always the whole of what Yahuah required.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-faith-hope-charity-love-crowns-the-torah-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Habakkuk 2:4 — *...but the just shall live by his faith.* The first of the abiding three — faith — rooted here; the just have ever lived by it.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-faith-hope-charity-love-crowns-the-torah-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 3:21 — *This I recall to my mind, therefore have I hope.* The second of the three — hope — drawn up out of the ash heap by remembering the mercies of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-faith-hope-charity-love-crowns-the-torah-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Lamentations 3:26 — *It is good that a man should both hope and quietly wait for the salvation of Yahuah (LORD).* Hope that abides is hope that waits — the patient hope Paul sets among the enduring three.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-faith-hope-charity-love-crowns-the-torah-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* Love is greatest because it is the very aim of the Torah — the first and great commandment, never abolished but crowned.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-faith-hope-charity-love-crowns-the-torah-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Leviticus 19:18 — *...but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Love toward the neighbour, the second like unto it; on these two — both already in the Torah — hang all the law and the prophets, and so love is the law''s whole aim.'
  FROM cross_reference_threads t, cross_references x, _1co13_lookup sv, _1co13_lookup tv
 WHERE t.slug='1-corinthians-13-faith-hope-charity-love-crowns-the-torah-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1corinthians_14.sql -----
-- minion_1corinthians_14.sql — NT depth pass, 1 Corinthians 14 (THIN-ADD, 3 NEW threads)
-- THIN-ADD: do NOT touch existing anchors 14:21 and 14:33-40.
-- New threads: 14:1-5 (prophecy builds up), 14:15 (worship with understanding),
--              14:24-25 (convicting word draws the outsider).

-- 3a. Temp view ----------------------------------------------------------------
CREATE TEMP VIEW _1co14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -----------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 14:1-5 prophecy for the building-up of the gathered people
  ('canon','1-corinthians',14,1,'canon','numbers',11,29, 'free', E'*And Moses said unto him, Enviest thou for my sake? would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29). Moses'' own longing is the seed Paul reaps: not a prized few but ALL Yahuah''s people carrying his Spirit and prophesying. "Desire spiritual gifts, but rather that ye may prophesy" is Moses'' prayer answered in the assembly.'),
  ('canon','1-corinthians',14,1,'canon','joel',2,28, 'free', E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). What Moses longed for, Yahuah promised — the Spirit poured out on all flesh, the whole gathered people made to prophesy. Paul is pressing the assembly into the very gift the prophets foresaw.'),
  ('canon','1-corinthians',14,3,'canon','proverbs',10,21, 'free', E'*The lips of the righteous feed many: but fools die for want of wisdom* (Proverbs 10:21). "He that prophesieth speaketh unto men to edification, and exhortation, and comfort" — the righteous lips that FEED the many. Prophecy in the assembly is not display; it is bread for the gathered.'),
  ('canon','1-corinthians',14,5,'canon','acts',2,17, 'free', E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams* (Acts 2:17). At Pentecost Kepha quotes Joel and declares the pouring-out begun — scattered Yashar''el (Israel) regathered and the nations grafted in, all made to prophesy. "I would that ye all spake with tongues, but rather that ye prophesied" stands inside that same outpouring.'),
  ('canon','1-corinthians',14,5,'canon','romans',11,1, 'free', E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The Spirit poured on the gathered does not replace Yashar''el — Elohim has not cast away his people. The two-house assembly that prophesies is Judah and Ephraim regathered with the grafted stranger, never a new people instead of the old.'),

  -- THREAD 2 — 14:15 worship that engages the understanding
  ('canon','1-corinthians',14,15,'canon','psalms',47,7, 'free', E'*For Elohim (God) is the King of all the earth: sing ye praises with understanding* (Psalms 47:7). "I will sing with the spirit, and I will sing with the understanding also" — Paul is not inventing a new rule but obeying the Psalm: praise that the mind grasps, not sound alone.'),
  ('canon','1-corinthians',14,15,'canon','psalms',119,34, 'free', E'*Give me understanding, and I shall keep thy law; yea, I shall observe it with my whole heart* (Psalms 119:34). Understanding is never an end in itself; it is given so the word may be KEPT. Praying and singing "with the understanding" is of one cloth with the Psalmist''s cry for understanding unto obedience.'),
  ('canon','1-corinthians',14,15,'canon','nehemiah',8,8, 'free', E'*So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading* (Nehemiah 8:8). Ezra''s pattern is Paul''s aim: the Torah read so plainly that the people GRASP it. Worship "with the understanding" is the assembly hearing the word and taking in its sense.'),
  ('canon','1-corinthians',14,15,'canon','colossians',3,16, 'free', E'*Let the word of Messiah (Christ) dwell in you richly in all wisdom; teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16). The same apostolic charge: song joined to wisdom and teaching, the word dwelling richly — praise and understanding bound together, never spirit without sense.'),

  -- THREAD 3 — 14:24-25 the convicting word draws the outsider to confess Elohim is among his people
  ('canon','1-corinthians',14,24,'canon','isaiah',45,14, 'free', E'*Thus saith Yahuah (LORD)... they shall fall down unto thee, they shall make supplication unto thee, saying, Surely Elohim (God) is in thee; and there is none else, there is no Elohim (God)* (Isaiah 45:14). The unbeliever "falling down on his face" and confessing "that Elohim is in you of a truth" is Isaiah''s nations bowing toward Yashar''el (Israel) — *surely Elohim is in thee.* The convicting word fulfills the prophet.'),
  ('canon','1-corinthians',14,25,'canon','zechariah',8,23, 'free', E'*In those days it shall come to pass, that ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23). This is the two-house gathering in miniature: the outsider takes hold of Yashar''el because *Elohim is with you.* "Elohim is in you of a truth" is Zechariah''s ten men, the nations drawn home.'),
  ('canon','1-corinthians',14,25,'canon','1-kings',8,43, 'free', E'*Hear thou in heaven thy dwelling place, and do according to all that the stranger calleth to thee for: that all people of the earth may know thy name, to fear thee, as do thy people Yashar''el (Israel)* (1 Kings 8:43). Solomon prayed that the STRANGER, hearing of Elohim among his people, would come to fear his name. The convicted outsider worshipping is that prayer answered in the assembly.'),
  ('canon','1-corinthians',14,25,'canon','psalms',139,1, 'free', E'*O Yahuah (LORD), thou hast searched me, and known me* (Psalms 139:1). "The secrets of his heart are made manifest" — it is Yahuah who searches and knows. The prophetic word lays the heart bare because the One who pours out his Spirit is the One who has already searched it.'),
  ('canon','1-corinthians',14,25,'apocrypha','ecclesiasticus',42,18, 'extras', E'*He seeks out the deep, and the heart, and considereth their crafty devices: for Yahuah (God) knoweth all that may be known, and he beholds the signs of the world* (Sirach 42:18). Ben Sira sings the same searching Elohim — he seeks out the heart, no thought escapes him. When prophecy makes "the secrets of his heart manifest," it is this all-knowing One at work in the gathered.'),
  ('canon','1-corinthians',14,25,'canon','hebrews',4,12, 'free', E'*For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). The word that convicts the unbeliever is the living word that discerns thought and intent. Prophecy in the assembly is that two-edged word doing its work — laying the heart open so the outsider falls down and confesses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _1co14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _1co14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads -------------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-14-rather-that-ye-may-prophesy-the-spirit-poured-on-all-numbers-11-joel-2',
       E'Rather that ye may prophesy — the Spirit poured out on all the gathered',
       E'**Come and see** — "Follow after charity, and desire spiritual gifts, but rather that ye may prophesy... he that prophesieth speaketh unto men to edification, and exhortation, and comfort" (1 Corinthians 14:1-5). Paul prizes prophecy because it FEEDS the assembly, and that hunger is old.\n\nIt begins with Moses, who when his Spirit-helpers were envied answered: *And Moses said unto him, Enviest thou for my sake? would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* (Numbers 11:29). Yahuah took up that longing as a promise: *And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions* (Joel 2:28). Such prophetic lips were always meant to nourish — *The lips of the righteous feed many: but fools die for want of wisdom* (Proverbs 10:21).\n\nAt Pentecost Kepha declared the outpouring begun: *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy* (Acts 2:17) — scattered Yashar''el (Israel) regathered and the nations grafted in, all made to prophesy. And lest any think this a new people instead of the old: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1). The prophesying assembly is Judah and Ephraim brought home with the stranger grafted in — Moses'' prayer at last answered.',
       sv.verse_id, ev.verse_id, 'free', 17390
  FROM _1co14_lookup sv, _1co14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-14-pray-and-sing-with-the-understanding-also-psalm-47-nehemiah-8',
       E'I will sing with the understanding also — worship the mind can grasp',
       E'**Come and see** — "I will pray with the spirit, and I will pray with the understanding also: I will sing with the spirit, and I will sing with the understanding also" (1 Corinthians 14:15). Paul will not pit the spirit against the mind; true worship engages both, and the Tanakh said so first.\n\nThe Psalm commands it outright: *For Elohim (God) is the King of all the earth: sing ye praises with understanding* (Psalms 47:7). And understanding is never an end in itself — it is given so the word may be KEPT: *Give me understanding, and I shall keep thy law; yea, I shall observe it with my whole heart* (Psalms 119:34). When Ezra gathered the people, this was the very pattern: *So they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading* (Nehemiah 8:8) — the Torah read so plainly the people grasped it.\n\nThe same apostolic charge binds song to wisdom: *Let the word of Messiah (Christ) dwell in you richly in all wisdom; teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16). Spirit and sense together — praise that the gathered take in and keep, never sound without understanding.',
       sv.verse_id, ev.verse_id, 'free', 17393
  FROM _1co14_lookup sv, _1co14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=14 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-14-elohim-is-in-you-of-a-truth-the-nations-drawn-in-isaiah-45-zechariah-8',
       E'Elohim is in you of a truth — the convicting word draws the outsider in',
       E'**Come and see** — "But if all prophesy, and there come in one that believeth not... the secrets of his heart are made manifest; and so falling down on his face he will worship Elohim, and report that Elohim is in you of a truth" (1 Corinthians 14:24-25). The prophetic word lays a stranger''s heart bare, and he confesses that the Father is among his people — and that confession is the prophets'' own hope.\n\nIsaiah saw the nations bow toward Yashar''el (Israel) with these very words: *they shall fall down unto thee, they shall make supplication unto thee, saying, Surely Elohim (God) is in thee; and there is none else, there is no Elohim (God)* (Isaiah 45:14). Zechariah painted the two-house gathering: *ten men shall take hold out of all languages of the nations, even shall take hold of the skirt of him that is a Yahudi (Jew), saying, We will go with you: for we have heard that Elohim (God) is with you* (Zechariah 8:23). Solomon had prayed for exactly this stranger: *do according to all that the stranger calleth to thee for: that all people of the earth may know thy name* (1 Kings 8:43).\n\nThe heart is laid open because Yahuah already knows it: *O Yahuah (LORD), thou hast searched me, and known me* (Psalms 139:1). Ben Sira sings the same searching Elohim: *He seeks out the deep, and the heart... for Yahuah (God) knoweth all that may be known* (Sirach 42:18). And the word that does the convicting is living: *For the word of Elohim (God) is quick, and powerful... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). The outsider falling down is the nations drawn home — not Israel cast off, but the stranger grafted into the people where Elohim dwells.',
       sv.verse_id, ev.verse_id, 'extras', 17396
  FROM _1co14_lookup sv, _1co14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=14 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members ------------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 11:29 — *would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* Moses'' own longing, the seed Paul reaps.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-rather-that-ye-may-prophesy-the-spirit-poured-on-all-numbers-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:28 — *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy.* Moses'' longing turned to promise.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-rather-that-ye-may-prophesy-the-spirit-poured-on-all-numbers-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 10:21 — *The lips of the righteous feed many.* Prophecy as bread for the gathered, not display.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-rather-that-ye-may-prophesy-the-spirit-poured-on-all-numbers-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 2:17 — *I will pour out of my Spirit upon all flesh.* Pentecost: the outpouring begun, scattered Yashar''el (Israel) and the nations made to prophesy.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-rather-that-ye-may-prophesy-the-spirit-poured-on-all-numbers-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid.* The Spirit-filled assembly is Israel regathered with the stranger grafted in, never a replacement.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-rather-that-ye-may-prophesy-the-spirit-poured-on-all-numbers-11-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 47:7 — *sing ye praises with understanding.* Paul obeys the Psalm, not a new rule.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-pray-and-sing-with-the-understanding-also-psalm-47-nehemiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=47 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 119:34 — *Give me understanding, and I shall keep thy law.* Understanding is given unto obedience.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-pray-and-sing-with-the-understanding-also-psalm-47-nehemiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 8:8 — *they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand.* Ezra''s pattern: the Torah read so the people grasp it.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-pray-and-sing-with-the-understanding-also-psalm-47-nehemiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 3:16 — *Let the word of Messiah (Christ) dwell in you richly in all wisdom... singing with grace in your hearts.* Song bound to wisdom and teaching.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-pray-and-sing-with-the-understanding-also-psalm-47-nehemiah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 45:14 — *they shall fall down unto thee... saying, Surely Elohim (God) is in thee; and there is none else.* The nations bowing toward Yashar''el (Israel).'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-elohim-is-in-you-of-a-truth-the-nations-drawn-in-isaiah-45-zechariah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 8:23 — *ten men shall... take hold of the skirt of him that is a Yahudi (Jew), saying... we have heard that Elohim (God) is with you.* The two-house gathering of the nations.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-elohim-is-in-you-of-a-truth-the-nations-drawn-in-isaiah-45-zechariah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 8:43 — *do according to all that the stranger calleth to thee for: that all people of the earth may know thy name.* Solomon''s prayer for the convicted outsider.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-elohim-is-in-you-of-a-truth-the-nations-drawn-in-isaiah-45-zechariah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalms 139:1 — *O Yahuah (LORD), thou hast searched me, and known me.* The heart laid bare by the One who already knows it.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-elohim-is-in-you-of-a-truth-the-nations-drawn-in-isaiah-45-zechariah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 42:18 — *He seeks out the deep, and the heart... for Yahuah (God) knoweth all that may be known.* The all-searching Elohim, extra-canonical witness.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-elohim-is-in-you-of-a-truth-the-nations-drawn-in-isaiah-45-zechariah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=42 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Hebrews 4:12 — *the word of Elohim (God) is quick, and powerful... a discerner of the thoughts and intents of the heart.* The living word that convicts the outsider.'
  FROM cross_reference_threads t, cross_references x, _1co14_lookup sv, _1co14_lookup tv
 WHERE t.slug='1-corinthians-14-elohim-is-in-you-of-a-truth-the-nations-drawn-in-isaiah-45-zechariah-8'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — 1 Corinthians (depth) cross-references complete.'
