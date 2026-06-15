-- ----- fragment: minion_psalms_134.sql (Psalm 134) -----
-- Chapter: Psalm 134 — the closing Song of Ascents, the night-watch benediction.
-- Tag: ps134   Session prefix: s302   Sort band base: 25325 (25325, 25328, 25331)
-- Member table: cross_reference_thread_members. Source rows always ('canon','psalms',134,v).
-- Thread slugs SINGULAR prefix psalm-134-...  (checked EXISTING_SLUGS.txt — none present).
-- All members are canon Tanakh / NT → every cross_reference row tier 'free', every thread tier 'free'.
--
-- Psalm 134 coverage:
--   v.1  (Behold, bless ye Yahuah, all ye servants... which by night stand in the house of Yahuah)
--        NT:     Revelation 7:15 (serve him day and night in his temple); Luke 2:37 (Anna served... night and day) — used
--        Extras: none warranted (the night-watch temple service is witnessed full within canon)
--        Tanakh: 1 Chronicles 9:33 (the singers... employed in that work day and night); Leviticus 8:35 (abide... day and night... keep the charge) — used
--   v.2  (Lift up your hands in the sanctuary, and bless Yahuah)
--        NT:     1 Timothy 2:8 (lifting up holy hands) — used
--        Extras: none warranted (lifted-hands worship fully witnessed in the Psalter)
--        Tanakh: Psalm 28:2 (lift up my hands toward thy holy oracle); Psalm 141:2 (lifting up of my hands as the evening sacrifice) — used
--   v.3  (Yahuah that made heaven and earth bless thee out of Zion)
--        NT:     John 1:3 (All things were made by him) — used, the Formed Word as the Maker's hand
--        Extras: none warranted (Maker-of-heaven-and-earth + priestly blessing fully canon)
--        Tanakh: Psalm 121:2 / Psalm 124:8 (made heaven and earth); Psalm 128:5 (bless thee out of Zion); Numbers 6:24-26 (the priestly blessing) — used
--
-- Threads (3):
--   1. psalm-134-servants-that-by-night-stand-in-the-house        [Tanakh + NT]  v1
--   2. psalm-134-lift-up-your-hands-in-the-sanctuary-and-bless     [Tanakh + NT]  v2
--   3. psalm-134-the-maker-of-heaven-and-earth-bless-thee-out-of-zion  [Tanakh + NT]  v3
-- Framework-load-bearing: v3 framed as the Maker working BY the Formed Word (John 1:3) — the
-- formless Father who made heaven and earth blesses from Zion through the priestly benediction
-- (Num 6:24-26) answered back up to him; lateral seam to the twin Ascents Ps 128:5.

CREATE TEMP VIEW _s302_ps134_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- v.1 — the night watches in the house of Yahuah
    ('canon','psalms',134,1,'canon','1-chronicles',9,33,'free',
     E'*And these are the singers, chief of the fathers of the Levites, who remaining in the chambers were free: for they were employed in that work day and night* (1 Chronicles 9:33). The Levitical singers were posted in the temple chambers around the clock — the very office the psalm hails when it says *all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1). The night watch is not idle waiting but appointed ministry.'),
    ('canon','psalms',134,1,'canon','leviticus',8,35,'free',
     E'*Therefore shall ye abide at the door of the tabernacle of the congregation day and night seven days, and keep the charge of Yahuah (LORD), that ye die not: for so I am commanded* (Leviticus 8:35). From the priesthood''s consecration the charge was kept *day and night* at the door of the sanctuary — the standing duty Psalm 134 calls *servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1).'),
    ('canon','psalms',134,1,'canon','revelation',7,15,'free',
     E'*Therefore are they before the throne of Elohim (God), and serve him day and night in his temple: and he that sitteth on the throne shall dwell among them* (Revelation 7:15). The temple night-watch of Psalm 134 — *servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1) — opens forward to the gathered multitude who *serve him day and night in his temple*: the same ceaseless ministry, consummated.'),
    ('canon','psalms',134,1,'canon','luke',2,37,'free',
     E'*And she was a widow of about fourscore and four years, which departed not from the temple, but served Elohim (God) with fastings and prayers night and day* (Luke 2:37). Anna kept the very watch of Psalm 134 — she stood by night in the house of Yahuah (LORD), one of the *servants of Yahuah (LORD), which by night stand in the house* (Psalm 134:1), waiting on the Formed Son she was about to behold.'),

    -- v.2 — lift up your hands in the sanctuary
    ('canon','psalms',134,2,'canon','1-timothy',2,8,'free',
     E'*I will therefore that men pray every where, lifting up holy hands, without wrath and doubting* (1 Timothy 2:8). The sanctuary posture of *Lift up your hands in the sanctuary, and bless Yahuah (LORD)* (Psalm 134:2) is carried forward unbroken — *lifting up holy hands* — the same act of blessing worship, now in every place where Yahuah (LORD) is named.'),
    ('canon','psalms',134,2,'canon','psalms',28,2,'free',
     E'*Hear the voice of my supplications, when I cry unto thee, when I lift up my hands toward thy holy oracle* (Psalm 28:2). The hands lifted *toward thy holy oracle* are the same hands the night-watch raises in *Lift up your hands in the sanctuary, and bless Yahuah (LORD)* (Psalm 134:2) — worship directed to the holy place where Yahuah (LORD) sets his Name.'),
    ('canon','psalms',134,2,'canon','psalms',141,2,'free',
     E'*Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2). David weds the lifted hands to the appointed offering — the evening sacrifice — so the gesture of *Lift up your hands in the sanctuary, and bless Yahuah (LORD)* (Psalm 134:2) is itself an offering, prayer rising at the hour of the appointed service.'),

    -- v.3 — Yahuah that made heaven and earth bless thee out of Zion
    ('canon','psalms',134,3,'canon','john',1,3,'free',
     E'*All things were made by him; and without him was not any thing made that was made* (John 1:3). When Psalm 134 names *Yahuah (LORD) that made heaven and earth* (Psalm 134:3), the making is done by the Formed Word — the expressed Word drawn from the formless Father, the hand by whom all things were made. The Most High who blesses out of Zion is the same who created by his Son.'),
    ('canon','psalms',134,3,'canon','psalms',121,2,'free',
     E'*My help cometh from Yahuah (LORD), which made heaven and earth* (Psalm 121:2). The Songs of Ascents press this title again and again — the Maker is the helper — and Psalm 134 closes the climb by turning it into blessing: *Yahuah (LORD) that made heaven and earth bless thee out of Zion* (Psalm 134:3). The same Maker who is our help now sends his blessing down.'),
    ('canon','psalms',134,3,'canon','psalms',124,8,'free',
     E'*Our help is in the name of Yahuah (LORD), who made heaven and earth* (Psalm 124:8). The pilgrim refrain names the Maker as the source of help; Psalm 134 answers it with benediction — *Yahuah (LORD) that made heaven and earth bless thee out of Zion* (Psalm 134:3) — Creator-power bent toward the worshipper''s good.'),
    ('canon','psalms',134,3,'canon','psalms',128,5,'free',
     E'*Yahuah (LORD) shall bless thee out of Zion: and thou shalt see the good of Jerusalem all the days of thy life* (Psalm 128:5). The twin Ascent speaks the very blessing Psalm 134 now pronounces — *bless thee out of Zion* (Psalm 134:3) — the night-watch lifting the benediction over all who fear Yahuah (LORD), out from the dwelling place of his Name.'),
    ('canon','psalms',134,3,'canon','numbers',6,24,'free',
     E'*Yahuah (LORD) bless thee, and keep thee* (Numbers 6:24). The priestly blessing Aaron was commanded to lay on the children of Yashar''el (Israel) is the blessing the servants bless Yahuah (LORD) with, and which Yahuah (LORD) returns *out of Zion* (Psalm 134:3): the worship lifted up in verse 2 answered by the Maker''s benediction sent down in verse 3.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps134_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps134_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-134-servants-that-by-night-stand-in-the-house',
       E'Servants that by night stand in the house of Yahuah',
       E'Psalm 134 opens with the night watch: *Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1). This is no idle vigil but appointed ministry. The Levitical singers kept it from the first — *And these are the singers, chief of the fathers of the Levites, who remaining in the chambers were free: for they were employed in that work day and night* (1 Chronicles 9:33) — and the charge itself ran round the clock from the priesthood''s consecration: *Therefore shall ye abide at the door of the tabernacle of the congregation day and night seven days, and keep the charge of Yahuah (LORD), that ye die not* (Leviticus 8:35). The watch opens forward to its consummation — the gathered multitude who *serve him day and night in his temple* (Revelation 7:15) — and one faithful keeper of it, Anna, *served Elohim (God) with fastings and prayers night and day* (Luke 2:37) until she beheld the Formed Son. The night belongs to Yahuah (LORD); his servants stand and bless.',
       sv.verse_id, ev.verse_id, 'free', 25325
  FROM _s302_ps134_lookup sv, _s302_ps134_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=134 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=134 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-134-lift-up-your-hands-in-the-sanctuary-and-bless',
       E'Lift up your hands in the sanctuary, and bless Yahuah',
       E'The watch does not merely stand; it worships: *Lift up your hands in the sanctuary, and bless Yahuah (LORD)* (Psalm 134:2). The lifted hand is the body''s posture of blessing, aimed at the holy place — *Hear the voice of my supplications, when I cry unto thee, when I lift up my hands toward thy holy oracle* (Psalm 28:2) — and joined to the appointed offering, *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice* (Psalm 141:2), so the gesture itself rises as sacrifice at the hour of service. The posture is never abolished; it is carried forward into every place his Name is called — *I will therefore that men pray every where, lifting up holy hands, without wrath and doubting* (1 Timothy 2:8). Holy hands, lifted in the sanctuary, blessing Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 25328
  FROM _s302_ps134_lookup sv, _s302_ps134_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=134 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=134 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-134-the-maker-of-heaven-and-earth-bless-thee-out-of-zion',
       E'The Maker of heaven and earth bless thee out of Zion',
       E'The last Song of Ascents ends where the climb began — with the Maker — and turns his creating power into blessing: *Yahuah (LORD) that made heaven and earth bless thee out of Zion* (Psalm 134:3). The making is done by the Formed Word, the expressed Word drawn from the formless Father: *All things were made by him; and without him was not any thing made that was made* (John 1:3) — the Most High who blesses out of Zion is the same who created by his Son. The pilgrim refrain has named this Maker all the way up the road — *My help cometh from Yahuah (LORD), which made heaven and earth* (Psalm 121:2); *Our help is in the name of Yahuah (LORD), who made heaven and earth* (Psalm 124:8) — and the twin Ascent already spoke this very benediction: *Yahuah (LORD) shall bless thee out of Zion: and thou shalt see the good of Jerusalem all the days of thy life* (Psalm 128:5). So the worship lifted up in verse 2 is answered by the priestly blessing sent down: *Yahuah (LORD) bless thee, and keep thee* (Numbers 6:24) — Creator-power bent, out of the dwelling place of his Name, toward the good of those who serve him.',
       sv.verse_id, ev.verse_id, 'free', 25331
  FROM _s302_ps134_lookup sv, _s302_ps134_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=134 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=134 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: servants that by night stand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (134,1,'canon','1-chronicles',9,33,1,E'1 Chronicles 9:33 — *the singers... were employed in that work day and night*: the Levitical night watch the psalm hails.'),
    (134,1,'canon','leviticus',8,35,2,E'Leviticus 8:35 — *abide at the door of the tabernacle... day and night... and keep the charge of Yahuah (LORD)*: the standing duty from the priesthood''s consecration.'),
    (134,1,'canon','revelation',7,15,3,E'Revelation 7:15 — *serve him day and night in his temple*: the night-watch consummated in the gathered multitude.'),
    (134,1,'canon','luke',2,37,4,E'Luke 2:37 — Anna *served Elohim (God) with fastings and prayers night and day*: one faithful keeper of the watch, awaiting the Formed Son.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-134-servants-that-by-night-stand-in-the-house'
  JOIN _s302_ps134_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps134_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: lift up your hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (134,2,'canon','psalms',28,2,1,E'Psalm 28:2 — *when I lift up my hands toward thy holy oracle*: hands raised toward the holy place.'),
    (134,2,'canon','psalms',141,2,2,E'Psalm 141:2 — *the lifting up of my hands as the evening sacrifice*: the gesture itself an offering at the appointed hour.'),
    (134,2,'canon','1-timothy',2,8,3,E'1 Timothy 2:8 — *lifting up holy hands*: the sanctuary posture carried forward into every place his Name is named.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-134-lift-up-your-hands-in-the-sanctuary-and-bless'
  JOIN _s302_ps134_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps134_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the Maker bless thee out of Zion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.member_note
  FROM (VALUES
    (134,3,'canon','john',1,3,1,E'John 1:3 — *All things were made by him*: the making done by the Formed Word, the Father''s hand in creation.'),
    (134,3,'canon','psalms',121,2,2,E'Psalm 121:2 — *My help cometh from Yahuah (LORD), which made heaven and earth*: the Ascent refrain, Maker as helper.'),
    (134,3,'canon','psalms',124,8,3,E'Psalm 124:8 — *Our help is in the name of Yahuah (LORD), who made heaven and earth*: the pilgrim refrain answered now with blessing.'),
    (134,3,'canon','psalms',128,5,4,E'Psalm 128:5 — *Yahuah (LORD) shall bless thee out of Zion*: the twin Ascent speaking the very benediction.'),
    (134,3,'canon','numbers',6,24,5,E'Numbers 6:24 — *Yahuah (LORD) bless thee, and keep thee*: the priestly blessing returned out of Zion, answering the worship lifted up.')
  ) AS m(src_ch,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,member_note)
  JOIN cross_reference_threads t ON t.slug='psalm-134-the-maker-of-heaven-and-earth-bless-thee-out-of-zion'
  JOIN _s302_ps134_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=m.src_ch AND sv.verse_number=m.src_v
  JOIN _s302_ps134_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

DROP VIEW _s302_ps134_lookup;
